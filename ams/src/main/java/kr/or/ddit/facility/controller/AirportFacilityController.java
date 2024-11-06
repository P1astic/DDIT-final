package kr.or.ddit.facility.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.search.IntegerComparisonTerm;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.facility.service.AirportFacilityService;
import kr.or.ddit.facility.vo.AirportFacilityRSVVO;
import kr.or.ddit.facility.vo.AirportFacilityVO;
import kr.or.ddit.inven.util.InventoryPagination;
import kr.or.ddit.inven.vo.ItemVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/cust/airportFacility")
@Slf4j
@Controller
public class AirportFacilityController {
	// 비회원 공항시설
	
	@Inject
	AirportFacilityService airportFacilityService;
	
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Map<String,Object> listMap = new HashMap<String, Object>();
		listMap.put("gubun", gubun);
		listMap.put("keyword", keyword);
		listMap.put("currentPage", currentPage);
		log.info("listMap : "+listMap);
		
		int getTotal = this.airportFacilityService.getTotal(listMap);
		log.info("getTotal : "+getTotal);
		
		List<AirportFacilityRSVVO> airportFacilityRSVVOList = this.airportFacilityService.list1(listMap);
		log.info("airportFacilityRSVVOList : "+airportFacilityRSVVOList);
		
		InventoryPagination<AirportFacilityRSVVO> articlePage = new InventoryPagination<AirportFacilityRSVVO>(getTotal, currentPage, 15, airportFacilityRSVVOList, listMap);
		log.info("articlePage : "+articlePage);
		
		model.addAttribute("airportFacilityRSVVOList",airportFacilityRSVVOList);
		model.addAttribute("articlePage",articlePage);
		
		return "cust/facility/list";
	}
	
	@GetMapping("/regist")
	public String regist(Model model) {
		
		List<AirportFacilityVO> AirportFacilityVOList = this.airportFacilityService.airportFacilityList();
		log.info("AirportFacilityVOList : "+AirportFacilityVOList);
		
		model.addAttribute("AirportFacilityVOList",AirportFacilityVOList);
		
		return "cust/facility/regist";
	}
	
	// 시설예약
	@ResponseBody
	@PostMapping("/registPost")
	public int registPost(@RequestBody AirportFacilityRSVVO airportFacilityRSVVO) {
		log.info("registPost -> airportFacilityRSVVO : "+airportFacilityRSVVO);
		
		int result = this.airportFacilityService.registPost(airportFacilityRSVVO);
		log.info("registPost -> result : "+result);
		
//		List<AirportFacilityRSVVO> airportFacilityRSVVOList = this.airportFacilityService.list();
//		log.info("airportFacilityRSVVOList : "+airportFacilityRSVVOList);
//		
//		model.addAttribute("airportFacilityRSVVOList",airportFacilityRSVVOList);
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("/timeSetting")
	public List<AirportFacilityRSVVO> timeSetting(String aptFacRsvtYmd){
		
		log.info("aptFacRsvtYmd : "+aptFacRsvtYmd);
		List<AirportFacilityRSVVO> airportFacilityRSVVOList = this.airportFacilityService.timeSetting(aptFacRsvtYmd);
		log.info("timeSetting -> airportFacilityRSVVOList : "+airportFacilityRSVVOList);
		
		
		return airportFacilityRSVVOList;
	}
	
	@GetMapping("/detail")
	public String detail(Model model, String aptFacRsvtNo) {
		
		AirportFacilityRSVVO airportFacilityRSVVO = this.airportFacilityService.detail(aptFacRsvtNo);
		log.info("airportFacilityRSVVO : "+airportFacilityRSVVO);
		
		List<AirportFacilityVO> airportFacilityVOList = this.airportFacilityService.airportFacilityList();
		log.info("airportFacilityVOList : "+airportFacilityVOList);
		airportFacilityRSVVO.setAirportFacilityVOList(airportFacilityVOList);
		log.info("set airportFacilityRSVVO : "+airportFacilityRSVVO);
		
		model.addAttribute("airportFacilityRSVVO",airportFacilityRSVVO);
		
		return "cust/facility/detail";
	}
	
	@ResponseBody
	@PostMapping("/update")
	public int update(@RequestBody AirportFacilityRSVVO airportFacilityRSVVO) {
		log.info("airportFacilityRSVVO");
		
		
//		AirportFacilityRSVVO airportFacilityRSV = this.airportFacilityService.update(airportFacilityRSVVO);
		int result = this.airportFacilityService.update(airportFacilityRSVVO);
		log.info("update -> result : "+result);
		
		
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public int delete(String aptFacRsvtNo) {
		log.info("delete -> aptFacRsvtNo : "+aptFacRsvtNo);
		
		int result = this.airportFacilityService.delete(aptFacRsvtNo);
		log.info("delete -> result : "+result);
		
		return result;
	}
}
