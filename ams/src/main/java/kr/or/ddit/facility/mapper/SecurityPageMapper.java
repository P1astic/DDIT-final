package kr.or.ddit.facility.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.facility.vo.SecurityCheckResultsVO;
import kr.or.ddit.facility.vo.SecurityChecklistVO;
import kr.or.ddit.facility.vo.SecurityCompanyVO;
import kr.or.ddit.facility.vo.SecurityFacilityVO;
import kr.or.ddit.facility.vo.SecurityWorkerVO;

@Mapper
public interface SecurityPageMapper {
	
	//업체 리스트
	public List<SecurityCompanyVO> companyList(SecurityCompanyVO securityCompanyVO);
	
	//시설 리스트
	public List<SecurityFacilityVO> facilityList(SecurityFacilityVO securityFacilityVO);
	
	// 업체 등록 폼
	public int registFrom(SecurityCompanyVO securityCompanyVO);
	
	//시설등록 폼
	public int secCompanyRegistFrom(SecurityFacilityVO securityFacilityVO);
	
	//중복검사 시설명
	public int countByFacilityName(String facilityName);
    
    //업체 상세정보
	public SecurityCompanyVO detail(String facId);
	
	//시설 상세정보
	public SecurityFacilityVO secCompanyDetail(String securityFacCd);
    
    //업체 수정폼
	public int editPost(SecurityCompanyVO securityCompanyVO);
    
    //업체 삭제
	public int delete(String facId);
    
    //업체 수정할시 비밀번호 확인
	public SecurityCompanyVO findByEmpName(@Param("empName") String empName); // 추가된 메소드
	

	/*--------------------------------------------------------시설,업체 끝---------------------------------------------------------------*/
	
	
	/*--------------------------------------------------------작업자 시작---------------------------------------------------------------*/
	
	//작업자 리스트
	public List<SecurityWorkerVO> secWorkerList(SecurityWorkerVO securityWorkerVO);

	public int secWorkerRegistFrom(SecurityWorkerVO securityWorkerVO);

	public SecurityWorkerVO secWorkerDetail(String memSeq);

	public List<FileDetailVO> fileList(long fileGroupNo);

	public int secWorkeEditFrom(SecurityWorkerVO securityWorkerVO);

	public int secWorkerDelete(String memSeq);

	public int secWorkerDelete(long fileGroupNo);

	
	

	/*--------------------------------------------------------작업자 끝---------------------------------------------------------------*/
	
	
	/*--------------------------------------------------------점검표 시작---------------------------------------------------------------*/
	
	//점검표 리스트
	public List<SecurityChecklistVO> secCheckList(SecurityChecklistVO securityChecklistVO);
	
	//점검표 등록 폼
	public int secCheckListRegistFrom(SecurityChecklistVO securityChecklistVO);
	//점검표 상세
	public SecurityChecklistVO secCheckListDetail(String checklistSeq);
	//점검표 수정폼
	public int secCheckListEditFrom(SecurityChecklistVO securityChecklistVO);
	//점검표 삭제
	public int secCheckListDelete(String checklistSeq);

	public int getTotal(Map<String, Object> maintenanceMap);
	
	/*--------------------------------------------------------점검표 끝---------------------------------------------------------------*/
	
	
	/*--------------------------------------------------------점검도는거 ---------------------------------------------------------------*/
	
	
	public List<SecurityCheckResultsVO> SecurityPatrol(SecurityCheckResultsVO securityCheckResultsVO);

	public int SecurityPatrolFrom(SecurityCheckResultsVO securityCheckResultsVO);


	public List<String> getChecklistItems(String checklistSeq);

	public int checkIfExists(String securityFacName);

	public SecurityFacilityVO getInspectionItems(String facCd);
	
	public int securityPatrolForm(SecurityCheckResultsVO securityCheckResultsVO);
	
	public void TotalCumCheck(SecurityCheckResultsVO securityCheckResultsVO);
	
	public void numFacilities(SecurityFacilityVO securityFacilityVO);

	public List<SecurityChecklistVO> secListVOList(SecurityChecklistVO securityChecklistVO);

	public List<SecurityWorkerVO> secworker(SecurityWorkerVO securityWorkerVO);

	public void updateLatestInspectionDt(@Param("securityFacCd") String securityFacCd, @Param("latestInspectionDt") Date date);
	//시설삭제
	public int SecurityPatrolDelete(String securityFacCd);


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
}