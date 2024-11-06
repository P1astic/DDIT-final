package kr.or.ddit.human.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.human.ServiceResult;
import kr.or.ddit.human.vo.BpVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.JobGradeVO;
import kr.or.ddit.human.vo.MemberVO;



@Mapper
public interface MypageMapper {
	
//마이페이지 리스트 
	
	public List<EmployeeVO> list(EmployeeVO employeeVO);

	public int registPost(EmployeeVO EmployeedVO);

//	public MemberVO searchMember(@Param("memberVO") Object attribute);
	/*
	<select id="searchMember" parameterType="employeeVO"
		resultType="employeeVO">
	 */
	public EmployeeVO searchMember(String memId);
	
	//seachBp
	public BpVO searchBp(String memId);
	
	// INFO 수정
	public int update(EmployeeVO employeeVO);

	//MEMBER 테이블의 password 컬럼의 값을 수정
	public int updatePassword(EmployeeVO employeeVO);

	//Bp수정
	public int updateBp(BpVO bpVO);
	public int updatePasswordBp(BpVO bpVO);

	public int passwordCheck(MemberVO memberVO);

	public JobGradeVO getJbgdNm(String jbgdCd);

	public String getDeptNm(String deptCd);

	public String getGenderNm(String genderCd);

	public String getFrnSeCdNm(String memId);

	
	

}









