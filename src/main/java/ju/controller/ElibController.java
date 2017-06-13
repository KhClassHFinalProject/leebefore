package ju.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ju.dto.ElibDTO;
import ju.dto.LoanDTO;
import ju.elib.model.ElibDAO;
import ju.model.LoanDAO;
import ju.modul.BookCateModul;
import ju.modul.ElibPaging;

@Controller
public class ElibController {
	
	@Autowired
	private ElibDAO elibDAO;
	@Autowired
	private LoanDAO loandao;
	
	/** 전자도서관 메인 */
	@RequestMapping(value="ebookMain.ju")
	public ModelAndView eMain() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("ebook/ebookMain");
		return mav;
	}
	
	/**ebook 메인*/
	@RequestMapping(value="ebook.ju")
	public ModelAndView ebook() {
		BookCateModul bcm=new BookCateModul();
		String bookLgSelect=bcm.BookLgSelect(0, 7, true);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("bookLgSelect", bookLgSelect);
		mav.setViewName("ebook/ebook");
		return mav;
	}
	
	/**eMagazine 메인*/
	@RequestMapping(value="eMagazine.ju")
	public ModelAndView eMagazine() {
		BookCateModul bcm=new BookCateModul();
		String bookLgSelect=bcm.BookLgSelect(8, 8, false);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("bookLgSelect", bookLgSelect);
		mav.setViewName("ebook/eMagazine");
		return mav;
	}
	
	/**eEdu 메인*/
	@RequestMapping(value="eEdu.ju")
	public ModelAndView eEdu() {
		BookCateModul bcm=new BookCateModul();
		String bookLgSelect=bcm.BookLgSelect(9, 9, false);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("bookLgSelect", bookLgSelect);
		mav.setViewName("ebook/eEdu");
		return mav;
	}
	
	/**소분류 고침 Ajax*/
	@RequestMapping(value="elibCate.ju")
	public ModelAndView ebookCate(@RequestParam(value="cateLgVal", defaultValue="0")int cateLgVal) {
		BookCateModul bcm=new BookCateModul();
		ArrayList<String> cateMd=bcm.BookMdArr(cateLgVal);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("cateMd", cateMd);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**최초 접근 검색내용*/
	@RequestMapping(value="elibFirst.ju")
	public ModelAndView elibFirst(
		@RequestParam(value="page", defaultValue="1")int page
		, @RequestParam(value="orderName", defaultValue="new")String orderName 
		, @RequestParam(value="idxParam", defaultValue="EB" )String idxParam
		) {
		orderName="new".equals(orderName)?"el_idx DESC":"el_recocount DESC, el_idx DESC";
		
		int startNum=(page-1)*ElibPaging.CONTENTSIZE+1;
		int endNum=startNum+ElibPaging.CONTENTSIZE-1;
		
		List<ElibDTO> elibArr=elibDAO.elibFirst(orderName, startNum, endNum, idxParam);
		int contentMax=elibDAO.elibFirstCount(idxParam);
		String paging=ElibPaging.getPaging(page, contentMax);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("elibArr", elibArr);
		mav.addObject("paging", paging);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**단순 검색*/
	@RequestMapping(value="elibSimpleSearch.ju")
	public ModelAndView elibSimpleSearch(
		@RequestParam(value="simpleSearchText", defaultValue="" )String simpleSearchText
		, @RequestParam(value="page", defaultValue="1" )int page
		, @RequestParam(value="orderName", defaultValue="new" )String orderName
		, @RequestParam(value="idxParam", defaultValue="EB" )String idxParam
		) {
		orderName="new".equals(orderName)?"el_idx DESC":"el_recocount DESC, el_idx DESC";
		
		int startNum=(page-1)*ElibPaging.CONTENTSIZE+1;
		int endNum=startNum+ElibPaging.CONTENTSIZE-1;
		
		List<ElibDTO> elibArr=elibDAO.elibSimple(simpleSearchText, orderName, startNum, endNum, idxParam);
		int contentMax=elibDAO.elibSimpleCount(simpleSearchText, orderName, idxParam);
		String paging=ElibPaging.getPaging(page, contentMax);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("elibArr", elibArr);
		mav.addObject("paging", paging);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**상세 검색*/
	@RequestMapping(value="elibDetailSearch.ju")
	public ModelAndView elibDetailSearch(
		@RequestParam(value="detailSubject", defaultValue="" )String detailSubject
		, @RequestParam(value="detailWrite", defaultValue="" )String detailWrite
		, @RequestParam(value="detailPub", defaultValue="" )String detailPub
		, @RequestParam(value="cateLg", defaultValue="99" )String cateLg
		, @RequestParam(value="cateMd", defaultValue="99" )String cateMd
		, @RequestParam(value="page", defaultValue="1" )int page
		, @RequestParam(value="orderName", defaultValue="new" )String orderName
		, @RequestParam(value="idxParam", defaultValue="EB" )String idxParam
		) {
		
		orderName="new".equals(orderName)?"el_idx DESC":"el_recocount DESC, el_idx DESC";
		
		String where="";
		
		detailSubject="".equals(detailSubject)?"":"el_subject LIKE '%" + detailSubject + "%' ";
		detailWrite="".equals(detailWrite)?"":"el_writer LIKE '%" + detailWrite + "%' ";
		detailPub="".equals(detailPub)?"":"el_pub LIKE '%" + detailPub + "%' ";
		cateLg="99".equals(cateLg)?"":"el_lg='" + cateLg + "' ";
		cateMd="99".equals(cateMd)?"":"el_md='" + cateMd + "' ";
		
		if(!"".equals(detailSubject)) where+=detailSubject;
		if(!"".equals(detailWrite)){
			if("".equals(where)) where+=detailWrite;
			else where+="AND "+detailWrite;
		}
		if(!"".equals(detailPub)){
			if("".equals(where)) where+=detailPub;
			else where+="AND "+detailPub;
		}
		if(!"".equals(cateLg)){
			if("".equals(where)) where+=cateLg;
			else where+="AND "+cateLg;
		}
		if(!"".equals(cateMd)){
			if("".equals(where)) where+=cateMd;
			else where+="AND "+cateMd;
		}
		if(!"".equals(where)){
			where="AND "+where;
		}
		
		int startNum=(page-1)*ElibPaging.CONTENTSIZE+1;
		int endNum=startNum+ElibPaging.CONTENTSIZE-1;
		
		List<ElibDTO> elibArr=elibDAO.elibDetail(where, orderName, startNum, endNum, idxParam);
		
		int contentMax=elibDAO.elibDetailCount(where, orderName, idxParam);
		String paging=ElibPaging.getPaging(page, contentMax);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("elibArr", elibArr);
		mav.addObject("paging", paging);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**전자도서 컨텐츠 선택*/
	@RequestMapping(value="elibContent.ju")
	public ModelAndView elibContent(@RequestParam(value="el_idx", defaultValue="0")String el_idx, HttpServletRequest request) {
		String mem_idx=(String)request.getAttribute("sidx");
		String mem="1";
		if(mem_idx==null || "".equals(mem_idx)){
			mem="0";
		}
		
		List<ElibDTO> elibArr=elibDAO.elibContent(el_idx);
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("elibArr", elibArr.get(0));
		mav.addObject("mem", mem);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**추천 기능 Ajax*/
	@RequestMapping(value="elibRecommend.ju")
	public ModelAndView elibRecommend(
		@RequestParam(value="el_idx", defaultValue="0")String el_idx
		, HttpServletRequest request
		) {
		String mem_idx=(String)request.getAttribute("sidx");
		List<ElibDTO> elibArr=elibDAO.elibContent(el_idx);
		int resultCount=-1;
		int recommend=elibArr.get(0).getEl_recocount();
		if(mem_idx==null || "".equals(mem_idx)){
			// 미 로그인
		}
		else{
			String el_recommend=null;
			if(elibArr.get(0).getEl_recocount()==0){
				el_recommend=mem_idx;
			}
			else{
				String[] recoMem=elibArr.get(0).getEl_recommend().split("~");
				boolean before=true;
				for(int i=0 ; i<recoMem.length ; i++){
					if(recoMem[i].equals(el_idx)){ before=false; break;}
				}
				if(before){
					el_recommend="~" + mem_idx;
				}
			}
			if(el_recommend!=null){
				resultCount=elibDAO.elibRecommend(el_idx, el_recommend); // 업데이트 확인
			}
			recommend=elibDAO.elibContent(el_idx).get(0).getEl_recocount(); // 업뎃 후 다시 가져옴
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("recommend", recommend);
		mav.addObject("resultCount", resultCount);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**전자도서 새로고침 기능 Ajax*/
	@RequestMapping(value="ebookRefresh.ju")
	public ModelAndView ebookRefresh(@RequestParam(value="el_idx", defaultValue="0")String el_idx) {
		int resultCount=loandao.loanOne(el_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("resultCount", resultCount);
		mav.setViewName("juJson");
		return mav;
	}
	
	/**전자도서 대출신청 기능 Ajax*/
	@RequestMapping(value="ebookLoan.ju")
	public ModelAndView ebookLoan(@RequestParam(value="el_idx", defaultValue="0")String el_idx, HttpServletRequest request) {
		String mem_idx=(String)request.getAttribute("sidx");
		int resultCount=0;
		Date endDate=null;
		if(mem_idx==null || "".equals(mem_idx)){ /*미로그인*/ }
		else{
			int memCount=loandao.memCount(mem_idx); // 회원 최대치
			int ebookCount=loandao.loanOne(el_idx); // 책 최대치
			int ebookOverlap=loandao.ebookOverlap(mem_idx, el_idx); // 중복 대여 (0이면 미대여, 1이면 대여)
			if(memCount<5 && ebookCount<5 && ebookOverlap<1){
				String lb_idx="LB"+System.currentTimeMillis();
				resultCount=loandao.elibLoan(lb_idx, mem_idx, el_idx, "#/page/1");
				List<LoanDTO> loanArr=loandao.loanInfo(lb_idx);
				endDate=loanArr.get(0).getLb_ed();
			}
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("resultCount", resultCount);
		mav.addObject("endDate", endDate);
		mav.setViewName("juJson");
		return mav;
	}

}