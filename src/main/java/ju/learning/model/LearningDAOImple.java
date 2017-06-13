package ju.learning.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.SubjectDTO;

public class LearningDAOImple implements LearningDAO {
	
	private SqlSessionTemplate sql;
	
	public LearningDAOImple(SqlSessionTemplate sql){
		this.sql = sql;
	}

}
