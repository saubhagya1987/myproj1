package in.fiinfra.analysis.service;

import in.fiinfra.analysis.dao.AnalysisDao;
import in.fiinfra.common.diy.models.CashFlowData;
import in.fiinfra.common.diy.models.DcAnalysisHelper;
import in.fiinfra.common.utility.GoalData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("analysisService")
public class AnalysisServiceImpl implements AnalysisService {
	
	@Autowired
	AnalysisDao analysisDao;
	
	@Override
	public DcAnalysisHelper getAnalysisData( Integer partyId, String dataFor )
	{
		DcAnalysisHelper dcAnalysisHelper = new DcAnalysisHelper();
		switch(dataFor){		
			case "ER" :
				dcAnalysisHelper = analysisDao.getAnalysisForEmergency(partyId);				
				dcAnalysisHelper.setPartyId(partyId);
				dcAnalysisHelper.setDataFor(dataFor);				
				break;
			case "RC":				
				dcAnalysisHelper = analysisDao.getAnalysisForRiskCover(partyId);
				dcAnalysisHelper.setPartyId(partyId);
				dcAnalysisHelper.setDataFor(dataFor);
				break;
			case "SR":				
				dcAnalysisHelper = analysisDao.getAnalysisForSuccession(partyId);
				dcAnalysisHelper.setPartyId(partyId);
				dcAnalysisHelper.setDataFor(dataFor);
				break;
			case "LS":
				dcAnalysisHelper = analysisDao.getAnalysisForLoanStatus(partyId);
				dcAnalysisHelper.setPartyId(partyId);
				dcAnalysisHelper.setDataFor(dataFor);
				break;
			case "CF":
				dcAnalysisHelper = analysisDao.getAnalysisForCashFlow(partyId);
				dcAnalysisHelper.setPartyId(partyId);
				dcAnalysisHelper.setDataFor(dataFor);
				break;
			default:
				break;
		}
		return dcAnalysisHelper;
	}

	@Override
	public GoalData getAnalysisForGoals(Integer partyId, Integer goalId,Integer sectionId) {
		
		return analysisDao.getAnalysisForGoals(partyId, goalId,sectionId);
	}

	@Override
	public Integer getAnalysisForDashboardGoals(Integer advisorPartyId,
			Integer contactPartyId) {
		return analysisDao.getAnalysisForDashboardGoals(advisorPartyId, contactPartyId);
	}
	
	@Override
	public CashFlowData getAnalysisForCashFlowData(Integer partyId) 
	{
		return analysisDao.getAnalysisForCashFlowData(partyId);
	}
	
	
}
