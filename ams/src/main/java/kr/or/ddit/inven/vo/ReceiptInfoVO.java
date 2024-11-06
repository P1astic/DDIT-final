package kr.or.ddit.inven.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReceiptInfoVO {
	private String rcptInfoCd;
	private Date rcptInfoStDate;
	private String rcptInfoClmYmd;
	private String rcptInfoClmCn;
	private int rcptInfoClmAmt;
	private String rcptCd;
	private String memId;
	private String deptCd;
	private int elecApvNo;
}
