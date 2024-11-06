package kr.or.ddit.human.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.human.ServiceResult;
import kr.or.ddit.human.service.MypageService;
import kr.or.ddit.human.vo.BpVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/")
@Slf4j
@Controller
public class MypageController {
	@Inject
	MypageService mypageService;

	@Autowired
	PasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/pass")
	public String list() {

		return "emp/mypage/pass";
	}
//	@GetMapping("/inout")
//	public String inout2() {
//		
//		return "emp/mypage/inout";
//	}

//	@GetMapping("bp/mypage/info")
//	public String list(HttpSession loginSession, Model model) {
////		log.info("registPost -> employeeVO : " + employeeVO);
////		List<EmployeeVO> result = this.mypageService.list(employeeVO);
////		log.info("registPost -> result : " + result);
//		
//		//1. 첫번째는 세션에서 userId가지고와서
//		//user 테이블 조회해서 모든 데이터 가지고오기(비밀번호가 여기 있음)
//		
//		//2. 다시 userId 통해서
//		//employee테이블 조회해서 모든 데이터 가지고오기
//		
//		//3. 아니면 두개 테이블 조인해서 모든 데이터 가지고오기 << 이러면 쿼리 한번만 사용해도됨(서비스의 메소드를 하나만 생성해도됨)
//		
//		log.info("지금 userId : " + loginSession.getAttribute("userId"));
//		
//		MemberVO memberVO = new MemberVO();
//		EmployeeVO employeeVO = new EmployeeVO();
//		employeeVO.setMemId((String) loginSession.getAttribute("userId"));
//		
//		EmployeeVO result = this.mypageService.searchMember(employeeVO);//
//		
//		model.addAttribute("result", result);// JSP로 보낼떄 쓰는거
//		
//		//MemberVO memberVO = this.mypageService.searchMember(loginSession.getAttribute("userId"));
//		
////		log.info("memberVO : " + memberVO);
//		
//		
////		Map<String, String> map = new HashMap<>();
//		
////		EmployeeVO searchResult = this.mypageService.mypageInfo();
//		
//		
//		return "emp/mypage/info";
//	}
//	

	@GetMapping("emp/mypage/info")
	public String empInfo(HttpSession loginSession, Model model) {
		
		// 현재 로그인한 유저의 로그인 세션에서 id 가져오기
		String memId = (String) loginSession.getAttribute("userId");
		log.info("empInfo memId : " + memId);

		// 해당 아이디의 상세 정보 가져오기
		EmployeeVO employeeVO = this.mypageService.searchMember(memId);
		log.info("empInfo employeeVO : " + employeeVO);
		
		// 변환된 전화번호 저장
		String telNo = employeeVO.getEmpMoblphon();

		telNo = telNo.replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");

	    log.info("empInfo telNo : " + telNo);
	    employeeVO.setEmpMoblphon(telNo);
		
	    // 변환된 생년월일 저장
	    String rrno = employeeVO.getEmpRrno();
        
	    log.info("empInfo rrno" + rrno);
	    String rrnoYear = rrno.substring(0, 4); // 연도
	    String rrnoMonth = rrno.substring(4, 6); // 월
	    String rrnoDay = rrno.substring(6); // 일

	    log.info("empInfo rrnoYear" + rrnoYear);
	    log.info("empInfo rrnoMonth" + rrnoMonth);
	    log.info("empInfo rrnoDay" + rrnoDay);

	    // 월이 한 자리 수일 경우 두 자리로 변환
	    if(rrnoMonth.length() == 1) {
	    	rrnoMonth = "0" + rrnoMonth;
	    }

	    // 일도 한 자리 수일 경우 두 자리로 변환
	    if(rrnoDay.length() == 1) {
	    	rrnoDay = "0" + rrnoDay;
	    }

	    // 최종 날짜 포맷 구성
	    rrno = rrnoYear + "-" + rrnoMonth + "-" + rrnoDay;
	    
	    log.info("empInfo rrno" + rrno);
	    employeeVO.setEmpRrno(rrno);
	    
	    // 변환된 입사일자 저장
	    String empJncmpYmd = employeeVO.getEmpJncmpYmd();
		    
	    log.info("empInfo empJncmpYmd" + empJncmpYmd);
	    
	    String empJncmpYmdYear = empJncmpYmd.substring(0, 4); // 연도
	    String empJncmpYmdMonth = empJncmpYmd.substring(4, 6); // 월
	    String empJncmpYmdDay = empJncmpYmd.substring(6); // 일

	    log.info("empInfo empJncmpYmdYear" + empJncmpYmdYear);
	    log.info("empInfo empJncmpYmdMonth" + empJncmpYmdMonth);
	    log.info("empInfo empJncmpYmdDay" + empJncmpYmdDay);
	    
	    // 월이 한 자리 수일 경우 두 자리로 변환
	    if(empJncmpYmdMonth.length() == 1) {
	    	empJncmpYmdMonth = "0" + empJncmpYmdMonth;
	    }
	    
	    // 일도 한 자리 수일 경우 두 자리로 변환
	    if(empJncmpYmdDay.length() == 1) {
	    	empJncmpYmdDay = "0" + empJncmpYmdDay;
	    }
	    
	    // 최종 날짜 포맷 구성
	    empJncmpYmd = empJncmpYmdYear + "-" + empJncmpYmdMonth + "-" + empJncmpYmdDay;
	    
	    log.info("empInfo empJncmpYmd" + empJncmpYmd);		
	    employeeVO.setEmpJncmpYmd(empJncmpYmd);		

		model.addAttribute("employeeVO", employeeVO);// JSP로 보낼떄 쓰는거

		return "emp/mypage/info";
	}

