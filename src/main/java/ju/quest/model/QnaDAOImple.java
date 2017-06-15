package ju.quest.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.MissingDTO;
import ju.dto.QnaDTO;

public class QnaDAOImple implements QnaDAO{
	public SqlSessionTemplate sqlMap;

	public QnaDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	public List<QnaDTO> qnaList(String sql) {
		// TODO Auto-generated method stub
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("sql", sql);
		List<QnaDTO> list=sqlMap.selectList("qnaList", map); //sql id 를 쓴다
		return list;
	}
	public int qnaWrite(QnaDTO dto) {
		int result = sqlMap.insert("qnaWrite", dto);
		return result;
	}
	public QnaDTO qnaContent(String qna_idx) {
		QnaDTO dto = sqlMap.selectOne("qnaContent", qna_idx);
		return dto;
	}
	public int qnaDelete(String qna_idx) {
		int count=sqlMap.delete("qnaDelete",qna_idx);
		return count;
	}
	public QnaDTO qnaChange(String qna_idx) {
		// TODO Auto-generated method stub
		QnaDTO dto = sqlMap.selectOne("qnaChange", qna_idx);
		return dto;
	}
	public int qnaChangeOk(QnaDTO dto) {
		// TODO Auto-generated method stub
		int count = sqlMap.update("qnaChangeOk", dto);
		return count;
	}
	public int qnaTotalCount() {
		int count = sqlMap.selectOne("qnaTotalCount");
		return count;
	}
	
	public String makeIdx(String tableName) {
		// TODO Auto-generated method stub
		Long unixTime=System.currentTimeMillis();
		String idx=tableName+unixTime;  
		return idx;
	}	
	public QnaDTO qnaPreInfo(String qna_idx) {
		QnaDTO dto = sqlMap.selectOne("qnaPreInfo", qna_idx);
		return dto;
	}
	public QnaDTO qnaNextInfo(String qna_idx) {
		QnaDTO dto = sqlMap.selectOne("qnaNextInfo", qna_idx);
		return dto;
	}
}
