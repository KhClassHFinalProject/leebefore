package ju.missing.model;

import java.util.List;

import ju.dto.MissingDTO;

public interface MissingDAO {
	
	public List<MissingDTO> missingList(String sql);
	public int missingWrite(MissingDTO dto);
	public MissingDTO missingContent(String missing_idx);
	public int missingDelete(String missing_idx);
	public MissingDTO missingChange(String missing_idx);
	public int missingChangeOk(MissingDTO dto);
	public int missingTotalCount();
	public String makeIdx(String tableName);
	public MissingDTO preInfo(String missing_idx);
	public MissingDTO nextInfo(String missing_idx);
	
}
