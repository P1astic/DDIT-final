package kr.or.ddit.approv.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.approv.vo.ApvDetailVO;
import kr.or.ddit.approv.vo.ElecApvVO;
import kr.or.ddit.approv.vo.TemplateSectionVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.vo.EmployeeVO;


/**
 * @author 김인호 결재문서 관련 SQL 처리 매퍼 24.09.20 
 *
 */
@Mapper
public interface ElecApvMapper {
	
	// 나의 기안서 목록
	public List<ElecApvVO> elecApvList(Map<String, Object> listMap);
	
	// 결재문서 기안
	public int elecApvInsert(EmployeeVO employeeVO);
	
	// 결재라인 지정
	public int apvDetailInsert(ApvDetailVO lineVO);
	
	// 기안서 상세
	public List<ElecApvVO> myElecApvListDetail(String elecApvNo);
	
	// 결재 승인
	public int apvDetailUpdate(ElecApvVO elecApvVO);
	
	// 결재 반려
	public int prDetailUpdate(ApvDetailVO apvDetailVO);
	
	// 결재라인정보
	public ApvDetailVO getApvLineFinYn(ApvDetailVO apvDetailVO);
	
	// 문서상태 업뎃(최종)
	public int statUpdate(ElecApvVO elecApvVO);

	public int statUpdate2(ApvDetailVO apvDetailVO);

	public int getTotal(Map<String, Object> listMap);

	public List<ApvDetailVO> getApvLineFinYn1(String elecApvNo);

	public List<CommonCodeDetailVO> comCodeList();
	
	//결재대기 문서(내가 결재자)
	public List<ElecApvVO> waitElec();
	
	// 휴가일수 차감
	public int yrycDaycntUpdate(ElecApvVO elecApvVO);
	
	// 
	public ElecApvVO checkNo(ElecApvVO elecApvVO);

}
