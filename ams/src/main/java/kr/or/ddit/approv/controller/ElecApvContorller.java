package kr.or.ddit.approv.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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
import kr.or.ddit.approv.service.ElecApvService;
import kr.or.ddit.approv.service.TemplateSectionService;
import kr.or.ddit.approv.util.myPaymentPage;
import kr.or.ddit.approv.util.waitPaymentPage;
import kr.or.ddit.approv.vo.ApvDetailVO;
import kr.or.ddit.approv.vo.ElecApvVO;
import kr.or.ddit.approv.vo.TemplateSectionVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.service.DeptService;
import kr.or.ddit.human.service.EmployeeService;
import kr.or.ddit.human.service.LeaveDetailService;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.LeaveDetailVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 김인호
 * 전자결재
 * 24.09.13 
 */
@RequestMapping("/elecApv")
@Slf4j
@Controller
public class ElecApvContorller {
	
	@Inject
	private ElecApvService elecApvService;
	
	@Inject
	private EmployeeService employeeService;
	
	@Inject
	private DeptService deptService;
	
	@Inject
	private TemplateSectionService templateSectionService;
	
	@Inject
	private AirlineService airlineService;
	
	@Inject
	private LeaveDetailService LeaveDetailService;
	
	
	// 임시로 만듬
	@GetMapping("/indexPage")
	public String indexPage() {
		
		return "emp/elecApv/indexPage";
	}
	
	/**
	 * @param 김인호
	 * 24.09.20 기안문서 목록   
	 */
	@GetMapping("/myPaymentList")
	public String pamentList(Model model, String memId,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="startDate", required=false) String startDate,
            @RequestParam(value="endDate", required=false) String endDate,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			) {
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		listMap.put("gubun", gubun);
		listMap.put("keyword", keyword);
		listMap.put("startDate", startDate);
		listMap.put("endDate", endDate);
		listMap.put("currentPage", currentPage);
		
		log.info("listMap : " + listMap);
		
		int total = this.elecApvService.getTotal(listMap);
		
		log.info("totoal : "+total);
		
		List<ElecApvVO> elecApvVOList = this.elecApvService.elecApvList(listMap);
		
		
		log.info("currentPage : " + currentPage);
		log.info("myPaymentList -> elecApvVOList : "+elecApvVOList);
		myPaymentPage<ElecApvVO> articlePage = new myPaymentPage<ElecApvVO>(total, currentPage, 15
				, elecApvVOList , listMap);
		
		log.info("articlePage : " + articlePage);
		
		model.addAttribute("elecApvVOList",elecApvVOList);
		model.addAttribute("articlePage",articlePage);
		
		return "emp/elecApv/myPaymentList";
	}
	
	/**
	 * @param 김인호
	 * 24.09.29   결재 대기문서 
	 */
	@GetMapping("/waitPaymentList")
	public String waitPamentList(Model model, String memId,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			) {
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		listMap.put("gubun", gubun);
		listMap.put("keyword", keyword);
		listMap.put("currentPage", currentPage);
		
		log.info("listMap : " + listMap);
		
		int total = this.elecApvService.getTotal(listMap);
		
		log.info("totoal : "+total);
		
		List<ElecApvVO> elecApvVOList = this.elecApvService.elecApvList(listMap);
		
		
		log.info("currentPage : " + currentPage);
		log.info("myPaymentList -> elecApvVOList : "+elecApvVOList);
		waitPaymentPage<ElecApvVO> articlePage = new waitPaymentPage<ElecApvVO>(total, currentPage, 15
				, elecApvVOList , listMap);
		
		log.info("articlePage : " + articlePage);
		
		model.addAttribute("elecApvVOList",elecApvVOList);
		model.addAttribute("articlePage",articlePage);
		
		return "emp/elecApv/waitPaymentList";
	}
	
	@GetMapping("/completePaymentList")
	public String completePaymentList(Model model, String memId,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			) {
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		listMap.put("gubun", gubun);
		listMap.put("keyword", keyword);
		listMap.put("currentPage", currentPage);
		
		log.info("listMap : " + listMap);
		
		int total = this.elecApvService.getTotal(listMap);
		
		log.info("totoal : "+total);
		
		List<ElecApvVO> elecApvVOList = this.elecApvService.elecApvList(listMap);
		
		
		log.info("currentPage : " + currentPage);
		log.info("myPaymentList -> elecApvVOList : "+elecApvVOList);
		waitPaymentPage<ElecApvVO> articlePage = new waitPaymentPage<ElecApvVO>(total, currentPage, 15
				, elecApvVOList , listMap);
		
		log.info("articlePage : " + articlePage);
		
		model.addAttribute("elecApvVOList",elecApvVOList);
		model.addAttribute("articlePage",articlePage);
		
		return "emp/elecApv/completePaymentList";
	}
	
	/**
	 * @author 김인호
	 * 전자결재 폼
	 * 24.09.13
	 */
