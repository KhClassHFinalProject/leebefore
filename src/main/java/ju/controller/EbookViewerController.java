package ju.controller;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ju.dto.ElibDTO;
import ju.dto.OriginalLoanDTO;
import ju.elib.model.ElibDAO;
import ju.model.LoanDAO;

@Controller
public class EbookViewerController{
	
	@Autowired
	private ElibDAO elibDAO;
	@Autowired
	private LoanDAO loandao;
	
	/**뷰어*/
	@RequestMapping(value="eViewer.ju")
	public ModelAndView eViewer(@RequestParam(value="el_idx", defaultValue="0")String el_idx, HttpServletRequest request) {
		HttpSession session=request.getSession();
		String mem_idx=(String) session.getAttribute("sidx");
		if(mem_idx==null){
			mem_idx="MB";
		}
		
		ModelAndView mav=new ModelAndView();
		List<ElibDTO> elibArr=null;
		List<OriginalLoanDTO> loanArr=null;
		String path=request.getSession().getServletContext().getRealPath("/")+"resources\\elib\\";
		String viewImgPath="\\lee\\resources\\elib\\";
		
		if(el_idx.indexOf("AB")==0){
			/* 돌려 보내기*/
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.setViewName("ebook/eViewerMsg");
			return mav;
		}
		else if(el_idx.indexOf("EB")==0){
			int resultCount=0;
			if(mem_idx.indexOf("MB")!=0){ resultCount=1; }
			else{
				resultCount=loandao.elibLoanCheck(el_idx, mem_idx);
			}
			if(resultCount<=0){
				/* 돌려 보내기*/
				mav.addObject("msg", "대여한 책이 아닙니다.");
				mav.setViewName("ebook/eViewerMsg");
				return mav;
			}
			else if(resultCount>0) {
				loanArr=loandao.elibLoanInfo(el_idx, mem_idx); // 빌린 책 정보
				mav.addObject("loanArr", loanArr.get(0));
				String[] bk=loanArr.get(0).getLb_etc().split("~");
				String bkArr="";
				for(int i=1 ; i<bk.length ; i++){
					bkArr+=bk[i]+"~";
				}
				mav.addObject("beforeRead", bk[0]);
				mav.addObject("bkArr", bkArr);
				elibArr=elibDAO.elibViewer(el_idx);
				path+="eBook\\"+elibArr.get(0).getEl_idx()+"\\";
				viewImgPath+="eBook\\";
			}
		}
		else if(el_idx.indexOf("EM")==0){
			elibArr=elibDAO.elibViewer(el_idx);
			path+="eMagazine\\"+elibArr.get(0).getEl_idx()+"\\";
			viewImgPath+="eMagazine\\";
		}
		else if(el_idx.indexOf("EE")==0){
			elibArr=elibDAO.elibViewer(el_idx);
			path+="eEdu\\"+elibArr.get(0).getEl_idx()+"\\";
			viewImgPath+="eEdu\\";
		}
		ArrayList<String> imgPath=new ArrayList<String>();
		
		File elibFile=new File(path);
		File[] contentPath=elibFile.listFiles(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				return ( name.endsWith(".jpg") || name.endsWith(".png") || name.endsWith(".gif"));
			}
		});
		for(int i=0 ; i<contentPath.length ; i++){
			imgPath.add(viewImgPath+elibArr.get(0).getEl_idx()+"\\"+contentPath[i].getName());
		}
		String endPage=Integer.toString(imgPath.size()%2==0?imgPath.size()+1:imgPath.size()+2);
		
		mav.addObject("elibArr", elibArr.get(0));
		mav.addObject("imgPath", imgPath);
		mav.addObject("endPage", endPage);
		mav.setViewName("ebook/eViewer");
		return mav;
	}
	
	/**뷰어 북마크 등록*/
	@RequestMapping(value="eViewerBookMakerAdd.ju")
	public ModelAndView eViewerBookMakerAdd(
		@RequestParam(value="page", defaultValue="#/page/1")String page
		, @RequestParam(value="el_idx", defaultValue="")String el_idx
		, @RequestParam(value="lb_idx", defaultValue="")String lb_idx
		, HttpServletRequest request
		) {
		HttpSession session=request.getSession();
		String mem_idx=(String) session.getAttribute("sidx");
		if(mem_idx==null){
			mem_idx="";
		}
		int resultCount=0;
		if(el_idx.indexOf("EB")==0 && mem_idx.indexOf("MB")==0){
			List<OriginalLoanDTO> loanArr=loandao.loanInfo(lb_idx);
			String lb_etc=loanArr.get(0).getLb_etc();
			lb_etc+="~"+page;
			resultCount=loandao.loanBookMarkUp(lb_idx, lb_etc);
		} // 아닌경우는 필요없음
		ModelAndView mav=new ModelAndView();
		mav.addObject("resultCount", resultCount);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**뷰어 북마크 삭제*/
	@RequestMapping(value="eViewerBookMakerDel.ju")
	public ModelAndView eViewerBookMakerDel(
		@RequestParam(value="page", defaultValue="#/page/1")String page
		, @RequestParam(value="el_idx", defaultValue="")String el_idx
		, @RequestParam(value="lb_idx", defaultValue="")String lb_idx
		, HttpServletRequest request
		) {
		HttpSession session=request.getSession();
		String mem_idx=(String) session.getAttribute("sidx");
		if(mem_idx==null){
			mem_idx="";
		}
		int resultCount=0;
		if(el_idx.indexOf("EB")==0 && mem_idx.indexOf("MB")==0){
			List<OriginalLoanDTO> loanArr=loandao.loanInfo(lb_idx);
			String[] etcArr=loanArr.get(0).getLb_etc().split("~");
			String lb_etc=etcArr[0];
			for(int i=1 ; i<etcArr.length ; i++){
				if(!etcArr[i].equals(page)){ lb_etc+="~"+etcArr[i]; }
			}
			resultCount=loandao.loanBookMarkUp(lb_idx, lb_etc);
		} // 아닌경우는 필요없음
		ModelAndView mav=new ModelAndView();
		mav.addObject("resultCount", resultCount);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**뷰어 마지막 페이지 저장*/
	@RequestMapping(value="eViewerEndMaker.ju")
	public ModelAndView eViewerEndMaker(
		@RequestParam(value="endPage", defaultValue="#/page/1")String endPage
		, @RequestParam(value="el_idx", defaultValue="")String el_idx
		, @RequestParam(value="lb_idx", defaultValue="")String lb_idx
		, HttpServletRequest request
		) {
		HttpSession session=request.getSession();
		String mem_idx=(String) session.getAttribute("sidx");
		System.out.println("mem_idx : " + mem_idx);
		System.out.println("endPage : " + endPage);
		System.out.println("el_idx : " + el_idx);
		System.out.println("lb_idx : " + lb_idx);
		if(mem_idx==null){
			mem_idx="";
		}
		int resultCount=0;
		String lb_etc=null;
		if(el_idx.indexOf("EB")==0 && mem_idx.indexOf("MB")==0){
			List<OriginalLoanDTO> loanArr=loandao.loanInfo(lb_idx);
			if(loanArr.get(0).getLb_etc().indexOf("~")!=-1){
				String[] etcArr=loanArr.get(0).getLb_etc().split("~");
				lb_etc=etcArr[0];
				for(int i=1 ; i<etcArr.length ; i++){
					lb_etc+="~"+etcArr[i];
				}
			}
			else{
				lb_etc=endPage;
			}
			resultCount=loandao.loanBookMarkUp(lb_idx, lb_etc);
		} // 아닌경우는 필요없음
		ModelAndView mav=new ModelAndView();
		mav.addObject("resultCount", resultCount);
		mav.setViewName("juJson");
		return mav;
	}

}