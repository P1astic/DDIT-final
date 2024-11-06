package kr.or.ddit.airplane.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AirScheduleVO {
	private String airScheNo;
	private String memId;
	private Date airSchdlDptreDt;
	private Date airSchdlArvlDt;
	private String airSchdlDptreRgn;
	private String airSchdlArvlRgn;
	private String airSchdlDptreAstp;
	private String airSchdlArvlAstp;
	private int airSchdlGate;
}
