package in.fiinfra.alerts.dao;

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

import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.diy.models.Alerts;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.util.CommonStoredProcedure;
@Repository("alertsDao")
public class AlertsDaoImpl implements AlertsDao 
{
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private static final String SP_GET_TASK_ALERTS_FOR_PARTYID = "{CALL usp_DIY_getTaskAlertsForPartyId(?,?)}";
	private static final String SP_GET_QUERY_ALERTS_FOR_PARTYID = "{CALL usp_DIY_getQueryAlertsForPartyId(?,?)}";
	
	
	@Override
	public Alerts getAlertsForPartyId(Integer partyId,Integer nodeId) 
	{
		Alerts alerts = new Alerts();
		List<Task> taskList =  jdbcTemplate.query(SP_GET_TASK_ALERTS_FOR_PARTYID, new Object[] {partyId,nodeId} , new BeanPropertyRowMapper<Task>(Task.class));
		List<QueryData> QueryList = jdbcTemplate.query(SP_GET_QUERY_ALERTS_FOR_PARTYID, new Object[]{partyId,nodeId}, new BeanPropertyRowMapper<QueryData>(QueryData.class));
		alerts.setListOfQuery(QueryList);
		alerts.setListOfTask(taskList);
		return alerts;
	}

	@Override
	public Integer getNumberOfAlertsForPartyId(Integer partyID,Integer nodeID) 
	{
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getNumberOfAlertsForPartyId");
		SqlParameter partyId = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter nodeId = new SqlParameter("nodeId", Types.INTEGER);
		SqlOutParameter Result = new SqlOutParameter("Result", Types.INTEGER);
		SqlParameter[] param = {partyId,nodeId,Result};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("partyId", partyID);
		paramValue.put("nodeId", nodeID);
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		Integer result2 =(Integer) storedProcedureResult.get("Result");
		return result2;
	}

}
