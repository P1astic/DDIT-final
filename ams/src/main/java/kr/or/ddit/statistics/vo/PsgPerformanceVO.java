package kr.or.ddit.statistics.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PsgPerformanceVO {
	private String psgCode;
	private int psgYear;
	private String psgLine;
	private Date psgTime;
	private int psgDeparture;
	private int psgArrival;
}
