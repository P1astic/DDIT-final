package kr.or.ddit.airplane.service.serviceimpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.airplane.mapper.AirlineMapper;
import kr.or.ddit.airplane.service.AirlineService;
import kr.or.ddit.airplane.vo.AirLineVO;

/**
 * @author 김인호 24.09.19. 최초생성 - 항공사 서비스 임플먼트
 *
 */
@Service
public class AirlineServiceImpl implements AirlineService{
	
	@Inject
	AirlineMapper airlineMapper;
	
	@Override
	public List<AirLineVO> airlineList(){
		return this.airlineMapper.airlineList();
	}

	// 24.09.27 김예영 항공사 이름 불러오기 위해 생성
	@Override
	public AirLineVO getAirLineNm(String memId) {
		return this.airlineMapper.getAirLineNm(memId);
	}

}
