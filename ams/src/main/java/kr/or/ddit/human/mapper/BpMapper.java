package kr.or.ddit.human.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.auth.vo.AuthLinkVO;
import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.vo.BpVO;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.MemberVO;

/**
 * @author 김예영 이미지 업로드 관련
 * 24.9.27. 최초생성
 *
 */
@Mapper
public interface BpMapper {

	
	
	//협력직원 목록 조회
	public List<BpVO> bpList(Map<String, Object> bpMap);
	//전체 행의 수 
	public int getTotal(Map<String, Object> bpMap);
	//상세
	public BpVO detail(String memId);
	//담당자목록
	public List<EmployeeVO> empList();
	//협력업체 부서목록
	public List<DeptVO> deptList();
	//권한목록
	public List<AuthVO> authList();
	
	public List<CommonCodeDetailVO> selFrnSeCd();
	//계약상태
	public List<CommonCodeDetailVO> ctrtList();
	
	//협력업체 정보수정 실행
	public int editPost(BpVO bpVO);
	
	//협력업체 권한수정 실행
	public int editPostAuth(BpVO bpVO);
	
	//이미지 업데이트
	public int updateImg(BpVO bpVO);
	
	//등록실행
	public int registPost(BpVO bpVO);
	
	public List<BpVO> mygubun(String memId);
	//입점업체 조회
	public BpVO myfrn(String memId);
	//입점업체 구분업뎃
	public int editMyfrn(BpVO bpVO);
	//비밀번호 업뎃
	public int updatePass(BpVO bpVO);
	//비밀번호 조회
	public List<MemberVO> memList(String memId);
	//계약상태 만료시 계정사용불가
	public int updateEnabled(String memId);
}
