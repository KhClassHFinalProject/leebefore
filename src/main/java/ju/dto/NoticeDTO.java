package ju.dto;

import java.sql.Date;

public class NoticeDTO {

	private String nt_idx;
	private String nt_cate;
	private String nt_subject;
	private String nt_content;
	private Date nt_date;
	private String mem_idx;
	private int nt_readnum;
	private int nt_ref;
	private int nt_lev;
	private int nt_sunbun;
	
	public NoticeDTO() {
		super();
	}

	public NoticeDTO(String nt_idx, String nt_cate, String nt_subject, String nt_content, Date nt_date, String mem_idx,
			int nt_readnum, int nt_ref, int nt_lev, int nt_sunbun) {
		super();
		this.nt_idx = nt_idx;
		this.nt_cate = nt_cate;
		this.nt_subject = nt_subject;
		this.nt_content = nt_content;
		this.nt_date = nt_date;
		this.mem_idx = mem_idx;
		this.nt_readnum = nt_readnum;
		this.nt_ref = nt_ref;
		this.nt_lev = nt_lev;
		this.nt_sunbun = nt_sunbun;
	}


	public String getNt_idx() {
		return nt_idx;
	}


	public void setNt_idx(String nt_idx) {
		this.nt_idx = nt_idx;
	}


	public String getNt_cate() {
		return nt_cate;
	}


	public void setNt_cate(String nt_cate) {
		this.nt_cate = nt_cate;
	}


	public String getNt_subject() {
		return nt_subject;
	}


	public void setNt_subject(String nt_subject) {
		this.nt_subject = nt_subject;
	}


	public String getNt_content() {
		return nt_content;
	}


	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}


	public Date getNt_date() {
		return nt_date;
	}


	public void setNt_date(Date nt_date) {
		this.nt_date = nt_date;
	}


	public String getMem_idx() {
		return mem_idx;
	}


	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}


	public int getNt_readnum() {
		return nt_readnum;
	}


	public void setNt_readnum(int nt_readnum) {
		this.nt_readnum = nt_readnum;
	}


	public int getNt_ref() {
		return nt_ref;
	}


	public void setNt_ref(int nt_ref) {
		this.nt_ref = nt_ref;
	}


	public int getNt_lev() {
		return nt_lev;
	}


	public void setNt_lev(int nt_lev) {
		this.nt_lev = nt_lev;
	}


	public int getNt_sunbun() {
		return nt_sunbun;
	}


	public void setNt_sunbun(int nt_sunbun) {
		this.nt_sunbun = nt_sunbun;
	}
	
	
}
