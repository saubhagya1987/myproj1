package in.fiinfra.financial;

import in.fiinfra.common.AbstractTestCase;
import in.fiinfra.cp.ExpenseData;
import in.fiinfra.cp.FinancialData;
import in.fiinfra.cp.IncomeData;
import in.fiinfra.financial.service.FinancialService;

import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class TestIncomeService extends AbstractTestCase{
	
	@Autowired
	FinancialService service;
	
	@Test
    public void testIncomeList(){
		List<IncomeData> data =  service.getListOfIncomeData(1,6375);
		
        printJson(" Income List ",data);
    }  

	@Test
    public void testExpensesList(){
		List<ExpenseData> data =  service.getListOfExpenseData(1,6375);
		
        printJson(" Expenses List ",data);
    }  

	@Test
    public void addIncome(){
		IncomeData d = new IncomeData();
		d.setPartyId(6375);
		d.setAnnualGrowth(5);
		d.setCreatedBy(6375);
		d.setLastModifiedBy(6375);
		d.setIncomeFrequencyId(63001);
		d.setIncomeAmount(5000);
		d.setIncomeName("Testing Income");
		d.setIncomeTypeId(74001);
		 IncomeData data= service.insertUpdateIncome(1,d);
		
		 Assert.assertNotNull(data.getPartyIncomeId());
		 printJson(" Created Income ",data);
		 
		List<IncomeData> incomeList =  service.getListOfIncomeData(1,6375);
		
        printJson(" Income List ",incomeList );
    }  
	
	@Test
	public void testMyFinancials(){
		List<FinancialData> financials =  service.getMyFinancials(1,6375);
		
		printJson("My Financials", financials);
	}

	@Test
	public void testInflation(){
		System.out.println(service.getInflationRate(1,6375));
	}

}
