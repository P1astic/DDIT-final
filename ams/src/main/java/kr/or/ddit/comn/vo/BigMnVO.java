package kr.or.ddit.comn.vo;

import java.util.List;

import lombok.Data;

@Data
public class BigMnVO {
	private String bigmnCd;
	private String bigmnTitle;
	private String bigmnUrl;
	
	private List<MidMnVO> midMnVOList;
}
