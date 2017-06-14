package ju.controller;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ju.notice.model.NoticeDAO;
import ju.dto.NoticeDTO;




@Controller
public class HelpController {
	
	@Autowired
	private NoticeDAO noticeDao;

	
	
	//공지사항 게시판 리스트관련 메소드
	@RequestMapping("/noticeList.ju")
	public ModelAndView noticeList(){
		//System.out.println("ddd");
		List<NoticeDTO> list=noticeDao.noticeList(); //DTO 그릇에 DAO에있는 리스트를 담아서
		//System.out.println(list);
		ModelAndView mav=new ModelAndView("help/notice/noticeList","list",list); //이 페이지로 보낸다 리스트를같이
		return mav;
	}
	
	//공지사항 게시판 작성관련 메소드
	@RequestMapping("/noticeWrite.ju")
	public String noticeWrite(){
		return "help/notice/noticeWrite";
	}
		
	@RequestMapping("/noticeWriteok.ju")
	public ModelAndView noticeWrite(NoticeDTO dto){
		
			Long unixTime=System.currentTimeMillis();
			String nt_idx="NT"+unixTime;  //NT~로 시작하는 idx를 생성시킨다
		    dto.setNt_idx(nt_idx);		//dto에 담아 출력시킴
		    System.out.println(nt_idx);
		
		int result=noticeDao.noticeWrite(dto);
		String msg=result>0?"게시물등록성공":"게시물등록실패";
		//System.out.println(result);
		ModelAndView mav=new ModelAndView("help/WriteMsg","msg",msg); //메세지로 번환시킨다
		return mav;
	}
	
	@RequestMapping("/noticeContent.ju")
	public ModelAndView noticeContent(String nt_idx){
		NoticeDTO dto=noticeDao.noticeContent(nt_idx);
		ModelAndView mav=new ModelAndView("help/notice/noticeContent","dto",dto);
		return mav;
	}

	@RequestMapping("/noticeDelete.ju")
	public ModelAndView noticeDelete(@RequestParam(value="nt_idx") String nt_idx ){
		//System.out.println("ddd"+nt_idx);
		int result=noticeDao.noticeDelete(nt_idx);
		String msg=result>0?"게시물 삭제 성공":"게시물 삭제 실패";
		ModelAndView mav=new ModelAndView("help/DeleteMsg","msg",msg);
		return mav;
	}

	
	@RequestMapping("/noticeChange.ju")
	public ModelAndView noticeChange(@RequestParam(value="nt_idx") String nt_idx){
		NoticeDTO dto=noticeDao.noticeChange(nt_idx);
		System.out.println("1"+dto.getNt_idx());
		ModelAndView mav=new ModelAndView("help/notice/noticeChange","dto",dto);
		return mav;
	}
	
	@RequestMapping("/noticeChangeOk.ju")
	public ModelAndView noticeChangeOk(@RequestParam(value="nt_idx") String nt_idx,
			NoticeDTO dto){
		System.out.println("ddd"+dto.getNt_idx());
		int result=noticeDao.noticeChangeOk(dto);
		String msg=result>0?"게시물 수정 성공":"게시물 수정 실패";
		ModelAndView mav=new ModelAndView("help/ChangeMsg","msg",msg);
		return mav;
	}
	
	//분실물 게시판 관련 메소드
	@RequestMapping("/missingList.ju")
	public ModelAndView missingList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/missing/missingList");
		return mav;
	}
	
	@RequestMapping("/missingWrite.ju")
	public ModelAndView missingWrite(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/missing/missingWrite");
		return mav;
	}
	
	@RequestMapping("/missingWriteok.ju")
	public ModelAndView missingWriteok(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/missing/missingWriteok");
		return mav;
	}

	
	//QnA 게시판 관련 메소드
	@RequestMapping("/questList.ju")
	public ModelAndView questList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/quest/questList");
		return mav;
	}
	
	
	//FaQ 게시판 관련 메소드
	@RequestMapping("/faqList.ju")
	public ModelAndView faqList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/faq/faqList");
		return mav;
	}
	
	
	//희망도서 요청 게시판 관련 메소드
	@RequestMapping("/orderBkList.ju")
	public ModelAndView orderbkList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/orderBk/orderBkList");
		return mav;
	}
	
	
	//책추천 감상평 게시판 관련 메소드
	@RequestMapping("/reviewList.ju")
	public ModelAndView reviewList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/review/reviewList");
		return mav;
	}
	
}
