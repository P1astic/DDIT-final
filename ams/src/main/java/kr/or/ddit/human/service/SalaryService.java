package kr.or.ddit.human.service;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.itextpdf.text.DocumentException;

import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.SalaryVO;

public interface SalaryService {

	List<SalaryVO> paystubList(Map<String, Object> paystubMap);

	int getpaystubTotal(Map<String, Object> paystubMap);

	List<EmployeeVO> empList(DeptVO deptVO);

	int registpaystub(Map<String, Object> request) throws IOException, DocumentException;

	 Map<String, String> paystubImage(SalaryVO salaryVO);

}
