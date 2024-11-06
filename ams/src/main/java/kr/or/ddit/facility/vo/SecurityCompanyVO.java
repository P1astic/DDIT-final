package kr.or.ddit.facility.vo;

import java.util.Date;

import lombok.Data;
@Data
public class SecurityCompanyVO {
	private String facId;
	private String memId;
	private String empName;
	private String expName;
	private String empPass;
	private String empTel1;
	private String empTel2;
	private String empTel3;
	private String empAdd1;
	private String empAdd2;
	private Date createDt;
	private Date modifyDt;
	
	private String searchFilter; //검색조건
	private String table_search; //검색
	int currentPage;
}
