package kr.or.ddit.finance.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.finance.vo.AccountItemVO;
import kr.or.ddit.finance.vo.BudgetItemVO;
import kr.or.ddit.finance.vo.TransHistoryVO;
import kr.or.ddit.inven.vo.VendorVO;

@Mapper
public interface FinanceMapper {

	List<BudgetItemVO> bdgItemVOList(Map<String, Object> budgetMap);

	List<AccountItemVO> accItemVOList();

	int registBudgetItemCheck(@Param("budgetItemVO") BudgetItemVO budgetItemVO);

	int registAccountItemCheck(@Param("accountItemVO") AccountItemVO accountItemVO);

	int registBudgetItem(@Param("budgetItemVO") BudgetItemVO budgetItemVO);

	int registAccountItem(@Param("accountItemVO") AccountItemVO accountItemVO);

	int deleteBudgetItem(@Param("list") List<BudgetItemVO> budgetItemVOList);

	int editBudgetItem(@Param("budgetItemVO") BudgetItemVO budgetItemVO);

	int editAccountItem(@Param("accountItemVO") AccountItemVO accountItemVO);

	int deleteAccountItem(@Param("list") List<AccountItemVO> accountItemVOList);

	List<TransHistoryVO> transHistoryVOList(Map<String, Object> searchMap);

	int getTransTotal(Map<String, Object> searchMap);

	List<VendorVO> vendorVOList();

	int registTransHistory(@Param("transHistoryVO") TransHistoryVO transHistoryVO);

	int editTransHistory(@Param("transHistoryVO") TransHistoryVO transHistoryVO);

	int deleteTransHistory(@Param("list") List<TransHistoryVO> transHistoryVOList);

	int registVendor(@Param("vendorVO") VendorVO vendorVO);

	List<VendorVO> vendorVOListMap(Map<String, Object> vendorMap);

	int editVendor(@Param("vendorVO") VendorVO vendorVO);

	int deleteVendor(@Param("list") List<VendorVO> vendorVOList);

	int vendorTotal(Map<String, Object> vendorMap);

}
