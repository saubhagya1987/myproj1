package in.fiinfra.financial.Service;

import in.fiinfra.auth.model.GetRequest;
import in.fiinfra.cp.Assumption;
import in.fiinfra.cp.ExpenseData;
import in.fiinfra.cp.FinancialData;
import in.fiinfra.cp.IncomeData;
import in.fiinfra.cp.LoanData;
import in.fiinfra.cp.common.model.FinancialRequest;
import in.fiinfra.cp.common.service.BasicService;
import in.fiinfra.cp.common.service.Services;

import java.util.List;

import javax.ws.rs.core.Response;

public class FinancialService extends BasicService {

	public Integer addUpdateIncome(IncomeData income) {
		return getService().postForObject(Services.addUpdateIncome, income,
				Integer.class, appendPathParam());
	}
	
	public Integer addUpdateExpense(ExpenseData expense) {
		return getService().postForObject(Services.addUpdateExpense, expense,
				Integer.class, appendPathParam());
	}

	public List<IncomeData> getListOfIncome(FinancialRequest request) {

		return getService().getForObjectCollection(Services.getListOfIncome,
				request, IncomeData.class, appendPathParam());

	}
	
	public List<ExpenseData> getListOfExpense(FinancialRequest request) {
	
		return getService().getForObjectCollection(Services.getListOfExpense,
				request,ExpenseData.class, appendPathParam());
	}
	
	public Response deleteIncome(FinancialRequest q ){
		return getService().getForObject(Services.deleteIncome,q, Response.class,appendPathParam());
	}
	
	public Response deleteExpense(FinancialRequest q ){
		return getService().getForObject(Services.deleteExpense,q, Response.class,appendPathParam());
	}

	public Assumption getInflationRate(int partyId){
		return getService().getForObject(Services.getAssumption,new GetRequest().param("partyId", partyId).param("assumptionId", 98047), Assumption.class,appendPathParam());
	}

	
	public List<FinancialData> getMyFinancials(int partyId){
		return getService().getForObjectCollection(Services.getMyFinancials,new GetRequest().param("partyId", partyId), FinancialData.class,appendPathParam());
	}

	public ExpenseData getExpenseForId(FinancialRequest request) {
		return getService().getForObject(Services.getExpenseForId, request, ExpenseData.class, appendPathParam());
	}

	public IncomeData getIncomeForId(FinancialRequest request) {
		return getService().getForObject(Services.getIncomeForId, request, IncomeData.class, appendPathParam());
		
	}

}


