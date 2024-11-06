package kr.or.ddit.comn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.comn.vo.AuthMenuVO;
import kr.or.ddit.comn.vo.BigMnVO;
import kr.or.ddit.comn.vo.MidMnVO;
import kr.or.ddit.comn.vo.SmMnVO;

@Mapper
public interface LoginMapper {
	
	public List<AuthMenuVO> authMenuList(@Param("hashMap") Map<String, Object> roleNamesMap);
	public List<AuthMenuVO> authMenuList();
	
}
