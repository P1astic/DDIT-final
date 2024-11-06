package kr.or.ddit.human.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.human.vo.DeptVO;

/**
 * @author 홍정호 부서관련 SQL 처리 Mapper 24.9.13. 최초생성
 *
 */
@Mapper
public interface DeptMapper {

	public List<DeptVO> deptList();
	
}
