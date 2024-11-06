package kr.or.ddit.inven.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.inven.vo.InventoryVO;
import kr.or.ddit.inven.vo.ItemMidVO;
import kr.or.ddit.inven.vo.ItemOrderVO;
import kr.or.ddit.inven.vo.ItemSmallVO;
import kr.or.ddit.inven.vo.ItemVO;
import kr.or.ddit.inven.vo.PayAndPayVO;
import kr.or.ddit.inven.vo.VendorVO;


/**
 * @author 김인호 품목관련 SQL 처리 Mapper 24.9.30. 최초생성
 *
 */
@Mapper
public interface InventoryMapper {
	
	// 24.09.30 김인호 재고 리스트
	public List<InventoryVO> list(Map<String, Object> listMap);
	
	// 24.09.30 김인호 수불부
	public ItemVO itemDetail(String itemCd);
	
	// 24.10.01 김인호 수정
	public int itemUpdate(ItemVO itemVO);
	
	// 24.10.01 김인호 소분류 코드
	public List<ItemSmallVO> itemSmallList();
	
	public List<ItemMidVO> itemMidList();
	
	// 24.10.01 김인호 
	public List<VendorVO> vendorList();
	
	// 24.10.01 김인호
	public int itemInsert(ItemVO itemVO);
	
	public List<ItemVO> itemList(Map<String, Object> itemMap);

	public int getTotal(Map<String,Object> itemMap);

	public int getTotal2(Map<String, Object> itemMap);

	public List<ItemSmallVO> itemSdetail(String itemMCd);

	public List<ItemSmallVO> itemSmallList2(String itemM);

	public int itemDelete(String itemCd);

	public List<ItemVO> itemList2();

	public VendorVO vendorDetail(String vendorCd);

	public List<ItemVO> itemDetail2(String vendorCd);

	public ItemVO itemCdDetail(String itemCd);

	public int orderInsert(ItemOrderVO itemOrderVO);

	public ItemOrderVO itemOrderDetail(String orderNo);

	public ItemOrderVO itemOrderDetail(long orderNo);

	public int itemOderUpdate(ItemOrderVO itemOrderVO);

	public InventoryVO invenList(String itemCd);

	public int invenUpdate(InventoryVO inventoryVO);

	public ItemOrderVO itemOrderList(ItemOrderVO itemOrderVO);

	public List<ItemOrderVO> totalOrderList();
	
	public List<PayAndPayVO> papList();
	
	public List<PayAndPayVO> papDetail(String itemCd);
	
	public int papInsert(PayAndPayVO payAndPayVO);
	
	public int invenInsert(InventoryVO inventoryVO);

}
