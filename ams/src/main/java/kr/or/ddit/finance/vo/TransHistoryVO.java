package kr.or.ddit.finance.vo;

import kr.or.ddit.inven.vo.VendorVO;
import lombok.Data;

@Data
public class TransHistoryVO {
	private String transHistoryNo;
	private String transDate;
	private String vendorCd;
	private String transReason;
	private int transAmt;
	private String transType;
	
	
	private VendorVO vendorVO;
}
