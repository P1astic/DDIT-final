package kr.or.ddit.human.service.serviceimpl;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.human.mapper.LeaveDetailMapper;
import kr.or.ddit.human.service.LeaveDetailService;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.LeaveDetailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LeaveDetailServiceImpl implements LeaveDetailService {
	
	@Inject
	LeaveDetailMapper leaveDetailMapper;
	
	@Override
	public int leaveDetailInsert(EmployeeVO employeeVO) {
		return this.leaveDetailMapper.leaveDetailInsert(employeeVO);
	}

	@Override
	public LeaveDetailVO leaveDetailList(String elecApvNo) {
		return this.leaveDetailMapper.leaveDetailList(elecApvNo);
	}

}
