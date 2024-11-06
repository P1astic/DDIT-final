package kr.or.ddit.calendar.service.serviceimpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.calendar.mapper.CalendarMapper;
import kr.or.ddit.calendar.service.CalendarService;
import kr.or.ddit.calendar.vo.CalendarVO;
import kr.or.ddit.human.vo.MemberVO;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Inject
	CalendarMapper calendarMapper;

	@Override
	public List<CalendarVO> getMySchedule(String memId) {
		return this.calendarMapper.getMySchedule(memId);
	}

	@Override
	public int createSchedule(CalendarVO createVO) {
		return this.calendarMapper.createSchedule(createVO);
	}

	@Override
	public String createScheId() {
		return this.calendarMapper.createScheId();
	}

	@Override
	public int insertMember(CalendarVO calendarVO) {
		return this.calendarMapper.insertMember(calendarVO);
	}

	@Override
	public List<CalendarVO> getComnSchedule() {
		return this.calendarMapper.getComnSchedule();
	}

	@Override
	public List<CalendarVO> getDeptSchedule(String deptCd) {
		return this.calendarMapper.getDeptSchedule(deptCd);
	}

	@Override
	public List<MemberVO> getScheduleMemList(String scheId) {
		return this.calendarMapper.getScheduleMemList(scheId);
	}

	@Override
	public int updateSchedule(CalendarVO createVO) {
		return this.calendarMapper.updateSchedule(createVO);
	}

	@Override
	public int updateMember(CalendarVO calendarVO) {
		return this.calendarMapper.updateMember(calendarVO);
	}

	@Override
	public int deleteSchedule(String scheId) {
		return this.calendarMapper.deleteSchedule(scheId);
	}

	@Override
	public int createScheduleVideoChat(CalendarVO createVO) {
		return this.calendarMapper.createScheduleVideoChat(createVO);
	}

	@Override
	public int insertMemberVideoChat(CalendarVO calendarVO) {
		return this.calendarMapper.insertMemberVideoChat(calendarVO);
	}

	@Override
	public List<CalendarVO> todayMySchedule(String memId) {
		return this.calendarMapper.todayMySchedule(memId);
	}
}
