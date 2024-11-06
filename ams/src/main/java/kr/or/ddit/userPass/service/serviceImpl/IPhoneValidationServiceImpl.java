package kr.or.ddit.userPass.service.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.mapper.CusBoardMapper;
import kr.or.ddit.board.vo.CustBoardVO;
import kr.or.ddit.userPass.service.PhoneValidationService;
import kr.or.ddit.userPass.vo.CustInfo;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.model.Message;

@Slf4j
@Service
public class IPhoneValidationServiceImpl implements PhoneValidationService {

	@Inject
	CusBoardMapper cusBoardMapper;

	@Override
	public String getValidationCode() {
		String ran_str = "";
		for (int i = 0; i < 6; i++) {
			ran_str += (int) (Math.random() * 10);
		}
		return ran_str;
	}

	@Override
	public Message getMsgForm(String name, String ran_str, String phone) {
		Message msg = new Message();

		msg.setFrom("01090590210");
		msg.setAccountId(name);
		msg.setTo(phone);
		msg.setText("[randomchatUNI] 아래의 인증번호를 입력해주세요\n" + ran_str);

		return msg;
	}

	@Override
	public String validationSMS(String validation, HttpSession ss) {
		String message_id = (String)ss.getAttribute("message_id");
		String ran_str = (String)ss.getAttribute("ran_str");
		
		//테스트 해보자
//		validation = "123456";
//		ran_str = "809895";
		
		//ran_str : 809895
		//message_id : M4V20241009113225CXLEJ9ABRXQK0BF
		log.info("validation : " + validation);
		log.info("message_id : " + message_id);
		log.info("ran_str : " + ran_str);
		
		if (ss.getAttribute("message_id") == null || ss.getAttribute("ran_str") == null) {
			log.info("validationSMS->개똥이 if");
			return "인증번호 만료, 처음부터 다시 시도해주세요";
		}else {
			log.info("validationSMS->개똥이 else");
			//"809895".equals("12345")
			//ss.getAttribute("ran_str")의 타입 : Object
			if (ran_str.equals(validation)) {
				log.info("validationSMS->인증 완료2");
				return "success";
			}else {
				log.info("validationSMS->인증 실패");
				return "error";
			}
		}
	}

	@Override
	public List<CustBoardVO> searchList(String name, String phone) {
		
		CustInfo custInfoVO = new CustInfo();
		log.info("name: " + name);
		log.info("phone: " + phone);
		log.info("custInfoVO: " + custInfoVO);
		
//		CustInfo custInfoVO = new CustInfo();
		custInfoVO.setPhone(phone);
		custInfoVO.setName(name);
		log.info("custInfoVO: " + custInfoVO);
		
		return this.cusBoardMapper.searchList(custInfoVO);
	}

	@Override
	public List<CustBoardVO> allcustBoardList(Map<String, Object> custBoardMap) {
		return this.cusBoardMapper.allcustBoardList(custBoardMap);
	}



}
