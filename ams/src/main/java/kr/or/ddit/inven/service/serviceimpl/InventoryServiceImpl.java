package kr.or.ddit.inven.service.serviceimpl;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.maven.doxia.logging.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.inven.mapper.InventoryMapper;
import kr.or.ddit.inven.service.InventoryService;
import kr.or.ddit.inven.vo.InventoryVO;
import kr.or.ddit.inven.vo.ItemMidVO;
import kr.or.ddit.inven.vo.ItemOrderVO;
import kr.or.ddit.inven.vo.ItemSmallVO;
import kr.or.ddit.inven.vo.ItemVO;
import kr.or.ddit.inven.vo.PayAndPayVO;
import kr.or.ddit.inven.vo.VendorVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 김인호 24.9.30. 최초생성 재고관련 서비스 임플먼트 
 *
 */
@Transactional
@Slf4j
@Service
public class InventoryServiceImpl implements InventoryService{
	
	@Inject
	InventoryMapper inventoryMapper;

	@Override
	public List<InventoryVO> list(Map<String, Object> listMap) {
		return this.inventoryMapper.list(listMap);
	}
	
	@Override
	public ItemVO itemDetail(String itemCd) {
		return this.inventoryMapper.itemDetail(itemCd);
	};
	
	@Override
	public int itemUpdate(ItemVO itemVO) {
		return this.inventoryMapper.itemUpdate(itemVO);
	}

	@Override
	public List<ItemSmallVO> itemSmallList() {
		return this.inventoryMapper.itemSmallList();
	}

	@Override
	public List<VendorVO> vendorList() {
		return this.inventoryMapper.vendorList();
	};
	
	@Override
	public int itemInsert(ItemVO itemVO) {
		return this.inventoryMapper.itemInsert(itemVO);
	}

	@Override
	public List<ItemVO> itemList(Map<String,Object> itemMap) {
		return this.inventoryMapper.itemList(itemMap);
	}

	@Override
	public int getTotal(Map<String, Object> itemMap) {
		return this.inventoryMapper.getTotal(itemMap);
	}

	@Override
	public List<ItemMidVO> itemMidList() {
		return this.inventoryMapper.itemMidList();
	}

	@Override
	public int getTotal2(Map<String, Object> itemMap) {
		return this.inventoryMapper.getTotal2(itemMap);
	}

	@Override
	public List<ItemSmallVO> itemSdetail(String itemMCd) {
		return this.inventoryMapper.itemSdetail(itemMCd);
	}

	@Override
	public List<ItemSmallVO> itemSmallList2(String itemM) {
		return this.inventoryMapper.itemSmallList2(itemM);
	}

	@Override
	public int itemDelete(String itemCd) {
		return this.inventoryMapper.itemDelete(itemCd);
	}

	@Override
	public List<ItemVO> itemList2() {
		return this.inventoryMapper.itemList2();
	}

	@Override
	public VendorVO vendorDetail(String vendorCd) {
		return this.inventoryMapper.vendorDetail(vendorCd);
	}

	@Override
	public List<ItemVO> itemDetail2(String vendorCd) {
		return this.inventoryMapper.itemDetail2(vendorCd);
	}

	@Override
	public ItemVO itemCdDetail(String itemCd) {
		return this.inventoryMapper.itemCdDetail(itemCd);
	}

	@Override
	public int orderInsert(ItemOrderVO itemOrderVO) {
		
		itemOrderVO.setOrderDueYmd(itemOrderVO.getOrderDueYmd().replaceAll("-", ""));
		log.info("납기일자"+itemOrderVO.getOrderDueYmd());
		
		return this.inventoryMapper.orderInsert(itemOrderVO);
	}

	@Override
	public ItemOrderVO itemOrderDetail(long orderNo) {
		return this.inventoryMapper.itemOrderDetail(orderNo);
	}
	
	@Transactional
	@Override
	public int itemOderUpdate(ItemOrderVO itemOrderVO) {
		log.info("하이~~");
		int result = this.inventoryMapper.itemOderUpdate(itemOrderVO);
		ItemOrderVO itemOrderVO2 = this.inventoryMapper.itemOrderList(itemOrderVO);
		if(itemOrderVO2.getOrderStatus().equals("Y")) {
			String itemCd = itemOrderVO2.getItemCd();
			InventoryVO inventoryVO = this.inventoryMapper.invenList(itemCd);
			log.info("impl inventoryVO : "+inventoryVO);
			if(inventoryVO == null) {
				InventoryVO inventoryVO3 = new InventoryVO();
				inventoryVO3.setItemCd(itemCd);
				inventoryVO3.setInvenCurrent(itemOrderVO2.getOrderQty());
				
				result += this.inventoryMapper.invenInsert(inventoryVO3);
				
			}else {
				inventoryVO.setInvenCurrent(inventoryVO.getInvenCurrent()+itemOrderVO2.getOrderQty());
				result += this.inventoryMapper.invenUpdate(inventoryVO);
			}
			
			PayAndPayVO payAndPayVO = new PayAndPayVO();
			log.info("payAndPayVO : "+payAndPayVO);
			payAndPayVO.setPapStat("IN");
			payAndPayVO.setItemCd(itemCd);
			payAndPayVO.setPapQty(itemOrderVO2.getOrderQty());
			
			result += this.inventoryMapper.papInsert(payAndPayVO);
			
			return result;
		}
		
		return result;
	}

	@Override
	public List<ItemOrderVO> totalOrderList() {
		return this.inventoryMapper.totalOrderList();
	}

	@Override
	public List<PayAndPayVO> papDetail(String itemCd) {
		return this.inventoryMapper.papDetail(itemCd);
	}


}
