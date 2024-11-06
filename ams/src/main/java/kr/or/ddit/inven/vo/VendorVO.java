package kr.or.ddit.inven.vo;

import lombok.Data;

@Data
public class VendorVO {
	private String vendorCd; // 거래처 코드
	private String vdrOwnerNm; // 거래처 대표자명
	private String vdrType; // 거래처 타입
	private String vdrTel; // 거래처 번호
	private String vdrAddr; // 거래처 주소
	private String vdrAddrDet; // 거래처 상세주소
	private String vdrNm; // 거래처 명
	private String vdrRegistNo; 
	
//	private ItemVO itemVO; 
//	private String itemCd; // 품목코드
//	private String itemNm; // 품목명
	
}
