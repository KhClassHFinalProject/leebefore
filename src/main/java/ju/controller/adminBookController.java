package ju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ju.dto.*;
import ju.model.*;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.*;
import java.net.*;

@Controller
public class adminBookController {

	@Autowired
	public BookDAO bookDao;
	
	@Autowired
	public LoanDAO loanDao;
	
	@Autowired

	public MemberDAO memberDao;

	
	@Autowired
	public YeyakDAO yeyakDao;
	
	// 일반도서 관리페이지로 이동
	@RequestMapping("/bookList.ju")
	public ModelAndView bookList(
			@RequestParam(value="cp",defaultValue="1")int cp){
		int totalCnt = bookDao.getTotlaCnt(); // 페이징을 위해
		totalCnt = totalCnt==0?1:totalCnt; // 0이면 1을 반환해주도록 검증
		int listSize = 5;
		int pageSize = 5;
		String pageStr = ju.page.PageModule.pageMake("bookList.ju", totalCnt, listSize, pageSize, cp); // 페이징을 위해 저장
		List<BookDTO> list = bookDao.bookList(cp, listSize);
		ModelAndView mav = new ModelAndView("admin/bookManage/bookList","list",list);
		
		for(int i=0; i<list.size(); i++){
			int info = list.get(i).getBk_break();
			
			switch(info){
			case 0: list.get(i).setBk_breakStr("정상"); break;
			case 1: list.get(i).setBk_breakStr("분실"); break;
			case 2: list.get(i).setBk_breakStr("파손"); break;
			case 3: list.get(i).setBk_breakStr("교체 예정"); break;
			case 4: list.get(i).setBk_breakStr("폐기");
			}
		}
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	// 셀렉트박스로 클릭했을시 검색결과를 바뀌게 출력하는 구문
	@RequestMapping(value="/bookList.ju",method=RequestMethod.POST)
	public ModelAndView bookListPOST(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="tagNum",defaultValue="0")int value){
		System.out.println(cp);
		System.out.println(value);
		int totalCnt = bookDao.getTotlaCnt(); // 페이징을 위해
		totalCnt = totalCnt==0?1:totalCnt; // 0이면 1을 반환해주도록 검증
		int listSize = 5;
		int pageSize = 5;
		String pageStr = ju.page.PageModule.pageMake("bookList.ju", totalCnt, listSize, pageSize, cp); // 페이징을 위해 저장
		List<BookDTO> list = null;
		switch(value){
		case 0: list = bookDao.bookList(cp, listSize); break;
		case 1: list = bookDao.bookUpList(cp, listSize); break;
		case 2: list = bookDao.bookDownList(cp, listSize); break;
		}
		for(int i=0; i<list.size(); i++){
			int info = list.get(i).getBk_break();
			
			switch(info){
			case 0: list.get(i).setBk_breakStr("정상"); break;
			case 1: list.get(i).setBk_breakStr("분실"); break;
			case 2: list.get(i).setBk_breakStr("파손"); break;
			case 3: list.get(i).setBk_breakStr("교체 예정"); break;
			case 4: list.get(i).setBk_breakStr("폐기");
			}
		}
		ModelAndView mav = new ModelAndView("admin/bookManage/bookList","list",list);
		System.out.println("list : "+ list.get(0).getBk_subject());
		System.out.println("list : "+ list.get(1).getBk_subject());
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	
	// 일반도서 등록페이지로 이동
	@RequestMapping(value="/bookAdd.ju",method=RequestMethod.GET)
	public ModelAndView bookAdd(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/bookManage/bookAdd");
		return mav;
	}
	
	// 일반도서 등록메서드
	@RequestMapping(value="/bookAdd.ju",method=RequestMethod.POST)
	public ModelAndView bookJoin(
		@ModelAttribute("dto")BookDTO dto){
		Long unixTime=System.currentTimeMillis();
		String bk_idx="BK"+unixTime;
		dto.setBk_idx(bk_idx);
		int count = bookDao.bookDuple(dto);
		System.out.println(count);
		count++;
		System.out.println(count);
		 String num = String.valueOf(count);
		dto.setBk_small(num);
		System.out.println(num);
		int result = bookDao.bookAdd(dto);
		String msg = result>0?"도서 등록":"도서 등록 실패";
		ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
		mav.addObject("page","bookList.ju");
		return mav;
	}
	
	// 일반도서 삭제
	@RequestMapping("/bookDel.ju")
	public ModelAndView bookDel(String bk_idx){
		int result = bookDao.bookDel(bk_idx);
		String msg = result>0?"도서 삭제":"도서 삭제 실패";
		ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
		mav.addObject("page","bookList.ju");
		return mav;
	}
	
	// 대출도서 정보페이지로 이동
	@RequestMapping(value="/loanbookInfo.ju",method=RequestMethod.GET)
	public ModelAndView loanbookInfo(String bk_idx,String mem_idx){
		ModelAndView mav = null;
		BookDTO dto = bookDao.bookInfo(bk_idx,mem_idx);
		String isbn = dto.getBk_isbn();
		YeyakDTO dto2 = yeyakDao.yeyakSunbun(isbn);
		System.out.println(dto2.getMem_idx());
		System.out.println(mem_idx);
		if(dto2.getMem_idx()==null){ //예약된 도서가 아닌 책
			System.out.println("예약도서가 아닌책");
			int count = loanDao.loanOne(bk_idx);
			if(count==0){
				System.out.println("대출중아닌책");
				dto.setMem_idx(mem_idx);
				mav = new ModelAndView("admin/loanbookManage/loanbookInfo","dto",dto);
				mav.addObject("mem_idx",mem_idx);
			}else{
				System.out.println("대출중인책");
				String msg = "이미 대출중인 도서입니다. 다른도서를 빌려주세요";
				mav = new ModelAndView("admin/adminMsg","msg",msg);
				mav.addObject("page","checkOut.ju");
			}
		}else{
			System.out.println("예약도서인경우");
			if(dto2.getMem_idx().equals(mem_idx)){ // 예약자와 검색한 사람이 일치
				dto.setMem_idx(mem_idx);
				mav = new ModelAndView("admin/loanbookManage/loanbookInfo","dto",dto);
				mav.addObject("mem_idx",mem_idx);
			}else{ // 예약자와 검색한 사람이 다른 경우
				String msg = "예약도서의 해당 예약자가 아닙니다.";
				mav = new ModelAndView("admin/adminMsg","msg",msg);
				mav.addObject("page","checkOut.ju");
			}
		}
		
		/*int count = loanDao.loanOne(bk_idx);
		if(count==0){
			dto.setMem_idx(mem_idx);
			mav = new ModelAndView("admin/loanbookManage/loanbookInfo","dto",dto);
			mav.addObject("mem_idx",mem_idx);
		}else{
			String msg = "이미 대출중인 도서입니다. 다른도서를 빌려주세요";
			mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","loanbookInfo.ju?mem_idx="+mem_idx);
		}*/
		
		
		return mav;
	}
	
		
	// 일반도서 정보페이지로 이동
	@RequestMapping(value="/bookInfo.ju",method=RequestMethod.GET)
	public ModelAndView bookInfo(String bk_idx){
		BookDTO dto = bookDao.bookInfo(bk_idx);
		ModelAndView mav = new ModelAndView("admin/bookManage/bookInfo","dto",dto);
		return mav;
	}
	
	// 일반도서 파손정보 업데이트
	@RequestMapping(value="/bookInfo.ju",method=RequestMethod.POST)
	public ModelAndView breakCheckUp(
		@RequestParam(value="bk_break",defaultValue="0")int bk_break,
		@RequestParam(value="bk_idx",defaultValue="0")String bk_idx){
		int result = bookDao.bookInfoUpdate(bk_break,bk_idx);
		String msg = result>0?"파손정보 수정성공":"실패";
		ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
		mav.addObject("page","bookInfo.ju?bk_idx="+bk_idx);
		return mav;
	}
	
	
	// 책 검색해서 정보 뽑아오기
	@RequestMapping("/bookAddForm.ju")
	public ModelAndView mookAddForm(String query) throws Exception{
		
		ModelAndView mav = new ModelAndView();
	      // 전달할 변수
	      String title = null;
	      String image = null;
	      String description = null;
	      String author = null;
	      String publisher = null;
	      String isbn = null;
	      
	      //유니코드롤 쿼리로 검색
	      isbn = query;
	        //java코드로 특정 url에 요청보내고 응답받기
	        String clientID="qkgP2gHuMg16GcvTN_aB"; //네이버 개발자 센터에서 발급받은 clientID입력
	        String clientSecret = "MqzAe52lXP";        //네이버 개발자 센터에서 발급받은 clientSecret입력
	        URL url = new URL("https://openapi.naver.com/v1/search/book.xml?query="+query); //API 기본정보의 요청 url을 복사해오고 필수인 query를 적어줍니당! 

	        URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체 
	        
	        urlConn.setRequestProperty("X-Naver-Client-ID", clientID);
	        urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
	    
	        String msg = null;
	        if((msg = br.readLine())!=null){
	           
	           
	           /* data parsing */
	           // title
	           String regex = "<item><title>(\\w|\\W)+(?=<\\/title>)";
	           Pattern pattern  = Pattern.compile(regex);
	           Matcher match = pattern.matcher(msg);
	           if(match.find()){
	              String m = match.group(0);
	              String ms[] = m.split("<item><title>");
	              title = ms[1];
	           }
	           String[] result = title.split("\\(");
	           for(int i=0; i<result.length; i++){
	        	   title = result[0];
	           }
	           // image
	           regex =  "<image>(\\w|\\W)+.jpg";
	           pattern  = Pattern.compile(regex);
	           match = pattern.matcher(msg);
	           if(match.find()){
	              String m = match.group(0);
	              String ms[] = m.split("<image>");
	              image = ms[1];
	           }
	           //author
	           regex =  "<author>(\\w|\\W)+(?=<\\/author>)";
	           pattern  = Pattern.compile(regex);
	           match = pattern.matcher(msg);
	           if(match.find()){
	              String m = match.group(0);
	              String ms[] = m.split("<author>");
	              author = ms[1];
	           }
	           //publisher
	           regex =  "<publisher>(\\w|\\W)+(?=<\\/publisher>)";
	           pattern  = Pattern.compile(regex);
	           match = pattern.matcher(msg);
	           if(match.find()){
	              String m = match.group(0);
	              String ms[] = m.split("<publisher>");
	              publisher = ms[1];
	           }
	           
	           //description
	           regex =  "<\\/isbn><description>(\\w|\\W)+(?=<\\/description><\\/item>)";
	           pattern  = Pattern.compile(regex);
	           match = pattern.matcher(msg);
	           if(match.find()){
	              String m = match.group(0);
	              String ms[] = m.split("</isbn><description>");
	              description = ms[1];
	           }
	           
	           mav.addObject("title",title);
	           mav.addObject("image",image);
	           mav.addObject("author",author);
	           mav.addObject("publisher",publisher);
	           mav.addObject("isbn",isbn);
	           mav.addObject("description",description);
	           
	           mav.setViewName("admin/bookManage/bookAddForm");
	           
	        }// end if
	        return mav;
	    }//end main
	
}
