package kr.or.ddit.airplane.service.serviceimpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.airplane.mapper.AirplaneMapper;
import kr.or.ddit.airplane.service.AirplaneService;
import kr.or.ddit.airplane.vo.AirLineVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;

@Service
public class AirplaneServiceImpl implements AirplaneService {
	
	@Inject
	AirplaneMapper airplaneMapper;

	@Override
	public List<CommonCodeDetailVO> getNationName() {
		return this.airplaneMapper.getNationName();
	}

	@Override
	public List<CommonCodeDetailVO> getAirLineName() {
		return this.airplaneMapper.getAirLineName();
	}

	@Override
	public List<AirLineVO> getAirLines() {
		return this.airplaneMapper.getAirLines();
	}

}
