package in.fiinfra.portfolio.service;

import in.fiinfra.auth.model.GetRequest;
import in.fiinfra.birt.models.IssuerId;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductPurchaseURLs;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.partner.ActionPlanData;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.cp.AchievementScaleData;
import in.fiinfra.cp.AssetData;
import in.fiinfra.cp.FinancialAccountData;
import in.fiinfra.cp.LoanData;
import in.fiinfra.cp.PlanData;
import in.fiinfra.cp.common.model.AssetRequest;
import in.fiinfra.cp.common.model.FinancialRequest;
import in.fiinfra.cp.common.model.PortfolioRequest;
import in.fiinfra.cp.common.model.ReportRequest;
import in.fiinfra.cp.common.service.BasicService;
import in.fiinfra.cp.common.service.Services;

import java.util.List;

import javax.ws.rs.core.Response;

public class PortfolioService extends BasicService {

	public Integer addUpdateGoal(GoalData goal) {
		return getService().postForObject(Services.addUpdateGoal, goal,
				Integer.class, appendPathParam());
	}

	public List<GoalData> getListOfGoals(PortfolioRequest request) {

		return getService().getForObjectCollection(Services.getListOfGoal,
				request, GoalData.class, appendPathParam());
	}

	public Response deleteGoal(FinancialRequest q) {
		return getService().getForObject(Services.deleteIncome, q,
				Response.class, appendPathParam());
	}

	public List<PlanData> getPlans(PortfolioRequest request) {
		return getService().getForObjectCollection(Services.getPlans, request,
				PlanData.class, appendPathParam());
	}

	public ActionPlanData getListOfInvestments(ActionPlanData planData) {
		return getService().postForObject(Services.getListOfInvestments,
				planData, ActionPlanData.class, appendPathParam());

	}

	public List<AssetData> getListOfPortfolio(PortfolioRequest request) {
		return getService().getForObjectCollection(
				Services.getListOfPortfolios, request, AssetData.class,
				appendPathParam());

	}
	
	public List<LoanData> getListOfLoan(PortfolioRequest request) {
		return getService().getForObjectCollection(
				Services.getListOfLoan, request, LoanData.class,
				appendPathParam());
	}

	public Integer addUpdateLoan(LoanData loan) {
		return getService().postForObject(Services.addUpdateLoan, loan,
				Integer.class, appendPathParam());
	}
	
	public Response deleteLoan(PortfolioRequest q ){
		return getService().getForObject(Services.deleteLoan,q, Response.class,appendPathParam());
	}
	
	public Integer addUpdateAsset(AssetData asset) {
		return getService().postForObject(Services.addUpdateAsset, asset,
				Integer.class, appendPathParam());
	}
	
	public Response deleteAsset(PortfolioRequest q ){
		return getService().getForObject(Services.deleteLoan,q, Response.class,appendPathParam());
	}
	
	public AchievementScaleData getAchievementScale(PortfolioRequest request) {
		return getService().getForObject(
				Services.getAchievementScale, request,AchievementScaleData.class,
				appendPathParam());

	}
	
	public String approvePlans(PortfolioRequest request) {
		return getService().getForObject(
				Services.approvePlan, request,String.class,
				appendPathParam());
	}

	public List<KeyValue> getFamilyMembers(AssetRequest request) {
		return getService().getForObjectCollection(
				Services.getFamilymembers, request,KeyValue.class,
				appendPathParam());

	}
	
	public AssetData getAsset(AssetRequest request) {
		return getService().getForObject(
				Services.getAsset, request, AssetData.class,
				appendPathParam());

	}
	public List<IssuerId> getIssuerId(ReportRequest request) {
		return getService().getForObjectCollection(
				Services.URL_GET_ISSUERID, request, IssuerId.class,
				appendPathParam());

	}
	
	public Integer saveFinancialAccount(FinancialAccountData financialAccountData) {
		return getService().postForObject(Services.saveAccount, financialAccountData,
				Integer.class, appendPathParam());
	}
	
	public Boolean saveTask(Task task) {
		return getService().postForObject(Services.ADD_TASK_URL, task,
				Boolean.class, appendPathParam());
	}
	
	public List<QuestionDetails> getDcData(int sectionTypeId, int questionBankId,int partyId){
		return getService().getForObjectCollection(Services.getFinancialStatusList, 
				new GetRequest().param("sectionTypeId", sectionTypeId).param("questionBankId", questionBankId).param("partyId", partyId), QuestionDetails.class, appendPathParam());
		
	}

	public AssetData deleteAssets(PortfolioRequest request) {
		
		 return getService().getForObject(Services.deleteAsset, request, AssetData.class, appendPathParam());
	}

	public LoanData getLoanForId(PortfolioRequest request) {
		// TODO Auto-generated method stub
		return getService().getForObject(Services.getLoanForId, request, LoanData.class, appendPathParam());
	}
	
	public List<ProductPurchaseURLs> getPlansOnline(PortfolioRequest request) {
		// TODO Auto-generated method stub
		return getService().getForObjectCollection(Services.GET_OL_PRODUCT_PURCHASE_URL, request, ProductPurchaseURLs.class, appendPathParam());
	}
	
}
