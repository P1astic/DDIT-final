package kr.or.ddit.statistics.vo;

import lombok.Data;

@Data
public class OpPerformanceVO {
	private String opCode;
	private int opYear;
	private String opLine;
	private String opAir;
	private String opType;
	private String opCategory;
	private int opDeparture;
	private int opArrival;
}
