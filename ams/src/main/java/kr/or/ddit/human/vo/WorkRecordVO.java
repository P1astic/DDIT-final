package kr.or.ddit.human.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WorkRecordVO {
	private String wrNo; //기록번호
	private String memId;
	private String  attendTm; //출근시간
	private String lvffcTm;// 퇴근시간
	private Date overTime; // 연장근무
	private Date holidayWork; //휴일근무
	private Date outsideDuty; //외근
	private String totWrkdyCnt;
	private String totVacdyCnt;
	private String totBizdyCnt;
	private String remark; //비고
	private String inHour; //출근
	private String outHour; //퇴근
	private String nowHh; //출근
	private String nowMi; //퇴근
	private String inMinuite; //출근
	private String outMinuiteE; //퇴근
	private String hour; //근무시간
	private String minuite; //근무 분
	
	private int workCnt; //근무일수
	private String allHour; //당일 근무시간
	private String nowHour; //sysdate기준 근무시간
	private String allAttend; //총근무시간
}
