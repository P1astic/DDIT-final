package kr.or.ddit.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.util.BoardPagination;
import kr.or.ddit.board.util.BpBoardPagination;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.human.service.DeptService;
import kr.or.ddit.human.vo.DeptVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 예영
 * 공지사항
 *
 */
@Slf4j
@Controller
public class BoardController {

	@Inject
	BoardService boardService;
	
	@Inject
	DeptService deptService;
		
	/**
	 * 사내 공지사항 목록
	 * @return
	 */
	@GetMapping("/emp/board/list")
	public String empBoardList(Model model,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="deptGubun", required=false, defaultValue="") String deptGubun
			) {
		
		Map<String, Object> boardMap = new HashMap<String, Object>();
		
		if(deptGubun.equals("C1")) {
			deptGubun = "O3";
		} else if(deptGubun.equals("C2")) {
			deptGubun = "O4";
		} else if(deptGubun.equals("C3")) {
			deptGubun = "O5";
		} else if(deptGubun.equals("C4")) {
			deptGubun = "O6";
		}
		
		boardMap.put("gubun", gubun);
		boardMap.put("keyword", keyword);
		boardMap.put("currentPage", currentPage);
		boardMap.put("deptGubun", deptGubun);
		
		

		log.info("boardMap : " + boardMap);
		
		//total은 페이지네이션의 중요한 역할을 함
		int total = this.boardService.getTotal(boardMap);
		

		List<BoardVO> boardVOList = this.boardService.empBoardList(boardMap);

		
		log.info("list -> boardVOList : " + boardVOList);
		log.info("list -> boardVOList size: " + boardVOList.size());
		
		
		BoardPagination<BoardVO> articlePage = new BoardPagination<BoardVO>(total, currentPage, 15, boardVOList, boardMap);
		
		log.info("articlePage : " + articlePage);
		
		model.addAttribute("boardVOList", boardVOList);
		model.addAttribute("articlePage", articlePage);
		
		return "emp/board/list";
	}
	
	/**
	 * 사내 공지사항 상세
	 * @param ntcBrdNo
	 * @return
	 */
	@GetMapping("/emp/board/detail")
	public String detail(Model model, @RequestParam(value="ntcBrdNo", required=true) String ntcBrdNo,
			HttpSession loginSession, HttpServletRequest req, HttpServletResponse resp) {
				
		log.info("detail -> ntcBrdNo : " + ntcBrdNo);
		log.info("detail -> visitor : " + loginSession.getAttribute("userId"));
		String memId = (String) loginSession.getAttribute("userId");
		
		
		// 1) 상세 정보 조회
		BoardVO boardVO = new BoardVO();
		boardVO.setNtcBrdNo(ntcBrdNo);
		boardVO = this.boardService.detail(ntcBrdNo);
		log.info("detail -> boardVO : " + boardVO);
		

		// 2) 첨부파일 리스트 조회
		long fileGroupNo = boardVO.getFileGroupNo();
		List<FileDetailVO> fileDetailVOList = this.boardService.fileList(fileGroupNo);
		log.info("detail -> fileDetailVOList : " + fileDetailVOList);
		

		
		// 3) 조회수 증가
		
		if(boardVO != null) {
			String visitor = "";
			String author = boardVO.getMemId();
			if(visitor != null) {
				visitor = memId;
			}
			if(!visitor.equals(author)) { // 방문자와 작성자의 아이디가 다를 경우 조회수 증가 로직 시작
				log.info("visitor : " + visitor);
				log.info("author : " + author);
				Cookie cookie = null;
				Cookie[] cookies = req.getCookies();
				
				if(cookies != null && cookies.length > 0) {
					for(Cookie c : cookies) {
						if(c.getName().equals("readBoardNo")) {
							cookie = c;
						}
					}
				}
				
				int result = 0;
				
				if(cookie == null) {
					cookie = new Cookie("readBoardNo", ntcBrdNo+"");
					result = this.boardService.updateCnt(ntcBrdNo);
				} else {
					String[] temp = cookie.getValue().split("/");
					List<String> list = Arrays.asList(temp);
					
					if(list.indexOf(ntcBrdNo+"") == -1) {
						cookie.setValue(cookie.getValue() + "/" + ntcBrdNo);
						result = this.boardService.updateCnt(ntcBrdNo);
					}
				}
				if(result > 0) {
					boardVO.setNtcBrdInqCnt(boardVO.getNtcBrdInqCnt()+1);
					cookie.setPath(req.getContextPath());
					cookie.setMaxAge(60*60*1);
					resp.addCookie(cookie);
				}
			}
		}		
		
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("fileDetailVOList", fileDetailVOList);
		return "emp/board/detail";
	}
	
	/**
	 * 사내 공지사항 등록 요청
	 * @return
	 */
	@GetMapping("/emp/board/regist")
	public String regist(Model model) {
		
		// 공지사항 분류 목록
		List<CommonCodeDetailVO> noticeType = this.boardService.noticeType();
		
		log.info("regist -> notice type : " + noticeType);
		
		model.addAttribute("noticeType", noticeType);
		
		return "emp/board/regist";
	}

	/**
	 * 협력업체 공지사항 등록 요청
	 * @return
	 */
	@GetMapping("/bp/board/regist")
	public String bpRegist(Model model) {
		
		// 공지사항 분류 목록
		CommonCodeDetailVO bpNoticeType = this.boardService.bpNoticeType();
		
		log.info("regist -> bpNoticeType : " + bpNoticeType);
		
		model.addAttribute("bpNoticeType", bpNoticeType);
		
		return "bp/board/regist";
	}
	
	/*
	 * 공지사항 분류명 가져오기
	 * URI : /emp/board/getNoticeTypeNm
	 * 요청방식 : post
	 * 요청 파라미터 : comDetCd
	 */
	@ResponseBody
	@PostMapping("/emp/board/getNoticeTypeNm")
	public CommonCodeDetailVO getNoticeTypeNm(@RequestBody CommonCodeDetailVO commonCodeDetailVO) {
		
		// 공지사항 분류명 추출
		commonCodeDetailVO = this.boardService.getNoticeTypeNm(commonCodeDetailVO.getComDetCd());
		
		log.info("getNoticeTypeNm -> commonCodeDetailVO : " + commonCodeDetailVO);
		
		return commonCodeDetailVO;
	}
	
	/**
	 * 공지사항 등록 실행 요청URI : /emp/board/registPost 
	 * 요청방식 : post
	 */
	@ResponseBody
	@PostMapping("/emp/board/registPost")
	public String registPost(@ModelAttribute BoardVO boardVO) {
		log.info("registPost -> boardVO : " + boardVO);
		
		log.info("registPost -> boardVO.uploadFile : " + boardVO.getUploadFile());
		int result = this.boardService.registPost(boardVO);
		
		log.info("registPost -> result : " + result);
		
		return boardVO.getNtcBrdNo();
		
	}

	/**
	 * 협력업체 공지사항 등록 실행 요청URI : /bp/board/registPost 
	 * 요청방식 : post
	 */
	@PostMapping("/bp/board/registPost")
	public String bpRegistPost(@ModelAttribute BoardVO boardVO) {
		log.info("bpRegistPost -> boardVO : " + boardVO);
		
		int result = this.boardService.registPost(boardVO);
		
		log.info("bpRegistPost -> result : " + result);
		
		return "redirect:/bp/board/detail?ntcBrdNo=" + boardVO.getNtcBrdNo();
		
	}
	
	
	/**
	 * 공지사항 삭제
	 * @param boardVO
	 */
	@ResponseBody
	@PostMapping("/emp/board/delete")
	public int delete(@RequestBody BoardVO boardVO
			) {
		log.info("delete -> boardVO : " + boardVO);
		
		int result = this.boardService.delete(boardVO);
		
		log.info("delete -> result : " + result);
		
		return result;
	}

	/**
	 * 공지사항 삭제
	 * @param boardVO
	 */
	@ResponseBody
	@PostMapping("/bp/board/delete")
	public int bpDelete(@RequestBody BoardVO boardVO) {
		log.info("delete -> boardVO : " + boardVO);
		
		int result = this.boardService.delete(boardVO);
		
		log.info("delete -> result : " + result);
		
		return result;
	}
	
	/**
	 * 공지사항 수정 요청
	 * @param model
	 * @param boardVO
	 */
	@GetMapping("/emp/board/edit")
	public String edit(Model model, @ModelAttribute BoardVO boardVO, @ModelAttribute FileDetailVO fileDetailVO) {
		log.info("edit -> boardVO.getNtcBrdNo : " + boardVO.getNtcBrdNo());
		log.info("edit -> fileDetailVO : " + fileDetailVO);
		
		// 1) 공지사항 상세 조회
		boardVO = this.boardService.detail(boardVO.getNtcBrdNo());
		
		// 2) 공지사항 기존 분류명 추출
		CommonCodeDetailVO OriginCommonCodeDetailVO = this.boardService.getNoticeTypeNm(boardVO.getNtcBrdType());
		
		// 3) 공지사항 분류명 추출
		List<CommonCodeDetailVO> AllCommonCodeDetailVO = this.boardService.noticeType();
		
		log.info("edit -> boardVO(후) : " + boardVO);
		log.info("edit -> OriginCommonCodeDetailVO : " + OriginCommonCodeDetailVO);
		log.info("edit -> AllCommonCodeDetailVO : " + AllCommonCodeDetailVO);
		
		// 3) 첨부파일 리스트 조회
		long fileGroupNo = boardVO.getFileGroupNo();
		List<FileDetailVO> fileDetailVOList = this.boardService.fileList(fileGroupNo);
		
		log.info("edit -> fileDetailVOList : " + fileDetailVOList);
		
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("OriginCommonCodeDetailVO", OriginCommonCodeDetailVO);
		model.addAttribute("AllCommonCodeDetailVO", AllCommonCodeDetailVO);
		model.addAttribute("fileDetailVOList", fileDetailVOList);
		
		return "emp/board/edit";
	}

	/**
	 * 공지사항 수정 요청
	 * @param model
	 * @param boardVO
	 */
	@GetMapping("/bp/board/edit")
	public String bpEdit(Model model, @ModelAttribute BoardVO boardVO, @ModelAttribute FileDetailVO fileDetailVO) {
		log.info("edit -> boardVO.getNtcBrdNo : " + boardVO.getNtcBrdNo());
		log.info("edit -> fileDetailVO : " + fileDetailVO);
		
		// 1) 공지사항 상세 조회
		boardVO = this.boardService.detail(boardVO.getNtcBrdNo());
		
		// 2) 공지사항 기존 분류명 추출
		CommonCodeDetailVO OriginCommonCodeDetailVO = this.boardService.getNoticeTypeNm(boardVO.getNtcBrdType());
		
		// 3) 공지사항 분류명 추출
		List<CommonCodeDetailVO> AllCommonCodeDetailVO = this.boardService.noticeType();
		
		log.info("edit -> boardVO(후) : " + boardVO);
		log.info("edit -> OriginCommonCodeDetailVO : " + OriginCommonCodeDetailVO);
		log.info("edit -> AllCommonCodeDetailVO : " + AllCommonCodeDetailVO);
		
		// 3) 첨부파일 리스트 조회
		long fileGroupNo = boardVO.getFileGroupNo();
		List<FileDetailVO> fileDetailVOList = this.boardService.fileList(fileGroupNo);
		
		log.info("edit -> fileDetailVOList : " + fileDetailVOList);
		
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("OriginCommonCodeDetailVO", OriginCommonCodeDetailVO);
		model.addAttribute("AllCommonCodeDetailVO", AllCommonCodeDetailVO);
		model.addAttribute("fileDetailVOList", fileDetailVOList);
		
		return "bp/board/edit";
	}
	
	
	/**
	 * 공지사항 수정 실행
	 * @param boardVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/emp/board/editPost")
	public String editPost(@ModelAttribute BoardVO boardVO) {
		/*
		1. 수정할 파일이 있음
			MultipartFile[] uploadFile에 파일 객체가 있다
		2. 수정할 파일이 없음
			MultipartFile[] uploadFile에 파일 객체가 없다
		 */
		log.info("editPost -> boardVO : " + boardVO);
		
		int result = this.boardService.editPost(boardVO);
		
		log.info("editPost -> result : " + result);
		
		return boardVO.getNtcBrdNo();
	}
	
	/*
	 * 부서 목록 가져오기
	 */
	@ResponseBody
	@PostMapping("/emp/board/getDeptList")
	public List<DeptVO> getDeptList() {
		
		List<DeptVO> deptVO = this.deptService.deptList();
		
		return deptVO;
	}

	/**
	 * 공지사항 수정 실행
	 * @param boardVO
	 * @return
	 */
	@PostMapping("/bp/board/editPost")
	public String bpEditPost(@ModelAttribute BoardVO boardVO) {
		log.info("bpEditPost -> boardVO : " + boardVO);
		
		int result = this.boardService.editPost(boardVO);
		
		log.info("bpEditPost -> result : " + result);
		
		return "redirect:/bp/board/detail?ntcBrdNo=" + boardVO.getNtcBrdNo();
	}
	
	/**
	 * 파일 다운로드
	 * @param filePath
	 * @param fileOrgnlFileNm
	 * @param response
	 */
	@GetMapping(value={"/emp/board/download", "/bp/board/download"})
	public void downloadFile(@RequestParam String filePath, @RequestParam String fileOrgnlFileNm, HttpServletResponse response) throws IOException {
		
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
	
	
	/**
	 * 협력업체 공지사항 목록
	 * @return
	 */
	@GetMapping("/bp/board/list")
	public String bpBoardList(Model model,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			) {
		Map<String, Object> boardMap = new HashMap<String, Object>();
		
		boardMap.put("gubun", gubun);
		boardMap.put("keyword", keyword);
		boardMap.put("currentPage", currentPage);

		log.info("boardMap : " + boardMap);
		
		//total은 페이지네이션의 중요한 역할을 함
		int total = this.boardService.getCustTotal(boardMap);
		
		List<BoardVO> boardVOList = this.boardService.bpBoardList(boardMap);

		
		log.info("list -> boardVOList : " + boardVOList);
		log.info("list -> boardVOList size: " + boardVOList.size());
		
		
		BpBoardPagination<BoardVO> articlePage = new BpBoardPagination<BoardVO>(total, currentPage, 15, boardVOList, boardMap);
		
		log.info("articlePage : " + articlePage);		
		
		model.addAttribute("boardVOList", boardVOList);
		model.addAttribute("articlePage", articlePage);
		model.addAttribute("menuReset", "true");
		
		return "bp/board/list";
	}
	
	/*
	 * 협력업체 공지사항 상세
	 */
	@GetMapping("/bp/board/detail")
	public String bpBoarddetail(Model model, @RequestParam(value="ntcBrdNo", required=true) String ntcBrdNo) {
		
		log.info("detail -> ntcBrdNo : " + ntcBrdNo);
		
		
		// 1) 상세 정보 조회
		BoardVO boardVO = new BoardVO();
		boardVO.setNtcBrdNo(ntcBrdNo);
		boardVO = this.boardService.detail(ntcBrdNo);
		log.info("detail -> boardVO : " + boardVO);
		
		
		// 2) 첨부파일 리스트 조회
		long fileGroupNo = boardVO.getFileGroupNo();
		List<FileDetailVO> fileDetailVOList = this.boardService.fileList(fileGroupNo);
		log.info("detail -> fileDetailVOList : " + fileDetailVOList);				
		
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("fileDetailVOList", fileDetailVOList);
		return "bp/board/detail";
	}
	

	
}
