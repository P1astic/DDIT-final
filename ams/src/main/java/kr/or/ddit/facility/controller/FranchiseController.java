package kr.or.ddit.facility.controller;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.airport.vo.FloorInfoVO;
import kr.or.ddit.comn.util.UploadController;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.facility.service.FranchiseService;
import kr.or.ddit.facility.util.FranchisePagination;
import kr.or.ddit.facility.vo.FranchiseVO;
import kr.or.ddit.facility.vo.ZoneVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/emp/franchise")
@Slf4j
@Controller
public class FranchiseController {
	
	@Inject
	FranchiseService franchiseService;
	
	@Inject
	UploadController uploadController;
	
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="contractGubun", required=false, defaultValue="") String contractGubun
			) {	
		
		Map<String, Object> franchiseMap = new HashMap<String, Object>();
		
		franchiseMap.put("gubun", gubun);
		franchiseMap.put("keyword", keyword);
		franchiseMap.put("currentPage", currentPage);
		franchiseMap.put("contractGubun", contractGubun);

		log.info("franchiseMap : " + franchiseMap);
		
		//total은 페이지네이션의 중요한 역할을 함
		int total = this.franchiseService.getTotal(franchiseMap);
		
		List<FranchiseVO> franchiseVOList = this.franchiseService.getList(franchiseMap);
		
		for (int i = 0; i < franchiseVOList.size(); i++) {
		    String telNo = franchiseVOList.get(i).getBpVO().getBpTelno();
		    
		    if (telNo == null) {
		        telNo = "-";
		    } else {
		        if (telNo.matches("^010\\d{8}$")) {
		            // 010-1234-5678 형식
		            telNo = telNo.replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
		        } else if (telNo.matches("^042\\d{7}$")) {
		            // 042-123-5678 형식
		            telNo = telNo.replaceFirst("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
		        } else if (telNo.matches("^02\\d{7}$")) {
		            // 02-123-4567 형식
		            telNo = telNo.replaceFirst("(\\d{2})(\\d{3})(\\d{4})", "$1-$2-$3");
		        } else if (telNo.matches("^070\\d{8}$")) {
		            // 070-1234-5678 형식
		            telNo = telNo.replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
		        } else if (telNo.matches("^02\\d{8}$")) {
		            // 02-1234-5678 형식
		            telNo = telNo.replaceFirst("(\\d{2})(\\d{4})(\\d{4})", "$1-$2-$3");
		        }
		    }

		    // 변환된 전화번호 저장
		    log.info("telNo : " + telNo);
		    franchiseVOList.get(i).getBpVO().setBpTelno(telNo);
		}
		
		
		log.info("list -> franchiseVOList : " + franchiseVOList);
		log.info("list -> franchiseVOList size: " + franchiseVOList.size());
		
		
		FranchisePagination<FranchiseVO> articlePage = new FranchisePagination<FranchiseVO>(total, currentPage, 15, franchiseVOList, franchiseMap);
		
		log.info("articlePage : " + articlePage);
		
		
		model.addAttribute("franchiseVOList", franchiseVOList);
		model.addAttribute("articlePage", articlePage);
		
		return "emp/franchise/list";
	}
	
	
	
	@ResponseBody
	@PostMapping("/getContractList")
	public List<CommonCodeDetailVO> getContractList() {
		
		List<CommonCodeDetailVO> contractList = this.franchiseService.getContractList();
		
		log.info("getContractList contractList : " + contractList);
		
		return contractList;
		
	}
	
	@GetMapping("/detail")
	public FranchiseVO detail(@RequestParam String memId) {
		log.info("detail memId : " + memId);
		
		FranchiseVO franchiseVO = this.franchiseService.detail(memId);
		
	    String telNo = franchiseVO.getBpVO().getBpTelno();
	    
	    if (telNo == null) {
	        telNo = "-";
	    } else {
	        if (telNo.matches("^010\\d{8}$")) {
	            // 010-1234-5678 형식
	            telNo = telNo.replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
	        } else if (telNo.matches("^042\\d{7}$")) {
	            // 042-123-5678 형식
	            telNo = telNo.replaceFirst("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
	        } else if (telNo.matches("^02\\d{7}$")) {
	            // 02-123-4567 형식
	            telNo = telNo.replaceFirst("(\\d{2})(\\d{3})(\\d{4})", "$1-$2-$3");
	        } else if (telNo.matches("^070\\d{8}$")) {
	            // 070-1234-5678 형식
	            telNo = telNo.replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
	        } else if (telNo.matches("^02\\d{8}$")) {
	            // 02-1234-5678 형식
	            telNo = telNo.replaceFirst("(\\d{2})(\\d{4})(\\d{4})", "$1-$2-$3");
	        }
	    }

	    // 변환된 전화번호 저장
	    log.info("telNo : " + telNo);
	    franchiseVO.getBpVO().setBpTelno(telNo);
		
	    String ctrtYmd = franchiseVO.getBpVO().getCtrtYmd();
        
	    log.info("detail ctrtYmd" + ctrtYmd);
	    String ctrtYmdYear = ctrtYmd.substring(0, 4); // 연도
	    String ctrtYmdMonth = ctrtYmd.substring(4, 6); // 월
	    String ctrtYmdDay = ctrtYmd.substring(6); // 일

	    log.info("detail ctrtYmdYear" + ctrtYmdYear);
	    log.info("detail ctrtYmdMonth" + ctrtYmdMonth);
	    log.info("detail ctrtYmdDay" + ctrtYmdDay);

	    // 월이 한 자리 수일 경우 두 자리로 변환
	    if(ctrtYmdMonth.length() == 1) {
	        ctrtYmdMonth = "0" + ctrtYmdMonth;
	    }

	    // 일도 한 자리 수일 경우 두 자리로 변환
	    if(ctrtYmdDay.length() == 1) {
	        ctrtYmdDay = "0" + ctrtYmdDay;
	    }

	    // 최종 날짜 포맷 구성
	    ctrtYmd = ctrtYmdYear + "-" + ctrtYmdMonth + "-" + ctrtYmdDay;

	    log.info("detail ctrtYmd" + ctrtYmd);
	    franchiseVO.getBpVO().setCtrtYmd(ctrtYmd);

		if(franchiseVO.getFrnEnterDate() != null) {
		    String enterDate = franchiseVO.getFrnEnterDate();
		    
		    log.info("detail enterDate" + enterDate);
		    
		    String enterDateYear = enterDate.substring(0, 4); // 연도
		    String enterDateMonth = enterDate.substring(4, 6); // 월
		    String enterDateDay = enterDate.substring(6); // 일

		    log.info("detail enterDateYear" + enterDateYear);
		    log.info("detail enterDateMonth" + enterDateMonth);
		    log.info("detail enterDateDay" + enterDateDay);
		    
		    // 월이 한 자리 수일 경우 두 자리로 변환
		    if(enterDateMonth.length() == 1) {
		        enterDateMonth = "0" + enterDateMonth;
		    }
		    
		    // 일도 한 자리 수일 경우 두 자리로 변환
		    if(enterDateDay.length() == 1) {
		        enterDateDay = "0" + enterDateDay;
		    }
		    
		    // 최종 날짜 포맷 구성
		    enterDate = enterDateYear + "-" + enterDateMonth + "-" + enterDateDay;
		    
		    log.info("detail enterDate" + enterDate);		
		    franchiseVO.setFrnEnterDate(enterDate);
		}

		
		String frnSeCd = franchiseVO.getFrnSeCd();
		
		frnSeCd = this.franchiseService.getCommonCodeCn(frnSeCd);
		
		franchiseVO.getCommonCodeDetailVO().setComDetCdCn(frnSeCd);
		
		return franchiseVO;
	}
	
	
	@ResponseBody
	@PostMapping("/getFloor")
	public List<CommonCodeDetailVO> getFloor(@RequestParam String floor) {
		log.info("getFloor floor : " + floor);
		List<CommonCodeDetailVO> floorVO = this.franchiseService.getFloor(floor);
		
		log.info("getFloor : " + floorVO);
		
		return floorVO;
	}
	
	@ResponseBody
	@PostMapping("/getDetFloor")
	public List<CommonCodeDetailVO> getDetFloor() {
		List<CommonCodeDetailVO> detFloorVO = this.franchiseService.getDetFloor();
		
		return detFloorVO;
	}
	
	@ResponseBody
	@PostMapping("/comparePosition")
	public List<ZoneVO> comparePosition(@RequestParam String position,
							@RequestParam String floor) {
		log.info("getFloorZone position : " + position);
		log.info("getFloorZone floor : " + floor);
		
		ZoneVO zoneVO = new ZoneVO();
		zoneVO.setZonePosition(position);
		zoneVO.setZoneFloor(floor);
		
		List<ZoneVO> compareList = this.franchiseService.comparePosition(zoneVO);
		
		log.info("comparePosition compareList : " + compareList);
		
		return compareList;
	}
	
	@ResponseBody
	@PostMapping("/update")
	public int update(@RequestParam String position,
					  @RequestParam String floor,
					  @RequestParam String zone,
					  @RequestParam String openTime,
					  @RequestParam String closeTime,
					  @RequestParam String prod,
					  @RequestParam String enterDate,
					  @RequestParam String memId,
					  @RequestParam String mapInout,
					  @RequestParam String mapImgUrl,
					  @RequestParam String mapImgNm,
					  @RequestParam String uploadFile,
					  @RequestParam String mapNm,
					  @RequestParam String mapId) {
		
		log.info("update uploadFile : " + uploadFile);
		
		FranchiseVO franchiseVO = new FranchiseVO();
		log.info("update franchiseVO : " + franchiseVO);
		
		FloorInfoVO floorInfoVO = new FloorInfoVO();
		floorInfoVO.setMapNm(mapNm);
		floorInfoVO.setMapId(mapId);
		floorInfoVO.setMapInout(mapInout);
		floorInfoVO.setMapImgUrl(mapImgUrl);
		floorInfoVO.setMapImgNm(mapImgNm);
		floorInfoVO.setMapInout(mapInout);
		franchiseVO.setFloorInfoVO(floorInfoVO);
		log.info("update franchiseVO.floorInfoVO : " + franchiseVO.getFloorInfoVO());
		log.info("update franchiseVO.floorInfoVO.mapInout : " + franchiseVO.getFloorInfoVO().getMapInout());
				
		
		franchiseVO.setFrnPosition(position);
		log.info("position : " + position);
		franchiseVO.setFrnFloorLocation(floor);
		log.info("floor : " + floor);
		franchiseVO.setFrnZoneLocation(zone);
		log.info("zone : " + zone);
		franchiseVO.setFrnProd(prod);
		log.info("prod : " + prod);
		franchiseVO.setFrnOpenTm(openTime);
		log.info("openTime : " + openTime);
		franchiseVO.setFrnCloseTm(closeTime);
		log.info("closeTime : " + closeTime);
		franchiseVO.setFrnEnterDate(enterDate);
		log.info("enterDate : " + enterDate);
		franchiseVO.getFloorInfoVO().setMapInout(mapInout);
		log.info("mapInout : " + mapInout);
		franchiseVO.setMemId(memId);
		log.info("memId : " + memId);
		
		
		log.info("update franchiseVO : " + franchiseVO);
		
		int result = this.franchiseService.update(franchiseVO);
		
		return result;
	}
}
