package kr.or.ddit.inven.vo;

import java.util.List;

import lombok.Data;

@Data
public class ItemVO {
	private String itemCd; // 품목 코드
	private String itemNm; // 품목 명
	private String itemStndrd; // 품목 규격
	private int itemUntprc; // 품목 단가
	private String itemImg; // 품목 이미지경로
	private String itemSCd; // 소분류코드
	private String vendorCd; // 거래처코드
	private String rnum;
	// 24.09.30 김인호
	private InventoryVO inventoryVO; // 재고
	private List<PayAndPayVO> payAndPayVO; // 수불부
	
	private ItemSmallVO itemSmallVO; // 소분류
	private ItemMidVO itemMidVO; // 중분류
	private VendorVO vendorVO; // 제조사
}
