package kr.or.ddit.comn.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import kr.or.ddit.human.mapper.MemberMapper;
import kr.or.ddit.human.vo.BpVO;
import kr.or.ddit.human.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {
	//DI(의존성 주입)
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) 
			throws UsernameNotFoundException {
		
			MemberVO memberVO = this.memberMapper.getLogin(username);
			log.info("CustomUserDetailService, memberVO : " + memberVO);
			
//			this.memberMapper.getBpLogin(username);
			
//			if (memberVO == null && bpVO == null) {
//		        throw new UsernameNotFoundException("User not found");
//		    }
			
		return memberVO == null?null:new CustomUser(memberVO);
			 // memberVO와 bpVO를 모두 CustomUser로 반환
//		    return new CustomUser(memberVO, bpVO);
	}
	
	
	
	
	
	
//	//요청파라미터 : <input type="text" name="username"...
//	@Override
//	public UserDetails loadUserByUsername(String username) 
//			throws UsernameNotFoundException {
//		//파라미터 준비(public MemVO memLogin(MemVO memVO))
//		MemVO memVO = new MemVO();
//		//WHERE  A.USER_ID = 샵{userId}
//		memVO.setUserId(username);
//		//<resultMap type="memVO" id="memMap">
//		memVO = empMapper.memLogin(memVO);
//				
//		log.warn("EmpMapper에 의해 쿼리를 실행할 것임 : " + memVO);
//		
//		//3항 연산자. memVO가 null이면 null을 리턴하고, null이 아니면 USER를 리턴
//		return memVO==null?null:new CustomUser(memVO);
//	}
	
}






