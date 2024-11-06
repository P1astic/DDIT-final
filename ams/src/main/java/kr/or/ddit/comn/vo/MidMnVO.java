package kr.or.ddit.comn.vo;

import java.util.List;

import lombok.Data;

@Data
public class MidMnVO {
	private String midmnCd;
	private String midmnTitle;
	private String midmnUrl;
	
	private List<SmMnVO> smMnVOList;
}
