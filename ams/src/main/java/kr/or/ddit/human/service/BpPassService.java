package kr.or.ddit.human.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.itextpdf.text.DocumentException;

import kr.or.ddit.human.vo.PassRegistVO;

public interface BpPassService {

	int requestRegistPdf(Map<String, Object> request) throws IOException, DocumentException;

	List<PassRegistVO> requestList(Map<String, Object> requestMap);

	int getRequestTotal(Map<String, Object> requestMap);

	Map<String, String> passRequestImage(PassRegistVO passRegistVO);

	int requestAccept(PassRegistVO passRegistVO);

	int requestDecline(PassRegistVO passRegistVO);

}
