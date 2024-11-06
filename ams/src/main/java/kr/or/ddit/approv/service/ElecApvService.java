package kr.or.ddit.approv.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.approv.vo.ApvDetailVO;
import kr.or.ddit.approv.vo.ElecApvVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.vo.EmployeeVO;



/**
 * @author 김인호 24.09.20 최초생성
 * 결재문서관련 서비스를 처리하기 위한 파일
 *
 */
public interface ElecApvService {
	/**
	 * @author 김인호 24.09.20 최초생성
	 * 결재문서관련 서비스를 처리하기 위한 파일
	 * @param boardMap 
	 *
	 */
	
	// 나의 기안서 목록 김인호
	public List<ElecApvVO> elecApvList(Map<String, Object> listMap);
	
	public int getTotal(Map<String, Object> listMap);

	// 24.09.23 결재서 기안 김인호
	public int paymentInsert(EmployeeVO employeeVO);

	
	// 기안서 상세
	public List<ElecApvVO> myElecApvListDetail(String elecApvNo);

	public int apvDetailUpdate(ElecApvVO elecApvVO);

	public ApvDetailVO getApvLineFinYn(ApvDetailVO apvDetailVO);

	public int prDetailUpdate(ApvDetailVO apvDetailVO);
	
	//결재대기 문서(내가 결재자)
	public List<ElecApvVO> waitElec();

	public List<ApvDetailVO> getApvLineFinYn1(String elecApvNo);

	public List<CommonCodeDetailVO> comCodeList();

	
}
