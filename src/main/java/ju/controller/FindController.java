package ju.controller;

import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import ju.dto.FindDTO;
import ju.find.model.FindDAO;

@Controller
public class FindController {
	
	Logger log = Logger.getLogger(this.getClass());

	final int COUNTPAGE = 5;
	final int COUNTLIST = 5;
	@Autowired
	FindDAO FindDao;
	
	
	@RequestMapping(value="/bkList.ju")
	public ModelAndView bkList(){
		ModelAndView mav = new ModelAndView("/find/bkList");
		return mav;
	}
	
	@RequestMapping(value="/bkDetailSearch.ju")
	public ModelAndView bkDetailSearch(@RequestParam(value="bk_lg", defaultValue="99")int bk_lg,
			@RequestParam(value="bk_md", defaultValue="99")int bk_md,
			@RequestParam(value="query", defaultValue="")String query,
			@RequestParam(value="bk_writer", defaultValue="")String bk_writer,
			@RequestParam(value="bk_publisher", defaultValue="")String bk_publisher,
			@RequestParam(value="page", defaultValue="1")int page){
		if( !("".equals(query)) ){
			log.info(query+"/");
		}
		boolean chk[] = {false, false, false, false, false};
		String chkQuery[] = {"", "", "", "", ""};
		String subQuery = "";
		int chkCount = 0;
		if(bk_lg!=99){
			chkCount++;
			chk[0] = true;
			chkQuery[0] += "bk_lg = " + bk_lg; 
		}
		if(bk_md!=99){
			chkCount++;
			chk[1] = true;
			chkQuery[1] += "bk_md = " + bk_md; 
		}
		if( !("".equals(bk_writer)) ){
			chkCount++;
			chk[2] = true;
			chkQuery[2] += "bk_writer like '%" + bk_writer + "%'";
		}
		if( !("".equals(bk_publisher)) ){
			chkCount++;
			chk[3] = true;
			chkQuery[3] += "bk_publisher like '%" + bk_publisher + "%'";
		}
		if( !("".equals(query)) ){
			chkCount++;
			chk[4] = true;
			chkQuery[4] += "bk_subject like '%" + query + "%'";
		}
		
		// 5개중 하나라도 값이 있다면 
		if(chkCount>0){
			subQuery += "WHERE ";
			for (int i = 0; i < chk.length; i++) {
				if( (chkCount!=1) && chk[i] ){
					subQuery += chkQuery[i]+ " and ";
					chkCount--;
				}else if( (chkCount==1) && chk[i] ){
					subQuery += chkQuery[i];
				}
			}
		}
		
		//신쿼리
		String sql = "SElECT X.rnum, X.bk_subject, X.bk_writer, X.bk_publisher, X.bk_url, X.bk_info FROM (SELECT rownum AS rnum, A.bk_subject, A.bk_writer, A.bk_publisher, A.bk_url, A.bk_info FROM (SELECT bk_subject, bk_writer, bk_publisher, bk_url, bk_info FROM book "+ subQuery +" group by bk_subject, bk_writer, bk_publisher, bk_url, bk_info ORDER BY bk_subject)A WHERE rownum <= "+(page*COUNTLIST)+") X WHERE X.rnum >= "+((page-1)*COUNTLIST+1);
		String totalPagesSql = "SELECT sum(count(distinct bk_subject)) FROM book " + subQuery + " group by bk_subject";
		//기존 쿼리
//		String sql = "SElECT X.rnum, X.bk_idx, X.bk_subject, X.bk_writer, X.bk_publisher, X.bk_url, X.bk_info FROM (SELECT rownum AS rnum, A.bk_idx, A.bk_subject, A.bk_writer, A.bk_publisher, A.bk_url, A.bk_info FROM (SELECT bk_idx, bk_subject, bk_writer, bk_publisher, bk_url, bk_info FROM book "+ subQuery +" ORDER BY bk_idx) A WHERE rownum <= "+(page*COUNTLIST)+") X WHERE X.rnum >= "+((page-1)*COUNTLIST+1);
//		String totalPagesSql = "SELECT count(*) FROM book " + subQuery + " ORDER BY bk_idx";
		int totalCount = FindDao.totalPages(totalPagesSql);
		int totalPage = totalCount/COUNTLIST;
		if(totalCount % COUNTLIST > 0){
			totalPage++;
		}
		
		if(page>totalPage && totalPage!=0){
			page = totalPage;
		}else if(page < 1){
			page = 1;
		}
		
		int startPage = ((page-1)/10)*10+1;
		int endPage = startPage + COUNTPAGE -1;
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		ModelAndView mav = new ModelAndView();
		List<FindDTO> list = FindDao.bkList(sql);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("page", page);
		mav.addObject("list", list);
		mav.setViewName("juJson");
		return mav;
	}
	
	
	@RequestMapping(value="/bkRefresh.ju")
	public ModelAndView bkRefresh(@RequestParam(value="bk_subject")String bk_subject){
		int sumBktake = FindDao.sumBktake(bk_subject);
		int countBkSubject = FindDao.countBkSubject(bk_subject);
		sumBktake = countBkSubject-sumBktake;
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("juJson");
		mav.addObject("count", sumBktake);
		return mav;
	}
	
