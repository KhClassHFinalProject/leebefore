package ju.dto;

import java.sql.Date;

public class MissingDTO {
	private String missing_idx;
	private int missing_cate;
	private String missing_subject;
	private String missing_content;
	private Date missing_date;
	private String mem_idx;
	private int missing_readnum;
	private int missing_ref;
	private int missing_lev;
	private int missing_sunbun;
	
	
	public MissingDTO() {
		// TODO Auto-generated constructor stub
	}


	/**
	 * @param missing_idx
	 * @param missing_cate
	 * @param missing_subject
	 * @param missing_content
	 * @param missing_date
	 * @param mem_idx
	 * @param missing_readnum
	 * @param missing_ref
	 * @param missing_lev
	 * @param missing_sunbun
	 */
	public MissingDTO(String missing_idx, int missing_cate, String missing_subject, String missing_content, Date missing_date, String mem_idx, int missing_readnum, int missing_ref, int missing_lev, int missing_sunbun) {
		super();
		this.missing_idx = missing_idx;
		this.missing_cate = missing_cate;
		this.missing_subject = missing_subject;
		this.missing_content = missing_content;
		this.missing_date = missing_date;
		this.mem_idx = mem_idx;
		this.missing_readnum = missing_readnum;
		this.missing_ref = missing_ref;
		this.missing_lev = missing_lev;
		this.missing_sunbun = missing_sunbun;
	}


	public String getMissing_idx() {
		return missing_idx;
	}


	public void setMissing_idx(String missing_idx) {
		this.missing_idx = missing_idx;
	}


	public int getMissing_cate() {
		return missing_cate;
	}


	public void setMissing_cate(int missing_cate) {
		this.missing_cate = missing_cate;
	}


	public String getMissing_subject() {
		return missing_subject;
	}


	public void setMissing_subject(String missing_subject) {
		this.missing_subject = missing_subject;
	}


	public String getMissing_content() {
		return missing_content;
	}


	public void setMissing_content(String missing_content) {
		this.missing_content = missing_content;
	}


	public Date getMissing_date() {
		return missing_date;
	}


	public void setMissing_date(Date missing_date) {
		this.missing_date = missing_date;
	}


	public String getMem_idx() {
		return mem_idx;
	}


	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}


	public int getMissing_readnum() {
		return missing_readnum;
	}


	public void setMissing_readnum(int missing_readnum) {
		this.missing_readnum = missing_readnum;
	}


	public int getMissing_ref() {
		return missing_ref;
	}


	public void setMissing_ref(int missing_ref) {
		this.missing_ref = missing_ref;
	}


	public int getMissing_lev() {
		return missing_lev;
	}


	public void setMissing_lev(int missing_lev) {
		this.missing_lev = missing_lev;
	}


	public int getMissing_sunbun() {
		return missing_sunbun;
	}


	public void setMissing_sunbun(int missing_sunbun) {
		this.missing_sunbun = missing_sunbun;
	}
	
	
}
