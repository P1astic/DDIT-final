package kr.or.ddit.human.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.human.mapper.DeptMapper;
import kr.or.ddit.human.service.DeptService;
import kr.or.ddit.human.vo.DeptVO;

/**
 * @author 홍정호 24.9.13. 최초생성 부서 서비스 임플먼트 
 *
 */
@Service
public class DeptServiceImpl implements DeptService{

	@Autowired
	DeptMapper deptMapper;
	
	@Override
	public List<DeptVO> deptList() {
		// TODO Auto-generated method stub
		return this.deptMapper.deptList();
	}

}
