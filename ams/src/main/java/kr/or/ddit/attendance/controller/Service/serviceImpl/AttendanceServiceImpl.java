package kr.or.ddit.attendance.controller.Service.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.attendance.controller.Service.AttendanceService;
import kr.or.ddit.attendance.mapper.AttendanceMapper;
import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.human.ServiceResult;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.WorkRecordVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Inject
	AttendanceMapper attendanceMapper;


	@Override
	public ServiceResult workIn(AttendanceVO attendanceVO) {
		try {
			int insertCount = attendanceMapper.workIn(attendanceVO);
			if (insertCount > 0) {
				return ServiceResult.OK;
			} else {
				return ServiceResult.FAILED; // Handle the case where no rows were affected
			}
		} catch (Exception e) {
			log.error("Error while inserting attendance: ", e);
			return ServiceResult.FAILED; // Handle exceptions appropriately
		}
	}


	@Override
	public AttendanceVO workOut(String memId) {
		return this.attendanceMapper.workOut(memId);

	}

	@Override
	public ServiceResult workOut(AttendanceVO attendanceVO) {
		try {
			int insertCount = attendanceMapper.workOut(attendanceVO);
			if (insertCount > 0) {
				return ServiceResult.OK;
			} else {
				return ServiceResult.FAILED; // Handle the case where no rows were affected
			}
		} catch (Exception e) {
			log.error("Error while inserting attendance: ", e);
			return ServiceResult.FAILED; // Handle exceptions appropriately
		}
	}
	
	//오늘 근태현황
	@Override
	public WorkRecordVO todayAttendance(String memId) { 

		return this.attendanceMapper.todayAttendance(memId);
	}
	
	@Override
	public WorkRecordVO today(String memId) { 
		
		return this.attendanceMapper.today(memId);
	}


	@Override
	public List<AttendanceVO> list(Object attribute) {
		// TODO Auto-generated method stub
		return this.attendanceMapper.list(attribute);
	}


	@Override
	public AttendanceVO searchlist(Object attribute) {
		return this.attendanceMapper.searchlist(attribute);
	}


	@Override
	public EmployeeVO getHolidayVO(String memId) {
		return this.attendanceMapper.getHolidayVO(memId);
	}






}
