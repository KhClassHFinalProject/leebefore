package ju.model;
import java.util.*;
import ju.dto.*;

public interface SubjectDAO {

	public int classAdd(SubjectDTO dto);
	public List<SubjectDTO> classList();
	public List<SubjectDTO> memberCheck(String sj_idx);
	
}
