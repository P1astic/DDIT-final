package kr.or.ddit.facility.vo;

import java.util.Date;

import lombok.Data;
@Data
public class SecurityFacilityVO {
	private String securityFacCd;   // 시설코드
	private String securitySeq;		// 순번
	private String checklistName;   // 점검표명
	private Date modifyDt;			// 수정일
	private Date createDt;			// 등록일
	private String checklistSeq;	//점검표순번
	private Date latestinspectiondt; //최근점검날짜
	private String checkedornot;	//점검여부
	private String totalcumcheck;   //총 점검횟수
	private String empName; 	    //회사명
	private String particulars;        // 시설 특이사항
	private String securityFacName;        // 시설명
	private String checkItems1; //점검항목1	
	private String checkItems2; //점검항목2
	private String checkItems3; //점검항목3
	private String checkItems4; //점검항목4
	private String checkItems5; //점검항목5 	
	private String checkFrequency; 
	
	
	
	private String searchFilter; //검색조건
	private String table_search; //검색
	int currentPage;
	
	
	
}

