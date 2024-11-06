package kr.or.ddit.airport.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/cust/map")
@Slf4j
@Controller
@PropertySource("classpath:application.properties")
public class MapController {
	// views/airport/main 
	
	@Value("${rooot_apiKey}")
	private String rooot_apiKey;	
	
	@GetMapping("/map")
	public String main() {
		
		log.info("연결확인!");
		return "cust/map/map";
	}
	@GetMapping("/info")
	public String info() {
		
		log.info("연결확인!");
		return "cust/map/info";
	}
	@GetMapping("/rooot")
	public String rooot(Model model) {
		
		log.info("연결확인!");
		
		model.addAttribute("rooot_apiKey", rooot_apiKey);
		
		
		return "cust/map/rooot";
	}
	@GetMapping("/how")
	public String how() {
		
		log.info("연결확인!");
		return "cust/map/how";
	}
	@GetMapping("/howCheck")
	public String howC() {
		
		log.info("연결확인!");
		return "cust/map/howCheck";
	}
	@GetMapping("/howW")
	public String howW() {
		
		log.info("연결확인!");
		return "cust/map/howW";
	}
	@GetMapping("/route")
	public String route(Model model) {
		
		log.info("연결확인!");
		model.addAttribute("rooot_apiKey", rooot_apiKey);
		
		return "cust/map/route";
	}
	@GetMapping("/dururu")
	public String dururu() {
		
		log.info("연결확인!");
		return "cust/map/dururu";
	}
	@GetMapping("/route2")
	public String route2(Model model) {
		
		log.info("연결확인!");
		
		model.addAttribute("rooot_apiKey", rooot_apiKey);
		
		return "cust/map/route2";
	}
}
