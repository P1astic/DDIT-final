package kr.or.ddit.facility.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.facility.vo.FranchiseVO;
import kr.or.ddit.facility.vo.ZoneVO;

public interface FranchiseService {

	public List<FranchiseVO> getList(Map<String, Object> franchiseMap);

	public List<CommonCodeDetailVO> getContractList();

	public int getTotal(Map<String, Object> franchiseMap);

	public FranchiseVO detail(String memId);

	public String getCommonCodeCn(String frnSeCd);

	public List<CommonCodeDetailVO> getFloor(String floor);

	public List<CommonCodeDetailVO> getDetFloor();

	public List<ZoneVO> comparePosition(ZoneVO zoneVO);

	public int update(FranchiseVO franchiseVO);


}
