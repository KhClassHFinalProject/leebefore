package ju.elib.model;

import java.util.List;

import ju.dto.ElibDTO;

public interface ElibDAO {
	
	/**전자도서관 책 등록*/
	public int elibInsert(ElibDTO dto);
	
	/**최초 접근*/
	public List<ElibDTO> elibFirst(String orderName, int startNum, int endNum, String idxParam);
	
	/**최초 접근 갯수*/
	public int elibFirstCount(String idxParam);
	
	/**컨텐츠 선택*/
	public List<ElibDTO> elibContent(String el_idx);
	
	/**단순 검색*/
	public List<ElibDTO> elibSimple(String simpleSearchText, String orderName, int startNum, int endNum, String idxParam);
	
	/**단순 검색 갯수*/
	public int elibSimpleCount(String simpleSearchText, String orderName, String idxParam);
	
	/**상세검색*/
	public List<ElibDTO> elibDetail(String where, String orderName, int startNum, int endNum, String idxParam);
	
	/**상세검색 갯수*/
	public int elibDetailCount(String where, String orderName, String idxParam);
	
	/**뷰어*/
	public List<ElibDTO> elibViewer(String el_idx);
	
	/**추천*/
	public int elibRecommend(String el_idx, String el_recommend);
	
	/**관리자 검색없는 리스트 보기*/
	public List<ElibDTO> elibAdminNoList(int startNum, int endNum);
	
	/**관리자 검색없는 리스트 보기 갯수*/
	public int elibAdminNoListCount();
	
	/**삭제*/
	public int elibDelete(String el_idx);
	
	/**수정*/
	public int elibUpdate(String el_idx, String el_lg, String el_md, String el_subject, String el_writer, String el_pub, String el_info, String el_exe, String change_idx);
	
	/**관리자 검색*/
	public List<ElibDTO> elibAdminSearch(String where, String order, String startNum, String endNum);

	/**관리자 검색 갯수*/
	public int elibAdminSearchCount(String where);
	
	/**전자도서 전체 중 추천 순서*/
	public ElibDTO elibReccoOrder();
}