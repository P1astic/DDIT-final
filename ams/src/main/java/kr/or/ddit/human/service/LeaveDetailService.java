package kr.or.ddit.human.service;

import java.util.List;

import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.LeaveDetailVO;

public interface LeaveDetailService {
	
	// 24.10.02 휴가신청서 김인호
	public int leaveDetailInsert(EmployeeVO employeeVO);
	

	public LeaveDetailVO leaveDetailList(String elecApvNo);
}
