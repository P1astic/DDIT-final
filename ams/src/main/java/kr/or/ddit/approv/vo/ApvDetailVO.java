package kr.or.ddit.approv.vo;

import java.util.Date;

import lombok.Data;

/**
 * @author 김인호
 * 24.09.21
 * 결재자 아이디 apvId -> memId 변경
 * 결재서명 삭제(직원이 가지고있음)
 */
@Data
public class ApvDetailVO {
	
	private int apvLineDetNo; // 결재 순번
	private String elecApvNo; // 문서 번호
	private String apvLineDetAtrzYmd; // 결재일시
	private String apvLineDetType; // 결재유형
	private String apvDecReason; // 반려사유
	private String apvYn; // 승인여부
	private String apvLineFinYn; // 최종결재자 여부
	private String apvLineNo; // 나의결재선 번호
	private String memId; // 결재자 아이디
	private String apvAtrzSgn; // 결재 서명
	
	
	// 24.09.24 김인호
	private String apvIds; 
	
}
