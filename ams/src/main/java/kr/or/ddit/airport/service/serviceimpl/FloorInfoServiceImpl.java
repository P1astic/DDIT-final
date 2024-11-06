package kr.or.ddit.airport.service.serviceimpl;

import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.airport.mapper.FloorInfoMapper;
import kr.or.ddit.airport.service.FloorInfoService;
import kr.or.ddit.airport.vo.FloorInfoVO;
import kr.or.ddit.facility.vo.FranchiseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FloorInfoServiceImpl implements FloorInfoService {
	
	@Inject
	FloorInfoMapper floorInfoMapper;

	@Override
	public FloorInfoVO getInfo(String mapId) {
		return this.floorInfoMapper.getInfo(mapId);
	}

	@Override
	public FranchiseVO getDetail(String memId) {
		return this.floorInfoMapper.getDetail(memId);
	}

	@Override
	public String getType(String comDetCd) {
		return this.floorInfoMapper.getType(comDetCd);
	}

	@Override
	public List<FloorInfoVO> getList(String frnFloorLocation) {
		return this.floorInfoMapper.getList(frnFloorLocation);
	}

	@Override
	public List<FloorInfoVO> getCounter(FloorInfoVO floorInfoVO) {
		return this.floorInfoMapper.getCounter(floorInfoVO);
	}
}
