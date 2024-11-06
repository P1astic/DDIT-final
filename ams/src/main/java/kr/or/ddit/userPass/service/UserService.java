package kr.or.ddit.userPass.service;

import org.springframework.stereotype.Service;

@Service
public interface UserService {

	void certifiedPhoneNumber(String userPhoneNum, String numStr);

}
