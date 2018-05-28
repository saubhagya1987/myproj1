package in.fiinfra.report.service;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.ClientActionPlan;
import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.report.dao.ReportDao;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reportService")
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDao reportDao;
	
	@Override
	public AdviserGoals getGoalsDetailsForPartyId(Integer partyId,String flag) {
		
		return reportDao.getGoalsDetailsForPartyId(partyId,flag);
	}

	@Override
	public List<GoalData> getGoalsForPartyId(Integer partyId) {
		
		DecimalFormat decimalFormat = new DecimalFormat("#.00");
		List<GoalData> goalDataList = new ArrayList<GoalData>();
		goalDataList = reportDao.getGoalsForPartyId(partyId);
		Double amount =0.0;
		Double asset =0.0;
		for (GoalData goalData : goalDataList) {			
			if(null!=goalData.getGoalAmountPv()){
				amount = Double.parseDouble(goalData.getGoalAmountPv());
			}else{
				amount = 0.0;
			}			
			goalData.setGoalAmountPv(decimalFormat.format(amount));
			if(null!=goalData.getAssetValue()){
				asset = Double.parseDouble(goalData.getAssetValue());
			}else{
				asset = 0.0;
			}			
			//System.out.println(asset);
			if( asset != 0.00 ) {
				goalData.setAssetValue(decimalFormat.format(asset));
			} else {
				goalData.setAssetValue("0.00");
			}
		}
		
		return goalDataList;
	}

	@Override
	public Suggestion getPlanningForPartyId(Integer partyId,String reportFlag) {
		
		return reportDao.getPlanningForPartyId(partyId,reportFlag);
	}

	@Override
	public Party getDocumentIdsForPartyId(Integer partyId) {
		
		return reportDao.getDocumentIdsForPartyId(partyId);
	}

	@Override
	public boolean insertOrUpdateDocumentIdsForPartyId( List<Document> documentList ) {
		
		String documentXml = FiinfraUtility.getDocumentIdXML(documentList);
		reportDao.insertOrUpdateDocumentIdsForPartyId(documentXml);
		return true;
	}
	
	@Override
	public  List<ClientActionPlan> getAnalysisReportForPartyId( Integer partyId ){
		return reportDao.getAnalysisReportForPartyId(partyId);
	}

	@Override
	public List<AdviceRecommendation> getAllRecommendationCombination(Integer partyId,Integer sectionTypeId) {
		
		return reportDao.getAllRecommendationCombination(partyId,sectionTypeId);
	}

	@Override
	public boolean saveAnalysisReportForBatch(Integer partyId,
			Integer isAnalysisGeneration, Integer isActionPlanGeneration,
			Integer analysiReportType, Integer lastModifiedBy) {
		reportDao.saveAnalysisReportForBatch(partyId, isAnalysisGeneration, isActionPlanGeneration, analysiReportType, lastModifiedBy);
		return true;
	}
}
