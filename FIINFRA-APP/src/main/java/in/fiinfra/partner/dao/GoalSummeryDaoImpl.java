package in.fiinfra.partner.dao;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlParameter;

import in.fiinfra.common.partner.AssetAllocationOfGoal;
import in.fiinfra.common.partner.GoalDetail;
import in.fiinfra.common.partner.GoalListData;
import in.fiinfra.common.partner.GoalSummeryData;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.util.DataSourceProvider;
import in.fiinfra.utility.dao.DCDaoImpl;

public class GoalSummeryDaoImpl implements GoalSummeryDao{
	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	private static final Logger logger = Logger.getLogger(DCDaoImpl.class);
	
	public List<GoalSummeryData> getGoalSummaryDetails(int partyId, int buId, int nodeId) {
	List <GoalSummeryData> lstGoalSummeryData =  new ArrayList<GoalSummeryData>();
	List <GoalSummeryData> lstGoalByDuration =  new ArrayList<GoalSummeryData>();
	List <GoalSummeryData> lstGoalByStatus =  new ArrayList<GoalSummeryData>();
	GoalSummeryData goalSummeryData ;
	GoalSummeryData goalByDuration;
	GoalSummeryData goalByStatus;
	List lstAllDataList = new ArrayList();
	jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
	List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
	CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
			jdbcTemplate, "usp_pp_getGoalSummery");
	SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
	SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
	SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
	// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
	SqlParameter[] paramArray = { partyIdParam,buIdParam,nodeIdParam };
	myStoredProcedure.setParameters(paramArray);
	myStoredProcedure.compile();
	Map<String, Object> paranValues = new HashMap<String, Object>();
	paranValues.put("partyId", partyId);
	paranValues.put("buId", buId);
	paranValues.put("nodeId", nodeId);
	//System.out.println("paranValues:--" + paranValues);
	Map<String, Object> storedProcResult = myStoredProcedure
			.execute(paranValues);
	//System.out.println("storedProcResult:---" + storedProcResult);
	l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
	//System.out.println("l:--" + l);
	if (l != null) {
		for (Map<String, Object> row : l) {
			goalSummeryData= new GoalSummeryData();
			goalSummeryData.setGoalAmount((String) row.get("Amount"));
			goalSummeryData.setGoalByTypeCount((String) row.get("goalCount"));
			goalSummeryData.setGoalName((String) row.get("CodeValue"));
			goalSummeryData.setGoalTypeId((Integer) row.get("CodeValueId"));
			lstGoalSummeryData.add(goalSummeryData);
		}
	}
	l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
	String duration = "";
	//int totalGoalByDurationCount;
	if (l != null) {
		for (Map<String, Object> row : l) {
			goalByDuration = new GoalSummeryData();
			duration =(String) row.get("goalDuration");
			if(duration.equals("0-0"))
			{
				
			}else{
			goalByDuration.setGoalByDurationCount((String) row.get("goalByDurationCount"));
			goalByDuration.setGoalDurayionName((String) row.get("goalDuration"));
			//totalGoalByDurationCount = Integer.parseInt(goalByDuration.getGoalByDurationCount());
			lstGoalByDuration.add(goalByDuration);
			}
		}
	}
	l = (List<Map<String, Object>>) storedProcResult.get("#result-set-3");
	if (l != null) {
		for (Map<String, Object> row : l) {
			goalByStatus = new GoalSummeryData();
			
				goalByStatus.setGoalByStatusAmount((String) row.get("GoalByStatusAmt"));
				//System.out.println("Goal By Status Amt======="+goalByStatus.getGoalByStatusAmount());
				goalByStatus.setGoalByStatusCount((String) row.get("goalByStatusCount"));
				goalByStatus.setGoalStatus((String) row.get("GoalStatus"));;
			//totalGoalByDurationCount = Integer.parseInt(goalByDuration.getGoalByDurationCount());
				lstGoalByStatus.add(goalByStatus);
			
		}
	}
	
