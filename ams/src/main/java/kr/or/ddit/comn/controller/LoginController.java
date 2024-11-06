package kr.or.ddit.comn.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.approv.service.ElecApvService;
import kr.or.ddit.approv.vo.ElecApvVO;
import kr.or.ddit.attendance.controller.Service.AttendanceService;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.util.BpBoardPagination;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.calendar.service.CalendarService;
import kr.or.ddit.calendar.vo.CalendarVO;
import kr.or.ddit.comn.service.LoginService;
import kr.or.ddit.comn.util.MailUtil;
import kr.or.ddit.comn.vo.AuthMenuVO;
import kr.or.ddit.human.service.EmployeeService;
import kr.or.ddit.human.service.MemberService;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.MemberVO;
import kr.or.ddit.human.vo.WorkRecordVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	CalendarService calendarService;
	
	@Inject
	ElecApvService elecApvService;
	
	@Inject
	AttendanceService attendanceService;
	
	@Inject
	BoardService boardService;
	
	@Autowired
	private LoginService loginService;	
	
	//<security:form-login login-page="/login" />
	//요청URI : /login
	//요청방식 : get
	//오류 메시지와 로그아웃 메시지를 파라미터로 사용해보자(없을 수도 있음)
	/**
	 * @author 홍정호
	 * 24.9.19.
	 * 로그인 후 또 로그인 페이지로 이동할 때 자동으로 emp/main으로 넘겨줌
	 */
	@GetMapping("/login")
	public String loginForm(HttpSession loginSession,
			HttpServletResponse response,
			Model model,
			RedirectAttributes redirectAttributes
			)
			throws ServletException, IOException {
	
		
		
		List<String> roleNames = (List<String>) loginSession.getAttribute("roleNames");
		
		Map<String, Object> roleNamesMap = new HashMap<String, Object>();
		
		if(roleNames == null || roleNames.isEmpty()) {
			return "loginForm";
		}
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd(E)", Locale.KOREAN);
		String formattedDate = dateFormat.format(date);		
		
		model.addAttribute("userId", loginSession.getAttribute("userId"));
		model.addAttribute("roleNames", roleNames);
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("menuReset", "true");
		
		if(roleNames.contains("ROLE_AIR") || roleNames.contains("ROLE_FRN") || roleNames.contains("ROLE_SBCTR")) {
			return "redirect:bp/board/list";
		}else if(roleNames.contains("ROLE_MEMBER")) {
			return "redirect:emp/main";
		}
		else {
			return "loginForm";
		}
	}
	
	/**
	 * @author 홍정호
	 * 24.9.15.
	 * CustomLoginSuccess에서 권한 유무 확인 후 권한이 있을 경우 emp/main으로 간다.
	 * 
	 * 24.9.27. 홍정호
	 * bp/main 추가에 따른 관려 처리 로직 추가
	 * 
	 */
	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/emp/main")
	public String mainPage(HttpSession loginSession, HttpServletResponse response, Model model, Locale locale
			) 
		throws IOException{
		List<String> roleNames = (List<String>) loginSession.getAttribute("roleNames");
		log.info("/emp/main 진입");
		log.info("roleNames : " + roleNames );
		

		String  memId = (String) loginSession.getAttribute("userId");
		log.info("진입 memId : " + memId );
		
		//프로필 정보 가져오기 
	    List<EmployeeVO> employeeVOList = this.employeeService.detail(memId);
	    log.info("진입 employeeVOList : " + employeeVOList );
	    
	    EmployeeVO employeeVO = null;

	    // 리스트가 비어있지 않은 경우 첫 번째 요소 선택
	    if (employeeVOList != null && !employeeVOList.isEmpty()) {
	        employeeVO = employeeVOList.get(0);  // 첫 번째 EmployeeVO 선택
	        log.info("detail ==> employeeVO : " + employeeVO);
	    } else {
	        // 리스트가 비어있는 경우 처리할 로직
	        log.info("No employee found with the given memId.");
	    }
		
  		 //일정가져오기
		 List<CalendarVO> calendarVO  =this.calendarService.todayMySchedule(memId);
		 log.info("진입 calendarVO : " + calendarVO );
		 
		 //calendarVO.scheEndDate 
		 
		 Date today = new Date();
		 log.info("진입 today (raw): " + today);

		 // 오늘 날짜를 yyyy-MM-dd 형식으로 포맷
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 String formattedToday = formatter.format(today);
		 log.info("진입 today (formatted): " + formattedToday);
		 
		 
		 //내가 결재해야할 대기문서 and 내가 기안한 결재대기문서
		 List<ElecApvVO> elecApvVOList = this.elecApvService.waitElec();
		 log.info("진입 elecApvVOList : " + elecApvVOList );
		
		 //근태현황
		 WorkRecordVO workRecordVO = this.attendanceService.todayAttendance(memId);
		 log.info("진입 workRecordVO : " + workRecordVO );
		 
		 //공지사항(필독)
		 List<BoardVO> currKeyBoard = this.boardService.currKeyBoard();
		 log.info("진입 currKeyBoard : " + currKeyBoard );
		 
		 //공지사항(최근)		 
		 List<BoardVO> currBoard = this.boardService.currBoard();
		 log.info("진입 currBoard : " + currBoard );
		 
		 currKeyBoard.addAll(currBoard);
		 log.info("진입 추가 후 currBoard : " + currBoard );
		 
		if(roleNames == null || roleNames.isEmpty()) {
			return "loginForm";
		}
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd(E)", Locale.KOREAN);
		String formattedDate = dateFormat.format(date);		
		
		model.addAttribute("formattedToday",formattedToday);
		model.addAttribute("currKeyBoard",currKeyBoard);
		model.addAttribute("currBoard",currBoard);
		model.addAttribute("elecApvVOList",elecApvVOList);
		model.addAttribute("userId", loginSession.getAttribute("userId"));
		model.addAttribute("workRecordVO", workRecordVO);
		model.addAttribute("calendarVO", calendarVO);
		model.addAttribute("employeeVO", employeeVO);
		model.addAttribute("roleNames", roleNames);
		model.addAttribute("authMenuList", loginSession.getAttribute("authMenuList"));
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("menuReset", "true");
		
		return "emp/main";
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/bp/board/list")
	public String bpMainPage(HttpSession loginSession, HttpServletResponse response, Model model, Locale locale,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			)
		throws IOException{
		log.info("/bp/main 진입");
		List<String> roleNames = (List<String>) loginSession.getAttribute("roleNames");
		
		if(roleNames == null || roleNames.isEmpty()) {
			return "loginForm";
		}
		
		Map<String, Object> boardMap = new HashMap<String, Object>();
		
		boardMap.put("gubun", gubun);
		boardMap.put("keyword", keyword);
		boardMap.put("currentPage", currentPage);
		
		int total = this.boardService.getCustTotal(boardMap);
		List<BoardVO> boardVOList = this.boardService.bpBoardList(boardMap);
		
		BpBoardPagination<BoardVO> articlePage = new BpBoardPagination<BoardVO>(total, currentPage, 10, boardVOList, boardMap);
		
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd(E)", Locale.KOREAN);
		String formattedDate = dateFormat.format(date);		

		model.addAttribute("userId", loginSession.getAttribute("userId"));
		model.addAttribute("roleNames", roleNames);
		model.addAttribute("authMenuList", loginSession.getAttribute("authMenuList"));
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("menuReset", "true");
		model.addAttribute("boardVOList", boardVOList);
		model.addAttribute("articlePage", articlePage);	
		model.addAttribute("menuReset", "true");
		
		return "bp/board/list";
		
	}

	/** 비밀번호 찾기 시 , 임시 비밀번호 담긴 이메일 보내기
	 * 
	 * @param memberVO
	 * @return
	 */
	//JSON String{memId:a001,employeeVO.empEml:sehe0700@naver.co}
	//memberVO -> JSON String(memId:a001,password:java...)
	@ResponseBody
	@PostMapping("/checkEmail") // 입력받은값
	public Map<String, String> checkEmail(@RequestBody MemberVO memberVO) {

		Map<String, String> map = new HashMap<String, String>();
		BCryptPasswordEncoder encoder= new BCryptPasswordEncoder();
		// {memId:a001,employeeVO.empEml:sehe0700@naver.co}
		log.info("받아온 값 checkEmail->memberVO : " + memberVO);

		// 쿼리로 조회한 값
		// <select id="checkEmail" parameterType="hashMap" resultMap="memberMap">
		MemberVO memberVO2 = this.memberService.checkEmail(memberVO);
		log.info("조회한 후 memberVO : " + memberVO);

		// 아이디와 이메일 조회
		if (memberVO != null) {
			if (!memberVO.getMemId().equals(memberVO2.getMemId())) {
				log.info("아이디 불일치");
				map.put("result", "1");
			} else if (!memberVO.getEmployeeVO().getEmpEml().equals(memberVO2.getEmployeeVO().getEmpEml())) {
				log.info("이메일 불일치");
				map.put("result", "2");
			} else if (memberVO.getEmployeeVO().getEmpEml().equals(memberVO2.getEmployeeVO().getEmpEml())
					&& memberVO.getMemId().equals(memberVO2.getMemId())) {
				log.info("존재하는 아이디");
				map.put("result", "0");
				
				//임시 비밀번호 생성
				String tempPw = UUID.randomUUID().toString().replace("-", "");
				tempPw =tempPw.substring(0,10);
				
				//임시 비밀번호 담기
				log.info("임시 비밀번호 생성 tempPw : " + tempPw);
				memberVO.setPassword(tempPw);// 임시 비밀번호 담기
				
				//메일전송
				MailUtil mail = new MailUtil(); //메일 전송하기
				mail.sendEmail(memberVO);

				// 임시 비밀번호 암호화
				String encodedPassword = encoder.encode(tempPw);
				
				// 임시 비밀번호 암호화 DB 담기
				memberVO.setPassword(encodedPassword);
				log.info("임시 비밀번호 암호화 담기 encodedPassword ==> memberVO : " + memberVO); //MemberVO(memId=a001, password=f7028399dd
				
				int res1 = this.memberService.updatePwd(memberVO);
				log.info("비밀번호 업데이트 결과 res1: : " + res1);
				

			} else {
				log.info("존재하지 않는 아이디");
				map.put("result", "3");
			}
		}
		return map;
	}

	
	
	
}
