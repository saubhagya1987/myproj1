package in.fiinfra.portfolio.service;

import in.fiinfra.analysis.service.AnalysisService;
import in.fiinfra.common.diy.models.DcAnalysisHelper;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.cp.AchievementScaleData;
import in.fiinfra.cp.AssetData;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.FinancialAccountData;
import in.fiinfra.cp.LoanData;
import in.fiinfra.cp.PlanData;
import in.fiinfra.partner.service.PartnerService;
import in.fiinfra.portfolio.dao.PortfolioDao;
import in.fiinfra.suggestion.service.SuggestionService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("portfolioService")
public class PortfolioServiceImpl implements PortfolioService {
	@Autowired
	PortfolioDao portfolioDao;
	
	@Autowired
	AnalysisService analysisService;
	
	@Autowired
	SuggestionService suggestionService;


	@Autowired
	private PartnerService partnerService;

	@Override
	public List<AssetData> getListOfPortfolio(int buId, int partyId) {

		return portfolioDao.getListOfPortfolio(buId, partyId);
	}

	@Override
	public List<PlanData> getPlans(int buId, int partyId) {

		return portfolioDao.getPlans(buId, partyId);
	}

	@Override
	public List<LoanData> getLoan(int buId, int partyId) {
		
		return portfolioDao.getLoanData(buId, partyId);
	}
	@Override
	public List<GoalData> getGoalsForClient(Integer partyId) {
		return portfolioDao.getGoalsForClient(partyId);

	}

	@Override
	public AchievementScaleData getAchievementScale(Integer partyId) {
		AchievementScaleData scaleData = new AchievementScaleData();
		
		{
			DcAnalysisHelper analysis = analysisService.getAnalysisData(partyId, "SR");
			
			String[] tokens = analysis.getAnalysis().split(",");
			boolean knowInvest = tokens.length >0 && "YES".equalsIgnoreCase(tokens[0]);
			boolean accessMoney = tokens.length >1 && "YES".equalsIgnoreCase(tokens[1]);
			boolean willPrepared = tokens.length >2 && "YES".equalsIgnoreCase(tokens[2]);
			scaleData.setInvestmentKnown(knowInvest);
			scaleData.setMoneyKnown(accessMoney);
			scaleData.setWillPrepared(willPrepared);
			if(willPrepared){
				scaleData.setSuccessionScale(100);
			}
			else if(knowInvest){
				scaleData.setSuccessionScale(50);
			}
			else{
				scaleData.setSuccessionScale(0);
			}
		}
		
		
		double[][] data = new double[4][2];
		

		
		{	
			Suggestion suggestion = suggestionService.getSuggestionData(partyId, "RC");
			data[0][0] = CommonUtils.toDouble(suggestion.getLifeCurrentCover());
		data[0][1] = CommonUtils.toDouble(suggestion.getLifeIdealCover());
		
		data[1][0] = CommonUtils.toDouble(suggestion.getHealthCurrentCover());
		data[1][1] = CommonUtils.toDouble(suggestion.getHealthIdealCover());

		data[2][0] = CommonUtils.toDouble(suggestion.getCriticalCurrentCover());
		data[2][1] = CommonUtils.toDouble(suggestion.getCriticalIdealCover());

		data[3][0] = CommonUtils.toDouble(suggestion.getAccidentCurrentCover());
		data[3][1] = CommonUtils.toDouble(suggestion.getAccidentIdealCover());

		double weightedCoverage = 0;
		double totalCoverage = 0;
		for(int i=0;i<data.length;i++){
			double ideal = data[i][1];
			double value = data[i][0];
			if(data[i][0] >= ideal){
				value = ideal;
			}
			double per = CommonUtils.multiply(CommonUtils.divide(value, ideal), 100);
			
			weightedCoverage += CommonUtils.multiply(value, per);
			totalCoverage += ideal;
		}
		
 		scaleData.setRiskScale((int) CommonUtils.divide(weightedCoverage,totalCoverage)) ;
	}
		
	  {
		  List<GoalData> goals = portfolioDao.getGoalsForClient(partyId);
		  double total = 0;
		  double weightedTotal = 0;
		  for(GoalData g:goals){
			  double goalAmount = CommonUtils.toDouble(g.getGoalAmountPv());
			  goalAmount = CommonUtils.convertToK((long)goalAmount);
			  double per = CommonUtils.toDouble(g.getGoalCompletedPercent());
			  weightedTotal += CommonUtils.multiply(goalAmount, per);
			  total += goalAmount;
		  }
		  scaleData.setGoalScale((int) CommonUtils.divide(weightedTotal, total) );
		  
	  }
	  
	  double totalWeightedScale = (scaleData.getGoalScale()*40) +(scaleData.getRiskScale()*40) + (scaleData.getSuccessionScale()*20);
//	  double totalScale = scaleData.getGoalScale() +scaleData.getRiskScale()+ scaleData.getSuccessionScale();
	  scaleData.setTotalScale((int)CommonUtils.divide(totalWeightedScale, 100) );
	  
	return scaleData;
	}

	@Override
	public Boolean approvePlan(Integer partyId, Integer prodAllocationId,
			Integer fpActionPlanId, Integer buId) {
		return portfolioDao.approvePlan(partyId, prodAllocationId, fpActionPlanId, buId);
	}

	@Override
	public LoanData insertUpdateLoan(int buId, LoanData loanData) {
		
		return portfolioDao.insertUpdateLoan(buId, loanData);
	}

	@Override
	public String deleteLoan(int buId, int partyId, int partyLoanId) {

		return portfolioDao.deleteLoan(buId, partyId, partyLoanId);
	}

	
	@Override
	public String deleteAsset(int buId, int partyId, int asetId) {
		return portfolioDao.deleteAsset(buId, partyId, asetId);
	}

	@Override
	public AssetData insertUpdateAsset(int buId, AssetData assetData) {
		return portfolioDao.insertUpdateAsset(buId, assetData);
	}

	@Override
	public List<KeyValue> getFamilyMembers(int partyId,int buId) {
		return portfolioDao.getFamilyMembers(partyId,buId);
	}

	@Override
	public List<KeyValue> getProducts(int partyId, int buId,String type, String searchStr) {
		return portfolioDao.getProducts(partyId,buId,type,searchStr);
	}
	
	@Override
	public List<FinancialAccountData> getFinancialAccounts(int buId, int partyId) {
		return portfolioDao.getFinancialAccounts(buId,partyId);
	}

	@Override
	public FinancialAccountData saveFinancialAccount(int buId,
			FinancialAccountData data) {
		return portfolioDao.saveFinancialAccount(buId, data);
	}

	@Override
	public AssetData getAsset(int buId, int partyId, int assetId) {
		return portfolioDao.getAsset(buId, partyId, assetId);
	}

	@Override
	public LoanData insertUpdateLoanAndSaveDC(int buId, LoanData loanData) {
		return portfolioDao.insertUpdateLoanAndUpdateDC(buId, loanData);	}

	@Override
	public String deleteLoanAndUpdateDC(int buId, int partyId, int loanId) {
		return portfolioDao.deleteLoanAndUpdateDC(buId, partyId, loanId);
	}

	@Override
	public LoanData getLoanForId(int partyLoanId, int partyId, int buId) {
		return portfolioDao.getLoanForId(partyLoanId, partyId,buId);
	}


}