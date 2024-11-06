package kr.or.ddit.facility.service.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.facility.mapper.mainTenanceMapper;
import kr.or.ddit.facility.service.MaintenanceService;
import kr.or.ddit.facility.vo.MainTenanceVO;

@Service
public class MainTenanceServiceImpl implements MaintenanceService {
	
	@Inject
	mainTenanceMapper mainTenanceMapper; 
	
	
	@Override
	public List<MainTenanceVO> list(Map<String, Object> maintenanceMap) {
		// TODO Auto-generated method stub
		return this.mainTenanceMapper.list(maintenanceMap);
	}



	@Override
	public int registForm(MainTenanceVO mainTenanceVO) {
	//	mainTenanceVO.setElecApvNo("11");
		return  this.mainTenanceMapper.registFormMaintenance(mainTenanceVO);
	}




	@Override
	public MainTenanceVO detail(String mntncCode) {
	   
	    return mainTenanceMapper.detail(mntncCode);
	}



	@Override
	public int mainTenanceEditPost(MainTenanceVO mainTenanceVO) {
	    // 수정된 데이터를 DB에 업데이트
	    return mainTenanceMapper.mainTenanceEditPost(mainTenanceVO);
	}




	@Override
	public int delete(String mntncCode) {
		

		return mainTenanceMapper.delete(mntncCode);
	}



	@Override
	public int getTotal(Map<String, Object> maintenanceMap) {
		// TODO Auto-generated method stub
		return this.mainTenanceMapper.getTotal(maintenanceMap);
	}



















	
	

}