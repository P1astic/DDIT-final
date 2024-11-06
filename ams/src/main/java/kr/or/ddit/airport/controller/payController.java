package kr.or.ddit.airport.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.*;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.*;
import org.w3c.dom.*;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CustBoardVO;
import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.facility.service.ParkingService;
import kr.or.ddit.facility.vo.ParkingRsvtVO;
import kr.or.ddit.facility.vo.ParkingRsvtVO;
import kr.or.ddit.userPass.vo.CustInfo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/cust/parking")
@Slf4j
@Controller
@PropertySource("classpath:application.properties")
public class payController {

	@Inject
	ParkingService parkingService;

    @Value("${payController_Key}")
    private String payController_Key;
	
	// 주차메인
//	@GetMapping("/main")
//	public String main(@RequestParam String name, String phone) {
//
//		// 본인인증 정보 등록
//		CustInfo custInfoVO = new CustInfo();
//		custInfoVO.setName(name);
//		custInfoVO.setPhone(phone);
//		log.info("ParkingRsvtVO : " + custInfoVO);
//		return "cust/parking/main";
//	}
	@GetMapping("/main")
	public String main() {

		return "cust/parking/main";
	}

//	@GetMapping("/payed")
//	public String payed(@ModelAttribute  String prkRsvtMoblphon, int prkRsvtNo, Model model) {
// 
//		model.addAttribute("prkRsvtNo", prkRsvtNo);
//		model.addAttribute("prkRsvtMoblphon", prkRsvtMoblphon);
//		log.info("model : " + model);
//		return "cust/parking/payed";
//	}
//	@GetMapping("/reservation")
//	public String reservation(@RequestParam String phone, Model model) {
//
//		CustInfo custInfoVO = new CustInfo();
//		custInfoVO.setPhone(phone);
//		
//		ParkingRsvtVO parkingRsvtVO = new ParkingRsvtVO();
//		parkingRsvtVO.setPrkRsvtMoblphon(phone);
//
//		
//		log.info("name : " + phone);
//		log.info("custInfoVO : " + custInfoVO);
//		// main2.jsp에서 무엇을 선택했는지 => selType 변수에 들어있음
//		// 그것을 cusForm.jsp로 보내줘야 함
//
//		List<ParkingRsvtVO> list = this.parkingService.list(custInfoVO);
//
////    	log.info("list -> custBoardVOList : " + searchList(custInfoVO));
//		log.info("lsit : " + list);
//		model.addAttribute("parkingRsvtVOList", list);
//
//		return "cust/parking/reservation";
//	}
	@GetMapping("/reservation")
	public String reservation(@RequestParam String phone, Model model) {
	    CustInfo custInfoVO = new CustInfo();
	    custInfoVO.setPhone(phone);
	    
	    List<ParkingRsvtVO> list = this.parkingService.list(custInfoVO);
	    log.info("list : " + list);
	    
	    model.addAttribute("parkingRsvtVOList", list); // 모델에 데이터 추가
	    return "cust/parking/reservation";
	}


	@GetMapping("/regist")
	public String regist() {

		return "cust/parking/regist";
	}
//	@GetMapping("/update")
//	public String update(Model model, @ModelAttribute ParkingRsvtVO parkingRsvtVO) {
//		log.info("update -> boardVO.prkRsvtNo : " + parkingRsvtVO.getPrkRsvtNo());
//		log.info("update -> parkingRsvtVO : " + parkingRsvtVO);
//
//		int result = this.parkingService.update(parkingRsvtVO);
//
//		log.info("update -> result : " + result);
//		return result;
//	}
//
	@GetMapping("/parkingList")
	public String list(@RequestParam String prkRsvtMoblphon, String prkRsvtNo, Model model, HttpSession ss) {

		CustInfo custInfoVO = new CustInfo();
//		custInfoVO.setName(name);
		custInfoVO.setPhone(prkRsvtMoblphon);
		
		ParkingRsvtVO parkingRsvtVO = new ParkingRsvtVO();
		parkingRsvtVO.setPrkRsvtMoblphon(prkRsvtMoblphon);
		parkingRsvtVO.setPrkRsvtNo(prkRsvtNo);

		
		log.info("name : " + prkRsvtMoblphon);
		log.info("custInfoVO : " + custInfoVO);
		// main2.jsp에서 무엇을 선택했는지 => selType 변수에 들어있음
		// 그것을 cusForm.jsp로 보내줘야 함

		List<ParkingRsvtVO> list = this.parkingService.list(custInfoVO);
	
		ss.setAttribute("parkingRsvtVO", parkingRsvtVO);
//    	log.info("list -> custBoardVOList : " + searchList(custInfoVO));
		log.info("lsit : " + list);
		model.addAttribute("parkingRsvtVOList", list);

		
		return "cust/parking/parkingList";
	}
	
//	@GetMapping("/parkingList")
//	public String list(@RequestParam String phone, Model model) {
//		
//		CustInfo custInfoVO = new CustInfo();
////		custInfoVO.setName(name);
//		custInfoVO.setPhone(phone);
//		
//		ParkingRsvtVO parkingRsvtVO = new ParkingRsvtVO();
//		parkingRsvtVO.setPrkRsvtMoblphon(phone);
//
//		
//		
//		log.info("phone : " + phone);
//		log.info("custInfoVO : " + custInfoVO);
//		// main2.jsp에서 무엇을 선택했는지 => selType 변수에 들어있음
//		// 그것을 cusForm.jsp로 보내줘야 함
//		
//		List<ParkingRsvtVO> list = this.parkingService.list(custInfoVO);
//		
////		ss.setAttribute("parkingRsvtVO", parkingRsvtVO);
////    	log.info("list -> custBoardVOList : " + searchList(custInfoVO));
//		log.info("lsit : " + list);
//		model.addAttribute("parkingRsvtVOList", list);
//		
//		
//		return "cust/parking/parkingList";
//	}