	lstAllDataList.add(lstGoalSummeryData);
	lstAllDataList.add(lstGoalByDuration);
	lstAllDataList.add(lstGoalByStatus);
	return lstAllDataList;
	}
	
	public List<GoalDetail> getGoalDetail(int partyId, int buId,String type) {
		List <GoalDetail> lstGoalSummeryData =  new ArrayList<GoalDetail>();
		GoalDetail goalDetail ;
		List lstAllDataList = new ArrayList();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getGoalDetails");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
		SqlParameter typeParam = new SqlParameter("type", Types.VARCHAR);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam,buIdParam,typeParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("buId", buId);
		paranValues.put("type", type);
		//System.out.println("All values"+paranValues);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		if(type.equalsIgnoreCase("TopSection"))
		{
		if (l != null) {
			for (Map<String, Object> row : l) {
				goalDetail= new GoalDetail();
				goalDetail.setName((String) row.get("Name"));
				goalDetail.setGoalName((String) row.get("GoalName"));
				goalDetail.setGoalEndYear((String) row.get("GoalEndYear").toString());
				goalDetail.setGoalAmountFV((String) row.get("GoalAmountFV").toString());
				goalDetail.setGoalAmountPV((String) row.get("GoalAmountPV").toString());
				goalDetail.setDuein((String) row.get("duein"));
				goalDetail.setAchievedGoalPercetage((String) row.get("AchievedGoalPercetage").toString());
				goalDetail.setAchivedGoalPercentageSofar((String) row.get("AchivedSoFarPercentage").toString());
				lstGoalSummeryData.add(goalDetail);
			}
		}
		}
		else if (type.equalsIgnoreCase("RecommendationInvestment"))
		{
			if (l != null) {
				for (Map<String, Object> row : l) {
					goalDetail= new GoalDetail();
					goalDetail.setName((String) row.get("Name"));
					goalDetail.setAmount((String) row.get("Amount").toString());
					goalDetail.setWidthPercentage((String) row.get("WidthPercentage").toString());
					lstGoalSummeryData.add(goalDetail);
				}
			}
		}
		
		//lstAllDataList.add(lstGoalSummeryData);
	
		 return lstGoalSummeryData;
		}
	
	public List<AssetAllocationOfGoal> getAssetAllocation(int partyId, int buId,String type) {
		List <AssetAllocationOfGoal> lstGoalSummeryData =  new ArrayList<AssetAllocationOfGoal>();
		AssetAllocationOfGoal goalDetail ;
		List lstAllDataList = new ArrayList();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getAssetsForGoal");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
		SqlParameter typeParam = new SqlParameter("type", Types.VARCHAR);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam,buIdParam,typeParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("buId", buId);
		paranValues.put("type", type);
		//System.out.println("All values"+paranValues);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				goalDetail= new AssetAllocationOfGoal();
				goalDetail.setAssetName((String) row.get("AssetName"));
				goalDetail.setAssetPercentAllocated2Goal((String) row.get("AssetPercentAllocated2Goal").toString());
				goalDetail.setCagr((String) row.get("cagr").toString());
				goalDetail.setCost((String) row.get("cost").toString());
				goalDetail.setCurrentvalue((String) row.get("currentvalue").toString());
				goalDetail.setPercentContributiontoGoal((String) row.get("percentContributiontoGoal").toString());
				lstGoalSummeryData.add(goalDetail);
			}
		}
		
		//lstAllDataList.add(lstGoalSummeryData);
	
		 return lstGoalSummeryData;
		}
	
	
	public List<GoalListData> getGoalList(int partyId,int buId,String condition,String parameterValue,String firstElement,String lastElement,int nodeId)
	{
		List <GoalListData> goalDataList = new ArrayList<GoalListData>();
		
		GoalListData goalData ;
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getGoalList");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
		SqlParameter conditionParam = new SqlParameter("condition", Types.VARCHAR);
		SqlParameter parameterValueParam = new SqlParameter("parameterValue", Types.VARCHAR);
		SqlParameter pfirstElement = new SqlParameter("firstElement", Types.VARCHAR);
		SqlParameter psecondElement = new SqlParameter("secondElement", Types.VARCHAR);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam,buIdParam,conditionParam,parameterValueParam,pfirstElement,psecondElement,nodeIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("buId", buId);
		paranValues.put("condition", condition);
		paranValues.put("parameterValue", parameterValue);
		paranValues.put("firstElement", firstElement);
		paranValues.put("secondElement", lastElement);
		paranValues.put("nodeId", nodeId);
		
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				goalData= new GoalListData();
				goalData.setGoalId((Integer) row.get("goalId"));
				goalData.setContactName((String) row.get("contactName"));
				goalData.setGoalType((String) row.get("goalType"));
				goalData.setGoalName((String) row.get("GoalName"));
//				goalData.setGoalEndYear(((Integer) row.get("GoalEndYear")).toString());
				goalData.setGoalEndYear((String) row.get("GoalEndYear"));
				goalData.setCurrentCost((String) row.get("currentCost"));
				goalData.setFutureCost((String) row.get("futureCost"));
				goalData.setInvestmentAmount((String) row.get("investmentAmount"));
				goalData.setGoalStatus((String) row.get("Status"));
				goalData.setAchievementScale((String) row.get("AchievementScale"));
				goalData.setEstimatedRevenue((String) row.get("EstimatedRevenue"));
				goalData.setRecordTypeId((String) row.get("recordTypeId"));
				goalData.setPartyId((Integer)row.get("PartyID"));
				goalDataList.add(goalData);
			}
		}
		return goalDataList;
	}


	
	
	
}
