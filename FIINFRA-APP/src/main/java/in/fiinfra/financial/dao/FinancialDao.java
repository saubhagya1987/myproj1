package in.fiinfra.financial.dao;

import in.fiinfra.cp.Assumption;
import in.fiinfra.cp.ExpenseData;
import in.fiinfra.cp.IncomeData;

import java.util.List;

public interface FinancialDao
{
	public IncomeData insertOrUpdateIncome(int buId,IncomeData incomeData);
	
	public List<IncomeData> getListOfIncomeData(int buId,int partyId);
	
	public ExpenseData insertUpdateExpense(int buId,ExpenseData expenseData);
	
	public List<ExpenseData> getListOfExpenseData(int buId,int partyId);

	public String deleteIncome(int buId,int partyId,int  incomeId);
	
	public String deleteExpense(int buId,int partyId,int  expenseId);
	
	public int getInflationRate(int buId,int partyId);
	
	public Assumption getAssumption(int buId, int partyId, int assumptionId) ;
	
	public IncomeData insertOrUpdateIncomeAndUpdateDC(int buId,
			IncomeData incomeData);

	public String deleteIncomeAndUpdateDC(int buId, int partyId, int incomeId);

	public String deleteExpenseAndUpdateDC(int buId, int partyId, int expenseId);

	public ExpenseData insertUpdateExpenseAndUpdateDC(int buId,
			ExpenseData expenseData);

	public IncomeData getIncomeForId(Integer incomeId, Integer partyId,
			Integer buId);

	public ExpenseData getExpenseForId(Integer expenseId, Integer partyId,
			Integer buId);

}
