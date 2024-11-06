package kr.or.ddit.airplane.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.airplane.service.AirplaneService;
import kr.or.ddit.airplane.vo.AirLineVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PropertySource("classpath:application.properties")
public class AirplaneController {
	
	@Inject
	AirplaneService airplaneService;
	
	@Value("${ScheduleController_Key}")
	private String ServiceKey;
	
	/**
	 * 조회 사이트 접속시 당일 날짜 호출
	 * @return
	 */
	
	@GetMapping("/cust/airplane/arrivalList")
	public String getArrivalDate(Model model,
			@RequestParam(value="dateParam", required=false, defaultValue="") String dateParam,
			@RequestParam(value="airLineParam",required=false, defaultValue="") String airLineParam,
			@RequestParam(value="airFlnParam", required=false, defaultValue="") String airFlnParam,
			@RequestParam(value="startTimeParam", required=false, defaultValue="") String startTimeParam,
			@RequestParam(value="endTimeParam", required=false, defaultValue="") String endTimeParam
			) {
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat simpleDate2 = new SimpleDateFormat("yyyy.MM.dd(E) HH:mm");
		SimpleDateFormat simpleDate3 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat simpleDate4 = new SimpleDateFormat("HH:00");


        String todayDateforLink = simpleDate.format(new Date());
        String refreshDate = simpleDate2.format(new Date());
        String todayDate = simpleDate3.format(new Date());
        String nowTime = simpleDate4.format(new Date());
        String lastTime = "23:50";

        model.addAttribute("todayDateforLink", todayDateforLink);
        model.addAttribute("refreshDate", refreshDate);
        model.addAttribute("todayDate", todayDate);
        model.addAttribute("nowTime", nowTime);
        model.addAttribute("lastTime", lastTime);
        
        log.info("getDate -> todayDateforLink : " + todayDateforLink);
        log.info("getDate -> refreshDate : " + refreshDate);
        log.info("getDate -> todayDate : " + todayDate);
        log.info("getDate -> nowTime : " + nowTime);
        log.info("getDate -> lastTime : " + lastTime);
        
        List<CommonCodeDetailVO> nationName = this.airplaneService.getNationName();
        List<CommonCodeDetailVO> airLineName = this.airplaneService.getAirLineName();
        
        log.info("nationName : " + nationName);
        log.info("airLineName : " + airLineName);
        model.addAttribute("disableFooter", true);
        model.addAttribute("nationName", nationName);
        model.addAttribute("airLineName", airLineName);
        
        List<AirLineVO> airLineVO = this.airplaneService.getAirLines();
        
        log.info("airLineVO : " + airLineVO);
        
        model.addAttribute("airLineVO", airLineVO);
        
        //RequestParam이 있을때 model addAttribute 실행
        if(dateParam!=null || dateParam != "") {
        	log.info("date from main.jsp : " + dateParam);
        	model.addAttribute("dateParam", dateParam);
        }
        if(airLineParam != null || airLineParam != "") {
        	log.info("airLine from main.jsp : " + airLineParam);
        	model.addAttribute("airLineParam", airLineParam);
        }
        if(airFlnParam != null || airFlnParam != "") {
        	log.info("airFlnParam from main.jsp : " + airFlnParam);
        	model.addAttribute("airFlnParam", airFlnParam);
        }
        if(startTimeParam != null || startTimeParam != "") {
        	log.info("startTime from main.jsp : " + startTimeParam);
        	model.addAttribute("startTimeParam", startTimeParam);
        }
        if(endTimeParam != null || endTimeParam != "") {
        	log.info("endTime from main.jsp : " + endTimeParam);
        	model.addAttribute("endTimeParam", endTimeParam);
        }
        
        model.addAttribute("ServiceKey", ServiceKey);
        
        return "cust/airplane/arrivalList";
	}

	/**
	 * 조회 사이트 접속시 당일 날짜 호출
	 * @return
	 */
	@GetMapping("/cust/airplane/departureList")
	public String getDepartureDate(Model model,
			@RequestParam(value="dateParam", required=false, defaultValue="") String dateParam,
			@RequestParam(value="airLineParam",required=false, defaultValue="") String airLineParam,
			@RequestParam(value="airFlnParam", required=false, defaultValue="") String airFlnParam,
			@RequestParam(value="startTimeParam", required=false, defaultValue="") String startTimeParam,
			@RequestParam(value="endTimeParam", required=false, defaultValue="") String endTimeParam
			) {
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat simpleDate2 = new SimpleDateFormat("yyyy.MM.dd(E) HH:mm");
		SimpleDateFormat simpleDate3 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat simpleDate4 = new SimpleDateFormat("HH:00");


        String todayDateforLink = simpleDate.format(new Date());
        String refreshTime = simpleDate2.format(new Date());
        String todayDate = simpleDate3.format(new Date());
        String nowTime = simpleDate4.format(new Date());
        String lastTime = "23:50";

        model.addAttribute("todayDateforLink", todayDateforLink);
        model.addAttribute("refreshTime", refreshTime);
        model.addAttribute("todayDate", todayDate);
        model.addAttribute("nowTime", nowTime);
        model.addAttribute("lastTime", lastTime);
        
        log.info("getDate -> todayDateforLink : " + todayDateforLink);
        log.info("getDate -> refreshTime : " + refreshTime);
        log.info("getDate -> todayDate : " + todayDate);
        log.info("getDate -> nowTime : " + nowTime);
        log.info("getDate -> lastTime : " + lastTime);
        
        List<CommonCodeDetailVO> nationName = this.airplaneService.getNationName();
        List<CommonCodeDetailVO> airLineName = this.airplaneService.getAirLineName();
        
        log.info("nationName : " + nationName);
        log.info("airLineName : " + airLineName);
        
        model.addAttribute("nationName", nationName);
        model.addAttribute("airLineName", airLineName);
        
        List<AirLineVO> airLineVO = this.airplaneService.getAirLines();
        
        log.info("airLineVO : " + airLineVO);
        model.addAttribute("disableFooter", true);
        model.addAttribute("airLineVO", airLineVO);
        
        
     // RequestParam이 있을 때 model addAttribute 실행
        if (dateParam != null && !dateParam.isEmpty()) {
            log.info("date from main.jsp : " + dateParam);
            model.addAttribute("dateParam", dateParam);
        }
        if (airLineParam != null && !airLineParam.isEmpty()) {
            log.info("airLine from main.jsp : " + airLineParam);
            model.addAttribute("airLineParam", airLineParam);
        }
        if (airFlnParam != null && !airFlnParam.isEmpty()) {
            log.info("airFln from main.jsp : " + airFlnParam);
            model.addAttribute("airFlnParam", airFlnParam);
        }
        if (startTimeParam != null && !startTimeParam.isEmpty()) {
            log.info("startTime from main.jsp : " + startTimeParam);
            model.addAttribute("startTimeParam", startTimeParam);
        }
        if (endTimeParam != null && !endTimeParam.isEmpty()) {
            log.info("endTime from main.jsp : " + endTimeParam);
            model.addAttribute("endTimeParam", endTimeParam);
        }
        
        model.addAttribute("ServiceKey", ServiceKey);
		
		return "cust/airplane/departureList";
	}
	
}
