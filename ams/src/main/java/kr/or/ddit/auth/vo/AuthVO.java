package kr.or.ddit.auth.vo;

import lombok.Data;

/**
 * @author 홍정호
 * 2024.09.13. 권한 테이블 VO
 *
 */
@Data
public class AuthVO {
	private String authCode; //권한코드
	private String authNm; //권한명
}
