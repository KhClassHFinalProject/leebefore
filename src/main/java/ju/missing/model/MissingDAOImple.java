package ju.missing.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.MissingDTO;

public class MissingDAOImple implements MissingDAO{

	private SqlSessionTemplate sqlMap;
	
	public MissingDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	public List<MissingDTO> missingList(String sql) {
		// TODO Auto-generated method stub
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("sql", sql);
		List<MissingDTO> list=sqlMap.selectList("missingList", map); //sql id 를 쓴다
		return list;
	}
	public int missingWrite(MissingDTO dto) {
		int result = sqlMap.insert("missingWrite", dto);
		return result;
	}
	public MissingDTO missingContent(String missing_idx) {
		MissingDTO dto = sqlMap.selectOne("missingContent", missing_idx);
		return dto;
	}
	public int missingDelete(String missing_idx) {
		int count=sqlMap.delete("missingDelete",missing_idx);
		return count;
	}
	public MissingDTO missingChange(String missing_idx) {
		// TODO Auto-generated method stub
		MissingDTO dto = sqlMap.selectOne("missingChange", missing_idx);
		return dto;
	}
	public int missingChangeOk(MissingDTO dto) {
		// TODO Auto-generated method stub
		int count = sqlMap.update("missingChangeOk", dto);
		return count;
	}
	public int missingTotalCount() {
		int count = sqlMap.selectOne("missingTotalCount");
		return count;
	}
	public String makeIdx(String tableName) {
		// TODO Auto-generated method stub
		Long unixTime=System.currentTimeMillis();
		String idx=tableName+unixTime;  //NT~로 시작하는 idx를 생성시킨다
		return idx;
	}
	
	public MissingDTO preInfo(String missing_idx) {
		MissingDTO dto = sqlMap.selectOne("preInfo", missing_idx);
		return dto;
	}
	
	public MissingDTO nextInfo(String missing_idx) {
		MissingDTO dto = sqlMap.selectOne("nextInfo", missing_idx);
		return dto;
	}
	
}
