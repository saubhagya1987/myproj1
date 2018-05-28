package in.fiinfra.analysis.dao;

import in.fiinfra.common.diy.models.CashFlowData;
import in.fiinfra.common.diy.models.DcAnalysisHelper;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.utility.GoalData;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("analysisDao")
public class AnalysisDaoImpl implements AnalysisDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
//	private static final String SP_GET_ANALYSIS_FOR_EMERGENCY = "{CALL usp_DIY_getAnalysisForEmergency(?)}";
//	private static final String SP_GET_ANALYSIS_FOR_RISK_COVER = "{CALL usp_DIY_getAnalysisForRiskCover}";
//	private static final String SP_GET_ANALYSIS_FOR_LOAN_STATUS = "{CALL usp_DIY_getAnalysisForLoanStatus}";
//	private static final String SP_GET_ANALYSIS_FOR_SUCCESSION = "{CALL usp_DIY_getAnalysisForSuccession}";
	private static final String SP_DC_OUTPUT_RISK_PROFILE="{CALL usp_DIY_DCOutputRiskProfile}";
	private static final String SP_GET_CASHFLOW_ANALYSIS="{CALL usp_DIY_getCashFlowData(?)}";
	
	
	@Override
	public DcAnalysisHelper getAnalysisForEmergency(Integer partyId) {
		
		DcAnalysisHelper dcAnalysisHelper =  new DcAnalysisHelper();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getAnalysisForEmergency");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter FirstTake = new SqlOutParameter("FirstTake", Types.VARCHAR);
		SqlOutParameter Analysis = new SqlOutParameter("Analysis", Types.VARCHAR);
		SqlOutParameter SuccessMsg = new SqlOutParameter("SuccessMsg", Types.VARCHAR);
		SqlOutParameter ErrorMsg = new SqlOutParameter("ErrorMsg", Types.VARCHAR);
		SqlParameter[] param = {PartyId,FirstTake,Analysis,SuccessMsg,ErrorMsg};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		
		dcAnalysisHelper.setFirstTake((String)storedProcedureResult.get("FirstTake"));
		dcAnalysisHelper.setAnalysis((String)storedProcedureResult.get("Analysis"));
		dcAnalysisHelper.setSuccessMsg((String)storedProcedureResult.get("SuccessMsg"));
		dcAnalysisHelper.setErrorMsg((String)storedProcedureResult.get("ErrorMsg"));
		
		return dcAnalysisHelper;
	}

	@Override
	public DcAnalysisHelper getAnalysisForRiskCover(Integer partyId) {
	
		DcAnalysisHelper dcAnalysisHelper =  new DcAnalysisHelper();
		String Analysis = "";
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getAnalysisForRiskCover");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter FirstTakeLife = new SqlOutParameter("FirstTakeLife", Types.VARCHAR);
		SqlOutParameter FirstTakeHealth = new SqlOutParameter("FirstTakeHealth", Types.VARCHAR);
		SqlOutParameter FirstTakeCritical = new SqlOutParameter("FirstTakeCritical", Types.VARCHAR);
		SqlOutParameter FirstTakeAccident = new SqlOutParameter("FirstTakeAccident", Types.VARCHAR);
		SqlOutParameter Analysis1 = new SqlOutParameter("Analysis1", Types.VARCHAR);
		SqlOutParameter Analysis2 = new SqlOutParameter("Analysis2", Types.VARCHAR);
		SqlOutParameter Analysis3 = new SqlOutParameter("Analysis3", Types.VARCHAR);
		SqlOutParameter Analysis4 = new SqlOutParameter("Analysis4", Types.VARCHAR);
		SqlOutParameter Analysis5 = new SqlOutParameter("Analysis5", Types.VARCHAR);
		SqlOutParameter Analysis6 = new SqlOutParameter("Analysis6", Types.VARCHAR);
		SqlOutParameter Analysis7 = new SqlOutParameter("Analysis7", Types.VARCHAR);
		SqlOutParameter Analysis8 = new SqlOutParameter("Analysis8", Types.VARCHAR);
		SqlOutParameter SuccessMsg = new SqlOutParameter("SuccessMsg", Types.VARCHAR);
		SqlOutParameter ErrorMsg = new SqlOutParameter("ErrorMsg", Types.VARCHAR);
		SqlOutParameter InsuranceMethod = new SqlOutParameter("InsuranceMethod", Types.VARCHAR);
		SqlParameter[] param = {PartyId,FirstTakeLife,FirstTakeHealth,FirstTakeCritical,FirstTakeAccident,
				Analysis1,Analysis2,Analysis3,Analysis4,Analysis5,Analysis6,Analysis7,Analysis8,SuccessMsg,ErrorMsg,InsuranceMethod};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		Analysis+= (String)storedProcedureResult.get("Analysis1")+",";
		Analysis+= (String)storedProcedureResult.get("Analysis2")+",";
		Analysis+= (String)storedProcedureResult.get("Analysis3")+",";
		Analysis+= (String)storedProcedureResult.get("Analysis4")+",";
		Analysis+= (String)storedProcedureResult.get("Analysis5")+",";
		Analysis+= (String)storedProcedureResult.get("Analysis6")+",";
		Analysis+= (String)storedProcedureResult.get("Analysis7")+",";
		Analysis+= (String)storedProcedureResult.get("Analysis8");
		dcAnalysisHelper.setAnalysis(Analysis);
		dcAnalysisHelper.setFirstTakeLife((String)storedProcedureResult.get("FirstTakeLife"));
		dcAnalysisHelper.setFirstTakeHealth((String)storedProcedureResult.get("FirstTakeHealth"));
		dcAnalysisHelper.setFirstTakeCritical((String)storedProcedureResult.get("FirstTakeCritical"));
		dcAnalysisHelper.setFirstTakeAccident((String)storedProcedureResult.get("FirstTakeAccident"));
		dcAnalysisHelper.setSuccessMsg((String)storedProcedureResult.get("SuccessMsg"));
		dcAnalysisHelper.setErrorMsg((String)storedProcedureResult.get("ErrorMsg"));
		dcAnalysisHelper.setInsuranceMethod((String)storedProcedureResult.get("InsuranceMethod"));
		
		return dcAnalysisHelper;
	}

	@Override
	public DcAnalysisHelper getAnalysisForLoanStatus(Integer partyId) {
		
		DcAnalysisHelper dcAnalysisHelper =  new DcAnalysisHelper();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getAnalysisForLoanStatus");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter FirstTake = new SqlOutParameter("FirstTake", Types.VARCHAR);
		SqlOutParameter Analysis1 = new SqlOutParameter("Analysis1", Types.VARCHAR);
		SqlOutParameter SuccessMsg = new SqlOutParameter("SuccessMsg", Types.VARCHAR);
		SqlOutParameter ErrorMsg = new SqlOutParameter("ErrorMsg", Types.VARCHAR);
		SqlParameter[] param = {PartyId,FirstTake,Analysis1,SuccessMsg,ErrorMsg};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		dcAnalysisHelper.setAnalysis((String)storedProcedureResult.get("Analysis1"));
		dcAnalysisHelper.setFirstTake((String)storedProcedureResult.get("FirstTake"));
		dcAnalysisHelper.setSuccessMsg((String)storedProcedureResult.get("SuccessMsg"));
		dcAnalysisHelper.setErrorMsg((String)storedProcedureResult.get("ErrorMsg"));
		
		return dcAnalysisHelper;
	}

	@Override
	public DcAnalysisHelper getAnalysisForSuccession(Integer partyId) {
				
		DcAnalysisHelper dcAnalysisHelper =  new DcAnalysisHelper();
		String Analysis = "";
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getAnalysisForSuccession");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter FirstTake = new SqlOutParameter("FirstTake", Types.VARCHAR);
		SqlOutParameter Analysis1 = new SqlOutParameter("Analysis1", Types.VARCHAR);
		SqlOutParameter Analysis2 = new SqlOutParameter("Analysis2", Types.VARCHAR);
		SqlOutParameter Analysis3 = new SqlOutParameter("Analysis3", Types.VARCHAR);
		SqlOutParameter SuccessMsg = new SqlOutParameter("SuccessMsg", Types.VARCHAR);
		SqlOutParameter ErrorMsg = new SqlOutParameter("ErrorMsg", Types.VARCHAR);
		SqlParameter[] param = {PartyId,FirstTake,Analysis1,Analysis2,Analysis3,SuccessMsg,ErrorMsg};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		Analysis+= (String)storedProcedureResult.get("Analysis1")+",";
		Analysis+= (String)storedProcedureResult.get("Analysis2")+",";
		Analysis+= (String)storedProcedureResult.get("Analysis3");
		dcAnalysisHelper.setAnalysis(Analysis);
		dcAnalysisHelper.setFirstTake((String)storedProcedureResult.get("FirstTake"));
		dcAnalysisHelper.setSuccessMsg((String)storedProcedureResult.get("SuccessMsg"));
		dcAnalysisHelper.setErrorMsg((String)storedProcedureResult.get("ErrorMsg"));
		
		return dcAnalysisHelper;
	}

	@Override
	public DcAnalysisHelper getAnalysisForCashFlow(Integer partyId) {
		
		DcAnalysisHelper dcAnalysisHelper =  new DcAnalysisHelper();
		String Analysis = "";
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getSuggestionForCashFlow");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter monthlyincome = new SqlOutParameter("monthlyincome", Types.VARCHAR);
		SqlOutParameter expence = new SqlOutParameter("expence", Types.VARCHAR);
		SqlOutParameter loanreapayment = new SqlOutParameter("loanreapayment", Types.VARCHAR);
		SqlOutParameter surplus = new SqlOutParameter("surplus", Types.VARCHAR);
		SqlOutParameter haveToInvest = new SqlOutParameter("haveToInvest", Types.VARCHAR);
		SqlOutParameter currentInvest = new SqlOutParameter("currentInvest", Types.VARCHAR);
		SqlParameter[] param = {PartyId,monthlyincome,expence,loanreapayment,surplus,haveToInvest,currentInvest};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		Analysis+= (String)storedProcedureResult.get("monthlyincome")+",";
		Analysis+= (String)storedProcedureResult.get("expence")+",";
		Analysis+= (String)storedProcedureResult.get("loanreapayment")+",";
		Analysis+= (String)storedProcedureResult.get("surplus")+",";
		Analysis+= (String)storedProcedureResult.get("haveToInvest")+",";
		Analysis+= (String)storedProcedureResult.get("currentInvest");
		dcAnalysisHelper.setAnalysis(Analysis);
		
		return dcAnalysisHelper;
	}
	
	@Override
	public GoalData getAnalysisForGoals(Integer partyId, Integer goalId,Integer sectionId) {
		
		GoalData goalData = new GoalData();
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getAnalysisForGoals");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlParameter GoalId = new SqlParameter("GoalId", Types.INTEGER);
		SqlParameter SectionId = new SqlParameter("SectionId", Types.INTEGER);
		SqlOutParameter FirstTake = new SqlOutParameter("FirstTake", Types.FLOAT);
		SqlOutParameter CurrentYear = new SqlOutParameter("CurrentYear", Types.INTEGER);
		SqlOutParameter TargetYear = new SqlOutParameter("TargetYear", Types.INTEGER);
		SqlOutParameter AmountPV = new SqlOutParameter("AmountPV", Types.FLOAT);
		SqlOutParameter AmountFV = new SqlOutParameter("AmountFV", Types.FLOAT);
		SqlOutParameter Description = new SqlOutParameter("Description", Types.VARCHAR);
		SqlOutParameter shortFall = new SqlOutParameter("shortFall", Types.FLOAT);
		SqlParameter[] param = {PartyId,GoalId,SectionId,AmountPV,AmountFV,TargetYear,CurrentYear,FirstTake,Description,shortFall};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		paramValue.put("GoalId", goalId);
		paramValue.put("SectionId", sectionId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		if(storedProcedureResult.get("AmountPV") != null){
			goalData.setGoalAmountPv(storedProcedureResult.get("AmountPV").toString());
		}
		
		if(storedProcedureResult.get("AmountFV") != null){
			goalData.setGoalAmountFv(storedProcedureResult.get("AmountFV").toString());
		}
		
		goalData.setGoalStartYear((Integer)storedProcedureResult.get("TargetYear"));
		goalData.setCurrentYear((Integer)storedProcedureResult.get("CurrentYear"));
		goalData.setResult((Double)storedProcedureResult.get("FirstTake"));
		goalData.setDescription(storedProcedureResult.get("Description").toString());
		goalData.setShortfall((Double)storedProcedureResult.get("shortFall"));
		
		return goalData;
	}

	@Override
	public Integer getAnalysisForDashboardGoals(Integer advisorPartyId,
			Integer contactPartyId) {
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_DCOutputRiskProfile");
		SqlParameter ContactPartyId = new SqlParameter("contactPartyId", Types.INTEGER);
		SqlParameter AdvisorPartyId = new SqlParameter("advisorPartyId", Types.INTEGER);
		SqlOutParameter AnalysisResult = new SqlOutParameter("analysisResult", Types.INTEGER);
		SqlParameter[] param = {ContactPartyId,AdvisorPartyId,AnalysisResult};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("contactPartyId",contactPartyId);
		paramValue.put("advisorPartyId", advisorPartyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		
		return (Integer)storedProcedureResult.get("analysisResult");
	}
	
	
	
	@Override
	public CashFlowData getAnalysisForCashFlowData(Integer partyId) 
	{
		return jdbcTemplate.queryForObject(SP_GET_CASHFLOW_ANALYSIS, new Object[]{partyId}, new BeanPropertyRowMapper<CashFlowData>(CashFlowData.class));
	}
}
