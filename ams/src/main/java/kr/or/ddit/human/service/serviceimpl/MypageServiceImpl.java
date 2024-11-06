package kr.or.ddit.human.service.serviceimpl;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.human.ServiceResult;
import kr.or.ddit.human.mapper.MypageMapper;

import kr.or.ddit.human.service.MypageService;
import kr.or.ddit.human.vo.BpVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.JobGradeVO;
import kr.or.ddit.human.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MypageServiceImpl implements MypageService {

	@Inject
	MypageMapper mypageMapper;
	
	@Inject
	PasswordEncoder bcryptPasswordEncoder;

	@Override
	public List<EmployeeVO> list(EmployeeVO employeeVO) {
		return this.mypageMapper.list(employeeVO);
	}

//
//	@Override
//	public MemberVO searchMember(Object attribute) {
//		// TODO Auto-generated method stub
//		return this.mypageMapper.searchMember(attribute);
//	}
	@Override
	public EmployeeVO searchMember(Object attribute) {
		
		log.info("serviceImpl searchMember attribute : " + attribute);
		
		String memId = (String) attribute;
		log.info("serviceImpl searchMember memId : " + memId);
		
		// 사원 정보 가져오기
		EmployeeVO employeeVO = this.mypageMapper.searchMember(memId);
		log.info("serviceImpl employeeVO before : " + employeeVO);
		
		// 직급명 가져오기
		String jbgdCd = employeeVO.getJbgdCd();
		JobGradeVO jobGradeVO = this.mypageMapper.getJbgdNm(jbgdCd);
		employeeVO.setJbgdNm(jobGradeVO.getJbgdNm());
		employeeVO.setJbgdEnNm(jobGradeVO.getJbgdEnNm());
		
		// 부서명 가져오기
		String deptCd = employeeVO.getDeptCd();
		String deptNm = this.mypageMapper.getDeptNm(deptCd);
		employeeVO.setDeptNm(deptNm);
		
		// 성별 가져오기
		String genderCd = employeeVO.getEmpGender();
		String genderNm = this.mypageMapper.getGenderNm(genderCd);
		employeeVO.setEmpGender(genderNm);
		
		log.info("serviceImpl employeeVO after : " + employeeVO);

		return employeeVO;
	}

	@Override
	public BpVO searchBp(Object attribute) {
		
		log.info("serviceImpl searchBp attribute : " + attribute);
		
		String memId = (String) attribute;
		log.info("serviceImpl searchBp memId : " + memId);
		
		// 업체 정보 가져오기
		BpVO bpVO = this.mypageMapper.searchBp(memId);
		log.info("serviceImpl bpVO before : " + bpVO);
		
		// 업체 분류명 가져오기
		String deptCd = bpVO.getDeptCd();
		String deptNm = this.mypageMapper.getDeptNm(deptCd);
		bpVO.setDeptNm(deptNm);
		
		// 상세 업체명 가져오기
		String frnSeCdNm = this.mypageMapper.getFrnSeCdNm(memId);
		bpVO.setFrnSeCdNm(frnSeCdNm);		

		return bpVO;
	}


	@Override
	public int update(EmployeeVO employeeVO) {
		log.info("update ServiceImpl -> employeeVO : " + employeeVO);
		int result = 0;

		// employee 테이블 수정		
		result += this.mypageMapper.update(employeeVO);
		log.info("ServiceImpl ->result : " + result);
		
		if(employeeVO.getPassword() != null) {
			// MEMBER 테이블 수정
			result += this.mypageMapper.updatePassword(employeeVO);
			log.info("update ServiceImpl -> result : " + result);			
		}
		
		return result;

	}

	// bp 업데이트
	@Override
	public int updateBp(BpVO bpVO) {
		log.info("updateBp ServiceImpl -> bpVO : " + bpVO);
		
		int result = 0;
		
		// bpVO를 수정
		result += this.mypageMapper.updateBp(bpVO);
		log.info("updateBp -> result : " + result);

		if(bpVO.getPassword() != null) {
			result += this.mypageMapper.updatePasswordBp(bpVO);
			log.info("updateBp serviceImpl => result : " + result);
		}

		return result;

	}

	@Override
	public int bpPasswordCheckPost(MemberVO memberVO) {

		log.info("passwordCheckPost ServiceImpl -> memberVO : " + memberVO);
		int result = 0;
		// 비밀번호 체크
		/*
		 *1. PasswordEncoder 를 활용
		  - 회원의 아이디를 통해 비밀번호를 가져온 후
		  - 비밀번호 체크 모달에서 넘어온 비밀번호와
		  - 비교함
		 
		 2. 비밀번호를 암호화한 후 체크함
		  - 비밀번호 체크 모달에서 넘어온 비밀번호를
		  - 암호화
		  - mypageMapper.passwordCheck(memberVO); 메소드 수행
		 */
		
		BpVO bpVO = mypageMapper.searchBp(memberVO.getMemId());
		log.info("passwordcheckPost->bpVO : " + bpVO);
		//회원의 아이디를 통해 비밀번호를 가져온 후
		String dbPassword = bpVO.getPassword();
		//비밀번호 체크 모달에서 넘어온 비밀번호와
		String UserPassword = memberVO.getPassword();
		//비교함
		//UserPassword : asfdfdsasdf, dbPassword : $2a$10$SKMx6hvvzCLr.g4t9k56qOGm0xfriPmSg2eGtTmgigtK6/jU2BKhS
		log.info("UserPassword : " + UserPassword + ", dbPassword : " + dbPassword);
		
		//security-context.xml에서 옴
		// .matches(고객이 입력한 비밀번호 암호화 안 된 값, db에 있는 암호화 된 값)
		// 일치 : true / 불일치 : false
		boolean checkResult = bcryptPasswordEncoder.matches(UserPassword, dbPassword);
		log.info("checkResult : " + checkResult);
		
		if(checkResult) {//true 일치
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int empPasswordCheckPost(MemberVO memberVO) {
		
		log.info("passwordCheckPost ServiceImpl -> memberVO : " + memberVO);
		int result = 0;
		log.info("passwordCheckPost ServiceImpl -> result : " + result);
		// 비밀번호 체크
		/*
		 *1. PasswordEncoder 를 활용
		  - 회원의 아이디를 통해 비밀번호를 가져온 후
		  - 비밀번호 체크 모달에서 넘어온 비밀번호와
		  - 비교함
		 
		 2. 비밀번호를 암호화한 후 체크함
		  - 비밀번호 체크 모달에서 넘어온 비밀번호를
		  - 암호화
		  - mypageMapper.passwordCheck(memberVO); 메소드 수행
		 */
		
		EmployeeVO employeeVO = mypageMapper.searchMember(memberVO.getMemId());
		log.info("passwordcheckPost->employeeVO : " + employeeVO);
		//회원의 아이디를 통해 비밀번호를 가져온 후
		String dbPassword = employeeVO.getPassword();
		//비밀번호 체크 모달에서 넘어온 비밀번호와
		String UserPassword = memberVO.getPassword();
		//비교함
		//UserPassword : asfdfdsasdf, dbPassword : $2a$10$SKMx6hvvzCLr.g4t9k56qOGm0xfriPmSg2eGtTmgigtK6/jU2BKhS
		log.info("UserPassword : " + UserPassword + ", dbPassword : " + dbPassword);
		//security-context.xml에서 옴
		// .matches(고객이 입력한 비밀번호 암호화 안 된 값, db에 있는 암호화 된 값)
		// 일치 : true / 불일치 : false
		boolean checkResult = bcryptPasswordEncoder.matches(UserPassword, dbPassword);
		
		if(checkResult) {//true 일치
			result = 1;
		}else {
			result = 0;
		}

		return result;
	}

//	ServiceResult result = null;
//	EmployeeVO employeeVO = mapper.idCheck(empId);
//	if(employeeVO != null) {	// VO존재할때
//		result = ServiceResult.EXIST;
//	}else {
//		result = ServiceResult.NOTEXIST;
//	}
//	return result;

//	MemberVO memberVO = mypageMapper.
}