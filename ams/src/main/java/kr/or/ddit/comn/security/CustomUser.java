package kr.or.ddit.comn.security;

//import java.util.ArrayList;
import java.util.Collection;
//import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.human.vo.MemberVO;

//User : 스프링 시큐리티가 제공하고 있는 사용자 정보 클래스
//사용자가 유저를 정의함
//memberVO(select결과)정보를 User(스프링 시큐리티에서 정의된 유저) 객체 정보에 연계하여 넣어줌
//CustomUser의 객체 = principal
public class CustomUser extends User {
	//이 memVO 객체는 JSP에서 사용할 수 있음
	private MemberVO memberVO;
	
	public CustomUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	
	public CustomUser(MemberVO memberVO) {
	     
	      super(memberVO.getMemId()+"",memberVO.getPassword(),
	    		  memberVO.getAuthLinkVOList().stream()
			         .map(auth->new SimpleGrantedAuthority(auth.getAuthCode()))
			         .collect(Collectors.toList()));
	      this.memberVO = memberVO;
	   }

	public MemberVO getMemberVO() {
		return memberVO;
	}


	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
}








