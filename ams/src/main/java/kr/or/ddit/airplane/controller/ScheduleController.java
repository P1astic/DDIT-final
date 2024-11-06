package kr.or.ddit.airplane.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.airplane.service.AirlineService;
import kr.or.ddit.airplane.vo.AirLineVO;
import kr.or.ddit.airplane.vo.InPlanVO;
import kr.or.ddit.airplane.vo.OutPlanVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/bp/schedule")
@Slf4j
@Controller
@PropertySource("classpath:application.properties")
public class ScheduleController {
	
	@Inject
	AirlineService airLineService;
	
	// ServiceKey 저장
	@Value("${ScheduleController_Key}")
	private String ServiceKey;	
	
	// 접속 당일 날짜 반환 메소드
	private String getDate() {
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
		
		String todayDate = simpleDate.format(new Date());	
		
		return todayDate;
	}

	// 접속 당일 날짜 저장
	private String todayDate = getDate(); // 메소드 호출
	
	// 항공사 이름 추출
	@ResponseBody
	@PostMapping("/getAirLineNm")
	public AirLineVO getAirLineNm(@RequestBody String memId) {
		log.info("memId : " + memId);
		
		AirLineVO airLineVO = this.airLineService.getAirLineNm(memId);
		log.info("airLineVO : " + airLineVO);
		
		return airLineVO;
	}
	
	
	// 국내 운항 스케쥴 페이지
	@GetMapping("/inList")
	public String list(Model model) {
		String thisDate = getDate();
		
		model.addAttribute("thisDate", thisDate);
		
		return "bp/schedule/inList";
	}	
	
