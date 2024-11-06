package kr.or.ddit.facility.service;

import java.util.List;

import kr.or.ddit.facility.vo.ParkingRsvtVO;
import kr.or.ddit.facility.vo.ParkingVO;
import kr.or.ddit.userPass.vo.CustInfo;

public interface ParkingService {

	


	/**주차예약폼
	 */
	public String regist();
	

	public int registPost(ParkingRsvtVO parkingRsvtVO);


	public int delete(ParkingRsvtVO parkingRsvtVO);


	public ParkingRsvtVO detail(String prkRsvtNo);


	public List<ParkingRsvtVO> list(CustInfo custInfoVO);


	public int update(ParkingRsvtVO parkingRsvtVO); 

	
	
}
