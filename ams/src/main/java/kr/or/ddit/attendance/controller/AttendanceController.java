package kr.or.ddit.attendance.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.attendance.controller.Service.AttendanceService;
//import kr.or.ddit.attendance.service.AttendanceService;
import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.board.vo.CustBoardVO;
import kr.or.ddit.human.ServiceResult;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.WorkRecordVO;
import kr.or.ddit.userPass.vo.CustInfo;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/emp/attendance")
@Slf4j
@Controller
public class AttendanceController {

	@Inject
	AttendanceService attendanceService;

	@GetMapping("/inout")
	public String list() {
		log.info("출근하러 와따");
		return "emp/attendance/inout";
	}

	@GetMapping("/line")
	public String line() {
		return "emp/attendance/line";
	}

	@GetMapping("/inout2")
	public String list2() {
		log.info("출근하러 와따");
		return "emp/attendance/inout2";
	}

	@GetMapping("/main")
	public String main(HttpSession loginSession, Model model) {
		// list뽑기
		log.info("지금 userId : " + loginSession.getAttribute("userId"));

		AttendanceVO attendanceVO = new AttendanceVO();
		attendanceVO.setMemId((String) loginSession.getAttribute("userId"));

		String memId = (String) loginSession.getAttribute("userId");
		log.info("진입 memId : " + memId);
		// 근태현황
		WorkRecordVO workRecordVO = this.attendanceService.today(memId);
		
		log.info("진입 workRecordVO : " + workRecordVO);
		// 잔여휴가 불러오기
		EmployeeVO getHolidayVO = this.attendanceService.getHolidayVO(memId);
		log.info("잔여휴가용 VO : " + getHolidayVO);

//		AttendanceVO result = this.attendanceService.searchlist(attendanceVO);
		List<AttendanceVO> list = this.attendanceService.list(attendanceVO);
//		log.info("result : " + result);
		log.info("list : " + list);
//		model.addAttribute("result", result);// JSP로 보낼떄 쓰는거
		model.addAttribute("list", list);// JSP로 보낼떄 쓰는거s
		model.addAttribute("workRecordVO", workRecordVO);
		model.addAttribute("getHolidayVO", getHolidayVO);

		return "emp/attendance/main";
	}

	@PostMapping("/workIn")
	@PreAuthorize("permitAll")
	@ResponseBody // JSON 데이터를 반환할 수 있도록 설정
	public Map<String, Object> workIn(@RequestParam String memId, @ModelAttribute AttendanceVO attendanceVO) {

		log.info("출근 처리 시작, 로그인한 memId : " + memId);

		Map<String, Object> response = new HashMap<>(); // 반환할 데이터 저장용 Map

		if (memId == null || memId.isEmpty()) {
			log.info("memId가 null이거나 비어있습니다.");
			response.put("status", "error");
			response.put("message", "memId가 유효하지 않습니다.");
			return response;
		}

		attendanceVO.setMemId(memId);
		log.info("출근 정보: " + attendanceVO);

		ServiceResult result = attendanceService.workIn(attendanceVO);
		log.info("출근 처리 결과: " + result);

		if (result == ServiceResult.OK) {
			// 출근 성공 시 출근 시간을 반환
			response.put("status", "success");
			response.put("attendTm", attendanceVO.getAttendTm()); // 출근 시간을 클라이언트로 전달
		} else {
			response.put("status", "error");
			response.put("message", "출근 처리에 실패했습니다.");
		}

		return response; // JSON 형태로 반환
	}

	// 퇴근 버튼 클릭 실행
	@PostMapping("/workOut")
	@PreAuthorize("permitAll")
	@ResponseBody
	public String workOut(@RequestParam String memId, @RequestParam String wrNo) {
		log.info("퇴근 처리: memId = " + memId + ", wrNo = " + wrNo);

		AttendanceVO attendanceVO = new AttendanceVO();
		attendanceVO.setMemId(memId);
		attendanceVO.setWrNo(wrNo); // 퇴근 기록을 식별하기 위한 wrNo 추가

		ServiceResult result = attendanceService.workOut(attendanceVO);

		if (result == ServiceResult.OK) {
			log.info("퇴근 시간 업데이트 성공!");
			return "success"; // 성공 시 'success' 반환
		} else {
			log.error("퇴근 시간 업데이트 실패");
			return "error"; // 실패 시 'error' 반환
		}
	}
}