	// 국내 운항 스케쥴 조회
	@ResponseBody
	@GetMapping("/getInList")
	public List<InPlanVO> getInList() throws MalformedURLException, IOException {
		
		int INDENT_FACTOR = 4;
				
		HttpURLConnection conn = (HttpURLConnection) new URL("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getDflightScheduleList?"
                + "ServiceKey=" + ServiceKey
				+ "&schDate=" + todayDate
				+ "&schDeptCityCode=GMP"
				+ "&pageNo=1"
				).openConnection();
        conn.connect();
        BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
        BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
        StringBuffer st = new StringBuffer();
        String line;
        while ((line = reader.readLine()) != null) {
            st.append(line);
        }
 
        JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
        
        JSONObject responseObj = xmlJSONObj.getJSONObject("response");
        JSONObject bodyObj = responseObj.getJSONObject("body");
        log.info("bodyObj : " + bodyObj);
        
        JSONObject itemsObj;
        JSONArray Obj;
        
        String ObjData;
        

        int totalCount = bodyObj.getInt("totalCount");
        int pageNo = (int) Math.ceil(totalCount/10.0);
        log.info("totalCount : " + totalCount);
        log.info("pageNo : " + pageNo);
        
        
        JSONArray json = new JSONArray();
        
        //vo 리스트 선언
        List<InPlanVO> InPlanVOList = new ArrayList<InPlanVO>();
        
        //페이지 단위로 반복
        for(int i=1; i<=pageNo; i++) {
        	conn = (HttpURLConnection) new URL("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getDflightScheduleList?"
        			+ "ServiceKey=" + ServiceKey
    				+ "&schDate=" + todayDate
    				+ "&schDeptCityCode=GMP"
    				+ "&pageNo=" + i
    				).openConnection();
            conn.connect();
            bis = new BufferedInputStream(conn.getInputStream());
            reader = new BufferedReader(new InputStreamReader(bis));
            st = new StringBuffer();
            String line2;
            while ((line2 = reader.readLine()) != null) {
                st.append(line2);
            }
     
            xmlJSONObj = XML.toJSONObject(st.toString());
            
            responseObj = xmlJSONObj.getJSONObject("response");
            bodyObj = responseObj.getJSONObject("body");
            itemsObj = bodyObj.getJSONObject("items");
            //Array는 <item></item> 들
            Obj = itemsObj.getJSONArray("item");
            
            //한 페이지의 여러개의 item 태그의 개수만큼 반복
            for(int j=0;j<Obj.length();j++) {
            	//item 태그 하나씩 꺼내서 
            	JSONObject temp1 = Obj.getJSONObject(j);            	
            	String airlineEnglish	     =   temp1.getString("airlineEnglish");  
            	String airlineKorean	     =   temp1.getString("airlineKorean");  
            	String arrivalcity	         =   temp1.getString("arrivalcity");
            	String arrivalcityCode	     =   temp1.getString("arrivalcityCode");	  
            	int    domesticArrivalTime	 =   temp1.getInt("domesticArrivalTime");
            	int    domesticStartTime	 =   temp1.getInt("domesticStartTime");	
            	String domesticStdate	     =   temp1.getString("domesticStdate");	  
            	String domesticEddate	     =   temp1.getString("domesticEddate");	  
            	String domesticMon	         =   temp1.getString("domesticMon");	      
            	String domesticTue	         =   temp1.getString("domesticTue");	      
            	String domesticWed	         =   temp1.getString("domesticWed");	      
            	String domesticThu	         =   temp1.getString("domesticThu");	      
            	String domesticFri	         =   temp1.getString("domesticFri");	      
            	String domesticSat	         =   temp1.getString("domesticSat");	      
            	String domesticSun	         =   temp1.getString("domesticSun");	      
            	String domesticNum	         =   temp1.getString("domesticNum");	      
            	String flightPurpose	     =   temp1.getString("flightPurpose");	  
            	String startcity	         =   temp1.getString("startcity");	      
            	String startcityCode	     =   temp1.getString("startcityCode");	 
            	
            	// 시간 데이터 형변환
            	String arrivalTimeStr = Integer.toString(domesticArrivalTime);
            	String startTimeStr = Integer.toString(domesticStartTime);

            	// 4자리로 맞춤, 0630처럼
            	arrivalTimeStr = String.format("%04d", domesticArrivalTime);
            	startTimeStr = String.format("%04d", domesticStartTime);
            	            	
            	// 시간 형식 변경            	
            	arrivalTimeStr = arrivalTimeStr.substring(0,2) + ":" + arrivalTimeStr.substring(2);
            	startTimeStr = startTimeStr.substring(0,2) + ":" + startTimeStr.substring(2);
            	domesticStdate = domesticStdate.substring(0, 4) + "." + domesticStdate.substring(5, 7) + "." + domesticStdate.substring(8, 10);
            	domesticEddate = domesticEddate.substring(0, 4) + "." + domesticEddate.substring(5, 7) + "." + domesticEddate.substring(8, 10);
            	// subString(여기서부터, 여기전까지)
            	
            	//vo에 넣자
            	InPlanVO planVO = new InPlanVO();
            	
            	planVO.setAirlineEnglish(airlineEnglish);
            	planVO.setAirlineKorean(airlineKorean);
            	planVO.setArrivalcity(arrivalcity);
            	planVO.setArrivalcityCode(arrivalcityCode);
            	planVO.setDomesticArrivalTime(arrivalTimeStr);
            	planVO.setDomesticEddate(domesticEddate);
            	planVO.setDomesticFri(domesticFri);
            	planVO.setDomesticMon(domesticMon);
            	planVO.setDomesticNum(domesticNum);
            	planVO.setDomesticSat(domesticSat);
            	planVO.setDomesticStartTime(startTimeStr);
            	planVO.setDomesticStdate(domesticStdate);
            	planVO.setDomesticSun(domesticSun);
            	planVO.setDomesticThu(domesticThu);
            	planVO.setDomesticTue(domesticTue);
            	planVO.setDomesticWed(domesticWed);
            	planVO.setFlightPurpose(flightPurpose);
            	planVO.setStartcity(startcity);
            	planVO.setStartcityCode(startcityCode);
            	
            	//vo List에 add
            	InPlanVOList.add(planVO);
            }//동일한 페이지의 <item>태그들 반복 끝
          
            ObjData = Obj.toString(INDENT_FACTOR);
            json.put(ObjData);
        }//페이지 단위 끝
        
        log.info("InPlanVOList : " + InPlanVOList);
        
        return InPlanVOList;
	}
	
