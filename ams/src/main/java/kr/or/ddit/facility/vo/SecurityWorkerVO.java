package kr.or.ddit.facility.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.comn.vo.FileDetailVO;
import lombok.Data;

@Data
public class SecurityWorkerVO {
	private String memSeq;  //작업자 순번
	private String workerName; //작업자 이름
	private String memTel1; //휴대폰번호1
	private String memTel2; //휴대폰번호2
	private String memTel3; //휴대폰번호3
	private String mail; //메일r
	private String memo; //작업자 메모 특이사항
	private Date createDt; //등록일
	private Date modifyDt; // 수정일
	private String facId;//시설코드
	private String memAdd1;//주소
	private String memAdd2;//상세주소
	

	private String facilityName;//시설이름
	
	
	
	 //  SECURITY_COMPANY 테이블의 EMP_NAME 필드
	 private String empName; // 업체 이름
	
		private String searchFilter; //검색조건
		private String table_search; //검색
		int currentPage;
	
	private long fileGroupNo; //파일업로드용
	private MultipartFile[] uploadFile;
	private List<FileDetailVO> fileDetailVOList;
	
}
