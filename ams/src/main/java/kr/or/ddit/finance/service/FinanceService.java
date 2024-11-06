package kr.or.ddit.finance.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.finance.vo.AccountItemVO;
import kr.or.ddit.finance.vo.BudgetItemVO;
import kr.or.ddit.finance.vo.TransHistoryVO;
import kr.or.ddit.inven.vo.VendorVO;

public interface FinanceService {

	List<BudgetItemVO> bdgItemVOList(Map<String, Object> budgetMap);

	List<AccountItemVO> accItemVOList();

	int registBudgetItemCheck(BudgetItemVO budgetItemVO);

	int registAccountItemCheck(AccountItemVO accountItemVO);

	int registBudgetItem(BudgetItemVO budgetItemVO);

	int registAccountItem(AccountItemVO accountItemVO);

	int deleteBudgetItem(List<BudgetItemVO> budgetItemVOList);

	int editBudgetItem(BudgetItemVO budgetItemVO);

	int editAccountItem(AccountItemVO accountItemVO);

	int deleteAccountItem(List<AccountItemVO> accountItemVOList);

	List<TransHistoryVO> transHistoryVOList(Map<String, Object> searchMap);

	int getTransTotal(Map<String, Object> searchMap);

	List<VendorVO> vendorVOList();

	int registTransHistory(TransHistoryVO transHistoryVO);

	int editTransHistory(TransHistoryVO transHistoryVO);

	int deleteTransHistory(List<TransHistoryVO> transHistoryVOList);

	List<VendorVO> vendorVOListMap(Map<String, Object> vendorMap);

	int registVendor(VendorVO vendorVO);

	int editVendor(VendorVO vendorVO);

	int deleteVendor(List<VendorVO> vendorVOList);

	int vendorTotal(Map<String, Object> vendorMap);

}