	// 국내 스케쥴 날짜 변경 조회
	@ResponseBody
	@GetMapping("/updateInList")
	public List<InPlanVO> updateInList(@RequestParam String year, @RequestParam String month, @RequestParam String day) throws MalformedURLException, IOException {
		todayDate = year+month+day; 
		log.info("updateInList -> todayDate " + todayDate);
				
		int INDENT_FACTOR = 4;
		
		HttpURLConnection conn = (HttpURLConnection) new URL("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getDflightScheduleList?"
                + "ServiceKey=" + ServiceKey
				+ "&schDate=" + todayDate
				+ "&schDeptCityCode=GMP"
				+ "&pageNo=1"
				).openConnection();
        conn.connect();
        BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
        BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
        StringBuffer st = new StringBuffer();
        String line;
        while ((line = reader.readLine()) != null) {
            st.append(line);
        }
 
        JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
        
        JSONObject responseObj = xmlJSONObj.getJSONObject("response");
        JSONObject bodyObj = responseObj.getJSONObject("body");
        log.info("bodyObj : " + bodyObj);
        
        JSONObject itemsObj;
        JSONArray Obj;
        
        String ObjData;
        

        int totalCount = bodyObj.getInt("totalCount");
        int pageNo = (int) Math.ceil(totalCount/10.0);
        log.info("totalCount : " + totalCount);
        log.info("pageNo : " + pageNo);
        
        
        JSONArray json = new JSONArray();
        
        //vo 리스트 선언
        List<InPlanVO> InPlanVOList = new ArrayList<InPlanVO>();
        
        //페이지 단위로 반복
        for(int i=1; i<=pageNo; i++) {
        	conn = (HttpURLConnection) new URL("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getDflightScheduleList?"
        			+ "ServiceKey=" + ServiceKey
    				+ "&schDate=" + todayDate
    				+ "&schDeptCityCode=GMP"
    				+ "&pageNo=" + i
    				).openConnection();
            conn.connect();
            bis = new BufferedInputStream(conn.getInputStream());
            reader = new BufferedReader(new InputStreamReader(bis));
            st = new StringBuffer();
            String line2;
            while ((line2 = reader.readLine()) != null) {
                st.append(line2);
            }
     
            xmlJSONObj = XML.toJSONObject(st.toString());
            
            responseObj = xmlJSONObj.getJSONObject("response");
            bodyObj = responseObj.getJSONObject("body");
            itemsObj = bodyObj.getJSONObject("items");
            //Array는 <item></item> 들
            Obj = itemsObj.getJSONArray("item");
            
            //한 페이지의 여러개의 item 태그의 개수만큼 반복
            for(int j=0;j<Obj.length();j++) {
            	//item 태그 하나씩 꺼내서 
            	JSONObject temp1 = Obj.getJSONObject(j);            	
            	String airlineEnglish	     =   temp1.getString("airlineEnglish");  
            	String airlineKorean	     =   temp1.getString("airlineKorean");  
            	String arrivalcity	         =   temp1.getString("arrivalcity");
            	String arrivalcityCode	     =   temp1.getString("arrivalcityCode");	  
            	int    domesticArrivalTime	 =   temp1.getInt("domesticArrivalTime");
            	int    domesticStartTime	 =   temp1.getInt("domesticStartTime");	
            	String domesticStdate	     =   temp1.getString("domesticStdate");	  
            	String domesticEddate	     =   temp1.getString("domesticEddate");	  
            	String domesticMon	         =   temp1.getString("domesticMon");	      
            	String domesticTue	         =   temp1.getString("domesticTue");	      
            	String domesticWed	         =   temp1.getString("domesticWed");	      
            	String domesticThu	         =   temp1.getString("domesticThu");	      
            	String domesticFri	         =   temp1.getString("domesticFri");	      
            	String domesticSat	         =   temp1.getString("domesticSat");	      
            	String domesticSun	         =   temp1.getString("domesticSun");	      
            	String domesticNum	         =   temp1.getString("domesticNum");	      
            	String flightPurpose	     =   temp1.getString("flightPurpose");	  
            	String startcity	         =   temp1.getString("startcity");	      
            	String startcityCode	     =   temp1.getString("startcityCode");	 
            	
            	// 시간 데이터 형변환
            	String arrivalTimeStr = Integer.toString(domesticArrivalTime);
            	String startTimeStr = Integer.toString(domesticStartTime);

            	// 4자리로 맞춤, 0630처럼
            	arrivalTimeStr = String.format("%04d", domesticArrivalTime);
            	startTimeStr = String.format("%04d", domesticStartTime);
            	            	
            	// 시간 형식 변경            	
            	arrivalTimeStr = arrivalTimeStr.substring(0,2) + ":" + arrivalTimeStr.substring(2);
            	startTimeStr = startTimeStr.substring(0,2) + ":" + startTimeStr.substring(2);
            	domesticStdate = domesticStdate.substring(0, 4) + "." + domesticStdate.substring(5, 7) + "." + domesticStdate.substring(8, 10);
            	domesticEddate = domesticEddate.substring(0, 4) + "." + domesticEddate.substring(5, 7) + "." + domesticEddate.substring(8, 10);
            	// subString(여기서부터, 여기전까지)
            	
            	//vo에 넣자
            	InPlanVO planVO = new InPlanVO();
            	
            	planVO.setAirlineEnglish(airlineEnglish);
            	planVO.setAirlineKorean(airlineKorean);
            	planVO.setArrivalcity(arrivalcity);
            	planVO.setArrivalcityCode(arrivalcityCode);
            	planVO.setDomesticArrivalTime(arrivalTimeStr);
            	planVO.setDomesticEddate(domesticEddate);
            	planVO.setDomesticFri(domesticFri);
            	planVO.setDomesticMon(domesticMon);
            	planVO.setDomesticNum(domesticNum);
            	planVO.setDomesticSat(domesticSat);
            	planVO.setDomesticStartTime(startTimeStr);
            	planVO.setDomesticStdate(domesticStdate);
            	planVO.setDomesticSun(domesticSun);
            	planVO.setDomesticThu(domesticThu);
            	planVO.setDomesticTue(domesticTue);
            	planVO.setDomesticWed(domesticWed);
            	planVO.setFlightPurpose(flightPurpose);
            	planVO.setStartcity(startcity);
            	planVO.setStartcityCode(startcityCode);
            	
            	//vo List에 add
            	InPlanVOList.add(planVO);
            }//동일한 페이지의 <item>태그들 반복 끝
          
            ObjData = Obj.toString(INDENT_FACTOR);
            json.put(ObjData);
        }//페이지 단위 끝
        
        log.info("InPlanVOList : " + InPlanVOList);
        
        return InPlanVOList;
	}
	
