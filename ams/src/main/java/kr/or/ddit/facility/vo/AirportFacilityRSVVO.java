package kr.or.ddit.facility.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class AirportFacilityRSVVO {
	private String aptFacRsvtNo; // 시설예약번호
	private String aptFacRsvtTtl; // 시설예약 제목 1
	private String aptFacRsvtNm; // 시설예약자명 1
	private String aptFacRsvtMoblphon; // 휴대폰번호 1
	private String aptFacEml; // 예약자 이메일주소 1
	private String aptFacRsvtUtztnRsn; // 이용사유 1
	private int aptFacRsvtUtztnNope; // 이용인원 1
	private String aptFacRsvtYmd; // 예약일자 1
	private String aptFacRsvtBgngTm; // 예약 시작시간 1
	private String aptFacRsvtEndTm; // 예약 종료시간 1
	private String aptFacRsvtRtrcnYn; // 예약취소여부 1
	private String aptFacNo; // 시설번호 1
	private String rnum;
	
	private AirportFacilityVO airportFacilityVO;
	private List<AirportFacilityVO> airportFacilityVOList;
}
