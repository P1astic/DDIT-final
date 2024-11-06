package kr.or.ddit.inven.vo;

import lombok.Data;

@Data
public class ItemMidVO {
	private String itemMCd; // 중분류 코드
	private String itemLCd; // 대분류 코드
	private String itemMNm; // 중분류명
}
