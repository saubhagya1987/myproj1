package in.fiinfra.opportunity.dao;

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.client.ClientData;
import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.FamilyMemberData;
import in.fiinfra.common.common.NotesData;
import in.fiinfra.common.common.PartyAttributeData;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.opportunity.OpportunityStageData;
import in.fiinfra.common.opportunity.OpportunityTask;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.GridData;
import in.fiinfra.common.util.MD5Encryption;
import in.fiinfra.common.util.RandomPasswordGenerator;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Component;
@Component
public class OpportunityDaoImpl implements OpportunityDao{
	@Autowired	
	DataSourceProvider dataSourceProvider;
	@Autowired
	Md5PasswordEncoder passwordEncoder;
	StringBuffer opartyIds;
	StringBuffer xRaypartyIds;
	String yesStr;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	private static final Logger logger = Logger.getLogger(OpportunityDaoImpl.class);
	
	Response response;
	
	@SuppressWarnings("finally")
	@Override
	public Response getOpportunitiesList(int partyId, int buId,String oppSearchValue,int nodeId,int pageNo,int pageSize,String orderBy,String sord) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		try {
		List<OpportunityData> list;
		BaseResponse<GridData> br = new BaseResponse<GridData>();
		GridData gridData=new GridData();
		list = jdbcTemplate.query("{call usp_cp_getOpportunitiesDetails(?,?,?,?,?,?,?)}", new Object[] { partyId,oppSearchValue,nodeId,pageNo,pageSize,orderBy,sord },
				new BeanPropertyRowMapper<OpportunityData>(OpportunityData.class));
		gridData.setRows(list);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getOpportunitiesDetailsCount");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		SqlParameter oppSearchValueParam = new SqlParameter("oppSearchValue", Types.VARCHAR);
		SqlOutParameter recordsCountParam = new SqlOutParameter("recordsCount", Types.INTEGER);
		SqlParameter[] paramArray = { partyIdParam,oppSearchValueParam,nodeIdParam,recordsCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("oppSearchValue", oppSearchValue);
		paranValues.put("nodeId", nodeId);
		
		logger.info("paranValues:--" + paranValues);
		logger.info("-----------Before Calling SP In APP(getOpportunitiesList)-----------");
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("-----------After Calling SP In APP(getOpportunitiesList)-----------");
		int recordCount=(int) storedProcResult.get("recordsCount");
		gridData.setRecords(recordCount);
		gridData.setPage(pageNo);
		gridData.setTotal(recordCount%pageSize==0?recordCount/pageSize:(recordCount/pageSize)+1);
		br.setResponseObject(gridData);
		response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}
	
//	public List<OpportunityData> getOpportunitiesList(int partyId, int buId,String oppSearchValue,int nodeId) {
//		// TODO Auto-generated method stub
//		List<OpportunityData> opportunitiesDatas=new ArrayList<OpportunityData>();
//		try{
//		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
//		
//		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
//		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
//				jdbcTemplate, "usp_cp_getOpportunitiesDetails");
//		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
//		SqlParameter oppSearchValueParam = new SqlParameter("oppSearchValue", Types.VARCHAR);
//		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
//		
//		SqlParameter[] paramArray = { partyIdParam,oppSearchValueParam,nodeIdParam };
//		myStoredProcedure.setParameters(paramArray);
//		myStoredProcedure.compile();
//		Map<String, Object> paranValues = new HashMap<String, Object>();
//		paranValues.put("partyId", partyId);
//		paranValues.put("oppSearchValue", oppSearchValue);
//		paranValues.put("nodeId", nodeId);
//		
//		logger.info("paranValues:--" + paranValues);
//		Map<String, Object> storedProcResult = myStoredProcedure
//				.execute(paranValues);
//		logger.info("storedProcResult:---" + storedProcResult);
//		//personal details
//		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
//		logger.info("l:--" + l);
//		if (l != null) {
//			
//			OpportunityData opportunityData = null;
//			for (Map<String, Object> row : l) {
//				opportunityData=new OpportunityData();
//				opportunityData.setName((String) row.get("name"));
//				opportunityData.setCity((String) row.get("city"));
//				opportunityData.setCreatedDate((String) row.get("createdDate"));
//				opportunityData.setStatus((String) row.get("status"));
//				opportunityData.setEmail((String) row.get("email"));
//				opportunityData.setMobile((String) row.get("mobile"));
//				opportunityData.setStage((String) row.get("stage"));
//				opportunityData.setAction((String) row.get("Action"));
//				opportunityData.setActionComments((String) row.get("actionComments"));	
//				opportunityData.setPartyId((Integer) row.get("partyID"));
//				opportunityData.setBuId((Integer) row.get("buID"));
//				opportunityData.setAnalysisReportDocumentID((int) row.get("AnalysisReportDocumentID"));
//				opportunityData.setClientActionPlanDocumentID((int) row.get("ClientActionPlanDocumentID"));
//				opportunityData.setAdvisorActionPlanDocumentID((int) row.get("AdvisorActionPlanDocumentID"));
//				opportunityData.setQuickActionPlanDocumentID((int) row.get("QuickActionPlanDocumentID"));
//				opportunityData.setSummaryActionPlanDocumentID((int) row.get("SummaryActionPlanDocumentID"));
//				opportunityData.setClientActionPlanDocumentIDA((int) row.get("ClientActionPlanDocumentIDA"));
//				opportunityData.setAnalysisGoalRiskSuccessionID((int) row.get("AnalysisGoalRiskSuccessionID"));
//				opportunityData.setDcActivation((int) row.get("DCActivation"));
//				opportunityData.setIsDatacollectionChanged((String) row.get("isDatacollectionChanged"));
//				opportunityData.setPotentialPing((String) row.get("potentialPing"));
////				opportunityData.setExecutionStatus((int) row.get("executionStatus"));
//				if((int) row.get("executionStatus")>0)
//				{
//				opportunityData.setExecutionStatusStr("have");	
//				}
//				else{
//					opportunityData.setExecutionStatusStr("not have");
//				}
////				logger.info("execution status = "+opportunityData.getExecutionStatusStr());
//				opportunitiesDatas.add(opportunityData);
//			}
//		}
//		
//		logger.info("App Opprtunity Data........."+opportunitiesDatas.get(1).getDcActivation());
//		
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		return opportunitiesDatas;
//	}
	
	@Override
	public Response getOpportunitiesTask(int partyId, int buId,String oppSearchValue) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		try {
		List<OpportunityTask> opportunitiesTaskDatas;
		BaseResponse<OpportunityTask> br = new BaseResponse<OpportunityTask>();

		opportunitiesTaskDatas = jdbcTemplate.query("{call usp_cp_getOpportunitiesTask(?,?)}", new Object[] { partyId,oppSearchValue},
				new BeanPropertyRowMapper<OpportunityTask>(OpportunityTask.class));
		br.setResponseListObject(opportunitiesTaskDatas);
		response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}
	
	
	/*@Override
	public List<OpportunityTask> getOpportunitiesTask(int partyId, int buId,String oppSearchValue) {
		// TODO Auto-generated method stub
		List<OpportunityTask> opportunitiesTaskDatas=new ArrayList<OpportunityTask>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getOpportunitiesTask");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter oppSearchValueParam = new SqlParameter("oppSearchValue", Types.VARCHAR);
		
		SqlParameter[] paramArray = { partyIdParam,oppSearchValueParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("oppSearchValue", oppSearchValue);
		
		logger.info("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		//personal details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.info("l:--" + l);
		if (l != null) {
			
			OpportunityTask opportunityTask = null;
			for (Map<String, Object> row : l) {
				opportunityTask=new OpportunityTask();
				opportunityTask.setTaskName((String) row.get("TaskName"));			
				opportunityTask.setOppID((Integer) row.get("OpportunityId"));
				opportunityTask.setTaskId((Integer) row.get("TaskId"));
				opportunitiesTaskDatas.add(opportunityTask);
			}
		}
		
		logger.info("App Opprtunity Data........."+opportunitiesTaskDatas);
		
		}catch(Exception e){
			//e.printStackTrace();
			logger.debug(""+e.getStackTrace());
		}
		return opportunitiesTaskDatas;
	}*/
	
	
	/*@Override
	public List<OpportunityStageData> getOpportunitiesStageList(int partyId, int buId, int nodeId) {
		// TODO Auto-generated method stub
		List<OpportunityStageData> opportunityStageDatas=new ArrayList<>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getOpportunitiesStageList");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		
		SqlParameter[] paramArray = { partyIdParam,nodeIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("nodeId", nodeId);
		
		logger.info("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		//personal details
		
		
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.info("l:--" + l);
		if (l != null) {
			OpportunityStageData opportunityStageData=null;
			for (Map<String, Object> row : l) {
				opportunityStageData=new OpportunityStageData();
				opportunityStageData.setPartyId((int) row.get("partyid"));
				opportunityStageData.setStage((String) row.get("stage"));
				opportunityStageData.setFpStageEndDate((String) row.get("FPStageEndDate"));
				opportunityStageData.setFpStageEndDateTime((String) row.get("FPStageEndDateTime"));
				
				opportunityStageDatas.add(opportunityStageData);
			}
		}
		
		logger.info("App Opprtunity Data........."+opportunityStageDatas);
		
		}catch(Exception e){
			//e.printStackTrace();
			logger.debug(""+e.getStackTrace());
		}
		return opportunityStageDatas;
	}*/
	
	@SuppressWarnings("finally")
	public Response getOpportunitiesStageList(int partyId, int buId, int nodeId) {
	
	try {
		List<OpportunityStageData> opportunityStageDatas;
		BaseResponse<OpportunityStageData> br = new BaseResponse<OpportunityStageData>();

		opportunityStageDatas = jdbcTemplate.query("{call usp_cp_getOpportunitiesStageList(?,?)}", new Object[] { partyId,nodeId },
				new BeanPropertyRowMapper<OpportunityStageData>(OpportunityStageData.class));
		br.setResponseListObject(opportunityStageDatas);
		response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	
	}

	@Override
	public List<Integer> saveOpportunity(int partyId, String opportunityXMLString, int createdBy,int buId,String offeringXML,int opPartyId) {
		int recordCount=0;
		int isPanExist=0;
		List<Integer> resultList=new ArrayList<>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		OpportunityData opportunityData=new OpportunityData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveOpportunity");
		SqlParameter opPartyIdParam = new SqlParameter("opPartyIdParam", Types.INTEGER);
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter opportunityXMLStringParam = new SqlParameter("opportunityXMLString", Types.VARCHAR);
		SqlParameter createdByParam = new SqlParameter("createdBy", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter lastModifiedByParam = new SqlParameter("lastModifiedByParam", Types.INTEGER);
		SqlParameter offeringParam = new SqlParameter("offeringXML", Types.VARCHAR);
		SqlOutParameter opPartyIdDBParam = new SqlOutParameter("opPartyIdDB", Types.INTEGER);
		SqlOutParameter isPanExistParam = new SqlOutParameter("isPanExist", Types.VARCHAR);
		
		logger.debug("opportunityXMLString:--"+opportunityXMLString);
		
		logger.info("opPartyIdParam"+opPartyIdParam);
		SqlParameter[] paramArray = { opPartyIdParam,partyIdParam,opportunityXMLStringParam,createdByParam,recordCountParam,lastModifiedByParam,offeringParam,opPartyIdDBParam,isPanExistParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		logger.info("opPartyIdParam"+opPartyIdParam);
		paranValues.put("opPartyIdParam",opPartyId);
		paranValues.put("partyId", partyId);		
		paranValues.put("opportunityXMLString", opportunityXMLString);		
		paranValues.put("createdBy", createdBy);
		paranValues.put("lastModifiedByParam",createdBy );
		paranValues.put("offeringXML",offeringXML );
		logger.info("paranValues:--" + paranValues);
		logger.info("XML"+opportunityXMLString);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		logger.info("rec----------------"+recordCount);
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		opPartyId=Integer.parseInt(storedProcResult.get("opPartyIdDB").toString());
		isPanExist=Integer.parseInt(storedProcResult.get("isPanExist").toString());
		resultList.add(recordCount);
		resultList.add(opPartyId);
		resultList.add(isPanExist);
		logger.info("recordCount:---" + recordCount);
		logger.info("isPanExist------" + isPanExist);
		return resultList;
	}
	
	//Single DC ACtivation
	@Override
	public List<Integer> insertDcActivationRecord(String userXMLString, int createdBy,int buId) {
		int recordCount=0;
		int isExistAnyUser=0;
		int isAlreadyActivated=0;
		int isContactEmailPresent=0;
		List<Integer> resutList=new ArrayList<>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		UserData userData=new UserData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveDcActivationDetails");
		
		SqlParameter userXMLStringParam = new SqlParameter("userXMLString", Types.VARCHAR);
		SqlParameter createdByParam = new SqlParameter("createdBy", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlOutParameter isExistAnyUserParam = new SqlOutParameter("isExistAnyUser", Types.INTEGER);
		SqlOutParameter isAlreadyActivatedParam = new SqlOutParameter("isAlreadyActivated", Types.INTEGER);
		SqlOutParameter isContactEmailPresentParam = new SqlOutParameter("isContactEmailPresent", Types.INTEGER);
		logger.debug("userXMLString:------------"+userXMLString);
		
	
		SqlParameter[] paramArray = {userXMLStringParam,createdByParam,recordCountParam,isExistAnyUserParam,isAlreadyActivatedParam,isContactEmailPresentParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("userXMLString", userXMLString);		
		paranValues.put("createdBy", createdBy);

		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		
		 recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		 isExistAnyUser=Integer.parseInt(storedProcResult.get("isExistAnyUser").toString());
		 isAlreadyActivated=Integer.parseInt(storedProcResult.get("isAlreadyActivated").toString());
		 isContactEmailPresent=Integer.parseInt(storedProcResult.get("isContactEmailPresent").toString());
		 
		 resutList.add(recordCount);
		 resutList.add(isExistAnyUser);
		 resutList.add(isAlreadyActivated);
		 resutList.add(isContactEmailPresent);
		return resutList;
	}
	
	
	//Single DC ACtivation
		@Override
		public List<String> insertXRayActivationRecord(String userXMLString,String partyIds,int createdBy,int buId) {
			int recordCount=0;
			int isAlreadyActivated=0;
			String alreadyActivatedPartyIds;
			List<String> resultList=new ArrayList<>();
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
			UserData userData=new UserData();
			List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
			CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
					jdbcTemplate, "usp_cp_saveXRayActivationDetails");
			
			SqlParameter userXMLStringParam = new SqlParameter("userXMLString", Types.VARCHAR);
			SqlParameter partyIdsStringParam = new SqlParameter("partyIds", Types.VARCHAR);
			SqlParameter createdByParam = new SqlParameter("createdBy", Types.INTEGER);
			SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
			SqlOutParameter isAlreadyActivatedParam = new SqlOutParameter("isAlreadyActivated", Types.INTEGER);
			SqlOutParameter alreadyActivatedPartyIdsParam = new SqlOutParameter("alreadyActivatedPartyIds", Types.VARCHAR);
		
			SqlParameter[] paramArray = {userXMLStringParam,partyIdsStringParam,createdByParam,recordCountParam,isAlreadyActivatedParam,alreadyActivatedPartyIdsParam};
			myStoredProcedure.setParameters(paramArray);
			myStoredProcedure.compile();
			Map<String, Object> paranValues = new HashMap<String, Object>();
			paranValues.put("userXMLString", userXMLString);	
			paranValues.put("partyIds", partyIds);		
			paranValues.put("createdBy", createdBy);
			
			logger.info("paranValues:--" + paranValues);
			Map<String, Object> storedProcResult = myStoredProcedure
					.execute(paranValues);
			logger.info("storedProcResult:---" + storedProcResult);
			
//			 recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
//			 isAlreadyActivated=Integer.parseInt(storedProcResult.get("isAlreadyActivated").toString());
			 recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
			 isAlreadyActivated=Integer.parseInt(storedProcResult.get("isAlreadyActivated").toString());
			 alreadyActivatedPartyIds=storedProcResult.get("alreadyActivatedPartyIds").toString();
//			 alreadyActivatedPartyIds=storedProcResult.get("alreadyActivatedPartyIds").toString();
			 
			 logger.info("alreadyActivatedPartyIds:---" + alreadyActivatedPartyIds);
			 resultList.add(String.valueOf(recordCount));
			 resultList.add(String.valueOf(isAlreadyActivated));
			 resultList.add(alreadyActivatedPartyIds);
//			 if(alreadyActivatedPartyIds.equals(""))
//				 resutList.add(0);
//			 else
//				 resutList.add(Integer.valueOf(alreadyActivatedPartyIds));
//			 resutList.add(Integer.parseInt(alreadyActivatedPartyIds));
			return resultList;
		}
	
	//Import Bulk Opportunity
		@Override
		public List<List<OpportunityData>> insertBulkOpportunity(String bulkopportunityXML,int createdBy) {
			int recordCount=0;
			logger.info("In insertBulkOpportunity Dao Impl ");
		
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(111));
			OpportunityData opportunityData=new OpportunityData();
			List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
			CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
					jdbcTemplate, "usp_pp_OpportunitiesByBulkUpload");
			opartyIds=new StringBuffer();
			yesStr="YES";
			SqlParameter opportunityXMLStringParam = new SqlParameter("opportunityXMLString", Types.VARCHAR);
			SqlParameter createdByParam = new SqlParameter("createdBy", Types.INTEGER);
//			SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
			logger.info("bulkopportunityXML:------------"+bulkopportunityXML);

			SqlParameter[] paramArray = { opportunityXMLStringParam,createdByParam};
			
			myStoredProcedure.setParameters(paramArray);
			myStoredProcedure.compile();
			Map<String, Object> paranValues = new HashMap<String, Object>();
			paranValues.put("opportunityXMLString", bulkopportunityXML);		
			paranValues.put("createdBy", createdBy);
			
			logger.info("paranValues:--" + paranValues);
			logger.info("XML----------------"+bulkopportunityXML);
			Map<String, Object> storedProcResult = myStoredProcedure
					.execute(paranValues);
			logger.info("storedProcResult:---" + storedProcResult);
//			List<List<OpportunityData>> oppoLists= new ArrayList<OpportunityData>();
			List<List<OpportunityData>> oppList = new ArrayList<>();
			List<OpportunityData> successList=new ArrayList<>();
			List<OpportunityData> existingList=new ArrayList<>();
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
			logger.info("Success Full List--------------" + l);
			if (l != null) {
				for (Map<String, Object> row : l) {
					opportunityData=new OpportunityData();
					opportunityData.setFirstName((String) row.get("firstName"));
					opportunityData.setLastName((String) row.get("lastName"));		
					opportunityData.setContactEmail((String) row.get("contactEmail"));
					opportunityData.setContactMobile((String) row.get("contactMobile"));
					opportunityData.setCompanyName((String) row.get("companyName"));
					opportunityData.setCampaignName((String) row.get("campaignName"));
					opportunityData.setDesignation((String) row.get("designation"));
					opportunityData.setPartyId((Integer) row.get("PartyId"));
					opportunityData.setEnableDCTool((String) row.get("enableDCTool"));
					opportunityData.setBuId((int) row.get("buId"));
					opportunityData.setEnableXRayTool((String) row.get("enableXRayTool"));
					successList.add(opportunityData);	
					}
			}	
			
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
			logger.info("Failed List:--" + l);
			if (l != null) {
				for (Map<String, Object> row : l) {
					opportunityData=new OpportunityData();
					opportunityData.setFirstName((String) row.get("firstName"));
					opportunityData.setLastName((String) row.get("lastName"));	
					opportunityData.setContactEmail((String) row.get("contactEmail"));
					opportunityData.setContactMobile((String) row.get("contactMobile"));
					opportunityData.setCompanyName((String) row.get("companyName"));
					opportunityData.setCampaignName((String) row.get("campaignName"));
					opportunityData.setDesignation((String) row.get("designation"));					
					existingList.add(opportunityData);
					}
				}
			oppList.add(successList);
			oppList.add(existingList);
			
			return oppList;
}
	
//		public int insertBulkDcActivationForBulkOpportunity(List<OpportunityData> lstSuccessOpportunityDC, int createdBy,int buId){
//			int recordCount=0;
//			yesStr="YES";
//
//			
//			for(OpportunityData opportunityDataDC : lstSuccessOpportunityDC){
//				String dcTool=opportunityDataDC.getEnableDCTool();	
//				if((dcTool.toUpperCase()).equals(yesStr)){
//					int concatPartyId=opportunityDataDC.getPartyId();
//					opartyIds.append(concatPartyId+",");		
//					logger.info("Concatenated PartyIds**For New**"+opartyIds);			
//				}				
//			}
//			
//			String partyIds=opartyIds.toString();
//			String userDataXML;
//			String[] partyIdArray=partyIds.split(",");
//			int noOfCAPSAlpha = 1;
//			int noOfDigits = 1;
//			int noOfSplChars = 1;
//			int minLen = 8;
//			int maxLen = 15;
//			
//			Map<Integer,String> passwordMap=new HashMap<>();
//			for(String partyId:partyIdArray){
//				userDataXML="<Root>";
//				String hexString = null;
//				if(!partyId.equals("")){
//				char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
//						noOfCAPSAlpha, noOfDigits, noOfSplChars);
//				hexString = new String(pswd);
//				logger.info("hexString is-----" + hexString);
//				MD5Encryption md5Encryption = new MD5Encryption();
//				String encryptrdPassword = passwordEncoder.encodePassword(hexString, null);
//				userDataXML+="<User>";
//				userDataXML+="<userPassword>"+encryptrdPassword+"</userPassword>";
//				userDataXML+="<partyid>"+partyId+"</partyid>";
//				userDataXML+="<RoleId>6</RoleId>";
//				userDataXML+="</User>";
//				passwordMap.put(Integer.valueOf(partyId), hexString);
//			}
//			userDataXML+="</Root>";
//			insertDcActivationRecord(userDataXML, createdBy, buId);
//			
//			if(!userDataXML.equals("<Root></Root>")){
//			Notification notification=null;
//			for(Map.Entry<Integer,String> map:passwordMap.entrySet()){
//				Map<String,String> payloadMap=new HashMap<String, String>();
//				payloadMap.put("Password",map.getValue());
//				notification=new Notification();
//				recordCount=1;
//				notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
//				notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
//				notification.setNotifyPartyID(map.getKey());
//				notification.setNotifyEventID(FiinfraConstants.DC_ACTIVATION);
//				notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
//				notification.setBuId(buId);
//				notification.setPayloadMap(payloadMap);
//				notification.setSessionID("EnableDCTool");
//				FrameworkUtil.notify(notification);
//				
//			}
//
//			}
//		}
//			logger.info("oppList "+lstSuccessOpportunityDC);
//			return recordCount;
//			
//		}
//		
//		
//		public int insertBulkXRayActivationForBulkOpportunity(List<OpportunityData> lstSuccessOpportunityXRay, int createdBy,int buId){
//			int recordCount=0;
//			yesStr="YES";
//			xRaypartyIds=new StringBuffer();
//			System.out.println("lst XRAY For Success---"+lstSuccessOpportunityXRay+"Created By---"+createdBy);
//			
//			for(OpportunityData opportunityDataXRay : lstSuccessOpportunityXRay){
//				String xRayTool=opportunityDataXRay.getEnableXRayTool();
//				if((xRayTool.toUpperCase()).equals(yesStr)){
//					int concatPartyId=opportunityDataXRay.getPartyId();
//					xRaypartyIds.append(concatPartyId+",");	
//					
//					logger.info("Concatenated PartyIds**For New*xRaypartyIds*"+xRaypartyIds);		
//					
//				}
//				
////				if((xRayTool.toUpperCase()).equals(yesStr)){
////					int concatPartyId=opportunityDataXRay.getPartyId();
////					if(xRaypartyIds.equals(""))
////						xRaypartyIds.append(concatPartyId+",");
////					else
////						xRaypartyIds.append(concatPartyId);
////					logger.info("Concatenated PartyIds**For New**"+xRaypartyIds);			
////				}				
//			}
//
//			String partyIds=xRaypartyIds.toString();
////			xRaypartyIds.setLength(xRaypartyIds.length() - 1);
//			System.out.println("Party IDS------"+partyIds);
//			partyIds = partyIds.substring(0, partyIds.length()-1);
////			partyIds = partyIds.substring(partyIds.length()-1);
////			partyIds = partyIds.replace(partyIds.substring(partyIds.length()-1), "");
//			System.out.println("Party IDS---After---"+partyIds);
//			String[] partyIdArray=partyIds.split(",");
//			insertXRayActivationRecord(partyIds, createdBy, buId);
//			for(String partyId:partyIdArray){
//				Notification notification=null;
//				notification=new Notification();
//				notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
//				notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
//				notification.setNotifyPartyID(Integer.parseInt(partyId));
//				notification.setNotifyEventID(FiinfraConstants.XRAY_ACTIVATION);
//				notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
//				notification.setBuId(buId);
//				notification.setSessionID("Enable XRAy Tool");
//				FrameworkUtil.notify(notification);				
//			}
//			
//		
//			return recordCount;
//		}

			
		
	//Bulk DC Activation
	@Override
	public List<Integer> insertBulkDcActivation(String partyIds,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Integer> resutList=new ArrayList<>();
//		String result = FiinfraConstants.fail;
		int recordCount=0;
		int isContactEmailPresent=0;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_BulkDCActivateOpportunities");
		SqlParameter partyIdsParam = new SqlParameter("partyIds", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlOutParameter isContactEmailPresentParam = new SqlOutParameter("isContactEmailPresent", Types.INTEGER);
		SqlParameter[] paramArray = { partyIdsParam,recordCountParam,isContactEmailPresentParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyIds", partyIds);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		isContactEmailPresent=Integer.parseInt(storedProcResult.get("isContactEmailPresent").toString());
//		if(recordCount>0)
//		result = FiinfraConstants.success;
//		//result = FiinfraConstants.EMPTY_RESULT_SET;
//		
//		return result;
		
		 resutList.add(recordCount);
		 resutList.add(isContactEmailPresent);
		// logger.info("recordCount:---" + recordCount);
		return resutList;
	}
	
	@SuppressWarnings("unchecked")
	
	@Override
	public OpportunityProfileData getOpportunityProfileDetails(int partyId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(partyId));
		
		OpportunityProfileData opportunityProfileData=new OpportunityProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getOpportunityProfileDetails");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);

		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
	
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		//personal details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.info("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				opportunityProfileData.setFirstName((String) row.get("firstname"));
				opportunityProfileData.setLastName((String) row.get("lastname"));
				opportunityProfileData.setSalutationId((Integer) row.get("SalutationId"));
				opportunityProfileData.setUserName((String) row.get("username"));
				opportunityProfileData.setDesignation((String) row.get("CompanyDesignation"));
				opportunityProfileData.setOccupation((String) row.get("Occupation"));
				opportunityProfileData.setDob((String) row.get("DOB"));
				opportunityProfileData.setAnniversaryDate((String) row.get("AnniversaryDate"));
				opportunityProfileData.setMartialStatusId((Integer) row.get("MaritalStatusID"));
				opportunityProfileData.setGenderId((Integer) row.get("genderId"));
				opportunityProfileData.setCompanyName((String) row.get("companyName"));			
				opportunityProfileData.setContactEmail((String) row.get("contactEmail"));
				opportunityProfileData.setContactMobile((String) row.get("ContactMobile"));
				opportunityProfileData.setContactMobile2((String) row.get("ContactMobile2"));
				opportunityProfileData.setPanNo((String) row.get("PanNo"));				
			}
		}
		
		//address details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		logger.info("l:--" + l);
		List<AddressData> addressDatas=new ArrayList<>();
		AddressData addressData=null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				addressData=new AddressData();
				addressData.setStreet1((String) row.get("street1"));
				addressData.setStreet2((String) row.get("street2"));
				addressData.setStreet3((String) row.get("street3"));
				addressData.setAddressType((String) row.get("AddressType"));
				addressData.setCity((String) row.get("city"));
				addressData.setCityId((int) row.get("cityid"));
				addressData.setState((Integer) row.get("state"));
				addressData.setCountry((Integer) row.get("country"));
				addressData.setPostalCode((String) row.get("postalcode"));
				addressDatas.add(addressData);
			}
		}
		
		//family details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		logger.info("l:--" + l);
		List<FamilyMemberData> familyMemberDatas = new ArrayList<>();
		FamilyMemberData familyMemberData = null;
		if(l !=null) {
			for(Map<String, Object> row : l){
				familyMemberData=new FamilyMemberData();
				familyMemberData.setFirstName((String) row.get("firstName"));
				familyMemberData.setLastName((String) row.get("lastName"));
				familyMemberData.setPanNo((String) row.get("panNo"));
				familyMemberData.setRelationshipId((Integer) row.get("relationshipId"));
				familyMemberData.setDob((String) row.get("dob"));
				familyMemberData.setAge((Integer) row.get("age"));	
				familyMemberData.setPartyId((int) row.get("relatedPartyId"));
				familyMemberData.setWorkProfession((String) row.get("workProfession"));
				familyMemberDatas.add(familyMemberData);
			}
		}
		
		//Origination Details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		logger.info("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				opportunityProfileData.setOpportunitySource((Integer) row.get("opportunitySource"));
				opportunityProfileData.setCampaignName((String) row.get("campaignName"));
				opportunityProfileData.setReferralName((String) row.get("referralName"));
		}
		
