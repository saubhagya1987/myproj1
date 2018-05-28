package in.fiinfra.goal.dao;

import in.fiinfra.common.diy.models.AdviserGoalChart;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.GoalAttribute;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("goalDao")
public class GoalDaoImpl implements GoalDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	DataSourceProvider dataSourceProvider;
	
	private static final String SP_Save_Goal_Attributes = "{CALL usp_DIY_saveFutureGoals(?,?,?,?,?)}";
	private static final String SP_GET_FUTURE_GOALS = "{CALL usp_DIY_getFutureGoals(?,?)}";
	private static final String SP_GET_FUTURE_GOAL_ATTRIBUTES = "{CALL usp_DIY_getFutureGoalAttributes(?)}";
	private static final String SP_UPDATE_FUTURE_GOALS = "{CALL usp_DIY_updateFutureGoals(?,?,?,?)}";
	private static final String SP_GET_LIST_OF_FUTURE_GOALS_FOR_PARTY_ID = "{CALL usp_DIY_getListOfFutureGoalsForPartyId(?)}";
	private static final String SP_GET_FUTURE_GOALS_FOR_GOAL_ID = "{CALL usp_DIY_getFutureGoalsForGoalId(?)}";
	private static final String SP_GET_GOALS_FOR_ADVISER = "{CALL usp_DIY_getGoalsForAdviserPartyId(?,?)}";
	private static final String SP_GET_GOAL_CHART_FOR_ADVISER = "{CALL usp_DIY_getGoalsChartForAdviserPartyId(?)}";
	private static final String SP_GET_COUNT_OF_FUTURE_GOALS_FOR_PARTY_ID = "{CALL usp_DIY_getCountOfFutureGoalsForPartyId(?)}";
	private static final String SP_GET_PLANID_FOR_PATYID =  "{CALL usp_DIY_getPlanIdForPartyId(?)}";
	private static final String SP_SAVE_ALLOCATION = "{CALL usp_pp_DC_CalculateDCOutput(?,?)}";
	private static final String SP_DELETE_GOAL_FOR_GOALID = "{CALL usp_DIY_deleteGoalForGoalId(?)}";
	private static final String SP_GET_COUNT_OF_GOALS_FOR_GOALTYPEID = "{CALL usp_DIY_getCountOfGoalsForGoalTypeID(?,?)}";
	private static final String SP_SAVE_GOAL_PRIORITY = "{CALL usp_DIY_saveGoalPriority(?,?)}";
	private static final String SP_SAVE_EDUCATION_DATA = "{CALL usp_DIY_saveEducationDataToMaster(?,?,?,?,?)}";
	
	@Override
	public Integer saveFutureGoals(GoalData goalData) {
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_saveFutureGoals");
		SqlParameter PartyId = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter GoalDataXml = new SqlParameter("goalDataXml", Types.VARCHAR);
		SqlParameter AttributeXml = new SqlParameter("attributeXml", Types.VARCHAR);
		SqlParameter AttributeCount = new SqlParameter("attributeCount", Types.INTEGER);
		SqlOutParameter GoalId = new SqlOutParameter("goalPlanId", Types.INTEGER);
		
		SqlParameter[] param = {PartyId, GoalDataXml, AttributeXml, AttributeCount, GoalId};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("partyId", goalData.getPartyId());
		paramValue.put("goalDataXml", goalData.getGoalDataXml());
		paramValue.put("attributeXml", goalData.getAttributeXML());
		paramValue.put("attributeCount", goalData.getGoalAttributeList().size());
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		Integer goalId =(Integer) storedProcedureResult.get("goalPlanId");
			
		return goalId;
	}

	@Override
	public List<GoalData> getFutureGoals(Integer partyId, Integer goalTypeId) {
		
		List<GoalData> goalDataList = new ArrayList<GoalData>();
		List<GoalData> goalDatas = jdbcTemplate.query(SP_GET_FUTURE_GOALS, new Object[] {partyId, goalTypeId}, new BeanPropertyRowMapper<GoalData>(GoalData.class));
		DecimalFormat decimalFormat = new DecimalFormat("#.00");
		for (GoalData goalData : goalDatas) {
			List<GoalAttribute> goalAttributeList = jdbcTemplate.query(SP_GET_FUTURE_GOAL_ATTRIBUTES, new Object[] {goalData.getId()}, new BeanPropertyRowMapper<GoalAttribute>(GoalAttribute.class));
			Double goalAmount = Double.parseDouble(goalData.getGoalAmountPv());
			goalData.setGoalAmountPv(decimalFormat.format(goalAmount));
			goalData.setGoalAttributeList(goalAttributeList);
			goalDataList.add(goalData);
		}
		return goalDataList;
	}

	@Override
	public boolean updateFutureGoals(GoalData goalData) {
		
		Integer attributeCount=0;
		if(CollectionUtils.isNotEmpty( goalData.getGoalAttributeList()) )
		{
			attributeCount = goalData.getGoalAttributeList().size();
		}
		jdbcTemplate.update(SP_UPDATE_FUTURE_GOALS, new Object[] {goalData.getPartyId(), goalData.getGoalDataXml(), goalData.getAttributeXML(), attributeCount});
		return true;
	}

	@Override
	public List<GoalData> getListOfFutureGoalsForPartyId(Integer partyId) {
		
		List<GoalData> goalDataList = new ArrayList<GoalData>();
		List<GoalData> goalDatas = jdbcTemplate.query(SP_GET_LIST_OF_FUTURE_GOALS_FOR_PARTY_ID, new Object[] {partyId}, new BeanPropertyRowMapper<GoalData>(GoalData.class));
		DecimalFormat decimalFormat = new DecimalFormat("#.00");
		for (GoalData goalData : goalDatas) {
			List<GoalAttribute> goalAttributeList = jdbcTemplate.query(SP_GET_FUTURE_GOAL_ATTRIBUTES, new Object[] {goalData.getId()}, new BeanPropertyRowMapper<GoalAttribute>(GoalAttribute.class));
			Double goalAmount = Double.parseDouble(goalData.getGoalAmountPv());
			goalData.setGoalAmountPv(decimalFormat.format(goalAmount));
			goalData.setGoalAttributeList(goalAttributeList);
			goalDataList.add(goalData);
		}
		return goalDataList;
	}

	@Override
	public GoalData getFutureGoalForGoalId( Integer goalId) {
		
		GoalData goalData = jdbcTemplate.queryForObject(SP_GET_FUTURE_GOALS_FOR_GOAL_ID, new Object[] {goalId}, new BeanPropertyRowMapper<GoalData>(GoalData.class));
		Double amount = Double.parseDouble(goalData.getGoalAmountPv());
		DecimalFormat decimalFormat = new DecimalFormat("#.00");
		goalData.setGoalAmountPv(decimalFormat.format(amount));
		List<GoalAttribute> goalAttributeList = jdbcTemplate.query(SP_GET_FUTURE_GOAL_ATTRIBUTES, new Object[] {goalData.getId()}, new BeanPropertyRowMapper<GoalAttribute>(GoalAttribute.class));
		goalData.setGoalAttributeList(goalAttributeList);
		return goalData;
	}

	@Override
	public List<AdviserGoals> getGoalsForAdviser(Integer partyId,String nodeId) 
	{
		 List<AdviserGoals> goals = jdbcTemplate.query(SP_GET_GOALS_FOR_ADVISER,new Object[] {partyId,nodeId}, new BeanPropertyRowMapper<AdviserGoals>(AdviserGoals.class));
		 return goals;
	}
	
	@Override
	public List<AdviserGoalChart> getGoalChartForAdviser(Integer partyId) 
	{
		 List<AdviserGoalChart> goals = jdbcTemplate.query(SP_GET_GOAL_CHART_FOR_ADVISER,new Object[] {partyId}, new BeanPropertyRowMapper<AdviserGoalChart>(AdviserGoalChart.class));
		 return goals;
	}

	@Override
	public String getCountOfFutureGoalsForPartyId(Integer partyId) {
		return jdbcTemplate.queryForObject(SP_GET_COUNT_OF_FUTURE_GOALS_FOR_PARTY_ID, new Object[]{partyId},String.class);
	}

	@Override
	public Integer getPlanIdForPartyId(Integer partyId) {
		return jdbcTemplate.queryForObject(SP_GET_PLANID_FOR_PATYID, new Object[]{partyId},Integer.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean saveAllocation(Integer partyId, Integer lastModifiedby, Integer buId) {
//		jdbcTemplate.update(SP_SAVE_ALLOCATION, new Object[] {partyId,lastModifiedby});
		
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
			
			List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
			CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
					jdbcTemplate, "usp_pp_DC_CalculateDCOutput");
			SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
			SqlParameter LastModifiedby = new SqlParameter("LastModifiedby", Types.INTEGER);

			SqlParameter[] paramArray = { PartyId, LastModifiedby };
			myStoredProcedure.setParameters(paramArray);
			myStoredProcedure.compile();
			Map<String, Object> paranValues = new HashMap<String, Object>();
			paranValues.put("PartyId", partyId);
			paranValues.put("LastModifiedby", lastModifiedby);
			Map<String, Object> storedProcResult = myStoredProcedure.execute(paranValues);

			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
			
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
			
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-3");
			
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-4");
			
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-5");
			
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-6");
		
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-7");
			
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-8");
			
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-9");
			
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-10");
			
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-11");
			
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-12");
			
			return true;
	}

	@Override
	public boolean deleteGoalForGoalId(Integer goalId) {
		
		jdbcTemplate.update(SP_DELETE_GOAL_FOR_GOALID, new Object[] {goalId});
		return true;
	}

	@Override
	public Integer getNumberOfGoalsForGoalTypeID(Integer buId,
			Integer goalTypeId) {
		return jdbcTemplate.queryForObject(SP_GET_COUNT_OF_GOALS_FOR_GOALTYPEID, new Object[] {buId,goalTypeId}, Integer.class);
	}

	@Override
	public boolean saveGoalPriority(String goalDataXML, Integer partyId) {
		jdbcTemplate.update(SP_SAVE_GOAL_PRIORITY, new Object[]{partyId, goalDataXML});
		return true;
	}

	@Override
	public Boolean saveEducationData(String[] attributes) {
		jdbcTemplate.update(SP_SAVE_EDUCATION_DATA, new Object[]{attributes[0], attributes[1], attributes[2], attributes[3], attributes[4]});
		return true;
	}
}
