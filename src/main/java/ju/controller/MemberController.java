package ju.controller;



import java.io.IOException;
import java.sql.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

//import ju.dto.*;
import ju.model.*;
import ju.dto.*;

@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	MemberDAO memberDao;
	@Autowired
	LoanDAO loanDao;
// 단순 화면이동
	//회원가입 폼 불러오기
	@RequestMapping(value="/memberJoin.ju")
	public String joinForm(){
		return "member/memberJoin";	
	}
	//도서관 카드
	@RequestMapping(value="/myCard.ju")
	public String myCard(){
		return "member/myCard";
	}
	
//대출/예약
	@RequestMapping(value="/aboutMybook.ju")
	public ModelAndView aboutMybook(
			HttpSession session){
		String mem_idx = (String)session.getAttribute("sidx");
		List<AboutMyBookDTO> loanlist =  memberDao.aboutMybookLoan(mem_idx);
		List<AboutMyBookDTO> fedexlist = memberDao.aboutMybookfedex(mem_idx);
		List<AboutMyBookDTO> yeyaklist = memberDao.aboutMybookYeyak(mem_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("loanlist", loanlist);
		mav.addObject("fedexlist", fedexlist);
		mav.addObject("yeyaklist", yeyaklist);
		mav.setViewName("member/aboutMybook");
		return mav;
	}
	
//전자도서
	@RequestMapping(value="/aboutEbook.ju")
	public String aboutEbook(){
		return "member/aboutEbook";
	}
	//회원정보 수정
	@RequestMapping(value="/changeMe.ju")
	public ModelAndView changeMe(
			HttpSession session){
		ModelAndView mav = new ModelAndView();
		String mem_idx = ""; 
		mem_idx = (String)session.getAttribute("sidx");
		if(mem_idx==null || mem_idx.equals("")){
			mav.setViewName("member/changeMe");
		}else{
			System.out.println("넘어온 mem_idx :" + mem_idx);
			MemberDTO dto = memberDao.pwCheck(mem_idx);
			mav.addObject("dto", dto);
			mav.setViewName("member/changeMe");
		}
		
		return mav;
	}
	@RequestMapping(value="/changeMeOk.ju")
	public ModelAndView changeMeOk(MemberDTO dto,
			HttpSession session){
		
		String mem_idx = (String)session.getAttribute("sidx");
		dto.setMem_idx(mem_idx);
		int result = memberDao.changeMeSubmit(dto);
		ModelAndView mav = new ModelAndView();
		
		if(result>0){
			mav.setViewName("index");
		}else{
			mav.setViewName("changeMe.ju");
		}
		
		
		return mav;
	}
	
	//나의문의
	@RequestMapping(value="/myQna.ju")
	public String myQna(){
		return "member/myQna";
	}
	
	//회원탈퇴
	@RequestMapping(value="/memberOut.ju")
	public ModelAndView memberOut(
			HttpSession session){
		ModelAndView mav = new ModelAndView();
		String mem_idx = ""; 
		mem_idx = (String)session.getAttribute("sidx");
		
		if(mem_idx==null || mem_idx.equals("")){
			mav.setViewName("member/memberOut");
			
		}else{
			System.out.println("out 에서 mem_idx :"+mem_idx);
			List<LoanDTO> list = loanDao.loanList(mem_idx);
			System.out.println("out 에서 받아온 list길이 :"+list.size());
			MemberDTO dto = memberDao.pwCheck(mem_idx);
			mav.addObject("list",list.size());
			mav.addObject("dto", dto);
			mav.setViewName("member/memberOut");		
		}
		return mav;
	}
	
	@RequestMapping(value="/memberOutOk.ju")
	public ModelAndView memberOutOk(
			HttpSession session){
		String mem_idx = (String)session.getAttribute("sidx");
		int result = memberDao.memberDel(mem_idx);
		ModelAndView mav = new ModelAndView();
		if(result>0){
			session.invalidate();
			mav.setViewName("index");
		}else{
			mav.setViewName("index");
		}
		return mav;
		
	}
	
	
//	//이메일(아이디)중복검사
	@RequestMapping(value="/mailCheck.ju")
	public void mailCheck(
			@RequestParam(value="email",defaultValue="")
			String email, HttpServletResponse response){
		
		
		System.out.println("email = " + email);
		int count = memberDao.mailCheck(email);
		
		System.out.println("count = "+count);
		
		try {
			response.getWriter().print(count);
		} catch (IOException e) {
			
			e.printStackTrace();
		}  
		
	}
	
	@RequestMapping(value="/checkHp.ju")
	public void checkHp(
			@RequestParam(value="mem_hp",defaultValue="")
			String mem_hp, HttpServletResponse response){
		
		System.out.println("email = " + mem_hp);
		int count = memberDao.checkHp(mem_hp);
		
		System.out.println("count = "+count);
		try {
			response.getWriter().print(count);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
	}
	
//비밀번호 체크(회원정보수정, 회원탈퇴)
	@RequestMapping(value="/checkPw.ju")
	public void checkPw(
			@RequestParam(value="input_pwd",defaultValue="")String input_pwd,
			@RequestParam(value="mem_idx",defaultValue="")String mem_idx,
			HttpServletResponse response){
		
		MemberDTO dto = memberDao.pwCheck(mem_idx);
		String pwd = dto.getMem_pwd();
		System.out.println("input_pwd : "+input_pwd+"/ pwd : "+pwd);
		int result;
		if(input_pwd.equals(pwd)){
			System.out.println("//암호검사 통과");
			result = 1;
			
		}else{
			
			System.out.println("//암호검사 불!!!! 통과");
			result = 2;
		}
		
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			
			e.printStackTrace();
		}  
		
		
	}
	
	@RequestMapping(value="/mailAccept.ju")
	public void mailAccept(
			@RequestParam(value="mem_id",defaultValue="")
			String mem_id, HttpServletResponse response){
		
		System.out.println("이메일 인증 넘어온 mem_id : "+ mem_id);
		
		String keylist="abcdefghijklmnopqrstuvwxyz123456789";
    	String code = "";
    	for(int i = 0 ; i < 8 ; i++){
    		code+= keylist.charAt((int)Math.floor(Math.random()*keylist.length()));
    	}
		
		
		EmailDAO dao = new EmailDAO();
		dao.sendEmail2(mem_id, code);
		
		
		try {
			System.out.println("code 저장 = "+code);
			response.getWriter().print(code);
		} catch (IOException e) {
			
			e.printStackTrace();
		}  
		
	}
	
	@RequestMapping(value="/memberJoinOk.ju")
	public String joinSubmit(MemberDTO dto) throws InterruptedException{
        //client ip
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null)
            ip = req.getRemoteAddr();
		
		//log 넣는 부분
		if( dto.getMem_id()!=null ){
			//mail파싱
			String mail[] = dto.getMem_id().split("@");
			mail = mail[1].split("\\.");
			//birth 파싱
			String birth[] = dto.getMem_birth().split("~");
			
			String s = "join{ip:"+ip+",mail:"+mail[0]+",birth:"+birth[0]+",gender:"+birth[1]+",like:"+dto.getMem_like()+"}";
			log.info(s);
		}
		String idx = "";
		Long unixTime=System.currentTimeMillis();
        idx="MB"+unixTime;
        System.out.print(idx + " / " + unixTime + " /// ");
        
		 dto.setMem_idx(idx);
		int result = memberDao.joinSubmit(dto);
		if(result>0){
			System.out.println("가입성공");
			return "index";
		}else{
			return "member/memberJoin";
		}
		
		
	}
	
	@RequestMapping(value="/login.ju")
	public String loginForm(){
		
		return "member/memberLogin";
		
	}
	@RequestMapping(value="/memberLoginOk.ju")
	public ModelAndView loginOk(
			@RequestParam(value="mem_id",defaultValue="")String mem_id,
			@RequestParam(value="mem_pwd",defaultValue="")String mem_pwd,
			HttpSession session){
		//get client ip
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null){
        	ip = req.getRemoteAddr();
        }
		
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = memberDao.loginSubmit(mem_id, mem_pwd);
		
		if(dto==null || dto.getMem_name().equals("black")){
			
			mav.setViewName("member/memberLogin");
			return mav;
		}else{
			String s = "login{ip:"+ip+",id:"+dto.getMem_id()+"}";
			log.info(s);
			session.setAttribute("sid", dto.getMem_id());
			session.setAttribute("sname", dto.getMem_name());
			session.setAttribute("sidx", dto.getMem_idx());
			mav.setViewName("index");
			return mav;
			
		}
		
	}
	
	@RequestMapping(value="/logout.ju")
	public ModelAndView logOut(
			HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		
		mav.setViewName("index");
		
		return mav;
	}
	
	
	@RequestMapping(value="/getHoliday.ju")
	public ModelAndView getHoliday(
			@RequestParam(value="yr",defaultValue="2017")String yr_s,
			@RequestParam(value="mon",defaultValue="6")String mon_s){
		
		ModelAndView mav = new ModelAndView();
		int yr = Integer.parseInt(yr_s);
		int mon = Integer.parseInt(mon_s);
		
//		System.out.println(yr+"/"+mon);
		List<HolidayDTO> hdto = memberDao.getHoliday(yr,mon);
		
		
		mav.addObject("hdto", hdto);
		mav.setViewName("juJson");
		
		
		return mav; 
	}
	
	@RequestMapping(value="/getHolidayFC.ju")
	public ModelAndView getHolidayFC(
			@RequestParam(value="yr")String yr_s){
		
		ModelAndView mav = new ModelAndView();
		int yr = Integer.parseInt(yr_s);
		
		
		System.out.println(yr+"년");
		List<HolidayDTO> hdto = memberDao.getHolidayFC(yr);
		
		
		mav.addObject("hdto", hdto);
		mav.setViewName("juJson");
		
		
		return mav; 
	}
	
	@RequestMapping(value="/addHoliday.ju")
	public void addHoliday(@RequestParam(value="memo",defaultValue="")String memo,
			@RequestParam(value="solar_date",defaultValue="")String solar_date,
			HttpServletResponse response){
		
		int result = memberDao.addHoliday(memo, solar_date);
		
		try{
			
			if(result > 0){
				response.getWriter().print("삭제성공");
			}else{
				response.getWriter().print("삭제실패");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="/delHoliday.ju")
	public void delHoliday(
			@RequestParam(value="memo",defaultValue="")String memo,
			@RequestParam(value="solar_date",defaultValue="")String solar_date,
			HttpServletResponse response){
		
		int result = memberDao.delHoliday(memo, solar_date);
		
		try{
			
			if(result > 0){
				response.getWriter().print("삭제성공");
			}else{
				response.getWriter().print("삭제실패");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
