package ju.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import ju.dto.ElibDTO;
import ju.elib.model.ElibDAO;
import ju.modul.BookCateModul;
import ju.modul.ElibPaging;

@Controller
public class AdminElibController {
	
	@Autowired
	private ElibDAO elibDAO;
	
	/**업로드 최초 로딩*/
	@RequestMapping(value="elibUpload.ju")
	public ModelAndView adminElib(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("elibManage/elibUpload");
		return mav;
	}

	/**그룹에 따른 대분류 가져오기 업로드용*/
	@RequestMapping(value="elibGrupLg.ju")
	public ModelAndView adminElibGrupLg(@RequestParam(value="groupNum", defaultValue="7")int groupNum){
		BookCateModul bcm=new BookCateModul();
		String cateLg=null;
		if(groupNum==7){
			cateLg=bcm.BookLgSelect(0, 7, false);
		}
		else{
			cateLg=bcm.BookLgSelect(groupNum, groupNum, false);
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("cateLg", cateLg);
		mav.setViewName("juJson");
		return mav;
	}
	
	
	/** 내용 업로드 */
	@RequestMapping(value="adminUpload.ju", method=RequestMethod.POST)
	public ModelAndView adminUpload(
			@RequestParam(value="readyIdx")String readyIdx
			, @RequestParam(value="cateLg", defaultValue="0")int cateLg
			, HttpServletRequest request){
		
		MultipartHttpServletRequest mphsr=(MultipartHttpServletRequest)request;
		List<MultipartFile> files = mphsr.getFiles("files");
		String path=request.getSession().getServletContext().getRealPath("/")+"resources\\elib\\";
		
		String elGroup=null;
		if(cateLg==8){
			elGroup="EM";
			path+="eMagazine\\";
		}
		else if(cateLg==9){
			elGroup="EE";
			path+="eEdu\\";
		}
		else{
			elGroup="EB";
			path+="eBook\\";
		}
		String el_idx=elGroup+readyIdx;
		
		File bookFolder=new File(path + el_idx);
		for(int i=0 ; i<files.size() ; i++){
			if(bookFolder.isDirectory()){
				/*두번째 이후*/
				File[] fileCount=bookFolder.listFiles(new FilenameFilter() {
					public boolean accept(File dir, String name) {
						return ( name.endsWith(".jpg") || name.endsWith(".png") || name.endsWith(".gif"));
					}
				});
				
				String changeName=Integer.toString(fileCount.length+1);
				
				while(changeName.length()!=4){
					changeName="0"+changeName;
				}
				System.out.println(changeName);
				
				copyInto(files.get(i), path+el_idx+"\\", changeName);
			}
			else{
				/*최초*/
				bookFolder.mkdirs();
				copyInto(files.get(i), path+el_idx+"\\", "0001");
			}
		}
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("juJson");
		return mav;
	}
	
	/**관리자 전자도서 등록 후 이동*/
	@RequestMapping(value="elibList.ju", method=RequestMethod.POST)
	public ModelAndView adminElibList(
			@ModelAttribute("elibDTO")ElibDTO elibDTO
			, @RequestParam(value="cateLg", defaultValue="0")int cateLg
			, @RequestParam(value="cateMd", defaultValue="0")int cateMd
			, @RequestParam(value="cover")MultipartFile cover
			, HttpServletRequest request
		){
		
		String el_idx=elibDTO.getEl_idx();
		String path=request.getSession().getServletContext().getRealPath("/")+"resources\\elib\\cover\\";
		String elGroup="EB";
		if(cateLg==8){
			elGroup="EM";
		}
		else if(cateLg==9){
			elGroup="EE";
		}
		el_idx=elGroup+el_idx;
		elibDTO.setEl_idx(el_idx);
		
		elibDTO.setEl_lg(Integer.toString(cateLg));
		elibDTO.setEl_md(Integer.toString(cateMd));
		
		String[] coverName=cover.getOriginalFilename().split("\\.");
		elibDTO.setEl_path(request.getContextPath()+"\\resources\\elib\\cover\\"+elibDTO.getEl_idx()+"."+coverName[coverName.length-1]);
		
		elibDTO.setEl_recommend("~");
		elibDTO.setEl_recocount(0);
		
		copyInto(cover, path, el_idx);
		
		int resultCount=elibDAO.elibInsert(elibDTO);
		System.out.println(resultCount);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("elibManage/elibList");
		return mav;
	}
	
	/**리스트 최초 로딩*/
	@RequestMapping(value="elibList.ju", method=RequestMethod.GET)
	public ModelAndView elibList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("elibManage/elibList");
		return mav;
	}
	
