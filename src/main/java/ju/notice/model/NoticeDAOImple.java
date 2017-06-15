package ju.notice.model;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.NoticeDTO;


public class NoticeDAOImple implements NoticeDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<NoticeDTO> noticeList(String sql) {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("sql", sql);
		List<NoticeDTO> list=sqlMap.selectList("notiSELList", map); //sql id 를 쓴다
		return list;
	}

	public int noticeWrite(NoticeDTO dto) {
		int count=sqlMap.insert("notiINSWrite",dto);
		System.out.println(count);
		return count;
	}
	
	public NoticeDTO noticeContent(String nt_idx){
		NoticeDTO dto=sqlMap.selectOne("notiSELContent",nt_idx);
		return dto;
		
	}
	
	public int noticeDelete(String nt_idx) {
		int count=sqlMap.delete("notiDELOut",nt_idx);
		return count;
	}

	public NoticeDTO noticeChange(String nt_idx) {
		NoticeDTO dto=sqlMap.selectOne("notiSELChange",nt_idx);
		return dto;
	}

	public int noticeChangeOk(NoticeDTO dto) {
		int count=sqlMap.update("notiUPDChange",dto);
		return count;
	}
	
	public int totalCount() {
		int count = sqlMap.selectOne("totalCount");
		return count;
	}
	
}

