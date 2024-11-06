package kr.or.ddit.auth.vo;

import lombok.Data;

@Data
public class AuthLinkVO {
	// 사용자
	private String memId;
	private String authCode;
}
