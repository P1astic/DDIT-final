package kr.or.ddit.human.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.JobGradeVO;
import kr.or.ddit.human.vo.MemberVO;

/**
 * @author 김인호
 * 사원 매퍼
 * 24.09.13
 */
@Mapper
public interface EmployeeMapper {
	/**
	 * @author 임세희
	 * 사원 리스트 출력
	 * 24.09.24
	 */
	public List<EmployeeVO> list(Map<String, Object> empMap);
	
	
	/**
	 * @author 홍정호
	 * 사원 + 권한 리스트 출력
	 * 24.09.13.
	 */
	public List<EmployeeVO> authEmpList(Map<String,Object> authMap);

	/**
	 * @author 임세희
	 * @param memId
	 * @return 
	 * 24.09.18
	 */
	public List<EmployeeVO> detail(String memId);
	
	
	/**
	 * @author 김인호
	 * 부서별 사원 리스트
	 * 24.09.18
	 */
	public List<EmployeeVO> deptEmpListAjax(String deptCd);
	
	/**  아이디 중복조회 24.09.20
	 * @author 임세희
	 * @param memId
	 */
	public boolean selectById(String memId);

	/** 페이지네이션
	 * @param 임세희
	 * @return
	 */
	public int getTotal(Map<String, Object> empMap);
	
	//사원권한목록
	public List<AuthVO> authList();
	
//	<!-- 부서 목록 -->
//	<select id="getDepts" resultType="hashMap">
	public List<DeptVO> getDepts();
	
//	<!-- 직급 목록 -->
//	<select id="getJobGrades" resultType="JobGradeVO">
	public List<JobGradeVO> getJobGrades();
	
	//	<!-- 재직 상태 목록 -->
//	<select id="getEmpStats" resultType="CommonCodeDetailVO">
	public List<CommonCodeDetailVO> getEmpStats();
	
	public int getAuthEmpTotal(Map<String, Object> authMap);

	public List<Map<String, Object>> getGenders();

	//사원등록실행
	public int registPost(EmployeeVO employeeVO);

	// 이미지 업데이트 _ 예영
	public int updateImg(EmployeeVO employeeVO);


	public List<EmployeeVO> list2();

	/*
	 * 화상회의를 위한 부서, 사원 리스트 조회
	 */
	public List<EmployeeVO> getEmpListForVideo(String deptCd);
	

	// 사원정보 수정
	public int editPost(EmployeeVO employeeVO);


	public int editAuthPost(EmployeeVO employeeVO);


	/**
	 * @author 홍정호
	 * 협력업체, 내부직원 목록 조회
	 */
	public List<MemberVO> getEmpListForChat(String deptCd);
	
	public List<MemberVO> memList(String memId);
	
	public int updatePass(EmployeeVO employeeVO);
	public int updateEnabled(String memId);
}
