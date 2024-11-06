package kr.or.ddit.human.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;

import kr.or.ddit.human.ServiceResult;
import kr.or.ddit.human.vo.BpVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.MemberVO;

public interface MypageService {

	/**
	 * @author 조미주 마이페이지
	 * @param employeeVO
	 */
	public List<EmployeeVO> list(EmployeeVO employeeVO);

//	public MemberVO searchMember(Object attribute);
	public EmployeeVO searchMember(Object attribute);
	
//	public BpVO searchMember(Object attribute);
	public BpVO searchBp(Object attribute);

	//info 업데이트
	public int update(EmployeeVO employeeVO);

	public int bpPasswordCheckPost(MemberVO memberVO);
//BP업데이트
	public int updateBp(BpVO bpVO);

	public int empPasswordCheckPost(MemberVO memberVO);

	
//	public EmployeeVO searchMember(Object attribute);
}
