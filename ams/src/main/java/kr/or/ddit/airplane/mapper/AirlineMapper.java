package kr.or.ddit.airplane.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.airplane.vo.AirLineVO;



/**
 * @author 김인호 항공사 관련 SQL 처리 매퍼 24.09.19. 최초생성
 *
 */
@Mapper
public interface AirlineMapper {
	
	public List<AirLineVO> airlineList();

	// 24.09.27 김예영 항공사 이름 불러오기 위해 생성
	public AirLineVO getAirLineNm(String memId);
}
