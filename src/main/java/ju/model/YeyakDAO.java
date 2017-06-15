package ju.model;
import java.util.*;
import ju.dto.*;

public interface YeyakDAO {

	public int yeyakOne(String bk_isbn);
	public List<YeyakDTO> yeyakList(String bk_isbn);
	public YeyakDTO yeyakSunbun(String bk_isbn);
	public int yeyakUp(String bk_isbn);
	public int yeyakDel(String mem_idx);
	
}
