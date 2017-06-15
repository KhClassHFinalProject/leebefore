package ju.model;
import java.util.*;

import ju.dto.*;

public interface TeacherDAO {

	public int teacherAdd(TeacherDTO dto);
	public List<TeacherDTO> teacherList();
	
}
