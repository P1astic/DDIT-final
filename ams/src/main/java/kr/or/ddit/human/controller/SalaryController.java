package kr.or.ddit.human.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itextpdf.text.DocumentException;

import kr.or.ddit.human.service.DeptService;
import kr.or.ddit.human.service.EmployeeService;
import kr.or.ddit.human.service.SalaryService;
import kr.or.ddit.human.util.PaystubPagination;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.SalaryVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/emp/salary")
@Slf4j

@Controller
public class SalaryController {

	@Inject
	SalaryService salaryService;
	@Inject
	DeptService deptService;
	@Inject
	EmployeeService employeeService;
	
	@GetMapping("/paystubList")
	public String payStubList(Model model,
			@RequestParam(value="startDate", required=false, defaultValue="2024-01-01") String startDate,
			@RequestParam(value="endDate", required=false, defaultValue="2024-12-31") String endDate,
			@RequestParam(value="search_filter", required=false, defaultValue="ALL") String search_filter,
			@RequestParam(value="table_search", required=false, defaultValue="") String table_search,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			) {
		
		Map<String, Object> paystubMap = new HashMap<String, Object>();
		paystubMap.put("startDate", startDate);
		paystubMap.put("endDate", endDate);
		paystubMap.put("searchFilter", search_filter);
		paystubMap.put("tableSearch", table_search);
		paystubMap.put("currentPage", currentPage);

		log.info("paysutbMap : " + paystubMap);
		
		
		List<SalaryVO> salaryVOList = this.salaryService.paystubList(paystubMap);
		int salaryTotal = this.salaryService.getpaystubTotal(paystubMap);
		
		PaystubPagination<SalaryVO> paystubPage = new PaystubPagination<SalaryVO>(salaryTotal, currentPage, 15, salaryVOList, paystubMap);
		
		model.addAttribute("salaryVOList", salaryVOList);
		model.addAttribute("paystubPage", paystubPage);
		
		log.info("salaryVOList" + salaryVOList);
		
		return "emp/salary/paystubList";
	}
	
	/**
	 * @author 홍정호
	 * 24.9.28. 급여명세서 생성페이지로 이동 메소드
	 */
	@GetMapping("/paystubRegist")
	public String paystubRegist(Model model) {
		
		List<DeptVO> deptVOList = this.deptService.deptList();
		model.addAttribute("deptVOList", deptVOList);
		
		return "emp/salary/paystubRegist";
	}
	
	@GetMapping("/calcRetirement")
	public String calcRetirement(Model model) {
		
		return "emp/salary/calcRetirement";
	}
	
	/**
	 * @author 홍정호
	 * 24.9.29. 급여명세서 생성 메소드
	 * @throws IOException 
	 * @throws DocumentException 
	 */
	@ResponseBody
	@PostMapping("/registpaystub")
	public Map<String, String> registpaystub(
			@RequestBody Map<String, Object> request) throws IOException, DocumentException{
		
		int registResult = this.salaryService.registpaystub(request);
		
		Map<String, String> response = new HashMap<>();
		
		if(registResult > 0) {
			response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		
		return response;
	}
	
	@ResponseBody
	@PostMapping("/selectDept")
	public List<EmployeeVO> selectDept(@RequestBody DeptVO deptVO) {
		
		List<EmployeeVO> empList = this.salaryService.empList(deptVO);
		
		log.info("empList : " + empList);
		
		return empList;
	}
	
	@ResponseBody
	@PostMapping("/paystubImage")
	public Map<String, String> paystubImage(@RequestBody SalaryVO salaryVO,
			Model model){
		
		Map<String, String> response = this.salaryService.paystubImage(salaryVO);
		
        return response; 
	}
	
	@GetMapping(value="/download")
	public void downloadFile(@RequestParam String filePath, @RequestParam String fileOrgnlFileNm, HttpServletResponse response) throws IOException {
		
	    try {
	        File file = new File(filePath);
	        if (file.exists()) {
	            response.setContentType("application/octet-stream");
	            
	            // 파일 이름을 URLEncoder로 인코딩
	            String encodedFileName = URLEncoder.encode(fileOrgnlFileNm, "UTF-8");
	            response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");
	            
	            FileInputStream in = new FileInputStream(file);
	            OutputStream out = response.getOutputStream();

	            byte[] buffer = new byte[4096];
	            int bytesRead;
	            while ((bytesRead = in.read(buffer)) != -1) {
	                out.write(buffer, 0, bytesRead);
	            }
	            in.close();
	            out.flush();
	        } else {
	            response.sendError(HttpServletResponse.SC_NOT_FOUND);
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	    }
	    
	}
	
}
