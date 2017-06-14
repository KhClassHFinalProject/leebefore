package ju.model;
import java.util.*;
import ju.dto.*;

public interface MemberDAO {

	public List<MemberDTO> memberList(int cp, int ls);
	public List<MemberDTO> memberListSearch(int cp, int ls,String mem_name);
	public MemberDTO memberInfo(String mem_idx);
	public int banAdd(BanDTO dto, int ban_period);
	public BanDTO memberBanInfo(String mem_idx);
	public int banDel(String mem_idx);
	public BanDTO memberLoanBan(String mem_idx);
	public int banCount(String mem_idx);
	public List<LoanDTO> memberLoan(String mem_idx);
	public int memberDel(String mem_idx);
	public int getTotlaCnt();
	
	
	//대원 추가 6월 11일 일 시작
		public int joinSubmit(MemberDTO dto);
		public int mailCheck(String mem_id);
		public int loginForm(String mem_id, String mem_pwd);
		public MemberDTO loginSubmit(String mem_id, String mem_pwd);
		
		public int checkHp(String mem_hp);
	//캘린더 관련
		public List<HolidayDTO> getHoliday(int yr, int mon);
		
		public List<HolidayDTO> getHolidayFC(int yr);
		
		public int addHoliday(String memo, String solarDate);
		
		public int delHoliday(String memo, String solarDate);
	//대원 추가 6월 11일 일 끝
}