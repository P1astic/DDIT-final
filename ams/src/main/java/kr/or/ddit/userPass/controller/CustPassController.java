
package kr.or.ddit.userPass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.board.service.CusBoardService;
import kr.or.ddit.board.util.BoardPagination;
import kr.or.ddit.board.vo.CustBoardVO;
import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.human.ServiceResult;
import kr.or.ddit.userPass.service.PhoneValidationService;
import kr.or.ddit.userPass.service.UserService;
import kr.or.ddit.userPass.vo.CustInfo;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

//@RequiredArgsConstructor
@Controller
//@RequestMapping("/sendSMS.do")
@Slf4j
@RequestMapping("")
@PropertySource("classpath:application.properties")
public class CustPassController {

	@Inject
	CusBoardService cusBoardService;
	
	@Value("${CustPassController_Key1}")
	private String CustPassController_Key1;

	@Value("${CustPassController_Key2}")
	private String CustPassController_Key2;
	
	@Value("${CustPassController_Key3}")
	private String CustPassController_Key3;

	final UserService userService;
	final net.nurigo.sdk.message.service.DefaultMessageService defaultMessageService;
	final PhoneValidationService custPassValidationService;

	@Autowired
	public CustPassController(UserService userService, PhoneValidationService custPassValidationService) {
		this.userService = userService;
		this.defaultMessageService = NurigoApp.INSTANCE.initialize(CustPassController_Key1,
				CustPassController_Key2, "https://api.coolsms.co.kr");
		this.custPassValidationService = custPassValidationService;
	}

//
//인증문자보내기
	@PostMapping("/cust/validation/sendSMS")
	@ResponseBody
	public SingleMessageSentResponse sendSMS(@RequestParam String name, String phone, HttpSession ss) {
		String ran_str = custPassValidationService.getValidationCode();

		Message msg = new Message();
		msg.setFrom(CustPassController_Key3);
		msg.setTo(phone);
		msg.setText("테스트 문자입니다. 인증번호는 : " + ran_str + "입니다.");

		// 고객확인용 정보
		CustInfo custI = new CustInfo();
		custI.setName(name);
		custI.setPhone(phone);

		// 대조 위해
		SingleMessageSentResponse response = this.defaultMessageService.sendOne(new SingleMessageSendingRequest(msg));

		// 인증번호
		ss.setAttribute("ran_str", ran_str);
		ss.setAttribute("message_id", response.getMessageId());
		ss.setMaxInactiveInterval(180);

		return response;
	}

	// 답변보내기
	@PostMapping("/emp/vos/sendAnswer")
	@ResponseBody
	public SingleMessageSentResponse sendAnswer(@RequestParam String phone, String context, HttpSession ss) {

		Message msg = new Message();
		msg.setFrom(CustPassController_Key3);
		msg.setTo(phone);
		msg.setText("안녕하세요 DDIT 공항입니다 : " + context);

		// 고객확인용 정보
		CustInfo custI = new CustInfo();
//		custI.setName(name);
		custI.setPhone(phone);

		// 대조 위해
		SingleMessageSentResponse response = this.defaultMessageService.sendOne(new SingleMessageSendingRequest(msg));

		ss.setAttribute("message_id", response.getMessageId());
		ss.setMaxInactiveInterval(180);

		return response;
	}

//	 받은 인증번호 검증
	@ResponseBody
	@PostMapping("/cust/validation/validationCode")
	public String validationSMS(@RequestParam String validation, HttpSession ss) {
		// validationSMS->validation : 12345
		log.info("validationSMS->validation : " + validation);
		// ?
		log.info("validationSMS->ss : " + ss);

		// success 또는 error
		return custPassValidationService.validationSMS(validation, ss);
	}

	//
	@GetMapping("/cust/validation/custPass")
	public String validationSMS(@RequestParam String link, Model model) {

		model.addAttribute("link", link);
		log.info("link:" + link);
		return "cust/validation/custPass";
	}

	// 답변 디테일 출력
	@GetMapping("/emp/vos/Answer")
	public String Answer(Model model, @RequestParam(value = "custBrdNo", required = true) String custBrdNo,
			HttpServletRequest ss) {
		log.info("detail -> custBrdNo : " + custBrdNo);
		log.info("detail -> visitor : " + ss.getAttribute("phone"));

		CustBoardVO custBoardVO = new CustBoardVO();
		custBoardVO.setCustBrdNo(custBrdNo);
		custBoardVO = this.cusBoardService.detail(custBrdNo);
		log.info("detail -> custBoardVO : " + custBoardVO);

		long fileGroupNo = custBoardVO.getFileGroupNo();
		List<FileDetailVO> fileDetailVOList = this.cusBoardService.fileList(fileGroupNo);
		log.info("detail -> fileDetailVOList : " + fileDetailVOList);

		model.addAttribute("custBoardVO", custBoardVO);
		model.addAttribute("fileDetailVOList", fileDetailVOList);
//		model.addAttribute("link", link);
//		log.info("lingk" + link);
		return "emp/vos/Answer";
	}

