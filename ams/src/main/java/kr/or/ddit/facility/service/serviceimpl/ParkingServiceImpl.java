
package kr.or.ddit.facility.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.facility.mapper.ParkingMapper;
import kr.or.ddit.facility.service.ParkingService;
import kr.or.ddit.facility.vo.ParkingRsvtVO;
import kr.or.ddit.userPass.vo.CustInfo;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ParkingServiceImpl implements ParkingService {

	@Autowired
	ParkingMapper parkingMapper;

	@Override
	public String regist() {
		// TODO Auto-generated method stub
		return this.parkingMapper.regist();
	}

	@Override
	public int registPost(ParkingRsvtVO parkingRsvtVO) {
		log.info("registPost ServiceImpl -> parkingRsvtVO : " + parkingRsvtVO);

		int result = 0;

		result = this.parkingMapper.registPost(parkingRsvtVO);

		log.info("registPost ServiceImpl -> result : " + result);

//		return this.parkingMapper.registPost(parkingRsvtVO);
		return result;
	}

	@Override
	public int delete(ParkingRsvtVO parkingRsvtVO) {
		int result = 0;

//		long fileGroupNo = parkingRsvtVO.getFileGroupNo();

		// 1) 업로드된 파일 삭제
//		if (fileGroupNo != 0) {
//			result += this.parkingMapper.deleteFile(fileGroupNo);
//			log.info("delete -> deleteFile : " + result);
//		}

		result += this.parkingMapper.delete(parkingRsvtVO);

		log.info("delete -> delete : " + result);

		return result;
	}

	@Override
	public ParkingRsvtVO detail(String parkingRsvtVO) {
		return this.parkingMapper.detail(parkingRsvtVO);
	}

	@Override
	public List<ParkingRsvtVO> list(CustInfo custInfoVO) {
		return this.parkingMapper.list(custInfoVO);
	}

	@Override
	public int update(ParkingRsvtVO parkingRsvtVO) {
		return this.parkingMapper.update(parkingRsvtVO);
	}
}