	@RequestMapping(value="/bkYeyak.ju")
	public ModelAndView bkYeyak(@RequestParam(value="bk_subject")String bk_subject,
			HttpSession session){
		String sid = (String)session.getAttribute("sid");
		sid = "gift8128@gmail.com";// 임시
		int countYeyak = FindDao.getCountYeyak(sid);
		int count = 0;
		int ye_sunbun = 9;
		if(countYeyak<3){
			String ye_idx = FindDao.getIdx("ye");
			List<String> chkBook = FindDao.chkBook(bk_subject);
			
			for (int i = 0; i < chkBook.size(); i++) {
				int chkYeyak = FindDao.chkYeyak(sid, chkBook.get(i));
				if(chkYeyak==0){// 해당 해원이 해당 도서를 예약한 적이 없어야함
					ye_sunbun = FindDao.yeyakSunbun(chkBook.get(i));
					if(ye_sunbun<6){
						ye_sunbun++;
						count = FindDao.bkYeyak(ye_idx , chkBook.get(i), sid, ye_sunbun);// count = 1 정상 예약
						break;
					}else{
						count = 80;// 책 예약 횟수 초과
					}
				}else if(chkYeyak==1){
					count = 90;// 이미 예약 함
					break;
				}
			}
		}else{
			count = 70;//예약 횟수 초과
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("juJson");
		mav.addObject("count", count);
		mav.addObject("ye_sunbun", ye_sunbun);
		return mav;
	}
	
	@RequestMapping(value="/bkFedex.ju")
	public ModelAndView bkFedex(@RequestParam(value="bk_subject")String bk_subject,
			HttpSession session){
		String sid = (String)session.getAttribute("sid");
		sid = "gift8128@gmail.com";// 임시
		int getTotalCountLoan = FindDao.getTotalCountLoan(sid);
		
		int count = 0;//실패
		if(getTotalCountLoan<3){
			String fedex_idx = FindDao.getIdx("fd");
			List<String> chkBook = FindDao.chkBook(bk_subject);
			for (int i = 0; i < chkBook.size(); i++) {
				int chkFedex = FindDao.chkFedexbook(chkBook.get(i));
				if(chkFedex!=1){
					int chkLoanbook = FindDao.chkLoanbook(chkBook.get(i));
					if(chkLoanbook==0){
						int bkFedex = FindDao.bkFedex(fedex_idx, sid, chkBook.get(i));
						count = bkFedex; //대출됨
						break;
					}else{
						count = 80;
					}
				}else{
					count = 70;
					break;
				}
				
			}
			
		}else{
			count = 90;// 총 3권 넘게 대출함
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("juJson");
		mav.addObject("count", count);
		return mav;
	}
	
	
	
	@RequestMapping(value="/bkView.ju")
	public ModelAndView bkView(@RequestParam(value="bk_subject")String bk_subject){
		List<FindDTO> list = FindDao.bkView(bk_subject);
		int sumBktake = FindDao.sumBktake(bk_subject);
//		for (int i = 0; i < list.size(); i++) {
//			sumBktake += FindDao.chkLoanbook(list.get(i).getBk_idx());
//		}
		int countBkSubject = FindDao.countBkSubject(bk_subject);
		sumBktake = countBkSubject-sumBktake;
		ModelAndView mav = new ModelAndView();
		mav.setViewName("juJson");
		mav.addObject("list", list.get(0));
		mav.addObject("sumBktake", sumBktake);
		mav.addObject("countBkSubject", countBkSubject);
		return mav;
	}
	
//	@RequestMapping(value="/test.ju")
//	public ModelAndView test(){
//		File f = new File("../LOG/book/searchList.log");
//		
//		System.out.println("경로 :" + f.getAbsoluteFile().getPath());
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		ValueComparator bvc =  new ValueComparator(map);
//        TreeMap<String,Integer> sorted_map = new TreeMap<String,Integer>(bvc);
//        
//		if(f.exists()){
//			try {
//				System.out.println("파일있음");
//				
//				////////////////////////////////////////////////////////////////
//				BufferedReader in = new BufferedReader(new FileReader(f));
//				String s;
//				
//				while ((s = in.readLine()) != null) {
//					System.out.println("s : "+s);
//					String arr[] = s.split("/");
//					
//					for (int i = 0; i < arr.length; i++) {
//						if(map.get(arr[i])==null){
//							map.put(arr[i], 1);
//						}else{
//							int count = map.get(arr[i])+1;
//							map.put(arr[i], count);
//							
//						}
//					}
//				}
//				in.close();
//			} catch (Exception e) {
//			}
//		}else{
//			System.out.println("파일없음");
//		}
//		
//		sorted_map.putAll(map);
//        
//		String json = "[";
//		int count = 0;
//        for (Map.Entry<String,Integer> entry : sorted_map.entrySet()) {
//            //정렬한 리스트에서 순번을 배열번호로 변경하여 원본 리스트에서 추출
//        	count++;
//        	if(count>7){
//        		break;
//    		}else{
//    			json += "{text:'" + entry.getKey() + "', count:'" + map.get(entry.getKey()) + "'},";
//    		}
//        }
//        json = json.substring(0, json.length()-1);
//        json += "]";
//		
//		
//		
//		ModelAndView mav = new ModelAndView("/find/test");
//		System.out.println(json);
//		mav.addObject("list", json);
//		return mav;
//	}
	
	@RequestMapping(value="/dash.ju")
	public ModelAndView dash(){
		ModelAndView mav = new ModelAndView("/dash/index");
		return mav;
	}
	@RequestMapping(value="/charts.ju")
	public ModelAndView chart(){
		ModelAndView mav = new ModelAndView("/dash/charts");
		return mav;
	}
	
	class ValueComparator implements Comparator<String> {
		 
	    Map<String, Integer> base;
	     
	    public ValueComparator(Map<String, Integer> base) {
	        this.base = base;
	    }
	 
	    // Note: this comparator imposes orderings that are inconsistent with equals.    
	    public int compare(String a, String b) {
	        if (base.get(a) >= base.get(b)) { //반대로 하면 오름차순 <=
	            return -1;
	        } else {
	            return 1;
	        } // returning 0 would merge keys
	    }
	}


	

}
