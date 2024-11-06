package kr.or.ddit.board.vo;

import lombok.Data;

@Data
public class NoticeBoardVO {
	private String ntcBrdNo;
	private String memId;
	private String ntcBrdType;
	private String ntcBrdTtl;
	private String ntcBrdRegYmd;
	private String ntcBrdCn;
	private int ntcBrdInqCnt;
	private int fileGroupNo;
}