	/**최초 로딩 미검색 ajax*/
	@RequestMapping(value="elibNoList.ju")
	public ModelAndView elibNoList(@RequestParam(value="page", defaultValue="1")int page){
		
		int startNum=(page-1)*ElibPaging.CONTENTSIZE+1;
		int endNum=startNum+ElibPaging.CONTENTSIZE-1;
		int contentMax=elibDAO.elibAdminNoListCount();
		
		List<ElibDTO> elibArr=elibDAO.elibAdminNoList(startNum, endNum);
		String paging=ElibPaging.getPaging(page, contentMax);
		
		BookCateModul bcm=new BookCateModul();
		ArrayList<String> cateLg=new ArrayList<String>();
		for(int i=0 ; i<elibArr.size() ; i++){
			if(elibArr.get(i).getEl_idx().indexOf("EB")==0){
				cateLg.add(bcm.BookLgSelectId(0, 7, false, Integer.toString(i)));
			}
			else if(elibArr.get(i).getEl_idx().indexOf("EM")==0){
				cateLg.add(bcm.BookLgSelectId(8, 8, false, Integer.toString(i)));
			}
			else if(elibArr.get(i).getEl_idx().indexOf("EE")==0){
				cateLg.add(bcm.BookLgSelectId(9, 9, false, Integer.toString(i)));
			}
			if("~".equals(elibArr.get(i).getEl_recommend())){
				elibArr.get(i).setEl_recommend("");
			}
		}
		ArrayList<String> cateMd=new ArrayList<String>();
		for(int i=0 ; i<cateLg.size() ; i++){
			String select="<select id='cateMd_"+i+"' name='cateMd_"+i+"' class='form-control'>";
			ArrayList<String> option=bcm.BookMdArr(Integer.parseInt(elibArr.get(i).getEl_lg()));
			for(int j=0 ; j<option.size() ; j++){
				if(j==Integer.parseInt(elibArr.get(i).getEl_md())){
					select+="<option value='" + j + "' selected='selected'>" + option.get(j) + "</option>";
				}
				else{
					select+="<option value='" + j + "'>" + option.get(j) + "</option>";
				}
			}
			select+="</select>";
			System.out.println(select);
			cateMd.add(select);
			
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("elibArr", elibArr);
		mav.addObject("cateLg", cateLg);
		mav.addObject("cateMd", cateMd);
		mav.addObject("paging", paging);
		mav.setViewName("juJson");
		return mav;
	}
		
		/**검색 ajax*/
		@RequestMapping(value="elibAdminSearch.ju")
		public ModelAndView elibAdminSearch(
				@RequestParam(value="el_subject", defaultValue="")String el_subject
				, @RequestParam(value="el_writer", defaultValue="")String el_writer
				, @RequestParam(value="el_pub", defaultValue="")String el_pub
				, @RequestParam(value="el_lg", defaultValue="99")String el_lg
				, @RequestParam(value="el_md", defaultValue="99")String el_md
				, @RequestParam(value="order", defaultValue="new")String order
				, @RequestParam(value="page", defaultValue="1")int page
			){
			
			order="new".equals(order)?"upTime desc":"el_recocount DESC, upTime DESC";
			
			String where="";
			
			el_subject="".equals(el_subject)?"":"el_subject LIKE '%" + el_subject + "%' ";
			el_writer="".equals(el_writer)?"":"el_writer LIKE '%" + el_writer + "%' ";
			el_pub="".equals(el_pub)?"":"el_pub LIKE '%" + el_pub + "%' ";
			el_lg="99".equals(el_lg)?"":"el_lg='" + el_lg + "' ";
			el_md="99".equals(el_md)?"":"el_md='" + el_md + "' ";
			
			if(!"".equals(el_subject)) where+=el_subject;
			if(!"".equals(el_writer)){
				if("".equals(where)) where+=el_writer;
				else where+="AND "+el_writer;
			}
			if(!"".equals(el_pub)){
				if("".equals(where)) where+=el_pub;
				else where+="AND "+el_pub;
			}
			if(!"".equals(el_lg)){
				if("".equals(where)) where+=el_lg;
				else where+="AND "+el_lg;
			}
			if(!"".equals(el_md)){
				if("".equals(where)) where+=el_md;
				else where+="AND "+el_md;
			}
			System.out.println("1 : " + where);
			System.out.println("2 : " + order);
			
			int startNum=(page-1)*ElibPaging.CONTENTSIZE+1;
			int endNum=startNum+ElibPaging.CONTENTSIZE-1;
			int contentMax=elibDAO.elibAdminSearchCount(where);
			
			List<ElibDTO> elibArr=elibDAO.elibAdminSearch(where, order, Integer.toString(startNum), Integer.toString(endNum));
			String paging=ElibPaging.getPaging(page, contentMax);
			
			BookCateModul bcm=new BookCateModul();
			ArrayList<String> cateLg=new ArrayList<String>();
			for(int i=0 ; i<elibArr.size() ; i++){
				if(elibArr.get(i).getEl_idx().indexOf("EB")==0){
					cateLg.add(bcm.BookLgSelectId(0, 7, false, Integer.toString(i)));
				}
				else if(elibArr.get(i).getEl_idx().indexOf("EM")==0){
					cateLg.add(bcm.BookLgSelectId(8, 8, false, Integer.toString(i)));
				}
				else if(elibArr.get(i).getEl_idx().indexOf("EE")==0){
					cateLg.add(bcm.BookLgSelectId(9, 9, false, Integer.toString(i)));
				}
				if("~".equals(elibArr.get(i).getEl_recommend())){
					elibArr.get(i).setEl_recommend("");
				}
			}
			ArrayList<String> cateMd=new ArrayList<String>();
			for(int i=0 ; i<cateLg.size() ; i++){
				String select="<select id='cateMd_"+i+"' name='cateMd_"+i+"' class='form-control'>";
				ArrayList<String> option=bcm.BookMdArr(Integer.parseInt(elibArr.get(i).getEl_lg()));
				for(int j=0 ; j<option.size() ; j++){
					if(j==Integer.parseInt(elibArr.get(i).getEl_md())){
						select+="<option value='" + j + "' selected='selected'>" + option.get(j) + "</option>";
					}
					else{
						select+="<option value='" + j + "'>" + option.get(j) + "</option>";
					}
				}
				select+="</select>";
				System.out.println(select);
				cateMd.add(select);
			}
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("elibArr", elibArr);
		mav.addObject("cateLg", cateLg);
		mav.addObject("cateMd", cateMd);
		mav.addObject("paging", paging);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**삭제*/
	@RequestMapping(value="elibDelete.ju")
	public ModelAndView elibDelete(@RequestParam(value="el_idx")String el_idx, HttpServletRequest request) {
		List<ElibDTO> elibArr=elibDAO.elibContent(el_idx);
		String pathCover=request.getSession().getServletContext().getRealPath("/");
		pathCover=pathCover.substring(0, pathCover.length()-5)+elibArr.get(0).getEl_path();
		String pathImg=request.getSession().getServletContext().getRealPath("/")+"resources\\elib\\";

		if(el_idx.indexOf("AB")==0){
			/* 돌려 보내기*/
		}
		else if(el_idx.indexOf("EB")==0){
			pathImg+="eBook\\"+elibArr.get(0).getEl_idx();
		}
		else if(el_idx.indexOf("EM")==0){
			pathImg+="eMagazine\\"+elibArr.get(0).getEl_idx();
		}
		else if(el_idx.indexOf("EE")==0){
			pathImg+="eEdu\\"+elibArr.get(0).getEl_idx();
		}
		System.out.println("pathCover : " + pathCover);
		System.out.println("pathImg : " + pathImg);
		
		File cover=new File(pathCover);
		cover.delete();
		
		File imgFolder=new File(pathImg);
		File imgFiles[]=imgFolder.listFiles();
		for(int i=0 ; i<imgFiles.length ; i++){
			imgFiles[i].delete();
		}
		imgFolder.delete();
		
		int resultCount=elibDAO.elibDelete(el_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("resultCount", resultCount);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**컨텐츠 그룹 선택*/
	@RequestMapping(value="contentGrup.ju")
	public ModelAndView contentGrup(@RequestParam(value="groupNum", defaultValue="7")int groupNum, @RequestParam(value="num", defaultValue="0")String num){
		BookCateModul bcm=new BookCateModul();
		String cateLg=null;
		if(groupNum==7){
			cateLg=bcm.BookLgSelectId(0, 7, false, num);
		}
		else{
			cateLg=bcm.BookLgSelectId(groupNum, groupNum, false, num);
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("cateLg", cateLg);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**수정*/
	@RequestMapping(value="elibUpdate.ju")
	public ModelAndView elibUpdate(
			@RequestParam(value="el_idx", defaultValue="0")String el_idx
			, @RequestParam(value="el_subject", defaultValue="0")String el_subject
			, @RequestParam(value="el_writer", defaultValue="0")String el_writer
			, @RequestParam(value="el_pub", defaultValue="0")String el_pub
			, @RequestParam(value="el_info", defaultValue="0")String el_info
			, @RequestParam(value="groupNum", defaultValue="7")int groupNum
			, @RequestParam(value="el_lg", defaultValue="0")String el_lg
			, @RequestParam(value="el_md", defaultValue="0")String el_md
			, HttpServletRequest request
		) throws IOException{
		String change_idx="";
		List<ElibDTO> elibArr=elibDAO.elibContent(el_idx);
		String[] exe=elibArr.get(0).getEl_path().split("\\.");
		if(groupNum==7){
			change_idx="EB"+el_idx.substring(2);
		}
		else if(groupNum==8){
			change_idx="EM"+el_idx.substring(2);
		}
		else if(groupNum==9){
			change_idx="EE"+el_idx.substring(2);
		}
		String el_path="/lee\\resources\\elib\\cover\\"+change_idx+"."+exe[exe.length-1];
		if(!elibArr.get(0).getEl_idx().equals(change_idx)){
			String coverPath=request.getSession().getServletContext().getRealPath("/");
			coverPath=coverPath.substring(0, coverPath.length()-5);
			String orignalPath=coverPath+elibArr.get(0).getEl_path();
			File coverFile=new File(orignalPath);
			File coverChangeFile=new File(coverPath+el_path);
			coverFile.renameTo(coverChangeFile);
			String originImgs="resources\\elib\\";
			if(elibArr.get(0).getEl_idx().indexOf("EB")==0){
				originImgs+="eBook\\"+elibArr.get(0).getEl_idx();
			}
			else if(elibArr.get(0).getEl_idx().indexOf("EM")==0){
				originImgs+="eMagazine\\"+elibArr.get(0).getEl_idx();
			}
			else if(elibArr.get(0).getEl_idx().indexOf("EE")==0){
				originImgs+="eEdu\\"+elibArr.get(0).getEl_idx();
			}
			
			String newPath=request.getSession().getServletContext().getRealPath("/")+"resources\\elib\\";
			if(groupNum==7){
				newPath+="eBook\\"+change_idx;
			}
			else if(groupNum==8){
				newPath+="eMagazine\\"+change_idx;
			}
			else if(groupNum==9){
				newPath+="eEdu\\"+change_idx;
			}
			File oldimgs=new File(request.getSession().getServletContext().getRealPath("/")+originImgs);
			File[] oldPaths=oldimgs.listFiles(new FilenameFilter() {
				public boolean accept(File dir, String name) {
					return ( name.endsWith(".jpg") || name.endsWith(".png") || name.endsWith(".gif"));
				}
			});
			File newImgs=new File(newPath);
			newImgs.mkdirs();
			for(int i=0 ; i<oldPaths.length ; i++){
				File file = new File(newPath+"\\"+oldPaths[i].getName());
				oldPaths[i].renameTo(file);
			}
			File oldimgsDel=new File(request.getSession().getServletContext().getRealPath("/")+originImgs);
			File[] oldPathsDel=oldimgs.listFiles();
			for(int i=0 ; i<oldPathsDel.length ; i++){
				oldPathsDel[i].delete();
			}
			oldimgsDel.delete();
			
		}
		
		int resultCount=elibDAO.elibUpdate(el_idx, el_lg, el_md, el_subject, el_writer, el_pub, el_info, el_path, change_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("change_idx", change_idx);
		mav.addObject("resultCount", resultCount);
		mav.setViewName("juJson");
		return mav;
	}
	
	/*파일 업로드 하는 메소드*/
	public void copyInto(MultipartFile files, String path, String changeName) {
		try {
			byte bytes[]=files.getBytes();
			String[] fileName=files.getOriginalFilename().split("\\.");
			fileName[0]=changeName;
			File outFile=new File(path+fileName[0]+"."+ fileName[fileName.length-1]);
			FileOutputStream fos=new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}