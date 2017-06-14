package ju.dto;

import java.sql.Date;

public class StudyRoomDTO {
	
	private String sr_idx;
	private int sr_roomno;
	private String mem_idx;
	private java.sql.Date sr_reqdate;
	private java.sql.Date sr_resdate;
	private int sr_time;
	private String sr_etc;
	
	public StudyRoomDTO() {
		super();
	}

	public StudyRoomDTO(String sr_idx, int sr_roomno, String mem_idx, Date sr_reqdate, Date sr_resdate, int sr_time,
			String sr_etc) {
		super();
		this.sr_idx = sr_idx;
		this.sr_roomno = sr_roomno;
		this.mem_idx = mem_idx;
		this.sr_reqdate = sr_reqdate;
		this.sr_resdate = sr_resdate;
		this.sr_time = sr_time;
		this.sr_etc = sr_etc;
	}
	
	public String getSr_idx() {
		return sr_idx;
	}
	public void setSr_idx(String sr_idx) {
		this.sr_idx = sr_idx;
	}
	public int getSr_roomno() {
		return sr_roomno;
	}
	public void setSr_roomno(int sr_roomno) {
		this.sr_roomno = sr_roomno;
	}
	public String getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}
	public java.sql.Date getSr_reqdate() {
		return sr_reqdate;
	}
	public void setSr_reqdate(java.sql.Date sr_reqdate) {
		this.sr_reqdate = sr_reqdate;
	}
	public java.sql.Date getSr_resdate() {
		return sr_resdate;
	}
	public void setSr_resdate(java.sql.Date sr_resdate) {
		this.sr_resdate = sr_resdate;
	}
	public int getSr_time() {
		return sr_time;
	}
	public void setSr_time(int sr_time) {
		this.sr_time = sr_time;
	}
	public String getSr_etc() {
		return sr_etc;
	}
	public void setSr_etc(String sr_etc) {
		this.sr_etc = sr_etc;
	}
}
