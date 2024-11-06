package kr.or.ddit.human.vo;

import lombok.Data;

@Data
public class PassRegistVO {
	private String passAppNo;
	private String memId;
	private String passRegistAplyYmd;
	private String passRegistTitle;
	private String passRegistYn;
	
	private long fileGroupNo;
	
	private int rnum;
	private String bpNm;
	private String bpRprsvNm;
}
