package kr.or.ddit.airport.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.airplane.service.AirlineService;
import kr.or.ddit.airplane.vo.AirLineVO;
import kr.or.ddit.airport.service.FloorInfoService;
import kr.or.ddit.airport.vo.FloorInfoVO;
import kr.or.ddit.facility.vo.FranchiseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FloorInfoController {
	
	@Inject
	FloorInfoService floorService;
	
	
	@GetMapping("/cust/floorInfo/info")
	public String test() {
		return "cust/floorInfo/info";
	}
	
	@ResponseBody
	@PostMapping("/cust/floorInfo/getList")
	public List<FloorInfoVO> getList(@RequestParam String frnFloorLocation) {
		log.info("frnFloorLocation : " + frnFloorLocation);
		
		List<FloorInfoVO> floorInfoVOList = this.floorService.getList(frnFloorLocation);
		
		log.info("floorInfoVOList : " + floorInfoVOList);
		
		return floorInfoVOList;
	}
	
	@ResponseBody
	@PostMapping("/cust/floorInfo/getInfo")
	public FloorInfoVO getInfo(@RequestParam String mapId) {
		log.info("mapId : " + mapId);
		
		FloorInfoVO floorInfoVO = this.floorService.getInfo(mapId);
		
		log.info("floorInfoVO : " + floorInfoVO);
		
		return floorInfoVO;
	}
	
	@ResponseBody
	@PostMapping(value="/cust/floorInfo/getType", produces = "application/text; charset=utf8")	// 한글 인코딩이 안되어서 이렇게 설정해야함
	public String getType(@RequestParam String comDetCd) {
		log.info("comDetCd : " + comDetCd);
		
		String typeNm = this.floorService.getType(comDetCd);
		
		return typeNm;
	}

	@ResponseBody
	@PostMapping("/cust/floorInfo/getDetail")
	public FranchiseVO getDetail(@RequestParam String memId) {
		log.info("memId : " + memId);
		
		FranchiseVO franchiseVO = this.floorService.getDetail(memId);
		
		return franchiseVO;
	}
	
	@GetMapping("/bp/floorInfo/inList")
	public String bpInList() {
		
		return "bp/floorInfo/inList";
	}

	@GetMapping("/bp/floorInfo/outList")
	public String bpOutList() {
		
		return "bp/floorInfo/outList";
	}
	
	@ResponseBody
	@PostMapping("/bp/floorInfo/getCounter")
	public List<FloorInfoVO> getInCounter(@RequestParam String memId, @RequestParam String mapFloor, @RequestParam String mapInout) {
		log.info("getCounter memId : " + memId);
		log.info("getCounter mapFloor : " + mapFloor);
		log.info("getCounter mapInout : " + mapInout);
		
		FloorInfoVO floorInfoVO = new FloorInfoVO();
		floorInfoVO.setMemId(memId);
		floorInfoVO.setMapFloor(mapFloor);
		floorInfoVO.setMapInout(mapInout);
		
		List<FloorInfoVO> floorInfoVOList = this.floorService.getCounter(floorInfoVO);
		
		log.info("getCounter floorInfoVOList : " + floorInfoVOList);
		
		return floorInfoVOList;
	}
}
