package ju.model;

import java.util.*;
import ju.dto.*;

import org.mybatis.spring.SqlSessionTemplate;

public class TeacherDAOImple implements TeacherDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public TeacherDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int teacherAdd(TeacherDTO dto) {
		int result = sqlMap.insert("classINSTeacher",dto);
		return result;
	}

	public List<TeacherDTO> teacherList() {
		List<TeacherDTO> list = sqlMap.selectList("classSELTeacher");
		return list;
	}

}
