package kr.or.ddit.attendance.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.WorkRecordVO;

@Mapper
public interface AttendanceMapper {

	// 출근
	public int workIn(AttendanceVO attendanceVO);

	// 퇴근
	public AttendanceVO workOut(String memId);

	public int insertAttendance(AttendanceVO attendanceVO);

	public int workOut(AttendanceVO attendanceVO);
	
	//오늘근태현황
	public WorkRecordVO todayAttendance(String memId);

	public List<AttendanceVO> list(@Param("attendanceVO") Object attribute);

	public AttendanceVO searchlist(@Param("attendanceVO") Object attribute);

	public WorkRecordVO today(String memId);

	public EmployeeVO getHolidayVO(String memId);

	
}
