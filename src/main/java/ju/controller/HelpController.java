package ju.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

<<<<<<< HEAD
import ju.notice.model.NoticeDAO;
import ju.quest.model.QnaDAO;
=======
>>>>>>> 8662f44b641c09744135108e2262e03c7edae4a7
import ju.dto.MissingDTO;
import ju.dto.NoticeDTO;
import ju.dto.QnaDTO;
import ju.missing.model.MissingDAO;
import ju.notice.model.NoticeDAO;




@Controller
public class HelpController {
	final int COUNTPAGE = 5;
	final int COUNTLIST = 10;
	
	
	@Autowired
	private NoticeDAO noticeDao;
	@Autowired
	private MissingDAO missingDao;
	@Autowired
	private QnaDAO qnaDao;

	
	
	//공지사항 게시판 리스트관련 메소드
	@RequestMapping("/noticeList.ju")
	public ModelAndView noticeList(@RequestParam(value="type", defaultValue="nt_subject")String type,
				@RequestParam(value="query", defaultValue="")String query,
				@RequestParam(value="page", defaultValue="1")int page){
		
		int totalCount = noticeDao.noticeTotalCount(); // 총 게시물
		int totalPage = totalCount/COUNTLIST; // 전체 페이지 수
		if(totalCount % COUNTLIST > 0){ // 정확한 페이지 수 계산
			totalPage++;
		}
		
		if(page>totalPage && totalPage!=0){ // 페이지가 총 페이지를 넘어가면 마지막 페이지로 돌림 
			page = totalPage;
		}else if(page < 1){  // 페이지가 1보다 작으면 1로 유지
			page = 1;
		}
		
		int startPage = ((page-1)/COUNTPAGE)*COUNTPAGE+1;	// 시작 페이지
		int endPage = startPage + COUNTPAGE -1; // 끝 페이지
		if(endPage > totalPage){  // 끝 페이지가 총페이지보다 크면 마지막으로 초기화
			endPage = totalPage;
		}
		
		String sql = "select b.* from (select rownum as rnum, a.* from(select nt_idx, nt_cate, nt_subject, mem_idx, nt_date, nt_readnum from notice where "+ type +" like '%" + query + "%' order by nt_date desc)a)b WHERE b.rnum >= "+((page-1)*COUNTLIST+1)+" and b.rnum <= "+(page*COUNTLIST);
		List<NoticeDTO> list=noticeDao.noticeList(sql); //DTO 그릇에 DAO에있는 리스트를 담아서
		ModelAndView mav=new ModelAndView("help/notice/noticeList","list",list); //이 페이지로 보낸다 리스트를같이
		mav.addObject("page", page);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		
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
	
	/* 분실물 게시판 관련 메소드 */
	@RequestMapping("/missingList.ju")
	public ModelAndView missingList(@RequestParam(value="type", defaultValue="missing_subject")String type,
			@RequestParam(value="query", defaultValue="")String query,
			@RequestParam(value="page", defaultValue="1")int page){
	
	int totalCount = missingDao.missingTotalCount(); // 총 게시물
	int totalPage = totalCount/COUNTLIST; // 전체 페이지 수
	if(totalCount % COUNTLIST > 0){ // 정확한 페이지 수 계산
		totalPage++;
	}
	
	if(page>totalPage && totalPage!=0){ // 페이지가 총 페이지를 넘어가면 마지막 페이지로 돌림 
		page = totalPage;
	}else if(page < 1){  // 페이지가 1보다 작으면 1로 유지
		page = 1;
	}
	
	int startPage = ((page-1)/COUNTPAGE)*COUNTPAGE+1;	// 시작 페이지
	int endPage = startPage + COUNTPAGE -1; // 끝 페이지
	if(endPage > totalPage){  // 끝 페이지가 총페이지보다 크면 마지막으로 초기화
		endPage = totalPage;
	}
	String sql = "select b.* from (select rownum as rnum, a.* from(select missing_idx, missing_cate, missing_subject, mem_idx, missing_date, missing_readnum from missing where "+ type +" like '%" + query + "%' order by missing_date desc)a)b WHERE b.rnum >= "+((page-1)*COUNTLIST+1)+" and b.rnum <= "+(page*COUNTLIST);
	System.out.println(sql);
	List<MissingDTO> list=missingDao.missingList(sql); //DTO 그릇에 DAO에있는 리스트를 담아서
	ModelAndView mav=new ModelAndView("help/missing/missingList","list",list); //이 페이지로 보낸다 리스트를같이
	mav.addObject("page", page);
	mav.addObject("startPage", startPage);
	mav.addObject("endPage", endPage);
	
	return mav;
}
	
	@RequestMapping("/missingWrite.ju")
	public ModelAndView missingWrite(HttpSession session){
		String sid = (String)session.getAttribute("sid");
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/missing/missingWrite");
		mav.addObject("sid", sid);
		return mav;
	}
	
	@RequestMapping("/missingWriteOk.ju")
	public ModelAndView missingWriteok(MissingDTO dto, HttpSession session){
		String mem_idx = (String)session.getAttribute("sidx");
		mem_idx = "aa"; // 임시
		dto.setMem_idx(mem_idx);
		dto.setMissing_idx(missingDao.makeIdx("MS"));
		int result = missingDao.missingWrite(dto);
		String msg=result>0?"게시물등록성공":"게시물등록실패";		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("help/missing/missingWriteOk");
		return mav;
	}

	@RequestMapping(value="/missingContent.ju")
	public ModelAndView missingContent(String missing_idx){
		MissingDTO dto=missingDao.missingContent(missing_idx);
		MissingDTO preInfo = missingDao.preInfo(missing_idx);
		MissingDTO nextInfo = missingDao.nextInfo(missing_idx);
		ModelAndView mav=new ModelAndView("help/missing/missingContent","dto",dto);
		mav.addObject("pre", preInfo);
		mav.addObject("next", nextInfo);
		return mav;
		
	}
	
	@RequestMapping("/missingDelete.ju")
	public ModelAndView missingDelete(@RequestParam(value="missing_idx") String missing_idx ){
		int result=missingDao.missingDelete(missing_idx);
		String msg=result>0?"게시물 삭제 성공":"게시물 삭제 실패";
		ModelAndView mav=new ModelAndView("help/missing/deleteMsg","msg",msg);
		return mav;
	}
	
	@RequestMapping("/missingChange.ju")
	public ModelAndView missingChange(@RequestParam(value="missing_idx") String missing_idx){
		MissingDTO dto=missingDao.missingChange(missing_idx);
		ModelAndView mav=new ModelAndView("help/missing/missingChange","dto",dto);
		return mav;
	}
	
	@RequestMapping("/missingChangeOk.ju")
	public ModelAndView missingChangeOk(MissingDTO dto){
		int result=missingDao.missingChangeOk(dto);
		String msg=result>0?"게시물 수정 성공":"게시물 수정 실패";
		ModelAndView mav=new ModelAndView("help/missing/changeMsg","msg",msg);
		return mav;
	}
	
	
	/* Qna 게시판 관련 메소드 */
	@RequestMapping("/questList.ju")
	public ModelAndView questList(@RequestParam(value="type", defaultValue="qu_subject")String type,
			@RequestParam(value="query", defaultValue="")String query,
			@RequestParam(value="page", defaultValue="1")int page){
	
		int totalCount = qnaDao.qnaTotalCount(); // 총 게시물
		int totalPage = totalCount/COUNTLIST; // 전체 페이지 수
		if(totalCount % COUNTLIST > 0){ // 정확한 페이지 수 계산
			totalPage++;
		}
		
		if(page>totalPage && totalPage!=0){ // 페이지가 총 페이지를 넘어가면 마지막 페이지로 돌림 
			page = totalPage;
		}else if(page < 1){  // 페이지가 1보다 작으면 1로 유지
			page = 1;
		}
		
		int startPage = ((page-1)/COUNTPAGE)*COUNTPAGE+1;	// 시작 페이지
		int endPage = startPage + COUNTPAGE -1; // 끝 페이지
		if(endPage > totalPage){  // 끝 페이지가 총페이지보다 크면 마지막으로 초기화
			endPage = totalPage;
		}			
		String sql = "select b.* from (select rownum as rnum, a.* from(select qu_idx, qu_cate, qu_subject, mem_idx, qu_date, qu_readnum from quest where "+ type +" like '%" + query + "%' order by qu_date desc)a)b WHERE b.rnum >= "+((page-1)*COUNTLIST+1)+" and b.rnum <= "+(page*COUNTLIST);
		System.out.println(sql);
		List<QnaDTO> list=qnaDao.qnaList(sql); //DTO 그릇에 DAO에있는 리스트를 담아서
		ModelAndView mav=new ModelAndView("help/quest/questList","list",list); //이 페이지로 보낸다 리스트를같이
		mav.addObject("page", page);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		
		return mav;
	}
	
	
	@RequestMapping("/questWrite.ju")
	public ModelAndView questWrite(HttpSession session){
		String sid = (String)session.getAttribute("sid");
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/quest/questWrite");
		mav.addObject("sid", sid);
		return mav;
	}
	
	@RequestMapping("/questWriteOk.ju")
	public ModelAndView questWriteOk(QnaDTO dto, HttpSession session){
		String mem_idx = (String)session.getAttribute("sidx");
		mem_idx = "aa"; // 임시
		dto.setMem_idx(mem_idx);
		dto.setQu_idx(qnaDao.makeIdx("QU"));
		dto.setQu_qidx("bb");//임시
		int result = qnaDao.qnaWrite(dto);
		String msg=result>0?"게시물등록성공":"게시물등록실패";		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("help/quest/questWriteOk");
		return mav;
	}
	
	
	
	@RequestMapping(value="/questContent.ju")
	public ModelAndView questContent(String qu_idx){
		QnaDTO dto=qnaDao.qnaContent(qu_idx);
		QnaDTO preInfo = qnaDao.qnaPreInfo(qu_idx);
		QnaDTO nextInfo = qnaDao.qnaNextInfo(qu_idx);
		ModelAndView mav=new ModelAndView("help/quest/questContent","dto",dto);
		mav.addObject("pre", preInfo);
		mav.addObject("next", nextInfo);
		return mav;
		
	}
	
	@RequestMapping("/questDelete.ju")
	public ModelAndView questDelete(@RequestParam(value="qu_idx") String qu_idx ){
		int result=qnaDao.qnaDelete(qu_idx);
		String msg=result>0?"게시물 삭제 성공":"게시물 삭제 실패";
		ModelAndView mav=new ModelAndView("help/quest/deleteMsg","msg",msg);
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
