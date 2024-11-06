package kr.or.ddit.board.service.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.board.mapper.BoardMapper;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.comn.util.UploadController;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.comn.vo.FileDetailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardMapper boardMapper;
	
	@Inject
	UploadController uploadController;
	
	/*
	 * 공지사항 목록 요청 URI : /board/list
	 * 요청 파라미터 : 
	 * 요청방식 : get
	 */
	@Override
	public List<BoardVO> empBoardList(Map<String, Object> boardMap) {
		return this.boardMapper.empBoardList(boardMap);
	}

	@Override
	public List<BoardVO> bpBoardList(Map<String, Object> boardMap) {
		return this.boardMapper.bpBoardList(boardMap);
	}
	/*
	 * 공지사항 목록 요청 URI : /board/detail?ntcBrdNo=
	 * 요청 파라미터 : ntcBrdNo
	 * 요청방식 : get
	 */
	@Override
	public BoardVO detail(String ntcBrdNo) {
		return this.boardMapper.detail(ntcBrdNo);
	}

	/*
	 * 공지사항 상세 진입 시 조회수 증가
	*/
	@Override
	public int updateCnt(String ntcBrdNo) {
		return this.boardMapper.updateCnt(ntcBrdNo);
	}

	/*
	 * 공지사항 작성 시 분류 호출
	 */
	@Override
	public List<CommonCodeDetailVO> noticeType() {
		return this.boardMapper.noticeType();
	}

	/*
	 * 공지사항 등록 실행
	 * 파일 등록 실행
	 */
	@Override
	public int registPost(BoardVO boardVO) {
	    log.info("registPost ServiceImpl -> boardVO : " + boardVO);

	    int result = 0;

	    // 0) 파일 업로드 처리
	    MultipartFile[] multipartFiles = boardVO.getUploadFile();
	    log.info("getUploadFile : " + boardVO.getUploadFile());

	    long fileGroupNo = 0; // 파일이 없는 경우 0으로 설정

	    // 파일이 있을 때만 업로드 처리
	    // 1. 파일 존재
	    // 파일 배열의 첫 번째 파일을 가져옴 -> 그 파일의 명을 가져와서 -> 길이를 체킹 -> 0보다 큼
	    // 2. 파일 없으면
	    // 파일 배열의 첫 번째 파일을 가져옴 -> 그 파일의 명을 가져와서 -> 길이를 체킹 -> 0
	    if (multipartFiles[0].getOriginalFilename().length() > 0) {

	        // 파일이 있는 경우에만 업로드 처리
	            fileGroupNo = this.uploadController.multiImageUpload(multipartFiles);
	            log.info("registPost Service Impl -> fileGroupNo : " + fileGroupNo);
	    }

	    log.info("registPost Service Impl -> boardVO(before) : " + boardVO);

	    boardVO.setFileGroupNo(fileGroupNo);

	    log.info("registPost Service Impl -> boardVO(after) : " + boardVO);

	    // 1) 공지사항 등록
	    result = this.boardMapper.registPost(boardVO);

	    log.info("registPost ServiceImpl -> result : " + result);

	    return result;
	}

	/*
	 * 공지사항 분류명 가져오기
	 * URI : /emp/board/getNoticeTypeNm
	 * 요청방식 : post
	 * 요청 파라미터 : comDetCd
	 */
	@Override
	public CommonCodeDetailVO getNoticeTypeNm(String comDetCd) {
		return this.boardMapper.getNoticeTypeNm(comDetCd);
	}

	/*
	 * 공지사항 삭제
	 * uri : /emp/board/delete
	 * 요청방식 : post
	 * 요청 파라미터 : boardVO
	 */
	@Override
	public int delete(BoardVO boardVO) {
		
		int result = 0;
		
		long fileGroupNo = boardVO.getFileGroupNo();
		
		// 1) 업로드된 파일 삭제
		if(fileGroupNo != 0) {
			result += this.boardMapper.deleteFile(fileGroupNo);
			log.info("delete -> deleteFile : " + result);
		}
		
		// 2) 공지사항 삭제
		result += this.boardMapper.delete(boardVO.getNtcBrdNo());

		log.info("delete -> delete : " + result);
		
		return result;
		
	}

	@Override
	public int getTotal(Map<String, Object> boardMap) {
		return this.boardMapper.getTotal(boardMap);
	}

	@Override
	public int editPost(BoardVO boardVO) {
		
		log.info("editPost ServiceImpl -> boardVO : " + boardVO);

	    int result = 0;

	    // 0) 파일 업로드 처리
	    /*
		1. 수정할 파일이 있음
			MultipartFile[] uploadFile에 파일 객체가 있다
		2. 수정할 파일이 없음
			MultipartFile[] uploadFile에 파일 객체가 없다
		 */
	    MultipartFile[] multipartFiles = boardVO.getUploadFile();

	    long fileGroupNo = 0; // 파일이 없는 경우 0으로 설정

	    // 파일이 있을 때만 업로드 처리
	    //1. 파일이 있다면 fileGroupNo가 20240925013
	    //2. 파일이 없다면 fileGroupNo는 long 타입이므로 0
	    if (multipartFiles[0].getOriginalFilename().length() > 0) {

	        // 파일이 있는 경우에만 업로드 처리
	            fileGroupNo = this.uploadController.multiImageUpload(multipartFiles);
	            log.info("registPost Service Impl -> fileGroupNo : " + fileGroupNo);
	            
	            //파일이 있을 때에만 그룹 번호를 boardVO 에 넣어주자
	            log.info("editpost Service Impl -> boardVO(before) : " + boardVO);
	            boardVO.setFileGroupNo(fileGroupNo);
	    }	    

	    log.info("editpost Service Impl -> boardVO(after) : " + boardVO);

	    // 1) 공지사항 수정
	    result = this.boardMapper.editPost(boardVO);

	    log.info("editPost ServiceImpl -> result : " + result);

	    return result;
	}

	@Override
	public List<FileDetailVO> fileList(long fileGroupNo) {
		return this.boardMapper.fileList(fileGroupNo);
	}

	@Override
	public int getCustTotal(Map<String, Object> boardMap) {
		return this.boardMapper.getCustTotal(boardMap);
	}

	@Override
	public CommonCodeDetailVO bpNoticeType() {
		return this.boardMapper.bpNoticeType();
	}

	@Override
	public List<BoardVO> currBoard() {
		return this.boardMapper.currBoard();
	}

	@Override
	public List<BoardVO> currKeyBoard() {
		return this.boardMapper.currKeyBoard();
	}




}
