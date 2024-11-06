package kr.or.ddit.facility.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.facility.vo.MainTenanceVO;

@Mapper
public interface mainTenanceMapper {
	/*
	 * 유지보수 목록 요청 URI : /maintenance/list
	 * 요청 파라미터 : 
	 * 요청방식 : get
	 */
	
	
	public List<MainTenanceVO> list(Map<String, Object> maintenanceMap);

	public int registFormMaintenance(MainTenanceVO mainTenanceVO);

	public  MainTenanceVO detail(String mntncCode);

	public int mainTenanceEditPost(MainTenanceVO mainTenanceVO);

	public int delete(String mntncCode);

	public int getTotal(Map<String, Object> maintenanceMap);



	




	
	
	
	
	

}