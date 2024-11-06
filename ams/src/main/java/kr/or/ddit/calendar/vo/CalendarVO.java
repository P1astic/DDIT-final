package kr.or.ddit.calendar.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CalendarVO {
	private int scheNo;
	private String scheId;
	private String scheType;
	private String scheTitle;
	private String scheContent;
	private String scheStartDate;
	private String scheStartTime;
	private String scheEndDate;
	private String scheEndTime;
	private int scheStat;
	private String createYmd;
	private String createEmp;
	private Date modifyDt;
	private String modifyEmp;
	private String memId;
	private String scheMemId;		// videoChat 테이블과 memId 중복 방지를 위해 생성
	private String allDay;
	private String backGroundColor;
	private String roomId;
	private String videoCreateMemId;
}
