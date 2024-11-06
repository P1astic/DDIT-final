package kr.or.ddit.airplane.service;

import java.util.List;

import kr.or.ddit.airplane.vo.AirLineVO;



/**
 * @author 김인호 24.09.19. 최초생성
 * 항공사 서비스를 처리하기 위한 파일
 *
 */
public interface AirlineService {
	
	public List<AirLineVO> airlineList();
	
	// 24.09.27 김예영 항공사 이름 불러오기 위해 생성
	public AirLineVO getAirLineNm(String memId);

}
