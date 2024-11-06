package kr.or.ddit.comn.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;

import kr.or.ddit.comn.service.LoginService;
import kr.or.ddit.comn.vo.AuthMenuVO;
import kr.or.ddit.comn.vo.BigMnVO;
import kr.or.ddit.comn.vo.MidMnVO;
import kr.or.ddit.comn.vo.SmMnVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler extends 
	SavedRequestAwareAuthenticationSuccessHandler {
	@Autowired
	   PasswordEncoder passwordEncoder;
	
	@Autowired
	private LoginService loginService;
	
	/**
	 * @author 홍정호
	 * 24.9.15.
	 * 권한값을 /emp/main으로 보내기 위해 response.sendRedirect를 forward형식으로 변환함
	 */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication auth)//Authentication auth 로그인 인증 객체 
			throws ServletException, IOException {
		log.info("onAuth 진입");
		User customUser = (User)auth.getPrincipal(); //auth.getPrincipal() : 사용자 정보를 가져옴
		//사용자 아이디를 리턴
		String userId = customUser.getUsername();
	      
		List<String> roleNames = new ArrayList<String>();

		auth.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		
		HttpSession loginSession = request.getSession();
		
		Map<String, Object> roleNamesMap = new HashMap<String, Object>();
		
		for(int i = 0; i < roleNames.size(); i++) {
			roleNamesMap.put((String)roleNames.get(i), roleNames.get(i));
		}
		
		List<AuthMenuVO> authMenuList = this.loginService.authMenuList(roleNamesMap);
		List<AuthMenuVO> menuList = this.loginService.authMenuList();
		
		loginSession.setAttribute("userId", userId);
		loginSession.setAttribute("roleNames", roleNames);
		loginSession.setAttribute("authMenuList", authMenuList);//권한별 메뉴
		loginSession.setAttribute("menuList", menuList); // 모든 메뉴
		
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/emp/main");
		}else if(roleNames.contains("ROLE_AIR") || roleNames.contains("ROLE_FRN") || roleNames.contains("ROLE_SBCTR")) {
			response.sendRedirect("/bp/board/list");
		}else {
			super.onAuthenticationSuccess(request, response, auth);
		}
		
	}
	
}
