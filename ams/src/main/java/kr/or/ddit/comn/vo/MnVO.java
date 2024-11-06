package kr.or.ddit.comn.vo;

import lombok.Data;

@Data
public class MnVO {
	private String mnCd;
	private String parentMnCd;
	private int mnSeq;
	private String mnTitle;
	private String mnUrl;
	private String mnYn;
	private int level;
	
	private String checkedYn;
}
