package kr.or.ddit.finance.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BudgetVO {
	private String bugtCd;
	private String deptCd;
	private String bugtNm;
	private int bugtAmt;
	private int bugtImplAmt;
	private int bugtBlce;
	private String bugtGiveYmd;
	private Date bugtExpryYmd;
}
