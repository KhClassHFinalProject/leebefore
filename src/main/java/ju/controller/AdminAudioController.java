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
import org.springframework.web.servlet.ModelAndView;

import ju.audiobook.model.AudioDAO;
import ju.dto.ElibDTO;
import ju.modul.BookCateModul;

@Controller
public class AdminAudioController {
		@Autowired
		private AudioDAO audioDao;
		
		/*오디오북 관리페이지*/
		
		/**소분류 고침 Ajax*/
		@RequestMapping(value="audioCate.ju")
		public ModelAndView audioCate(@RequestParam(value="cateLgVal", defaultValue="0")int cateLgVal) {
			BookCateModul bcm=new BookCateModul();
			ArrayList<String> cateMd=bcm.BookMdArr(cateLgVal);
			ModelAndView mav=new ModelAndView();
			mav.addObject("cateMd", cateMd);
			
			mav.setViewName("juJson");
			return mav;
		}
		
		//오디오 관리 페이지로 들어가는지 확인 및 출력
		@RequestMapping(value="eAudioAdd.ju")
		public ModelAndView eAudioAdd() {
			BookCateModul bcm = new BookCateModul();
			String cate = bcm.BookLgSelect(0, 7, false);
			ModelAndView mav = new ModelAndView();
			mav.addObject("cateLg",cate);
			mav.setViewName("ebook/eAudio/eAudioAdmin/eAudioAdd");
			return mav;
		}
	
		//전송 submit 버튼을 클릭했을시 반응
		@RequestMapping(value="eAudioAdd2.ju",method=RequestMethod.POST)
		public ModelAndView fileUpload(@RequestParam(value="audio") List<MultipartFile> audiosUp
								, @RequestParam(value="abimg") MultipartFile img 
								, @RequestParam(value="cateLg", defaultValue="0")int cateLg
						        , @RequestParam(value="cateMd", defaultValue="0")int cateMd
								, HttpServletRequest req
								, @ModelAttribute("edto")ElibDTO edto){
			
			ModelAndView mav = new ModelAndView();
			
			String cAuPath = req.getSession().getServletContext().getRealPath("/")+"resources\\elib\\cover\\";
			String path = req.getSession().getServletContext().getRealPath("/resources/elib/eAudio/");
			
			//idx 지정타임 스탬프
			String el_idx = "AB"+System.currentTimeMillis();
			
			//오디오 idx 폴더를 나누기 위한 과정
			File audioFolder = new File(path+"\\"+el_idx);
			
			for(int i=0;i<audiosUp.size();i++){
				
				if(audioFolder.isDirectory()){
					File[] fileCount=audioFolder.listFiles(new FilenameFilter() {
						
						public boolean accept(File dir, String name) {
							return (name.endsWith(".mp3"));
						}
					});
	/*				for(int j=0 ; j<fileCount.length ; j++){
					System.out.println(fileCount[j].getName());
					}
					System.out.println(fileCount.length);*/
				
					copyInto(audiosUp.get(i), path+"\\"+el_idx+"\\", Integer.toString(fileCount.length+1));
					
				}else{
					audioFolder.mkdirs();
					copyInto(audiosUp.get(i), path+"\\"+el_idx+"\\", "1");
				}
				
			}
			
			//표지 이미지 파일이름 split 확장자 자르기
			String[] coverName=img.getOriginalFilename().split("\\.");
			copyInto(img, cAuPath, el_idx);
			edto.setEl_lg(Integer.toString(cateLg));
		    edto.setEl_md(Integer.toString(cateMd));
			edto.setEl_idx(el_idx);
			edto.setEl_path(req.getContextPath()+"\\resources\\elib\\cover\\"+edto.getEl_idx()+"."+coverName[1]);
			edto.setEl_recommend("~");
			edto.setEl_recocount(0);
			
			audioDao.audioUp(edto);
			
			mav.setViewName("juJson");
			
			return mav;
		}
	
	
		
		//업로드 할 파일들의 속성을 추출 및 업로드 하기 위한 메서드
		public void copyInto(MultipartFile upload, String path, String changeName){
			
		/*	System.out.println("파일이름 : "+upload.getOriginalFilename());
			System.out.println("파일 크기 : " + upload.getSize());*/
			
			try {
				byte bytes[]=upload.getBytes();
				String[] fileName=upload.getOriginalFilename().split("\\.");
				fileName[0]=changeName;
				File outFile=new File(path+"/"+fileName[0]+"."+ fileName[1]);
				FileOutputStream fos = new FileOutputStream(outFile);
				fos.write(bytes);
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		/*오디오 음성 테스트*/
		@RequestMapping(value="eAudioVoice.ju")
		public ModelAndView eAudioVoice(){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("ebook/eAudio/voice/audioVoice");
			return mav;
		}
		
		
		
		/*/////////
		@RequestMapping(value="updateList.ju")
		public ModelAndView audioFirst(){
			ModelAndView mav=new ModelAndView();
			
			List<ElibDTO> list = audioDao.selectList();
			
			mav.addObject("abArr", list);
			mav.setViewName("juJson");
			return mav;
		}*/
		
		//오디오 관리용 목록으로..
		@RequestMapping(value="eAudioListAdmin.ju")
		public ModelAndView eAudio(){
			BookCateModul bcm=new BookCateModul();
			String cate = bcm.BookLgSelect(0, 7, true);
			ModelAndView mav = new ModelAndView();
			mav.addObject("bookLgSelect",cate);
			mav.setViewName("ebook/eAudio/eAudioAdmin/eAudioListAdmin");
			return mav;
		}
		
		/*오디오 정보 수정 페이지*/
		@RequestMapping(value="eAudioUpdate.ju")
		public ModelAndView eAudioUpdate(@RequestParam(value="el_idx")String el_idx){
			ModelAndView mav = new ModelAndView();
			BookCateModul bcm = new BookCateModul();
			ElibDTO ablist=audioDao.selContent(el_idx);
			 
			String cate = bcm.BookLgSelect(0, 7, false);
			mav.addObject("ablist",ablist);
			mav.addObject("cateLg",cate);
			mav.setViewName("ebook/eAudio/eAudioAdmin/audioUpdate");
			return mav;
		}
		
		@RequestMapping(value="eAudioUpdateGo.ju")
		public ModelAndView eAudioUpdateGo(@RequestParam(value="el_subject")String subject
				,@RequestParam(value="el_writer")String writer
				,@RequestParam(value="el_pub")String pub
				,@RequestParam(value="cateLg")String lg
				,@RequestParam(value="cateMd")String md
				,@RequestParam(value="el_info")String info
				,@RequestParam(value="elIdx")String idx
				,@ModelAttribute("edto")ElibDTO dto
				){
			ModelAndView mav = new ModelAndView();
			dto.setEl_idx(idx);
			dto.setEl_lg(lg);
			dto.setEl_md(md);
			audioDao.upAudioInfo(dto);
			mav.setViewName("juJson");
			
			return mav;
		}

}
