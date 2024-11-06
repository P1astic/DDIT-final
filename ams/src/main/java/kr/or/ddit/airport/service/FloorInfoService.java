package kr.or.ddit.airport.service;

import java.sql.Clob;
import java.util.List;

import kr.or.ddit.airplane.vo.AirLineVO;
import kr.or.ddit.airport.vo.FloorInfoVO;
import kr.or.ddit.facility.vo.FranchiseVO;

public interface FloorInfoService {

	public FloorInfoVO getInfo(String mapId);

	public FranchiseVO getDetail(String memId);
	
	public String getType(String comDetCd);

	public List<FloorInfoVO> getList(String frnFloorLocation);

	public List<FloorInfoVO> getCounter(FloorInfoVO floorInfoVO);


}
