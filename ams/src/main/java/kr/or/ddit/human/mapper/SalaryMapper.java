package kr.or.ddit.human.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.SalaryVO;

@Mapper
public interface SalaryMapper {

	List<SalaryVO> paystubList(Map<String, Object> paystubMap);

	int getpaystubTotal(Map<String, Object> paystubMap);

	List<EmployeeVO> empList(@Param("deptVO") DeptVO deptVO);

	int registpaystub(@Param("salaryVO") SalaryVO salaryVO);

	FileDetailVO paystubImage(@Param("salaryVO") SalaryVO salaryVO);
	
}
