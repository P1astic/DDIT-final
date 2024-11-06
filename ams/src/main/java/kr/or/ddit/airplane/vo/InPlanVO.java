package kr.or.ddit.airplane.vo;

import lombok.Data;

/*
 * 2024.09.26 김예영
 * 국내선 운항 스케쥴 조회 위해 생성
 */
@Data
public class InPlanVO {
	private String airlineEnglish;			// 항공사명(영)		ex) JINAIR
	private String airlineKorean;			// 항공사명(한)		ex) 진에어
	private String flightPurpose;			// 운항 목적			ex) 여객기
	private String arrivalcity;				// 도착 공항			ex) 제주
	private String arrivalcityCode;			// 도착 공항 코드		ex) CJU
	private String startcity;				// 출발 공항			ex) 서울/김포
	private String startcityCode;			// 출발 공항 코드		ex) GMP
	private String domesticNum;				// 항공편명			ex) BX8831
	private String domesticStartTime;		// 출발시간			ex) 600
	private String domesticArrivalTime;		// 도착 시간			ex) 710
	private String domesticSun;				// 일요일				ex) N
	private String domesticMon;				// 월요일				ex) N
	private String domesticTue;				// 화요일				ex) Y
	private String domesticWed;				// 수요일				ex) Y
	private String domesticThu;				// 목요일				ex) N
	private String domesticFri;				// 금요일				ex) N
	private String domesticSat;				// 토요일				ex) Y
	private String domesticStdate;			// 운항시작일			ex) 2024-07-21T00:00:00+09:00
	private String domesticEddate;			// 운항 종료일			ex) 2024-10-07T00:00:00+09:00
}
