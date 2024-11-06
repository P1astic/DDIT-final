package kr.or.ddit.finance.controller;

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

import kr.or.ddit.finance.service.FinanceService;
import kr.or.ddit.finance.util.FinancePagination;
import kr.or.ddit.finance.util.VendorListPagination;
import kr.or.ddit.finance.vo.AccountItemVO;
import kr.or.ddit.finance.vo.BudgetItemVO;
import kr.or.ddit.finance.vo.TransHistoryVO;
import kr.or.ddit.human.service.DeptService;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.inven.vo.VendorVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 홍정호
 * 
 * 24.9.23. 최초 작성
 * 
 * 재무페이지 전용 컨트롤러
 *
 */
@RequestMapping("/emp/inventory")

@Slf4j
@Controller
public class FinanceController {
	
	@Inject
	FinanceService financeService;
	
	@Inject
	DeptService deptService;

	/**
	 * @author 홍정호
	 * 
	 * 24.9.23. 최초 생성
	 * 
	 * 계정리스트 페이지로 이동하면서 예산항목과 계정과목 항목 리스트를 뽑기 위한 메소드
	 * 
	 * @return
	 */
	@GetMapping("/accountList")
	public String accountList(Model model,
			@RequestParam(value="bdgItemYr", required=false, defaultValue="") String bdgItemYr,
			@RequestParam(value="searchBoxKeyword", required=false, defaultValue="") String searchBoxKeyword)
			{
		
		Map<String, Object> budgetMap = new HashMap<String, Object>();
		budgetMap.put("bdgItemYr", bdgItemYr); 
		budgetMap.put("searchBoxKeyword", searchBoxKeyword);
//		log.info("budgetMap : " + budgetMap);
		
		List<BudgetItemVO> bdgItemVOList = this.financeService.bdgItemVOList(budgetMap);
//		log.info("accountList -> bdgItemVOList" + bdgItemVOList);
		
		List<AccountItemVO> accItemVOList = this.financeService.accItemVOList();
//		log.info("accountList -> accItemVOList" + accItemVOList);
		
		model.addAttribute("bdgItemVOList", bdgItemVOList);
		model.addAttribute("accItemVOList", accItemVOList);
		
		return "emp/finance/accountList";
	}
	
