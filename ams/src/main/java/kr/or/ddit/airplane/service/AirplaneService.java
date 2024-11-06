package kr.or.ddit.airplane.service;

import java.util.List;

import kr.or.ddit.airplane.vo.AirLineVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;

public interface AirplaneService {

	public List<CommonCodeDetailVO> getNationName();
	
	public List<CommonCodeDetailVO> getAirLineName();

	public List<AirLineVO> getAirLines();

}
