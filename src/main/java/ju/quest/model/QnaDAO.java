package ju.quest.model;

import java.util.List;

import ju.dto.QnaDTO;

public interface QnaDAO {
	
	public List<QnaDTO> qnaList(String sql);
	public int qnaWrite(QnaDTO dto);
	public QnaDTO qnaContent(String qna_idx);
	public int qnaDelete(String qna_idx);
	public QnaDTO qnaChange(String qna_idx);
	public int qnaChangeOk(QnaDTO dto);
	public int qnaTotalCount();
	public String makeIdx(String tableName);
	public QnaDTO qnaPreInfo(String qna_idx);
	public QnaDTO qnaNextInfo(String qna_idx);
}
