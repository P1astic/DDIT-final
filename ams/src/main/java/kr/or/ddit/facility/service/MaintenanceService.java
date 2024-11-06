package kr.or.ddit.facility.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.facility.vo.MainTenanceVO;



public interface MaintenanceService {

	public List<MainTenanceVO> list(Map<String, Object> maintenanceMap);

	
	public int registForm(MainTenanceVO mainTenanceVO);
	
	
	public  MainTenanceVO detail(String mntncCode);


	public int mainTenanceEditPost(MainTenanceVO mainTenanceVO);


	public int delete(String mntncCode);


	public int getTotal(Map<String, Object> maintenanceMap);
	
	
	    



}
