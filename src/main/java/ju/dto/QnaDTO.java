package ju.dto;

import java.sql.Date;

public class QnaDTO {
	private String qu_idx; 
	private String qu_qidx; 
	private int qu_cate;
	private String qu_subject; 
	private String qu_content; 
	private String mem_idx; 
	private Date qu_date; 
	private int qu_readnum;
	private int qu_screct;
	private int qu_faq;
	
	public QnaDTO() {
		// TODO Auto-generated constructor stub
	}

	public QnaDTO(String qu_idx, String qu_qidx, int qu_cate, String qu_subject, String qu_content, String mem_idx, Date qu_date, int qu_readnum, int qu_screct, int qu_faq) {
		super();
		this.qu_idx = qu_idx;
		this.qu_qidx = qu_qidx;
		this.qu_cate = qu_cate;
		this.qu_subject = qu_subject;
		this.qu_content = qu_content;
		this.mem_idx = mem_idx;
		this.qu_date = qu_date;
		this.qu_readnum = qu_readnum;
		this.qu_screct = qu_screct;
		this.qu_faq = qu_faq;
	}

	public String getQu_idx() {
		return qu_idx;
	}

	public void setQu_idx(String qu_idx) {
		this.qu_idx = qu_idx;
	}

	public String getQu_qidx() {
		return qu_qidx;
	}

	public void setQu_qidx(String qu_qidx) {
		this.qu_qidx = qu_qidx;
	}

	public int getQu_cate() {
		return qu_cate;
	}

	public void setQu_cate(int qu_cate) {
		this.qu_cate = qu_cate;
	}

	public String getQu_subject() {
		return qu_subject;
	}

	public void setQu_subject(String qu_subject) {
		this.qu_subject = qu_subject;
	}

	public String getQu_content() {
		return qu_content;
	}

	public void setQu_content(String qu_content) {
		this.qu_content = qu_content;
	}

	public String getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}

	public Date getQu_date() {
		return qu_date;
	}

	public void setQu_date(Date qu_date) {
		this.qu_date = qu_date;
	}

	public int getQu_readnum() {
		return qu_readnum;
	}

	public void setQu_readnum(int qu_readnum) {
		this.qu_readnum = qu_readnum;
	}

	public int getQu_screct() {
		return qu_screct;
	}

	public void setQu_screct(int qu_screct) {
		this.qu_screct = qu_screct;
	}

	public int getQu_faq() {
		return qu_faq;
	}

	public void setQu_faq(int qu_faq) {
		this.qu_faq = qu_faq;
	}
	
	
}
