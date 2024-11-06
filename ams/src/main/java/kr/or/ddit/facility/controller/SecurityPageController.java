	package kr.or.ddit.facility.controller;
	

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.facility.service.SecurityPageService;
import kr.or.ddit.facility.util.MainTenPagination;
import kr.or.ddit.facility.vo.SecurityCheckResultsVO;
import kr.or.ddit.facility.vo.SecurityChecklistVO;
import kr.or.ddit.facility.vo.SecurityCompanyVO;
import kr.or.ddit.facility.vo.SecurityFacilityVO;
import kr.or.ddit.facility.vo.SecurityWorkerVO;
import lombok.extern.slf4j.Slf4j;
	
	/**
	 * @author 김인교
	 * 보안페이지  9.23 시작
	 *
	 */
	
	
	@RequestMapping("/bp")
	@Slf4j
	@Controller
	public class SecurityPageController {
	
		  
		
		@Inject
		 SecurityPageService securityPageService;
		
		
		
		/*---------------------------------------------------------------업체,시설 리스트페이지-----------------------------------------------------*/	
		
		//명칭을 잘못생각해서 시설등록을 secCompany 으로 사용해야함 시설이지만 이미 먼길을 돌아왔음
		
		/**
		 * @author 김인교
		 * 보안페이지 시설 리스트
		 *
		 */
		
		//list는 두개를 다 보여주기떄문에 하나로 진행
		
		@GetMapping("/secFacility/list")
		public String companyList(Model model, SecurityCompanyVO securityCompanyVO,
				SecurityFacilityVO securityFacilityVO,
				@RequestParam(value="searchFilter", required=false, defaultValue="ALL") String searchFilter,
	    		@RequestParam(value="table_search", required=false, defaultValue="") String table_search,
	    		@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
			
			//페이징을 하기위해 필요한 변수들
			Map<String, Object> maintenanceMap = new HashMap<String, Object>();
	    	
	    	maintenanceMap.put("searchFilter", searchFilter);
	    	maintenanceMap.put("table_search", table_search);
	    	maintenanceMap.put("currentPage", currentPage);
	    	maintenanceMap.put("table", "secFacility");
	    	//맵으로 select 안할꺼라 vo에 값을넣음
	    	securityFacilityVO.setCurrentPage(currentPage);
			
			
			List<SecurityCompanyVO> securityCompanyVOList = this.securityPageService.companyList(securityCompanyVO);
			List<SecurityFacilityVO> securityFacilityVOList = this.securityPageService.facilityList(securityFacilityVO);
			
			int total = this.securityPageService.getTotal(maintenanceMap);
			
			//실제 페이지네이션을하기위한 코드
			MainTenPagination<SecurityFacilityVO> securityFacilityPage = new MainTenPagination<SecurityFacilityVO>(total, currentPage, 10, securityFacilityVOList, maintenanceMap);

			
			model.addAttribute("securityCompanyVOList",securityCompanyVOList);
			model.addAttribute("securityFacilityVOList",securityFacilityVOList);
			model.addAttribute("securityFacilityPage",securityFacilityPage);
			
			return "bp/secFacility/list";
		}
		
		/*---------------------------------------------------------------업체,시설 등록 -----------------------------------------------------*/	
	
		/**
		 * @author 김인교
		 * 보안페이지 업체 등록 
		 */
		@GetMapping("/secFacility/regist")
		public String facilityRegist(Model model) {
			
			return "bp/secFacility/regist";
		}

		/**
		 * @author 김인교
		 * 보안페이지 시설 등록
		 */
		@GetMapping("/secCompany/regist")
		public String secCompanyRegist(Model model, SecurityChecklistVO securityChecklistVO) {
		    // 회사 목록 가져오기
		    List<SecurityCompanyVO> securityCompanyVOList = this.securityPageService.companyList(new SecurityCompanyVO());
		    
		    // 점검표 목록 가져오기
		    List<SecurityChecklistVO> secListVOList = this.securityPageService.secListVOList(securityChecklistVO);
		    
		    model.addAttribute("securityCompanyVOList", securityCompanyVOList);
		    model.addAttribute("secCheckListVOList", secListVOList);
		    
		    return "bp/secCompany/regist";
		}
		
		@GetMapping("/secCompany/getChecklistItems")
		@ResponseBody
		public List<String> getChecklistItems(@RequestParam String checklistSeq) {
		    // checklistSeq에 해당하는 점검 항목을 DB에서 가져오는 로직
		    List<String> checkItems1 = securityPageService.getChecklistItems(checklistSeq);
		    return checkItems1; // 점검 항목 목록을 반환
		}
		
		
		@PostMapping("/secCompany/secCompanyRegistFrom")
		public String secCompanyRegistFrom(Model model, @ModelAttribute SecurityFacilityVO securityFacilityVO) {
			
			 int exists = this.securityPageService.checkIfExists(securityFacilityVO.getSecurityFacName());
			
			int result = this.securityPageService.secCompanyRegistFrom(securityFacilityVO);
			
			log.info("registForm->result : " + result);
			
			return "redirect:/bp/secFacility/list";
		}
		
	
		/**
		 * @author 김인교
		 * 보안페이지 업체 등록 폼
		 */
		
		@PostMapping("/secFacility/facilityRegistFrom")
		public String facilityRegistFrom(Model model, @ModelAttribute SecurityCompanyVO securityCompanyVO, Principal principal, HttpSession loginSession) {
		    
		    String memId = (String) loginSession.getAttribute("userId");
		    securityCompanyVO.setMemId(memId); // VO에 MEM_ID 설정

		    // 서비스 호출하여 등록 처리
		    int result = this.securityPageService.registFrom(securityCompanyVO);
		    
		    return "redirect:/bp/secFacility/list"; // 등록 후 목록 페이지로 리다이렉트
		}
		
		
		//시설명 중복검사
		@GetMapping("/secFacility/checkFacilityName")
		@ResponseBody
		public boolean checkFacilityName(@RequestParam String facilityName) {
		    return this.securityPageService.checkFacilityNameDuplicate(facilityName);
		}
		
		
		
		/*---------------------------------------------------------------업체,시설 상세보기-----------------------------------------------------*/	
		/**
		 * @author 김인교
		 * 보안페이지 업체 상세 보기
		 */
		@GetMapping("/secFacility/detail")
		public String detail(@RequestParam("facId") String facId, Model model) {
			
			SecurityCompanyVO securityCompanyVO = this.securityPageService.detail(facId); 
		    
		    model.addAttribute("securityCompanyVO", securityCompanyVO);
		    
		    return "bp/secFacility/detail";
		}
		
		
		/**
		 * @author 김인교
		 * 보안페이지 시설 상세 보기
		 */
		@GetMapping("/secCompany/detail")
		public String secCompanyDetail(@RequestParam("securityFacCd") String securityFacCd, Model model	) {
			
			SecurityFacilityVO securityFacilityVO = this.securityPageService.secCompanyDetail(securityFacCd);
			
			model.addAttribute("SecurityFacilityVO", securityFacilityVO);					
			
			return"bp/secCompany/detail";
		}
		
		/*---------------------------------------------------------------업체,시설 수정 -----------------------------------------------------*/	
		
		/**
		 * @author 김인교
		 * 보안페이지 업체 수정
		 */
		
		// 업체 수정 페이지
		@GetMapping("/secFacility/edit")
		public String edit(Model model, @RequestParam("facId") String facId) {
		    SecurityCompanyVO securityCompanyVO = this.securityPageService.detail(facId);
		    model.addAttribute("securityCompanyVO", securityCompanyVO);
		    return "bp/secFacility/edit";
		}

		// 업체 수정 처리
		@PostMapping("/secFacility/editFrom")
		public String editPost(@ModelAttribute SecurityCompanyVO securityCompanyVO) {
		    // 비밀번호는 수정하지 않음 (입력란이 삭제됨)
		    int result = this.securityPageService.editPost(securityCompanyVO);
		    return "redirect:/bp/secFacility/detail?facId=" + securityCompanyVO.getFacId();
		}
	
		/*---------------------------------------------------------------업체,시설 삭제-----------------------------------------------------*/	
		//업체 삭제
		
		
		@PostMapping("/secFacility/delete")
		public String delete(@RequestParam("facId") String facId) {
		    log.info("deletePost->facId : " + facId);
		    
		    int result = this.securityPageService.delete(facId);
		    
		    log.info("editPost -> result : " + result);
		    
		    return "redirect:/bp/secFacility/list";
		}
		
		
		// 업체 비밀번호 확인
		@PostMapping("/secFacility/checkPassword")
		@ResponseBody
		public Map<String, Object> checkPassword(@RequestParam("password") String password, Principal principal) {
		    Map<String, Object> response = new HashMap<>();
		    
		    // 사용자의 비밀번호를 검증하는 로직을 추가합니다.
		    String empName = principal.getName(); // 로그인한 사용자의 회사이름를 가져옵니다.
		    SecurityCompanyVO securityCompanyVO = securityPageService.findByEmpName(empName); // empname로 보안 회사를 조회합니다.
		    
		    // 예: 입력한 비밀번호와 데이터베이스의 비밀번호를 비교합니다.
		    boolean isValid = password.equals(securityCompanyVO.getEmpPass()); // 비밀번호 비교
		    
		    response.put("valid", isValid);
		    return response;
		}
		
		
/*---------------------------------------------------------------업체,시설 등록 끝-----------------------------------------------------*/		
		
		
		
/*---------------------------------------------------------------작업자  시작-----------------------------------------------------*/	
		
		
		//작업자 리스트
		@GetMapping("/secWorker/list")
		public String secWorkerList (Model model, SecurityWorkerVO securityWorkerVO,
				@RequestParam(value="searchFilter", required=false, defaultValue="ALL") String searchFilter,
	    		@RequestParam(value="table_search", required=false, defaultValue="") String table_search,
	    		@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
			
			
			//페이징을 하기위해 필요한 변수들
			Map<String, Object> maintenanceMap = new HashMap<String, Object>();
	    	
	    	maintenanceMap.put("searchFilter", searchFilter);
	    	maintenanceMap.put("table_search", table_search);
	    	maintenanceMap.put("currentPage", currentPage);
	    	maintenanceMap.put("table", "secWorker");
	    	//맵으로 select 안할꺼라 vo에 값을넣음
	    	securityWorkerVO.setCurrentPage(currentPage);

			
			List<SecurityWorkerVO> securiyWorkerVOList = this.securityPageService.secWorkerList(securityWorkerVO);
				int total = this.securityPageService.getTotal(maintenanceMap);
			
			//실제 페이지네이션을하기위한 코드
			MainTenPagination<SecurityWorkerVO> secWorkerPage = new MainTenPagination<SecurityWorkerVO>(total, currentPage, 10, securiyWorkerVOList, maintenanceMap);

			model.addAttribute("securiyWorkerVOList",securiyWorkerVOList);
			model.addAttribute("secWorkerPage",secWorkerPage);
			
			return "bp/secWorker/list";
		}
		
		
		//작업자 등록
		@GetMapping("/secWorker/regist")
		public String secWorkerRegist(Model model) {
			
			 List<SecurityCompanyVO> securityCompanyVOList = this.securityPageService.companyList(new SecurityCompanyVO());
			    
			    model.addAttribute("securityCompanyVOList", securityCompanyVOList);

			return "bp/secWorker/regist";
		}
				
		
		
			/**
			 * @author 김인교
			 * 보안페이지 근무자 등록 폼
			 */
		
		@PostMapping("/secWorker/secWorkerRegistFrom")
			public String secWorkerRegistFrom(@ModelAttribute SecurityWorkerVO securityWorkerVO) {
			
			int result = this.securityPageService.secWorkerRegistFrom(securityWorkerVO);
			
			log.info("secWorkerRegistFrom -> result : " + result);
			
			return "redirect:/bp/secWorker/list";
		}
		
		/**
		 * @author 김인교
		 * 보안페이지 근무자 상세보기
		 */
			@GetMapping("/secWorker/detail")
			public String secWorkerDetail(@RequestParam("memSeq") String memSeq, Model model) {
			
			SecurityWorkerVO securityWorkerVO = this.securityPageService.secWorkerDetail(memSeq);
			
			long fileGroupNo = securityWorkerVO.getFileGroupNo();
			
			List<FileDetailVO> fileDetailVOList = this.securityPageService.fileList(fileGroupNo);
			log.info("detail -> fileDetailVOList : " + fileDetailVOList);
			
			model.addAttribute("securityWorkerVO",securityWorkerVO);
			model.addAttribute("fileDetailVOList", fileDetailVOList);
			
			return"bp/secWorker/detail";
		}
		
			/**
			 * @author 김인교
			 * 보안페이지 근무자 수정
			 */
			
			
			@GetMapping("/secWorker/edit")
			public String secWorkerEdit(Model model,@ModelAttribute SecurityWorkerVO securityWorkerVO,
					@ModelAttribute FileDetailVO fileDetailVO ) {
				
				//작업자 상세 조회
				securityWorkerVO = this.securityPageService.secWorkerDetail(securityWorkerVO.getMemSeq());
				
				
				long fileGroupNo = securityWorkerVO.getFileGroupNo();
				List<FileDetailVO> fileDetailVOList = this.securityPageService.fileList(fileGroupNo);
				
				//파일 리스트 조회
				log.info("secWorkerEdit -> fileDetailVOList : " + fileDetailVOList);
				
				model.addAttribute("securityWorkerVO",securityWorkerVO);
				model.addAttribute("fileDetailVOList", fileDetailVOList);
				
				return "bp/secWorker/edit";
			}
			
			/**
			 * @author 김인교
			 * 보안페이지 근무자 수정 폼
			 */
			@PostMapping("/secWorker/editFrom")
			public String secWorkeEditFrom(@ModelAttribute  SecurityWorkerVO securityWorkerVO) {
				
				log.info("editfrom -> secWorVO : " +  securityWorkerVO);
				
				int result = this.securityPageService.secWorkeEditFrom(securityWorkerVO);
				
				log.info("editfrom -> result : " + result);
				
				return "redirect:/bp/secWorker/detail?memSeq=" + securityWorkerVO.getMemSeq();
			}
			
			/**
			 * @author 김인교
			 * 보안페이지 근무자 삭제
			 */
			
			@PostMapping("/secWorker/delete")
			public String secWorkerDelete(@RequestParam("memSeq")String memSeq) {
				
				log.info("secWorkerDelete->memSeq : " + memSeq);
				
				int result = this.securityPageService.secWorkerDelete(memSeq);
				
				return "redirect:/bp/secWorker/list";
				
			}
			
			
			
		
/*---------------------------------------------------------------작업자 끝-----------------------------------------------------*/	
			
			
/*---------------------------------------------------------------점검표 시작-----------------------------------------------------*/	
	//점검표 리스트 
			
	@GetMapping("/secCheckList/list")
	public String secCheckList (Model model, SecurityChecklistVO securityChecklistVO,
			@RequestParam(value="searchFilter", required=false, defaultValue="ALL") String searchFilter,
    		@RequestParam(value="table_search", required=false, defaultValue="") String table_search,
    		@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Map<String, Object> maintenanceMap = new HashMap<String, Object>();
    	
    	maintenanceMap.put("searchFilter", searchFilter);
    	maintenanceMap.put("table_search", table_search);
    	maintenanceMap.put("currentPage", currentPage);
    	maintenanceMap.put("table", "secCheckList");
    	//맵으로 select 안할꺼라 vo에 값을넣음
    	securityChecklistVO.setCurrentPage(currentPage);

    	
    	
    	int total = this.securityPageService.getTotal(maintenanceMap);
		
    	List<SecurityChecklistVO> secCheckListVOList = this.securityPageService.secCheckList(securityChecklistVO);
		//실제 페이지네이션을하기위한 코드
		MainTenPagination<SecurityChecklistVO> secCheckListPage = new MainTenPagination<SecurityChecklistVO>(total, currentPage, 10, secCheckListVOList, maintenanceMap);

		
		
		model.addAttribute("secCheckListVOList",secCheckListVOList);
		model.addAttribute("secCheckListPage",secCheckListPage);
		
		return "bp/secCheckList/list";
	}		
	
	//점검표 등록
	
	@GetMapping("/secCheckList/regist")
	public String secCheckListRegist(Model model) {
		//회사명 가져오기
		 List<SecurityCompanyVO> securityCompanyVOList = this.securityPageService.companyList(new SecurityCompanyVO());
		 //시설명가져오기
		 List<SecurityFacilityVO> securityFacilityVOList = this.securityPageService. facilityList(new SecurityFacilityVO());
		 
		 	
		    model.addAttribute("securityCompanyVOList", securityCompanyVOList);
		    model.addAttribute("securityFacilityVOList", securityFacilityVOList);
		    
		return "bp/secCheckList/regist";
	}
	//점검표 등록폼
	
	@PostMapping("/secCheckList/secCheckListRegistFrom")
	public String secCheckListRegistFrom(@ModelAttribute SecurityChecklistVO securityChecklistVO) {
	
	int result = this.securityPageService.secCheckListRegistFrom(securityChecklistVO);
	
	log.info("secCheckListRegistFrom -> result : " + result);
	
	return "redirect:/bp/secCheckList/list";
}	
	
	
	
	
	
	
	
	//점검표 상세
	@GetMapping("/secCheckList/detail")
	public String secCheckListDetail(@RequestParam("checklistSeq") String checklistSeq, Model model) {
	    log.info("Received checklistSeq: " + checklistSeq);
	    
	    SecurityChecklistVO securityChecklistVO = this.securityPageService.secCheckListDetail(checklistSeq);
	    
	    if (securityChecklistVO == null) {
	        log.error("No data found for checklistSeq: " + checklistSeq);
	        model.addAttribute("errorMessage", "No data found for the given checklistSeq: " + checklistSeq);
	        return "bp/secCheckList/error";
	    }
	    
	    log.info("detail -> securityChecklistVO : " + securityChecklistVO);
	    
	    // 여기서 모델에 객체를 추가합니다.
	    model.addAttribute("securityChecklistVO", securityChecklistVO);
	    
	    return "bp/secCheckList/detail";
	}
	
	
	// 점검표 수정
	@GetMapping("/secCheckList/edit")
	public String secCheckListEdit(Model model, @ModelAttribute SecurityChecklistVO securityChecklistVO) {
	    
	    // checklistSeq가 null인지 확인
	    log.info("Received checklistSeq: " + securityChecklistVO.getChecklistSeq());

	    // 점검표 상세 조회
	    securityChecklistVO = this.securityPageService.secCheckListDetail(securityChecklistVO.getChecklistSeq());
	    
	    model.addAttribute("securityChecklistVO", securityChecklistVO);
	    
	    return "bp/secCheckList/edit";
	}
	
		
		
		

	

	@PostMapping("/secCheckList/editFrom")
	public String secCheckListEditFrom(@ModelAttribute SecurityChecklistVO securityChecklistVO) {
	    
	    log.info("editfrom -> securityChecklistVO : " + securityChecklistVO);
	    log.info("Current checklistSeq: " + securityChecklistVO.getChecklistSeq());

	    int result = this.securityPageService.secCheckListEditFrom(securityChecklistVO);
	    
	    log.info("secCheckListEditFrom -> result : " + result);
	    
	    return "redirect:/bp/secCheckList/detail?checklistSeq=" + securityChecklistVO.getChecklistSeq();
	}
	
	@PostMapping("/secCheckList/delete")
	public String secCheckListDelete(@RequestParam("checklistSeq")String checklistSeq) {
		
		log.info("secCheckListdelete->checklistSeq : " + checklistSeq);
		
		int result = this.securityPageService.secCheckListDelete(checklistSeq);
		
		return "redirect:/bp/secCheckList/list";
		
	}

	
			
	/*---------------------------------------------------------------점검표 끝-----------------------------------------------------*/	
	
	
	/*---------------------------------------------------------------점검 도는거?-----------------------------------------------------*/	
	
	@GetMapping("/secCom/securityPatrol")
	public String SecurityPatrol(Model model, 
	                             @RequestParam(required = false) String securityFacCd,
	                             SecurityCheckResultsVO securityCheckResultsVO,
	                             SecurityWorkerVO securityWorkerVO
	                             ) {

	    // facCd를 securityCheckResultsVO에 설정
	    if (securityFacCd != null && !securityFacCd.isEmpty()) {
	        securityCheckResultsVO.setFacCd(securityFacCd);
	    }

	    // 점검 항목 가져오기
	    SecurityFacilityVO securityFacilityVO = this.securityPageService.getInspectionItems(securityFacCd);
	    
	    // facCd에 해당하는 점검 결과 가져오기
	    List<SecurityCheckResultsVO> securityCheckResultsVOList = this.securityPageService.SecurityPatrol(securityCheckResultsVO);
	    
	    // 작업자명 가져오기
	    List<SecurityWorkerVO> securiyworkerVOList = this.securityPageService.secworker(securityWorkerVO);
	    
	    // 점검표 내역
	    List<SecurityChecklistVO> secCheckListVOList = this.securityPageService.secCheckList(new SecurityChecklistVO());
	    


	    model.addAttribute("securiyWorkerVOList", securiyworkerVOList);
	    model.addAttribute("securityCheckResultsVOList", securityCheckResultsVOList);
	    model.addAttribute("secCheckListVOList", secCheckListVOList);
	    model.addAttribute("securityFacilityVO", securityFacilityVO); // 점검 항목 추가

	    return "bp/secCom/securityPatrol";
	}
	
	
	

	
	
	
	@GetMapping("/secCom/securityPatrolFrom")
	public String SecurityPatrolFrom(@ModelAttribute SecurityCheckResultsVO securityCheckResultsVO) {
		
	    int result = this.securityPageService.SecurityPatrolFrom(securityCheckResultsVO);
	    
	    log.info("SecurityPatrolFrom -> result : " + result);
	    
	    return "redirect:/bp/secFacility/list";
	}
	
	@PostMapping("/secCom/delete")
	public String SecurityPatrolDelete(@RequestParam("securityFacCd") String securityFacCd) {
	    log.info("secWorkerDelete->facCd : " + securityFacCd); // 확인
	    int result = this.securityPageService.SecurityPatrolDelete(securityFacCd);
	    log.info("Delete result: " + result); // 삭제 결과 확인
	    return "redirect:/bp/secFacility/list";
	}
	
	}
