package kr.or.ddit.facility.service.serviceimpl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.comn.util.UploadController;
import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.facility.mapper.SecurityPageMapper;
import kr.or.ddit.facility.service.SecurityPageService;
import kr.or.ddit.facility.vo.SecurityCheckResultsVO;
import kr.or.ddit.facility.vo.SecurityChecklistVO;
import kr.or.ddit.facility.vo.SecurityCompanyVO;
import kr.or.ddit.facility.vo.SecurityFacilityVO;
import kr.or.ddit.facility.vo.SecurityWorkerVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class SecurityPageServiceImpl implements SecurityPageService {
    
	@Inject
	UploadController uploadController;
	
    @Inject
    SecurityPageMapper securityPageMapper;

    // 업체 리스트
    @Override
    public List<SecurityCompanyVO> companyList(SecurityCompanyVO securityCompanyVO) {
        return this.securityPageMapper.companyList(securityCompanyVO);
    } 
    
    //시설 리스트
	@Override
	public List<SecurityFacilityVO> facilityList(SecurityFacilityVO securityFacilityVO) {
		
		return this.securityPageMapper.facilityList(securityFacilityVO);
	}
    
    //업체 등록폼
    @Override
    public int registFrom(SecurityCompanyVO securityCompanyVO) {
        return this.securityPageMapper.registFrom(securityCompanyVO);
    }
    //시설 등록폼
    @Override
	public int secCompanyRegistFrom(SecurityFacilityVO securityFacilityVO) {
    	int var =0;
    	
    	
		var =securityPageMapper.secCompanyRegistFrom(securityFacilityVO);
    	
		if(var > 0) {
			securityPageMapper.numFacilities(securityFacilityVO);
		}
			
    return var;
	}
    
	//시설명 중복검사
	@Override
	public boolean checkFacilityNameDuplicate(String facilityName) {
		
		return securityPageMapper.countByFacilityName(facilityName) > 0;
	}

    
    //업체 상세정보
    @Override
    public SecurityCompanyVO detail(String facId) {
        return securityPageMapper.detail(facId);
    }
    
    //시설 정보 상세 
	@Override
	public SecurityFacilityVO secCompanyDetail(String securityFacCd) {
		
		return securityPageMapper.secCompanyDetail(securityFacCd);
	}

    //업체 수정폼
    @Override
    public int editPost(SecurityCompanyVO securityCompanyVO) {
        return securityPageMapper.editPost(securityCompanyVO);
    }

    //업체 삭제
    @Override
    public int delete(String facId) {
        return securityPageMapper.delete(facId);
    }

    //업체 수정 비밀번호 확인
    @Override
    public SecurityCompanyVO findByEmpName(String empName) {
        return securityPageMapper.findByEmpName(empName); // Mapper 호출
    }
    

    
    /*--------------------------------------------------------시설,업체 끝---------------------------------------------------------------*/

    
    
    
    /*--------------------------------------------------------작업자 시작---------------------------------------------------------------*/
    
    //작업자 리스트
	@Override
	public List<SecurityWorkerVO> secWorkerList(SecurityWorkerVO securityWorkerVO) {
		
		return securityPageMapper.secWorkerList(securityWorkerVO);
	}
    //작업자 등록 폼
	@Override
	public int secWorkerRegistFrom(SecurityWorkerVO securityWorkerVO) {
		
		int result = 0;
		
		 MultipartFile[] multipartFiles = securityWorkerVO.getUploadFile();

		    long fileGroupNo = 0; //파일이 없는 경우 0을로 설정
		    
		    // 파일이 있을 때만 업로드 처리
		    // 1. 파일 존재
		    // 파일 배열의 첫 번째 파일을 가져옴 -> 그 파일의 명을 가져와서 -> 길이를 체킹 -> 0보다 큼
		    // 2. 파일 없으면
		    // 파일 배열의 첫 번째 파일을 가져옴 -> 그 파일의 명을 가져와서 -> 길이를 체킹 -> 0
		    if (multipartFiles[0].getOriginalFilename().length() > 0) {

		        // 파일이 있는 경우에만 업로드 처리
		            fileGroupNo = this.uploadController.multiImageUpload(multipartFiles);
		            log.info("registPost Service Impl -> fileGroupNo : " + fileGroupNo);
		    }

		    log.info("registPost Service Impl -> boardVO(before) : " + securityWorkerVO);

		    securityWorkerVO.setFileGroupNo(fileGroupNo);

		    log.info("registPost Service Impl -> boardVO(after) : " + securityWorkerVO);

		    // 1) 작업자 등록
		    result = this.securityPageMapper.secWorkerRegistFrom(securityWorkerVO);

		    log.info("registPost ServiceImpl -> result : " + result);

		    return result;
		    
	}

	@Override
	public SecurityWorkerVO secWorkerDetail(String memSeq) {
		
		return securityPageMapper.secWorkerDetail(memSeq);
	}

	@Override
	public List<FileDetailVO> fileList(long fileGroupNo) {
		
		return securityPageMapper.fileList(fileGroupNo);
	}

	@Override
	public int secWorkeEditFrom(SecurityWorkerVO securityWorkerVO) {

	    log.info("editPost ServiceImpl -> boardVO : " + securityWorkerVO);

	    int result = 0;

	    // 0) 파일 업로드 처리
	    MultipartFile[] multipartFiles = securityWorkerVO.getUploadFile();

	    // 파일이 없는 경우 기본값 설정
	    long fileGroupNo = securityWorkerVO.getFileGroupNo(); // 기존의 파일 그룹 번호를 가져옴

	    try {
	        // 파일이 있는지 여부 확인
	        if (multipartFiles != null && multipartFiles.length > 0 && multipartFiles[0].getOriginalFilename().length() > 0) {
	            // 파일이 있는 경우에만 업로드 처리
	            fileGroupNo = this.uploadController.multiImageUpload(multipartFiles);
	            log.info("editPost ServiceImpl -> fileGroupNo : " + fileGroupNo);

	            // 파일 그룹 번호가 정상적으로 생성되었을 때만 설정
	            if (fileGroupNo > 0) {
	                securityWorkerVO.setFileGroupNo(fileGroupNo);
	            }
	        }

	        log.info("editPost ServiceImpl -> boardVO (after file upload) : " + securityWorkerVO);

	        // 데이터베이스 업데이트 실행
	        result = securityPageMapper.secWorkeEditFrom(securityWorkerVO);
	        log.info("Update result: " + result);

	    } catch (Exception e) {
	        log.error("Error during file upload or database update: ", e);
	    }

	    return result;
	}
	
	
	
	@Override
	public int secWorkerDelete(String memSeq) {
		
		return securityPageMapper.secWorkerDelete(memSeq);
	}



    
	
	
	/*--------------------------------------------------------작업자 끝---------------------------------------------------------------*/
	
	/*--------------------------------------------------------점검표 시작---------------------------------------------------------------*/

    
    //점검표 리스트
	
	@Override
	public List<SecurityChecklistVO> secCheckList(SecurityChecklistVO securityChecklistVO) {
		
		return securityPageMapper.secCheckList(securityChecklistVO);
	}

	//점검표 등록 폼
	@Override
	public int secCheckListRegistFrom(SecurityChecklistVO securityChecklistVO) {
		
		return securityPageMapper.secCheckListRegistFrom(securityChecklistVO);
	}

	//점검표 상세
	@Override
	public SecurityChecklistVO secCheckListDetail(String checklistSeq) {
		
		
	    return  securityPageMapper.secCheckListDetail(checklistSeq);
	}

	//점검표 수정폼
	@Override
	public int secCheckListEditFrom(SecurityChecklistVO securityChecklistVO) {
	
		return securityPageMapper.secCheckListEditFrom(securityChecklistVO);
	}
	
	
	//점검표 삭제
	@Override
	public int secCheckListDelete(String checklistSeq) {
		
		return securityPageMapper.secCheckListDelete(checklistSeq);
	}

	@Override
	public int getTotal(Map<String, Object> maintenanceMap) {
		
		return this.securityPageMapper.getTotal(maintenanceMap);
	}
	/*--------------------------------------------------------점검표 끝---------------------------------------------------------------*/
	
	
	/*--------------------------------------------------------점검 도는거---------------------------------------------------------------*/
	@Override
	public List<SecurityCheckResultsVO> SecurityPatrol(SecurityCheckResultsVO securityCheckResultsVO) {
		
		return this.securityPageMapper.SecurityPatrol(securityCheckResultsVO);
	}

	@Override
	public int SecurityPatrolFrom(SecurityCheckResultsVO securityCheckResultsVO) {
	    int count = this.securityPageMapper.SecurityPatrolFrom(securityCheckResultsVO);
	    
	    if (count > 0) {
	        // 총 점검 횟수 업데이트
	        securityPageMapper.TotalCumCheck(securityCheckResultsVO);
	        
	        // 최근 점검 날짜 업데이트
	        securityPageMapper.updateLatestInspectionDt(securityCheckResultsVO.getSecurityFacCd(), new Date());
	    }
	    
	    return count;
	}

	@Override
	public List<String> getChecklistItems(String checklistSeq) {
		// TODO Auto-generated method stub
		return this.securityPageMapper.getChecklistItems(checklistSeq);
	}

	@Override
	public int checkIfExists(String securityFacName) {
		// TODO Auto-generated method stub
		return this.securityPageMapper.checkIfExists(securityFacName);
	}

	@Override
	public SecurityFacilityVO getInspectionItems(String facCd) {
		// TODO Auto-generated method stub
		  return securityPageMapper.getInspectionItems(facCd);
	}

	@Override
	public List<SecurityChecklistVO> secListVOList(SecurityChecklistVO securityChecklistVO) {
		
		return securityPageMapper.secListVOList(securityChecklistVO);
	}

	@Override
	public List<SecurityWorkerVO> secworker(SecurityWorkerVO securityWorkerVO) {
		
		return securityPageMapper.secworker(securityWorkerVO);
	}
	//페트롤에서 시설삭제
	@Override
	public int SecurityPatrolDelete(String securityFacCd) {
		
		return securityPageMapper.SecurityPatrolDelete(securityFacCd);
	}






	
    
    
    
    
    


}