	// 예약정보 입력 페이지1
	@GetMapping("/regist1")
	public String regist1() {
		return "cust/parking/regist1";
	}

	// 예약정보 입력 페이지2
	@GetMapping("/regist2")
	public String regist2(@RequestParam String prkRsvtCarType, String prkLvvhclTm, String prkEntvhclTm, Model model,
			HttpSession ss) {
		log.info("cusForm->selType : " + prkLvvhclTm, prkEntvhclTm);

		// PARKING 등록
		ParkingRsvtVO parkingRsvtVO = new ParkingRsvtVO();
		parkingRsvtVO.setPrkEntvhclTm(prkEntvhclTm);
		parkingRsvtVO.setPrkLvvhclTm(prkLvvhclTm);
		parkingRsvtVO.setPrkRsvtCarType(prkRsvtCarType);

		// 본인인증 정보 등록
		CustInfo custInfoVO = new CustInfo();

//		custInfoVO.setPhone(phone);
//		log.info("phone : " + phone);
		log.info("ParkingRsvtVO : " + parkingRsvtVO);
		// main2.jsp에서 무엇을 선택했는지 => selType 변수에 들어있음
		// 그것을 cusForm.jsp로 보내줘야 함

		model.addAttribute("parkingRsvtVO", parkingRsvtVO);
		model.addAttribute("custInfoVO",custInfoVO);
		log.info("model : " + model);

		return "cust/parking/regist2";
	}

//	@PostMapping("/registPost")
//	@ResponseBody
//	public int registPost(@ModelAttribute ParkingRsvtVO parkingRsvtVO) {// ModelAttribute로 폼 데이터 받기
//		log.info("registPost->parkingRsvtVO : " + parkingRsvtVO);
//
//		int result = this.parkingService.registPost(parkingRsvtVO);
//
//		log.info("registPost->result : " + result);
//
//		// redirect : 새로운 URI
////		return "redirect:/cust/detail?prkRsvtNo="+parkingRsvtVO.getPrkRsvtNo();
//		return result;
//	}
//	
	@PostMapping("/registPost")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> registPost(@ModelAttribute ParkingRsvtVO parkingRsvtVO) {
	    log.info("registPost->parkingRsvtVO : " + parkingRsvtVO);

	    int result = this.parkingService.registPost(parkingRsvtVO);

	    log.info("registPost->result : " + result);

	    Map<String, Object> response = new HashMap<>();
	    response.put("RESULT", result == 1 ? "1" : "0");
	    response.put("MSG", result == 1 ? "등록 성공" : "등록 실패");
	    response.put("PRK_RSVT_NO", parkingRsvtVO.getPrkRsvtNo());

	    return ResponseEntity.ok(response);
	}

	
	//예약 확인 뽑기
	@PostMapping("/registOk")
	public String registOk(@ModelAttribute ParkingRsvtVO parkingRsvtVO) {// ModelAttribute로 폼 데이터 받기
		log.info("registPost->parkingRsvtVO : " + parkingRsvtVO);
		
		int result = this.parkingService.registPost(parkingRsvtVO);
		
		log.info("registPost->result : " + result);
		
		// redirect : 새로운 URI
//		return "redirect:/cust/detail?prkRsvtNo="+parkingRsvtVO.getPrkRsvtNo();
		return "redirect:/cust/parking/parkingList";
	}

