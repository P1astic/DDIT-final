package kr.or.ddit.comn.service.serviceimpl;

import java.util.List;
import java.util.Map;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.comn.mapper.LoginMapper;
import kr.or.ddit.comn.service.LoginService;
import kr.or.ddit.comn.vo.AuthMenuVO;
import kr.or.ddit.comn.vo.BigMnVO;
import kr.or.ddit.comn.vo.MidMnVO;
import kr.or.ddit.comn.vo.SmMnVO;
import kr.or.ddit.human.vo.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginMapper loginMapper;
	
	@Override
	public List<AuthMenuVO> authMenuList(Map<String, Object> roleNamesMap) {
		// TODO Auto-generated method stub
		return this.loginMapper.authMenuList(roleNamesMap);
	}
	
	@Override
	public List<AuthMenuVO> authMenuList() {
		// TODO Auto-generated method stub
		return this.loginMapper.authMenuList();
	}
}
