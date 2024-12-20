package kr.or.ddit.calendar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.calendar.vo.CalendarVO;
import kr.or.ddit.human.vo.MemberVO;

@Mapper
public interface CalendarMapper {

	public List<CalendarVO> getMySchedule(String memId);
	
	public List<CalendarVO> todayMySchedule(String memId);

	public int createSchedule(CalendarVO createVO);

	public String createScheId();

	public int insertMember(CalendarVO calendarVO);

	public List<CalendarVO> getComnSchedule();

	public List<CalendarVO> getDeptSchedule(String deptCd);

	public List<MemberVO> getScheduleMemList(String scheId);

	public int updateSchedule(CalendarVO createVO);

	public int updateMember(CalendarVO calendarVO);

	public int deleteSchedule(String scheId);

	public int createScheduleVideoChat(CalendarVO createVO);

	public int insertMemberVideoChat(CalendarVO calendarVO);

}