//	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/paymentForm")
	public String paymentForm(Model model) {
		
		List<EmployeeVO> employeeVOList = this.employeeService.list2();
		log.info("ElecApvContorller -> employeeVOList : "+employeeVOList);
		
		List<DeptVO> deptVOList = this.deptService.deptList();
//		deptVOList.get(1);
//		deptVOList.set(index, element)
		log.info("ElecApvContorller -> deptVOList : "+deptVOList);
		
		List<TemplateSectionVO> TemplateSectionVOList = this.templateSectionService.templateList();
		log.info("ElecApvContorller -> TemplateSectionVOList : "+TemplateSectionVOList);
		
//		List<AirLineVO> AirLineVOList = this.airlineService.airlineList();
//		log.info("ElecApvContorller -> AirLineVOList : "+AirLineVOList);
		
		List<CommonCodeDetailVO> CommonCodeDetailVOList = this.elecApvService.comCodeList();
		log.info("ElecApvContorller -> CommonCodeDetailVOList : "+CommonCodeDetailVOList);
		
		model.addAttribute("employeeVOList",employeeVOList);
		model.addAttribute("deptVOList",deptVOList);
		model.addAttribute("TemplateSectionVOList",TemplateSectionVOList);
//		model.addAttribute("AirLineVOList",AirLineVOList);
		model.addAttribute("CommonCodeDetailVOList",CommonCodeDetailVOList);
		
		return "emp/elecApv/paymentForm";
	}
	
	
	
	/**
	 * @param 김인호
	 * 24.09.19 부서별 인원
	 */
	@ResponseBody
	@PostMapping("/deptEmpListAjax")
	public List<EmployeeVO> deptEmpListAjax(@RequestBody String deptCd) {
		
		log.info("deptEmpListAjax -> deptCd : "+deptCd);
		List<EmployeeVO> deptEmpList = this.employeeService.deptEmpListAjax(deptCd);
		log.info("deptEmpListAjax -> deptEmpList : "+deptEmpList);
		
		
		return deptEmpList;
	}
	
	/**
	 * @param 김인호
	 * 24.09.20 기안처리
	 */
	@PostMapping("/paymentInsert")
	public String paymentInsert(Model model, EmployeeVO employeeVO,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			) {
		log.info("paymentInsert - > employeeVO : "+employeeVO);
		
		Map<String, Object> boardMap = new HashMap<String, Object>();
		
		boardMap.put("gubun", gubun);
		boardMap.put("keyword", keyword);
		boardMap.put("currentPage", currentPage);
		
		log.info("paymentInsert -> boardMap : " + boardMap);
		
		int total = this.elecApvService.getTotal(boardMap);
		log.info("paymentInsert -> total : "+total);
		
		int result = this.elecApvService.paymentInsert(employeeVO);
		log.info("paymentInsert - > result : "+result);
		
		List<ElecApvVO> elecApvVOList = this.elecApvService.elecApvList(boardMap);
		log.info("paymentInsert - > elecApvVOList : "+elecApvVOList);
		model.addAttribute("elecApvVOList",elecApvVOList);
		
		return "emp/elecApv/myPaymentList";
	}
	
	
	/**
	 * @param 김인호
	 * 24.09.23 결재문서 상세
	 */
	@GetMapping("/paymentDetail")
	public String paymentDetail(Model model, String elecApvNo, String memId) {
		log.info("paymentDetail -> elecApvNo : "+elecApvNo);
		log.info("paymentDetail -> memId : "+memId);
		
		
		List<ElecApvVO> elecApvVOList = this.elecApvService.myElecApvListDetail(elecApvNo);
		log.info("paymentDetail -> elecApvVOList : "+elecApvVOList);
		
		LeaveDetailVO leaveDetailVO = this.LeaveDetailService.leaveDetailList(elecApvNo);
		log.info("paymentDetail -> leaveDetailVOList : "+leaveDetailVO);
		
//		CommonCodeDetailVO commonCodeDetailVO = this.elecApvService.comCodeList();
		
//		ApvDetailVO apvDetailVO = new ApvDetailVO();
//		apvDetailVO.setElecApvNo(elecApvNo);
//		apvDetailVO.setMemId(memId);
//		log.info("paymentDetail -> apvDetailVO : "+apvDetailVO);

		List<ApvDetailVO> apvDetail = this.elecApvService.getApvLineFinYn1(elecApvNo);
		log.info("paymentDetail-> apvDetail : "+apvDetail);
		
		model.addAttribute("elecApvVOList",elecApvVOList);
		model.addAttribute("leaveDetailVO",leaveDetailVO);
		model.addAttribute("apvDetail",apvDetail);
		
		return "emp/elecApv/paymentDetail";
	};
	
	
	
	/**
	 * @param 김인호
	 * 24.09.26 결재 승인
	 */
	@ResponseBody
	@PostMapping("/apvDetailUpdate")
	public int apvDetailUpdate(@RequestBody ElecApvVO elecApvVO) {
		log.info("apvDetailUpdate -> elecApvVO : "+elecApvVO);
		int result = this.elecApvService.apvDetailUpdate(elecApvVO);
		log.info("apvDetailUpdate -> result : "+result);
		
		return result;
	};

	/**
	 * @param 김인호
	 * 24.09.27 결재 반려
	 */
	@ResponseBody
	@PostMapping("/prDetailUpdate")
	public int prDetailUpdate(@RequestBody ApvDetailVO apvDetailVO) {
		log.info("apvDetailUpdate -> apvDetailVO : "+apvDetailVO);
		
		int result = this.elecApvService.prDetailUpdate(apvDetailVO);
		log.info("apvDetailUpdate -> result : "+result);
		
		return result;
	};
	
	// 최종결재자 
	@ResponseBody
	@PostMapping("/getApvLineFinYn")
	public ApvDetailVO getApvLineFinYn(@RequestBody ApvDetailVO apvDetailVO) {
		
		log.info("getApvLineFinYn-> apvDetailVO : "+apvDetailVO);
		ApvDetailVO apvDetail = this.elecApvService.getApvLineFinYn(apvDetailVO);
		log.info("getApvLineFinYn-> apvDetail : "+apvDetail);
		
		return apvDetail;
	}
	
	
}
