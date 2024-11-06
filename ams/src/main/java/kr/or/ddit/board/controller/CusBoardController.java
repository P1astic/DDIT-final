package kr.or.ddit.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.board.service.CusBoardService;
import kr.or.ddit.board.util.BoardPagination;
import kr.or.ddit.board.util.CustcusBoardPagination;
import kr.or.ddit.board.vo.CustBoardVO;
import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.facility.vo.ParkingRsvtVO;
import kr.or.ddit.userPass.service.PhoneValidationService;
import kr.or.ddit.userPass.vo.CustInfo;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 조미주 민원처리
 *
 */
@RequestMapping("/cust")
@Slf4j
@Controller
public class CusBoardController {

	@Inject
	CusBoardService cusBoardService;
	PhoneValidationService custPassValidationService;

	/**
	 * 민원처리 게시판 목록
	 * 
	 * @return
	 */

	@GetMapping("/cus/main")
	public String main() {
		
//		model.addAttribute("name", name);
//		model.addAttribute("phone", phone);
//		log.info("model : " + model);

		return "cust/cus/main";
	}
	
	//본인인증 이후의 고객소리함 메인
	@GetMapping("/cus/mainC")
	public String mainC(@RequestParam String name, String phone, Model model) {
		
		model.addAttribute("name", name);
		model.addAttribute("phone", phone);
		log.info("model : " + model);
		
		return "cust/cus/main";
	}

	@GetMapping("/cus/main2")
	public String main2() {
		return "cust/cus/main2";
	}

	@GetMapping("/cus/regist")
	public String regist() {
		return "cust/cus/regist";
	}

	@GetMapping("/cus/form")
	public String form() {
		return "cust/cus/form";
	}

	/// cust/cus/cusForm.do
	/// cust/cus/cusForm.do?selType=A1100
	@GetMapping("/cus/cusForm")
	public String cusForm(@RequestParam(value = "selType", required = false, defaultValue = "") String selType,
			String name, String phone, Model model, HttpSession ss) {
		log.info("cusForm->selType : " + selType);

		CustInfo custInfoVO = new CustInfo();
		custInfoVO.setName(name);
		custInfoVO.setPhone(phone);
		log.info("name : " + name);
		log.info("custInfoVO : " + custInfoVO);
		// main2.jsp에서 무엇을 선택했는지 => selType 변수에 들어있음
		// 그것을 cusForm.jsp로 보내줘야 함

		model.addAttribute("selType", selType);
		model.addAttribute("custInfoVO", custInfoVO);
		log.info("model : " + model);

		return "cust/cus/cusForm";
	}

	@GetMapping("/cus/cusList")
	public String cusList(@RequestParam String name, String phone, Model model, HttpSession ss) {

		CustInfo custInfoVO = new CustInfo();
		custInfoVO.setName(name);
		custInfoVO.setPhone(phone);
		log.info("name : " + name);
		log.info("custInfoVO : " + custInfoVO);
		// main2.jsp에서 무엇을 선택했는지 => selType 변수에 들어있음
		// 그것을 cusForm.jsp로 보내줘야 함

		List<CustBoardVO> searchList = this.cusBoardService.searchList(custInfoVO);
		List<CustBoardVO> custBoardVOList = searchList;
		ss.setAttribute("custBoardVOList", custBoardVOList);
//    	log.info("list -> custBoardVOList : " + searchList(custInfoVO));
		log.info("searchList : " + searchList);
//		model.addAttribute("cusCustBoardVOList", searchList);

		model.addAttribute("name", name);
		model.addAttribute("phone", phone);
		return "cust/cus/cusList";
	}

	@ResponseBody
	@PostMapping("/cus/registPost")
	public String registPost(@ModelAttribute CustBoardVO custBoardVO) {
		log.info("registPost -> custBoardVO :" + custBoardVO);

		int result = this.cusBoardService.registPost(custBoardVO);
		log.info("registPost -> result : " + result);

		return "redirect:/cust/cus/cusList";
	}

	@GetMapping("/cus/detail")
	public String detail(Model model, @RequestParam(value = "custBrdNo", required = true) String custBrdNo,
			HttpServletRequest ss) {

		log.info("detail -> custBrdNo : " + custBrdNo);
		log.info("detail -> visitor : " + ss.getAttribute("phone"));
		log.info("detail -> visitor : " + ss.getAttribute("name"));
		String name = (String) ss.getAttribute("name");
		String phone = (String) ss.getAttribute("phone");

		CustBoardVO custBoardVO = new CustBoardVO();
		custBoardVO.setCustBrdNo(custBrdNo);
		custBoardVO = this.cusBoardService.detail(custBrdNo);
		log.info("detail -> custBoardVO : " + custBoardVO);

		long fileGroupNo = custBoardVO.getFileGroupNo();
		List<FileDetailVO> fileDetailVOList = this.cusBoardService.fileList(fileGroupNo);
		log.info("detail -> fileDetailVOList : " + fileDetailVOList);

		model.addAttribute("custBoardVO", custBoardVO);
		model.addAttribute("fileDetailVOList", fileDetailVOList);
		return "cust/cus/detail";
	}

	@GetMapping ("/cus/download")
	public void downloadFile(@RequestParam String filePath, @RequestParam String fileOrgnlFileNm,
			HttpServletResponse response) throws IOException {

		log.info("fileName : " + fileOrgnlFileNm);
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


	// 예약 취소
	@ResponseBody
	@PostMapping("/cus/delete")
	public String delete(@RequestBody CustBoardVO custBoardVO) {
		log.info("delete -> custBoardVO : " + custBoardVO);

		int result = this.cusBoardService.delete(custBoardVO);

		log.info("delete -> result : " + result);

		return "result";
	}

//	@ResponseBody
//	@PostMapping("/cus/delete")
//	public ResponseEntity<String> delete(@RequestBody CustBoardVO custBoardVO) {
//	    log.info("delete -> custBoardVO : " + custBoardVO);
//
//	    int result = this.cusBoardService.delete(custBoardVO);
//
//	    log.info("delete -> result : " + result);
//
//	    if (result > 0) {
//	        return ResponseEntity.ok("삭제 성공");
//	    } else {
//	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 실패");
//	    }
//	}


}
