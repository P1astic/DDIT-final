package kr.or.ddit.attendance.vo;

import java.time.LocalDateTime;
import java.util.Date;

import kr.or.ddit.human.vo.WorkRecordVO;
import lombok.Data;

@Data
public class AttendanceVO {
	private String memId;
	private int totWrkdyCnt;
	private int totVacdyCnt;
	private int totBizdyCnt;
	private int totOvTmWrk;
	private int totHwTm;
	private int totOutdtTm;
	
	private WorkRecordVO wordRecordVO;
	//WORKRECORD
	private String wrNo;
	private String attendTm;
	private String lvffcTm;
	private Date overTime;
	private Date holidayWork;
	private Date outsideDuty;
	private String remark;
	
	private String InHOUR; //출근
	private String OutHOUR; //퇴근
	private String InMINUTE; //출근
	private String OutMINUTE; //퇴근
	private int Hour; //근무시간
	private int MINUITE; //근무 분
	private int nowHH; //근무시간
	private int nowMi; //근무 분
	private String workCnt; //근무일수
	private String allHour; //당일근무시간
	private String nowHour; //당일근무시간
	private String allAttend; //당일근무시간
//	public void setAttendTm(LocalDateTime now) {
//		// TODO Auto-generated method stub
//		
//	}
}
