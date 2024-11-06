package kr.or.ddit.approv.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.approv.vo.UsageDetailVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/emp/use")
@Slf4j
@Controller
public class UsageDetailController {
	
	@Inject
	
	
	@GetMapping("/list")
	public String list() {
		
//		List<UsageDetailVO> UsageDetailVOList = this.
		
		return "";
		
	}
}
