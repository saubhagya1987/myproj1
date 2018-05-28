package in.fiinfra.suggestion.dao;

import in.fiinfra.common.diy.models.ProductData;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.util.CommonStoredProcedure;

import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("suggestionDao")
public class SuggestionDaoImpl implements SuggestionDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private static final String SP_SAVE_SUGGESTION_FOR_EMERGENCY = "{CALL usp_DIY_saveAnalysisForEmergency(?)}";
	private static final String SP_SAVE_SUGGESTION_FOR_LOANSTATUS = "{CALL usp_DIY_saveAnalysisForLoanStatus(?)}";
	private static final String SP_SAVE_SUGGESTION_FOR_RISKCOVER = "{CALL usp_DIY_saveAnalysisForRiskCover(?)}";
	private static final String SP_GET_RETIREMENT_OUTPUT_FOR_PARTYID = "{CALL usp_DIY_getRetirementOutput(?)}";
	
	@Override
	public boolean saveSuggestionForEmergency(Integer partyId) {
		
		jdbcTemplate.update(SP_SAVE_SUGGESTION_FOR_EMERGENCY, new Object[] {partyId});
		return true;
	}

	@Override
	public boolean saveSuggestionForLoanStatus(Integer partyId) {
		
		jdbcTemplate.update(SP_SAVE_SUGGESTION_FOR_LOANSTATUS, new Object[] {partyId});
		return true;
	}

	@Override
	public boolean saveSuggestionForRiskCover(Integer partyId) {
		
		jdbcTemplate.update(SP_SAVE_SUGGESTION_FOR_RISKCOVER, new Object[] {partyId});
		return true;
	}
	
	@Override
	public Suggestion getSuggestionForCashFlow(Integer partyId) {
		
		Suggestion suggestion = new Suggestion();
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
		
		if( storedProcedureResult.get("monthlyincome") != null )
		{
			suggestion.setMonthlyincome((String)storedProcedureResult.get("monthlyincome"));	
		} else {	
			suggestion.setMonthlyincome("0");
		}
		if( storedProcedureResult.get("expence") != null )
		{
			suggestion.setExpence((String)storedProcedureResult.get("expence"));	
		} else {	
			suggestion.setExpence("0");
		}
		if( storedProcedureResult.get("loanreapayment") != null )
		{
			suggestion.setLoanreapayment((String)storedProcedureResult.get("loanreapayment"));	
		} else {	
			suggestion.setLoanreapayment("0");
		}
		if( storedProcedureResult.get("surplus") != null )
		{
			suggestion.setSurplus((String)storedProcedureResult.get("surplus"));	
		} else {	
			suggestion.setSurplus("0");
		}
		if( storedProcedureResult.get("haveToInvest") != null )
		{
			suggestion.setHavetoinvest((String)storedProcedureResult.get("haveToInvest"));	
		} else {	
			suggestion.setHavetoinvest("0");
		}
		if( storedProcedureResult.get("currentInvest") != null )
		{
			suggestion.setCurrentinvest((String)storedProcedureResult.get("currentInvest"));	
		} else {	
			suggestion.setCurrentinvest("0");
		}
		
		return suggestion;
	}

	@Override
	public Suggestion getSuggestionForEmergency(Integer partyId) {
		
		Suggestion suggestion = new Suggestion();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getSuggestionForEmergency");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter MonthlyExpence = new SqlOutParameter("MonthlyExpence", Types.VARCHAR);
		SqlOutParameter NoOfMonthsWoIncome = new SqlOutParameter("NoOfMonthsWoIncome", Types.INTEGER);
		SqlOutParameter MinimumEmergncyFund = new SqlOutParameter("MinimumEmergncyFund", Types.VARCHAR);
		SqlOutParameter monthlyincome = new SqlOutParameter("monthlyincome", Types.VARCHAR);
		SqlOutParameter MinEmergencyNoOfMonths = new SqlOutParameter("MinEmergencyNoOfMonths", Types.INTEGER);
		SqlOutParameter MonthlyEmi = new SqlOutParameter("MonthlyEmi", Types.VARCHAR);
		SqlParameter[] param = {PartyId,MonthlyExpence,NoOfMonthsWoIncome,MinimumEmergncyFund, monthlyincome,MinEmergencyNoOfMonths,MonthlyEmi};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		
		if( storedProcedureResult.get("MonthlyExpence") != null )
		{
			suggestion.setMonthlyExpence((String)storedProcedureResult.get("MonthlyExpence"));	
		} else {	
			suggestion.setMonthlyExpence("0");
		}
		if( storedProcedureResult.get("NoOfMonthsWoIncome") != null )
		{
			suggestion.setNoOfMonthsWoIncome((Integer)storedProcedureResult.get("NoOfMonthsWoIncome"));	
		} else {	
			suggestion.setNoOfMonthsWoIncome(0);
		}
		if( storedProcedureResult.get("MinimumEmergncyFund") != null )
		{
			suggestion.setMinimumEmergncyFund((String)storedProcedureResult.get("MinimumEmergncyFund"));	
		} else {	
			suggestion.setMinimumEmergncyFund("0");
		}
		if( storedProcedureResult.get("monthlyincome") != null )
		{
			suggestion.setMonthlyincome((String)storedProcedureResult.get("monthlyincome"));	
		} else {	
			suggestion.setMonthlyincome("0");
		}
		if( storedProcedureResult.get("MinEmergencyNoOfMonths") != null )
		{
			suggestion.setMinEmergencyNoOfMonths((Integer)storedProcedureResult.get("MinEmergencyNoOfMonths"));	
		} else {	
			suggestion.setMinEmergencyNoOfMonths(0);
		}
		if( storedProcedureResult.get("MonthlyEmi") != null )
		{
			suggestion.setMonthlyEmi((String)storedProcedureResult.get("MonthlyEmi"));	
		} else {	
			suggestion.setMonthlyEmi("0");
		}
		return suggestion;
	}

	@Override
	public Suggestion getSuggestionForLoanStatus(Integer partyId) {
		
		Suggestion suggestion = new Suggestion();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getSuggestionForLoanStatus");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter LoanEmiPercentage = new SqlOutParameter("LoanEmiPercentage", Types.VARCHAR);
		SqlOutParameter LoanInFuture = new SqlOutParameter("LoanInFuture", Types.VARCHAR);
		SqlOutParameter Age = new SqlOutParameter("Age", Types.INTEGER);
		SqlParameter[] param = {PartyId,LoanEmiPercentage,LoanInFuture,Age};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		if( storedProcedureResult.get("LoanEmiPercentage") != null )
		{
			suggestion.setLoanEmiPercent((String)storedProcedureResult.get("LoanEmiPercentage"));	
		} else {	
			suggestion.setLoanEmiPercent("0");
		}
		if( storedProcedureResult.get("LoanInFuture") != null )
		{
			suggestion.setLoanInFuture((String)storedProcedureResult.get("LoanInFuture"));	
		} else {	
			suggestion.setLoanInFuture("0");
		}
		if( storedProcedureResult.get("Age") != null )
		{
			suggestion.setAge((Integer)storedProcedureResult.get("Age"));	
		} else {	
			suggestion.setAge(0);
		}
		return suggestion;
	}

	@Override
	public Suggestion getSuggestionForRiskCover(Integer partyId) {
		
		Suggestion suggestion = new Suggestion();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getSuggestionForRiskCover");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter LifeIdealCover = new SqlOutParameter("LifeIdealCover", Types.VARCHAR);
		SqlOutParameter LifeCurrentCover = new SqlOutParameter("LifeCurrentCover", Types.VARCHAR);
		SqlOutParameter HealthIdealCover = new SqlOutParameter("HealthIdealCover", Types.VARCHAR);
		SqlOutParameter HealthCurrentCover = new SqlOutParameter("HealthCurrentCover", Types.VARCHAR);
		SqlOutParameter accidentIdealCover = new SqlOutParameter("accidentIdealCover", Types.VARCHAR);
		SqlOutParameter accidentCurrentCover = new SqlOutParameter("accidentCurrentCover", Types.VARCHAR);
		SqlOutParameter criticalIdealCover = new SqlOutParameter("criticalIdealCover", Types.VARCHAR);
		SqlOutParameter criticalCurrentCover = new SqlOutParameter("criticalCurrentCover", Types.VARCHAR);
		SqlOutParameter LifeMethod = new SqlOutParameter("LifeMethod", Types.VARCHAR);
		SqlParameter[] param = {PartyId,LifeIdealCover,LifeCurrentCover,HealthIdealCover,HealthCurrentCover,accidentIdealCover,
				accidentCurrentCover,criticalIdealCover,criticalCurrentCover,LifeMethod};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		
		if( storedProcedureResult.get("LifeIdealCover") != null )
		{
			suggestion.setLifeIdealCover((String)storedProcedureResult.get("LifeIdealCover"));	
		} else {	
			suggestion.setLifeIdealCover("0");
		}
		if( storedProcedureResult.get("LifeCurrentCover") != null )
		{
			suggestion.setLifeCurrentCover((String)storedProcedureResult.get("LifeCurrentCover"));	
		} else {	
			suggestion.setLifeCurrentCover("0");
		}
		if( storedProcedureResult.get("HealthIdealCover") != null )
		{
			suggestion.setHealthIdealCover((String)storedProcedureResult.get("HealthIdealCover"));	
		} else {	
			suggestion.setHealthIdealCover("0");
		}
		if( storedProcedureResult.get("HealthCurrentCover") != null )
		{
			suggestion.setHealthCurrentCover((String)storedProcedureResult.get("HealthCurrentCover"));	
		} else {	
			suggestion.setHealthCurrentCover("0");
		}
		if( storedProcedureResult.get("accidentIdealCover") != null )
		{
			suggestion.setAccidentIdealCover((String)storedProcedureResult.get("accidentIdealCover"));	
		} else {	
			suggestion.setAccidentIdealCover("0");
		}
		if( storedProcedureResult.get("accidentCurrentCover") != null )
		{
			suggestion.setAccidentCurrentCover((String)storedProcedureResult.get("accidentCurrentCover"));	
		} else {	
			suggestion.setAccidentCurrentCover("0");
		}	
		if( storedProcedureResult.get("criticalIdealCover") != null )
		{
			suggestion.setCriticalIdealCover((String)storedProcedureResult.get("criticalIdealCover"));	
		} else {	
			suggestion.setCriticalIdealCover("0");
		}
		if( storedProcedureResult.get("criticalCurrentCover") != null )
		{
			suggestion.setCriticalCurrentCover((String)storedProcedureResult.get("criticalCurrentCover"));	
		} else {	
			suggestion.setCriticalCurrentCover("0");
		}
		suggestion.setGoalName((String)storedProcedureResult.get("LifeMethod"));
		return suggestion;
	}

	@Override
	public Suggestion getSuggestionForRetriement(Integer partyId) {
		
		Suggestion suggestion = new Suggestion();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getSuggestionForRetriement");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter GoalYear = new SqlOutParameter("GoalYear", Types.INTEGER);
		SqlOutParameter corpusNeeded = new SqlOutParameter("corpusNeeded", Types.VARCHAR);
		SqlOutParameter corpusAccumulated = new SqlOutParameter("corpusAccumulated", Types.VARCHAR);
		SqlOutParameter regularInvest = new SqlOutParameter("regularInvest", Types.VARCHAR);
		SqlOutParameter lumpsum = new SqlOutParameter("lumpsum", Types.VARCHAR);
		SqlOutParameter PlanningUpTo = new SqlOutParameter("PlanningUpTo", Types.VARCHAR);
		SqlOutParameter AmountNeeded = new SqlOutParameter("AmountNeeded", Types.VARCHAR);
		SqlParameter[] param = {PartyId,GoalYear,corpusNeeded,corpusAccumulated,regularInvest,lumpsum,PlanningUpTo,AmountNeeded};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		
		if( storedProcedureResult.get("GoalYear") != null )
		{
			suggestion.setGoalYear((Integer)storedProcedureResult.get("GoalYear"));	
		} else {	
			suggestion.setGoalYear(0);
		}
		if( storedProcedureResult.get("corpusNeeded") != null )
		{
			suggestion.setCorpusNeeded((String)storedProcedureResult.get("corpusNeeded"));	
		} else {	
			suggestion.setCorpusNeeded("0");
		}
		if( storedProcedureResult.get("corpusAccumulated") != null )
		{
			suggestion.setCorpusAccumulated((String)storedProcedureResult.get("corpusAccumulated"));	
		} else {	
			suggestion.setCorpusAccumulated("0");
		}
		if( storedProcedureResult.get("regularInvest") != null )
		{
			suggestion.setRegularInvest((String)storedProcedureResult.get("regularInvest"));	
		} else {	
			suggestion.setRegularInvest("0");
		}
		if( storedProcedureResult.get("lumpsum") != null )
		{
			suggestion.setLumpsum((String)storedProcedureResult.get("lumpsum"));	
		} else {	
			suggestion.setLumpsum("0");
		}
		if( storedProcedureResult.get("PlanningUpTo") != null )
		{
			suggestion.setRetirementPlanningUpTo((String)storedProcedureResult.get("PlanningUpTo"));	
		} else {	
			suggestion.setRetirementPlanningUpTo("0");
		}
		if( storedProcedureResult.get("AmountNeeded") != null )
		{
			suggestion.setAmountNeeded((String)storedProcedureResult.get("AmountNeeded"));	
		} else {	
			suggestion.setAmountNeeded("0");
		}
		return suggestion;
	}

	@Override
	public Suggestion getSuggestionDataForGoal(Integer partyId, Integer goalId) {
		
		Suggestion suggestion = new Suggestion();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getSuggestionForGoals");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlParameter GoalId = new SqlParameter("GoalId", Types.INTEGER);
		SqlOutParameter GoalName = new SqlOutParameter("GoalName", Types.VARCHAR);
		SqlOutParameter GoalYear = new SqlOutParameter("GoalYear", Types.INTEGER);
		SqlOutParameter InvestAmount = new SqlOutParameter("InvestAmount", Types.VARCHAR);
		SqlOutParameter GoalLumpSumAmount = new SqlOutParameter("GoalLumpSumAmount", Types.VARCHAR);
		SqlOutParameter Goalachievement = new SqlOutParameter("Goalachievement", Types.VARCHAR);
		SqlOutParameter Description = new SqlOutParameter("Description", Types.VARCHAR);
		SqlParameter[] param = {PartyId,GoalId,GoalName,GoalYear,InvestAmount,GoalLumpSumAmount,Goalachievement,Description};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		paramValue.put("GoalId", goalId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		
		suggestion.setGoalName(storedProcedureResult.get("GoalName").toString());
		
		if( storedProcedureResult.get("GoalYear") != null )
		{
			suggestion.setGoalYear((Integer)storedProcedureResult.get("GoalYear"));	
		} else {	
			suggestion.setGoalYear(0);
		}
		if( storedProcedureResult.get("InvestAmount") != null )
		{
			suggestion.setInvestAmount((String)storedProcedureResult.get("InvestAmount"));	
		} else {	
			suggestion.setInvestAmount("0");
		}
		if( storedProcedureResult.get("GoalLumpSumAmount") != null )
		{
			suggestion.setGoalLumpSumAmount((String)storedProcedureResult.get("GoalLumpSumAmount"));	
		} else {	
			suggestion.setGoalLumpSumAmount("0");
		}
		if( storedProcedureResult.get("Goalachievement") != null )
		{
			suggestion.setGoalachievement((String)storedProcedureResult.get("Goalachievement"));	
		} else {	
			suggestion.setGoalachievement("0");
		}
		suggestion.setDescription(storedProcedureResult.get("Description").toString());
		
		return suggestion;
	}

	@Override
	public List<ProductData> getRetirementOutput(Integer partyId) {
		List<ProductData> productDataList = jdbcTemplate.query(SP_GET_RETIREMENT_OUTPUT_FOR_PARTYID, new Object[] {partyId}, new BeanPropertyRowMapper<ProductData>(ProductData.class));
		return productDataList;
	}	
}
