package kr.or.ddit.board.mapper;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.board.vo.CustBoardVO;
import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.userPass.vo.CustInfo;


@Mapper
public interface CusBoardMapper {
//이름 전화번호 접속권한 주기 이름과 전화번호로 조건 걸어서 게시글 띄우기 게시글 상세보기는 선택시 비밀번호로 조건 주기
	public List<CustBoardVO> custBoardList(CustInfo custInfoVO);

	 public int getTotal(Map<String, Object> custBoardMap);

	public int registPost(CustBoardVO custBoardVO);
//	public List<CustBoardVO> searchList(String name, String phone);
	public List<CustBoardVO> searchList(CustInfo custInfoVO);

	public CustBoardVO detail(String custBrdNo);

	public List<FileDetailVO> fileList(long fileGroupNo);

//	public int delete(CustBoardVO custBoardVO);

	public List<CustBoardVO> allcustBoardList(Map<String, Object> custBoardMap);

	public int delete(String custBrdNo);

	public int updateAnswerStatus(CustBoardVO custBoardVO);



}
