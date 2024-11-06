package kr.or.ddit.facility.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.facility.service.MaintenanceService;
import kr.or.ddit.facility.util.MainTenPagination;
import kr.or.ddit.facility.vo.MainTenanceVO;
import lombok.extern.slf4j.Slf4j;


/**
 * @author 김인교
 * 공항직원 유지보수 신청
 *
 */

@RequestMapping("/emp/maintenance")
@Slf4j
@Controller
public class MaintenanceController {
	
	@Inject
	 MaintenanceService maintenanceService;
	
	
	/**
	 * 유지보수 리스트 요청URI : /emp/maintenance/list 
	 * 요청방식 : Get
	 */
	
    // 유지보수 목록
    @GetMapping("/list")
    public String list(Model model, MainTenanceVO maintenanceVO,
    		@RequestParam(value="searchFilter", required=false, defaultValue="ALL") String searchFilter,
    		@RequestParam(value="table_search", required=false, defaultValue="") String table_search,
    		@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
    		) { 
//    	log.info("list 진입");
    	
    	Map<String, Object> maintenanceMap = new HashMap<String, Object>();
    	
    	maintenanceMap.put("searchFilter", searchFilter);
    	maintenanceMap.put("table_search", table_search);
    	maintenanceMap.put("currentPage", currentPage);
    	
    	maintenanceMap.put("table", "maintenance");
    	//맵으로 select 안할꺼라 vo에 값을넣음
    	maintenanceVO.setCurrentPage(currentPage);
    	
    	int total = this.maintenanceService.getTotal(maintenanceMap);
    	
        List<MainTenanceVO> mainTenanceVOList = this.maintenanceService.list(maintenanceMap);
        
        
        MainTenPagination<MainTenanceVO> maintenancePage = new MainTenPagination<MainTenanceVO>(total, currentPage, 10, mainTenanceVOList, maintenanceMap);
        
        
        model.addAttribute("mainTenanceVOList", mainTenanceVOList);
        model.addAttribute("maintenancePage", maintenancePage);
        
        
        return "emp/maintenance/list";
    }
    
    
	/**
	 * 유지보수 등록 실행 요청URI : /emp/maintenance/regist
	 * 요청방식 : Get
	 */
    
    
    // 유지보수 등록 페이지
    @GetMapping("/regist")
    public String regist(Model model) {
        return "emp/maintenance/regist";
    }

    
    /**
	 * 유지보수 등록  처리 폼 요청URI : /emp/maintenance/registForm 
	 * 요청방식 : Get
	 */
    
    // 유지보수 등록 처리 
    @GetMapping("/registForm")
    public String registFormMaintenance(Model model, @ModelAttribute MainTenanceVO mainTenanceVO) {
        int result = this.maintenanceService.registForm(mainTenanceVO);
        log.info("registForm->result : " + result);
        return "redirect:/emp/maintenance/list";
    }

    
    /**
	 * 유지보수 상세 페이지 요청URI : /emp/maintenance/detail
	 * 요청방식 : Get
	 */
    
    
    // 유지보수 상세 페이지
    @GetMapping("/detail")
    public String detail(@RequestParam("mntncCode") String mntncCode, Model model) {
        MainTenanceVO mainTenanceVO = this.maintenanceService.detail(mntncCode);
        model.addAttribute("mainTenanceVO", mainTenanceVO);
        log.info("detail -> mainTenanceVO : " + mainTenanceVO);
        return "emp/maintenance/detail";
    }
    
    
    /**
	 * 유지보수 수정페이지 요청URI : /emp/maintenance/edit
	 * 요청방식 : Get
	 */
    
    
    // 유지보수 수정 페이지 이동
    @GetMapping("/edit")
    public String edit(Model model, @RequestParam("mntncCode") String mntncCode) {
        log.info("edit -> mntncCode : " + mntncCode);

        // 유지보수 코드를 기반으로 상세 정보를 조회
        MainTenanceVO mainTenanceVO = this.maintenanceService.detail(mntncCode);
        model.addAttribute("mainTenanceVO", mainTenanceVO);

        log.info("mainTenanceVO -> " + mainTenanceVO);

        return "emp/maintenance/edit";
    }
    
    
    /**
	 * 유지보수 수정페이지 폼 요청URI : /emp/maintenance/EditPost
	 * 요청방식 : POST
	 * 
	 */
    
    
    
    
    @PostMapping("/editPost")
    public String mainTenanceEditPost(@ModelAttribute MainTenanceVO mainTenanceVO) {
        int result = this.maintenanceService.mainTenanceEditPost(mainTenanceVO);
        log.info("editPost -> result : " + result);
        
        return "redirect:/emp/maintenance/detail?mntncCode=" + mainTenanceVO.getMntncCode();
    }

	
	  // 유지보수 삭제 처리
	 
    
	 
    @PostMapping("/delete")
    @ResponseBody  // 추가: AJAX 요청에 대한 응답을 위해 @ResponseBody 어노테이션 사용
    public String delete(@RequestParam("mntncCode") String mntncCode) {
        log.info("deletePost->mntncCode : " + mntncCode);
        
        int result = this.maintenanceService.delete(mntncCode);
        
        log.info("editPost -> result : " + result);
        log.info("editPost -> result : " + mntncCode);
        
        log.info("deletePost->mntncCode : " + mntncCode);
        
        // 삭제 결과를 클라이언트로 반환
        if (result > 0) {
            return "success";  // 삭제 성공 시 "success" 반환
        } else {
            return "fail";  // 삭제 실패 시 "fail" 반환
        }
    }

}