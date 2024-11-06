package kr.or.ddit.comn.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.comn.vo.AuthMenuVO;
import kr.or.ddit.human.vo.MemberVO;

/**
 * @author 홍정호
 * 
 * 24.9.19. 최초 생성
 * 
 * 로그인 할 때 왼쪽 aside 메뉴에 권한 별 메뉴를 불러오기 위한 파일
 * 
 *
 */
public interface LoginService {
		List<AuthMenuVO> authMenuList(Map<String, Object> roleNamesMap);
		List<AuthMenuVO> authMenuList();

		//이메일발송
//		public void sendEmail(MemberVO vo, String div) throws Exception;
		
}


