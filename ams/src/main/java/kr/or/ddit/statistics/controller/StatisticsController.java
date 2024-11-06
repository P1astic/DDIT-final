package kr.or.ddit.statistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/emp/statistics")
@Slf4j
@Controller
public class StatisticsController {
	
	@GetMapping("/overview")
	public String overview() {
		
		return "emp/statistics/overview";
	}
	
}
