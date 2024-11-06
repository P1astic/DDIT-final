package kr.or.ddit.comn.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LogoutController {
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/logout")
	public String logOut() {
		log.info("logout 진입");
		
		return "loginForm";
	}
	
}
