package kr.or.ddit.auth.service.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.auth.mapper.AuthMapper;
import kr.or.ddit.auth.service.AuthService;
import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.vo.AuthMenuVO;
import kr.or.ddit.comn.vo.MnVO;

/**
 * @author 홍정호 24.9.13. 최초생성 - 권한 서비스 임플먼트
 *
 */
@Service
public class AuthServiceImpl implements AuthService{

	@Autowired
	AuthMapper authMapper;
	
	@Override
	public List<AuthVO> authList() {
		// TODO Auto-generated method stub
		return this.authMapper.authList();
	}

	@Override
	public int menuSave(String authCode, List<MnVO> mnVOList) {
		// TODO Auto-generated method stub
		return this.authMapper.menuSave(authCode, mnVOList);
	}

	@Override
	public int authCheck(AuthVO authVO) {
		// TODO Auto-generated method stub
		return this.authMapper.authCheck(authVO);
	}

	@Override
	public int registAuth(AuthVO authVO) {
		// TODO Auto-generated method stub
		return this.authMapper.registAuth(authVO);
	}

	@Override
	public int registAuthMenu(AuthVO authVO) {
		// TODO Auto-generated method stub
		return this.authMapper.registAuthMenu(authVO);
	}

	@Override
	public int deleteAuthMenu(AuthVO authVO) {
		// TODO Auto-generated method stub
		return this.authMapper.deleteAuthMenu(authVO);
	}

	@Override
	public int deleteAuth(AuthVO authVO) {
		// TODO Auto-generated method stub
		return this.authMapper.deleteAuth(authVO);
	}

	@Override
	public int getTotal(Map<String, Object> authMap) {
		// TODO Auto-generated method stub
		return this.authMapper.getTotal(authMap);
	}

}
