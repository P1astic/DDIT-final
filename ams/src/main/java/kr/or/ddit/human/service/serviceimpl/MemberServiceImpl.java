package kr.or.ddit.human.service.serviceimpl;

import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.human.mapper.MemberMapper;
import kr.or.ddit.human.service.MemberService;
import kr.or.ddit.human.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public MemberVO checkEmail(MemberVO memberVO) {
		return  this.memberMapper.checkEmail(memberVO);
	}
	private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";
    private static final int PASSWORD_LENGTH = 12;
	
	//임시비밀번호 생성
	@Override
	public String randomPassword() {
		 SecureRandom random = new SecureRandom();
		 log.info("random :"+random);
		
		StringBuilder password = new StringBuilder(PASSWORD_LENGTH);
		log.info("password :"+password);

        for (int i = 0; i < PASSWORD_LENGTH; i++) {
            int index = random.nextInt(CHARACTERS.length());
            password.append(CHARACTERS.charAt(index));
        }
        String generatedPassword = password.toString();
        log.info("Generated random password: " + generatedPassword);
        
		return generatedPassword;
	}
	
	//임시 비밀번호 이메일 전송
	@Override
	public String sendEmail() {
		return null;
	}

	@Override
	public int updatePwd(MemberVO memberVO) {
		return this.memberMapper.updatePwd(memberVO);
	}
 	
	
	
}
