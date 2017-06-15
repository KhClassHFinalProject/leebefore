package ju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import ju.dto.*;
import ju.model.*;

@Controller
public class adminLoanBookController {

	@Autowired
	public LoanDAO loanDao;	
	
	@Autowired
	public BookDAO bookDao;
	
	@Autowired
	public YeyakDAO yeyakDao;
	
	@Autowired
	public FedexDAO fedexDao;
	
	@Autowired
<<<<<<< HEAD
	public ju.model.MemberDAO memberDao;
=======
	public MemberDAO memberDao;
>>>>>>> Daewon
	
	
	// 대출관리 메인페이지로 이동
		@RequestMapping("/loanbookList.ju")
		public ModelAndView loanbookList(){
			List<LoanDTO> list = loanDao.loanList();
			List<LoanDTO> list2 = loanDao.loanListAfter();
			String dateFormat="yyyy-MM-dd";
			SimpleDateFormat sdf=new SimpleDateFormat(dateFormat);
			List<String> sdList = new ArrayList<String>();
			for(int i=0; i<list.size(); i++){
				/*list.add((sdf.format(list.get(i).getLb_sd(i))));
				list.get(i).setLb_sd(sdList.get(i));*/
			}
			List<String> edList = new ArrayList<String>();
			for(int i=0; i<list.size(); i++){
				edList.add((sdf.format(list.get(i).getLb_ed())));
			}
			
			for(int i=0; i<list.size(); i++){
				String bk_isbn = list.get(i).getBk_isbn();
				System.out.println(bk_isbn);
				int count = loanDao.yeyakNum(bk_isbn);
				System.out.println(count);
				list.get(i).setBk_yeyak(count);
			}
			
			for(int i=0; i<list.size(); i++){
				int info = list.get(i).getLb_return();
				
				switch(info){
				case 0: list.get(i).setLb_returnStr("반납됨"); break;
				case 1: list.get(i).setLb_returnStr("일반대출중"); break;
				case 2: list.get(i).setLb_returnStr("택배대출중"); break;
				}
			}
			
			for(int i=0; i<list2.size(); i++){
				int info = list2.get(i).getLb_return();
				
				switch(info){
				case 0: list2.get(i).setLb_returnStr("반납됨"); break;
				case 1: list2.get(i).setLb_returnStr("일반대출중"); break;
				case 2: list2.get(i).setLb_returnStr("택배대출중"); break;
				}
			}
			
			ModelAndView mav = new ModelAndView("admin/loanbookManage/loanbookList","list",list);
			mav.addObject("sdList",sdList);
			mav.addObject("edList",edList);
			mav.addObject("list2",list2);
			return mav;
		}
		
	// 반납페이지로 이동
		@RequestMapping(value="/checkIn.ju",method=RequestMethod.GET)
		public ModelAndView checkIn(){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("admin/loanbookManage/checkIn");
			return mav;
		}
		
	// 대출페이지로 이동
		@RequestMapping(value="/checkOut.ju",method=RequestMethod.GET)
		public ModelAndView checkOut(){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("admin/loanbookManage/checkOut");
			return mav;
		}
		
		
	// 반납도서 정보페이지로 이동
		@RequestMapping(value="/loanbookInfo2.ju",method=RequestMethod.GET)
		public ModelAndView loanbookInfo2(String bk_idx){
			BookDTO dto = bookDao.bookReInfo(bk_idx);
			ModelAndView mav = new ModelAndView("admin/loanbookManage/loanbookInfo","dto",dto);
			return mav;
		}
				
