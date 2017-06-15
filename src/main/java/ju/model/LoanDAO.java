package ju.model;
import java.util.*;
import ju.dto.*;

public interface LoanDAO {

	public List<LoanDTO> loanList();
	public List<LoanDTO> loanListAfter();
	public List<LoanDTO> loanList(String mem_idx);
	public int yeyakNum(String bk_isbn);
	public int loanOne(String bk_idx);
	public int checkOutGo(LoanDTO dto);
	public int checkInGo(String bk_idx);
	
}
