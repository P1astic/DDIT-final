package kr.or.ddit.facility.vo;

import java.util.Date;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.human.vo.WorkRecordVO;
import lombok.Data;
@Data
public class ParkingRsvtVO {
	private String prkRsvtNo;
	private String prkRsvtNm;
	private String prkRsvtMoblphon;
	private String prkRsvtPswd;
	private String prkRsvtCarNo;
	private String prkRsvtCarType;
	private String prkRsvtYmd;
	private String prkEntvhclTm;
	private String prkLvvhclTm;
	private String prkRsvtRtrcnYn;
	private String prkRsvPayYn;
	private String prkLotArea;

}
