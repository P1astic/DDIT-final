package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.CustBoardVO;
import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.human.ServiceResult;
import kr.or.ddit.userPass.vo.CustInfo;


public interface CusBoardService {

	/*
민원처리 고객용 list 
	 */
	
	

	public List<CustBoardVO> custBoardList(CustInfo custInfoVO);
	
	public int getTotal(Map<String, Object> custBoardMap);

	public int registPost(CustBoardVO custBoardVO);

//	public List<CustBoardVO> searchList(String name, String phone);

	public List<CustBoardVO> searchList(CustInfo custInfoVO);

	public List<FileDetailVO> fileList(long fileGroupNo);

	public CustBoardVO detail(String custBrdNo);

	public int delete(CustBoardVO custBoardVO);

	public ServiceResult updateAnswer(CustBoardVO custBoardVO);

//	public List<CustBoardVO> searchBoard(String keyword, String status);

//	public int delete(String custBrdNo);


    
}
