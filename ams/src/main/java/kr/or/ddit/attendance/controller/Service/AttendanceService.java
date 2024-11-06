package kr.or.ddit.attendance.controller.Service;

import java.util.List;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.human.ServiceResult;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.WorkRecordVO;

public interface AttendanceService {
	
//	public AttendanceVO allinfo(Object attribute);

	public ServiceResult workIn(AttendanceVO attendanceVO);
//	public ServiceResult workOut(AttendanceVO attendanceVO);
	public ServiceResult workOut(AttendanceVO attendanceVO);
//	public AttendanceVO memId();
//	AttendanceVO workOut(String wrNo);
	AttendanceVO workOut(String memId);
	
	//오늘근태현황
	public WorkRecordVO todayAttendance(String memId);
	public List<AttendanceVO> list(Object attribute);
	public AttendanceVO searchlist(Object attribute);
	public WorkRecordVO today(String memId);
	public EmployeeVO getHolidayVO(String memId);

}
