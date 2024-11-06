package kr.or.ddit.inven.vo;

import lombok.Data;

@Data
public class PayAndPayVO {
	
	private String papCd; // 수불코드
	private String itemCd; // 품목코드
	private int papQty; // 입/출고 수량
	private String papStat; // 수불상태(입,출고)
	private String papSpmtYmd; // 발생일자
	
}
