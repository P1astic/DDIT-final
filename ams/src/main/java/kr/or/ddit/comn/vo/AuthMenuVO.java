package kr.or.ddit.comn.vo;

import java.util.List;

import lombok.Data;

@Data
public class AuthMenuVO {
	private String authCode;
	private String mnCd;
	private String useYn;
	
	private List<MnVO> mnVOList;
}
