package kr.or.ddit.userPass.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.board.vo.CustBoardVO;
import kr.or.ddit.userPass.vo.CustInfo;
import net.nurigo.sdk.message.model.Message;

public interface PhoneValidationService {


	public String getValidationCode();

	public Message getMsgForm(String name, String ran_str, String phone);

	public String validationSMS(String validation, HttpSession ss);
	
//	public List<CustBoardVO> searchList(CustInfo custInfoVO);

//	public List<CustBoardVO> searchList(String name, String phone, CustInfo custInfoVO);

	public List<CustBoardVO> searchList(String name, String phone);

	public List<CustBoardVO> allcustBoardList(Map<String, Object> custBoardMap);

//	public List<CustBoardVO> searchList(CustInfo custInfoVO);

}
