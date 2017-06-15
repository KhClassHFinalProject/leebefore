package ju.audiobook.model;

import java.util.List;

import ju.dto.ElibDTO;

public interface AudioDAO {
	public int audioUp(ElibDTO dto);

	public List<ElibDTO> selectList();

	public List<ElibDTO> selectImg(int page, int listSize);

	public ElibDTO selContent(String el_idx);

	public List<ElibDTO> serchDetail(String where, String orderName, int page, int listSize);

	public ElibDTO selMplist(String el_idx);

	public List<ElibDTO> simpleSerch(String simpleSearchText, String orderName, int page, int listSize);

	public int totalCnt();

	public int upAudioInfo(ElibDTO dto);

}
