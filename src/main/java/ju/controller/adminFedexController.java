package ju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;
import ju.dto.*;
import ju.model.*;

@Controller
public class adminFedexController {
	
	@Autowired
	public FedexDAO fedexDao;
	
	@Autowired

	public MemberDAO memberDao;

	
	@Autowired
	public BookDAO bookDao;
	
	@Autowired
	public LoanDAO loanDao;

	@RequestMapping("/fedexList.ju")
	public ModelAndView fedexList(){
		List<FedexDTO> list = fedexDao.fedexBeforeList();
		List<FedexDTO> list2 = fedexDao.fedexAfterList();
		ModelAndView mav = new ModelAndView("admin/fedexManage/fedexList","list",list);
		mav.addObject("list2",list2);
		return mav;
	}
	
	// 택배 신청 정보 가져오기
	@RequestMapping("/fedexInfo.ju")
	public ModelAndView fedexInfo(String mem_idx, String bk_idx,String fedex_idx){
		MemberDTO dto = memberDao.memberInfo(mem_idx);
		BookDTO dto2 = bookDao.bookInfo(bk_idx);
		ModelAndView mav = new ModelAndView("admin/fedexManage/fedexInfo","dto",dto);
		mav.addObject("dto2",dto2);
		mav.addObject("fedex_idx",fedex_idx);
		System.out.println(mem_idx);
		System.out.println(bk_idx);
		System.out.println("택배idx"+fedex_idx);
		return mav;
	}
	
	// 택배대출하기
		@RequestMapping(value="/fedexCheckOut.ju",method=RequestMethod.GET)
		public ModelAndView fedexCheckOut(String bk_idx, String mem_idx, LoanDTO dto, FedexDTO dto2, String fedex_idx){
			Long unixTime=System.currentTimeMillis();
			String lb_idx="LB"+unixTime;
			dto.setLb_idx(lb_idx);
			dto.setMem_idx(mem_idx);
			dto.setBook_idx(bk_idx);
			dto.setLb_return(2);
			int result = bookDao.bookTakeUpdate(bk_idx);
			int count = loanDao.checkOutGo(dto);
	
			dto2.setMem_idx(mem_idx);
			dto2.setBk_idx(bk_idx);
			dto2.setLb_idx(lb_idx);
			System.out.println("택배책정보:"+dto2.getBk_idx());
			System.out.println("택배회원정보:"+dto2.getMem_idx());
			System.out.println("택배대출책정보:"+dto2.getLb_idx());
			System.out.println("넘어온 택배idx"+fedex_idx);
			int fedexCount = fedexDao.fedexCheckOut(dto2, fedex_idx);
			System.out.println("최종디비다녀옴");
			ModelAndView mav = new ModelAndView("admin/fedexManage/fedexList","dto",dto);
			mav.addObject("dto2",dto2);
			return mav;
		}
}
