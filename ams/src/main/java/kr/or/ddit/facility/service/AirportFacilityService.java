package kr.or.ddit.facility.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.facility.vo.AirportFacilityRSVVO;
import kr.or.ddit.facility.vo.AirportFacilityVO;

/**
 * 
 * @author 김인호
 * @Date 24.10.04
 */
public interface AirportFacilityService {
	public List<AirportFacilityVO> airportFacilityList();
	
	public List<AirportFacilityRSVVO> list();
	
	public int registPost(AirportFacilityRSVVO airportFacilityRSVVO);
	
	public List<AirportFacilityRSVVO> timeSetting(String aptFacRsvtYmd);
	
	public AirportFacilityRSVVO detail(String aptFacRsvtNo);

	public int getTotal(Map<String, Object> listMap);

	public List<AirportFacilityRSVVO> list1(Map<String,Object> listMap);

	public int update(AirportFacilityRSVVO airportFacilityRSVVO);

	public int delete(String aptFacRsvtNo);
}
