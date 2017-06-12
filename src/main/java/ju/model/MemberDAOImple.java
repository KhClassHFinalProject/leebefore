package ju.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.*;

public class MemberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<MemberDTO> memberList(int cp, int ls){
		int startnum=(cp-1)*ls+1;
		int endnum = cp*ls;
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<MemberDTO> list = sqlMap.selectList("memSELList",map);
		return list;
	}
	
	public List<MemberDTO> memberListSearch(int cp, int ls,String mem_name){
		int startnum=(cp-1)*ls+1;
		int endnum = cp*ls;
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("mem_name", mem_name+"%");
		List<MemberDTO> list = sqlMap.selectList("memSELSearch",map);
		return list;
	}
	
	public MemberDTO memberInfo(String mem_idx){
		MemberDTO dto = sqlMap.selectOne("memSELInfo",mem_idx);
		return dto;
	}
	
	public int banCount(String mem_idx){
		int count = sqlMap.selectOne("banSELCount",mem_idx);
		return count;
	}
	
	public int getTotlaCnt(){
		int result = sqlMap.selectOne("memtotalCnt");
		return result;
	}
	
	public List<LoanDTO> memberLoan(String mem_idx){
		List<LoanDTO> list = sqlMap.selectList("memSELLoan",mem_idx);
		return list;
	}
	
	public int memberDel(String mem_idx){
		int result = sqlMap.delete("memDEL",mem_idx);
		System.out.println(result);
		return result;
	}
	
	public BanDTO memberBanInfo(String mem_idx){
		BanDTO dto = sqlMap.selectOne("banSELInfo",mem_idx);
		if(dto==null){
			dto = new BanDTO();
		}
		return dto;
	}
	
	public BanDTO memberLoanBan(String mem_idx){
		BanDTO dto = sqlMap.selectOne("memSELBan",mem_idx);
		return dto;
	}
	
	public int banAdd(BanDTO dto, int ban_period){
		Map<String,Object> bkMap=new HashMap<String,Object>();
		bkMap.put("ban_end",ban_period);
		bkMap.put("dto", dto);
		int result=sqlMap.insert("banINSBan",bkMap);
		return result;
	}
	
	public int banDel(String mem_idx){
		int result=sqlMap.delete("banUPBan",mem_idx);
		return result;
	}
	
	
//	대원 추가 6월 11일 일 시작
	public MemberDAOImple() {
		super();
	}


	public int joinSubmit(MemberDTO dto) {
		
		int count = sqlMap.insert("memINSjoin", dto);
		return count;
	}

	public int mailCheck(String mem_id) {
		System.out.println("mem_id = "+mem_id);
		int count = sqlMap.selectOne("memSELcheckmail", mem_id);
				
		return count;
	}

	public int loginForm(String mem_id, String mem_pwd) {

		return 0;
	}

	public int checkHp(String mem_hp) {
		System.out.println("mem_id = "+mem_hp);
		int count = sqlMap.selectOne("memSELcheckhp", mem_hp);
				
		return count;
	}
	
	public MemberDTO loginSubmit(String mem_id, String mem_pwd) {
		
		HashMap<String,String> map = new HashMap<String, String>();
//		System.out.println(mem_id+"/"+mem_pwd);
		map.put("mem_id", mem_id);
		map.put("mem_pwd", mem_pwd);
		MemberDTO dto = sqlMap.selectOne("memSELlogin", map);
		
		if(dto==null || dto.getMem_idx().equals("")){
			//로그인 실패시
			dto.setMem_name("nolog");
			return dto;
		}else{
			
			System.out.println("로그인 성공");
			//로그인 성공시 블랙리스트 확인
			String mem_idx = dto.getMem_idx();
			System.out.println(mem_idx);
			//String whe = "MEM_IDX='"+mem_idx+"' and BAN_START<=SYSDATE and BAN_END>=SYSDATE";
			int count = sqlMap.selectOne("memSELcheckban",mem_idx);
			System.out.println("count : "+count);
			

			if(count>0){
				dto.setMem_name("black");
				return dto;
			}else{
				return dto;
			}
					
		}
		
	}
	

	
	public List<HolidayDTO> getHoliday(int yr, int mon) {
		String wh = "";
		if(mon==12){
			wh = 
					"solar_date >= '"+yr+"-"+mon+"-"+"01' and solar_date < '"+yr+"-"+01+"-"+"01'";
		}else{
		wh = 
				"solar_date >= '"+yr+"-"+mon+"-"+"01' and solar_date < '"+yr+"-"+(mon+1)+"-"+"01'";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("wh", wh);
		List<HolidayDTO> hdto = sqlMap.selectList("holidaySELget", map);
//		System.out.println("음력 : "+hdto.get(0).getLunar_Date());
//		System.out.println("양력 : "+hdto.get(0).getSolar_Date());
		return hdto;
	}
	
	public List<HolidayDTO> getHolidayFC(int yr) {
		String wh="solar_date >= '"+yr+"-01-01' and solar_date < '"+yr+"-12-31'";
		System.out.println("진입! wh : " + wh);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("wh", wh);
		List<HolidayDTO> hdto = sqlMap.selectList("holidaySELget", map);

		return hdto;
	}
	
	public int addHoliday(String memo, String solarDate) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memo", memo);
		map.put("solarDate",solarDate);
		int result = sqlMap.insert("holidayINSadd", map);

		return result;
	}
	
	public int delHoliday(String memo, String solarDate) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memo", memo);
		map.put("solarDate",solarDate);
		int result = sqlMap.insert("holidayDELdel", map);

		return result;
	}
	
	
//	대원 추가 6월 11일 일 끝
}