	// 대출하기
		@RequestMapping(value="/checkOut2.ju",method=RequestMethod.GET)
		public ModelAndView checkOutStart(
				@RequestParam(value="bk_idx",defaultValue="0")String bk_idx,
				LoanDTO dto,HttpSession session){
			ModelAndView mav = null;
			int count = loanDao.loanOne(bk_idx);
			BookDTO dto2 = bookDao.bookInfo(bk_idx);
			String isbn = dto2.getBk_isbn();
			System.out.println(isbn);
			System.out.println(count);
			if(count==0){
				MemberDTO mdto=(MemberDTO)session.getAttribute("dto");
				String mem_idx=mdto.getMem_idx();
				Long unixTime=System.currentTimeMillis();
				String lb_idx="LB"+unixTime;
				dto.setLb_idx(lb_idx);
				dto.setMem_idx(mem_idx);
				dto.setBook_idx(bk_idx);
				dto.setLb_return(1);
				System.out.println("메일보내기전");
				int result = bookDao.bookTakeUpdate(bk_idx);
				int sunbun = yeyakDao.yeyakUp(isbn);
				int set = loanDao.checkOutGo(dto);
				
				List<YeyakDTO> list = yeyakDao.yeyakList(isbn);
				if(list.size()!=0){
					System.out.println("메일보내기 위한 리스트 추출="+list);
					System.out.println(list.get(0).getMem_idx());
					String ye_mem="";
					for(int i=0; i<list.size(); i++){
						ye_mem = list.get(0).getMem_idx();
					}
					System.out.println("1순번 idx ="+ye_mem);
					MemberDTO memdto = memberDao.memberInfo(ye_mem);
					String ye_id = memdto.getMem_id();
					System.out.println("1순번 mail ="+ye_id);
					
					String content="예약하신 도서의 대출순번이 1순위가 되셨습니다. 2일안에 빌리지 못하시면 우선순위가 사라지십니다. 자세한 사항은 문의주세요";
					EmailDAO dao = new EmailDAO();
					dao.sendEmail(ye_id, content);
				}
				
				System.out.println("컨트롤러dto: " + dto);
				String msg = set>0?"도서 대출":"도서 대출 실패";
				mav = new ModelAndView("admin/adminMsg","msg",msg);
				mav.addObject("page","loanbookList.ju");
			}else{
				String msg = "이미 대출중인 도서입니다. 다른도서를 빌려주세요";
				mav = new ModelAndView("admin/adminMsg","msg",msg);
				mav.addObject("page","loanbookList.ju");
			}
			return mav;
		}
		
	// 예약 순번 빼기
		@RequestMapping("/sunbunDel.ju")
		public ModelAndView sunbunDel(
				@RequestParam(value="bk_isbn",defaultValue="0")String bk_isbn,
				@RequestParam(value="mem_idx",defaultValue="0")String mem_idx){
			int result = yeyakDao.yeyakDel(mem_idx);
			int count = yeyakDao.yeyakUp(bk_isbn);
			String msg = result>0?"예약순번 삭제":"예약순번 삭제";
			ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","yeyakList.ju");
			return mav;
		}
	
	// 반납하기
		@RequestMapping(value="/checkIn2.ju",method=RequestMethod.GET)
		public ModelAndView checkInStart(
				@RequestParam(value="bk_idx",defaultValue="0")String bk_idx,
				@RequestParam(value="bk_isbn",defaultValue="0")String bk_isbn,
				@RequestParam(value="lb_return",defaultValue="1")int lb_return){
			int result = bookDao.bookReUpdate(bk_idx);
			if(lb_return==2){
				int re = fedexDao.fedexDel(bk_idx);
			}
			int count = loanDao.checkInGo(bk_idx);
			int yeyak = yeyakDao.yeyakOne(bk_isbn);
			String msg = "";
			if(yeyak!=0){
				msg = "예약이 된 도서입니다. 따로 보관 바랍니다.";
			}else{
				msg = count>0?"도서 반납":"도서 반납 실패";
			}
			ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","loanbookList.ju");
			return mav;
		}
		
	// 예약자 관리
		@RequestMapping("yeyakList.ju")
		public ModelAndView yeyakList(
				@RequestParam(value="bk_isbn",defaultValue="0")String bk_isbn){
			List<YeyakDTO> list = yeyakDao.yeyakList(bk_isbn);
			ModelAndView mav = new ModelAndView("admin/loanbookManage/yeyakList","list",list);
			return mav;
		}
		
	// 메일보내기
		@RequestMapping("/mailSend.ju")
		public ModelAndView mailSend(
				@RequestParam(value="mem_id",defaultValue="0")String mem_id){

			String content="책 반납 하루 전입니다.";
	    	EmailDAO dao = new EmailDAO();
	    	dao.sendEmail(mem_id, content);
	    	String msg = "메일전송 완료";
	    	ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
	    	mav.addObject("page","loanbookList.ju");
			return mav;
		}
}
