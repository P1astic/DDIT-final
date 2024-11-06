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
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itextpdf.text.DocumentException;

import kr.or.ddit.human.service.BpPassService;
import kr.or.ddit.human.util.BpPassPagination;
import kr.or.ddit.human.vo.PassRegistVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BpPassController {
	
	@Inject
	BpPassService bpPassService;
	
	@GetMapping("/bp/bpPass/requestList")
	public String requsetList(Model model,
			@RequestParam(value="searchFilter", required=false, defaultValue="ALL") String searchFilter,
			@RequestParam(value="tableSearch", required=false, defaultValue="") String tableSearch,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			HttpSession loginSession
			) {
		
		Map<String, Object> requestMap = new HashMap<String, Object>();
		requestMap.put("searchFilter", searchFilter);
		requestMap.put("tableSearch", tableSearch);
		requestMap.put("currentPage", currentPage);
		requestMap.put("memId", loginSession.getAttribute("userId"));
		
		//리스트 불러오는 로직
		List<PassRegistVO> passRegistVOList = this.bpPassService.requestList(requestMap);
		
		//getTotal로직
		int total = this.bpPassService.getRequestTotal(requestMap);
		
		//페이지네이션 로직
		BpPassPagination<PassRegistVO> pagination = new BpPassPagination<PassRegistVO>(total, currentPage, 15, passRegistVOList, requestMap);
		
		//model 추가 로직
		model.addAttribute("passRegistVOList", passRegistVOList);
		model.addAttribute("pagination", pagination);
		
		log.info("passRegistVOList :" + passRegistVOList);
		
		return "bp/bpPass/requestList";
	}
	@GetMapping("/emp/bpPass/requestManage")
	public String requestManage(Model model,
			@RequestParam(value="searchFilter", required=false, defaultValue="ALL") String searchFilter,
			@RequestParam(value="tableSearch", required=false, defaultValue="") String tableSearch,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			) {
		
		Map<String, Object> requestMap = new HashMap<String, Object>();
		requestMap.put("searchFilter", searchFilter);
		requestMap.put("tableSearch", tableSearch);
		requestMap.put("currentPage", currentPage);
		
		List<PassRegistVO> passRegistVOList = this.bpPassService.requestList(requestMap);
		
		int total = this.bpPassService.getRequestTotal(requestMap);
		
		BpPassPagination<PassRegistVO> pagination = new BpPassPagination<PassRegistVO>(total, currentPage, 15, passRegistVOList, requestMap);
		
		model.addAttribute("passRegistVOList", passRegistVOList);
		model.addAttribute("pagination", pagination);
		
		log.info("passRegistVOList : " + passRegistVOList);
		
		return "emp/bpPass/requestManage";
	}
	
	@GetMapping("/bp/bpPass/requestRegist")
	public String requestRegist() {
		
		return "bp/bpPass/requestRegist";
	}
	
	@ResponseBody
	@PostMapping("/bp/bpPass/requestRegistPdf")
	public Map<String, String> requestRegistPdf(
			@RequestBody Map<String, Object> request) throws IOException, DocumentException{
		
		int registResult = this.bpPassService.requestRegistPdf(request);
		
		Map<String, String> response = new HashMap<>();
		
		if(registResult != 0) {
			response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		
		return response;
	}
	
	@ResponseBody
	@PostMapping("/bp/bpPass/passRequestImage")
	public Map<String, String> passRequestImage(@RequestBody PassRegistVO passRegistVO,
			Model model){
		
		Map<String, String> response = this.bpPassService.passRequestImage(passRegistVO);
		
		return response;
	}
	
	@GetMapping("/bp/bpPass/download")
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
	
	@ResponseBody
	@PostMapping("/emp/bpPass/requestAccept")
	public Map<String, String> requestAccept(@RequestBody PassRegistVO passRegistVO){
		
		log.info("passRegistVO : " + passRegistVO);
		
		int acceptResult = this.bpPassService.requestAccept(passRegistVO);
		Map<String, String> response = new HashMap<>();
		
		if(acceptResult != 0) {
			response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		
		return response;
	}
	
	@ResponseBody
	@PostMapping("/emp/bpPass/requestDecline")
	public Map<String, String> requestDecline(@RequestBody PassRegistVO passRegistVO){
		
		log.info("passRegistVO : " + passRegistVO);
		
		int declineResult = this.bpPassService.requestDecline(passRegistVO);
		Map<String, String> response = new HashMap<>();
		
		if(declineResult != 0) {
			response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		
		return response;
	}
}

