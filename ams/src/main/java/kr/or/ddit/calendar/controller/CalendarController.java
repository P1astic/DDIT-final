package kr.or.ddit.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.approv.service.ElecApvService;
import kr.or.ddit.calendar.service.CalendarService;
import kr.or.ddit.calendar.vo.CalendarVO;
import kr.or.ddit.human.vo.MemberVO;
import kr.or.ddit.videoChat.service.VideoChatService;
import kr.or.ddit.videoChat.vo.VideoChatVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 2024-09-25 김예영
 * 풀캘린더 api 작동 테스트 목적으로 생성
 */
@Slf4j
@RequestMapping("/emp/calendar")
@Controller
@PropertySource("classpath:application.properties")
public class CalendarController {
	
	@Inject
	CalendarService calendarService;
	
	@Inject
	VideoChatService videoChatService;
	
	@Value("${googleCalendarApiKey}")
	private String googleCalendarApiKey;	
 	
	// 접속 당일 날짜
	public String getToday() {
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = formatter.format(date);	
		return formattedDate;
	}
	
	// 캘린더 최초 접속
	@GetMapping("/list")
	public String getCalendar(Model model) {
		String nowDate = getToday();
		
		model.addAttribute("nowDate", nowDate);
		model.addAttribute("googleCalendarApiKey", googleCalendarApiKey);
		
		return "emp/calendar/list";
	}
	
	// 접속한 사용자의 캘린더 조회
	@ResponseBody
	@GetMapping("/getMySchedule")
	public List<CalendarVO> getMySchedule(@RequestParam String memId,
	                                      @RequestParam String deptCd) {

	    log.info("getMySchedule memId : " + memId);
	    log.info("getMySchedule deptCd : " + deptCd);

	    // 개인 스케쥴
	    List<CalendarVO> myScheduleList = this.calendarService.getMySchedule(memId);

	    // 회사 스케쥴
	    List<CalendarVO> commonScheduleList = this.calendarService.getComnSchedule();

	    // 부서 스케쥴
	    List<CalendarVO> deptScheduleList = this.calendarService.getDeptSchedule(deptCd);

	    log.info("getMySchedule myScheduleList : " + myScheduleList);
	    log.info("getMySchedule commonScheduleList : " + commonScheduleList);
	    log.info("getMySchedule deptScheduleList : " + deptScheduleList);

	    // 중복 제거를 위한 맵 (sche_id를 키로 사용)
	    Map<String, CalendarVO> scheduleMap = new HashMap<>();

	    // 개인 스케쥴 추가
	    for (CalendarVO schedule : myScheduleList) {
	        scheduleMap.put(schedule.getScheId(), schedule);
	    }

	    // 회사 스케쥴 추가 (중복 제거)
	    for (CalendarVO schedule : commonScheduleList) {
	        if (schedule.getScheType().equals("com")) {
	            // 이미 존재하는 같은 sche_id가 있으면 덮어씌우지 않음
	            scheduleMap.putIfAbsent(schedule.getScheId(), schedule);
	        } else {
	            scheduleMap.put(schedule.getScheId(), schedule);
	        }
	    }

	    // 부서 스케쥴 추가 (중복 제거)
	    for (CalendarVO schedule : deptScheduleList) {
	        if (schedule.getScheType().equals("com")) {
	            // 이미 존재하는 같은 sche_id가 있으면 덮어씌우지 않음
	            scheduleMap.putIfAbsent(schedule.getScheId(), schedule);
	        } else {
	            scheduleMap.put(schedule.getScheId(), schedule);
	        }
	    }

	    // 중복 제거된 리스트 반환
	    return new ArrayList<>(scheduleMap.values());
	}
	
