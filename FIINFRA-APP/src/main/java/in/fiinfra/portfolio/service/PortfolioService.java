package in.fiinfra.portfolio.service;

import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.cp.AchievementScaleData;
import in.fiinfra.cp.AssetData;
import in.fiinfra.cp.FinancialAccountData;
import in.fiinfra.cp.LoanData;
import in.fiinfra.cp.PlanData;

import java.util.List;

public interface PortfolioService {
	public List<AssetData> getListOfPortfolio(int buId, int partyId);

	public List<PlanData> getPlans(int buId, int partyId);
	
	public List<LoanData> getLoan(int buId, int partyId);
	
	public List<GoalData> getGoalsForClient(Integer partyId);
	
	public AchievementScaleData getAchievementScale(Integer partyId);
	
	public Boolean approvePlan(Integer partyId,Integer prodAllocationId,Integer fpActionPlanId,Integer buId);
	
	public LoanData insertUpdateLoan(int buId,LoanData loanData);
	
	public String deleteLoan(int buId,int partyId,int partyLoanId);
	
	public AssetData insertUpdateAsset(int buId,AssetData assetData);
	
	public String deleteAsset(int buId,int partyId,int asetId);

	public List<KeyValue> getFamilyMembers(int partyId, int buId);

	public List<KeyValue> getProducts(int buId, int partyId, String type, String searchStr);
	
	public List<FinancialAccountData> getFinancialAccounts(int buId, int partyId);

	public FinancialAccountData saveFinancialAccount(int buId,
			FinancialAccountData data);
	
	public AssetData getAsset(int buId, int partyId,int assetId );
	
	public LoanData insertUpdateLoanAndSaveDC(int buId, LoanData loanData);

	public String deleteLoanAndUpdateDC(int buId, int partyId, int loanId);

	public LoanData getLoanForId(int partyLoanId, int partyId, int buId);

}
