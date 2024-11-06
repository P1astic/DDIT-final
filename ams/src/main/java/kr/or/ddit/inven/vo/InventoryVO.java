package kr.or.ddit.inven.vo;

import lombok.Data;

@Data
public class InventoryVO {
	private String itemCd; // 품목코드
	private int invenCurrent; // 현재고
	private int invenSfinvc; //안전재고
	private int invenPlanQty; // 발주계획수량
	private int inventoryLocNo; // 재고위치번호
}
