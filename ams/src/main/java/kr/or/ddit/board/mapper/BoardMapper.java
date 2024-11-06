package kr.or.ddit.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.comn.vo.FileDetailVO;

@Mapper
public interface BoardMapper {
	
	/*
	 * 공지사항 목록 요청 URI : /board/list
	 * 요청 파라미터 : 
	 * 요청방식 : get
	 */
	public List<BoardVO> empBoardList(Map<String, Object> boardMap);

	/*
	 * 공지사항 상세 요청 URI : /board/detail?ntcBrdNo=
	 * 요청 파라미터 : ntcBrdNo
	 * 요청방식 : get
	 */
	public BoardVO detail(String ntcBrdNo);
	
	/*
	 * 공지사항 상세 진입 시 조회수 증가
	 */
	public int updateCnt(String ntcBrdNo);
	
	/*
	 * 공지사항 작성 시 분류 호출
	 */
	public List<CommonCodeDetailVO> noticeType();

	public int registPost(BoardVO boardVO);

	/*
	 * 공지사항 분류명 가져오기
	 * URI : /emp/board/getNoticeTypeNm
	 * 요청방식 : post
	 * 요청 파라미터 : comDetCd
	 */
	public CommonCodeDetailVO getNoticeTypeNm(String comDetCd);

	public int deleteFile(long fileGroupNo);

	public int delete(String ntcBrdNo);

	public int getTotal(Map<String, Object> boardMap);

	public int editPost(BoardVO boardVO);
	
	public List<FileDetailVO> fileList(long fileGroupNo);

	public List<BoardVO> bpBoardList(Map<String, Object> boardMap);

	public int getCustTotal(Map<String, Object> boardMap);

	public CommonCodeDetailVO bpNoticeType();
	
	
	public List<BoardVO> currBoard();
	public List<BoardVO> currKeyBoard();

}
