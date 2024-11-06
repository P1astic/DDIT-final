package kr.or.ddit.facility.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.facility.vo.FranchiseVO;
import kr.or.ddit.facility.vo.ZoneVO;

@Mapper
public interface FranchiseMapper {

	public List<FranchiseVO> getList(Map<String, Object> franchiseMap);

	public List<CommonCodeDetailVO> getContractList();

	public int getTotal(Map<String, Object> franchiseMap);

	public FranchiseVO detail(String memId);

	public String getCommonCodeCn(String frnSeCd);

	public List<CommonCodeDetailVO> getFloor(String floor);

	public List<CommonCodeDetailVO> getDetFloor();

	public List<ZoneVO> comparePosition(ZoneVO zoneVO);

	public int frnachiseUpdate(FranchiseVO franchiseVO);

	public int floorInfoUpdate(FranchiseVO franchiseVO);

	public int updateZone(ZoneVO zoneVO);

	public int updateBeforeZone(ZoneVO zoneVOSec);
	
		
}
