package ju.audiobook.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.ElibDTO;

public class AudioDAOImple implements AudioDAO {

	private SqlSessionTemplate sqlMap;

	public AudioDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int audioUp(ElibDTO dto) {
		int count = sqlMap.insert("abINSaudio", dto);
		return count;
	}

	public List<ElibDTO> selectImg(int page, int listSize) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cp", page);
		map.put("ls", listSize);
		List<ElibDTO> list = sqlMap.selectList("abSELaudio", map);
		return list;
	}

	public ElibDTO selContent(String el_idx) {
		ElibDTO dto = sqlMap.selectOne("abSELcon", el_idx);
		return dto;
	}

	public List<ElibDTO> serchDetail(String where, String orderName, int page, int listSize) {
		HashMap<String, String> map = new HashMap<String, String>();
		String cp = Integer.toString(page);
		String ls = Integer.toString(listSize);
		System.out.println("DAOcp:" + cp);
		System.out.println("DAPls:" + ls);
		map.put("where", where);
		map.put("orderName", orderName);
		map.put("cp", cp);
		map.put("ls", ls);
		List<ElibDTO> list = sqlMap.selectList("abSELdetail", map);
		return list;
	}

	public ElibDTO selMplist(String el_idx) {
		ElibDTO dto = sqlMap.selectOne("abSELmp", el_idx);
		return dto;
	}

	public List<ElibDTO> simpleSerch(String simpleSearchText, String orderName, int page, int listSize) {
		HashMap<String, String> map = new HashMap<String, String>();

		String cp = Integer.toString(page);
		String ls = Integer.toString(listSize);

		map.put("simpleSerchText", simpleSearchText);
		map.put("orderName", orderName);
		map.put("cp", cp);
		map.put("ls", ls);
		List<ElibDTO> list = sqlMap.selectList("abSELsimple", map);
		return list;
	}

	public int totalCnt() {
		int totalCnt = sqlMap.selectOne("abSELcnt");
		System.out.println("tcDAO:" + totalCnt);
		return totalCnt;
	}

	public int upAudioInfo(ElibDTO adto) {
		int up = sqlMap.update("abUPupdate", adto);

		System.out.println("수정확인??" + up);
		return up;
	}

	public List<ElibDTO> selectList() {
		List<ElibDTO> list = sqlMap.selectList("abSELlist");
		return list;
	}

}
