package in.fiinfra.financial.service;

import in.fiinfra.cp.Assumption;
import in.fiinfra.cp.ExpenseData;
import in.fiinfra.cp.FinancialData;
import in.fiinfra.cp.IncomeData;

import java.util.List;

public interface FinancialService 
{
	public List<IncomeData> getListOfIncomeData(int buId,int partyId);
	
	public IncomeData insertUpdateIncome(int buId,IncomeData incomeData);
	
	public ExpenseData insertUpdateExpense(int buId,ExpenseData expenseData);
	
	public List<ExpenseData> getListOfExpenseData(int buId,int partyId);
	
	public String deleteIncome(int buId,int partyId,int incomeId);
	
	public String deleteExpense(int buId,int partyId,int expenseId);
	
	public List<FinancialData> getMyFinancials(int buId,int partyId);
	
	public int getInflationRate(int buId, int partyId) ;
	
	public Assumption getAssumption(int buId, int partyId, int assumptionId) ;
	public IncomeData insertUpdateIncomeAndUpdateDC(int buId,
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
