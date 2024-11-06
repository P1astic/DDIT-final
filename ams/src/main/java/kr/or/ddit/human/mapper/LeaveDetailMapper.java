package kr.or.ddit.human.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.LeaveDetailVO;
import kr.or.ddit.human.vo.SalaryVO;

@Mapper
public interface LeaveDetailMapper {
	
	// 24.10.02 휴가신청서 김인호
	public int leaveDetailInsert(EmployeeVO employeeVO);

	public LeaveDetailVO leaveDetailList(String elecApvNo);
}