	@ResponseBody
	@PostMapping("/getScheduleVideoChat")
	public VideoChatVO getScheduleVideoChat(@RequestParam String memId, @RequestParam String scheId, @RequestParam String roomId) {
		log.info("getScheduleVideoChat memId : " + memId);
		log.info("getScheduleVideoChat scheId : " + scheId);
		log.info("getScheduleVideoChat roomId : " + roomId);
		
		VideoChatVO videoChatVO = new VideoChatVO();
		videoChatVO.setMemId(memId);
		videoChatVO.setScheId(scheId);
		videoChatVO.setRoomId(roomId);
		
		VideoChatVO videoChatInfoVO = this.videoChatService.getScheduleVideoChat(videoChatVO);
		
		log.info("getScheduleVideoChat videoCahtInfoVO : " + videoChatInfoVO);
		
		return videoChatInfoVO;
	}

	
	//  스케쥴에 소속된 멤버 리스트
	@ResponseBody
	@GetMapping("/getScheduleMemList")
	public List<MemberVO> getScheduleMemList(@RequestParam String scheId) {
		log.info("getScheduleMemList scheId : " + scheId);
		
		List<MemberVO> memList = this.calendarService.getScheduleMemList(scheId);

		log.info("getScheduleMemList memList : " + memList);
		return memList;
	}
	
	
	// 일정 등록 
	@ResponseBody
	@PostMapping("/addSchedule")
	public String addSchedule(@RequestParam(value="scheTitle", required=false, defaultValue="") String scheTitle,
						   @RequestParam(value="scheStartDate", required=false, defaultValue="") String scheStartDate,
						   @RequestParam(value="scheStartTime", required=false, defaultValue="") String scheStartTime,
						   @RequestParam(value="scheEndDate", required=false, defaultValue="") String scheEndDate,
						   @RequestParam(value="scheEndTime", required=false, defaultValue="") String scheEndTime,
						   @RequestParam(value="createEmp", required=false, defaultValue="") String createEmp,
						   @RequestParam(value="scheType", required=false, defaultValue="") String scheType,
						   @RequestParam(value="backGroundColor", required=false, defaultValue="") String backGroundColor,
						   @RequestParam(value="selMemIdList", required=false, defaultValue="") String selMemIdList,
						   @RequestParam(value="scheContent", required=false, defaultValue="") String scheContent,
						   @RequestParam(value="allDay", required=false, defaultValue="") String allDay
						   ) {
		log.info("addSchedule Controller 도착");
		
		log.info("addSchedule scheTitle : " + scheTitle);
		log.info("addSchedule scheStartDate : " + scheStartDate);
		log.info("addSchedule scheStartTime : " + scheStartTime);
		log.info("addSchedule scheEndDate : " + scheEndDate);
		log.info("addSchedule scheEndTime : " + scheEndTime);
		log.info("addSchedule createEmp : " + createEmp);
		log.info("addSchedule scheType : " + scheType);
		log.info("addSchedule backGroundColor : " + backGroundColor);
		log.info("addSchedule selMemIdList : " + selMemIdList);
		log.info("addSchedule scheContent : " + scheContent);
		log.info("addSchedule allDay : " + allDay);
//		log.info("addSchedule selMemIdList String : " +(String)selMemIdList);
		
		String scheId = this.calendarService.createScheId();

		log.info("addSchedule create scheId : " + scheId);

		CalendarVO createVO = new CalendarVO();
		
		createVO.setScheId(scheId);
		createVO.setCreateEmp(createEmp);
		createVO.setMemId(createEmp);
		createVO.setScheStartDate(scheStartDate);
		createVO.setScheStartTime(scheStartTime);
		createVO.setScheEndDate(scheEndDate);
		createVO.setScheEndTime(scheEndTime);
		createVO.setBackGroundColor(backGroundColor);
		createVO.setScheContent(scheContent);
		createVO.setScheTitle(scheTitle);
		createVO.setScheType(scheType);
		createVO.setAllDay(allDay);
		
		int result = this.calendarService.createSchedule(createVO);
		log.info("addSchedule createVO result : " + result);		
		
		if(selMemIdList != null && !selMemIdList.trim().isEmpty() && !selMemIdList.equals("[]")) {
			selMemIdList = selMemIdList.replaceAll("[\\[\\]\"]", "");
			String[] selMemIdStrList = selMemIdList.split(",");		
			
			log.info("selMemIdStrList : " + selMemIdStrList);
			
			List<CalendarVO> calendarVOList = new ArrayList<>();
			
			for(String memId : selMemIdStrList) {
				CalendarVO member = new CalendarVO();
				member.setMemId(memId.trim());
				calendarVOList.add(member);
			}
			
			log.info("addSchedule calendarVOList before : " + calendarVOList);
			
			for(int i=0; i<calendarVOList.size(); i++) {
				calendarVOList.get(i).setScheId(scheId);
				calendarVOList.get(i).setCreateEmp(createEmp);
				calendarVOList.get(i).setScheStartDate(scheStartDate);
				calendarVOList.get(i).setScheStartTime(scheStartTime);
				calendarVOList.get(i).setScheEndDate(scheEndDate);
				calendarVOList.get(i).setScheEndTime(scheEndTime);
				calendarVOList.get(i).setBackGroundColor(backGroundColor);
				calendarVOList.get(i).setScheContent(scheContent);
				calendarVOList.get(i).setScheTitle(scheTitle);
				calendarVOList.get(i).setScheType(scheType);
				calendarVOList.get(i).setAllDay(allDay);
			}
			
			log.info("addSchedule calendarVOList after : " + calendarVOList);
			
			int memResult = 0;
			
			for(int i=0; i<calendarVOList.size(); i++) {
				try {
					memResult += this.calendarService.insertMember(calendarVOList.get(i));
				} catch (Exception e) {
					log.error("addSchedule insertMember Error : " + calendarVOList.get(i).getMemId());
				}
			}
			
			log.info("addSchedule insertMember Result : " + memResult);			
		}
		
		
		return scheId;
	}

