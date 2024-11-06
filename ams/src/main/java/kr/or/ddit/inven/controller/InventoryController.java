package kr.or.ddit.inven.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.inven.service.InventoryService;
import kr.or.ddit.inven.util.InventoryPagination;
import kr.or.ddit.inven.util.InventoryPagination2;
import kr.or.ddit.inven.vo.InventoryVO;
import kr.or.ddit.inven.vo.ItemMidVO;
import kr.or.ddit.inven.vo.ItemOrderVO;
import kr.or.ddit.inven.vo.ItemSmallVO;
import kr.or.ddit.inven.vo.ItemVO;
import kr.or.ddit.inven.vo.PayAndPayVO;
import kr.or.ddit.inven.vo.VendorVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/emp/inventory")
@Slf4j
@Controller
public class InventoryController {
	
	@Inject
	InventoryService inventoryService;
	
	// 24.09.30 김인호 재고현황
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Map<String,Object> listMap = new HashMap<String, Object>();
		listMap.put("gubun", gubun);
		listMap.put("keyword", keyword);
		listMap.put("currentPage", currentPage);
		log.info("listMap : "+listMap);
		
		int total2 = this.inventoryService.getTotal2(listMap);
		log.info("total2 : "+total2);
		
		List<InventoryVO> itemVOList = this.inventoryService.list(listMap);
		log.info("list -> itemVOList : "+itemVOList);
		
		List<ItemSmallVO> itemSmallVOList = this.inventoryService.itemSmallList();
		log.info("list -> itemSmallVOList : "+itemSmallVOList);
		
		List<VendorVO> vendorVOList = this.inventoryService.vendorList();
		log.info("list -> vendorVOList"+vendorVOList );
		
		InventoryPagination2<InventoryVO> articlePage = new InventoryPagination2<InventoryVO>(total2, currentPage, 15, itemVOList, listMap);
		log.info("articlepage : "+articlePage);
		
		model.addAttribute("itemVOList",itemVOList);
		model.addAttribute("itemSmallVOList",itemSmallVOList);
		model.addAttribute("vendorVOList",vendorVOList);
		model.addAttribute("articlePage",articlePage);
		