	@ResponseBody
	@PostMapping("/registBudgetItemCheck")
	public int registBudgetItemCheck(@RequestBody BudgetItemVO budgetItemVO) {
		
		int result = this.financeService.registBudgetItemCheck(budgetItemVO);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/registAccountItemCheck")
	public int registAccountItemCheck(@RequestBody AccountItemVO accountItemVO) {
		
		int result = this.financeService.registAccountItemCheck(accountItemVO);
		
		return result;
	}

	
	@ResponseBody
	@PostMapping("/registBudgetItem")
	public Map<String, String> registBudgetItem(Model model, @RequestBody BudgetItemVO budgetItemVO){
		
		log.info("registBudgetItem : " + budgetItemVO);
		
		int registAccountItemResult = this.financeService.registBudgetItem(budgetItemVO);
		
		Map<String, String> response = new HashMap<>();
		
		if(registAccountItemResult > 0) {
	        response.put("result", "success");
	        response.put("message", "예산항목이 성공적으로 등록되었습니다.");
		}else {
	        response.put("result", "error");
	        response.put("message", "예산항목 등록에 실패하였습니다.");			
		}
		return response;
	}	
	
	
	@ResponseBody
	@PostMapping("/registAccountItem")
	public Map<String, String> registAccountItem(Model model, @RequestBody AccountItemVO accountItemVO){
		
		log.info("registAccountItem : " + accountItemVO);
		
		int registAccountItemResult = this.financeService.registAccountItem(accountItemVO);
		
		Map<String, String> response = new HashMap<>();
		
		if(registAccountItemResult > 0) {
	        response.put("result", "success");
	        response.put("message", "계정과목이 성공적으로 등록되었습니다.");
		}else {
	        response.put("result", "error");
	        response.put("message", "계정과목 등록에 실패하였습니다.");
		}
		return response;
	}
	
	// 예산항목 수정 코드
	@ResponseBody
	@PostMapping("/editBudgetItem")
	public Map<String, String> editBudgetItem(Model model, @RequestBody BudgetItemVO budgetItemVO){
		
		log.info("editBudgetItem : " + budgetItemVO);
		
		int editBudgetItemResult = this.financeService.editBudgetItem(budgetItemVO);
		
		Map<String, String> response = new HashMap<>();
		
		if(editBudgetItemResult > 0) {
			response.put("result", "success");
			response.put("message", "예산항목이 성공적으로 수정되었습니다.");
		}else {
			response.put("result", "error");
			response.put("message", "예산항목이 수정에 실패하였습니다.");			
		}
		return response;
	}
	// 예산항목 수정 코드 끝
	
	// 계정과목 수정 코드
	@ResponseBody
	@PostMapping("/editAccountItem")
	public Map<String, String> editAccountItem(Model model, @RequestBody AccountItemVO accountItemVO){
		
		log.info("editAccountItem :" + accountItemVO);
		
		int editAccountItemResult = this.financeService.editAccountItem(accountItemVO);
		
		Map<String, String> response = new HashMap<>();
		
		if(editAccountItemResult > 0) {
			response.put("result", "success");
			response.put("message", "계정과목이 성공적으로 수정되었습니다.");			
		}else {
			response.put("result", "error");
			response.put("message", "계정과목이 수정에 실패하였습니다.");					
		}
		return response;
	}
	
	
	
	@ResponseBody
	@PostMapping("/deleteBudgetItem")
	public Map<String, String> deleteBdgItem(Model model, @RequestBody Map<String, Object> requestbody){
		
		List<Map<String,String>> list = (List<Map<String, String>>) requestbody.get("budgetItemVOList");
		
		List<BudgetItemVO> budgetItemVOList = new ArrayList<>();
		for(Map<String, String> listMap : list) {
			BudgetItemVO budgetItemVO = new BudgetItemVO();
			budgetItemVO.setBdgItemCd(listMap.get("bdgItemCd"));
			budgetItemVOList.add(budgetItemVO);
		}
		
		log.info("budgetItemVOList : " + budgetItemVOList);
		
		
		int deleteResult = this.financeService.deleteBudgetItem(budgetItemVOList); 

		Map<String, String> response = new HashMap<>();
		
		if(deleteResult > 0) {
	        response.put("result", "success");
	        response.put("message", "예산항목이 성공적으로 삭제되었습니다.");				
		}else {
	        response.put("result", "success");
	        response.put("message", "예산항목 삭제에 실패하였습니다.");					
		}
		
		return response;
	}
	
	@ResponseBody
	@PostMapping("/deleteAccountItem")
	public Map<String, String> deleteAccountItem(Model model, @RequestBody Map<String, Object> requestbody){
		
		List<Map<String,String>> list = (List<Map<String, String>>) requestbody.get("accountItemVOList");
		
		List<AccountItemVO> accountItemVOList = new ArrayList<>();
		for(Map<String, String> listMap : list) {
			AccountItemVO accountItemVO = new AccountItemVO();
			accountItemVO.setAccItemCd(listMap.get("accItemCd"));
			accountItemVOList.add(accountItemVO);
		}
		
		log.info("accountItemVOList : " + accountItemVOList);
		
		int deleteResult = this.financeService.deleteAccountItem(accountItemVOList);
		
		Map<String, String> response = new HashMap<>();
		
		if(deleteResult > 0) {
	        response.put("result", "success");
	        response.put("message", "계좌과목이 성공적으로 삭제되었습니다.");				
		}else {
	        response.put("result", "error");
	        response.put("message",  "계좌과목 삭제에 실패하였습니다.");					
		}
		
		return response;		
	}
	
	@GetMapping("/transList")
	public String transList(Model model,
		@RequestParam(value="date-start", required=false, defaultValue="2024-01-01") String startDate,
		@RequestParam(value="date-end", required=false, defaultValue="2024-12-31") String endDate,
		@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage)
	{
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("startDate", startDate);
		searchMap.put("endDate", endDate);
		searchMap.put("currentPage", currentPage);
		int test = 1;
		searchMap.put("test", test);
		
		//거래내역 불러오기
		List<TransHistoryVO> transHistoryVOList = this.financeService.transHistoryVOList(searchMap);
		log.info("transHistoryVOList : " + transHistoryVOList);
		
		//거래처 불러오기
		List<VendorVO> vendorVOList = this.financeService.vendorVOList();
		
		
		int total = this.financeService.getTransTotal(searchMap);
		
		FinancePagination<TransHistoryVO> financePage = new FinancePagination<TransHistoryVO>(total, currentPage, 10, transHistoryVOList, searchMap);
		
		model.addAttribute("transHistoryVOList", transHistoryVOList);
		model.addAttribute("financePage", financePage);
	    model.addAttribute("startDate", startDate);
	    model.addAttribute("endDate", endDate);
	    model.addAttribute("vendorVOList", vendorVOList);
	    
		return "emp/finance/transList";
	}
	
	@ResponseBody
	@PostMapping("/registTransHistory")
	public Map<String, String> registTransHistory(@RequestBody TransHistoryVO transHistoryVO){
		
		int registResult = this.financeService.registTransHistory(transHistoryVO); 
		
		Map<String, String> response = new HashMap<>();
		
		if(registResult > 0) {
	        response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		
		return response;
	}
	
	@ResponseBody
	@PostMapping("/editTransHistory")
	public Map<String, String> editTransHistory(@RequestBody TransHistoryVO transHistoryVO){
		
		log.info("edit : " + transHistoryVO);
		int editResult = this.financeService.editTransHistory(transHistoryVO); 
		
		
		Map<String, String> response = new HashMap<>();
		
		if(editResult > 0) {
	        response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		
		return response;
	}
	
	@ResponseBody
	@PostMapping("/deleteTransHistory")
	public Map<String, String> deleteTransHistory(@RequestBody Map<String, Object> requestbody){
		
		List<Map<String,String>> list = (List<Map<String, String>>) requestbody.get("transHistoryVOList");
		
		List<TransHistoryVO> transHistoryVOList = new ArrayList<>();
		for(Map<String, String> listMap : list) {
			TransHistoryVO transHistoryVO = new TransHistoryVO();
			transHistoryVO.setTransHistoryNo(listMap.get("transHistoryNo"));
			transHistoryVOList.add(transHistoryVO);
		}
		
		log.info("transHistoryVOList : " + transHistoryVOList);
		
		int deleteResult = this.financeService.deleteTransHistory(transHistoryVOList);
		Map<String, String> response = new HashMap<>();
		
		if(deleteResult > 0) {
	        response.put("result", "success");
		}else {
	        response.put("result", "error");
		}
		
		return response;			
	}
	
	@GetMapping("/vendorList")
	public String vendorList(Model model,
    		@RequestParam(value="searchFilter", required=false, defaultValue="ALL") String searchFilter,
    		@RequestParam(value="table_search", required=false, defaultValue="") String table_search,
    		@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage			
			) {
		
		Map<String, Object> vendorMap = new HashMap<String, Object>();
		vendorMap.put("searchFilter", searchFilter);
		vendorMap.put("table_search", table_search);
		vendorMap.put("currentPage", currentPage);
		
		List<VendorVO> vendorVOList = this.financeService.vendorVOListMap(vendorMap);
		log.info("vendorVOList : " + vendorVOList);
		
		int vendorTotal = this.financeService.vendorTotal(vendorMap);
		
		VendorListPagination<VendorVO> vendorPage = new VendorListPagination<VendorVO>(vendorTotal, currentPage, 15, vendorVOList, vendorMap);
		
		model.addAttribute("vendorVOList", vendorVOList);
		model.addAttribute("vendorPage", vendorPage);
		
		
		return "emp/finance/vendorList";
	}
	
	@ResponseBody
	@PostMapping("/registVendor")
	public Map<String, String> registVendor(@RequestBody VendorVO vendorVO){
		
		int registResult = this.financeService.registVendor(vendorVO);
		
		Map<String, String> response = new HashMap<>();
		
		if(registResult > 0) {
			response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		return response;
	}
	
	@ResponseBody
	@PostMapping("/editVendor")
	public Map<String, String> editVendor(@RequestBody VendorVO vendorVO){
		
		int editResult = this.financeService.editVendor(vendorVO);
		
		Map<String, String> response = new HashMap<>();
		
		if(editResult > 0) {
			response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		return response;
	}
	
	@ResponseBody
	@PostMapping("/deleteVendor")
	public Map<String, String> deleteVendor(@RequestBody Map<String, Object> requestbody){
		
		List<Map<String, String>> list = (List<Map<String, String>>) requestbody.get("vendorVOList");
		
		List<VendorVO> vendorVOList = new ArrayList<>();
		for(Map<String, String> listMap : list) {
			VendorVO vendorVO = new VendorVO();
			vendorVO.setVendorCd(listMap.get("vendorCd"));
			vendorVOList.add(vendorVO);
		}
		
		log.info("vendorVOList : " + vendorVOList);
		
		int deleteResult = this.financeService.deleteVendor(vendorVOList);
		
		Map<String, String> response = new HashMap<>();
		
		if(deleteResult > 0) {
	        response.put("result", "success");
		}else {
	        response.put("result", "error");
		}
		
		return response;	
		
		
	}
}