	// bp myapge info
	@GetMapping("bp/mypage/info")
	public String bpInfo(HttpSession loginSession, Model model) {
		
		// 현재 로그인한 유저의 로그인 세션에서 id 가져오기
		String memId = (String) loginSession.getAttribute("userId");
		log.info("bpInfo memId : " + memId);

		// 해당 아이디의 상세 정보 가져오기
		BpVO bpVO = this.mypageService.searchBp(memId);
		log.info("bpInfo bpVO : " + bpVO);
		
		// 변환된 전화번호 저장
		String telNo = bpVO.getBpTelno();

		if (telNo == null) {
	        telNo = "-";
	    } else {
	        if (telNo.matches("^010\\d{8}$")) {
	            // 010-1234-5678 형식
	            telNo = telNo.replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
	        } else if (telNo.matches("^042\\d{7}$")) {
	            // 042-123-5678 형식
	            telNo = telNo.replaceFirst("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
	        } else if (telNo.matches("^02\\d{7}$")) {
	            // 02-123-4567 형식
	            telNo = telNo.replaceFirst("(\\d{2})(\\d{3})(\\d{4})", "$1-$2-$3");
	        } else if (telNo.matches("^070\\d{8}$")) {
	            // 070-1234-5678 형식
	            telNo = telNo.replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
	        } else if (telNo.matches("^02\\d{8}$")) {
	            // 02-1234-5678 형식
	            telNo = telNo.replaceFirst("(\\d{2})(\\d{4})(\\d{4})", "$1-$2-$3");
	        }
	    }

	    log.info("bpInfo telNo : " + telNo);
	    bpVO.setBpTelno(telNo);
		
	    // 변환된 계약일 저장
	    String ctrtYmd = bpVO.getCtrtYmd();
        
	    log.info("bpInfo ctrtYmd : " + ctrtYmd);
	    String ctrtYmdYear = ctrtYmd.substring(0, 4); // 연도
	    String ctrtYmdMonth = ctrtYmd.substring(4, 6); // 월
	    String ctrtYmdDay = ctrtYmd.substring(6); // 일

	    log.info("bpInfo ctrtYmdYear" + ctrtYmdYear);
	    log.info("bpInfo ctrtYmdMonth" + ctrtYmdMonth);
	    log.info("bpInfo ctrtYmdDay" + ctrtYmdDay);

	    // 월이 한 자리 수일 경우 두 자리로 변환
	    if(ctrtYmdMonth.length() == 1) {
	    	ctrtYmdMonth = "0" + ctrtYmdMonth;
	    }

	    // 일도 한 자리 수일 경우 두 자리로 변환
	    if(ctrtYmdDay.length() == 1) {
	    	ctrtYmdDay = "0" + ctrtYmdDay;
	    }

	    // 최종 날짜 포맷 구성
	    ctrtYmd = ctrtYmdYear + "-" + ctrtYmdMonth + "-" + ctrtYmdDay;
	    
	    log.info("bpInfo ctrtYmd" + ctrtYmd);
	    bpVO.setCtrtYmd(ctrtYmd);
	    
	    // 변환된 계약 종료일 저장
	    String ctrtEndYmd = bpVO.getCtrtEndYmd();
		    
	    log.info("bpInfo ctrtEndYmd" + ctrtEndYmd);
	    
	    String ctrtEndYmdYear = ctrtEndYmd.substring(0, 4); // 연도
	    String ctrtEndYmdMonth = ctrtEndYmd.substring(4, 6); // 월
	    String ctrtEndYmdDay = ctrtEndYmd.substring(6); // 일

	    log.info("bpInfo ctrtEndYmdYear" + ctrtEndYmdYear);
	    log.info("bpInfo ctrtEndYmdMonth" + ctrtEndYmdMonth);
	    log.info("bpInfo ctrtEndYmdDay" + ctrtEndYmdDay);
	    
	    // 월이 한 자리 수일 경우 두 자리로 변환
	    if(ctrtEndYmdMonth.length() == 1) {
	    	ctrtEndYmdMonth = "0" + ctrtEndYmdMonth;
	    }
	    
	    // 일도 한 자리 수일 경우 두 자리로 변환
	    if(ctrtEndYmdDay.length() == 1) {
	    	ctrtEndYmdDay = "0" + ctrtEndYmdDay;
	    }
	    
	    // 최종 날짜 포맷 구성
	    ctrtEndYmd = ctrtEndYmdYear + "-" + ctrtEndYmdMonth + "-" + ctrtEndYmdDay;
	    
	    log.info("bpInfo ctrtEndYmd" + ctrtEndYmd);		
	    bpVO.setCtrtEndYmd(ctrtEndYmd);		

		model.addAttribute("bpVO", bpVO);// JSP로 보낼떄 쓰는거

		return "bp/mypage/info";
	}

	// 직원 정보 수정(기능)
	@PreAuthorize("permitAll")
	@ResponseBody
	@RequestMapping(value = "emp/mypage/update", method = RequestMethod.POST)
	public int infoModify(HttpServletRequest req, EmployeeVO employeeVO, Model model, RedirectAttributes ra,
			Principal principal) {

		log.info("infoModify->employeeVO : " + employeeVO);
		
		if(employeeVO.getPassword() != null) {
			String pwd = employeeVO.getPassword();
			String encodedPwd = this.bcryptPasswordEncoder.encode(pwd);
			log.info("encodedPwd : " + encodedPwd);		
			
			employeeVO.setPassword(encodedPwd);			
		}

		int result = this.mypageService.update(employeeVO);

		return result;
	}

	// 협력사 수정 (기능)
	@PreAuthorize("permitAll")
	@ResponseBody
	@RequestMapping(value = "bp/mypage/updateBp", method = RequestMethod.POST)
	public int infoModify(HttpServletRequest req, BpVO bpVO, Model model, RedirectAttributes ra,
			Principal principal) {

		log.info("infoModify->BpVO : " + bpVO);
		
		if(bpVO.getPassword() != null) {
			String pwd = bpVO.getPassword();
			String encodedPwd = this.bcryptPasswordEncoder.encode(pwd);
			log.info("encodedPwd : " + encodedPwd);
			
			bpVO.setPassword(encodedPwd);
		}
		
		int reuslt = this.mypageService.updateBp(bpVO);

		
		return reuslt;
	}


//	
	@GetMapping("emp/mypage/inout")
	public String inout() {
		return "emp/mypage/inout";
	}
//	
	@GetMapping("emp/inout/inout")
	public String inout2() {
		return "emp/inout/inout";
	}

	@GetMapping("/modal")
	public String modal() {
		return "emp/mypage/modal";
	}

	@GetMapping("/moaex")
	public String moaex() {

		return "emp/mypage/moaex";
	}

	@ResponseBody
	@PostMapping("/bpPasswordCheckPost")
	public int bpPasswordCheckPost(HttpSession loginSession, MemberVO memberVO, Model model) {
		log.info("bpPasswordCheckPost memberVO :" + memberVO);

		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setMemId((String) loginSession.getAttribute("userId"));
		memberVO.setEmployeeVO(employeeVO);

		int checkResult = this.mypageService.bpPasswordCheckPost(memberVO);
		log.info("checkResult : " + checkResult);

		return checkResult;
	}

	@ResponseBody
	@PostMapping("/empPasswordCheckPost")
	public int empPasswordCheckPost(@RequestParam String memId, @RequestParam String password) {

		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(memId);
		memberVO.setPassword(password);
		log.info("empPasswordCheckPost memberVO : " + memberVO);

		// 1. checkResult : 1 => 일치 / checkResult : 0 => 불일치
		int checkResult = this.mypageService.empPasswordCheckPost(memberVO);
		log.info("checkResult : " + checkResult);

		return checkResult;
	}

	// EMP 비밀번호 2차 인증
//	@PostMapping("/passwordCheckPost")
//	public String passwordCheckPost2(HttpSession loginSession, MemberVO memberVO, Model model) {
//		log.info("memberVO :" + memberVO);
//		
//		EmployeeVO employeeVO = new EmployeeVO();
//		employeeVO.setMemId((String) loginSession.getAttribute("userId"));
//		memberVO.setEmployeeVO(employeeVO);
//		
//		//1. checkResult : 1 => 일치   / checkResult : 0 => 불일치
//		int checkResult = this.mypageService.passwordCheckPost(memberVO);
//		log.info("checkResult : " + checkResult);
//		
//		
//
//		log.info("employeeVO: "+employeeVO);
//		employeeVO.setMemId((String) loginSession.getAttribute("userId"));
//		
//		EmployeeVO result = this.mypageService.searchMember(employeeVO);//
//		
//		log.info("result" + result);
//		
//		//2. info.jsp에서 달러{result.프로퍼티}를 사용
//		model.addAttribute("result", result);// JSP로 보낼떄 쓰는거
//		
//		
//		if(checkResult>0) {
//			log.info("성공!");
//			model.addAttribute("checkResult", "OK");
//		}else {
//			log.info("실패!");
//			model.addAttribute("checkResult", "FAIL");
//		}
//		
//		//forwarding
//		return "bp/mypage/info";
//	}
//
//	
//	@GetMapping("/attendance/main")
//	public String main() {
//		//forwarding 시 return "/emp (x)
//		return "emp/attendance/main";
//	}
}
