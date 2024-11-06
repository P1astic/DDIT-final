package kr.or.ddit.inven.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.inven.vo.InventoryVO;
import kr.or.ddit.inven.vo.ItemMidVO;
import kr.or.ddit.inven.vo.ItemOrderVO;
import kr.or.ddit.inven.vo.ItemSmallVO;
import kr.or.ddit.inven.vo.ItemVO;
import kr.or.ddit.inven.vo.PayAndPayVO;
import kr.or.ddit.inven.vo.VendorVO;

/**
 * @author 김인호 24.9.30. 최초생성
 * 품목관련 서비스를 처리하기 위한 파일
 *
 */
public interface InventoryService {
	
	public List<InventoryVO> list(Map<String, Object> listMap);
	
	public ItemVO itemDetail(String itemCd);

	public int itemUpdate(ItemVO itemVO);

	public List<ItemSmallVO> itemSmallList();

	public List<VendorVO> vendorList();

	public int itemInsert(ItemVO itemVO);

	public List<ItemVO> itemList(Map<String, Object> itemMap);

	public int getTotal(Map<String, Object> itemMap);

	public int getTotal2(Map<String, Object> itemMap);
	
	public List<ItemMidVO> itemMidList();

	public List<ItemSmallVO> itemSdetail(String itemMCd);

	public List<ItemSmallVO> itemSmallList2(String itemM);

	public int itemDelete(String itemCd);

	public List<ItemVO> itemList2();

	public VendorVO vendorDetail(String vendorCd);

	public List<ItemVO> itemDetail2(String vendorCd);

	public ItemVO itemCdDetail(String itemCd);

	public int orderInsert(ItemOrderVO itemOrderVO);


	public ItemOrderVO itemOrderDetail(long orderNo);

	public int itemOderUpdate(ItemOrderVO itemOrderVO);

	public List<ItemOrderVO> totalOrderList();

	public List<PayAndPayVO> papDetail(String itemCd);
}
