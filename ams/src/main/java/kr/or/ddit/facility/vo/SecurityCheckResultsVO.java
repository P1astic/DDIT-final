package kr.or.ddit.facility.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SecurityCheckResultsVO {
	private String facCd; //시설코드
	private String checklistContents;  //점검표 내용
	private String empName; //회사명
	private String workerName; //작업자 이름
	private String inspectionYn; //점검여부
	private Date inspectionTime; //점검시간
	private String inspectionItems1; //점검항목1
	private String inspectionItems2; //점검항목2
	private String inspectionItems3; //점검항목3	
	private String inspectionItems4; //점검항목4
	private String inspectionItems5; //점검항목5
	private String inspectionMemo; //점검메모
	private Date inspectionDate; //점검일시
	private String inspectionDetail; //점검내용
	private String inspectionResults; //점검결과
	private Date modifyDt; //수정일
	private Date createDt; //등록일
	private String checklistSeq; //점검표순번
	
	private String searchFilter; //검색조건
	private String table_search; //검색
	private String securityFacCd; 
	int currentPage;
}
