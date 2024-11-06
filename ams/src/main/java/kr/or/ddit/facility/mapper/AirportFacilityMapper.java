package kr.or.ddit.facility.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.facility.vo.AirportFacilityRSVVO;
import kr.or.ddit.facility.vo.AirportFacilityVO;
import kr.or.ddit.facility.vo.SecurityCompanyVO;
import kr.or.ddit.facility.vo.SecurityFacilityVO;
import kr.or.ddit.facility.vo.SecurityWorkerVO;

@Mapper
public interface AirportFacilityMapper {
	
	public List<AirportFacilityVO> airportFacilityList();
	
	// 시설예약 리스트
	public List<AirportFacilityRSVVO> list();
	
	public int registPost(AirportFacilityRSVVO airportFacilityRSVVO);
	
	public List<AirportFacilityRSVVO> timeSetting(String aptFacRsvtYmd);
	
	public AirportFacilityRSVVO detail(String aptFacRsvtNo);

	public int getTotal(Map<String, Object> listMap);

	public List<AirportFacilityRSVVO> list1(Map<String,Object> listMap);

	public int update(AirportFacilityRSVVO airportFacilityRSVVO);

	public int delete(String aptFacRsvtNo);
    
}