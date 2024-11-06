package kr.or.ddit.airplane.vo;

import lombok.Data;

/*
 * 2024.09.26 김예영
 * 국제선 운항 스케쥴 조회 위해 생성
 */
@Data
public class OutPlanVO {	
	private String airlineEnglish;			// 항공사명(영)		ex) ASIANA AIRLINE
	private String airlineKorean;			// 항공사명(한)		ex) 아시아나 항공
	private String flightPurpose;			// 운항 목적			ex) 여객기
	private String airport;					// 기준 공항			ex) 서울/김포
	private String airportCode;				// 기준 공항 코드		ex) GMP
	private String city;					// 운항 구간			ex) 오사카/간사이
	private String cityCode;				// 운항 구간 코드		ex) KIX
	private String internationalIoType;		// 출/입국코드			ex) OUT
	private String internationalNum;		// 항공편명			ex) OZ1145
	private String internationalTime;		// 계획시간			ex) 0810
	private String internationalSun;		// 일요일				ex) Y
	private String internationalMon;		// 월요일				ex) Y
	private String internationalTue;		// 화요일				ex) N
	private String internationalWed;		// 수요일				ex) N
	private String internationalThu;		// 목요일				ex) N
	private String internationalFri;		// 금요일				ex) Y
	private String internationalSat;		// 토요일				ex) N
	private String internationalStdate;		// 운항시작일			ex) 2024-03-31T00:00:00+09:00
	private String internationalEddate;		// 운항종료일			ex) 2024-10-26T00:00:00+09:00
}