		//Tracker Details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-5");
		logger.info("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				opportunityProfileData.setOpportunityStatus((Integer) row.get("opportunityStatus"));
				opportunityProfileData.setOpportunityRating((Integer) row.get("opportunityRating"));
				opportunityProfileData.setConvertProbability((Integer) row.get("ConvertProbablity"));
				opportunityProfileData.setNextAction((Integer) row.get("nextAction"));
		}
				
		//Notes details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-6");
		logger.info("l:--" + l);
		List<NotesData> notesDatas = new ArrayList<>();
		NotesData notesData = null;
		if(l !=null) {
			for(Map<String, Object> row : l){
				notesData=new NotesData();
				notesData.setNoteText((String) row.get("noteText"));
				notesData.setNoteTag((String) row.get("createdBy"));
				notesData.setCreatedDate((String) row.get("CreatedDate"));
				notesData.setNoteId((int) row.get("NoteId"));
				notesDatas.add(notesData);
			}
		}
		
		//Document details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-7");
			logger.info("l:--" + l);
			List<DocumentData> documentDatas = new ArrayList<>();
			DocumentData documentData = null;
			if(l !=null) {
				for(Map<String, Object> row : l){
					documentData=new DocumentData();
					documentData.setFileName((String) row.get("fileName"));
					documentData.setDocumentName((String) row.get("documentName"));
					documentData.setCreatedByName((String) row.get("createdBy"));
					documentData.setCreatedDate((String) row.get("createdDate"));
					documentData.setDocumentId((int) row.get("documentId"));
					documentDatas.add(documentData);
				}
		}
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-8");
		List<PartyAttributeData> partyAttributeDatas=new ArrayList<>();
		PartyAttributeData partyAttributeData=null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				partyAttributeData=new PartyAttributeData();
				partyAttributeData.setAttributeCodeId((int) row.get("attributecodeid"));
				partyAttributeData.setAttributeValue((String) row.get("attributevalue"));
				partyAttributeDatas.add(partyAttributeData);
			}
		}
		//Interested Fp		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-9");
		List<PartyAttributeData> partyAttributeDatasFp=new ArrayList<>();
		PartyAttributeData partyAttributeDataFp=null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				partyAttributeData=new PartyAttributeData();
				partyAttributeData.setAttributeCodeId((int) row.get("attributecodeid"));
				partyAttributeData.setAttributeValue((String) row.get("attributevalue"));
				partyAttributeDatasFp.add(partyAttributeData);
			}
		}	
		opportunityProfileData.setAddressDataList(addressDatas);
		opportunityProfileData.setFamilyMemberDataList(familyMemberDatas);
		opportunityProfileData.setNotesDataList(notesDatas);
		opportunityProfileData.setDocumentDataList(documentDatas);	
		opportunityProfileData.setPartyAttributeDatas(partyAttributeDatas);
		opportunityProfileData.setInterestedFpList(partyAttributeDatasFp);
		}
	}
	return opportunityProfileData;
	
	}
	
	
	@Override
	public List<Integer> updateOpportunityProfile(String sectionName, String dataXml,
			int buId, String partyId,int lastModifiedBy,String offeringXML) {
		int recordCount=0;
		List<Integer> resultList=new ArrayList<>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		OpportunityProfileData opportunityProfileData=new OpportunityProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveOpportunityProfileDetails");
		logger.info("-------------------------------------------------------------------"+partyId);
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter sectionNameParam = new SqlParameter("sectionName", Types.VARCHAR);
		SqlParameter dataXmlParam = new SqlParameter("dataXml", Types.VARCHAR);
		SqlParameter lastModifiedByParam = new SqlParameter("lastModifiedBy", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.VARCHAR);
		SqlOutParameter isPanExistParam = new SqlOutParameter("isPanExist", Types.VARCHAR);
		SqlParameter offeringXMLParam = new SqlParameter("offeringXML", Types.VARCHAR);
		logger.debug("dataXml:--"+dataXml);
		SqlParameter[] paramArray = { partyIdParam,sectionNameParam,dataXmlParam,lastModifiedByParam ,recordCountParam,offeringXMLParam,isPanExistParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("sectionName", sectionName);
		paranValues.put("dataXml", dataXml);
		paranValues.put("lastModifiedBy", lastModifiedBy);
		paranValues.put("offeringXML", offeringXML);
		logger.info("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		int isPanExist = Integer.parseInt(storedProcResult.get("isPanExist").toString());
		resultList.add(recordCount);
		resultList.add(isPanExist);
		logger.info("recordCount:---" + recordCount);
		logger.info("isPanExist***********----"+isPanExist);
		return resultList;
	}
	
	@Override
	public OpportunityData getOpportunityRecord(int partyId) 
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(partyId));
		logger.info("DAo OPP Impl...getOpportunityRecord For EDIT............."+partyId);
		OpportunityData opportunityData = new OpportunityData();
		
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getOpportunityForPartyId");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);

		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
	
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
				
		//personal details
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
			logger.info("l:--" + l);
			if (l != null) {
				for (Map<String, Object> row : l) {
					opportunityData.setFirstName((String) row.get("firstName"));
					opportunityData.setLastName((String) row.get("lastName"));
					opportunityData.setSalutationID((Integer) row.get("salutationID"));
					opportunityData.setDesignation((String) row.get("designation"));
					opportunityData.setOccupation((String) row.get("occupation"));
					opportunityData.setDob((String) row.get("dob"));
					opportunityData.setAnniversaryDate((String) row.get("AnniversaryDate"));					
					opportunityData.setMartialStatusID((Integer) row.get("martialStatusID"));
					opportunityData.setGenderID((Integer) row.get("genderID"));
					opportunityData.setContactEmail((String) row.get("contactEmail"));
					opportunityData.setContactMobile((String) row.get("contactMobile"));
					opportunityData.setContactMobile2((String) row.get("contactMobile2"));
					opportunityData.setCampaignName((String) row.get("campaignName"));
					opportunityData.setContactSourceTypeID((Integer) row.get("opportunitySource"));
					opportunityData.setContactReferalName((String) row.get("contactReferalName"));
					opportunityData.setOpportunityStatusID((Integer) row.get("opportunityStatus"));
					opportunityData.setConvertProbablity((Integer) row.get("convertProbablity"));
					opportunityData.setOpportunityRatingID((Integer) row.get("opportunityRating"));
					opportunityData.setNextActionID((Integer) row.get("nextAction"));
					opportunityData.setCompanyName((String) row.get("companyName"));	
					opportunityData.setPanNo((String) row.get("panNo"));
				}				
			}
			//address details
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
			logger.info("l:--" + l);
			List<AddressData> addressDatas=new ArrayList<>();
			AddressData addressData=null;
			if (l != null) {
				for (Map<String, Object> row : l) {
					addressData=new AddressData();
					addressData.setStreet1((String) row.get("street1"));
//					addressData.setStreet2((String) row.get("street2"));
//					addressData.setStreet3((String) row.get("street3"));
//					addressData.setAddressType((String) row.get("AddressType"));
					addressData.setCity((String) row.get("city"));
					addressData.setState1((String) row.get("state"));
					addressData.setCountry1((String) row.get("country"));
					addressData.setPostalCode((String) row.get("postalcode"));
					addressData.setCityId((int) row.get("cityid"));
					addressDatas.add(addressData);
				}
			}
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-3");
			logger.info("l:--" + l);
			List<PartyAttributeData> partyAttributeDatas=new ArrayList<>();
			PartyAttributeData partyAttributeData=null;
			if (l != null) {
				for (Map<String, Object> row : l) {
					partyAttributeData=new PartyAttributeData();
					partyAttributeData.setAttributeCodeId((int) row.get("attributecodeid"));
					partyAttributeData.setAttributeValue((String) row.get("attributevalue"));
					partyAttributeDatas.add(partyAttributeData);
				}
			}
			
			opportunityData.setAddressDataList(addressDatas);
			opportunityData.setPartyAttributeDatas(partyAttributeDatas);
			return opportunityData;		
	}
	
