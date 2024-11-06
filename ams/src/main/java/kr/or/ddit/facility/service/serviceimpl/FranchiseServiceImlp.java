package kr.or.ddit.facility.service.serviceimpl;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.facility.mapper.FranchiseMapper;
import kr.or.ddit.facility.service.FranchiseService;
import kr.or.ddit.facility.vo.FranchiseVO;
import kr.or.ddit.facility.vo.ZoneVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FranchiseServiceImlp implements FranchiseService {
	
	@Inject
	FranchiseMapper franchiseMapper;

	@Override
	public List<FranchiseVO> getList(Map<String, Object> franchiseMap) {
		return this.franchiseMapper.getList(franchiseMap);
	}

	@Override
	public List<CommonCodeDetailVO> getContractList() {
		return this.franchiseMapper.getContractList();
	}

	@Override
	public int getTotal(Map<String, Object> franchiseMap) {
		return this.franchiseMapper.getTotal(franchiseMap);
	}

	@Override
	public FranchiseVO detail(String memId) {
		return this.franchiseMapper.detail(memId);
	}

	@Override
	public String getCommonCodeCn(String frnSeCd) {
		return this.franchiseMapper.getCommonCodeCn(frnSeCd);
	}

	@Override
	public List<CommonCodeDetailVO> getFloor(String floor) {
		return this.franchiseMapper.getFloor(floor);
	}

	@Override
	public List<CommonCodeDetailVO> getDetFloor() {
		return this.franchiseMapper.getDetFloor();
	}

	@Override
	public List<ZoneVO> comparePosition(ZoneVO zoneVO) {
		return this.franchiseMapper.comparePosition(zoneVO);
	}

	@Override
	public int update(FranchiseVO franchiseVO) {
		int result = 0;
		log.info("update 도착 1");
		log.info("update franchiseVO : " + franchiseVO);

		// 0. 기존 franchiseVO 가져오기
		String memId = franchiseVO.getMemId();
		FranchiseVO beforeFranchiseVO = this.franchiseMapper.detail(memId);
		log.info("beforeFranchiseVO : " + beforeFranchiseVO);
		
		// 1.franchise 테이블 업데이트
		result += this.franchiseMapper.frnachiseUpdate(franchiseVO);
		log.info("update 도착 2");
		log.info("update frnachiseUpdate Result : " + result);
		
		// 2.floorInfo 테이블 업데이트
		result += this.franchiseMapper.floorInfoUpdate(franchiseVO);
		log.info("update 도착 3");
		log.info("update floorInfoUpdate Result : " + result);
		
		
		// 3. 위치가 바뀌었다면 해당 위치 'Y' 처리
		String beforePosition = beforeFranchiseVO.getFrnPosition();
		String newZone = "";
		String newFloor = "";
		
		// 3-1. 새로 추가된 시설이라면 이전 값이 없으므로 새로 받아온 데이터를 저장
		if(beforePosition == null) {
			log.info(" franchiseVO.getFrnPosition() : " + franchiseVO.getFrnPosition());
			beforePosition = franchiseVO.getFrnPosition();
			newFloor = franchiseVO.getFrnFloorLocation();
		}
		
		if(beforePosition != null && beforePosition.equals("국내선")) {
			beforePosition = "AA";
		} else {
			beforePosition = "AB";
		}
		
		beforeFranchiseVO.setFrnPosition(beforePosition);
		beforeFranchiseVO.setFrnFloorLocation(newFloor);
		
		if(beforeFranchiseVO.getFrnZoneLocation() == null) {
			newZone = franchiseVO.getFrnZoneLocation();
			beforeFranchiseVO.setFrnZoneLocation(newZone);
			
			log.info("beforeFranchiseVO.getFrnZoneLocation : " + beforeFranchiseVO.getFrnZoneLocation());

			ZoneVO zoneVO = new ZoneVO();
			zoneVO.setZonePosition(franchiseVO.getFrnPosition());
			zoneVO.setZoneFloor(franchiseVO.getFrnFloorLocation());
			zoneVO.setZoneSection(franchiseVO.getFrnZoneLocation());
			
			log.info("zoneVO : " + zoneVO);
			
			result += this.franchiseMapper.updateZone(zoneVO);
			log.info("update 도착 4-1");
			log.info("update updateZone Result : " + result);
		} else if(!beforeFranchiseVO.getFrnZoneLocation().equals(franchiseVO.getFrnZoneLocation())) {
			
				ZoneVO zoneVO = new ZoneVO();
				zoneVO.setZonePosition(franchiseVO.getFrnPosition());
				zoneVO.setZoneFloor(franchiseVO.getFrnFloorLocation());
				zoneVO.setZoneSection(franchiseVO.getFrnZoneLocation());
				
				result += this.franchiseMapper.updateZone(zoneVO);
				log.info("update 도착 4");
				log.info("update updateZone Result : " + result);
				
				// 4. 기존에 사용하던 위치 'N' 처리
				ZoneVO zoneVOSec = new ZoneVO();
				zoneVOSec.setZonePosition(beforeFranchiseVO.getFrnPosition());
				zoneVOSec.setZoneFloor(beforeFranchiseVO.getFrnFloorLocation());
				zoneVOSec.setZoneSection(beforeFranchiseVO.getFrnZoneLocation());
				
				result += this.franchiseMapper.updateBeforeZone(zoneVOSec);
				log.info("update 도착 5");
				log.info("update updateBeforeZone Result : " + result);
			
		}
		
		return result;
	}

}
