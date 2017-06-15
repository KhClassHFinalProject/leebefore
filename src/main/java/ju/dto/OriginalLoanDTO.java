package ju.dto;

import java.util.Date;

public class OriginalLoanDTO {
	
	private String lb_idx;
	private String mem_idx;
	private String book_idx;
	private Date lb_sd;
	private Date lb_ed;
	private String lb_etc;
	private int lb_return;
	private int lb_delay;
	
	public OriginalLoanDTO() {
	}

	public OriginalLoanDTO(String lb_idx, String mem_idx, String book_idx, Date lb_sd, Date lb_ed, String lb_etc,
			int lb_return, int lb_delay) {
		super();
		this.lb_idx = lb_idx;
		this.mem_idx = mem_idx;
		this.book_idx = book_idx;
		this.lb_sd = lb_sd;
		this.lb_ed = lb_ed;
		this.lb_etc = lb_etc;
		this.lb_return = lb_return;
		this.lb_delay = lb_delay;
	}

	public String getLb_idx() {
		return lb_idx;
	}

	public void setLb_idx(String lb_idx) {
		this.lb_idx = lb_idx;
	}

	public String getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
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
	
}