	// 일정 수정
	@ResponseBody
	@PostMapping("/updateSchedule")
	public String updateSchedule(@RequestParam(value="scheId", required=false, defaultValue="") String scheId,
			@RequestParam(value="scheTitle", required=false, defaultValue="") String scheTitle,
			@RequestParam(value="scheStartDate", required=false, defaultValue="") String scheStartDate,
			@RequestParam(value="scheStartTime", required=false, defaultValue="") String scheStartTime,
			@RequestParam(value="scheEndDate", required=false, defaultValue="") String scheEndDate,
			@RequestParam(value="scheEndTime", required=false, defaultValue="") String scheEndTime,
			@RequestParam(value="createEmp", required=false, defaultValue="") String createEmp,
			@RequestParam(value="scheType", required=false, defaultValue="") String scheType,
			@RequestParam(value="backGroundColor", required=false, defaultValue="") String backGroundColor,
			@RequestParam(value="selMemIdList", required=false, defaultValue="") String selMemIdList,
			@RequestParam(value="scheContent", required=false, defaultValue="") String scheContent,
			@RequestParam(value="allDay", required=false, defaultValue="") String allDay
			) {
		log.info("updateSchedule Controller 도착");
		
		log.info("updateSchedule scheTitle : " + scheTitle);
		log.info("updateSchedule scheStartDate : " + scheStartDate);
		log.info("updateSchedule scheStartTime : " + scheStartTime);
		log.info("updateSchedule scheEndDate : " + scheEndDate);
		log.info("updateSchedule scheEndTime : " + scheEndTime);
		log.info("updateSchedule createEmp : " + createEmp);
		log.info("updateSchedule scheType : " + scheType);
		log.info("updateSchedule backGroundColor : " + backGroundColor);
		log.info("updateSchedule selMemIdList : " + selMemIdList);
		log.info("updateSchedule scheContent : " + scheContent);
		log.info("updateSchedule allDay : " + allDay);
//		log.info("updateSchedule selMemIdList String : " +(String)selMemIdList);
		
		
		
		log.info("updateSchedule scheId : " + scheId);
		
		CalendarVO createVO = new CalendarVO();
		
		createVO.setScheId(scheId);
		createVO.setCreateEmp(createEmp);
		createVO.setMemId(createEmp);
		createVO.setScheStartDate(scheStartDate);
		createVO.setScheStartTime(scheStartTime);
		createVO.setScheEndDate(scheEndDate);
		createVO.setScheEndTime(scheEndTime);
		createVO.setBackGroundColor(backGroundColor);
		createVO.setScheContent(scheContent);
		createVO.setScheTitle(scheTitle);
		createVO.setScheType(scheType);
		createVO.setAllDay(allDay);
		
		int result = this.calendarService.updateSchedule(createVO);
		log.info("updateSchedule createVO result : " + result);		
		
		if(selMemIdList != null && !selMemIdList.trim().isEmpty() && !selMemIdList.equals("[]")) {
			selMemIdList = selMemIdList.replaceAll("[\\[\\]\"]", "");
			String[] selMemIdStrList = selMemIdList.split(",");		
			
			log.info("selMemIdStrList : " + selMemIdStrList);
			
			List<CalendarVO> calendarVOList = new ArrayList<>();
			
			for(String memId : selMemIdStrList) {
				CalendarVO member = new CalendarVO();
				member.setMemId(memId.trim());
				calendarVOList.add(member);
			}
			
			log.info("updateSchedule calendarVOList before : " + calendarVOList);
			
			for(int i=0; i<calendarVOList.size(); i++) {
				calendarVOList.get(i).setScheId(scheId);
				calendarVOList.get(i).setCreateEmp(createEmp);
				calendarVOList.get(i).setScheStartDate(scheStartDate);
				calendarVOList.get(i).setScheStartTime(scheStartTime);
				calendarVOList.get(i).setScheEndDate(scheEndDate);
				calendarVOList.get(i).setScheEndTime(scheEndTime);
				calendarVOList.get(i).setBackGroundColor(backGroundColor);
				calendarVOList.get(i).setScheContent(scheContent);
				calendarVOList.get(i).setScheTitle(scheTitle);
				calendarVOList.get(i).setScheType(scheType);
				calendarVOList.get(i).setAllDay(allDay);
			}
			
			log.info("updateSchedule calendarVOList after : " + calendarVOList);
			
			int memResult = 0;
			
			for(int i=0; i<calendarVOList.size(); i++) {
				try {
					memResult += this.calendarService.updateMember(calendarVOList.get(i));
				} catch (Exception e) {
					log.error("updateSchedule insertMember Error : " + calendarVOList.get(i).getMemId());
				}
			}
			
			log.info("updateSchedule insertMember Result : " + memResult);			
		}
		
		
		return scheId;
	}
	
	// 일정 삭제
	@ResponseBody
	@PostMapping("/deleteSchedule")
	public int deleteSchedule(@RequestParam String scheId,
							  @RequestParam(value="roomId", required=false, defaultValue="") String roomId) {
		log.info("deleteSchedule scheId : " + scheId);
		log.info("deleteSchedule roomId : " + roomId);
		
		int result = 0;
		
		if(roomId != "" && roomId != null) {
			result += this.videoChatService.deleteRoom(roomId);
		}
		
		result += this.calendarService.deleteSchedule(scheId);
		
		return result;
	}
}
