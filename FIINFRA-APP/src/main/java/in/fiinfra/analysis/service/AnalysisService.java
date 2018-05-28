package in.fiinfra.analysis.service;

import in.fiinfra.common.diy.models.CashFlowData;
import in.fiinfra.common.diy.models.DcAnalysisHelper;
import in.fiinfra.common.utility.GoalData;



public interface AnalysisService {
	
	public DcAnalysisHelper getAnalysisData( Integer partyId, String dataFor );
	
	public GoalData getAnalysisForGoals(Integer partyId,Integer goalId,Integer sectionId);
	
	public Integer getAnalysisForDashboardGoals(Integer advisorPartyId,Integer contactPartyId);
	
	public CashFlowData getAnalysisForCashFlowData(Integer partyId);
}
