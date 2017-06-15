package ju.model;
import java.util.List;

import ju.dto.LoanDTO;
import ju.dto.OriginalLoanDTO;

public interface LoanDAO {

	public List<LoanDTO> loanList();
	public List<LoanDTO> loanListAfter();
	public List<LoanDTO> loanList(String mem_idx);
	public int yeyakNum(String bk_isbn);
	public int loanOne(String bk_idx);
	public int checkOutGo(LoanDTO dto);
	public int checkInGo(String bk_idx);
	
	/**정보 가져오기*/
	public List<OriginalLoanDTO> loanInfo(String lb_idx);
	/**마지막 읽은 쪽 북마크 등록&삭제*/
	public int loanBookMarkUp(String lb_idx, String lb_etc);
	/**전자도서 회원 최대치*/
	public int memCount(String mem_idx);
	/**전자도서 중복도서 체크*/
	public int ebookOverlap(String mem_idx, String el_idx);
	/**전자도서 대여 */
	public int elibLoan(String lb_idx, String mem_idx, String book_idx, String lb_etc);
	/**전자도서 빌린책인지 확인*/
	public int elibLoanCheck(String el_idx, String mem_idx);
	/**전자도서 빌린책 정보*/
	public List<OriginalLoanDTO> elibLoanInfo(String el_idx, String mem_idx);
	
}