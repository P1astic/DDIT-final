package kr.or.ddit.human.service;

import java.util.List;

import kr.or.ddit.human.vo.DeptVO;

/**
 * @author 홍정호 24.9.13. 최초생성
 * 부서관련 서비스를 처리하기 위한 파일
 *
 */
public interface DeptService {
	
	public List<DeptVO> deptList();
	
}
