package ju.elib.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.ElibDTO;

public class ElibDAOImple implements ElibDAO {

	private SqlSessionTemplate sqlMap;
	
	public ElibDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	/**전자도서관 책 등록*/
	public int elibInsert(ElibDTO dto) {
		int resultCount=sqlMap.insert("elibINSelib", dto);
		return resultCount;
	}
	
	/**eEdu 최초 접근*/
	public List<ElibDTO> elibFirst(String orderName, int startNum, int endNum, String idxParam) {
		HashMap<String, String> hmap=new HashMap<String, String>(); 
		hmap.put("orderName", orderName);
		hmap.put("startNum", Integer.toString(startNum));
		hmap.put("endNum", Integer.toString(endNum));
		hmap.put("idxParam", idxParam);
		List<ElibDTO> eEduArr=sqlMap.selectList("elibSELfir", hmap);
		return eEduArr;
	}
	
	/**eEdu 최초 접근 갯수*/
	public int elibFirstCount(String idxParam) {
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("idxParam", idxParam);
		int contentMax=sqlMap.selectOne("elibSElfirCount", hmap);
		return contentMax;
	}
	
	/**eEdu 컨텐츠 선택*/
	public List<ElibDTO> elibContent(String el_idx) {
		List<ElibDTO> eEduArr=sqlMap.selectList("elibSELcon", el_idx);
		return eEduArr;
	}
	
	/**eEdu 단순 검색*/
	public List<ElibDTO> elibSimple(String simpleSearchText, String orderName, int startNum, int endNum, String idxParam) {
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("simpleSearchText", simpleSearchText);
		hmap.put("orderName", orderName);
		hmap.put("startNum", Integer.toString(startNum));
		hmap.put("endNum", Integer.toString(endNum));
		hmap.put("idxParam", idxParam);
		List<ElibDTO> eEduArr=sqlMap.selectList("elibSELsimple", hmap);
		return eEduArr;
	}
	
	/**eEdu 단순 검색 갯수*/
	public int elibSimpleCount(String simpleSearchText, String orderName, String idxParam) {
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("simpleSearchText", simpleSearchText);
		hmap.put("orderName", orderName);
		hmap.put("idxParam", idxParam);
		int contentMax=sqlMap.selectOne("elibSELsimpleCount", hmap);
		return contentMax;
	}
	
	/**eEdie 상세검색*/
	public List<ElibDTO> elibDetail(String where, String orderName, int startNum, int endNum, String idxParam) {
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("where", where);
		hmap.put("orderName", orderName);
		hmap.put("startNum", Integer.toString(startNum));
		hmap.put("endNum", Integer.toString(endNum));
		hmap.put("idxParam", idxParam);
		List<ElibDTO> elibArr=sqlMap.selectList("elibSELdetail", hmap);
		return elibArr;
	}
	
	/**eEdie 상세검색 갯수*/
	public int elibDetailCount(String where, String orderName, String idxParam) {
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("where", where);
		hmap.put("orderName", orderName);
		hmap.put("idxParam", idxParam);
		int contentMax=sqlMap.selectOne("elibSELdetailCount", hmap);
		return contentMax;
	}
	
	/**eEdu 뷰어*/
	public List<ElibDTO> elibViewer(String el_idx) {
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("el_idx", el_idx);
		List<ElibDTO> elibArr=sqlMap.selectList("elibSELview", hmap);
		return elibArr;
	}
	
	/**관리자 검색없는 리스트 보기*/
	public List<ElibDTO> elibAdminNoList(int startNum, int endNum) {
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("startNum", Integer.toString(startNum));
		hmap.put("endNum", Integer.toString(endNum));
		List<ElibDTO> elibArr=sqlMap.selectList("elibSELnoList", hmap);
		return elibArr;
	}
	
	/**관리자 검색없는 리스트 보기 갯수*/
	public int elibAdminNoListCount() {
		int resultCount=sqlMap.selectOne("elibSELnoListCount");
		return resultCount;
	}
	
	/**삭제*/
	public int elibDelete(String el_idx) {
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("el_idx", el_idx);
		int resultCount=sqlMap.delete("elibDEL", hmap);
		return resultCount;
	}
	
	/**수정*/
	public int elibUpdate(String el_idx, String el_lg, String el_md, String el_subject, String el_writer, String el_pub, String el_info, String el_path, String change_idx){
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("el_idx", el_idx);
		hmap.put("el_lg", el_lg);
		hmap.put("el_md", el_md);
		hmap.put("el_subject", el_subject);
		hmap.put("el_writer", el_writer);
		hmap.put("el_pub", el_pub);
		hmap.put("el_info", el_info);
		hmap.put("el_path", el_path);
		hmap.put("change_idx", change_idx);
		int resultCount=sqlMap.update("elibUPD",  hmap);
		return resultCount;
	}
	
	/**관리자 검색*/
	public List<ElibDTO> elibAdminSearch(String where, String order, String startNum, String endNum) {
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("where", where);
		hmap.put("order", order);
		hmap.put("startNum", startNum);
		hmap.put("endNum", endNum);
		List<ElibDTO> elibArr=sqlMap.selectList("elibSELadminSearch", hmap);
		return elibArr;
	}

	/**관리자 검색 갯수*/
	public int elibAdminSearchCount(String where) {
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("where", where);
		int resultCount=sqlMap.update("elibSELadminSearchCount",  hmap);
		return resultCount;
	}
	
	/**추천*/
	public int elibRecommend(String el_idx, String el_recommend) {
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("el_idx", el_idx);
		hmap.put("el_recommend", el_recommend);
		int resultCount=sqlMap.update("elibUPDrec",  hmap);
		return resultCount;
	}

}
