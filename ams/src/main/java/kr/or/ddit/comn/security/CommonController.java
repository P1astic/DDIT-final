package kr.or.ddit.comn.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/error")
public class CommonController {
	
	//접근access 거부denied 처리자handler 의 URI를 지정
	// 요청URI : /accessError
	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
		
		//forwarding
		//security 폴더의 accessError.jsp를 forwarding함
		return "error/accessError";
	}
	
	
	@GetMapping("/error400")
	public String error400() {
		//forwarding : jsp
		return "error/error400";
	}
	
	//요청URI : /error/error404
	@GetMapping("/error404")
	public String error404() {
		//forwarding : jsp
		return "error/error404";
	}
	
	//요청URI : /error/error500
	@GetMapping("/error500")
	public String error500() {
		//forwarding : jsp
		return "error/error500";
	}	
}
