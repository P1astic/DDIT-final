package kr.or.ddit.facility.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.facility.vo.ParkingRsvtVO;
import kr.or.ddit.userPass.vo.CustInfo;

@Mapper
public interface ParkingMapper {

	public String regist();
	

	public int registPost(ParkingRsvtVO parkingRsvtVO); 
	public List<ParkingRsvtVO> list(CustInfo custInfoVO);


	public int delete(ParkingRsvtVO parkingRsvtVO);


	public int update(ParkingRsvtVO parkingRsvtVO);


	public ParkingRsvtVO detail(String parkingRsvtVO); 
	

	
}
