package ju.notice.model;

import java.util.*;
import ju.dto.NoticeDTO;

public interface NoticeDAO {
	

	public List<NoticeDTO> noticeList(String sql);
	public int noticeWrite(NoticeDTO dto);
	public NoticeDTO noticeContent(String nt_idx);
	public int noticeDelete(String nt_idx);
	public NoticeDTO noticeChange(String nt_idx);
	public int noticeChangeOk(NoticeDTO dto);

	public int noticeTotalCount();

}
