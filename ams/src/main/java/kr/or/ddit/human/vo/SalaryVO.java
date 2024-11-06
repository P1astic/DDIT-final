package kr.or.ddit.human.vo;

import java.util.List;

import kr.or.ddit.comn.vo.FileDetailVO;
import lombok.Data;

@Data
public class SalaryVO {
	private String salaryDate;
	private String memId;
	private long family;
	private long overtime;
	private long night;
	private long holiday;
	private long dayoff;
	private long jobgrade;
	private long workday;
	private long hourWage;
	private long dayWage;
	private long monthWage;
	private long salaryTax;
	private long salaryBslry;
	private long pension;
	private long health;
	private long employee;
	private long incomeTax;
	private long workhour;
	
	private long fileGroupNo;
	private long totalWage;
	private long sumWage;
	
	private EmployeeVO employeeVO;
	private DeptVO deptVO;
	private JobGradeVO jobGradeVO; 
	
	private List<FileDetailVO> fileDetailVOList;
	
	
	private String searchFilter;
	private String tableSearch;
	
}