		return "emp/inventory/list";
	}
	
	// 24.10.01 김인호 자재상세
	@ResponseBody
	@GetMapping("/itemDetail")
	public ItemVO itemDetail(Model model, String itemCd) {
		log.info("itemDetail -> itemCd : "+itemCd);
		
		ItemVO itemVO = this.inventoryService.itemDetail(itemCd);
		log.info("itemDetail -> itemVO : "+itemVO);
		
		model.addAttribute("itemVO",itemVO);
		
		return itemVO;
	}
	
	// 24.10.01 김인호 
	@ResponseBody
	@PostMapping("/itemUpdate")
	public int itemUpdate(@RequestBody ItemVO itemVO) {
		log.info("itemUpdate -> itemVO : "+itemVO);
		
		
		int result = this.inventoryService.itemUpdate(itemVO);
		log.info("itemUpdate -> result : "+result);
		
		return result;
	};
	
	// 24.10.01 김인호
	@ResponseBody
	@PostMapping("/itemInsert")
	public int itemInsert(@RequestBody ItemVO itemVO) {
		log.info("itemInsert -> itemVO : "+itemVO);
		
		int result = this.inventoryService.itemInsert(itemVO);
		log.info("itemInsert -> result : "+result);
		
		return result;
	}
	
	// 24.10.02 김인호 품목 리스트
	@GetMapping("/itemList")
	public String itemList(Model model,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="itemS", required=false, defaultValue="") String itemS,
			@RequestParam(value="itemM", required=false, defaultValue="") String itemM) {
		
		Map<String,Object> itemMap = new HashMap<String,Object>();
		
		itemMap.put("gubun", gubun);
		itemMap.put("keyword", keyword);
		itemMap.put("currentPage", currentPage);
		itemMap.put("itemS", itemS);
		itemMap.put("itemM", itemM);
		log.info("itemMap : "+itemMap);
		
		int total = this.inventoryService.getTotal(itemMap);
		log.info("total : "+total);
		
		List<ItemSmallVO> itemSmallVOList = this.inventoryService.itemSmallList();
		log.info("itemList -> itemSmallVOList : "+itemSmallVOList);
		
		List<ItemMidVO> itemMidVOList = this.inventoryService.itemMidList();
		log.info("itemList -> itemMidVOList : "+itemMidVOList);
		
		List<ItemVO> itemVOList = this.inventoryService.itemList(itemMap);
		log.info("itemList -> itemVOList : "+itemVOList);
		
		List<VendorVO> vendorVOList = this.inventoryService.vendorList();
		log.info("list -> vendorVOList"+vendorVOList );
		
		InventoryPagination<ItemVO> articlePage = new InventoryPagination<ItemVO>(total, currentPage, 15, itemVOList, itemMap);
		log.info("articlePage : " + articlePage);
		
		if (!itemM.isEmpty()) {
            itemSmallVOList = inventoryService.itemSmallList2(itemM);
        } else {
            itemSmallVOList = inventoryService.itemSmallList();
        }
		
		model.addAttribute("itemVOList",itemVOList);
		model.addAttribute("articlePage",articlePage);
		model.addAttribute("itemSmallVOList",itemSmallVOList);
		model.addAttribute("itemMidVOList",itemMidVOList);
		model.addAttribute("vendorVOList",vendorVOList);
		
		return "emp/inventory/itemList";
	}
	@ResponseBody
	@GetMapping("/itemSdetail")
	public List<ItemSmallVO> itemSdetail(String itemMCd) {
		
		log.info("itemSdetail -> itemMCd : "+itemMCd);
		List<ItemSmallVO> itemSmallVO = this.inventoryService.itemSdetail(itemMCd);
		log.info("itemSmallVO : "+itemSmallVO);
		
		return itemSmallVO;
	}
	
	@ResponseBody
	@PostMapping("/itemDelete")
	public int itemDelete(String itemCd) {
		log.info("itemDelete -> itemCd : "+itemCd);
		
		int result = this.inventoryService.itemDelete(itemCd);
		log.info("result : "+result);
		
		return result;
	}
	
	// 발주
	@GetMapping("/itemOrder")
	public String order(Model model) {
		
		List<VendorVO> vendorVOList = this.inventoryService.vendorList();
		log.info("vendorVOList : "+vendorVOList);
		List<ItemVO> itemVOList = this.inventoryService.itemList2();
		log.info("itemVOList : "+itemVOList);
		
		model.addAttribute("vendorVOList",vendorVOList);
		model.addAttribute("itemVOList",itemVOList);
		
		return "emp/inventory/itemOrder";
	}
	
	@ResponseBody
	@GetMapping("vendorDetail")
	public VendorVO vendorDetail(String vendorCd) {
		log.info("vendorDetail -> vendorCd : "+vendorCd);
		
		
		VendorVO vendorVO = this.inventoryService.vendorDetail(vendorCd);
		log.info("vendorDetail -> vendorVO : "+vendorVO);
		
		
		return vendorVO;
	}
	
	@ResponseBody
	@GetMapping("itemDetail2")
	public List<ItemVO> itemDetail2(String vendorCd) {
		log.info("itemDetail2 -> vendorCd"+vendorCd);
		
		List<ItemVO> itemVO = this.inventoryService.itemDetail2(vendorCd);
		log.info("itemDetail2 -> itemVO : "+itemVO);
		
		return itemVO;
	}
	
	@ResponseBody
	@GetMapping("itemCdDetail")
	public ItemVO itemCdDetail(String itemCd) {
		log.info("itemCdDetail -> itemCd : "+itemCd);
		
		ItemVO itemVO = this.inventoryService.itemCdDetail(itemCd);
		log.info("itemCdDetail -> itemVO : "+itemVO);
		
		return itemVO;
	}
	
	@PostMapping("orderInsert")
	public String orderInsert(ItemOrderVO itemOrderVO) {
		log.info("orderInsert -> itemOrderVO : "+itemOrderVO);
		
		int result = this.inventoryService.orderInsert(itemOrderVO);
		log.info("orderInsert -> result : "+result);
		
		
		return "redirect:/emp/inventory/totalOrderList";
	}
	
	@GetMapping("itemOrderDetail")
	public String itemOrderDetail(Model model,long orderNo) {
		log.info("itemOrderDetail -> orderNo : "+orderNo);
		
		ItemOrderVO itemOrderVO = this.inventoryService.itemOrderDetail(orderNo);
		log.info("itemOrderDetail -> itemOrderVO : "+itemOrderVO);
		
		model.addAttribute("itemOrderVO",itemOrderVO);
		
		return "emp/inventory/itemOrderDetail";
	}
	
	@PostMapping("itemOderUpdate")
	public String itemOderUpdate(ItemOrderVO itemOrderVO) {
		log.info("itemOderUpdate -> itemOrderVO : "+itemOrderVO);
		
		int result = this.inventoryService.itemOderUpdate(itemOrderVO);
		log.info("itemOderUpdate -> result : "+result);
		
		
		return "redirect:/emp/inventory/list";
	}
	
	@GetMapping("totalOrderList")
	public String itemOrderList(Model model) {
		
		List<ItemOrderVO> ItemOrderVOList = this.inventoryService.totalOrderList();
		log.info("ItemOrderVOList : "+ItemOrderVOList);
		
		model.addAttribute("ItemOrderVOList",ItemOrderVOList);
		
		return "emp/inventory/totalOrderList";
	}
	
	@ResponseBody
	@GetMapping("papDetail")
	public List<PayAndPayVO> papDetail(String itemCd) {
		
		List<PayAndPayVO> payAndPayVO = this.inventoryService.papDetail(itemCd);
 		log.info("payAndPayVO : "+payAndPayVO);
		
		return payAndPayVO;
	}
	
	
}
