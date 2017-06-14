package ju.learning.model;

import java.util.List;

import ju.dto.*;

public interface LearningDAO {
	
	public List<SubjectDTO> checkSubjectList();
	
	public int rgst(RegistDTO dto);
	
	public List<SubjectDTO> checkMyRgstList(String mem_idx);
	
	public int deleteRgst(RegistDTO dto);
	
	public List<String> checkMyRgst(String mem_idx);
}
