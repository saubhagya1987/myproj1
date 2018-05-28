package in.fiinfra.partner.dao;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.XStreamTranslator;
import in.fiinfra.common.partner.ActionPlanData;
import in.fiinfra.common.partner.AssetAllocatedToGoal;
import in.fiinfra.common.partner.AuditData;
import in.fiinfra.common.partner.ContactData;
import in.fiinfra.common.partner.ETData;
import in.fiinfra.common.partner.ETPrePrintedFormData;
import in.fiinfra.common.partner.NotesData;
import in.fiinfra.common.partner.TransactionData;
import in.fiinfra.common.partner.TransactionHistoryData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;

public class ETDaoImpl implements ETDao{
	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	@Override
	/*
	 * 	This method return the List of ActionPlanData which is used to display main screen content of the execution tracker.
	 * partyId is used to fetch Action plan of the contact.
	 * 
	 * */
	public List<ActionPlanData> getApDetails(int buId,int partyId,int partnerId) {
		// TODO Auto-generated method stub
		
		
		List<ActionPlanData> actionPlanList=new ArrayList<ActionPlanData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getAPDetails");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.VARCHAR);
		SqlParameter partnerIdParam = new SqlParameter("partnerId", Types.VARCHAR);
		SqlParameter[] paramArray = {partyIdParam,partnerIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		//System.out.println("partyIdParam:--"+partyIdParam);
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId",partyId);
		paranValues.put("partnerId",partnerId);
		
		//paranValues.put("buId", buId);
		//System.out.println("paranValues:--"+paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		ActionPlanData actionPlanData=null;
		for(Map<String, Object> row:l){
			actionPlanData=new ActionPlanData();
			actionPlanData.setFpApId((int)row.get("FPActionPlanId"));
			actionPlanData.setClientName((String)row.get("ContactName"));
			actionPlanData.setPurpose((String)row.get("Purpose"));
			actionPlanData.setOpportunity((String)row.get("Opportunity"));
			actionPlanData.setPotentialRevenue((String)row.get("PotentialRevenue"));
			actionPlanData.setRecommendedProducts((String)row.get("RecommendedProducts"));
			actionPlanData.setInvestmentAmount((String)row.get("InvestmentAmount"));
			actionPlanData.setStatus((String)row.get("Status"));
			actionPlanData.setExStartDate((String)row.get("EXStartDate"));
			actionPlanData.setAmountInvolved((String)row.get("AmountInvolved"));
			actionPlanData.setClientType(row.get("RecordTypeId").toString());
			actionPlanList.add(actionPlanData);
		
	}
	
		return actionPlanList;
	}
	/*
	 * This method return list of contacts of the partner for quick search with search string (on main ET screen).
	 * 
	 * */
	public List<ContactData> quickSearchContacts(String searchString,int buId,int partnerId,int nodeId){
		List<ContactData> contactList=new ArrayList<ContactData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getContactsForAP");
		SqlParameter searchStringParam = new SqlParameter("searchStr", Types.VARCHAR);
		SqlParameter partnerParam = new SqlParameter("partnerId", Types.INTEGER);
		SqlParameter nodeidParam = new SqlParameter("nodeId", Types.INTEGER);
		SqlParameter[] paramArray = {searchStringParam,partnerParam,nodeidParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		//System.out.println("partnerParam:--"+partnerParam);
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("searchStr",searchString);
		paranValues.put("partnerId",partnerId);
		paranValues.put("nodeId", nodeId);
		//System.out.println("paranValues:--"+paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		ContactData contactData=null;
		for(Map<String, Object> row:l){
			contactData=new ContactData();
			contactData.setPartyId((int)row.get("PartyId"));
			contactData.setfName((String)row.get("fName"));
			contactData.setlName((String)row.get("lName"));
			contactData.setPanNo((String)row.get("PanNo"));
			contactData.setEmailId((String)row.get("Email"));
			contactData.setDob((String)row.get("dob"));
			contactData.setAge((String)row.get("age"));
			contactData.setName((String)row.get("name"));
			contactData.setRecordTypeId((int)row.get("recordTypeId"));
			contactList.add(contactData);
		
	}
	
		return contactList;

	}
	public List<Object> bulkUpload(int buId){
		List<Object> allDataList=new ArrayList<Object>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		Map<String,String> txnSource=new HashMap<String,String>();
		Map<String,String> fileType=new HashMap<String,String>();		
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getETNewBulkUpload");
		
		
	
//		SqlParameter searchStringParam = new SqlParameter("searchStr", Types.VARCHAR);
//		SqlParameter partnerParam = new SqlParameter("partnerId", Types.INTEGER);
//		SqlParameter[] paramArray = {searchStringParam,partnerParam};
//		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
//		System.out.println("partnerParam:--"+partnerParam);
//		Map<String, Object> paranValues = new HashMap<String, Object>();
//		paranValues.put("searchStr",searchString);
//		paranValues.put("partnerId",partnerId);
//		System.out.println("paranValues:--"+paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute();
		//System.out.println("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		for(Map<String, Object> row:l){
			txnSource.put(row.get("Id").toString(),row.get("Value").toString());					
		}
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		for(Map<String, Object> row:l){
			fileType.put(row.get("Id").toString(),row.get("Value").toString());					
		}
		allDataList.add(txnSource);
		allDataList.add(fileType);
		return allDataList;

	}
	
	/*public List<ActionPlanData> getApRecommendations(int buId,int partyId){
		
		List<ActionPlanData> apRecommendations=new ArrayList<ActionPlanData>();
		
jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getRecommendatiosnForET");
		
		
		return apRecommendations;
	}*/
	/*
	 * This method returns the ETData object to display basic ET details on Execution details screen against each action plan.
	 * 
	 * */
	@Override
	public ETData getExecutionDetails(int buId, int fpActionPlanId) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Object> allData=new ArrayList<Object>();
		List<ETData> etDataList=new ArrayList<ETData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getExecutionDetails");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId",fpActionPlanId);
	
