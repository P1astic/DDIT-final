package kr.or.ddit.airplane.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.airplane.vo.AirLineVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;

@Mapper
public interface AirplaneMapper {

	List<CommonCodeDetailVO> getNationName();

	List<CommonCodeDetailVO> getAirLineName();

	List<AirLineVO> getAirLines();

}
