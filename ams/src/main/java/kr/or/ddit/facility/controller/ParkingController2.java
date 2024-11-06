//package kr.or.ddit.facility.controller;
//
//import java.util.List;
//
//import javax.inject.Inject;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//
//
//import kr.or.ddit.facility.service.ParkingService;
//import kr.or.ddit.facility.vo.ParkingVO;
//import lombok.extern.slf4j.Slf4j;
//
//@RequestMapping("/cust/parking")
//@Slf4j
//@Controller
//public class ParkingController2 {
//	
//	
//	@Inject
//	ParkingService parkingService; 
//	
//	
//	@GetMapping("/regist")
//	public String regist() {
//		return "cust/parking/regist";
//	}
//	@GetMapping("/payed")
//	public String payed() {
//		return "cust/parking/payed";
//	}
//	
//	
//	@GetMapping("/regist2")
//	public String regist2() {
//		return "cust/parking/regist2";
//	}
////	
////	@GetMapping("/regist2")
////	public String regist2() {
////		return "cust/parking/regist2";
////	}
////	
//	
//	@PostMapping("/registPost")
//	public String registPost(@ModelAttribute ParkingVO parkingVO) {//ModelAttribute로 폼 데이터 받기
//		 log.info("registPost->parkingVO : " + parkingVO);
//		 
//		 int result = this.parkingService.registPost(parkingVO);
//		 
//		 log.info("registPost->result : " + result);
//		 
//		//redirect : 새로운 URI
////		return "redirect:/cust/detail?prkRsvtNo="+parkingVO.getPrkRsvtNo();
//		return "redirect:/cust/parking/regist2?prkRsvtNo="+parkingVO.getPrkRsvtNo();
//	}
//	
//	//예약목록조회
//	@GetMapping("/detail")
//	public String bpBoarddetail(Model model, @RequestParam(value="prkRsvtNo", required=true) int prkRsvtNo) {
//		
//		log.info("detail -> prkRsvtNo : " + prkRsvtNo);
//		
//		
//		// 1) 상세 정보 조회
//		ParkingVO parkingVO = new ParkingVO();
//		parkingVO.setPrkRsvtNo(prkRsvtNo);
//		parkingVO = this.parkingService.detail(prkRsvtNo);
//		log.info("detail -> parkingVO : " + parkingVO);
//		
//		
//		
//		model.addAttribute("parkingVO", parkingVO);
//
//		return "parking/board/detail";
//	}
//	//예약 취소
//	@ResponseBody
//	@PostMapping("/delete")
//	public int delete(@RequestBody ParkingVO parkingVO) {
//		log.info("delete -> parkingVO : " + parkingVO);
//		
//		int result = this.parkingService.delete(parkingVO);
//		
//		log.info("delete -> result : " + result);
//		
//		return result;
//	}
//	
//}
//
//
