package kr.or.ddit.human.vo;

import lombok.Data;

@Data
public class LeaveDetailVO {
	
	private int lvDetCd; // 휴가 상세코드
	private String elecApvNo; // 문서번호
	private String lvBgngYmd; // 휴가 시작일자
	private String lvEndYmd; // 휴가 종료일자
	private String lvDetType; // 휴가 유형
	private String lvDetRsn; // 연차사유
	private int lvUseDay; // 휴가 사용일수
}
