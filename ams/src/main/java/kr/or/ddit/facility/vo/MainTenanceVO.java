package kr.or.ddit.facility.vo;

import lombok.Data;

//NOTICE_BOARD VO

@Data
public class MainTenanceVO {
	private String mntncCode;   //유지보수 상세 코드
	private String elecApvNo; //문서번호
	private String mntncCn;	//유지보수 내용
	private String mntncYmd;	//유지보수 일자
	private String mntncRslt;	//유지보수 결과
	private String empNm;   //작성자 이름
	private String jbgdCd; //직책
	private String deptNm; //부서명
	private String processingDate; //처리날짜
	private String userId; //사용자 아이디
	
	
	 private int displayNumber; 
	 private int mntncLastNumber;
	
	private String searchFilter; //검색조건
	private String table_search; //검색
	int currentPage;
	
	

}