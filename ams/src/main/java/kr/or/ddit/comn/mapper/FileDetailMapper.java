package kr.or.ddit.comn.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.comn.vo.FileDetailVO;

@Mapper
public interface FileDetailMapper {
	
	//파일그룹 번호 가져오기
	public long getFileGroupNo();

	//FILE_DETAIL 테이블에 insert
	public int insertFileDetail(FileDetailVO fileDetailVO);
}
