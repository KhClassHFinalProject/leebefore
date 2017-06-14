package ju.booking.model;

import ju.dto.MemberDTO;
import ju.dto.RefRoomDTO;
import ju.dto.StudyRoomDTO;

import java.text.ParseException;
import java.util.*;

public interface BookingDAO {
	
	/**apply empty seat*/
	public int booking(RefRoomDTO dto);
	
	/**check empty seat*/
	public List<RefRoomDTO> rrCheck(int rr_cate);
	
	public java.util.Date getStart() throws ParseException;
	
	public int srBook(StudyRoomDTO dto);
	
	public List<StudyRoomDTO> srCheck(String date);
	
	public int srCancel(int roomno, int time);
	
	public String srUserCheck(int roomno, int time, String resdate);
	
	public MemberDTO bigBarcodeLogin(String mem_idx);
	
	public RefRoomDTO bigBarcodeCheck(String mem_idx);
	
	public int returnSeat(String rr_idx);
	
	public int bigAddTime(String rr_idx, String rr_add_s);
	
	public int adminSeatDisabled(RefRoomDTO dto);
	
	public RefRoomDTO adminSeatInfo(int seatno,int cate);
	
	public int adminRoomDisabled(StudyRoomDTO dto);
	
	public StudyRoomDTO adminRoomInfo(int roomno, int time, String resdate);
}
