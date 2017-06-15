package ju.dto;

import java.util.Date;

public class AboutMyBookDTO {
	//책
	private String bk_idx;
	private String bk_lg;
	private String bk_md;
	private String bk_small;
	private String bk_subject;
	private String bk_writer;
	private String bk_isbn;
	private String bk_publisher;
	private String bk_writedate;
	private String bk_url;
	private String bk_info;
	private int bk_break;
	private int bk_take;
	private String mem_idx;
	private String bk_breakStr;
	
	//전자도서
	private String el_idx;
	private String el_lg;
	private String el_md;
	private String el_subject;
	private String el_writer;
	private String el_pub;
	private String el_info;
	private String el_path;
	private String el_recommend;
	private int el_recocount;
	
	//대출
	private String lb_idx;
	
	private String book_idx;
	private Date lb_sd;
	private Date lb_ed;
	private String lb_etc;
	private int lb_return;
	private int lb_delay;
	
	//예약
	private String ye_idx;
	
	
	private Date ye_date;
	private int ye_sunbun;
	
	
	//택배
	private String fedex_idx;

	private int fedex_num;
	
	public AboutMyBookDTO() {
		super();
	}


	public AboutMyBookDTO(String bk_idx, String bk_lg, String bk_md, String bk_small, String bk_subject,
			String bk_writer, String bk_isbn, String bk_publisher, String bk_writedate, String bk_url, String bk_info,
			int bk_break, int bk_take, String mem_idx, String bk_breakStr, String book_idx, String ye_idx, Date ye_date,
			int ye_sunbun) {
		super();
		this.bk_idx = bk_idx;
		this.bk_lg = bk_lg;
		this.bk_md = bk_md;
		this.bk_small = bk_small;
		this.bk_subject = bk_subject;
		this.bk_writer = bk_writer;
		this.bk_isbn = bk_isbn;
		this.bk_publisher = bk_publisher;
		this.bk_writedate = bk_writedate;
		this.bk_url = bk_url;
		this.bk_info = bk_info;
		this.bk_break = bk_break;
		this.bk_take = bk_take;
		this.mem_idx = mem_idx;
		this.bk_breakStr = bk_breakStr;
		this.book_idx = book_idx;
		this.ye_idx = ye_idx;
		this.ye_date = ye_date;
		this.ye_sunbun = ye_sunbun;
	}


	public AboutMyBookDTO(String bk_idx, String bk_lg, String bk_md, String bk_small, String bk_subject,
			String bk_writer, String bk_isbn, String bk_publisher, String bk_writedate, String bk_url, String bk_info,
			int bk_break, int bk_take, String mem_idx, String bk_breakStr, String lb_idx, String book_idx, Date lb_sd,
			Date lb_ed, String lb_etc, int lb_return, int lb_delay) {
		super();
		this.bk_idx = bk_idx;
		this.bk_lg = bk_lg;
		this.bk_md = bk_md;
		this.bk_small = bk_small;
		this.bk_subject = bk_subject;
		this.bk_writer = bk_writer;
		this.bk_isbn = bk_isbn;
		this.bk_publisher = bk_publisher;
		this.bk_writedate = bk_writedate;
		this.bk_url = bk_url;
		this.bk_info = bk_info;
		this.bk_break = bk_break;
		this.bk_take = bk_take;
		this.mem_idx = mem_idx;
		this.bk_breakStr = bk_breakStr;
		this.lb_idx = lb_idx;
		this.book_idx = book_idx;
		this.lb_sd = lb_sd;
		this.lb_ed = lb_ed;
		this.lb_etc = lb_etc;
		this.lb_return = lb_return;
		this.lb_delay = lb_delay;
	}

	

