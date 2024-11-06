package kr.or.ddit.human.service.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.controller.ImgController;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.mapper.EmployeeMapper;
import kr.or.ddit.human.service.EmployeeService;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.JobGradeVO;
import kr.or.ddit.human.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 김인호
 * 사원 서비스
 * 24.09.13
 */
@Slf4j
@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Inject
	EmployeeMapper employeeMapper;
	
	@Inject
	ImgController imgController;
	
	/**
	 * @author 임세희
	 * 사원 리스트 출력
	 * 24.09.24
	 */
	public List<EmployeeVO> list(Map<String, Object> empMap){
		return this.employeeMapper.list(empMap);
	}
	
	/**
	 * @author 홍정호
	 * 사원 + 권한 리스트용 서비스
	 * 24.09.13.
	 */
	@Override
	public List<EmployeeVO> authEmpList(Map<String,Object> authMap) {
		// TODO Auto-generated method stub
		return this.employeeMapper.authEmpList(authMap);
	}
	
	 /** @author 임세희
	 * 사원 디테일
	 * 24.09.18.
	 */
	@Override
	public List<EmployeeVO> detail(String memId) {
		return this.employeeMapper.detail(memId);
	}
	
	/**
	 * @author 김인호
	 * 부서별 사원 리스트
	 * 24.09.18
	 */
	@Override
	public List<EmployeeVO> deptEmpListAjax(String deptCd){
		
		return this.employeeMapper.deptEmpListAjax(deptCd);
	}
	
	 /** @author 임세희
	 * 사원 등록- 아이디 중복확인
	 * 24.09.20.
	 */
	@Override
	public boolean selectById(String memId) {
		return true;
	}
	
	// 전체 수
	@Override
	public int getTotal(Map<String, Object> empMap) {
		return this.employeeMapper.getTotal(empMap);
	}

	//부서목록
	@Override
	public List<DeptVO> getDepts() {
		return this.employeeMapper.getDepts();
	}

	//직급목록
	@Override
	public List<JobGradeVO> getJobGrades() {
		return this.employeeMapper.getJobGrades();
	}
	
	//재직상태 목록
	@Override
	public List<CommonCodeDetailVO> getEmpStats() {
		return this.employeeMapper.getEmpStats();
	}
	//사원등록실행
	@Override
	public int registPost(EmployeeVO employeeVO) {
	log.info("registPost ServiceImpl -> employeeVO : " + employeeVO);
		
	 int result = 0;
      
     // 0) 파일 업로드 처리
	 MultipartFile singleFile = employeeVO.getUploadFile();
      
		//공통 멀티이미지업로드 메소드 호출
		String empImgUrl = null; //파일이 없는 경우 0으로 설정
		
		//파일이 있는 경우에만 실행
		if(singleFile!=null && singleFile.getOriginalFilename().length()>0) {
												// 파일객체    			  undefined				냥냥인호
			empImgUrl =this.imgController.empUploadMethod(singleFile, employeeVO.getMemId(), employeeVO.getEmpNm());
			/*
			UPDATE EMPLOYEE
				SET EMP_IMG_URL = 샴{empImgUrl},
				    EMP_IMG_NM = 샵{empImgNm}
				WHERE MEM_ID = 샵{memId}
			 */
			///upload/profile/emp/undefined_냥냥인호3/96fc951a-3988-429e-89b5-3fe518340a61_airplane4.jpg
			log.info("editPost EmployeeServiceImpl -> empImgUrl : " + empImgUrl);
		}else {
			empImgUrl =null;
		}
				
		//perSerVO의 fileGroupNo의 값을 세팅(한번 더 같은 값으로 업데이트해주려고 하고 있음)
		///upload/profile/emp/undefined_냥냥인호3/96fc951a-3988-429e-89b5-3fe518340a61_airplane4.jpg
		employeeVO.setEmpImgUrl(empImgUrl);
		
		//부서코드 소문자로 바꾸기 ==> C1 -> c1
		employeeVO.setDeptCd(employeeVO.getDeptCd().toLowerCase());

		//1) 사원 등록(emp24C1004)
		 result += this.employeeMapper.registPost(employeeVO);
		 log.info("registPost ServiceImpl -> result : " + result);
       
      return result;
	}


	@Override
	public int getAuthEmpTotal(Map<String, Object> authMap) {
		return this.employeeMapper.getAuthEmpTotal(authMap);
	}

	public List<EmployeeVO> list2(){
		return this.employeeMapper.list2();
	}

	/*
	 * 화상회의를 위한 부서, 사원 리스트 조회
	 */
	@Override
	public List<EmployeeVO> getEmpListForVideo(String deptCd) {
		return this.employeeMapper.getEmpListForVideo(deptCd);
	};
	
	//사원 수정 실행
	@Override
	public int editPost(EmployeeVO employeeVO) {
		
		int result =0;
		
		/*
		employeeVO : EmployeeVO(memId=emp24C1004, empNm=냥냥인호, empRrno=19940706, empEml=kim1@naver.com, 
			empMoblphon=01012341234, empZip=65432, empRoadNmAddr=456 Hillside Lane, empDaddr=House 12, empImgUrl=undefined,
			empImgNm=null, empYrycDaycnt=8, empHdofStat=T1, empJncmpYmd=20220419, empRsgntnYmd=20240912, empAtrzSgn=null, 
			jbgdCd=B4, deptCd=C1, empGender=V2, apvId=null, airNm=null, elecApvCn=null, tempSeCd=null, elecApvNo=null, 
			apvLineDetNo=0, elecApvTitle=null, deptNm=null, jbgdNm=null, jobGrade=null, department=null, auth=null, 
			password=null, enabled=null, rnum=null, memberVO=null, commonCodeDetailVO=null, 
			uploadFile=org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@19d2e4f4, 
			fileDetailVOList=null, fileDetailVO=null)
			
		[파일이 없을 때]
			EmployeeVO(memId=emp24C1020, empNm=오예영, empRrno=20240920, empEml=ohyes123@naver.com, empMoblphon=0101234567, empZip=04522, 
			empRoadNmAddr=서울 중구 남대문로 109, empDaddr=국제빌딩, empImgUrl=undefined, empImgNm=null, empYrycDaycnt=5, empHdofStat=T1, empJncmpYmd=20240101, 
			empRsgntnYmd=, empAtrzSgn=null, jbgdCd=B2, deptCd=C2, empGender=V1, apvId=null, airNm=null, elecApvCn=null, tempSeCd=null, elecApvNo=null, 
			apvLineDetNo=0, elecApvTitle=null, deptNm=null, jbgdNm=null, jobGrade=null, department=null, auth=null, password=null, enabled=null, rnum=null, 
			memberVO=null, commonCodeDetailVO=null, uploadFile=null, fileDetailVOList=null, fileDetailVO=null)
		 */
		
		//0)파일업로드 처리
		MultipartFile singleFile = employeeVO.getUploadFile();
		
		//공통 멀티이미지업로드 메소드 호출
		String empImgUrl = null; //파일이 없는 경우 0으로 설정
		
		//파일이 있는 경우에만 실행
		if(singleFile!=null && singleFile.getOriginalFilename().length()>0) {
												// 파일객체    			emp24C1004				냥냥인호
			empImgUrl =this.imgController.empUploadMethod(singleFile, employeeVO.getMemId(), employeeVO.getEmpNm());
			/*
			UPDATE EMPLOYEE
				SET EMP_IMG_URL = 샴{empImgUrl},
				    EMP_IMG_NM = 샵{empImgNm}
				WHERE MEM_ID = 샵{memId}
			 */
			//empImgUrl : /upload/profile/emp/emp24C1004_냥냥인호/9f9cc628-2cb6-41e3-83b8-65a37d8cfa11_멍절규.jpg
			log.info("editPost EmployeeServiceImpl -> empImgUrl : " + empImgUrl);
		}
				
		//perSerVO의 fileGroupNo의 값을 세팅(한번 더 같은 값으로 업데이트해주려고 하고 있음)
		employeeVO.setEmpImgUrl(empImgUrl);
		
		//1) 사원수정 등록
		 result += this.employeeMapper.editPost(employeeVO);
		 if(!employeeVO.getEmpHdofStat().equals("T1")) {
			 result += this.employeeMapper.updateEnabled(employeeVO.getMemId());
			 log.info("상태값 변화 -> getEmpHdofStat updateEnabled result : " + result);
			 return result;
		 }
		 
		 return result;
	}

	@Override
	public int editAuthPost(EmployeeVO employeeVO) {
		// TODO Auto-generated method stub
		return this.employeeMapper.editAuthPost(employeeVO);
		
	}

	@Override
	public List<MemberVO> getEmpListForChat(String deptCd) {
		// TODO Auto-generated method stub
		return this.employeeMapper.getEmpListForChat(deptCd);
	}
	
	//사원권한목록
	@Override
	public List<AuthVO> authList() {
		return this.employeeMapper.authList();
	}

	@Override
	public List<MemberVO> memList(String memId) {
		// TODO Auto-generated method stub
		return this.employeeMapper.memList(memId);
	}

	@Override
	public int updatePass(EmployeeVO employeeVO) {
		return this.employeeMapper.updatePass(employeeVO);
	}

	@Override
	public int updateEnabled(String memId) {
		return this.employeeMapper.updateEnabled(memId);
	};
	
	

}
