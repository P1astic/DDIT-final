package kr.or.ddit.statistics.vo;

import lombok.Data;

@Data
public class TpPerformanceVO {
	private String tpCode;
	private int tpYear;
	private String tpDay;
	private String tpLine;
	private int tpDeparture;
	private int tpArrival;
	private int tpPsgDeparture;
	private int tpPsgArrival;
}