		//System.out.println("paranValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		ETData etData=new ETData();
		for(Map<String, Object> row:l){
			etData.setPartyId(Integer.parseInt(row.get("PartyId").toString()));
			etData.setGoalName(row.get("Goal").toString());
			etData.setExecutionStatus(row.get("Status").toString());
			etData.setExecutionStartDate(row.get("ExecutionStartDate").toString());
			etData.setTargetAmount(row.get("TargetAmount").toString());
			etData.setTargetYear(row.get("TargetYear").toString());
			etData.setRecommendedInvestment((row.get("RecommendedInvestment").toString()));//;
		}
		return etData;
	}
	/*
	 * This method return recommended investments for particular opportunity(action plan)
	 * */
	@Override
	public List<ETData> getRecommendedInvestment(int buId, int fpActionPlanId) {
		// TODO Auto-generated method stub
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Object> allData=new ArrayList<Object>();
		List<ETData> etDataList=new ArrayList<ETData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getRecommendedInvestment");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId",fpActionPlanId);
	
		//System.out.println("paranValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		ETData etData=new ETData();
		for(Map<String, Object> row:l){
			 etData=new ETData();
			int i = (int) row.get("ProductID");
			etData.setPartyId(i);
			etData.setProductName(row.get("ProductName").toString());
			etData.setAllocationPercent(row.get("AllocationPercent").toString());
			etData.setInvestmentType(row.get("InvestmentType").toString());
			etData.setInvestmentAmount(row.get("InvestmentAmount").toString());
			etData.setFrequency(row.get("SIPFreq").toString());
			etDataList.add(etData);
		}
		return etDataList;
	}
	/*
	 * This method return proposed investments for particular opportunity(action plan)
	 * */

	@Override
	public List<ETData> getProposedInvestment(int buId, int fpActionPlanId) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Object> allData=new ArrayList<Object>();
		List<ETData> etDataList=new ArrayList<ETData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getProposedInvestment");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId",fpActionPlanId);
	
		//System.out.println("paranValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		ETData etData=new ETData();
		for(Map<String, Object> row:l){
			 etData=new ETData();
			 
			 	etData.setFpExecutionId(Integer.parseInt(row.get("fpExecutionId").toString()));
				etData.setProductName(row.get("ProductName").toString());
				etData.setAllocationPercent(row.get("ProposedAllocationPercent").toString());
				etData.setInvestmentType(row.get("InvestmentType").toString().toString());
				etData.setInvestmentAmount(row.get("InvestmentAmount").toString());
				etData.setFrequency(row.get("Frequency").toString());
				etData.setClientApprovalStatus(row.get("ClientApprovalStatus").toString());
				etDataList.add(etData);
		}
		return etDataList;
	}
	/*
	 * This method return the execution details screen picklists.
	 * */
	@Override
	public Map<String,Map<String,String>> getExecutionDetailsPickList(int buId,int fpActionPlanId) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		Map<String,Map<String,String>> maps=new HashMap<String,Map<String,String>>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getExecutionDetailsPickList");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId",fpActionPlanId);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		Map<String,String>  products=new HashMap<String,String>();
		for(Map<String, Object> row:l){
			
			//System.out.println("row.get(ProductId).toString():::::::::::"+row.get("ProductId").toString());
			products.put(row.get("ProductId").toString(), row.get("ProductName").toString());
				
				
		}
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		Map<String,String>  frequency=new HashMap<String,String>();
		for(Map<String, Object> row:l){
			
			frequency.put(row.get("FrequencyId").toString(), row.get("Frequency").toString());
				
				
		}
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		Map<String,String>  clientAprrovalStatus=new HashMap<String,String>();
		for(Map<String, Object> row:l){
			
			clientAprrovalStatus.put(row.get("ClientApprovalStatusId").toString(), row.get("ClientApprovalStatus").toString());
				
				
		}
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		Map<String,String>  investmentType=new HashMap<String,String>();
		for(Map<String, Object> row:l){
			
			investmentType.put(row.get("InvestmentTypeId").toString(), row.get("InvestmentType").toString());
				
				
		}
		maps.put("Products", products);
		maps.put("Frequency", frequency);
		maps.put("ClientApprovalStatus", clientAprrovalStatus);
		maps.put("InvestmentType", investmentType);
		return maps;
	}
	/*
	 * This method is used for saving proposed investments against each action plan record
	 * */
	@Override
	public void saveProposedInvestments(int buId,int fpActionPlanId,int createdBy,List<ETData> etData) {
		// TODO Auto-generated method stub
		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_saveProposedInvestment");
		SqlParameter xmlString = new SqlParameter("xmlString", Types.VARCHAR);
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter createdByParam = new SqlParameter("createdBy", Types.INTEGER);
		
		
		SqlParameter[] paramArray = {xmlString,fpActionPlanIdParam,createdByParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("xmlString",xmlTransaltor.toXMLString(etData));
		paramValues.put("fpActionPlanId",fpActionPlanId);
		paramValues.put("createdBy",createdBy);
		
		//System.out.println("paranValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
	
		
		//System.out.println("xmlTransaltor::::::xml:"+xmlTransaltor.toXMLString(etData));
	}
	
	/**
	 * Method gets the execution tracker status from database
	 */
	public ETData getExecutionStatus(int buId, int fpActionPlanId) {
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getExecutionStatus");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId",
				Types.INTEGER);
		SqlParameter[] paramArray = { fpActionPlanIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId", fpActionPlanId);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		String status="";
		ETData etData=new ETData();
		for(Map<String, Object> row:l){
					
					status=row.get("Status").toString();
						
						
				}
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		
		for(Map<String, Object> row:l){
					
			etData.setCancelNoteText(row.get("NoteText").toString());
						
						
				}

		//System.out.println("..................................status............................."+status);
		etData.setExecutionStatus(status);
		return etData;
	}
	/*
	 * This method marks the current execution as cancel and save cancel note @comment
	 * */
	public void cancelExecution(int buId,int fpApActionPlan,String comment,int createdBy){
jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_cancelExecution");
		SqlParameter commentParam = new SqlParameter("comment", Types.VARCHAR);
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter  createdByParam=new SqlParameter("createdBy",Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam,commentParam,createdByParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("fpActionPlanId",fpApActionPlan);		
		paramValues.put("comment",comment);
		paramValues.put("createdBy",createdBy);
		//System.out.println("paranValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
	
	}

	public int saveEtForm(int buId,int fpExecutionId,ETPrePrintedFormData etForm,int createdBy){
		
		
		// TODO Auto-generated method stub
				XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

				//System.out.println("xmlTransaltor::::::xml:"+etForm.getNomineeGuardianAddress1());
				CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
						jdbcTemplate, "usp_pp_saveEtForm");
				SqlParameter xmlString = new SqlParameter("xmlString", Types.VARCHAR);
				//SqlParameter fpActionPlanIdParam = new SqlParameter("fpExecutionId", Types.INTEGER);
				SqlParameter createdByParam=new  SqlParameter("createdBy",Types.INTEGER);
				SqlOutParameter fpExecutionIdParam=new SqlOutParameter("fpExecutionId",Types.INTEGER);
				SqlParameter[] paramArray = {xmlString,createdByParam,fpExecutionIdParam};
				myStoredProcedure.setParameters(paramArray);
				myStoredProcedure.compile();
				Map<String, Object> paramValues = new HashMap<String, Object>();
				paramValues.put("xmlString",xmlTransaltor.toXMLString(etForm));
				//paramValues.put("fpExecutionId",fpExecutionId);
				paramValues.put("createdBy",createdBy);
				//System.out.println("paramValues:--"+paramValues);
				Map<String, Object> storedProcResult = myStoredProcedure
						.execute(paramValues);
				
				fpExecutionId=(int) storedProcResult.get("fpExecutionId");				
				//System.out.println("xmlTransaltor::::::xml:"+xmlTransaltor.toXMLString(etForm));
		
		return fpExecutionId;
		
	}
	
	public List<ETPrePrintedFormData> getPrePrintedFormProducts(int buId,int fpActionPlanId){
		
		
		// TODO Auto-generated method stub
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getETPrePrintedFormProducts");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId",fpActionPlanId);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
			ETPrePrintedFormData form=new ETPrePrintedFormData();
			List<ETPrePrintedFormData> formList=new ArrayList<ETPrePrintedFormData>();
		for(Map<String, Object> row:l){
			form=new ETPrePrintedFormData();
			
					form.setFpExecutionId(Integer.parseInt(row.get("ExecutionId").toString()));
					form.setProductId(row.get("Product").toString());
					formList.add(form);						
				}
		
		return formList;
	}
	@SuppressWarnings("unchecked")
	public ETPrePrintedFormData loadEtForm(int buId,int fpExecutionId){
		
		ETPrePrintedFormData etForm=new ETPrePrintedFormData();
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_loadEtForm");
		SqlParameter fpExecutionIdParam = new SqlParameter("fpExecutionId", Types.INTEGER);
		SqlParameter[] paramArray = {fpExecutionIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpExecutionId",fpExecutionId);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		for(Map<String, Object> row:l){
			
			etForm.setFolioNo(row.get("AccountFolioNo").toString());
			etForm.setTitle1(row.get("FirstHolderTitle").toString());
			etForm.setName1(row.get("FirstHolderName").toString());
			etForm.setGender1(row.get("FirstHolderGender").toString());
			etForm.setDob1(row.get("FirstHolderDOB").toString());
			etForm.setPanNo1(row.get("FirstHolderPAN").toString());
			etForm.setEmailId1(row.get("EmailID").toString());
			etForm.setMobileNo1(row.get("MobileNo").toString());
			etForm.setContactNoRes1(row.get("FirstHolderContactNoRes").toString());
			etForm.setContactNoOff1(row.get("FirstHolderContactNoOff").toString());
			etForm.setGuardianName1(row.get("GuardianName").toString());
			etForm.setGuardianRelation1(row.get("GuardianRelationship").toString());
			etForm.setTitle2(row.get("SecondHolderTitle").toString());
			etForm.setName2(row.get("SecondHolderName").toString());
			etForm.setPanNo2(row.get("SecondHolderPAN").toString());
			etForm.setTitle3(row.get("ThirdHolderTitle").toString());
			etForm.setName3(row.get("ThirdHolderName").toString());
			etForm.setPanNo3(row.get("ThirdHolderPAN").toString());
			etForm.setApplicationStatus1(row.get("InvestorStatusID").toString());
			etForm.setModeOfHolding1(row.get("ModeOfHoldingID").toString());
			etForm.setOccupation1(row.get("OccupationID").toString());
			etForm.setProductId(row.get("ProductId").toString());
			etForm.setSchemeName(row.get("SchemeName").toString());
			etForm.setSchemeOption(row.get("SchemeOption").toString());
			etForm.setInvestmentAmount(row.get("InvestmentAmount").toString());
			etForm.setNomineeName1(row.get("Nominee1Name").toString());
			etForm.setNomineeAddress1(row.get("Nominee1Address").toString());
			etForm.setNomineeDob1(row.get("Nominee1DOB").toString());
			etForm.setNomineeRelation1(row.get("Nominee1Relationship").toString());
			etForm.setNomineeAllocationPercent1(row.get("Nominee1Allocation").toString());
			etForm.setNomineeGuardianName1(row.get("Nominee1GuardianName").toString());
			etForm.setNomineeGuardianAddress1(row.get("Nominee1GuardianAddress").toString());
			etForm.setNomineeName2(row.get("Nominee2Name").toString());
			etForm.setNomineeAddress2(row.get("Nominee2Address").toString());
			etForm.setNomineeDob2(row.get("Nominee2DOB").toString());
			etForm.setNomineeRelation2(row.get("Nominee2Relationship").toString());
			etForm.setNomineeAllocationPercent2(row.get("Nominee2Allocation").toString());
			etForm.setNomineeGuardianName2(row.get("Nominee2GuardianName").toString());
			etForm.setNomineeGuardianAddress2(row.get("Nominee2GuardianAddress").toString());
			etForm.setNomineeName3(row.get("Nominee3Name").toString());
			etForm.setNomineeAddress3(row.get("Nominee3Address").toString());
			etForm.setNomineeDob3(row.get("Nominee3DOB").toString());
			etForm.setNomineeRelation3(row.get("Nominee3Relationship").toString());
			etForm.setNomineeAllocationPercent3(row.get("Nominee3Allocation").toString());
			etForm.setNomineeGuardianName3(row.get("Nominee3GuardianName").toString());
			etForm.setNomineeGuardianAddress3(row.get("Nominee3GuardianAddress").toString());
			etForm.setBankName(row.get("BankName").toString());
			etForm.setBranchName(row.get("BranchName").toString());
			etForm.setBankAcNo(row.get("AccountNumber").toString());
			etForm.setBankIfscCode(row.get("IFSC").toString());
			etForm.setBankMicrCode(row.get("MICR").toString());
			etForm.setBankAcType(row.get("AccountType").toString());
			etForm.setBankAddress(row.get("BankBranchAddress").toString());
			etForm.setBankState(row.get("BankBranchState").toString());
			etForm.setBankCity(row.get("BankBranchCity").toString());
			etForm.setAddress1(row.get("Address").toString());
			etForm.setState1(row.get("State").toString());
			etForm.setCity1(row.get("City").toString());
			etForm.setCountry1(row.get("Country").toString());
			etForm.setZipCode1(row.get("PostalCode").toString());
			
			etForm.setArnCode(row.get("ARNCode").toString());
			etForm.setSubBrokerCode(row.get("SubBrokerCode").toString());
			
			etForm.setEuin(row.get("EUIN").toString());
			
			etForm.setInvestmentTypeId(row.get("InvestmentTypeId").toString());
			etForm.setTransactionTypeId(row.get("TransactionTypeId").toString());
			
			
		}
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<String> folioNos=new ArrayList<String>();
		for(Map<String, Object> row:l){
			
			folioNos.add(row.get("FolioNo").toString());
		}
		
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		Map<String,String> products=new HashMap<String,String>();
		for(Map<String, Object> row:l){
			
			//System.out.println("............................."+row.get("ProductID")+"......."+row.get("ProductName"));
			products.put(row.get("ProductID").toString(),row.get("ProductName").toString());
		}
		etForm.setProducts(products);
		etForm.setFolioNos(folioNos);
		return etForm;
	}
