package in.fiinfra.financial.service;

import in.fiinfra.common.diy.models.Party;
import in.fiinfra.cp.Assumption;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.ExpenseData;
import in.fiinfra.cp.FinancialData;
import in.fiinfra.cp.IncomeData;
import in.fiinfra.financial.dao.FinancialDao;
import in.fiinfra.party.dao.PartyDao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("financialService")
public class FinancialServiceImpl implements FinancialService 
{
	@Autowired
	FinancialDao financialDao;
		
	@Autowired
	private PartyDao partyDao;

	
	@Override
	public List<IncomeData> getListOfIncomeData(int buId,int partyId) {
		return financialDao.getListOfIncomeData(buId,partyId);
	}


	@Override
	public IncomeData insertUpdateIncome(int buId, IncomeData incomeData) {
		return financialDao.insertOrUpdateIncome(buId, incomeData);
	}


	@Override
	public ExpenseData insertUpdateExpense(int buId, ExpenseData expenseData) {
		
		return financialDao.insertUpdateExpense(buId, expenseData);
	}


	@Override
	public List<ExpenseData> getListOfExpenseData(int buId,int partyId) {
		
		return financialDao.getListOfExpenseData(buId,partyId);
	}


	@Override
	public String deleteIncome(int buId, int partyId, int  incomeId) {
		
		return financialDao.deleteIncome(buId, partyId, incomeId);
	}


	@Override
	public String deleteExpense(int buId, int partyId, int expenseId) {
		
		return financialDao.deleteExpense(buId, partyId,expenseId);
	}

	
	@Override
	public int getInflationRate(int buId, int partyId) {
		
		return financialDao.getInflationRate(buId, partyId);
	}

 
	@Override
	public List<FinancialData> getMyFinancials(int buId, int partyId){
		List<IncomeData> lstIncome = financialDao.getListOfIncomeData(buId,partyId);
		List<ExpenseData> lstExpense = financialDao.getListOfExpenseData(buId,partyId);
		
		Party party = partyDao.getParty(partyId);
		
		Date dobDate = party.getDob();
		
		Assumption assumptionRetirement = getAssumption(buId, partyId, 98022);
		Assumption assumptionLifeAge = getAssumption(buId, partyId, 98021);
		Assumption assumptionIncomeAfterRetirement = null;
		
		int retirementAge = assumptionRetirement != null ? assumptionRetirement.getAsInt(60):60;
		int maxLife = assumptionLifeAge != null ? assumptionLifeAge.getAsInt(75):75;
		int incomeAfterRetirement = assumptionIncomeAfterRetirement != null ? assumptionIncomeAfterRetirement.getAsInt(15):15;
		
		Calendar dob = Calendar.getInstance();
		if(dobDate != null){
			dob.setTime(dobDate);
		}
		else{
			dob.add(Calendar.YEAR, -20);	
		}
		
		
		Calendar today = Calendar.getInstance();
		
		int age =  today.get(Calendar.YEAR) - dob.get(Calendar.YEAR);
		age = Math.abs(age);
//		age = age >35?age:35;
		List<FinancialData> myFinancials = new ArrayList<FinancialData>();
		
		long totalIncome = 0;
		double totalExpenses = 0;
		double weightedIncomePercentage = 0;
		double weightedExpense = 0;

		for (IncomeData d : lstIncome) {
			long income = CommonUtils.calculateAmountYearly(
					d.getIncomeAmount(), d.getIncomeFrequencyId());
		
			income = CommonUtils.convertToK(income);
			weightedIncomePercentage +=  CommonUtils.multiply(income, d.getAnnualGrowth());
			totalIncome += income;
			
		}
		
		
		weightedIncomePercentage = CommonUtils.divide(weightedIncomePercentage, totalIncome) ;

		for (ExpenseData d : lstExpense) {
			long expense = CommonUtils.calculateAmountYearly(
					d.getExpenseAmount(), d.getExpenseFrequencyID());
			expense = CommonUtils.convertToK(expense);
			weightedExpense += CommonUtils.multiply(expense, d.getGrowthRate())  ;
			totalExpenses += expense;
		}
		double weightedExpensePercentage = CommonUtils.divide(weightedExpense,totalExpenses);
		
		int counter = 0;
		for(int i=0;i<maxLife-age ;i++){
			int ageYr =  i+age;
			if(ageYr>65){
				break;
			}
			
			
			long weightedIncome = 0;
			if(ageYr ==retirementAge){
				weightedIncome = CommonUtils.getFV(totalIncome, weightedIncomePercentage, counter-1);
				
				totalIncome = new BigDecimal(weightedIncome).multiply(new BigDecimal(incomeAfterRetirement).divide(new BigDecimal(100))).longValue();
//				weightedIncomePercentage = weightedIncomePercentage * 0.15 ;
				counter =0;
			}
			weightedIncome = CommonUtils.getFV(totalIncome, weightedIncomePercentage, counter);
			double weightedExpenses = CommonUtils.getFV(totalExpenses, weightedExpensePercentage, i);
			FinancialData data = new FinancialData();
			 
			data.setAge(ageYr);
			data.setIncome(weightedIncome);
			data.setExpenses((long)weightedExpenses);
			myFinancials.add(data);
			counter++;
			}
		return myFinancials;
		
	}
	
	
	@Override
	public Assumption getAssumption(int buId, int partyId, int assumptionId) {
		return financialDao.getAssumption(buId, partyId, assumptionId);
	}
	@Override
	public IncomeData insertUpdateIncomeAndUpdateDC(int buId,
			IncomeData incomeData) {
		return financialDao.insertOrUpdateIncomeAndUpdateDC(buId, incomeData);	}


	@Override
	public String deleteIncomeAndUpdateDC(int buId, int partyId, int incomeId) {
		return financialDao.deleteIncomeAndUpdateDC(buId, partyId, incomeId);	}


	@Override
	public String deleteExpenseAndUpdateDC(int buId, int partyId, int expenseId) {
		return financialDao.deleteExpenseAndUpdateDC(buId, partyId,expenseId);
	}


	@Override
	public ExpenseData insertUpdateExpenseAndUpdateDC(int buId,
			ExpenseData expenseData) {
		return financialDao.insertUpdateExpenseAndUpdateDC(buId, expenseData);	}


	@Override
	public IncomeData getIncomeForId(Integer incomeId, Integer partyId,
			Integer buId) {

		return financialDao.getIncomeForId(incomeId,partyId,buId);
	}


	@Override
	public ExpenseData getExpenseForId(Integer expenseId, Integer partyId,
			Integer buId) {
		return financialDao.getExpenseForId(expenseId,partyId,buId);
	}
	

}