package kr.or.ddit.videoChat.controller;




import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.calendar.service.CalendarService;
import kr.or.ddit.calendar.vo.CalendarVO;
import kr.or.ddit.human.service.DeptService;
import kr.or.ddit.human.service.EmployeeService;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.videoChat.service.VideoChatService;
import kr.or.ddit.videoChat.vo.VideoChatMemberVO;
import kr.or.ddit.videoChat.vo.VideoChatVO;
import lombok.extern.slf4j.Slf4j;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Slf4j
@RequestMapping("/emp/videoChat")
@Controller
public class VideoChatController {
	
	public int index = 1; // 동일한 방 제목일 경우 url을 다르게 주기 위해 인덱스 생성
	
	@Inject
	VideoChatService videoChatService;
		
	@Inject
	EmployeeService employeeService;
	
	@Inject
	DeptService deptService;
	
	@Inject
	CalendarService calendarService;
	
	// 날짜 형식 변환
	private Date parseDate(String dateStr) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 포맷 조정 필요
	    try {
	        return dateFormat.parse(dateStr);
	    } catch (ParseException e) {
	        log.error("Date parsing error: " + e.getMessage());
	        return null; // 오류 발생 시 null 반환
	    }
	}
	
	// 날짜 인코딩
	public String dateFormat(String date) {
		
		String formattedDate = "";
		
		try {
			// date 디코딩
			String decodedDate = URLDecoder.decode(date, StandardCharsets.UTF_8.name());
			
			// 문자열을 ZoneDateTime으로 변환
			DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("EEE MMM dd yyyy HH:mm:ss Z", Locale.ENGLISH);
			ZonedDateTime zoneDateTime = ZonedDateTime.parse(decodedDate, inputFormatter);
			
			// 디코딩된 문자열 형 변환
			DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
			formattedDate = zoneDateTime.format(outputFormatter);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return formattedDate;
	}
	
	@GetMapping("/list")
	public String list() {
		return "emp/videoChat/list";
	}
	
	// 최초 접속 시 리스트, 접속자 명단 가져오기
	@ResponseBody
	@PostMapping("/getMyList")
	public List<VideoChatVO> getMyList(@RequestParam(value="memId", required=false) String memId) throws Exception {
	    
	    log.info("getMyList memId : " + memId);
	    
	    List<VideoChatMemberVO> myRoomIdList = this.videoChatService.getMyRoomIdList(memId);
	    
	    // myRoomIdList 가 null인지 확인
	    if (myRoomIdList == null) {
	        log.warn("myRoomIdList is null for memId: " + memId);
	        return new ArrayList<>(); // 빈 리스트 반환
	    }
	    
	    log.info("getMyList myRoomList : " + myRoomIdList);
	    
	    List<VideoChatVO> myRoomInfo = new ArrayList<VideoChatVO>();
	    for (VideoChatMemberVO roomId : myRoomIdList) {
	        VideoChatVO videoChatVO = this.videoChatService.getMyRoomInfo(roomId.getRoomId());
	        if (videoChatVO != null) { // videoChatVO가 null이 아닐 때만 추가
	            myRoomInfo.add(videoChatVO);
	        }
	    }
	    
	 // roomNo 기준으로 역순 정렬
	 		Collections.sort(myRoomInfo, new Comparator<VideoChatVO>() {
	 		    @Override
	 		    public int compare(VideoChatVO room1, VideoChatVO room2) {
	 		        return Integer.compare(room2.getRoomNo(), room1.getRoomNo()); // 역순
	 		    }
	 		});
	    
	    log.info("myRoomInfo : " + myRoomInfo);
	    
	    // 시작일시, 종료일시 형변환해서 저장
	    for (VideoChatVO room : myRoomInfo) {
	        String startDate = dateFormat(room.getRoomStDate());
	        String endDate = dateFormat(room.getRoomEdDate());
	        
	        room.setRoomStDate(startDate);
	        room.setRoomEdDate(endDate);
	    }
	    
	    return myRoomInfo;
	}
	
	@ResponseBody
	@GetMapping("/getMyMemList")
	public List<VideoChatMemberVO> getMyMemList(@RequestParam String memId) {
		List<VideoChatMemberVO> videoChatMemberVOList = this.videoChatService.getMemList();
		return videoChatMemberVOList;
	}
		
	
	// 참여 클릭 시 접속 url 가져오기
	@SuppressWarnings("deprecation")
	@ResponseBody
	@GetMapping("/getUrl")
	public JSONObject getUrl(@RequestParam String roleId, @RequestParam String roomId, @RequestParam String apiUserId, @RequestParam String username) throws Exception {
		
		log.info("roleId : " + roleId);
		log.info("roomId : " + roomId);
		log.info("apiUserId : " + apiUserId);
		log.info("username : " + username);
		
		String encodedUsername = URLEncoder.encode(username, "UTF-8");
		
		OkHttpClient client = new OkHttpClient();

		MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
		RequestBody body = RequestBody.create(mediaType, 
				"roleId=" + roleId
				+ "&apiUserId=" + apiUserId
				+ "&ignorePasswd=" + "false"
				+ "&roomId=" + roomId
				+ "&username=" + encodedUsername);
		Request request = new Request.Builder()
		  .url("https://openapi.gooroomee.com/api/v1/room/user/otp/url")
		  .post(body)
		  .addHeader("accept", "application/json")
		  .addHeader("content-type", "application/x-www-form-urlencoded")
		  .addHeader("X-GRM-AuthToken", "12056163501988613cf51b7b51cdd8140bb172761d02211a8b")
		  .build();

		Response response = client.newCall(request).execute();
		
		JSONParser jsonParser = new JSONParser();
		Object obj = jsonParser.parse(response.body().string());
		JSONObject jsonObj = (JSONObject) obj;
		
		log.info("response : " + response);
		log.info("jsonObj : " + jsonObj);

		
		return jsonObj;
	}
	
	// 회의 생성하기
	@SuppressWarnings("deprecation")
	@ResponseBody
	@GetMapping("/createRoom")
	public List<VideoChatVO> createRoom(@RequestParam String selMemIdList,
										@RequestParam String roomTitle,
										@RequestParam String roomStDate,
										@RequestParam String roomEdDate,
										@RequestParam String memId
										) throws Exception {
		
		VideoChatVO videoChatVO = new VideoChatVO();
		
		log.info("createRoom roomTitle : " + roomTitle);					// 방 제목					찐테스트
		log.info("createRoom roomStDate : " + roomStDate);					// 시작일시				Mon%20Sep%2030%202024%2016%3A03%3A00%20%2B0900
		log.info("createRoom roomEdDate : " + roomEdDate);					// 종료일시				Mon%20Sep%2030%202024%2017%3A04%3A00%20%2B0900
		log.info("createRoom apiUserId : " + memId);						// 사용자 ID				admin1
		
		// roomUrlId 생성
		// UUID를 생성하여 roomUrlId에 추가
	    String roomUrlId = roomTitle + "_" + UUID.randomUUID().toString(); 	// 방 urlId				찐테스트_123e4567-e89b-12d3-a456-426614174000
	    
		log.info("createRoom roomUrlId : " + roomUrlId);					// 방 urlId				찐테스트_123e4567-e89b-12d3-a456-426614174000
		
		String encodedRoomTitle = URLEncoder.encode(roomTitle, "UTF-8");	// 방 제목 인코딩			%EC%B0%90%ED%85%8C%EC%8A%A4%ED%8A%B8
		String encodedRoomUrlId = URLEncoder.encode(roomUrlId, "UTF-8");	// 방 urlId 인코딩			%EC%B0%90%ED%85%8C%EC%8A%A4%ED%8A%B81
		
		log.info("createRoom encodedRoomUrlId : " + encodedRoomUrlId);					// 사용자 ID				admin1
		log.info("createRoom selMemIdList : " + selMemIdList);					// 참여자 목록				
		
		// client 생성
		OkHttpClient client = new OkHttpClient();
		
		// 구루미로 데이터 전송 및 수신
		MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
		RequestBody body = RequestBody.create(mediaType,
				"callType=P2P"
				+ "&liveMode=false"
				+ "&maxJoinCount=20"
				+ "&liveMaxJoinCount=100"
				+ "&layoutType=4"
				+ "&sfuIncludeAll=true"
				+ "&startDate=" + roomStDate
				+ "&endDate=" + roomEdDate
				+ "&roomTitle=" + encodedRoomTitle
				+ "&roomUrlId=" + encodedRoomUrlId);
		Request request = new Request.Builder()
		  .url("https://openapi.gooroomee.com/api/v1/room")
		  .post(body)
		  .addHeader("accept", "application/json")
		  .addHeader("content-type", "application/x-www-form-urlencoded")
		  .addHeader("X-GRM-AuthToken", "12056163501988613cf51b7b51cdd8140bb172761d02211a8b")
		  .build();
		
		Response response = client.newCall(request).execute();
		
		// JSONParser 생성
		JSONParser jsonParser = new JSONParser();
		
		// 수신받은 데이터 파싱
		Object obj = jsonParser.parse(response.body().string());
		JSONObject jsonObj = (JSONObject) obj;		
		
		log.info("createRoom jsonObj : " + jsonObj);
		
		JSONObject dataObj = (JSONObject) jsonObj.get("data");		// jsonObj에서 data json 꺼내기
		JSONObject roomObj = (JSONObject) dataObj.get("room");		// data json에서 room json 꺼내기
		
		// roomId 꺼내서 변수에 저장
		String roomId = (String) roomObj.get("roomId");
		
		// videoChatVO에 roomId 세팅
		videoChatVO.setRoomId(roomId);		
		videoChatVO.setRoomTitle(roomTitle);
		videoChatVO.setRoomStDate(roomStDate);
		videoChatVO.setRoomEdDate(roomEdDate);
		videoChatVO.setMemId(memId);
		
//		ROOM_MAX_JOIN : 기본값 16으로 줄 것
//		ROOM_CURR_JOIN : 기본값 0으로 줄 것
		
		// 방 생성
		int result = this.videoChatService.createRoom(videoChatVO);
		
		// 방 생성자의 videoChatMemberVO 생성
		// 방 생성자는 roleId가 다르므로 따로 vo를 생성함
		VideoChatMemberVO creatorVO = new VideoChatMemberVO();
		creatorVO.setMemId(memId);
		creatorVO.setRoleId("emcee");
		creatorVO.setRoomId(roomId);
		
		int craetorResult = this.videoChatService.insertCreator(creatorVO);
		
		log.info("createROom creatorResult : " + craetorResult);
		
		// 참여자가 있다면, 각 참여자에게 방 정보 추가 시작
		if(selMemIdList != null && !selMemIdList.trim().isEmpty() && !selMemIdList.equals("[]")) {
			
			log.info("creatRoom selMemIdList : " +(String)selMemIdList);
			
			selMemIdList = selMemIdList.replaceAll("[\\[\\]\"]", "");		// 배열에서 [ ] 삭제함
			
			String[] selMemIdStrList = selMemIdList.split(",");				// ',' 기준으로 나눠서 다시 배열에 저장
			
			log.info("createRoom selMemIdList replace ( [] 삭제 ) : " + selMemIdList);
			log.info("createRoom selMemIdStrList split ( , 삭제 ) : " + selMemIdStrList);
	
			List<VideoChatMemberVO> videoChatMemberVOList = new ArrayList<>();
			
			// 멤버 리스트별로 vo를 생성하고, 해당 vo에 memId 정보 넣기
			for (String memberId : selMemIdStrList) {
			    VideoChatMemberVO member = new VideoChatMemberVO();
			    member.setMemId(memberId.trim());
			    
			    // 만들어진 vo를 list에 넣기
			    videoChatMemberVOList.add(member);
			}
			
			log.info("createRoom videoChatMemberVOList roomId, roleId 지정 전 : " + videoChatMemberVOList);
			
			// 참여자는 participant로 고정
			String roleId = "participant";
			
			for(int i=0; i<videoChatMemberVOList.size(); i++){
				videoChatMemberVOList.get(i).setRoomId(roomId);
				videoChatMemberVOList.get(i).setRoleId(roleId);
			}
			
			log.info("createRoom videoChatMemberVOList roomId, roleId 지정 후 : " + videoChatMemberVOList);	
			
			int memResult = 0;
			
			// 참여자 수 만큼 insert문 반복
			for (int i = 0; i < videoChatMemberVOList.size(); i++) {
			    try {
			        memResult += this.videoChatService.insertMember(videoChatMemberVOList.get(i));
			    } catch (Exception e) {
			        log.error("Error inserting member: " + videoChatMemberVOList.get(i).getMemId(), e);
			    }
			}
			
			// 참여자 추가 끝
			log.info("createRoom 참여자 추가 memResult : " + memResult);
		}
		
		// 생성이 끝나고 현재 나의 방 아이디 리스트 조회
		List<VideoChatMemberVO> myRoomIdList = this.videoChatService.getMyRoomIdList(memId);		
		
		log.info("createRoom myRoomIdList : " + myRoomIdList);
		
		// 아이디에 해당하는 방 정보 가져오기
		List<VideoChatVO> myRoomInfo = new ArrayList<VideoChatVO>();
		for(int i=0; i<myRoomIdList.size(); i++) {
			VideoChatVO roomVO = new VideoChatVO();
			roomVO = this.videoChatService.getMyRoomInfo(myRoomIdList.get(i).getRoomId());
			myRoomInfo.add(i, roomVO);
		}
		
		// roomNo 기준으로 역순 정렬
		Collections.sort(myRoomInfo, new Comparator<VideoChatVO>() {
		    @Override
		    public int compare(VideoChatVO room1, VideoChatVO room2) {
		        return Integer.compare(room2.getRoomNo(), room1.getRoomNo()); // 역순
		    }
		});
		
		// 최종적으로 반환되는 값
		log.info("myRoomInfo : " + myRoomInfo);
		
		
		
		/*
		 * 화상채팅 방 생성 시 받아온 날짜
		 * roomStDate : Sat%20Oct%2005%202024%2022%3A14%3A00%20%2B0900
		 * roomEdDate : Sat%20Oct%2005%202024%2023%3A14%3A00%20%2B0900
		 */
		
		// 생성된 회의 정보 캘린더에 추가
		// 1. scheId 생성
		String scheId = this.calendarService.createScheId();
		log.info("createRoom scheId : " + scheId);


		// 2. 일정 최초 생성자 정보 저장		
		CalendarVO createVO = new CalendarVO();
		createVO.setScheId(scheId);
		createVO.setCreateEmp(memId);
		createVO.setMemId(memId);
		createVO.setBackGroundColor("#6db66d");
		createVO.setScheContent(roomTitle);
		createVO.setScheTitle(roomTitle);
		createVO.setScheType("videoChat");	
		createVO.setAllDay("false");	// 하루종일인 회의 없으므로 false로 고정
		createVO.setRoomId(roomId);
		
		// 시작일시, 종료일시 형변환해서 저장(yyyy/mm/dd hh:mm)
		log.info("형 변환 전의 startDate " + roomStDate); // Wed%20Oct%2023%202024%2004%3A47%3A00%20%2B0900
		log.info("형 변환 전의 endDate : " + roomEdDate); 
		
		String startDate = dateFormat(roomStDate); 
		String endDate = dateFormat(roomEdDate);

		// myRoomIf의 시작/종료 일시 인코딩
		for(int i=0; i<myRoomInfo.size(); i++) {
			String myRoomInfoStDate = myRoomInfo.get(i).getRoomStDate();
			String myRoomInfoEdDate = myRoomInfo.get(i).getRoomEdDate();
			myRoomInfoStDate = dateFormat(myRoomInfoStDate);
			myRoomInfoEdDate = dateFormat(myRoomInfoEdDate);
			myRoomInfo.get(i).setRoomStDate(myRoomInfoStDate);
			myRoomInfo.get(i).setRoomEdDate(myRoomInfoEdDate);
		}
		
		log.info("형 변환 된 startDate " + roomStDate);							// 2024/10/23 04:47
		log.info("형 변환 된 endDate : " + roomEdDate);
			
		// 캘린더용 날짜로 다시 형 변환하기 위한 포맷터 (yyyy-mm-dd , hh:mm:00)
		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat outputTimeFormat = new SimpleDateFormat("HH:mm:00");
		
		// 문자열을 Date 객체로 변환
		Date startDateCalendar = inputFormat.parse(startDate);
		Date endDateCalendar = inputFormat.parse(endDate);
		
		// 원하는 형식의 문자열로 변환
		String formattedCalendarStartDate = outputDateFormat.format(startDateCalendar);
		String formattedCalendarStartTime = outputTimeFormat.format(startDateCalendar);
		String formattedCalendarEndDate = outputDateFormat.format(endDateCalendar);
		String formattedCalendarEndTime = outputTimeFormat.format(endDateCalendar);

		// 결과 출력
		System.out.println("formattedCalendarStartDate : " + formattedCalendarStartDate); // yyyy-mm-dd
		System.out.println("formattedCalendarStartTime : " + formattedCalendarStartTime); // hh:mm:00
		System.out.println("formattedCalendarEndDate : " + formattedCalendarEndDate); // yyyy-mm-dd
		System.out.println("formattedCalendarEndTime : " + formattedCalendarEndTime); // hh:mm:00
		
		// 형 변환한 일자, 시간 데이터 createVO에 저장
		createVO.setScheStartDate(formattedCalendarStartDate);
		createVO.setScheStartTime(formattedCalendarStartTime);
		createVO.setScheEndDate(formattedCalendarEndDate);
		createVO.setScheEndTime(formattedCalendarEndTime);
		
		// 일정 생성자 VO 인서트
		int createVOResult = this.calendarService.createScheduleVideoChat(createVO);
		
		log.info("createRoom createVO result : " + createVOResult);
		
		// 일정 참여자가 있다면 해당 참여자들에게 인서트
		if(selMemIdList != null && !selMemIdList.trim().isEmpty() && !selMemIdList.equals("[]")) {
			selMemIdList = selMemIdList.replaceAll("[\\[\\]\"]", "");
			String[] selMemIdStrListCalendar = selMemIdList.split(",");		
			
			log.info("selMemIdStrList : " + selMemIdStrListCalendar);
			
			List<CalendarVO> calendarVOList = new ArrayList<>();
			
			for(String memIdCalendar : selMemIdStrListCalendar) {
				CalendarVO member = new CalendarVO();
				member.setMemId(memIdCalendar.trim());
				calendarVOList.add(member);
			}
			
			log.info("createRoom calendarVOList before : " + calendarVOList);
			
			for(int j=0; j<calendarVOList.size(); j++) {
				calendarVOList.get(j).setScheId(scheId);
				calendarVOList.get(j).setCreateEmp(memId);
				calendarVOList.get(j).setScheStartDate(formattedCalendarStartDate);
				calendarVOList.get(j).setScheStartTime(formattedCalendarStartTime);
				calendarVOList.get(j).setScheEndDate(formattedCalendarEndDate);
				calendarVOList.get(j).setScheEndTime(formattedCalendarEndTime);
				calendarVOList.get(j).setBackGroundColor("#6db66d");
				calendarVOList.get(j).setScheContent(roomTitle);
				calendarVOList.get(j).setScheTitle(roomTitle);
				calendarVOList.get(j).setScheType("videoChat");
				calendarVOList.get(j).setAllDay("false");
				calendarVOList.get(j).setRoomId(roomId);
			}
			
			log.info("createRoom calendarVOList after : " + calendarVOList);
			
			int memResultCalendar = 0;
			
			for(int i=0; i<calendarVOList.size(); i++) {
				try {
					memResultCalendar += this.calendarService.insertMemberVideoChat(calendarVOList.get(i));
				} catch (Exception e) {
					log.error("createRoom insertMember Error : " + calendarVOList.get(i).getMemId());
				}
			}
			
			log.info("createRoom insertMember Result : " + memResultCalendar);			
		}		
		
		
		
		return myRoomInfo; // 내 방 정보 출력
	}
	
	// 방 삭제	
	@ResponseBody
	@GetMapping("/deleteRoom")
	public int deleteRoom(@RequestParam String roomId) throws Exception {
		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
		  .url("https://openapi.gooroomee.com/api/v1/room/"
				  + roomId)
		  .delete(null)
		  .addHeader("accept", "application/json")
		  .addHeader("X-GRM-AuthToken", "12056163501988613cf51b7b51cdd8140bb172761d02211a8b")
		  .build();

		Response response = client.newCall(request).execute();
		
		log.info("deleteRoom response : " + response);
		
		JSONParser jsonParser = new JSONParser();
		Object obj = jsonParser.parse(response.body().string());
		JSONObject jsonObj = (JSONObject) obj;
		
		log.info("deleteRoom -> jsonObj : " + jsonObj);
		
		int result = this.videoChatService.deleteRoom(roomId);
		
		// 캘린더에서도 해당 일정 삭제
		result += this.calendarService.deleteSchedule(roomId);
		
		return result;
	}
	
	
	@ResponseBody
	@GetMapping("/getEmpList")
	public List<EmployeeVO> getEmpList(@RequestParam String deptCd) {
		log.info("getEmpList 도착");
		log.info("getEmpList deptCd : " + deptCd);
		
		List<EmployeeVO> empVOList = this.employeeService.getEmpListForVideo(deptCd);
		
		log.info("empVOList : " + empVOList);
		
		return empVOList;
	}
	
	@ResponseBody
	@PostMapping("/getDeptList")
	public List<DeptVO> getDeptList() {
		log.info("getDeptList 도착");
		
		List<DeptVO> deptVOList = this.deptService.deptList();
		
		log.info("deptVOList : " + deptVOList);
		
		return deptVOList;
		
	}
	
}
