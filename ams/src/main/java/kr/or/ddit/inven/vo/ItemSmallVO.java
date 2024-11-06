package kr.or.ddit.inven.vo;

import lombok.Data;

@Data
public class ItemSmallVO {
	private String itemSCd; // 소분류코드
	private String itemMCd; // 중분류코드
	private String itemSNm; // 소분류 명
}