	// 사원용 리스트
	@GetMapping("/emp/vos/vosList")
	public String vosList(Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "custBrdAnsty", required = false, defaultValue = "all") String custBrdAnsty) {

		Map<String, Object> custBoardMap = new HashMap<String, Object>();
		custBoardMap.put("currentPage", currentPage);
		custBoardMap.put("keyword", keyword);
		custBoardMap.put("custBrdAnsty", custBrdAnsty);
		log.info("detail -> custBoardMap : " + custBoardMap);

		int total = this.cusBoardService.getTotal(custBoardMap);
		List<CustBoardVO> custBoardVOList = this.custPassValidationService.allcustBoardList(custBoardMap);
		log.info("list -> custBoardVOList : " + custBoardVOList);

		BoardPagination<CustBoardVO> articlePage = new BoardPagination<CustBoardVO>(total, currentPage, 15,
				custBoardVOList, custBoardMap);

		log.info("articlePage : " + articlePage);

		log.info("list -> custBoardVOList size: " + custBoardVOList.size());

		model.addAttribute("custBoardVOList", custBoardVOList);
		model.addAttribute("articlePage", articlePage);

		return "emp/vos/vosList";
	}

//	@GetMapping("/emp/vos/searchBoard")
//	public String searchBoard(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
//			@RequestParam(value = "status", required = false, defaultValue = "all") String status, Model model) {
//
//		// 검색 조건을 기반으로 데이터를 조회하는 서비스 호출
//		List<CustBoardVO> custBoardList = cusBoardService.searchBoard(keyword, status);
//
//		// 조회된 결과를 모델에 추가
//		model.addAttribute("custBoardVOList", custBoardList);
//
//		return "emp/vos/vosList"; // 검색 결과를 보여줄 JSP 페이지
//	}

	/* 인증번호 */
	@ResponseBody
	@GetMapping("/cust/validation/phone")
	public String sendSMS(String userPhoneNum) {
		// 5자리 인증번호 만들기
		Random random = new Random();
		String numStr = "";
		for (int i = 0; i < 5; i++) {
			String ranNum = Integer.toString(random.nextInt(10)); // 0부터 9까지 랜덤으로 숫자를 뽑는다.
			numStr += ranNum; // 랜덤으로 나온 숫자를 하나씩 누적해서 담는다.
		}
		// 확인용
		System.out.println("수신자 번호 : " + userPhoneNum);
		System.out.println("인증번호 : " + numStr);

		// 문자 보내기
		userService.certifiedPhoneNumber(userPhoneNum, numStr);
		return numStr; // 인증번호 반환
	}

	@ResponseBody
	@GetMapping("/cust/validation/cusList")
	public String searchList(@RequestParam String name, String phone, Model model, HttpSession ss) {

		CustInfo custInfoVO = new CustInfo();
		custInfoVO.setName(name);
		custInfoVO.setPhone(phone);
		log.info("name : " + name);
		log.info("custInfoVO : " + custInfoVO);

		List<CustBoardVO> searchList = this.custPassValidationService.searchList(name, phone);
		List<CustBoardVO> custBoardVOList = this.custPassValidationService.searchList(name, phone);
		ss.setAttribute("custBoardVOList", custBoardVOList);
//    	log.info("list -> custBoardVOList : " + searchList(custInfoVO));
		log.info("searchList : " + searchList);
		model.addAttribute("cusBoardVOList", searchList);
		return "cust/validation/cusList";

	}

//답변 이후 처리
//	@PostMapping("/emp/vos/updateAnswer")
//	@ResponseBody
//	public String updateAnswer(@RequestParam String custBrdNo) {
//		log.info(" custBrdNo = " + custBrdNo);
//
//		try {
//			cusBoardService.updateAnswer(custBrdNo);
//			return "success";
//		} catch (Exception e) {
//			return "error";
//		}
//	}
//
//}

// 답변 후 상태
	@PostMapping("/emp/vos/updateAnswer")
	@PreAuthorize("permitAll")
	@ResponseBody
	public String updateAnswer(@RequestParam String custBrdNo, RedirectAttributes ra) {
		log.info("custBrdNo = " + custBrdNo);

		CustBoardVO custBoardVO = new CustBoardVO();
		custBoardVO.setCustBrdNo(custBrdNo);

		ServiceResult result = cusBoardService.updateAnswer(custBoardVO);

		if (result == ServiceResult.OK) {
			log.info("상태 업데이트 성공!");
			ra.addFlashAttribute("message", "상태가 성공적으로 업데이트되었습니다.");
			return "success";
		} else {
			log.error("상태 업데이트 실패");
			return "error";
		}
	}

//검색
//	@GetMapping("/emp/vos/searchBoard")
//	public String searchBoard(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
//			@RequestParam(value = "status", required = false, defaultValue = "all") String status, Model model) {
//
//		// 검색 조건을 기반으로 데이터를 조회하는 서비스 호출
//		List<CustBoardVO> custBoardList = cusBoardService.searchBoard(keyword, status);
//
//		// 조회된 결과를 모델에 추가
//		model.addAttribute("custBoardVOList", custBoardList);
//
//		return "emp/vos/vosList"; // 검색 결과를 보여줄 JSP 페이지
//	}
}