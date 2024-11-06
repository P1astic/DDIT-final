package kr.or.ddit.approv.vo;

import java.util.Date;

import lombok.Data;


@Data
public class UsageDetailVO {
	
	private String useDetCd; // 경비사용코드
	private String elecApvNo; // 문서번호
	private String useDetYmd; // 경비사용일자
	private String useDetWhere; // 경비사용처
	private String useDetCn; // 경비사용내용
	private String useDetAmt; // 경비사용금액
	private String useDetStat; // 결재상태
	private String memId; 
	
}
