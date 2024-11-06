package kr.or.ddit.human.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.JobGradeVO;
import kr.or.ddit.human.vo.MemberVO;

/**
 * @author 김인호
 * 사원 서비스
 * 24.09.13
 */
public interface EmployeeService {
	
	
	/**
	 * @author 임세희
	 * 사원 리스트 출력
	 * 24.09.24
	 */
	public List<EmployeeVO> list(Map<String, Object> empMap);
	
	
	/** 
	 * 사원상세
	 * @author 임세희
	 * @param memId
	 * 24.09.18
	 */
	public  List<EmployeeVO> detail(String memId);
	
	//사원권한목록
	public List<AuthVO> authList();
	
	/**
	 * @author 홍정호
	 * 사원 + 권한 리스트 출력
	 * 24.09.13
	 */
	public List<EmployeeVO> authEmpList(Map<String,Object> authMap);

	public List<EmployeeVO> deptEmpListAjax(String deptCd);
	
	/**
	 * @author 홍정호
	 * 사원 + 권한 갯수
	 */
	public int getAuthEmpTotal(Map<String, Object> authMap);	
	
	/** 사원 등록 - 아이디 중복조회 24.09.20
	 * @author 임세희
	 * @param memId
	 */
	public boolean selectById(String memId);
	
	/** 페이지네이션
	 * @param 
	 * @return
	 */
	public int getTotal(Map<String, Object> empMap);

	
//	<!-- 부서 목록 -->
//	<select id="getDepts" resultType="DeptVO">
	public List<DeptVO>  getDepts();
	
//	<!-- 직급 목록 -->
//	<select id="getJobGrades" resultType="JobGradeVO">
	public List<JobGradeVO> getJobGrades();
	
	//	<!-- 재직 상태 목록 -->
//	<select id="getEmpStats" resultType="CommonCodeDetailVO">
	public List<CommonCodeDetailVO> getEmpStats();
	
	/**
	 * 사원등록
	 * @param employeeVO
	 * @return
	 */
	public int registPost(EmployeeVO employeeVO);

	/**
	 * 사원 이미지 파일정보
	 * @param fileGroupNo
	 * @return
	 */
//	public FileDetailVO fileList(long fileGroupNo);
	public List<EmployeeVO> list2();
	
	/*
	 * 화상회의를 위한 부서, 사원 리스트 조회
	 */
	public List<EmployeeVO> getEmpListForVideo(String deptCd);
	
	// 사원정보 수정 실행
	public int editPost(EmployeeVO employeeVO);


	public int editAuthPost(EmployeeVO employeeVO);


	public List<MemberVO> getEmpListForChat(String deptCd);
	
	public List<MemberVO> memList(String memId);
	
	public int updatePass(EmployeeVO employeeVO);
	public int updateEnabled(String memId);
	
	
}