//	@Override
//	public NotesData insertNote(NotesData noteData) {
//		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(noteData.getBuId()));
//	
//		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
//				jdbcTemplate, "usp_cp_saveNote");
//		SqlOutParameter noteIdParam = new SqlOutParameter("noteId", Types.INTEGER);
//
//		SqlParameter notesectionIdParam = new SqlParameter("sectionId",Types.INTEGER);
//		SqlParameter noteTitleParam = new SqlParameter("noteTag", Types.VARCHAR);
//		SqlParameter noteTextParam = new SqlParameter("noteText", Types.VARCHAR);
//		SqlParameter notePartyIdParam=new SqlParameter("partyId", Types.INTEGER );
//		SqlParameter noteUpdatedByParam=new SqlParameter("updatedBy", Types.INTEGER );
//		
//		SqlParameter[] paramArray = { noteIdParam, notesectionIdParam, noteTitleParam, noteTextParam,notePartyIdParam, noteUpdatedByParam };
//		myStoredProcedure.setParameters(paramArray);
//		myStoredProcedure.compile();
//		
//		Map<String, Object> paranValues = new HashMap<String, Object>();
//	//	paranValues.put("noteId", noteData.getNoteId());
//		logger.info("Note Txt In Dao Imple-------"+noteData.getNoteText());
//		logger.info("Note Txt In Dao Imple---------"+noteData.getPartyId());
//		paranValues.put("noteText",noteData.getNoteText());
//		//paranValues.put("noteText","DEMO");
//		paranValues.put("noteTag", noteData.getNoteTag());
//		paranValues.put("partyId", noteData.getPartyId());
//		paranValues.put("updatedBy",noteData.getCreatedBy());
//		paranValues.put("sectionId", noteData.getNoteSectionId());
//		
//		logger.debug("paranValues:--" + paranValues);
//		Map<String, Object> storedProcResult = myStoredProcedure
//				.execute(paranValues);
//		logger.debug("storedProcResult:------" + storedProcResult);
//		noteData.setNoteId((Integer) storedProcResult.get("noteId"));
//		
//		return noteData;
//	}
	
	@Override
	public List<Integer> insertNote(NotesData noteData) {
		int recordCount=0;
		List<Integer> resultList=new ArrayList<>();
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(noteData.getBuId()));
	
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveNote");
		SqlOutParameter noteIdParam = new SqlOutParameter("noteId", Types.INTEGER);
		SqlParameter notesectionIdParam = new SqlParameter("sectionId",Types.INTEGER);
		SqlParameter noteTitleParam = new SqlParameter("noteTag", Types.VARCHAR);
		SqlParameter noteTextParam = new SqlParameter("noteText", Types.VARCHAR);
		SqlParameter notePartyIdParam=new SqlParameter("partyId", Types.INTEGER );
		SqlParameter noteUpdatedByParam=new SqlParameter("updatedBy", Types.INTEGER );
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter noteId1Param=new SqlParameter("noteId1", Types.INTEGER );
		SqlParameter refIdParam=new SqlParameter("refId", Types.INTEGER );
		SqlParameter refTypeIdParam=new SqlParameter("refTypeId", Types.INTEGER );
		
		SqlParameter[] paramArray = { noteIdParam, recordCountParam, notesectionIdParam, noteTitleParam, noteTextParam,notePartyIdParam, noteUpdatedByParam,noteId1Param };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
	//	paranValues.put("noteId", noteData.getNoteId());
		logger.info("Note Txt In Dao Imple-------"+noteData.getNoteText());
		logger.info("Note Txt In Dao Imple---------"+noteData.getPartyId());
		logger.info("noteData---------"+noteData);
		logger.info("noteid---------"+noteData.getNoteId());
		paranValues.put("noteId",noteData.getNoteId());
		paranValues.put("noteText",noteData.getNoteText());
		paranValues.put("noteTag", noteData.getNoteTag());
		paranValues.put("partyId", noteData.getPartyId());
		paranValues.put("updatedBy",noteData.getCreatedBy());
		paranValues.put("sectionId", noteData.getNoteSectionId());
		paranValues.put("noteId1",noteData.getNoteId());
		paranValues.put("refId",111001);
		paranValues.put("refTypeId",noteData.getPartyId());
		
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		logger.info("storedProcResult:---" + storedProcResult);
		logger.info("rec----------------"+recordCount);
		
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		noteData.setNoteId((Integer) storedProcResult.get("noteId"));
		logger.info("recordCount:---" + recordCount);
		logger.info("rec----------------"+recordCount);
		resultList.add(recordCount);
		logger.info("recordCount:---" + recordCount);
		return resultList;
	}
	
	@Override
	public String deleteNote(String noteIds,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_deleteNotes");
		SqlParameter noteIdsParam = new SqlParameter("noteIds", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { noteIdsParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("noteIds", noteIds);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}

	@Override
	public DocumentData insertDocument(DocumentData documentData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(documentData.getBuId()));
	
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveDocument");
		SqlParameter documentTypeIdParam = new SqlParameter("documentTypeId", Types.INTEGER);
		SqlParameter documentNameParam = new SqlParameter("documentName", Types.VARCHAR);
		SqlParameter documentTextParam = new SqlParameter("documentText", Types.VARCHAR);
		SqlParameter fileNameParam = new SqlParameter("fileName",Types.VARCHAR);
		SqlParameter uriParam = new SqlParameter("uri", Types.VARCHAR);
		SqlParameter storageLocationIdParam = new SqlParameter("storageLocationId", Types.INTEGER);
		SqlParameter thumbnailParam=new SqlParameter("thumbnail", Types.VARCHAR );
		SqlParameter fileSizeParam=new SqlParameter("fileSize", Types.INTEGER );
		SqlParameter fileTypeParam=new SqlParameter("fileType", Types.INTEGER );
		SqlParameter currentUserParam=new SqlParameter("currentUser", Types.INTEGER );
		SqlParameter refRecordIdParam=new SqlParameter("refRecordId", Types.INTEGER );
		SqlParameter refTypeIdParam=new SqlParameter("refTypeId", Types.INTEGER );
		SqlParameter partyIdParam=new SqlParameter("PartyId", Types.INTEGER );
		SqlParameter sectionIdParam=new SqlParameter("SectionId", Types.INTEGER );
		SqlParameter documentIdParam= new SqlParameter("documentId", Types.INTEGER);
		SqlOutParameter documentIdResultParam= new SqlOutParameter("documentId", Types.INTEGER);
		
		SqlParameter[] paramArray = { documentTypeIdParam,documentNameParam,documentTextParam,fileNameParam,uriParam,storageLocationIdParam,thumbnailParam,fileSizeParam,
									fileTypeParam,currentUserParam,refRecordIdParam,refTypeIdParam,partyIdParam,sectionIdParam,documentIdParam,documentIdResultParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
	//	paranValues.put("noteId", noteData.getNoteId());
		paranValues.put("documentName", documentData.getDocumentName());
		paranValues.put("DocumentStorageLocationID", documentData.getDocumentStorageLocation());
		paranValues.put("documentTypeID",documentData.getDocumentType());
		paranValues.put("CreatedBy",documentData.getCreatedByName());
		paranValues.put("fileName",documentData.getFileName());
		paranValues.put("fileSizeKb",documentData.getFileSize());
		paranValues.put("FileStoragePathURI",documentData.getFileStoragePathURI());
		paranValues.put("fileTypeID",documentData.getFileTypeId());
		paranValues.put("documentId",documentData.getDocumentId());
		
		
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		if(documentData.getDocumentId() <=0){
			documentData.setDocumentId((Integer) storedProcResult.get("result"));	
		}
		
		
		return documentData;
	}
	
	
	@Override
	public String deleteDocument(String documentIds,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_deleteDocument");
		SqlParameter documentIdsParam = new SqlParameter("documentIds", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { documentIdsParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("documentIds", documentIds);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}

	
	@Override
	public String deleteOpportunities(String partyIds,int buId,int createdBy) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_deleteOpportunities");
		SqlParameter partyIdsParam = new SqlParameter("partyIds", Types.VARCHAR);
		SqlParameter createdByParam = new SqlParameter("createdBy", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { partyIdsParam,createdByParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyIds", partyIds);
		paranValues.put("createdBy", createdBy);
		
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}
	public String updateFpplanType(int fpPlanTypeId, int dcInputPartyId,int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_updateFpplanType");
		SqlParameter fpPlanTypeIdParam = new SqlParameter("fpPlanTypeId", Types.INTEGER);
		SqlParameter dcInputPartyIdParam = new SqlParameter("dcInputPartyId", Types.INTEGER);
		SqlOutParameter inflationRateParam = new SqlOutParameter("inflationRate", Types.INTEGER);
		SqlParameter[] paramArray = { fpPlanTypeIdParam,dcInputPartyIdParam,inflationRateParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("fpPlanTypeId", fpPlanTypeId);
		paranValues.put("dcInputPartyId", dcInputPartyId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		
		String inflationRate= storedProcResult.get("inflationRate").toString();
		logger.info("inflationRate in APPDao Impl="+inflationRate);
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return inflationRate;
	}
	
	public List<OpportunityData> getSendReport(int partyId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		List<OpportunityData> sendReportDatas=new ArrayList<OpportunityData>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getSendReportList");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		
		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		
		logger.info("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.info("l:--" + l);
		if (l != null) {
			OpportunityData opportunityDataReports = null;
			for (Map<String, Object> row : l) {
				opportunityDataReports=new OpportunityData();
				
				opportunityDataReports.setPartyId((Integer)row.get("partyId"));				
				opportunityDataReports.setAnalysisReportDocumentID((int) row.get("AnalysisReportDocumentID"));
				opportunityDataReports.setClientActionPlanDocumentID((int) row.get("ClientActionPlanDocumentID"));
				opportunityDataReports.setAdvisorActionPlanDocumentID((int) row.get("AdvisorActionPlanDocumentID"));
				opportunityDataReports.setQuickActionPlanDocumentID((int) row.get("QuickActionPlanDocumentID"));
				opportunityDataReports.setSummaryActionPlanDocumentID((int) row.get("SummaryActionPlanDocumentID"));
				opportunityDataReports.setClientActionPlanDocumentIDA((int) row.get("ClientActionPlanDocumentIDA"));
				opportunityDataReports.setAnalysisGoalRiskSuccessionID((int) row.get("AnalysisGoalRiskSuccessionID"));
				
				sendReportDatas.add(opportunityDataReports);
			}
		}

		logger.info("App sendReportDatas Data........."+sendReportDatas);
		
		}catch(Exception e){
			//e.printStackTrace();
			logger.debug(e.getMessage());
		}
		return sendReportDatas;		
	}
}