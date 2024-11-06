package kr.or.ddit.facility.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.facility.vo.SecurityCheckResultsVO;
import kr.or.ddit.facility.vo.SecurityChecklistVO;
import kr.or.ddit.facility.vo.SecurityCompanyVO;
import kr.or.ddit.facility.vo.SecurityFacilityVO;
import kr.or.ddit.facility.vo.SecurityWorkerVO;

public interface SecurityPageService {
	
    
    //업체 리스트
	public List<SecurityCompanyVO> companyList(SecurityCompanyVO securityCompanyVO);
    
    // 시설 리스트
	public List<SecurityFacilityVO> facilityList(SecurityFacilityVO securityFacilityVO);
    
    //업체 등록폼
	public int registFrom(SecurityCompanyVO securityCompanyVO);
    
    //시설 등록폼
	public int secCompanyRegistFrom(SecurityFacilityVO securityFacilityVO);
	
	//시설명 중복검사
	public boolean checkFacilityNameDuplicate(String facilityName);
    
	//시설등록시 점검표안에 점검목록불러오기
	//public List<String> getCheckItemsByChecklistSeq(String checklistSeq);
	
    //업체정보 상세 보기
	public SecurityCompanyVO detail(String facId);
	
	//시설정보 상세 보기
	public SecurityFacilityVO secCompanyDetail(String securityFacCd);
    
    //업체수정 폼
	public int editPost(SecurityCompanyVO securityCompanyVO);
    
    //업체 정보 삭제
	public int delete(String facId);
    
    //업체 정보 비밀번호 수정시 비밀번호 확인 
	public SecurityCompanyVO findByEmpName(String empName);

	
	
/*--------------------------------------------------------시설,업체 끝---------------------------------------------------------------*/
	
	
/*--------------------------------------------------------작업자 시작---------------------------------------------------------------*/
	
    //작업자 리스트
	public List<SecurityWorkerVO> secWorkerList(SecurityWorkerVO securityWorkerVO);
	//작업자 등록 폼
	public int secWorkerRegistFrom(SecurityWorkerVO securityWorkerVO);
	//작업자 상세보기
	public SecurityWorkerVO secWorkerDetail(String memSeq);
	//파일 리스트
	public List<FileDetailVO> fileList(long fileGroupNo);
	//작업자 수정 폼
	public int secWorkeEditFrom(SecurityWorkerVO securityWorkerVO);
	//작업자 삭제
	public int secWorkerDelete(String memSeq);
	
	/*--------------------------------------------------------작업자 끝---------------------------------------------------------------*/	
	
	/*--------------------------------------------------------점검표 시작---------------------------------------------------------------*/
	//점검표 리스트
	public List<SecurityChecklistVO> secCheckList(SecurityChecklistVO securityChecklistVO);
	//점검표 등록 폼
	public int secCheckListRegistFrom(SecurityChecklistVO securityChecklistVO);
	
	//점검표 상세보기
	public SecurityChecklistVO secCheckListDetail(String checklistSeq);
	
	//점검표 수정 폼
	public int secCheckListEditFrom(SecurityChecklistVO securityChecklistVO);
	//점검표 삭제
	public int secCheckListDelete(String checklistSeq);
	
	public int getTotal(Map<String, Object> maintenanceMap);

	/*--------------------------------------------------------점검표 끝---------------------------------------------------------------*/
	
	/*--------------------------------------------------------점검 도는 거---------------------------------------------------------------*/
	
	
	public List<SecurityCheckResultsVO> SecurityPatrol(SecurityCheckResultsVO securityCheckResultsVO);

	public int SecurityPatrolFrom(SecurityCheckResultsVO securityCheckResultsVO);


	public List<String> getChecklistItems(String checklistSeq);

	public int checkIfExists(String securityFacName);

	public SecurityFacilityVO getInspectionItems(String facCd);

	public List<SecurityChecklistVO> secListVOList(SecurityChecklistVO securityChecklistVO);

	public List<SecurityWorkerVO> secworker(SecurityWorkerVO securityWorkerVO);
	//시설삭제
	public int SecurityPatrolDelete(String securityFacCd);



	
	
	
	
	
	
	
	
	
}