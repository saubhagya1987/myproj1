package in.fiinfra.report.service;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.ClientActionPlan;
import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.utility.GoalData;

import java.util.List;

public interface ReportService {
	
	public AdviserGoals getGoalsDetailsForPartyId( Integer partyId, String flag );
	
	public List<GoalData> getGoalsForPartyId( Integer partyId );
	
	public Suggestion getPlanningForPartyId( Integer partyId,String reportFlag );
	
	public Party getDocumentIdsForPartyId( Integer partyId );
	
	public boolean insertOrUpdateDocumentIdsForPartyId( List<Document> documentList );
	
	public  List<ClientActionPlan> getAnalysisReportForPartyId( Integer partyId );
	
	public  List<AdviceRecommendation> getAllRecommendationCombination( Integer partyId,Integer sectionTypeId );
	
	public boolean saveAnalysisReportForBatch( Integer partyId, Integer isAnalysisGeneration, Integer isActionPlanGeneration,Integer analysiReportType, Integer lastModifiedBy);
}
