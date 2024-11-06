package kr.or.ddit.facility.vo;

import java.util.Date;
import java.util.List;
import lombok.Data;

@Data
public class SecurityChecklistVO {
	private String checklistSeq; //점검표 순번
	private String checklistName; // 점검표 명
	private String securityFacName; // 시설명
	private String checkFrequency; //점검빈도
	private String checkItems1; //점검항목1	
	private String checkItems2; //점검항목2
	private String checkItems3; //점검항목3
	private String checkItems4; //점검항목4
	private String checkItems5; //점검항목5
	private Date modifyDt; //수정일
	private Date createDt; //등록일
	private String numFacilities;        // 시설 수
	
	
	
	private String searchFilter; //검색조건
	private String table_search; //검색
	int currentPage;
	
	private int offset; // 오프셋
	private int pageSize;
	    
	 //  SECURITY_COMPANY 테이블의 EMP_NAME 필드
	 private String empName; // 업체 이름
	
}
