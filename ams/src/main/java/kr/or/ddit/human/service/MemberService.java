package kr.or.ddit.human.service;

import java.util.Map;

import kr.or.ddit.human.vo.MemberVO;

public interface MemberService {
//	public int updatePwd(Map<String,Object> map);

	//메일체크
	public MemberVO checkEmail(MemberVO memberVO);
	
	// 임시 비밀번호 생성
	public String randomPassword() ;
	
	// 임시 비밀번호 DB 업데이트 
//	public String updatePassword();
	
	// 임시 비밀번호 이메일 발급
	public String sendEmail();
	
	public int updatePwd(MemberVO memberVO);
	
}
