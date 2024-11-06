package kr.or.ddit.auth.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.vo.AuthMenuVO;
import kr.or.ddit.comn.vo.MnVO;

/**
 * @author 홍정호 24.9.13. 최초생성
 * 권한관련 서비스를 처리하기 위한 파일
 *
 */
public interface AuthService {
	
	/**
	 * @author 홍정호 24.9.13. 최초생성 권한 목록을 가지고 오기 위함
	 */
	public List<AuthVO> authList();
	
	
	/**
	 * @param 홍정호 24.9.22. 권한별 메뉴 설정을 업데이트하기 위한 메서드
	 * @return
	 */
	public int menuSave(String authCode, List<MnVO> mnVOList);


	public int authCheck(AuthVO authVO);


	public int registAuth(AuthVO authVO);


	public int registAuthMenu(AuthVO authVO);


	public int deleteAuthMenu(AuthVO authVO);


	public int deleteAuth(AuthVO authVO);


	public int getTotal(Map<String, Object> authMap);
	
}