	public AboutMyBookDTO(String bk_idx, String bk_lg, String bk_md, String bk_small, String bk_subject,
			String bk_writer, String bk_isbn, String bk_publisher, String bk_writedate, String bk_url, String bk_info,
			int bk_break, int bk_take, String mem_idx, String bk_breakStr, String lb_idx, String book_idx, Date lb_sd,
			Date lb_ed, String lb_etc, int lb_return, int lb_delay, String fedex_idx, int fedex_num) {
		super();
		this.bk_idx = bk_idx;
		this.bk_lg = bk_lg;
		this.bk_md = bk_md;
		this.bk_small = bk_small;
		this.bk_subject = bk_subject;
		this.bk_writer = bk_writer;
		this.bk_isbn = bk_isbn;
		this.bk_publisher = bk_publisher;
		this.bk_writedate = bk_writedate;
		this.bk_url = bk_url;
		this.bk_info = bk_info;
		this.bk_break = bk_break;
		this.bk_take = bk_take;
		this.mem_idx = mem_idx;
		this.bk_breakStr = bk_breakStr;
		this.lb_idx = lb_idx;
		this.book_idx = book_idx;
		this.lb_sd = lb_sd;
		this.lb_ed = lb_ed;
		this.lb_etc = lb_etc;
		this.lb_return = lb_return;
		this.lb_delay = lb_delay;
		this.fedex_idx = fedex_idx;
		this.fedex_num = fedex_num;
	}

	

	public AboutMyBookDTO(String el_idx, String el_lg, String el_md, String el_subject, String el_writer, String el_pub,
			String el_info, String el_path, String el_recommend, int el_recocount, String lb_idx, String book_idx,
			Date lb_sd, Date lb_ed, String lb_etc, int lb_return, int lb_delay) {
		super();
		this.el_idx = el_idx;
		this.el_lg = el_lg;
		this.el_md = el_md;
		this.el_subject = el_subject;
		this.el_writer = el_writer;
		this.el_pub = el_pub;
		this.el_info = el_info;
		this.el_path = el_path;
		this.el_recommend = el_recommend;
		this.el_recocount = el_recocount;
		this.lb_idx = lb_idx;
		this.book_idx = book_idx;
		this.lb_sd = lb_sd;
		this.lb_ed = lb_ed;
		this.lb_etc = lb_etc;
		this.lb_return = lb_return;
		this.lb_delay = lb_delay;
	}


	public String getBk_idx() {
		return bk_idx;
	}


	public void setBk_idx(String bk_idx) {
		this.bk_idx = bk_idx;
	}


	public String getBk_lg() {
		return bk_lg;
	}


	public void setBk_lg(String bk_lg) {
		this.bk_lg = bk_lg;
	}


	public String getBk_md() {
		return bk_md;
	}


	public void setBk_md(String bk_md) {
		this.bk_md = bk_md;
	}


	public String getBk_small() {
		return bk_small;
	}


	public void setBk_small(String bk_small) {
		this.bk_small = bk_small;
	}


	public String getBk_subject() {
		return bk_subject;
	}


	public void setBk_subject(String bk_subject) {
		this.bk_subject = bk_subject;
	}


	public String getBk_writer() {
		return bk_writer;
	}


	public void setBk_writer(String bk_writer) {
		this.bk_writer = bk_writer;
	}


	public String getBk_isbn() {
		return bk_isbn;
	}


	public void setBk_isbn(String bk_isbn) {
		this.bk_isbn = bk_isbn;
	}


	public String getBk_publisher() {
		return bk_publisher;
	}


	public void setBk_publisher(String bk_publisher) {
		this.bk_publisher = bk_publisher;
	}


	public String getBk_writedate() {
		return bk_writedate;
	}


	public void setBk_writedate(String bk_writedate) {
		this.bk_writedate = bk_writedate;
	}


	public String getBk_url() {
		return bk_url;
	}


	public void setBk_url(String bk_url) {
		this.bk_url = bk_url;
	}


	public String getBk_info() {
		return bk_info;
	}


	public void setBk_info(String bk_info) {
		this.bk_info = bk_info;
	}


