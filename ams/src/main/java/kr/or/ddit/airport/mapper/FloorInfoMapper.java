package kr.or.ddit.airport.mapper;

import java.sql.Clob;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.airport.vo.FloorInfoVO;
import kr.or.ddit.facility.vo.FranchiseVO;

@Mapper
public interface FloorInfoMapper {

	public FloorInfoVO getInfo(String mapId);
	
	public String getType(String comDetCd);

	public FranchiseVO getDetail(String memId);

	public List<FloorInfoVO> getList(String frnFloorLocation);

	public List<FloorInfoVO> getCounter(FloorInfoVO floorInfoVO);


}
