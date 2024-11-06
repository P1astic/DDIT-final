package kr.or.ddit.facility.service.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

//import org.apache.maven.doxia.logging.Log;
import org.springframework.stereotype.Service;

import kr.or.ddit.facility.mapper.AirportFacilityMapper;
import kr.or.ddit.facility.service.AirportFacilityService;
import kr.or.ddit.facility.vo.AirportFacilityRSVVO;
import kr.or.ddit.facility.vo.AirportFacilityVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 임세희 24.10.04
 * @title 공항시설(비회원)
 */
@Slf4j
@Service
public class AirportFacilityServiceImlp implements AirportFacilityService {
	
	@Inject
	AirportFacilityMapper airportFacilityMapper;
	
	@Override
	public List<AirportFacilityVO> airportFacilityList() {
		return this.airportFacilityMapper.airportFacilityList();
	}

	@Override
	public List<AirportFacilityRSVVO> list() {
		return this.airportFacilityMapper.list();
	}

	@Override
	public int registPost(AirportFacilityRSVVO airportFacilityRSVVO) {
		airportFacilityRSVVO.setAptFacRsvtYmd(airportFacilityRSVVO.getAptFacRsvtYmd().replaceAll("-", ""));
		return this.airportFacilityMapper.registPost(airportFacilityRSVVO);
	}

	@Override
	public List<AirportFacilityRSVVO> timeSetting(String aptFacRsvtYmd) {
		aptFacRsvtYmd = aptFacRsvtYmd.replaceAll("-", "");
		log.info("aptFacRsvtYmd : "+aptFacRsvtYmd);
		return this.airportFacilityMapper.timeSetting(aptFacRsvtYmd);
	}

	@Override
	public AirportFacilityRSVVO detail(String aptFacRsvtNo) {
		return this.airportFacilityMapper.detail(aptFacRsvtNo);
	}

	@Override
	public int getTotal(Map<String, Object> listMap) {
		return this.airportFacilityMapper.getTotal(listMap);
	}

	@Override
	public List<AirportFacilityRSVVO> list1(Map<String,Object> listMap) {
		return this.airportFacilityMapper.list1(listMap);
	}

	@Override
	public int update(AirportFacilityRSVVO airportFacilityRSVVO) {
		airportFacilityRSVVO.setAptFacRsvtYmd(airportFacilityRSVVO.getAptFacRsvtYmd().replaceAll("-", ""));
		
		return this.airportFacilityMapper.update(airportFacilityRSVVO);
	}

	@Override
	public int delete(String aptFacRsvtNo) {
		return this.airportFacilityMapper.delete(aptFacRsvtNo);
	}
	
	
	

}