	public int getBk_break() {
		return bk_break;
	}


	public void setBk_break(int bk_break) {
		this.bk_break = bk_break;
	}


	public int getBk_take() {
		return bk_take;
	}


	public void setBk_take(int bk_take) {
		this.bk_take = bk_take;
	}


	public String getMem_idx() {
		return mem_idx;
	}


	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}


	public String getBk_breakStr() {
		return bk_breakStr;
	}


	public void setBk_breakStr(String bk_breakStr) {
		this.bk_breakStr = bk_breakStr;
	}


	public String getLb_idx() {
		return lb_idx;
	}


	public void setLb_idx(String lb_idx) {
		this.lb_idx = lb_idx;
	}


	public String getBook_idx() {
		return book_idx;
	}


	public void setBook_idx(String book_idx) {
		this.book_idx = book_idx;
	}


	public Date getLb_sd() {
		return lb_sd;
	}


	public void setLb_sd(Date lb_sd) {
		this.lb_sd = lb_sd;
	}


	public Date getLb_ed() {
		return lb_ed;
	}


	public void setLb_ed(Date lb_ed) {
		this.lb_ed = lb_ed;
	}


	public String getLb_etc() {
		return lb_etc;
	}


	public void setLb_etc(String lb_etc) {
		this.lb_etc = lb_etc;
	}


	public int getLb_return() {
		return lb_return;
	}


	public void setLb_return(int lb_return) {
		this.lb_return = lb_return;
	}


	public int getLb_delay() {
		return lb_delay;
	}


	public void setLb_delay(int lb_delay) {
		this.lb_delay = lb_delay;
	}


	public String getYe_idx() {
		return ye_idx;
	}


	public void setYe_idx(String ye_idx) {
		this.ye_idx = ye_idx;
	}


	public Date getYe_date() {
		return ye_date;
	}


	public void setYe_date(Date ye_date) {
		this.ye_date = ye_date;
	}


	public int getYe_sunbun() {
		return ye_sunbun;
	}


	public void setYe_sunbun(int ye_sunbun) {
		this.ye_sunbun = ye_sunbun;
	}


	public String getFedex_idx() {
		return fedex_idx;
	}


	public void setFedex_idx(String fedex_idx) {
		this.fedex_idx = fedex_idx;
	}


	public int getFedex_num() {
		return fedex_num;
	}


	public void setFedex_num(int fedex_num) {
		this.fedex_num = fedex_num;
	}
	


	public String getEl_idx() {
		return el_idx;
	}


	public void setEl_idx(String el_idx) {
		this.el_idx = el_idx;
	}


	public String getEl_lg() {
		return el_lg;
	}


	public void setEl_lg(String el_lg) {
		this.el_lg = el_lg;
	}


	public String getEl_md() {
		return el_md;
	}


	public void setEl_md(String el_md) {
		this.el_md = el_md;
	}


	public String getEl_subject() {
		return el_subject;
	}


	public void setEl_subject(String el_subject) {
		this.el_subject = el_subject;
	}


	public String getEl_writer() {
		return el_writer;
	}


	public void setEl_writer(String el_writer) {
		this.el_writer = el_writer;
	}


	public String getEl_pub() {
		return el_pub;
	}


	public void setEl_pub(String el_pub) {
		this.el_pub = el_pub;
	}


	public String getEl_info() {
		return el_info;
	}


	public void setEl_info(String el_info) {
		this.el_info = el_info;
	}


	public String getEl_path() {
		return el_path;
	}


	public void setEl_path(String el_path) {
		this.el_path = el_path;
	}


	public String getEl_recommend() {
		return el_recommend;
	}


	public void setEl_recommend(String el_recommend) {
		this.el_recommend = el_recommend;
	}


	public int getEl_recocount() {
		return el_recocount;
	}


	public void setEl_recocount(int el_recocount) {
		this.el_recocount = el_recocount;
	}

	
	
	
}
