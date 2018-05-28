package in.fiinfra.analysis.dao;

import in.fiinfra.common.diy.models.CashFlowData;
import in.fiinfra.common.diy.models.DcAnalysisHelper;
import in.fiinfra.common.utility.GoalData;


public interface AnalysisDao {
	
	public DcAnalysisHelper getAnalysisForEmergency( Integer partyId );
	
	public DcAnalysisHelper getAnalysisForRiskCover( Integer partyId );
	
	public DcAnalysisHelper getAnalysisForLoanStatus( Integer partyId );
	
	public DcAnalysisHelper getAnalysisForSuccession( Integer partyId );
	
	public DcAnalysisHelper getAnalysisForCashFlow( Integer partyId );
	
	public GoalData getAnalysisForGoals(Integer partyId,Integer goalId,Integer sectionId);
	
	public Integer getAnalysisForDashboardGoals(Integer advisorPartyId,Integer contactPartyId);
	
	public CashFlowData getAnalysisForCashFlowData(Integer partyId);

}
