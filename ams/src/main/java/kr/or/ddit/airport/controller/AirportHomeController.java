package kr.or.ddit.airport.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.airplane.service.AirlineService;
import kr.or.ddit.airplane.vo.AirLineVO;
import kr.or.ddit.airport.service.AirportHomeService;
import lombok.extern.slf4j.Slf4j;

//공항 메인홈페이지
@RequestMapping("/cust")
@Slf4j
@Controller
@PropertySource("classpath:application.properties")
public class AirportHomeController {

	@Inject
	AirportHomeService airportHomeService;
	
	@Inject
	AirlineService airlineService;
	
	@Value("${aprtPsgrCongestionServiceKey}")
	private String aprtPsgrCongestionServiceKey;	
	
	@Value("${aprtWaitTimeServiceKey}")
	private String aprtWaitTimeServiceKey;
	
	//공항메인페이지
	@GetMapping("/main")
	public String main(Model model) {
		
		List<AirLineVO> airlineList = this.airlineService.airlineList();
		log.info("airlineList" + airlineList);
		
		model.addAttribute("airlineList", airlineList);
		model.addAttribute("aprtPsgrCongestionServiceKey", aprtPsgrCongestionServiceKey);
		model.addAttribute("aprtWaitTimeServiceKey", aprtWaitTimeServiceKey);
		
		return "cust/main";
	}
	
	@GetMapping("/airplane/serviceList")
	public String serviceList(Model model) {
		
		List<AirLineVO> airlineList = this.airlineService.airlineList();
		log.info("airlineList" + airlineList);

		// 현재 날짜를 가져옵니다.
		Date date = new Date();

		// 원하는 날짜 형식을 설정합니다.
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		// 포맷된 날짜를 문자열로 변환합니다.
		String formattedDate = dateFormat.format(date);

		// 모델에 추가합니다.
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("airlineList", airlineList);
		
		return "cust/airplane/serviceList";
		
	}
	
	//공항 메인페이지
	@GetMapping("/main2")
	public String main2 (Model model) {
		log.info("main2에 왔다");
		
		List<AirLineVO> airlineList = this.airlineService.airlineList();
		log.info("airlineList" + airlineList);
		
		model.addAttribute("airlineList", airlineList);
		model.addAttribute("aprtPsgrCongestionServiceKey", aprtPsgrCongestionServiceKey);
		model.addAttribute("aprtWaitTimeServiceKey", aprtWaitTimeServiceKey);
		
		return "cust/main2";
	}
	
	//공항 메뉴페이지
	@GetMapping("/airPage")
	public String airPage() {
		return "cust/airPage";
	}
	
	//사이트맵
	@GetMapping("/siteMap/list")
	public String siteMap() {
		return "cust/siteMap/list";
	}
	
	
}
