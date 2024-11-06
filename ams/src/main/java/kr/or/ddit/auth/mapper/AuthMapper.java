package kr.or.ddit.auth.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.vo.MnVO;

/**
 * @author 홍정호 권한관련 SQL 처리 매퍼 24.9.13. 최초생성
 *
 */
@Mapper
public interface AuthMapper {
	
	public List<AuthVO> authList();

	public int menuSave(@Param("authCode") String authCode, @Param("mnVOList")List<MnVO> mnVOList);

	public int authCheck(@Param("authVO") AuthVO authVO);

	public int registAuth(@Param("authVO") AuthVO authVO);

	public int registAuthMenu(@Param("authVO") AuthVO authVO);

	public int deleteAuthMenu(@Param("authVO") AuthVO authVO);

	public int deleteAuth(@Param("authVO") AuthVO authVO);

	public int getTotal(Map<String, Object> authMap);
}
