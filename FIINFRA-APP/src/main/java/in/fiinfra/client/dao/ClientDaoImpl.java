package in.fiinfra.client.dao;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.core.Response;

import in.fiinfra.common.client.ClientData;
import in.fiinfra.common.client.ClientProfileData;
import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.DndData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.FamilyMemberData;
import in.fiinfra.common.common.NotesData;
import in.fiinfra.common.common.PartyAttributeData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.opportunity.OpportunityStageData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.GridData;
import in.fiinfra.util.DataSourceProvider;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;

public class ClientDaoImpl implements ClientDao{
	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	private static final Logger logger = Logger.getLogger(ClientDaoImpl.class);
	private static final String SP_RETRIVE_ClIENTS_TO_MERGE ="{CALL usp_cp_getClientListToMerge(?,?,?)}";
	Response response;
//	@Override
//	public List<ClientData> getClientList(int partyId, int buId,String clientValueSearch,boolean IsAutoPlan,int nodeId) {
//		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
//		return jdbcTemplate.query("{call usp_cp_getClientList(?,?,?,?)}", new Object[] { partyId,clientValueSearch,IsAutoPlan,nodeId },
//				new BeanPropertyRowMapper<ClientData>(ClientData.class));
//	}
	@SuppressWarnings("finally")
	@Override
	public Response getClientList(int partyId, int buId,String clientValueSearch,boolean IsAutoPlan,int nodeId,int pageNo,int pageSize,String orderBy,String sord) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		try {
		List<ClientData> list;
		BaseResponse<GridData> br = new BaseResponse<GridData>();
		GridData gridData=new GridData();
		
		list = jdbcTemplate.query("{call usp_cp_getClientList(?,?,?,?,?,?,?,?)}", new Object[] { partyId,clientValueSearch,IsAutoPlan,nodeId,pageNo,pageSize,orderBy,sord },
				new BeanPropertyRowMapper<ClientData>(ClientData.class));
		gridData.setRows(list);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getClientListCount");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		SqlParameter clientVlaueParam = new SqlParameter("clientValueSearch", Types.VARCHAR);
		SqlParameter IsAutoPlanParam = new SqlParameter("IsAutoPlan", Types.BOOLEAN);			
		SqlOutParameter recordsCountParam = new SqlOutParameter("recordsCount", Types.INTEGER);
		
		SqlParameter[] paramArray = { partyIdParam,clientVlaueParam,IsAutoPlanParam,nodeIdParam,recordsCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("clientValueSearch", clientValueSearch);
		paranValues.put("IsAutoPlan", IsAutoPlan);
		paranValues.put("nodeId", nodeId);
		
		logger.info("paranValues:--------------" + paranValues);
		logger.info("-----------Before Calling SP In APP(getClientList)-----------");
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("-----------After Calling SP In APP(getClientList)-----------");
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
	
//	public List<ClientData> getClientList(int partyId, int buId,String clientValueSearch,boolean IsAutoPlan,int nodeId) {
//		// TODO Auto-generated method stub
//		List<ClientData> clientDatas=new ArrayList<ClientData>();
//		try{
//		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
//		
//		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
//		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
//				jdbcTemplate, "usp_cp_getClientList");
//		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
//		SqlParameter clientVlaueParam = new SqlParameter("clientValueSearch", Types.VARCHAR);
//		SqlParameter IsAutoPlanParam = new SqlParameter("IsAutoPlan", Types.BOOLEAN);
//		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
//		
//		SqlParameter[] paramArray = { partyIdParam ,clientVlaueParam,IsAutoPlanParam,nodeIdParam};
//		myStoredProcedure.setParameters(paramArray);
//		myStoredProcedure.compile();
//		Map<String, Object> paranValues = new HashMap<String, Object>();
//		paranValues.put("partyId", partyId);
//		paranValues.put("clientValueSearch", clientValueSearch);
//		paranValues.put("IsAutoPlan", IsAutoPlan);
//		paranValues.put("nodeId", nodeId);
//		
//		System.out.println("paranValues:--" + paranValues);
//		Map<String, Object> storedProcResult = myStoredProcedure
//				.execute(paranValues);
//		System.out.println("storedProcResult:---" + storedProcResult);
//		//personal details
//		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
//		System.out.println("l:--" + l);
//		if (l != null) {
//			ClientData clientData = null;
//			for (Map<String, Object> row : l) {
//				clientData=new ClientData();
//				clientData.setName((String) row.get("name"));
//				clientData.setCity((String) row.get("city"));
//				clientData.setPanNo((String) row.get("panNo"));
//				clientData.setCreatedDate((String) row.get("createdDate"));
//				clientData.setEmail((String) row.get("email"));
//				clientData.setMobile((String) row.get("mobile"));
//				clientData.setStage((String) row.get("stage"));
//				clientData.setAction((String) row.get("Action"));
//				clientData.setActionComments((String) row.get("actionComments"));	
//				clientData.setPartyId((Integer) row.get("partyID"));
//				clientData.setBuId((Integer) row.get("buID"));
//				clientData.setAnalysisReportDocumentID((int) row.get("AnalysisReportDocumentID"));
//				clientData.setClientActionPlanDocumentID((int) row.get("ClientActionPlanDocumentID"));
//				clientData.setAdvisorActionPlanDocumentID((int) row.get("AdvisorActionPlanDocumentID"));
//				clientData.setQuickActionPlanDocumentID((int) row.get("QuickActionPlanDocumentID"));
//				clientData.setSummaryActionPlanDocumentID((int) row.get("SummaryActionPlanDocumentID"));
//				clientData.setClientActionPlanDocumentIDA((int) row.get("ClientActionPlanDocumentIDA"));
//				clientData.setAnalysisGoalRiskSuccessionID((int) row.get("AnalysisGoalRiskSuccessionID"));
//				clientData.setIsDatacollectionChanged((String) row.get("isDatacollectionChanged"));
//				clientData.setRecordTypeID((int) row.get("contactTypeId"));
//				clientData.setDcActivation((int) row.get("DCActivation"));
//				clientData.setPotentialPing((String) row.get("potentialPing"));
//				if((int) row.get("executionStatus")>0)
//				{
//					clientData.setExecutionStatusStr("have");	
//				}
//				else{
//					clientData.setExecutionStatusStr("not have");
//				}
//				clientDatas.add(clientData);
//			}
//		}
//
//		System.out.println("App Client Data........."+clientDatas);
//		
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		return clientDatas;
//	}
	
	
	@Override
	public List<OpportunityStageData> getClientStageList(int partyId, int buId,int nodeId) {
		// TODO Auto-generated method stub
		List<OpportunityStageData> clientStageDatas=new ArrayList<>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getClientStageList");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		
		SqlParameter[] paramArray = { partyIdParam, nodeIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("nodeId", nodeId);
		
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		//personal details
		
		
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		if (l != null) {
			OpportunityStageData opportunityStageData=null;
			for (Map<String, Object> row : l) {
				opportunityStageData=new OpportunityStageData();
				opportunityStageData.setPartyId((int) row.get("partyid"));
				opportunityStageData.setStage((String) row.get("stage"));
				opportunityStageData.setFpStageEndDate((String) row.get("FPStageEndDate"));
				opportunityStageData.setFpStageEndDateTime((String) row.get("FPStageEndDateTime"));
				
				clientStageDatas.add(opportunityStageData);
			}
		}
		
		//System.out.println("App Client Data........."+clientStageDatas);
		
		}catch(Exception e){
			//e.printStackTrace();
			logger.debug(e.getMessage());
		}
		return clientStageDatas;
	}
	
	
	
	@Override
	public List<Integer> saveClient(int partyId, String clientXMLString, int createdBy,int buId) {
		int recordCount=0;
		int isPanExist=0;
		List<Integer> resultList=new ArrayList<>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ClientData clientData=new ClientData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveClient");
		
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter clientXMLStringParam = new SqlParameter("clientXMLString", Types.VARCHAR);
		SqlParameter createdByParam = new SqlParameter("createdBy", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.VARCHAR);
		SqlOutParameter partyIdDBParam = new SqlOutParameter("partyIdDB", Types.VARCHAR);
		SqlOutParameter isPanExistParam = new SqlOutParameter("isPanExist", Types.VARCHAR);
		
		logger.debug("clientXMLString:--"+clientXMLString);
		SqlParameter[] paramArray = { partyIdParam,clientXMLStringParam,createdByParam,recordCountParam,partyIdDBParam,isPanExistParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("clientXMLString", clientXMLString);		
		paranValues.put("createdBy", createdBy);
		//System.out.println("paranValues:--" + paranValues);
		//System.out.println("XML"+clientXMLString);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		partyId=Integer.parseInt(storedProcResult.get("partyIdDB").toString());
		isPanExist=Integer.parseInt(storedProcResult.get("isPanExist").toString());
		resultList.add(recordCount);		
		resultList.add(partyId);
		resultList.add(isPanExist);
		logger.info("recordCount:---" + recordCount);
		logger.info("isPanExist------" + isPanExist);
		return resultList;
	}
	
	@Override
	public ClientProfileData getClientProfileRecord(int partyId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(partyId));
		
		//System.out.println("DAo Client Impl................"+buId);
		//System.out.println("DAo Client Impl................"+partyId);
		
		ClientProfileData clientProfileData=new ClientProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getClientProfileDetails");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);

		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		//personal details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				clientProfileData.setFirstName((String) row.get("firstname"));
				clientProfileData.setLastName((String) row.get("lastname"));
				clientProfileData.setSalutationId((Integer) row.get("SalutationId"));
				clientProfileData.setCompanyName((String) row.get("CompanyName"));
				clientProfileData.setPanNo((String) row.get("PanNo"));
				clientProfileData.setContactEmail((String) row.get("ContactEmail"));
				clientProfileData.setContactMobile((String) row.get("ContactMobile"));
				clientProfileData.setContactMobile2((String) row.get("ContactMobile2"));
				clientProfileData.setDob((String) row.get("DOB"));
				clientProfileData.setAnniversaryDate((String) row.get("AnniversaryDate"));
				clientProfileData.setWorkDesignation((String) row.get("CompanyDesignation"));
				clientProfileData.setWorkProfession((String) row.get("Occupation"));
				clientProfileData.setMartialStatusID((Integer) row.get("MaritalStatusID"));
				clientProfileData.setGenderID((Integer) row.get("genderID"));
				clientProfileData.setClientCategory((int) row.get("ClientCategory"));
				clientProfileData.setIsClientActivated((int) row.get("IsClientPortalActivated"));
				clientProfileData.setMemberShipStartDate((String) row.get("MemberShipStartDate"));
				clientProfileData.setMemberShipEndDate((String) row.get("MemberShipEndDate"));
				clientProfileData.setNextRenewalDate((String) row.get("MemberShipRenewalDueDate"));
				clientProfileData.setLastRenewedOn((String) row.get("MemberShipLastRenewalDate"));
			}
		}
		
		//address details
				l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
				//System.out.println("l:--" + l);
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
						addressData.setCountry1((String) row.get("country"));
						addressData.setPostalCode((String) row.get("postalcode"));
						addressDatas.add(addressData);
					}
				}
				
				//family details
				l = (List<Map<String, Object>>) storedProcResult.get("#result-set-3");
				//System.out.println("l:--" + l);
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
						familyMemberData.setPartyId((int) row.get("relatedpartyid"));
						familyMemberData.setWorkProfession((String) row.get("workProfession"));
						familyMemberDatas.add(familyMemberData);
					}
				}
				
				//Notes details
				l = (List<Map<String, Object>>) storedProcResult.get("#result-set-4");
				//System.out.println("l:--" + l);
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
				l = (List<Map<String, Object>>) storedProcResult.get("#result-set-5");
					//System.out.println("l:--" + l);
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
					
					l = (List<Map<String, Object>>) storedProcResult.get("#result-set-6");
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
					l = (List<Map<String, Object>>) storedProcResult.get("#result-set-7");
					List<PartyAttributeData> partyAttributeDatasHealth=new ArrayList<>();
					if (l != null) {
						for (Map<String, Object> row : l) {
							partyAttributeData=new PartyAttributeData();
							partyAttributeData.setAttributeCodeId((int) row.get("attributecodeid"));
							partyAttributeData.setAttributeValue((String) row.get("attributevalue"));
							partyAttributeDatasHealth.add(partyAttributeData);
						}
					}
					
					//Interested Fp		
					l = (List<Map<String, Object>>) storedProcResult.get("#result-set-8");
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
				clientProfileData.setAddressDataList(addressDatas);
				clientProfileData.setFamilyDataList(familyMemberDatas);
				clientProfileData.setNotesDataList(notesDatas);
				clientProfileData.setDocumentDatas(documentDatas);
				clientProfileData.setPartyAttributeDatas(partyAttributeDatas);
				clientProfileData.setPartyAttributeDatasHealth(partyAttributeDatasHealth);
				clientProfileData.setInterestedFpList(partyAttributeDatasFp);
				return clientProfileData;
		}

	@Override
	public List<Integer> updateClientProfile(String sectionName, String dataXml,
			int buId, int partyId,int lastModifiedBy) {
		int recordCount=0;
		List<Integer> resultList=new ArrayList<>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ClientProfileData clientProfileData=new ClientProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveClientProfileDetails");
		//System.out.println("Client PartyID-----------------------------------------------------------------"+partyId);
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter sectionNameParam = new SqlParameter("sectionName", Types.VARCHAR);
		SqlParameter dataXmlParam = new SqlParameter("dataXml", Types.VARCHAR);
		SqlParameter lastModifiedByParam = new SqlParameter("lastModifiedBy", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.VARCHAR);
		SqlOutParameter isPanExistParam = new SqlOutParameter("isPanExist", Types.VARCHAR);
		logger.debug("dataXml:--"+dataXml);
		SqlParameter[] paramArray = { partyIdParam,sectionNameParam,dataXmlParam,lastModifiedByParam ,recordCountParam,isPanExistParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("sectionName", sectionName);
		paranValues.put("dataXml", dataXml);
		paranValues.put("lastModifiedBy", lastModifiedBy);
		System.out.println("paranValues:--" + paranValues); 
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
	public String deleteClient(String partyIds,int buId,int createdBy) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_deleteClients");
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
	
	public List<ClientData> getClientListToMerge(int partyId,int buId,int contactpartyId,boolean isAllClients,boolean isFromProfile,int nodeId,String searchText)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
//		return jdbcTemplate.query(SP_RETRIVE_ClIENTS_TO_MERGE,new Object[] {partyId,contactpartyId,isAllClients},
//				new BeanPropertyRowMapper<ClientData>(ClientData.class));
		
		List<ClientData> clientDatas=new ArrayList<ClientData>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getClientListToMerge");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter contactpartyIdParam = new SqlParameter("contactpartyId", Types.INTEGER);
		SqlParameter isAllClientsParam = new SqlParameter("isAllClients", Types.BOOLEAN);
		SqlParameter isFromProfileParam = new SqlParameter("isFromProfile", Types.BOOLEAN);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		SqlParameter searchTextParam = new SqlParameter("searchText", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam ,contactpartyIdParam,isAllClientsParam,isFromProfileParam,nodeIdParam,searchTextParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("contactpartyId", contactpartyId);
		paranValues.put("isAllClients", isAllClients);
		paranValues.put("isFromProfile", isFromProfile);
		paranValues.put("nodeId", nodeId);
		paranValues.put("searchText", searchText);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		//personal details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		if (l != null) {
			ClientData clientData = null;
			for (Map<String, Object> row : l) {
				clientData=new ClientData();
				clientData.setFirstName((String) row.get("firstName"));
				clientData.setLastName((String) row.get("lastName"));
				clientData.setPanNo((String) row.get("panNo"));
				clientData.setEmail((String) row.get("contactEmail"));
				clientData.setPartyId((Integer)row.get("partyId"));
				clientDatas.add(clientData);
			}
		}

//		System.out.println("App Client Data........."+clientDatas);
		
		}catch(Exception e){
			//e.printStackTrace();
			logger.debug(e.getMessage());
		}
		return clientDatas;
		
//		List<ClientData> mergeClientData = new ArrayList<ClientData>();
//		return mergeClientData;
	}
	public String mergeClients(int partyId,String mergeClientIds,int buId,int contactPartyId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_mergeClients");
		SqlParameter partyIdsParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter mergeClientIdsParam = new SqlParameter("mergeClientId", Types.INTEGER);
		SqlParameter contactPartyIdParam = new SqlParameter("contactPartyId", Types.INTEGER);
		//SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { partyIdsParam,mergeClientIdsParam,contactPartyIdParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("mergeClientId", Integer.parseInt(mergeClientIds));
		paranValues.put("contactPartyId", contactPartyId);
		//paranValues.put("contactPartyId",nodeI);
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
}	
