package kr.or.ddit.approv.service.serviceimpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.approv.mapper.TemplateSectionMapper;
import kr.or.ddit.approv.service.TemplateSectionService;
import kr.or.ddit.approv.vo.TemplateSectionVO;

/**
 * @author 김인호 24.09.19. 최초생성 - 결재서양식 서비스 임플먼트
 *
 */
@Service
public class TemplateSectionServiceImpl implements TemplateSectionService{

	@Inject
	TemplateSectionMapper templateSectionMapper;
	
	@Override
	public List<TemplateSectionVO> templateList() {
		return this.templateSectionMapper.templateList();
	}


}
