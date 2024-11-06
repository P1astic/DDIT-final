package kr.or.ddit.inven.vo;

import kr.or.ddit.human.vo.EmployeeVO;
import lombok.Data;

@Data
public class ItemOrderVO {
	private long orderNo; // 발주번호
	private String elecApvNo; // 문서번호
	private String memId; // 발주담당자
	private String orderRegYmd; // 발주일자
	private String orderDueYmd; // 납기일자
	private int orderQty; // 발주수량
	private int orderAmt; // 발주금액
	private String orderStatus; // 입고상태
	private String itemCd; // 품목코드
	
	private EmployeeVO employeeVO;
	private ItemVO itemVO;
	private VendorVO vendorVO;
	
}
