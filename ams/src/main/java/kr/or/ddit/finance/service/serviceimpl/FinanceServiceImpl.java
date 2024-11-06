package kr.or.ddit.finance.service.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.finance.mapper.FinanceMapper;
import kr.or.ddit.finance.service.FinanceService;
import kr.or.ddit.finance.vo.AccountItemVO;
import kr.or.ddit.finance.vo.BudgetItemVO;
import kr.or.ddit.finance.vo.TransHistoryVO;
import kr.or.ddit.inven.vo.VendorVO;

@Service
public class FinanceServiceImpl implements FinanceService {

	@Inject
	FinanceMapper financeMapper;
	
	
	@Override
	public List<BudgetItemVO> bdgItemVOList(Map<String, Object> budgetMap) {
		// TODO Auto-generated method stub
		return this.financeMapper.bdgItemVOList(budgetMap);
	}


	@Override
	public List<AccountItemVO> accItemVOList() {
		// TODO Auto-generated method stub
		return this.financeMapper.accItemVOList();
	}


	@Override
	public int registBudgetItemCheck(BudgetItemVO budgetItemVO) {
		// TODO Auto-generated method stub
		return this.financeMapper.registBudgetItemCheck(budgetItemVO);
	}


	@Override
	public int registAccountItemCheck(AccountItemVO accountItemVO) {
		// TODO Auto-generated method stub
		return this.financeMapper.registAccountItemCheck(accountItemVO);
	}


	@Override
	public int registBudgetItem(BudgetItemVO budgetItemVO) {
		// TODO Auto-generated method stub
		return this.financeMapper.registBudgetItem(budgetItemVO);
	}


	@Override
	public int registAccountItem(AccountItemVO accountItemVO) {
		// TODO Auto-generated method stub
		return this.financeMapper.registAccountItem(accountItemVO);
	}


	@Override
	public int deleteBudgetItem(List<BudgetItemVO> budgetItemVOList) {
		// TODO Auto-generated method stub
		return this.financeMapper.deleteBudgetItem(budgetItemVOList);
	}


	@Override
	public int editBudgetItem(BudgetItemVO budgetItemVO) {
		// TODO Auto-generated method stub
		return this.financeMapper.editBudgetItem(budgetItemVO);
	}


	@Override
	public int editAccountItem(AccountItemVO accountItemVO) {
		// TODO Auto-generated method stub
		return this.financeMapper.editAccountItem(accountItemVO);
	}


	@Override
	public int deleteAccountItem(List<AccountItemVO> accountItemVOList) {
		// TODO Auto-generated method stub
		return this.financeMapper.deleteAccountItem(accountItemVOList);
	}


	@Override
	public List<TransHistoryVO> transHistoryVOList(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return this.financeMapper.transHistoryVOList(searchMap);
	}


	@Override
	public int getTransTotal(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return this.financeMapper.getTransTotal(searchMap);
	}


	@Override
	public List<VendorVO> vendorVOList() {
		// TODO Auto-generated method stub
		return this.financeMapper.vendorVOList();
	}


	@Override
	public int registTransHistory(TransHistoryVO transHistoryVO) {
		// TODO Auto-generated method stub
		return this.financeMapper.registTransHistory(transHistoryVO);
	}


	@Override
	public int editTransHistory(TransHistoryVO transHistoryVO) {
		// TODO Auto-generated method stub
		return this.financeMapper.editTransHistory(transHistoryVO);
	}


	@Override
	public int deleteTransHistory(List<TransHistoryVO> transHistoryVOList) {
		// TODO Auto-generated method stub
		return this.financeMapper.deleteTransHistory(transHistoryVOList);
	}



	@Override
	public List<VendorVO> vendorVOListMap(Map<String, Object> vendorMap) {
		// TODO Auto-generated method stub
		return this.financeMapper.vendorVOListMap(vendorMap);
	}


	@Override
	public int registVendor(VendorVO vendorVO) {
		// TODO Auto-generated method stub
		return this.financeMapper.registVendor(vendorVO);
	}


	@Override
	public int editVendor(VendorVO vendorVO) {
		// TODO Auto-generated method stub
		return this.financeMapper.editVendor(vendorVO);
	}


	@Override
	public int deleteVendor(List<VendorVO> vendorVOList) {
		// TODO Auto-generated method stub
		return this.financeMapper.deleteVendor(vendorVOList);
	}


	@Override
	public int vendorTotal(Map<String, Object> vendorMap) {
		// TODO Auto-generated method stub
		return this.financeMapper.vendorTotal(vendorMap);
	}

}