	// 예약목록조회
	@GetMapping("/detail")
	public String bpBoarddetail(Model model, @RequestParam(value = "prkRsvtNo", required = true) String prkRsvtNo) {

		log.info("detail -> prkRsvtNo : " + prkRsvtNo);

		// 1) 상세 정보 조회
		ParkingRsvtVO parkingRsvtVO = new ParkingRsvtVO();
		parkingRsvtVO.setPrkRsvtNo(prkRsvtNo);
		parkingRsvtVO = this.parkingService.detail(prkRsvtNo);
		log.info("detail -> parkingRsvtVO : " + parkingRsvtVO);

		model.addAttribute("parkingRsvtVO", parkingRsvtVO);

		return "cust/parking/detail";
	}
	// 예약목록조회
//	@GetMapping("/detail")
//	public String detail(Model model, @RequestParam String phone) {
//		
//		log.info("detail -> prkRsvtNo : " + phone);
//		
//		// 1) 상세 정보 조회
//		ParkingRsvtVO parkingRsvtVO = new ParkingRsvtVO();
//		parkingRsvtVO.setPrkRsvtNo(phone);
//		parkingRsvtVO = this.parkingService.detail(phone);
//		log.info("detail -> parkingRsvtVO : " + parkingRsvtVO);
//		
//		model.addAttribute("parkingRsvtVO", parkingRsvtVO);
//		
//		return "cust/parking/detail";
//	}

	// 예약 취소
	@ResponseBody
	@PostMapping("/delete")
	public Map<String, String> delete(@RequestBody ParkingRsvtVO parkingRsvtVO) {
		log.info("delete -> parkingRsvtVO : " + parkingRsvtVO);

		int deleteResult = this.parkingService.delete(parkingRsvtVO);
		Map<String, String> response = new HashMap<>();
		
		if(deleteResult != 0) {
			response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		
		log.info("deleteResult : " + deleteResult);

		return response;
	}
	
	@ResponseBody
	@PostMapping("/parkingUpdate")
	public Map<String, String> update(@RequestBody  ParkingRsvtVO parkingRsvtVO){
		log.info("update -> parkingRsvtVO : " + parkingRsvtVO);
		
		Map<String, String> response = new HashMap<>();
		
		int updateResult = this.parkingService.update(parkingRsvtVO);
		
		if(updateResult != 0) {
			response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		
		return response;
	}

	/**
	    * @author 김인교 주차장 안내 10.11 시작
	    *
	    */

	   @GetMapping("/ParkingIinformation")
	   public String ParkingIinformation() {

	      return "cust/parking/ParkingIinformation";
	   }

	   /**
	    * @author 김인교 주차장 요금안내 10.11시작
	    *
	    */

	   @GetMapping("/ParkingMoney")
	   public String ParkingMoney() {

	      return "cust/parking/ParkingMoney";
	   }

	   /**
	    * @author 김인교 주차장 요금안내 10.11시작
	    *
	    */
	   @ResponseBody
	   @GetMapping("/api")
	   public List<Map<String, String>> api() {
	      List<Map<String, String>> parkingList = new ArrayList<>();
	      
	      try {

	         // API 호출 설정
	         StringBuilder urlBuilder = new StringBuilder(
	               "http://openapi.airport.co.kr/service/rest/AirportParkingCongestion/airportParkingCongestionRT");
	         urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
	               + payController_Key);
	         urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=1");
	         urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=10");
	         urlBuilder.append("&" + URLEncoder.encode("schAirportCode", "UTF-8") + "=GMP");

	         URL url = new URL(urlBuilder.toString());
	         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	         conn.setRequestMethod("GET");
	         conn.setRequestProperty("Content-type", "application/xml");

	         // 응답 데이터 처리
	         InputStream stream = (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300)
	               ? conn.getInputStream()
	               : conn.getErrorStream();

	         // XML 파싱
	         DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	         DocumentBuilder builder = factory.newDocumentBuilder();
	         Document doc = builder.parse(stream);
	         doc.getDocumentElement().normalize();

	         // <item> 태그 가져오기
	         NodeList itemList = doc.getElementsByTagName("item");
	         for (int i = 0; i < itemList.getLength(); i++) {
	            Node item = itemList.item(i);
	            if (item.getNodeType() == Node.ELEMENT_NODE) {
	               Element element = (Element) item;

	               // 각 필드를 맵에 저장
	               Map<String, String> parkingData = new HashMap<>();
	               parkingData.put("parkingAirportCodeName", getTagValue("parkingAirportCodeName", element));
	               parkingData.put("parkingCongestion", getTagValue("parkingCongestion", element));
	               parkingData.put("parkingCongestionDegree", getTagValue("parkingCongestionDegree", element));
	               parkingData.put("parkingOccupiedSpace", getTagValue("parkingOccupiedSpace", element));
	               parkingData.put("parkingTotalSpace", getTagValue("parkingTotalSpace", element));

	               parkingList.add(parkingData);
	            }
	         }

	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return parkingList;
	   }

	   // XML 태그 값을 가져오는 헬퍼 메서드
	   private String getTagValue(String tag, Element element) {
	      NodeList nodeList = element.getElementsByTagName(tag).item(0).getChildNodes();
	      Node node = (Node) nodeList.item(0);
	      return node != null ? node.getNodeValue() : "";
	   }
}
