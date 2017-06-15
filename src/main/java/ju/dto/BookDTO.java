package ju.dto;

public class BookDTO {

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
	private int lb_return;
	
	public BookDTO() {
		super();
	}

	

	public BookDTO(String bk_idx, String bk_lg, String bk_md, String bk_small, String bk_subject, String bk_writer,
			String bk_isbn, String bk_publisher, String bk_writedate, String bk_url, String bk_info, int bk_break,
			int bk_take, String mem_idx, String bk_breakStr, int lb_return) {
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
		this.lb_return = lb_return;
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

	public int getLb_return() {
		return lb_return;
	}

	public void setLb_return(int lb_return) {
		this.lb_return = lb_return;
	}

	
}
