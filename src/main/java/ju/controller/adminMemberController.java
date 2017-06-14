package ju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ju.dto.*;
import ju.model.*;
import java.util.*;

import javax.servlet.http.HttpSession;

@Controller
public class adminMemberController {

	@Autowired
	public ju.model.MemberDAO memberDao;
	
	@Autowired
	public LoanDAO loanDao;	
	
	
	// 회원관리 페이지로 이동
	@RequestMapping("/memberList.ju")
	public ModelAndView memberList(
			@RequestParam(value="cp",defaultValue="1")int cp){
		int totalCnt = memberDao.getTotlaCnt();// 페이징을 위해
		totalCnt = totalCnt==0?1:totalCnt; // 0이면 1을 반환해주도록 검증
		int listSize = 5;
		int pageSize = 5;
		String pageStr = ju.page.PageModule.pageMake("memberList.ju", totalCnt, listSize, pageSize, cp); // 페이징을 위해 저장
		List<MemberDTO> list = memberDao.memberList(cp, listSize);
		for(int i=0; i<list.size(); i++){
			String birth = list.get(i).getMem_birth().split("~")[0];
			list.get(i).setMem_birth(birth);
		}
		ModelAndView mav = new ModelAndView("admin/memberManage/memberList","list",list);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	// 회원명 검색했을때의 결과 및 페이징
	@RequestMapping(value="/memberList.ju",method=RequestMethod.POST)
	public ModelAndView memberListSearch(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="mem_name",defaultValue="0")String mem_name){
		System.out.println("컨트롤러입성");
		int totalCnt = /*memberDao.getTotlaCnt()*/0;// 페이징을 위해
		totalCnt = totalCnt==0?1:totalCnt; // 0이면 1을 반환해주도록 검증
		int listSize = 5;
		int pageSize = 5;
		String pageStr = ju.page.PageModule.pageMake("memberList.ju", totalCnt, listSize, pageSize, cp); // 페이징을 위해 저장
		List<MemberDTO> list = memberDao.memberListSearch(cp, listSize,mem_name);
		
		ModelAndView mav = new ModelAndView("admin/memberManage/memberList","list",list);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	
	// 회원 정보페이지로 이동
	@RequestMapping(value="memberInfo.ju",method=RequestMethod.GET)
	public ModelAndView memberInfo(String mem_idx){
		MemberDTO dto = memberDao.memberInfo(mem_idx);
		int count = memberDao.banCount(mem_idx);
		List<LoanDTO> list = loanDao.loanList(mem_idx);
		BanDTO dto2 = memberDao.memberBanInfo(mem_idx);
		ModelAndView mav = new ModelAndView("admin/memberManage/memberInfo","dto",dto);
		mav.addObject("list",list);
		mav.addObject("dto2",dto2);
		mav.addObject("count",count);
		mav.addObject("mem_idx", mem_idx);
		return mav;
	}
	
	// 회원 정지 시키기
	@RequestMapping(value="/banAdd.ju",method=RequestMethod.GET)
	public ModelAndView banAdd(
			@RequestParam(value="ban_period", defaultValue="0")int ban_period,
			BanDTO dto){
		System.out.println("컨트롤러");
		Long unixTime=System.currentTimeMillis();
		String ban_idx="BN"+unixTime;
		dto.setBan_idx(ban_idx);
		System.out.println(ban_period);
		int result = memberDao.banAdd(dto, ban_period);
		String msg = result>0?"정지 성공":"정지 실패";
		ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
		String mem_idx = dto.getMem_idx();
		mav.addObject("page","memberInfo.ju?mem_idx="+mem_idx);
		return mav;
	}
	
	// 회원 정지 풀기
	@RequestMapping(value="/banDel.ju",method=RequestMethod.GET)
	public ModelAndView banDel(String mem_idx){
		int result = memberDao.banDel(mem_idx);
		String msg = result>0?"정지해제 성공":"정지해제 실패";
		ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
		mav.addObject("page","memberList.ju");
		return mav;
	}
	
	// 회원 강제 탈퇴
	@RequestMapping(value="/memDel.ju",method=RequestMethod.GET)
	public ModelAndView memDel(String mem_idx){
		List<LoanDTO> list = memberDao.memberLoan(mem_idx);
		System.out.println(list.size());
		System.out.println(mem_idx);
		ModelAndView mav = null;
		if(list.size()==0){
			int result = memberDao.memberDel(mem_idx);
			String msg = result>0?"회원 강제탈퇴 성공":"회원 강제탈퇴 실패";
			mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","memberList.ju");
		}else{
			String msg = "책을 대여중인 회원입니다. 반납 후 탈퇴처리 하십시오.";
			mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","memberInfo.ju?mem_idx="+mem_idx);
		}
		
		return mav;
	}
	
	// 대출 시 회원정보 가져가는 코드
	@RequestMapping(value="memberInfo.ju",method=RequestMethod.POST)
	public ModelAndView memberInfo2(String mem_idx,HttpSession session){
		ModelAndView mav = null;
		BanDTO bandto = memberDao.memberLoanBan(mem_idx);
		System.out.println(bandto);
		if(bandto==null){
			System.out.println("정지안됨");
			MemberDTO dto = memberDao.memberInfo(mem_idx);
			List<LoanDTO> list = loanDao.loanList(mem_idx);
			session.setAttribute("dto", dto);
			mav = new ModelAndView("admin/loanbookManage/checkOut","dto",dto);
			mav.addObject("list",list);	
		}else{
			String msg = "정지된 회원입니다 대출 불가합니다.";
			mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","checkOut.ju");
		}
		return mav;
	}
}
