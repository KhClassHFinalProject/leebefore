package ju.learning.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.RegistDTO;
import ju.dto.SubjectDTO;

public class LearningDAOImple implements LearningDAO {
	
	private SqlSessionTemplate sql;
	
	public LearningDAOImple(SqlSessionTemplate sql){
		this.sql = sql;
	}

	public List<SubjectDTO> checkSubjectList() {
		// TODO Auto-generated method stub
		return sql.selectList("classSELcheckSubjectList");
	}

	public int rgst(RegistDTO dto) {
		// TODO Auto-generated method stub
		return sql.insert("classINSrgst", dto);
	}

	public List<SubjectDTO> checkMyRgstList(String mem_idx) {
		// TODO Auto-generated method stub
		return sql.selectList("classSELcheckMyRgstList", mem_idx);
	}

	public int deleteRgst(RegistDTO dto) {
		// TODO Auto-generated method stub
		return sql.delete("classDELdeleteMyRgst",dto);
	}

	public List<String> checkMyRgst(String mem_idx) {
		// TODO Auto-generated method stub
		return sql.selectList("classSELcheckMyRgst", mem_idx);
	}

}
