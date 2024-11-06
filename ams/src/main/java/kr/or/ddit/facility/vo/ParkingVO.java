package kr.or.ddit.facility.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ParkingVO {

//	PK 주차예약번호
//	PRK_RSVT_NO
//	주차예약자명
//	PRK_RSVT_NM
//	휴대폰
//	PRK_RSVT_MOBLPHON 비밀번호
//	PRK_RSVT_PSWD
//	차량번호
//	PRK_RSVT_CAR_NO
//	차량유형
//	PRK_RSVT_CAR_TYPE 예약일자
//	PRK_RSVT_YMD
//	입차시각
//	PRK_ENTVHCL_TM
//	출차시각
//	PRK_LVVHCL_TM 예약취소여부
//	PRK_RSVT_RTRCN_YN
//	보증금
//	결제여부	PRK_RSV_PAY_YN
//	FK 주차구역 PRK_LOT_AREA

	private int prkRsvtNo;
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
	private int prkLotQty;
	private int prkLotNow;
	private String prkLotEnabled; 


}
