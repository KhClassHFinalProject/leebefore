package ju.notice.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.NoticeDTO;

public class NoticeDAOImple implements NoticeDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<NoticeDTO> noticeList() {
		//System.out.println("aa");
		List<NoticeDTO> list=sqlMap.selectList("notiSELList"); //sql id 를 쓴다
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
	
	
}

