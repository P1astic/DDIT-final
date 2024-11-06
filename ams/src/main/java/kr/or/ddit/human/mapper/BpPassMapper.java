package kr.or.ddit.human.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.human.vo.PassRegistVO;

@Mapper
public interface BpPassMapper {

	int requestRegistPdf(@Param("passRegistVO") PassRegistVO passRegistVO);

	List<PassRegistVO> requestList(Map<String, Object> requestMap);

	int getRequestTotal(Map<String, Object> requestMap);

	FileDetailVO passRequestImage(@Param("passRegistVO") PassRegistVO passRegistVO);

	int requestAccept(@Param("passRegistVO") PassRegistVO passRegistVO);

	int requestDecline(@Param("passRegistVO") PassRegistVO passRegistVO);

}