	// 국제 운항 스케쥴 페이지
	@GetMapping("/outList")
	public String outList(Model model) {
		String thisDate = getDate();
		model.addAttribute("thisDate", thisDate);
		return "bp/schedule/outList";
	}
	
	// 국제 운항 스케쥴 조회
	@ResponseBody
	@GetMapping("/getOutList")
	public List<OutPlanVO> getOutList() throws MalformedURLException, IOException {
		
		int INDENT_FACTOR = 4;
				
		HttpURLConnection conn = (HttpURLConnection) new URL("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList?"
                + "ServiceKey=" + ServiceKey
				+ "&schDate=" + todayDate
				+ "&schDeptCityCode=GMP"
				+ "&pageNo=1"
				).openConnection();
        conn.connect();
        BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
        BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
        StringBuffer st = new StringBuffer();
        String line;
        while ((line = reader.readLine()) != null) {
            st.append(line);
        }
 
        JSONObject xmlJSONObj = XML.toJSONObject(st.toString());        
        JSONObject responseObj = xmlJSONObj.getJSONObject("response");
        JSONObject bodyObj = responseObj.getJSONObject("body");        
        JSONObject itemsObj;
        JSONArray Obj;        
        String ObjData;

        int totalCount = bodyObj.getInt("totalCount");
        int pageNo = (int) Math.ceil(totalCount/10.0);
        log.info("totalCount : " + totalCount);
        log.info("pageNo : " + pageNo);
        
        
        JSONArray json = new JSONArray();
        
        //vo 리스트 선언
        List<OutPlanVO> OutPlanVOList = new ArrayList<OutPlanVO>();
        
        //페이지 단위로 반복
        for(int i=1; i<=pageNo; i++) {
        	conn = (HttpURLConnection) new URL("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList?"
                    + "ServiceKey=" + ServiceKey
    				+ "&schDate=" + todayDate
    				+ "&schDeptCityCode=GMP"
    				+ "&pageNo=" + i
    				).openConnection();
            conn.connect();
            bis = new BufferedInputStream(conn.getInputStream());
            reader = new BufferedReader(new InputStreamReader(bis));
            st = new StringBuffer();
            String line2;
            while ((line2 = reader.readLine()) != null) {
                st.append(line2);
            }
     
            xmlJSONObj = XML.toJSONObject(st.toString());
            
            responseObj = xmlJSONObj.getJSONObject("response");
                        
            bodyObj = responseObj.getJSONObject("body");
            itemsObj = bodyObj.getJSONObject("items");
            //Array는 <item></item> 들
            Obj = itemsObj.getJSONArray("item");
            
            //한 페이지의 여러개의 item 태그의 개수만큼 반복
            for(int j=0;j<Obj.length();j++) {
            	
            	//item 태그 하나씩 꺼내서	  
            	JSONObject temp1 = Obj.getJSONObject(j);            	
            	String airlineEnglish		= temp1.getString("airlineEnglish");
            	String airlineKorean		= temp1.getString("airlineKorean");
            	String flightPurpose		= temp1.getString("flightPurpose");
            	String airport			    = temp1.getString("airport");
            	String airportCode			= temp1.getString("airportCode");
            	String city			        = temp1.getString("city");
            	String cityCode				= temp1.getString("cityCode");
            	String internationalIoType	= temp1.getString("internationalIoType");
            	String internationalNum	    = temp1.getString("internationalNum");
            	int internationalTime	= temp1.getInt("internationalTime");
            	String internationalSun		= temp1.getString("internationalSun");
            	String internationalMon		= temp1.getString("internationalMon");
            	String internationalTue		= temp1.getString("internationalTue");
            	String internationalWed		= temp1.getString("internationalWed");
            	String internationalThu		= temp1.getString("internationalThu");
            	String internationalFri		= temp1.getString("internationalFri");
            	String internationalSat		= temp1.getString("internationalSat");
            	String internationalStdate	= temp1.getString("internationalStdate");
            	String internationalEddate  = temp1.getString("internationalEddate");
            	
//            	// 시간 데이터 형변환
//            	String timeStr = Integer.toString(internationalTime);

//            	// 4자리로 맞춤, 0630처럼
//            	timeStr = String.format("%04d", timeStr);
            	            	
            	
            	// 시간 데이터 형변환
            	String timeStr = String.format("%04d", internationalTime); // int 값을 형식에 맞게 변환

            	// 시간 형식 변경
            	if (timeStr.length() == 4) { // 4자리일 경우
            	    timeStr = timeStr.substring(0, 2) + ":" + timeStr.substring(2);
            	}
            	
            	// 시간 형식 변경            	
//            	timeStr = timeStr.substring(0,2) + ":" + timeStr.substring(2);
            	internationalStdate = internationalStdate.substring(0, 4) + "." + internationalStdate.substring(5, 7) + "." + internationalStdate.substring(8, 10);
            	internationalEddate = internationalEddate.substring(0, 4) + "." + internationalEddate.substring(5, 7) + "." + internationalEddate.substring(8, 10);
            	// subString(여기서부터, 여기전까지)
            	
            	//vo에 넣자
            	OutPlanVO planVO = new OutPlanVO();            	
            	planVO.setAirlineEnglish(airlineEnglish);	
            	planVO.setAirlineKorean(airlineKorean);	
            	planVO.setFlightPurpose(flightPurpose);		
            	planVO.setAirport(airport);				
            	planVO.setAirportCode(airportCode);			
            	planVO.setCity(city);				
            	planVO.setCityCode(cityCode);			
            	planVO.setInternationalIoType(internationalIoType);	
            	planVO.setInternationalNum(internationalNum);
            	planVO.setInternationalTime(timeStr);	
            	planVO.setInternationalSun(internationalSun);	
            	planVO.setInternationalMon(internationalMon);	
            	planVO.setInternationalTue(internationalTue);	
            	planVO.setInternationalWed(internationalWed);	
            	planVO.setInternationalThu(internationalThu);	
            	planVO.setInternationalFri(internationalFri);	
            	planVO.setInternationalSat(internationalSat);	
            	planVO.setInternationalStdate(internationalStdate);	
            	planVO.setInternationalEddate(internationalEddate);	
            	
            	//vo List에 add
            	OutPlanVOList.add(planVO);
            }//동일한 페이지의 <item>태그들 반복 끝
          
            ObjData = Obj.toString(INDENT_FACTOR);
            json.put(ObjData);
        }//페이지 단위 끝
        
        log.info("OutPlanVOList : " + OutPlanVOList);
        
        return OutPlanVOList;
	}

