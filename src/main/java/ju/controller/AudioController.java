package ju.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ju.audiobook.model.AudioDAO;
import ju.dto.ElibDTO;
import ju.modul.BookCateModul;

@Controller
public class AudioController {
	
	@Autowired
	private AudioDAO audioDao;
	
	//오디오 플레이어
	@RequestMapping(value="aPlayer.ju")
	public ModelAndView aPlayer(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ebook/eAudio/audioPlayer/aPlayer");
		return mav;
	}
	
	//오디오 메인으로..
	@RequestMapping(value="eAudio.ju")
	public ModelAndView eAudio(){
		BookCateModul bcm=new BookCateModul();
		String cate = bcm.BookLgSelect(0, 7, true);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookLgSelect",cate);
		mav.setViewName("ebook/eAudio/eAudio");
		return mav;
	}
	
	//오디오 책 선택시..
	@RequestMapping(value="eAudioSelect.ju")
	public ModelAndView eAudioSelect(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ebook/eAudio/eAudioSelect");
		return mav;
	}
	
	/**최초 접근 검색내용*/
	@RequestMapping(value="audioFirst.ju")
	public ModelAndView audioFirst(
		@RequestParam(value="page", defaultValue="1")int page
		, @RequestParam(value="order", defaultValue="new")String order)	{
		ModelAndView mav=new ModelAndView();
		
		int totalCnt = audioDao.totalCnt();
		
		int listSize = 3; 
		int pageSize = 2;
		
		String pagNum = ju.audio.module.ModulePage.guestPageMake("eAudio.ju", totalCnt, page, pageSize, listSize);
		/*System.out.println("paging:"+pagNum);
		System.out.println("firstPage:"+page);*/
		
		List<ElibDTO> list = audioDao.selectImg(page,listSize);
		
		mav.addObject("page",pagNum);
		
		mav.addObject("ebArr", list);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**오디오책 컨텐츠 선택*/
	@RequestMapping(value="audioContent.ju")
	public ModelAndView ebookContent(@RequestParam(value="el_idx", defaultValue="0")String el_idx
		, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		String mem_idx=(String) session.getAttribute("sidx");
		ElibDTO dto = audioDao.selContent(el_idx);
		mav.addObject("mem_idx",mem_idx);
		mav.addObject("ebArr", dto);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**상세 검색*/
	@RequestMapping(value="audioDetailSearch.ju")
	public ModelAndView audioDetailSearch(
		@RequestParam(value="detailSubject", defaultValue="" )String detailSubject
		, @RequestParam(value="detailWrite", defaultValue="" )String detailWrite
		, @RequestParam(value="detailPub", defaultValue="" )String detailPub
		, @RequestParam(value="cateLg", defaultValue="99" )String cateLg
		, @RequestParam(value="cateMd", defaultValue="99" )String cateMd
		, @RequestParam(value="page", defaultValue="1" )int page
		, @RequestParam(value="orderName", defaultValue="new" )String orderName
		) {
		
		orderName="new".equals(orderName)?"el_idx DESC":"el_recocount DESC, el_idx DESC";
		String where="";
		
		/*System.out.println("cateMd 1:"+cateMd);
		System.out.println("cateLg 1:"+cateLg);*/
		
		detailSubject="".equals(detailSubject)?"":"LOWER(el_subject) LIKE LOWER('%" + detailSubject + "%') ";
		detailWrite="".equals(detailWrite)?"":"el_writer LIKE '%" + detailWrite + "%' ";
		detailPub="".equals(detailPub)?"":"el_pub LIKE '%" + detailPub + "%' ";
		cateLg="99".equals(cateLg)?"":"el_lg='" + cateLg + "' ";
		cateMd="99".equals(cateMd)?"":"el_md='" + cateMd + "' ";
		
		/*System.out.println("cateMd:"+cateMd);*/
		
		if(!"".equals(detailSubject)) {
			where+=detailSubject;
		}
		
		if(!"".equals(detailWrite)){
			if("".equals(where)) {
				where+=detailWrite;
			}else {
				where+="AND "+detailWrite;
			}
		}
		if(!"".equals(detailPub)){
			if("".equals(where)) {
				where+=detailPub;
			}else {
				where+="AND "+detailPub;
			}
		}
		if(!"".equals(cateLg)){
			if("".equals(where)) {
				where+=cateLg;
			}else {
				where+="AND "+cateLg;
			}
		}
		
		if(!"".equals(cateMd)){
			if("".equals(where)){
				where+="";
			}else{
				where+="AND "+cateMd;
			}
		}
		
		if(!"".equals(where)){
			where="AND "+where;
		}
		
		ModelAndView mav=new ModelAndView();
		int totalCnt = audioDao.totalCnt();
		int listSize = 3; 
		int pageSize = 5;
		String pagNum = ju.audio.module.ModulePage.guestPageMake("eAudio.ju", totalCnt, page, pageSize, listSize);
		mav.addObject("page",pagNum);
	/*	System.out.println("pn:"+pagNum);
		System.out.println("firstPage:"+page);
		System.out.println("where:"+where);*/
		List<ElibDTO> abArr = audioDao.serchDetail(where, orderName, page, listSize);
		
		mav.addObject("ebArr", abArr);
		mav.setViewName("juJson");
		return mav;
		
	}
	
	/**단순 검색*/
	@RequestMapping(value="audioSimpleSearch.ju")
	public ModelAndView audioSimpleSearch(
		@RequestParam(value="simpleSearchText", defaultValue="0" )String simpleSearchText
		, @RequestParam(value="page", defaultValue="1" )int page
		, @RequestParam(value="orderName", defaultValue="new" )String orderName
		) {
		orderName="new".equals(orderName)?"el_idx DESC":"el_recocount DESC, el_idx DESC";
		ModelAndView mav=new ModelAndView();
		int totalCnt = audioDao.totalCnt();
		int listSize = 3; 
		int pageSize = 5;
		
		String pagNum = ju.audio.module.ModulePage.guestPageMake("eAudio.ju", totalCnt, page, pageSize, listSize);

		List<ElibDTO> absArr = audioDao.simpleSerch(simpleSearchText, orderName, page, listSize); 
		mav.addObject("page",pagNum);
		mav.addObject("ebArr", absArr);
		mav.setViewName("juJson");
		return mav;
	}
	
	//오디오 북 추천하기
	@RequestMapping(value="eAudioRecommend.ju")
	public ModelAndView eAudioRecom(@RequestParam(value="el_idx")String el_idx
			, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		HttpSession session=request.getSession();
		String mem_idx=(String) session.getAttribute("sidx");
		
		//세션 idx 넘어오는지 확인
		System.out.println("memidx:"+mem_idx);
		
		mav.setViewName("juJson");
		return mav;
	}
	
}
