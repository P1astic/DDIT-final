package kr.or.ddit.approv.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.approv.vo.TemplateSectionVO;


/**
 * @author 김인호 결재서 관련 SQL 처리 매퍼 24.09.19. 최초생성
 *
 */
@Mapper
public interface TemplateSectionMapper {
	
	public List<TemplateSectionVO> templateList();
}
