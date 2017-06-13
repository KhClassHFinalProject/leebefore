package ju.dto;

public class RegistDTO {
	
	private String rg_idx;
	private String mem_idx;
	private String sj_idx;
	
	public RegistDTO() {
		// TODO Auto-generated constructor stub
	}

	public RegistDTO(String rg_idx, String mem_idx, String sj_idx) {
		super();
		this.rg_idx = rg_idx;
		this.mem_idx = mem_idx;
		this.sj_idx = sj_idx;
	}

	public String getRg_idx() {
		return rg_idx;
	}

	public void setRg_idx(String rg_idx) {
		this.rg_idx = rg_idx;
	}

	public String getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}

	public String getSj_idx() {
		return sj_idx;
	}

	public void setSj_idx(String sj_idx) {
		this.sj_idx = sj_idx;
	}
}