	// 국제 운항 스케쥴 조회
	@ResponseBody
	@GetMapping("/updateOutList")
	public List<OutPlanVO> updateOutList(@RequestParam String year, @RequestParam String month, @RequestParam String day) throws MalformedURLException, IOException {
		todayDate = year+month+day; 
		log.info("updateOutList -> todayDate " + todayDate);	
		int INDENT_FACTOR = 4;
		
		HttpURLConnection conn = (HttpURLConnection) new URL("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList?"
				+ "ServiceKey=" + ServiceKey
				+ "&schDate=" + todayDate
				+ "&schDeptCityCode=GMP"
				+ "&pageNo=1"
				).openConnection();
		conn.connect();
		BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
		StringBuffer st = new StringBuffer();
		String line;
		while ((line = reader.readLine()) != null) {
			st.append(line);
		}
		
		JSONObject xmlJSONObj = XML.toJSONObject(st.toString());        
		JSONObject responseObj = xmlJSONObj.getJSONObject("response");
		JSONObject bodyObj = responseObj.getJSONObject("body");        
		JSONObject itemsObj;
		JSONArray Obj;        
		String ObjData;
		
		int totalCount = bodyObj.getInt("totalCount");
		int pageNo = (int) Math.ceil(totalCount/10.0);
		log.info("totalCount : " + totalCount);
		log.info("pageNo : " + pageNo);
		
		
		JSONArray json = new JSONArray();
		
		//vo 리스트 선언
		List<OutPlanVO> OutPlanVOList = new ArrayList<OutPlanVO>();
		
		//페이지 단위로 반복
		for(int i=1; i<=pageNo; i++) {
			conn = (HttpURLConnection) new URL("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList?"
					+ "ServiceKey=" + ServiceKey
					+ "&schDate=" + todayDate
					+ "&schDeptCityCode=GMP"
					+ "&pageNo=" + i
					).openConnection();
			conn.connect();
			bis = new BufferedInputStream(conn.getInputStream());
			reader = new BufferedReader(new InputStreamReader(bis));
			st = new StringBuffer();
			String line2;
			while ((line2 = reader.readLine()) != null) {
				st.append(line2);
			}
			
			xmlJSONObj = XML.toJSONObject(st.toString());
			
			responseObj = xmlJSONObj.getJSONObject("response");
			
			bodyObj = responseObj.getJSONObject("body");
			itemsObj = bodyObj.getJSONObject("items");
			//Array는 <item></item> 들
			Obj = itemsObj.getJSONArray("item");
			
			//한 페이지의 여러개의 item 태그의 개수만큼 반복
			for(int j=0;j<Obj.length();j++) {
				
				//item 태그 하나씩 꺼내서	  
				JSONObject temp1 = Obj.getJSONObject(j);            	
				String airlineEnglish		= temp1.getString("airlineEnglish");
				String airlineKorean		= temp1.getString("airlineKorean");
				String flightPurpose		= temp1.getString("flightPurpose");
				String airport			    = temp1.getString("airport");
				String airportCode			= temp1.getString("airportCode");
				String city			        = temp1.getString("city");
				String cityCode				= temp1.getString("cityCode");
				String internationalIoType	= temp1.getString("internationalIoType");
				String internationalNum	    = temp1.getString("internationalNum");
				int internationalTime	= temp1.getInt("internationalTime");
				String internationalSun		= temp1.getString("internationalSun");
				String internationalMon		= temp1.getString("internationalMon");
				String internationalTue		= temp1.getString("internationalTue");
				String internationalWed		= temp1.getString("internationalWed");
				String internationalThu		= temp1.getString("internationalThu");
				String internationalFri		= temp1.getString("internationalFri");
				String internationalSat		= temp1.getString("internationalSat");
				String internationalStdate	= temp1.getString("internationalStdate");
				String internationalEddate  = temp1.getString("internationalEddate");
				
//            	// 시간 데이터 형변환
//            	String timeStr = Integer.toString(internationalTime);
				
//            	// 4자리로 맞춤, 0630처럼
//            	timeStr = String.format("%04d", timeStr);
				
				
				// 시간 데이터 형변환
				String timeStr = String.format("%04d", internationalTime); // int 값을 형식에 맞게 변환
				
				// 시간 형식 변경
				if (timeStr.length() == 4) { // 4자리일 경우
					timeStr = timeStr.substring(0, 2) + ":" + timeStr.substring(2);
				}
				
				// 시간 형식 변경            	
//            	timeStr = timeStr.substring(0,2) + ":" + timeStr.substring(2);
				internationalStdate = internationalStdate.substring(0, 4) + "." + internationalStdate.substring(5, 7) + "." + internationalStdate.substring(8, 10);
				internationalEddate = internationalEddate.substring(0, 4) + "." + internationalEddate.substring(5, 7) + "." + internationalEddate.substring(8, 10);
				// subString(여기서부터, 여기전까지)
				
				//vo에 넣자
				OutPlanVO planVO = new OutPlanVO();            	
				planVO.setAirlineEnglish(airlineEnglish);	
				planVO.setAirlineKorean(airlineKorean);	
				planVO.setFlightPurpose(flightPurpose);		
				planVO.setAirport(airport);				
				planVO.setAirportCode(airportCode);			
				planVO.setCity(city);				
				planVO.setCityCode(cityCode);			
				planVO.setInternationalIoType(internationalIoType);	
				planVO.setInternationalNum(internationalNum);
				planVO.setInternationalTime(timeStr);	
				planVO.setInternationalSun(internationalSun);	
				planVO.setInternationalMon(internationalMon);	
				planVO.setInternationalTue(internationalTue);	
				planVO.setInternationalWed(internationalWed);	
				planVO.setInternationalThu(internationalThu);	
				planVO.setInternationalFri(internationalFri);	
				planVO.setInternationalSat(internationalSat);	
				planVO.setInternationalStdate(internationalStdate);	
				planVO.setInternationalEddate(internationalEddate);	
				
				//vo List에 add
				OutPlanVOList.add(planVO);
			}//동일한 페이지의 <item>태그들 반복 끝
			
			ObjData = Obj.toString(INDENT_FACTOR);
			json.put(ObjData);
		}//페이지 단위 끝
		
		log.info("OutPlanVOList : " + OutPlanVOList);
		
		return OutPlanVOList;
	}
	
}