public ETPrePrintedFormData autoPolpulateEtForm(int buId,int fpActionPlanId){
		
		ETPrePrintedFormData etForm=new ETPrePrintedFormData();
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_autoPopulateETForm");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId",fpActionPlanId);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		for(Map<String, Object> row:l){
			
			etForm.setName1(row.get("Name").toString());
			etForm.setTitle1(row.get("Salutation").toString());
			etForm.setEmailId1(row.get("EmailId").toString());
			etForm.setPanNo1(row.get("PanNo").toString());
			etForm.setDob1(row.get("DOB").toString());
			etForm.setGender1(row.get("Gender").toString());
			etForm.setArnCode(row.get("ARN").toString());
			etForm.setMobileNo1(row.get("Mobile").toString());
			etForm.setEuin(row.get("EUIN").toString());

		}
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		for(Map<String, Object> row:l){
			
			
			etForm.setAddress1(row.get("Street").toString());
			etForm.setCity1(row.get("City").toString());
			etForm.setState1(row.get("State").toString());
			etForm.setCountry1(row.get("Country").toString());
			etForm.setZipCode1(row.get("PostalCode").toString());

		}
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		for(Map<String, Object> row:l){
			
			
			etForm.setBankName(row.get("BankName").toString());
			etForm.setBranchName(row.get("BranchName").toString());
			etForm.setBankAddress(row.get("Street").toString());
			etForm.setBankCity(row.get("City").toString());
			etForm.setBankState(row.get("State").toString());
			etForm.setBankAcType(row.get("AccountType").toString());
			etForm.setBankAcNo(row.get("AccountNo").toString());
			etForm.setBankMicrCode(row.get("MICRCode").toString());
			etForm.setBankIfscCode(row.get("IFSCCode").toString());

		}
		return etForm;
}
	public Map<String,String> getAllProductManufacturer(int buId){
		Map<String,String> manufacturers=new HashMap<String,String>();
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getAllProductManufacturer");
	
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		for(Map<String, Object> row:l){
			
			manufacturers.put(row.get("Id").toString(),row.get("Name").toString());
		}

		return manufacturers;
		
		
	}
	public Map<String ,String> loadProductsForManufacturer(int buId,String manufacturerCode){
		Map<String,String> products=new HashMap<String,String>();
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getProductsForManufacturer");
		SqlParameter manufacturerCodeParam = new SqlParameter("manufacturerCode", Types.VARCHAR);
		SqlParameter[] paramArray = {manufacturerCodeParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("manufacturerCode",manufacturerCode);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		for(Map<String, Object> row:l){
			
			products.put(row.get("ProductId").toString(),row.get("ProductName").toString());
		}

		return products;
		
	}
	
	public void generateEtForm(int buId, int fpExecutionId, int createdBy){
jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_generateEtForm");
		SqlParameter fpExecutionIdParam = new SqlParameter("fpExecutionId", Types.INTEGER);
		SqlParameter createdByParam = new SqlParameter("createdBy", Types.INTEGER);
		SqlParameter[] paramArray = {fpExecutionIdParam,createdByParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpExecutionId",fpExecutionId);
		paramValues.put("createdBy",createdBy);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);		
	}
public List<ETPrePrintedFormData> getAvailablePrePrintedForm(int buId,int fpActionPlanId){
		
		
		// TODO Auto-generated method stub
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getAvailablePrePrintedForms");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId",fpActionPlanId);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
			ETPrePrintedFormData form=new ETPrePrintedFormData();
			List<ETPrePrintedFormData> formList=new ArrayList<ETPrePrintedFormData>();
		for(Map<String, Object> row:l){
			form=new ETPrePrintedFormData();
			
					form.setFpExecutionId(Integer.parseInt(row.get("ExecutionId").toString()));
					form.setProductId(row.get("Product").toString());
					form.setFormName(row.get("FormName").toString());
					form.setGeneratedOn(row.get("GeneratedOn").toString());
					form.setFormPath(row.get("FormPath").toString());
					form.setDocId(row.get("DocumentId").toString());
					form.setPartyId(Integer.parseInt(row.get("PartyID").toString()));
					formList.add(form);						
				}
		
		return formList;
	}
	public List<DocumentData> getAllEtDocuments(int buId,int fpActionPlanId){
		List<DocumentData> documents=new ArrayList<DocumentData>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getAllEtDocuments");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId",fpActionPlanId);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		DocumentData doc=new DocumentData();
			List<ETPrePrintedFormData> formList=new ArrayList<ETPrePrintedFormData>();
		for(Map<String, Object> row:l){
			doc=new DocumentData();
			
					doc.setDocumentId(Integer.parseInt(row.get("DocumentID").toString()));
					doc.setFileName(row.get("FileName").toString());
					doc.setDocumentName(row.get("DocumentName").toString());
					doc.setUploadedBy(row.get("UploadedBy").toString());
					doc.setUploadedOn(row.get("UploadedOn").toString());
					doc.setContactEmailId(row.get("ContactEmailId").toString());
					doc.setPartnerEmailId(row.get("PartnerEmailId").toString());
					doc.setPartyId(Integer.parseInt(row.get("PartyId").toString()));
					
					documents.add(doc);						
				}
		return documents;
	}
	public List<NotesData> getNotes(int buId,int fpActionPlanId){
		
		List<NotesData> notes=new ArrayList<NotesData>();
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getEtNotes");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId",fpActionPlanId);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		NotesData note=null;
			List<ETPrePrintedFormData> formList=new ArrayList<ETPrePrintedFormData>();
		for(Map<String, Object> row:l){
					note=new NotesData();
			
					note.setNotesText(row.get("NoteText").toString());
					note.setNotesId(row.get("NoteId").toString());
					note.setRecordedBy(row.get("RecordedBy").toString());
					note.setUpdatedOn(row.get("UpdatedOn").toString());
					
					
					notes.add(note);						
				}
		
		return notes;
		
		
		
	}
	public void saveEtNote(int buId,int fpActionPlanId,String noteText,int noteId,int createdBy){
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_saveEtNotes");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter noteTextParam = new SqlParameter("noteText", Types.VARCHAR);
		SqlParameter noteIdParam = new SqlParameter("noteId", Types.INTEGER);
		SqlParameter createdByParam = new SqlParameter("createdBy", Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam,noteTextParam,noteIdParam,createdByParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId",fpActionPlanId);
		paramValues.put("noteText", noteText);
		paramValues.put("noteId", noteId);
		paramValues.put("createdBy", createdBy);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
	}
	public void deleteEtNotes(String noteIds,int buId){
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_deleteEtNotes");
		SqlParameter noteIdParam = new SqlParameter("noteIds", Types.VARCHAR);
		SqlParameter[] paramArray = {noteIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();

		paramValues.put("noteIds", noteIds);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
	}
	public String uploadDoc(int fpActionPlanId,int  buId,int createdBy,List<DocumentData> docs){
		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_uploadEtDocs");
		SqlParameter xmlString = new SqlParameter("xmlString", Types.VARCHAR);
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter creatredByParam = new SqlParameter("createdBy", Types.INTEGER);
		SqlOutParameter basePathParam = new SqlOutParameter("basePath",
				Types.VARCHAR);
		SqlParameter[] paramArray = {xmlString,fpActionPlanIdParam,creatredByParam,basePathParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("xmlString",xmlTransaltor.toXMLString(docs));
		paramValues.put("fpActionPlanId",fpActionPlanId);
		paramValues.put("createdBy",createdBy);
		//System.out.println("paranValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		//System.out.println("xmlTransaltor::::::xml:"+xmlTransaltor.toXMLString(docs));
		return storedProcResult.get("basePath").toString();
//		return "D:\\sachin\\Docs\\temp";
		
	}
	public String deleteEtDocs(String docIds,int buId){
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_deleteEtDocs");
		SqlParameter noteIdParam = new SqlParameter("docIds", Types.VARCHAR);
		SqlOutParameter pathsParam=new SqlOutParameter("paths", Types.VARCHAR);
		SqlParameter[] paramArray = {noteIdParam ,pathsParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();

		paramValues.put("docIds", docIds);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		return storedProcResult.get("paths").toString();
	}
	public String  bulkUploadTxn( int txnSourceId,int buId,int createdBy,List<DocumentData> docs){
		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_bulkUploadTxn");
		SqlParameter xmlString = new SqlParameter("xmlString", Types.VARCHAR);
		SqlParameter creatredByParam = new SqlParameter("createdBy", Types.INTEGER);
		SqlParameter txnSourceIdParam = new SqlParameter("txnSourceId", Types.INTEGER);
		SqlOutParameter basePathParam = new SqlOutParameter("basePath",
				Types.VARCHAR);
		SqlParameter[] paramArray = {xmlString,creatredByParam,txnSourceIdParam,basePathParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("xmlString",xmlTransaltor.toXMLString(docs));
		paramValues.put("txnSourceId",txnSourceId);
		paramValues.put("createdBy",createdBy);
		//System.out.println("paranValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		//System.out.println("xmlTransaltor::::::xml:"+xmlTransaltor.toXMLString(docs));
		return storedProcResult.get("basePath").toString();

	}
	@Override
	public List<TransactionData> getBulkUploadTxnHistory(int buId, int createdBy) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getBulkUploadTxnHistory");
		SqlParameter creatredByParam = new SqlParameter("createdBy", Types.INTEGER);
		SqlParameter[] paramArray = {creatredByParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("createdBy",createdBy);
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		TransactionData data=new TransactionData();
		List<TransactionData> dataList=new ArrayList<TransactionData>();
		for(Map<String, Object> row:l){
			data=new TransactionData();
			data.setBatchId(Integer.parseInt(row.get("QId").toString()));
			data.setCreatedDate(row.get("RequestedDateTime").toString());
			data.setErrorCount(Integer.parseInt(row.get("ErrorCount").toString()));
			data.setRecordCount(Integer.parseInt(row.get("RecordCount").toString()));
			data.setTransactionType(row.get("QType").toString());
			data.setStatus(row.get("Status").toString());
			data.setFileName(row.get("FileName").toString());
			data.setUploadSourceType(row.get("UploadSourceType").toString());
			dataList.add(data);						
		}
		return dataList;
	}
	@Override
	public void updateETClientApproval(int buId, int fpExecutionId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_UpdateClientApprovalRequest");
		SqlParameter creatredByParam = new SqlParameter("fpExecutionId", Types.INTEGER);
		SqlParameter[] paramArray = {creatredByParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpExecutionId",fpExecutionId);
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		
	}
	@SuppressWarnings("unchecked")
	public List<AuditData> getEtTrackingHistory(int buId,int fpActionPlanId){
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getEtTrackingHistory");
		SqlParameter fpActionPlanIdParam = new SqlParameter("fpActionPlanId", Types.INTEGER);
		SqlParameter[] paramArray = {fpActionPlanIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("fpActionPlanId",fpActionPlanId);
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		AuditData audit=new AuditData();
		List<AuditData> auditList=new ArrayList<AuditData>();
		for(Map<String, Object> row:l){
			audit=new AuditData();
			audit.setActionText(row.get("Action").toString());
			audit.setActionBy(row.get("By").toString());
			audit.setActionDate(row.get("Date").toString());
			
			auditList.add(audit);						
		}
		return auditList;
	}
	@SuppressWarnings("unchecked")
	@Override
	public ETPrePrintedFormData loadFolioDetails(int buId, String folioId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_loadFolioDetails");
		
		SqlParameter folioNumberParam = new SqlParameter("folioNumber", Types.VARCHAR);
		SqlParameter[] paramArray = {folioNumberParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("folioNumber",folioId);
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		List<Map<String,Object>> columnList1=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<Map<String,Object>> columnList2=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<Map<String,Object>> columnList3=(List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		List<Map<String,Object>> columnList4=(List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		List<Map<String,Object>> columnList5=(List<Map<String, Object>>) storedProcResult.get("#result-set-5");
		ETPrePrintedFormData etPrePrintedFormData = new ETPrePrintedFormData();
		
		for(Map<String,Object> col : columnList1){
			etPrePrintedFormData.setName1(col.get("Name").toString());
			etPrePrintedFormData.setTitle1(col.get("Salutation").toString());
			etPrePrintedFormData.setPanNo1(col.get("PanNo").toString());
		}
		
		for(Map<String,Object> col : columnList2){
			etPrePrintedFormData.setName2(col.get("Name").toString());
			etPrePrintedFormData.setTitle2(col.get("Salutation").toString());
			etPrePrintedFormData.setPanNo2(col.get("PanNo").toString());
		}
		
		for(Map<String,Object> col : columnList3){
			etPrePrintedFormData.setNomineeName1(col.get("Name").toString());
			etPrePrintedFormData.setNomineeAddress1(col.get("Address").toString());
			etPrePrintedFormData.setNomineeDob1(col.get("DOB").toString());
		}
		
		for(Map<String,Object> col : columnList4){
			etPrePrintedFormData.setNomineeName2(col.get("Name").toString());
			etPrePrintedFormData.setNomineeAddress2(col.get("Address").toString());
			etPrePrintedFormData.setNomineeDob2(col.get("DOB").toString());
		}
		
		for(Map<String,Object> col : columnList5){
			etPrePrintedFormData.setNomineeName3(col.get("Name").toString());
			etPrePrintedFormData.setNomineeAddress3(col.get("Address").toString());
			etPrePrintedFormData.setNomineeDob3(col.get("DOB").toString());
		}
			
		return etPrePrintedFormData;
	}
	@Override
	public List<Map<String, String>> getBulkUploadTransactionHistoryErrorCount(
			int buId, int queueId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getBulkUploadTxnHistoryErrorLog");
		
		SqlParameter folioNumberParam = new SqlParameter("batchJobRequestId", Types.INTEGER);
		SqlParameter[] paramArray = {folioNumberParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("batchJobRequestId",queueId);
		
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		 List<Map<String, String>> result = new ArrayList<Map<String,String>>();
		for(Map<String,Object> col : columnList){
			Map<String,String> colMap = new HashMap<String,String>();
			colMap.put("RecordNo", col.get("RecordNo").toString());
			colMap.put("FailureType", col.get("FailureType").toString());
			colMap.put("ErrorDetails", col.get("ErrorDetails").toString());
			result.add(colMap);
		}	
		return result;
	}
	@Override
	public List<TransactionHistoryData> getBulkUploadTransactionHistoryDetails(
			int buId, int queueId,int partnerId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getBulkUploadTxnHistoryDetails");
		
		SqlParameter folioNumberParam = new SqlParameter("batchJobRequestId", Types.INTEGER);
		SqlParameter partnerIdParam = new SqlParameter("partnerId", Types.INTEGER);
		SqlParameter[] paramArray = {folioNumberParam,partnerIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("batchJobRequestId",queueId);
		paramValues.put("partnerId",partnerId);
		
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<TransactionHistoryData> result = new ArrayList<TransactionHistoryData>();
		for(Map<String,Object> col : columnList){
			TransactionHistoryData data = new TransactionHistoryData();
			data.setAccountNumber(col.get("BankAccountId").toString());
			data.setAssetClass(col.get("AssetClass").toString());
			data.setBatchId(col.get("BatchRunId").toString());
			data.setPrice(col.get("TxnPrice").toString());
			data.setProduct(col.get("ProductName").toString());
			data.setProductCategory(col.get("ProductType").toString());
			data.setSubCategory(col.get("SubCategory").toString());
			data.setTransactionAmount(col.get("TxnAmount").toString());
			data.setTransactionId(col.get("TxnId").toString());
			data.setTransactionDate(col.get("TxnDate").toString());
			data.setTransactionType(col.get("TxnType").toString());
			data.setUnitsOrQuantity(col.get("TxnUnits").toString());
			result.add(data);
		}
		return result;
	}
	@Override
	public void requestForReporcess(int buId, int queueId, int createdBy) {
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_reprocessTxn");
		
		SqlParameter queueIdParam = new SqlParameter("batchId", Types.INTEGER);
		SqlParameter createdByParam = new SqlParameter("createdBy", Types.INTEGER);
		SqlParameter[] paramArray = {queueIdParam,createdByParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("batchId",queueId);
		paramValues.put("createdBy",createdBy);
		myStoredProcedure.execute(paramValues);
		
		
		//return "success";
	}
	@SuppressWarnings("finally")
	@Override
	public Response getApplicantDetailsList(ETPrePrintedFormData formData) {
		
		Response response = null;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(formData.getBuId()));
		try {
			List<ETPrePrintedFormData> list;
			BaseResponse<ETPrePrintedFormData> br = new BaseResponse<ETPrePrintedFormData>();

			list = jdbcTemplate.query(
					FiinfraConstants.SP_GET_APPLICANT_DETAILS_LIST, new Object[] {formData.getFpExecutionId(),formData.getPartyId()},
					new BeanPropertyRowMapper<ETPrePrintedFormData>(ETPrePrintedFormData.class));
			br.setResponseListObject(list);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
		
	}
	

	@SuppressWarnings("finally")
	@Override
	public Response getClientDetailsForApprovel(ETData etData) {
		Response response = null;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(etData.getBuId()));
		try {
			List<ETData> list;
			BaseResponse<ETData> br = new BaseResponse<ETData>();

			list = jdbcTemplate.query(
					FiinfraConstants.SP_GET_CLIENT_DETAILS_LIST, new Object[] {etData.getFpExecutionId()},
					new BeanPropertyRowMapper<ETData>(ETData.class));
			br.setResponseListObject(list);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}
		
	@SuppressWarnings("unchecked")
	public List<ETPrePrintedFormData> loadMutualFundProduct(int buId,String searchStr){
		
		List<ETPrePrintedFormData> etFormList=new ArrayList<ETPrePrintedFormData>();
		ETPrePrintedFormData etForm=null;
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getPortFolioPrePrintedFormProducts");
		SqlParameter searchStrParam = new SqlParameter("searchStr", Types.VARCHAR);
		SqlParameter[] paramArray = {searchStrParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("searchStr",searchStr);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		for(Map<String, Object> row:l){
			etForm=new ETPrePrintedFormData();
			etForm.setProductId(row.get("productId").toString());
			etForm.setProductName(row.get("productName").toString());
			etFormList.add(etForm);

		}
		return etFormList;
	}
	@SuppressWarnings("unchecked")
	public ETPrePrintedFormData loadPortFolioPrePrintedForm(int buId,int productid,int clientPartyId){
		
		ETPrePrintedFormData etForm=new ETPrePrintedFormData();
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_loadPortFolioPrePrintedForm");
	  /*SqlParameter productidParam = new SqlParameter("productid", Types.INTEGER);
		SqlParameter[] paramArray = {productidParam};
		myStoredProcedure.setParameters(paramArray);*/
		
		SqlParameter clientPartyIdParam = new SqlParameter("clientPartyId", Types.INTEGER);
		SqlParameter[] paramArrayClientPartyId = {clientPartyIdParam};
		myStoredProcedure.setParameters(paramArrayClientPartyId);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		//paramValues.put("productid",productid);
		paramValues.put("clientPartyId",clientPartyId);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		for(Map<String, Object> row:l){
			
			etForm.setName1(row.get("FirstHolderName").toString());
			etForm.setArnCode(row.get("ARNCode").toString());
			etForm.setSubBrokerCode(row.get("SubBrokerCode").toString());
			etForm.setEuin(row.get("EUIN").toString());
			etForm.setBankName(row.get("BankName").toString());
			etForm.setBranchName(row.get("BranchName").toString());
			etForm.setBankAcNo(row.get("AccountNumber").toString());
			etForm.setBankIfscCode(row.get("IFSC").toString());
			etForm.setBankMicrCode(row.get("MICR").toString());
			etForm.setBankAcType(row.get("AccountType").toString());
			etForm.setContactNoRes1(row.get("FirstHolderContactNoRes").toString());
			etForm.setContactNoOff1(row.get("FirstHolderContactNoOff").toString());
			etForm.setEmailId1(row.get("EmailID").toString());
			etForm.setMobileNo1(row.get("MobileNo").toString());
			etForm.setGender1(row.get("FirstHolderGender").toString());
			etForm.setDob1(row.get("FirstHolderDOB").toString());
			etForm.setPanNo1(row.get("FirstHolderPAN").toString());
			
				
		  /*etForm.setFolioNo(row.get("AccountFolioNo").toString());
			etForm.setTitle1(row.get("FirstHolderTitle").toString());*/
			
			/*etForm.setGuardianName1(row.get("GuardianName").toString());
			etForm.setGuardianRelation1(row.get("GuardianRelationship").toString());
			etForm.setTitle2(row.get("SecondHolderTitle").toString());
			etForm.setName2(row.get("SecondHolderName").toString());
			etForm.setPanNo2(row.get("SecondHolderPAN").toString());
			etForm.setTitle3(row.get("ThirdHolderTitle").toString());
			etForm.setName3(row.get("ThirdHolderName").toString());
			etForm.setPanNo3(row.get("ThirdHolderPAN").toString());
			etForm.setApplicationStatus1(row.get("InvestorStatusID").toString());
			etForm.setModeOfHolding1(row.get("ModeOfHoldingID").toString());
			etForm.setOccupation1(row.get("OccupationID").toString());
			etForm.setProductId(row.get("ProductId").toString());
			etForm.setSchemeName(row.get("SchemeName").toString());
			etForm.setSchemeOption(row.get("SchemeOption").toString());
			etForm.setInvestmentAmount(row.get("InvestmentAmount").toString());
			etForm.setNomineeName1(row.get("Nominee1Name").toString());
			etForm.setNomineeAddress1(row.get("Nominee1Address").toString());
			etForm.setNomineeDob1(row.get("Nominee1DOB").toString());
			etForm.setNomineeRelation1(row.get("Nominee1Relationship").toString());
			etForm.setNomineeAllocationPercent1(row.get("Nominee1Allocation").toString());
			etForm.setNomineeGuardianName1(row.get("Nominee1GuardianName").toString());
			etForm.setNomineeGuardianAddress1(row.get("Nominee1GuardianAddress").toString());
			etForm.setNomineeName2(row.get("Nominee2Name").toString());
			etForm.setNomineeAddress2(row.get("Nominee2Address").toString());
			etForm.setNomineeDob2(row.get("Nominee2DOB").toString());
			etForm.setNomineeRelation2(row.get("Nominee2Relationship").toString());
			etForm.setNomineeAllocationPercent2(row.get("Nominee2Allocation").toString());
			etForm.setNomineeGuardianName2(row.get("Nominee2GuardianName").toString());
			etForm.setNomineeGuardianAddress2(row.get("Nominee2GuardianAddress").toString());
			etForm.setNomineeName3(row.get("Nominee3Name").toString());
			etForm.setNomineeAddress3(row.get("Nominee3Address").toString());
			etForm.setNomineeDob3(row.get("Nominee3DOB").toString());
			etForm.setNomineeRelation3(row.get("Nominee3Relationship").toString());
			etForm.setNomineeAllocationPercent3(row.get("Nominee3Allocation").toString());
			etForm.setNomineeGuardianName3(row.get("Nominee3GuardianName").toString());
			etForm.setNomineeGuardianAddress3(row.get("Nominee3GuardianAddress").toString());
		
			etForm.setBankAddress(row.get("BankBranchAddress").toString());
			etForm.setBankState(row.get("BankBranchState").toString());
			etForm.setBankCity(row.get("BankBranchCity").toString());
			etForm.setAddress1(row.get("Address").toString());
			etForm.setState1(row.get("State").toString());
			etForm.setCity1(row.get("City").toString());
			etForm.setCountry1(row.get("Country").toString());
			etForm.setZipCode1(row.get("PostalCode").toString());
			
			etForm.setInvestmentTypeId(row.get("InvestmentTypeId").toString());
			etForm.setTransactionTypeId(row.get("TransactionTypeId").toString());*/
		 }
		
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<String> folioNos=new ArrayList<String>();
		for(Map<String, Object> row:l){
			
			folioNos.add(row.get("FolioNo").toString());
		}
		
     /* l=(List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		Map<String,String> products=new HashMap<String,String>();
		for(Map<String, Object> row:l){
			
			products.put(row.get("ProductID").toString(),row.get("ProductName").toString());
		}
		etForm.setProducts(products);*/
		
		etForm.setFolioNos(folioNos);
		return etForm;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ETPrePrintedFormData> loadAvailablePrePrintedForms(int buId,
			int clientPartyId, String ownerPartyId) {
				
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getAvailablePrePrintedFormsClients");
		SqlParameter clientPartyIdParam = new SqlParameter("clientPartyId", Types.INTEGER);
		SqlParameter ownerPartyIdParam = new SqlParameter("ownerPartyId", Types.VARCHAR);
		SqlParameter[] paramArray = {clientPartyIdParam,ownerPartyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("clientPartyId",clientPartyId);
		paramValues.put("ownerPartyId",ownerPartyId);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
			ETPrePrintedFormData form=new ETPrePrintedFormData();
			List<ETPrePrintedFormData> formList=new ArrayList<ETPrePrintedFormData>();
		for(Map<String, Object> row:l){
			form=new ETPrePrintedFormData();
			
					form.setFpExecutionId(Integer.parseInt(row.get("ExecutionId").toString()));
					form.setProductId(row.get("Product").toString());
					form.setFormName(row.get("FormName").toString());
					form.setGeneratedOn(row.get("GeneratedOn").toString());
					form.setFormPath(row.get("FormPath").toString());
					form.setDocId(row.get("DocumentId").toString());
					form.setPartyId(Integer.parseInt(row.get("PartyID").toString()));
					formList.add(form);						
				}
		
		return formList;
	}
	
	@Override @SuppressWarnings("unchecked")
	public List<AssetAllocatedToGoal> assetAutoAllocation(int partnerId,
			int nodeId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getAutoAllocationAssetList");
		SqlParameter partnerIdParam = new SqlParameter("partnerId", Types.INTEGER);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		SqlParameter[] paramArray = {partnerIdParam,nodeIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("partnerId",partnerId);
		paramValues.put("nodeId",nodeId);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		AssetAllocatedToGoal form=new AssetAllocatedToGoal();
			List<AssetAllocatedToGoal> formList=new ArrayList<AssetAllocatedToGoal>();
		for(Map<String, Object> row:l){
			form=new AssetAllocatedToGoal();
			   if(row.get("assetName")!=null && !(row.get("assetName").equals(""))){
					form.setAssetName(row.get("assetName").toString());
			   }
			   if(row.get("goalName")!=null && !(row.get("goalName").equals(""))){
					form.setGoalName(row.get("goalName").toString());
			   }
			   if(row.get("clientName")!=null && !(row.get("clientName").equals(""))){
					form.setClientName(row.get("clientName").toString());
			   }
			   if(row.get("assetAmountToGoal")!=null && !(row.get("assetAmountToGoal").equals(""))){
					form.setAssetAmountToGoal(row.get("assetAmountToGoal").toString());
			   }
			   if(row.get("assetPercentToGoal")!=null && !(row.get("assetPercentToGoal").equals(""))){
					form.setAssetPercentToGoal(row.get("assetPercentToGoal").toString());
			   }
			   if(row.get("isAutoAllocated")!=null && !(row.get("isAutoAllocated").equals(""))){
					form.setIsAutoAllocated(row.get("isAutoAllocated").toString());
			   }
			   if(row.get("goalAssetId")!=null && !(row.get("goalAssetId").equals(""))){
					form.setGoalAssetId(row.get("goalAssetId").toString());
			   }
			   if(row.get("isReviewed")!=null && !(row.get("isReviewed").equals(""))){
					form.setIsReviewed(row.get("isReviewed").toString());
			   }
			   if(row.get("codeValue")!=null && !(row.get("codeValue").equals(""))){
					form.setUserId(row.get("codeValue").toString());
			   }
					formList.add(form);						
				}
		
		return formList;
	}
		
	public void deleteAsset(String goalAssetId,int buId){
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_deleteAutoAllocatedAsset");
		SqlParameter goalAssetIdParam = new SqlParameter("goalAssetId", Types.VARCHAR);
		SqlParameter[] paramArray = {goalAssetIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();

		paramValues.put("goalAssetId", goalAssetId);
		@SuppressWarnings("unused")
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
	}
	@Override
	public void confirmAsset(String goalAssetId, int buId, String userId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_ConfirmAutoAllocatedAsset‏");
		SqlParameter goalAssetIdParam = new SqlParameter("goalAssetId", Types.VARCHAR);
		SqlParameter userIdParam = new SqlParameter("userId", Types.VARCHAR);
		SqlParameter[] paramArray = {goalAssetIdParam,userIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();

		paramValues.put("goalAssetId", goalAssetId);
		paramValues.put("userId", userId);
		@SuppressWarnings("unused")
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
	}
	
	
	@Override @SuppressWarnings("unchecked")
	public AssetAllocatedToGoal assetAutoAllocationDetailsWhileEdit(String goalAssetId, int buId) {
		
		AssetAllocatedToGoal form=new AssetAllocatedToGoal();
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getAutoAllocatedAssetDetails‏");
		
		SqlParameter goalAssetIdParam = new SqlParameter("goalAssetId", Types.INTEGER);
		SqlParameter[] paramgoalAssetId = {goalAssetIdParam};
		myStoredProcedure.setParameters(paramgoalAssetId);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("goalAssetId",goalAssetId);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		List<Map<String,Object>> l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		for(Map<String, Object> row:l){
			
			form=new AssetAllocatedToGoal();
			   if(row.get("allocatedAmountCurrent")!=null && !(row.get("allocatedAmountCurrent").equals(""))){
					form.setCurrentValue(row.get("allocatedAmountCurrent").toString());
			   }
			   if(row.get("goalName")!=null && !(row.get("goalName").equals(""))){
					form.setGoalName(row.get("goalName").toString());
			   }
			   if(row.get("assetName")!=null && !(row.get("assetName").equals(""))){
					form.setAssetName(row.get("assetName").toString());
			   }
			   if(row.get("goalId")!=null && !(row.get("goalId").equals(""))){
					form.setGoalId(row.get("goalId").toString());
			   }
			   if(row.get("partyAssetId")!=null && !(row.get("partyAssetId").equals(""))){
					form.setPartyAssetId(row.get("partyAssetId").toString());
			   }
			   if(row.get("availableValue")!=null && !(row.get("availableValue").equals(""))){
					form.setAvailableValue(row.get("availableValue").toString());
			   }
			   if(row.get("maturingAmount")!=null && !(row.get("maturingAmount").equals(""))){
					form.setMaturingAmount(row.get("maturingAmount").toString());
			   }
			   if(row.get("partyId")!=null && !(row.get("partyId").equals(""))){
					form.setPartyId(row.get("partyId").toString());
			   }
			   
			
		 }
		return form;
		
		
	
	}
	
}
