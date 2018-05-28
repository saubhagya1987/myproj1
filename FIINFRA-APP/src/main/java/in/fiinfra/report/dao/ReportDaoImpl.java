package in.fiinfra.report.dao;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.ClientActionPlan;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.utility.GoalData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("reportDao")
public class ReportDaoImpl implements ReportDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private static final String SP_GET_GOALS_DETAILS_FOR_PARTY_ID = "{CALL usp_DIY_getGoalsDetailsForPartyId(?,?)}";
	private static final String SP_GET_GOALS_FOR_PARTYID = "{CALL usp_DIY_getGoalsForPartyId(?)}";
	private static final String SP_GET_PLANNING_FOR_PARTYID = "{CALL usp_DIY_getPlanningForPartyId(?,?)}";
	private static final String SP_GET_DOCUMENTS_ID_FOR_PARTY_ID = "{CALL usp_DIY_getDocumentIdForPartyId(?)}";
	private static final String SP_INSERT_OR_UPDATE_DOCUMENTIDS_FOR_PARTYID = "{CALL usp_DIY_insertOrUpdateDocumentIDsForPartyId(?)}";
	private static final String SP_GET_ANALYSISREPORT_FOR_PARTY_ID = "{CALL usp_DIY_getClientActionPlan(?)}";
	private static final String SP_GET_ALL_RECOMMENDATION_FOR_PARTNER_PARTY_ID = "{CALL usp_DIY_getAllRecommendationForPartyId(?,?)}";
	private static final String SP_SAVE_ANALYSIS_REPORTS_FOR_BATCH = "{CALL usp_DIY_saveAnalysisReportsForBatch(?,?,?,?,?)}";
	
	@Override
	public AdviserGoals getGoalsDetailsForPartyId(Integer partyId,String flag) {
		
		return jdbcTemplate.queryForObject(SP_GET_GOALS_DETAILS_FOR_PARTY_ID, new Object[] {partyId,flag}, new BeanPropertyRowMapper<AdviserGoals>(AdviserGoals.class));
	}

	@Override
	public List<GoalData> getGoalsForPartyId(Integer partyId) {
		
		return jdbcTemplate.query(SP_GET_GOALS_FOR_PARTYID, new Object[] {partyId}, new BeanPropertyRowMapper<GoalData>(GoalData.class));
	}

	@Override
	public Suggestion getPlanningForPartyId(Integer partyId,String reportFlag) {
		
		return jdbcTemplate.queryForObject(SP_GET_PLANNING_FOR_PARTYID, new Object[] {partyId,reportFlag}, new BeanPropertyRowMapper<Suggestion>(Suggestion.class));
	}

	@Override
	public Party getDocumentIdsForPartyId(Integer partyId) {
		
		return jdbcTemplate.queryForObject(SP_GET_DOCUMENTS_ID_FOR_PARTY_ID, new Object[] {partyId}, new BeanPropertyRowMapper<Party>(Party.class));
	}

	@Override
	public boolean insertOrUpdateDocumentIdsForPartyId(String documentXml) {
		
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_DOCUMENTIDS_FOR_PARTYID, new Object[] {documentXml});
		return true;
	}
	
	@Override
	public  List<ClientActionPlan> getAnalysisReportForPartyId( Integer partyId ){
		return jdbcTemplate.query(SP_GET_ANALYSISREPORT_FOR_PARTY_ID, new Object[] {partyId}, new BeanPropertyRowMapper<ClientActionPlan>(ClientActionPlan.class));
	}

	@Override
	public List<AdviceRecommendation> getAllRecommendationCombination(Integer partyId,Integer sectionTypeId) {
		
		return jdbcTemplate.query(SP_GET_ALL_RECOMMENDATION_FOR_PARTNER_PARTY_ID, new Object[] {partyId, sectionTypeId}, new BeanPropertyRowMapper<AdviceRecommendation>(AdviceRecommendation.class));
	}

	@Override
	public boolean saveAnalysisReportForBatch(Integer partyId,
			Integer isAnalysisGeneration, Integer isActionPlanGeneration,
			Integer analysiReportType, Integer lastModifiedBy) {
		
		jdbcTemplate.update(SP_SAVE_ANALYSIS_REPORTS_FOR_BATCH, new Object[] {partyId,isAnalysisGeneration,isActionPlanGeneration,analysiReportType,lastModifiedBy});
		return true;
	}
}
