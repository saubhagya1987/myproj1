package in.fiinfra.common.dao;

import in.fiinfra.common.admin.AddChat;
import in.fiinfra.common.admin.ChatData;
import in.fiinfra.common.admin.ChatterData;
import in.fiinfra.common.admin.CommentData;
import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.BroadCastData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.ContactUsData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentValueData;
import in.fiinfra.common.common.FaqsQuestionsData;
import in.fiinfra.common.common.PartyData;
import in.fiinfra.common.common.QueryCommentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.common.QueryRequest;
import in.fiinfra.common.common.RecommandedProdForGoal;
import in.fiinfra.common.common.SearchResultData;
import in.fiinfra.common.common.XStreamTranslator;
import in.fiinfra.common.opportunity.OpportunityStageData;
import in.fiinfra.common.partner.NotesData;
import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.common.util.BaseResponse;
//import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.core.Response;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Component;
@Component
public class CommonDaoImpl implements CommonDao{
	private static final Logger logger = Logger.getLogger(CommonDaoImpl.class);
	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	Response response=null;
	private static final String SP_RETRIVE_CODE_VALUES_FROM_CODE_TYPE = "{CALL usp_DIY_getCodeValues(?)}";
	private static final String SP_RETRIVE_CODE_VALUES_FOR_PARENT_ID = "{CALL usp_DIY_getCodeValuesForParentId(?)}";
	private static final String SP_RETRIVE_COUNTRY_CODE_VALUES = "{CALL usp_DIY_getCountryCodeValues(?)}";
	private static final String SP_GET_CODEVALUEID_FOR_CODEVALUE ="{CALL usp_DIY_getCodeValues_for_CodeValue(?,?)}";
	private static final String SP_RETRIVE_NON_ACCESSIBLE_CONTROLIDS ="{CALL usp_cp_getNonAccessibleControlIds(?)}";
	
	Response r1=null;
	@SuppressWarnings("unchecked")
	
	@Override
	public List<SearchResultData> getSearchList(int partyId, int buId,String searchText) {
		// TODO Auto-generated method stub
		List<SearchResultData> searchResultDatas=new ArrayList<SearchResultData>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_searchObjectsByParty");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter searchValueParam = new SqlParameter("searchStr", Types.VARCHAR);
		
		SqlParameter[] paramArray = { partyIdParam,searchValueParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("searchStr", searchText);
	
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		//personal details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		if (l != null) {
			
			SearchResultData searchResultData = null;
			for (Map<String, Object> row : l) {
				searchResultData=new SearchResultData();
				searchResultData.setType((String) row.get("type"));
				searchResultData.setName((String) row.get("name"));				
				searchResultData.setDetails((String) row.get("details"));
				searchResultData.setId((Integer) row.get("id"));
			
				searchResultDatas.add(searchResultData);
			}
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return searchResultDatas;
	}
	
	
	@Override
	public List<CodeValueData> getQueryPicklistValues(String codeTypeIds,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<CodeValueData> codeValueDataList=new ArrayList<CodeValueData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		//JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getCodeValuesByCodeTypeId");
		SqlParameter codeTypeIdsParam = new SqlParameter("codeTypeIds", Types.VARCHAR);
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
//		SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = {codeTypeIdsParam,buIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		logger.debug("codeTypeIds:--"+codeTypeIds);
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("codeTypeIds",codeTypeIds);
		paranValues.put("buId", buId);
		logger.debug("paranValues:--"+paranValues);
		logger.info("-----------Before Calling SP In APP(getQueryPicklistValues)-----------");
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("-----------After Calling SP In APP(getQueryPicklistValues)-----------");
		logger.debug("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		CodeValueData codeValueData=null;
		logger.info("-----------Before Mapping In APP(getQueryPicklistValues)-----------");
		for(Map<String, Object> row:l){
			codeValueData=new CodeValueData();
			codeValueData.setCodeTypeId((Integer)row.get("CodeTypeId"));
			codeValueData.setCodeValue((String)row.get("CodeValue"));
			codeValueData.setCodeValueId((Integer)row.get("CodeValueID"));
			codeValueData.setMappedValue1((String) row.get("mapped_value1"));
			codeValueDataList.add(codeValueData);
		}
		logger.info("-----------After Mapping In APP(getQueryPicklistValues)-----------");
		return codeValueDataList;
	}
	/*public BasicDataSource getDataSource() {
		return dataSource;
	}
	public void setDataSource(BasicDataSource dataSource) {
		this.dataSource = dataSource;
	}*/
	@Override
	public List<CodeValueData> getContatcDetails(int roleId,int loggedInUserPartyId,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		// TODO Auto-generated method stub
		List<CodeValueData> codeValueDataList=new ArrayList<CodeValueData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_test_getContactTypes");
		logger.debug("in ChatterDao Implementation recordType========================"+roleId);
		logger.debug("in ChatterDao Implementation loggedInUserPartyId==============="+loggedInUserPartyId);
		SqlParameter roleIdParam = new SqlParameter("roleId", Types.INTEGER);
	
		
		
		SqlParameter[] paramArray = {roleIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("roleId",roleId);
		
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		CodeValueData codeValueData=null;
		for(Map<String, Object> row:l){
			codeValueData=new CodeValueData();
			codeValueData.setCodeValueId((Integer)row.get("CodeValueID"));
			codeValueData.setCodeValue((String)row.get("CodeValue"));
			
			codeValueDataList.add(codeValueData);
		}
		logger.debug("codeValueDataList================="+codeValueDataList);
		return codeValueDataList;
		
	}
	@Override
	public List<UserData> getUserList(int recordType,int loggedInUserPartyId,int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<UserData> userList=new ArrayList<UserData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		ChatterData chatterData = new ChatterData();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getUserListByOwnerPartyId");
		SqlParameter recordTypeParam = new SqlParameter("recordType", Types.INTEGER);
		SqlParameter userPartyIdParam = new SqlParameter("loggedInUserPartyId", Types.INTEGER);
		SqlParameter userbuIdParam = new SqlParameter("buId", Types.INTEGER);
		SqlParameter[] paramArray = {recordTypeParam,userPartyIdParam,userbuIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("recordType",recordType);
		paranValues.put("loggedInUserPartyId",loggedInUserPartyId);
		paranValues.put("buId",buId);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		UserData userData=null;
		for(Map<String, Object> row:l){
			userData=new UserData();
			userData.setName((String)row.get("name"));
			userData.setPartyId((Integer)row.get("partyid"));
			
			userList.add(userData);
		}
		return userList;
	}
	
	
	@Override
	public List<Object> getChatAndComments(int loggedInUserPartyId,int startValue,int buId,int nodeId) 
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Object> allDataList=new ArrayList<Object>();
		try{
		List<ChatData> chatterList=new ArrayList<ChatData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		
		String xmlString;
		xmlString ="<Root>";
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_GetRecentChatterFeedsForParttner");
		SqlParameter userPartyIdParam = new SqlParameter("loggedInUserPartyId", Types.INTEGER);
		SqlParameter startValueParam = new SqlParameter("startValue", Types.INTEGER);
		SqlParameter endValueParam = new SqlParameter("endValue", Types.INTEGER);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		SqlParameter[] paramArray = {userPartyIdParam,startValueParam,endValueParam,nodeIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("loggedInUserPartyId",loggedInUserPartyId);
		paranValues.put("startValue",startValue);
		paranValues.put("endValue",10);
		paranValues.put("nodeId", nodeId);
		
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		ChatData chatterData=null;
		for(Map<String, Object> row:l){
			chatterData=new ChatData();
			chatterData.setRecordTypeID((Integer)row.get("RecordTypeID"));
			chatterData.setChatid((Integer)row.get("chatId"));
			xmlString +="<Chat><chatId>"+row.get("chatId")+"</chatId></Chat>";
			chatterData.setType((String)row.get("type"));
			chatterData.setChatType((String)row.get("chatType"));
			chatterData.setChatText((String)row.get("ChatText"));
			chatterData.setChatURL((String)row.get("ChatURL"));
			chatterData.setChatOnRelatedPartyId((Integer)row.get("ChatOnRelatedPartyID"));
			chatterData.setCommentCount((int) row.get("ChatCount"));
			chatterData.setPartyId((Integer)row.get("PartyId"));
			chatterData.setPostedBy((String)row.get("postedBy"));
			chatterData.setPostedFor((String)row.get("PostedFor"));
			chatterData.setPostedToUserType((String)row.get("Posted_To_UserType"));
			
			chatterData.setCreatedDate((String)row.get("CreatedDate"));
//			logger.debug("created Date===================="+(String)row.get("CreatedDate"));
			chatterData.setContentFileName1((String)row.get("ContentFileName1"));
			chatterData.setContentFileName2((String)row.get("ContentFileName2"));
			chatterData.setContentFileName3((String)row.get("ContentFileName3"));
			chatterData.setFilePath1((String)row.get("FilePath1"));
			chatterData.setFilePath2((String)row.get("FilePath2"));
			chatterData.setFilePath3((String)row.get("FilePath3"));
			
			chatterData.setAttachment1DocumentId((Integer)row.get("attachment1DocumentId"));
			chatterData.setAttachment2DocumentId((Integer)row.get("attachment2DocumentId"));
			chatterData.setAttachment3DocumentId((Integer)row.get("attachment3DocumentId"));

			chatterData.setUserphotoFileName((String)row.get("userphotoFileName"));
			chatterList.add(chatterData);
		}
		
		xmlString +="</Root>";
		
		logger.debug("xmlString================="+xmlString);
		
		CommonStoredProcedure myStoredProcedure1 = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getRecentChatterFeedsForFeedItems");
		SqlParameter chatIdXmlParam = new SqlParameter("xmlString", Types.VARCHAR);
		
		SqlParameter[] paramArray1 = {chatIdXmlParam};
		myStoredProcedure1.setParameters(paramArray1);
		myStoredProcedure1.compile();
		Map<String, Object> paranValues1 = new HashMap<String, Object>();
		paranValues1.put("xmlString",xmlString);
	
		Map<String, Object> storedProcResult1 = myStoredProcedure1
				.execute(paranValues1);
		l=(List<Map<String, Object>>) storedProcResult1.get("#result-set-1");
		CommentData commentData=null;
		List<CommentData> commentList=new ArrayList<CommentData>();
		for(Map<String, Object> row:l){
			commentData=new CommentData();
			commentData.setCommentChatId((Integer)row.get("ChatId"));
			commentData.setChatText((String)row.get("ChatText"));
			commentData.setChatURL((String)row.get("ChatURL"));
			//commentData.setAttchment((Boolean)row.get("IsAttachment"));
			commentData.setParentChatID((Integer)row.get("parentChatId"));
//			logger.debug("parent Chat Id========================="+row.get("parentChatId"));
			commentData.setCreatedBy((String)row.get("CreateddBy"));
			commentData.setName((String)row.get("name"));
			commentData.setPartyId((Integer)row.get("pid"));
			commentData.setCreatedDate((String)row.get("CreatedDate"));
			commentData.setUserphotoFileName((String)row.get("userphotoFileName"));
			commentData.setContentFileName1((String)row.get("ContentFileName1"));
			commentData.setContentFileName2((String)row.get("ContentFileName2"));
			commentData.setContentFileName3((String)row.get("ContentFileName3"));
			
			commentData.setAttachment1DocumentId((Integer)row.get("attachment1DocumentId"));
			commentData.setAttachment2DocumentId((Integer)row.get("attachment2DocumentId"));
			commentData.setAttachment3DocumentId((Integer)row.get("attachment3DocumentId"));
			
			commentData.setFilePath1((String)row.get("FilePath1"));
			commentData.setFilePath2((String)row.get("FilePath2"));
			commentData.setFilePath3((String)row.get("FilePath3"));
			commentData.setCommentType((String)row.get("commentType"));
			commentList.add(commentData);
		}
		
//		logger.debug("commentList==========="+commentList);
		allDataList.add(chatterList);
		allDataList.add(commentList);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return allDataList;
	}

	@Override
	public List<DocumentValueData> getDownloadsList(int buId,String sourceSysId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<DocumentValueData> documentValueDataList=new ArrayList<DocumentValueData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getDownloadsList");
		
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
		SqlParameter sourceSysIdParam = new SqlParameter("sourceSysId", Types.INTEGER);
//		SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = {buIdParam,sourceSysIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();

		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("buId", buId);
		paramValues.put("sourceSysId", sourceSysId);
		
		logger.debug("ParameterValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		DocumentValueData documentValueData =null;
		
	//	CodeValueData codeValueData=null;
		for(Map<String, Object> row:l){
		
			documentValueData=new DocumentValueData();
			documentValueData.setDocumentID((Integer)row.get("DocumentId"));
			documentValueData.setDocumentName((String)row.get("DocumentName"));
			documentValueData.setDocumentText((String)row.get("documentText"));
			documentValueData.setDownloadDescription((String)row.get("downloadDescription"));
			documentValueData.setDownloadModuleID((Integer)row.get("DownloadModuleId"));
			documentValueData.setDownloadModuleName((String)row.get("DownloadModuleName"));
			documentValueData.setIsShareEmail((boolean)row.get("IsShareEmail"));
			documentValueData.setIsShareDownload((boolean)row.get("IsShareDownload"));
			documentValueData.setIsShareView((boolean)row.get("IsShareView"));
			//CodeValueName
			logger.debug("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+documentValueDataList);
			documentValueDataList.add(documentValueData);
			
		}
		return documentValueDataList;
	}

	@Override
	public List<FaqsQuestionsData> getFaqsQuestionsList(int buId, int sourceSystemId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<FaqsQuestionsData> faqsQuestionsDataList=new ArrayList<FaqsQuestionsData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "[usp_cp_getFaqsList]");
		
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
//		SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = {buIdParam,new SqlParameter("sourceSystemId", Types.INTEGER)};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();

		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("buId", buId);
		paramValues.put("sourceSystemId", sourceSystemId);
		logger.debug("ParameterValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		FaqsQuestionsData faqsQuestions =null;
		
	//	CodeValueData codeValueData=null;
		for(Map<String, Object> row:l){
		
			faqsQuestions=new FaqsQuestionsData();
			faqsQuestions.setFaqID((Integer)row.get("FaqId"));
			faqsQuestions.setFaqModuleID((Integer)row.get("FaqModuleId"));
			faqsQuestions.setFaqQuestion((String)row.get("FaqQuestion"));
			faqsQuestions.setFaqAnswer((String)row.get("FaqAnswer"));
			faqsQuestions.setBuPartyId((Integer)row.get("BuPartyId"));
			faqsQuestions.setFaqQuestionModuleName((String)row.get("FaqQuestionModuleName"));
			
			// CodeValueDesccription		
			logger.debug("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+faqsQuestionsDataList);
			faqsQuestionsDataList.add(faqsQuestions);
			
		}
		return faqsQuestionsDataList;
	}
	
	
	@Override
	public List<BroadCastData> getBroadCastList(int buId,int sourceSystemId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<BroadCastData> broadCastDatas=new ArrayList<BroadCastData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "[usp_cp_getBroadcastList]");
		
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
		SqlParameter[] paramArray = {buIdParam,new SqlParameter("sourceSystemId", Types.INTEGER)};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();

		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("buId", buId);
		paramValues.put("sourceSystemId", sourceSystemId);
		logger.debug("ParameterValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		BroadCastData broadcastMsgs =null;
		
	//	CodeValueData codeValueData=null;
		for(Map<String, Object> row:l){
		
			broadcastMsgs=new BroadCastData();
			broadcastMsgs.setBroadCastId((Integer)row.get("ID"));			
			broadcastMsgs.setBroadCastTitle((String)row.get("Title"));
			broadcastMsgs.setBroadCastDescription((String)row.get("Description"));
			broadcastMsgs.setBuPartyId((Integer)row.get("BU"));
			
			// CodeValueDesccription		
			logger.debug("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+broadCastDatas);
			broadCastDatas.add(broadcastMsgs);
			
		}
		return broadCastDatas;
	}
	
	
	
	@Override
	public List<ContactUsData> getContactUsRecord(int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<ContactUsData> contactUsData=new ArrayList<ContactUsData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "[usp_cp_getContactUsDetails]");
		
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
//		SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = {buIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();

		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("buId", buId);
		logger.debug("ParameterValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		ContactUsData contactData =null;
		
	//	CodeValueData codeValueData=null;
		for(Map<String, Object> row:l){
		
			contactData=new ContactUsData();
			contactData.setCallUs((String)row.get("CallUs"));
			contactData.setWriteUs((String)row.get("WriteUs"));
			contactData.setBUName((String)row.get("BUName"));
			contactData.setBUAddr((String)row.get("BUAddr"));
			contactData.setBUAddr2((String)row.get("BUAddr2"));
			contactData.setBUAddr3((String)row.get("BUAddr3"));
			contactData.setBUCity((String)row.get("BUCity"));
			contactData.setBUState((String)row.get("BUState"));
			contactData.setBUCountry((String)row.get("BUCountry"));
			contactData.setBUPostalCode((String)row.get("BUPostalCode"));
			contactData.setTwitter((String)row.get("twitter"));
			
			
			logger.debug("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+contactData);
			contactUsData.add(contactData);
			
		}
		return contactUsData;
	}
	
	
	@Override
	public QueryData saveQuery(QueryData queryData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(queryData.getBuId()));
		List<DocumentData> documentDatas = queryData.getDocumentDatas();
		String documentXML = FiinfraUtility.getDocumentXML(documentDatas);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveQuery");
		SqlParameter queryIdParam = new SqlParameter("queryId", Types.INTEGER);
		SqlParameter queryTypeParam = new SqlParameter("queryType",
				Types.INTEGER);
		SqlParameter queryOwnerParam = new SqlParameter("queryOwner",
				Types.INTEGER);
		SqlParameter contactTypeParam = new SqlParameter("contactType",
				Types.INTEGER);
		SqlParameter contactIdParam = new SqlParameter("contactId",
				Types.INTEGER);
		SqlParameter querySubjectParam = new SqlParameter("querySubject",
				Types.VARCHAR);
		SqlParameter queryNotesParam = new SqlParameter("queryNotes",
				Types.VARCHAR);
		SqlParameter isAttachmentParam = new SqlParameter("isAttachment",
				Types.BOOLEAN);
		SqlParameter attachmentCountParam = new SqlParameter("attachmentCount",
				Types.INTEGER);
		// SqlParameter attachment1DocIdParam = new
		// SqlParameter("attachment1DocId", Types.INTEGER);
		// SqlParameter attachment2DocIdParam = new
		// SqlParameter("attachment2DocId", Types.INTEGER);
		// SqlParameter attachment3DocIdParam = new
		// SqlParameter("attachment3DocId", Types.INTEGER);
		SqlParameter updatedByParam = new SqlParameter("updatedBy",
				Types.INTEGER);
		SqlParameter queryToParam = new SqlParameter("queryTo", Types.INTEGER);
		SqlParameter documentXMLParam = new SqlParameter("documentXML",
				Types.VARCHAR);
		SqlOutParameter queryIdDbParam = new SqlOutParameter("queryIdDb",
				Types.INTEGER);
		SqlOutParameter basePathDbParam = new SqlOutParameter("basePath",
				Types.VARCHAR);

		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { queryIdParam, queryTypeParam,
				queryOwnerParam, contactTypeParam, contactIdParam,
				querySubjectParam, queryNotesParam, isAttachmentParam,
				attachmentCountParam, updatedByParam, queryToParam,
				documentXMLParam, queryIdDbParam, basePathDbParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("queryId", queryData.getQueryId());
		paranValues.put("queryType", queryData.getQueryType());
		paranValues.put("queryOwner", queryData.getQueryOwner());
		paranValues.put("contactType", queryData.getContactType());
		paranValues.put("contactId", queryData.getContactId());
		paranValues.put("querySubject", queryData.getSubject());
		paranValues.put("queryNotes", queryData.getNotes());
		paranValues.put("isAttachment", queryData.isAttachment());
		paranValues.put("attachmentCount", queryData.getAttachmentCount());
		// paranValues.put("attachment1DocId",queryData.getAttachment1DocId());
		// paranValues.put("attachment2DocId",queryData.getAttachment2DocId());
		// paranValues.put("attachment3DocId",queryData.getAttachment3DocId());
		paranValues.put("updatedBy", queryData.getCreatedBy());
		paranValues.put("queryTo", queryData.getQueryTo());
		paranValues.put("documentXML", documentXML);
		// paranValues.put("queryIdDb", queryData);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		queryData.setQueryId((Integer) storedProcResult.get("queryIdDb"));
		queryData.setBasePath((String) storedProcResult.get("basePath"));
		return queryData;
	}

	@Override
	public String deleteQuery(String queryIds,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_deleteQueries");
		SqlParameter queryIdsParam = new SqlParameter("queryIds", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { queryIdsParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("queryIds", queryIds);
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
	public String getAttachmentForRequestQ(String docId, String partyId, String reportTypeId){
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_documentInRequestQ");
		SqlParameter documentTypeIdParam = new SqlParameter("documentTypeId", Types.VARCHAR);
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { documentTypeIdParam,partyIdParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("documentTypeId", reportTypeId);
		paranValues.put("partyId", partyId);
		logger.info("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		logger.info("recordCount:---" + recordCount);
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}

	
	@Override
	public List<QueryData> getQueryList(int partyId, int buId,String queryPanel,String querySearchValue,int nodeId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<QueryData> queryDatas = new ArrayList<QueryData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getQueryList");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter queryPanelParam = new SqlParameter("queryPanel", Types.VARCHAR);
		SqlParameter querySearchValueParam = new SqlParameter("querySearchValue", Types.VARCHAR);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam ,queryPanelParam,querySearchValueParam,nodeIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("queryPanel", queryPanel);
		paranValues.put("querySearchValue", querySearchValue);
		paranValues.put("nodeId", nodeId);
		
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.debug("l:--" + l);
		QueryData queryData = null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				queryData = new QueryData();
				queryData.setQueryId((Integer) row.get("QueryId"));
				queryData.setSubject((String) row.get("QuerySubject"));
				queryData.setQueryOwnerName((String) row.get("QueryOwner"));
				queryData.setQueryTypeName((String) row.get("QueryType"));
				queryData.setLastUpdatedDate((String) row.get("LastUpdatedDate"));
				queryData.setLastUpdatedByName((String) row.get("LastUpdatedBy"));
				queryData.setStatus((String) row.get("QueryStatus"));
				queryData.setIsReadByParty((boolean) row.get("IsReadByParty"));
				queryData.setContactType((int) row.get("ContactType"));;
				queryData.setQueryFor((String) row.get("QueryFor"));
				queryData.setQueryFromRecordType((int) row.get("queryFromRecordType"));
				queryData.setUnreadCount((int) row.get("msgCount"));
				queryDatas.add(queryData);
			}
		}
		return queryDatas;
	}
	
	@Override
	public List<QueryData> getQueries(int buId, QueryRequest queryRequest) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<QueryData> queryDatas = new ArrayList<QueryData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getQueries");

		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { new SqlParameter("partyId", Types.INTEGER) ,
				new SqlParameter("queryPanel", Types.VARCHAR),
				new SqlParameter("querySearchValue", Types.VARCHAR),
				new SqlParameter("querySubject", Types.VARCHAR) ,
				new SqlParameter("queryType", Types.INTEGER) ,
				new SqlParameter("queryTo", Types.INTEGER) ,
				new SqlParameter("queryFor", Types.INTEGER),
				new SqlParameter("nodeId", Types.INTEGER)
		};
		
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", queryRequest.getPartyId());
		paranValues.put("queryPanel", queryRequest.getQueryPanel());
		paranValues.put("querySearchValue", StringUtils.trim(queryRequest.getSearchValue()));
		paranValues.put("querySubject", StringUtils.trim(queryRequest.getSubject()));
		paranValues.put("queryType", queryRequest.getQueryType()>0?queryRequest.getQueryType():0);
		paranValues.put("queryTo", queryRequest.getQueryTo()>0?queryRequest.getQueryTo():0);
		paranValues.put("queryFor", queryRequest.getQueryFor()>0?queryRequest.getQueryFor():0);
		paranValues.put("nodeId", queryRequest.getNodeId()>0?queryRequest.getNodeId():0);
		
		logger.debug("paranValues:--" + paranValues);

		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.debug("l:--" + l);
		QueryData queryData = null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				queryData = new QueryData();
				queryData.setQueryId((Integer) row.get("QueryId"));
				queryData.setQueryTo((Integer) row.get("QueryTo"));
				queryData.setCreatedBy((Integer) row.get("CreatedBy"));
				queryData.setSubject((String) row.get("QuerySubject"));
				queryData.setQueryOwnerName((String) row.get("QueryOwner"));
				queryData.setQueryTypeName((String) row.get("QueryType"));
				queryData.setLastUpdatedDate((String) row.get("LastUpdatedDate"));
				queryData.setLastUpdatedByName((String) row.get("LastUpdatedBy"));
				queryData.setStatus((String) row.get("QueryStatus"));
				queryData.setIsReadByParty((boolean) row.get("IsReadByParty"));
				queryData.setContactType((int) row.get("ContactType"));;
				queryData.setQueryFor((String) row.get("QueryFor"));
				queryData.setQueryFromRecordType((int) row.get("queryFromRecordType"));
				queryData.setUnreadCount((int) row.get("msgCount"));
				queryDatas.add(queryData);
			}
		}
		return queryDatas;
	}
	
	@Override
	public List<Integer> getUnreadQueryCountWithSearch(int buId, QueryRequest queryRequest) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Integer> unreadQueryCount = new ArrayList<Integer>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getUnreadQueryCountWithSearch");
		
		SqlParameter[] paramArray = { new SqlParameter("partyId", Types.INTEGER) ,
				new SqlParameter("querySubject", Types.VARCHAR) ,
				new SqlParameter("queryType", Types.INTEGER) ,
				new SqlParameter("queryTo", Types.INTEGER) ,
				new SqlParameter("queryFor", Types.INTEGER),
				new SqlOutParameter("unreadQueryInboxCount", Types.INTEGER),
				new SqlOutParameter("unreadQuerySentboxCount", Types.INTEGER)
		};
		

		
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		
		paranValues.put("partyId", queryRequest.getPartyId());
		paranValues.put("querySubject", StringUtils.trim(queryRequest.getSubject()));
		paranValues.put("queryType", queryRequest.getQueryType()>0?queryRequest.getQueryType():0);
		paranValues.put("queryTo", queryRequest.getQueryTo()>0?queryRequest.getQueryTo():0);
		paranValues.put("queryFor", queryRequest.getQueryFor()>0?queryRequest.getQueryFor():0);

		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		unreadQueryCount.add(Integer.parseInt(storedProcResult.get("unreadQueryInboxCount").toString()));
		unreadQueryCount.add(Integer.parseInt(storedProcResult.get("unreadQuerySentboxCount").toString()));
		return unreadQueryCount;
	}
	
	@Override
	public List<QueryData> getQueriesForClient(int buId, QueryRequest queryRequest) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<QueryData> queryDatas = new ArrayList<QueryData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getQueriesForClient");

		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { new SqlParameter("partyId", Types.INTEGER) 
		};
		
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", queryRequest.getPartyId());
		
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.debug("l:--" + l);
		QueryData queryData = null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				queryData = new QueryData();
				queryData.setQueryId((Integer) row.get("QueryId"));
				queryData.setSubject((String) row.get("QuerySubject"));
				queryData.setQueryOwnerName((String) row.get("QueryOwner"));
				queryData.setQueryTypeName((String) row.get("QueryType"));
				queryData.setLastUpdatedDate((String) row.get("LastUpdatedDate"));
				queryData.setLastUpdatedByName((String) row.get("LastUpdatedBy"));
				queryData.setStatus((String) row.get("QueryStatus"));
				queryData.setIsReadByParty((boolean) row.get("IsReadByParty"));
				queryData.setContactType((int) row.get("ContactType"));;
				queryData.setQueryFor((String) row.get("QueryFor"));
				queryData.setQueryFromRecordType((int) row.get("queryFromRecordType"));
				queryData.setUnreadCount((int) row.get("msgCount"));
				queryDatas.add(queryData);
			}
		}
		return queryDatas;
	}
	

	
	@Override
	public List<Integer> getUnreadQueryCount(int partyId, int buId, String queryPanel,String searchValue,int nodeId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Integer> unreadQueryCount = new ArrayList<Integer>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getUnreadQueryCount");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter queryPanelParam = new SqlParameter("queryPanel", Types.VARCHAR);
		SqlOutParameter unreadQueryCountInboxParam = new SqlOutParameter("unreadQueryInboxCount", Types.INTEGER);
		SqlOutParameter unreadQueryCountSentParam = new SqlOutParameter("unreadQuerySentboxCount", Types.INTEGER);
		SqlParameter searchValueParam = new SqlParameter("searchValue", Types.VARCHAR);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		
		SqlParameter[] paramArray = { partyIdParam,queryPanelParam,unreadQueryCountInboxParam,unreadQueryCountSentParam,searchValueParam,nodeIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("queryPanel", queryPanel);
		paranValues.put("searchValue", searchValue);
		paranValues.put("nodeId", nodeId);
		
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		unreadQueryCount.add(Integer.parseInt(storedProcResult.get("unreadQueryInboxCount").toString()));
		unreadQueryCount.add(Integer.parseInt(storedProcResult.get("unreadQuerySentboxCount").toString()));
		logger.debug("storedProcResult:---" + storedProcResult);
		return unreadQueryCount;
	}
	@Override
	public QueryData getQueryDetails(int queryId,int partyId,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		QueryData queryData=new QueryData();
		List<QueryCommentData> queryCommentDatas=new ArrayList<QueryCommentData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getQueryDetails");
		SqlParameter queryIdParam = new SqlParameter("queryId", Types.INTEGER);
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { queryIdParam,partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("queryId", queryId);
		paranValues.put("partyId", partyId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.debug("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				queryData.setSubject((String) row.get("QuerySubject"));
				queryData.setQueryOwnerName((String) row.get("QueryOwner"));
				queryData.setNotes((String) row.get("QueryText"));
				queryData.setLastUpdatedDate((String) row.get("CreatedDate"));
				queryData.setPhotoPath((String) row.get("photo"));
				queryData.setAttachment1DocId((Integer) row.get("Doc1Id"));
				queryData.setAttachment2DocId((Integer) row.get("Doc2Id"));
				queryData.setAttachment3DocId((Integer) row.get("Doc3Id"));
				queryData.setQueryType((Integer) row.get("queryType"));
				queryData.setQueryId((Integer) row.get("queryId"));
				queryData.setDoc1Name((String) row.get("Doc1Name"));
				queryData.setDoc2Name((String) row.get("Doc2Name"));
				queryData.setDoc3Name((String) row.get("Doc3Name"));
				queryData.setStatus(((Integer) row.get("QueryStatus")).toString());
				queryData.setContactType(((Integer) row.get("ContactType")));
				queryData.setContactId(((Integer) row.get("ContactId")));
				queryData.setQueryTo(((Integer) row.get("QueryTo")));
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		logger.debug("l:--" + l);
		QueryCommentData queryCommentData=null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				queryCommentData=new QueryCommentData();
				queryCommentData.setCommentText((String) row.get("CommentText"));
				queryCommentData.setQueryCommentId((int) row.get("QueryCommentID"));
				queryCommentData.setCommentOwner((String) row.get("CommentOwner"));
				queryCommentData.setCreatedDate((String) row.get("CreatedDate"));
				queryCommentData.setPhotoPath((String) row.get("photo"));
				queryCommentData.setDoc1Id((Integer) row.get("Doc1Id"));
				queryCommentData.setDoc2Id((Integer) row.get("Doc2Id"));
				queryCommentData.setDoc3Id((Integer) row.get("Doc3Id"));
				queryCommentData.setDoc1Name((String) row.get("Doc1Name"));
				queryCommentData.setDoc2Name((String) row.get("Doc2Name"));
				queryCommentData.setDoc3Name((String) row.get("Doc3Name"));
				queryCommentDatas.add(queryCommentData);
			}
		}
		queryData.setQueryCommentDatas(queryCommentDatas);
		return queryData;
	}
	@Override
	public DocumentData getDocumentDetails(int docId,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		DocumentData documentData=new DocumentData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getDocumentDetails");
		SqlParameter docIdParam = new SqlParameter("docId", Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { docIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("docId", docId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.debug("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				documentData.setDocumentName((String) row.get("DocumentName"));
				documentData.setFileStoragePathURI((String) row.get("FilePath"));
			}
		}
		return documentData;
	}
	@Override
	public AddChat saveChat(AddChat addchat)
	{
		//System.out.println("recordTypeId="+addchat.getRecordTypeId());
		//System.out.println("chatContactTypeID="+addchat.getChatContentTypeId());
		//System.out.println("addchat.getParentChatId()="+addchat.getParentChatId());
		//System.out.println(" addchat.getXmlStringUserName()="+ addchat.getXmlStringUserName());
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(addchat.getBuId()));
		List<DocumentData> documentDatas = addchat.getDocumentDatas();
		String documentXML = FiinfraUtility.getDocumentXML(documentDatas);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveChat");
		SqlParameter buId = new SqlParameter("buId", Types.INTEGER);
		SqlParameter chatOnRelatedPartyIdParam = new SqlParameter("chatOnRelatedPartyId", Types.INTEGER);
		SqlParameter chatPartyIdParam = new SqlParameter("chatPartyId",
				Types.INTEGER);
		SqlParameter recordTypeIdParam = new SqlParameter("recordTypeId",
				Types.INTEGER);
		SqlParameter chatContactTypeIDParam = new SqlParameter("chatContactTypeID",
				Types.INTEGER);
		SqlParameter feedItemPostParam = new SqlParameter("feedItemPost",
				Types.VARCHAR);
		SqlParameter feedFilePostParam = new SqlParameter("feedFilePost",
				Types.VARCHAR);
		SqlParameter feedLinkPostParam = new SqlParameter("feedLinkPost",
				Types.VARCHAR);
		SqlParameter feedLinkURLParam = new SqlParameter("feedLinkURL",
				Types.VARCHAR);
//		SqlParameter feedLinkNameParam = new SqlParameter("feedLinkName",
//				Types.VARCHAR);
		SqlParameter createdByParam = new SqlParameter("createdBy",
				Types.INTEGER);
		SqlParameter isAttachmentParam = new SqlParameter("isAttachment",
				Types.BOOLEAN);
		SqlParameter attachmentCountParam = new SqlParameter("attachmentCount",
				Types.INTEGER);
		SqlParameter documentXMLParam = new SqlParameter("documentXML",
				Types.VARCHAR);
		SqlParameter chatTypeParam = new SqlParameter("chatType",
				Types.VARCHAR);
		SqlParameter parentChatIdParam = new SqlParameter("parentChatId",
				Types.INTEGER);
		SqlParameter feedItemCommentPostParam = new SqlParameter("feedItemComment",
				Types.VARCHAR);
		SqlParameter feedFileCommentPostParam = new SqlParameter("feedFileComment",
				Types.VARCHAR);
		SqlParameter feedLinkCommentPostParam = new SqlParameter("feedLinkComment",
				Types.VARCHAR);
		SqlParameter feedLinkCommentURLParam = new SqlParameter("feedLinkCommentURL",
				Types.VARCHAR);
		/*new*/
		SqlParameter isTaggingParam = new SqlParameter("isTagging",
				Types.VARCHAR);
		SqlParameter xmlStringUserNameParam = new SqlParameter("xmlStringUserName",
				Types.VARCHAR);
//		
//		SqlOutParameter chatIddbParam = new SqlOutParameter("chatIddb",
//				Types.INTEGER);
		SqlOutParameter basePathDbParam = new SqlOutParameter("basePath",
				Types.VARCHAR);
		
		
		SqlParameter[] paramArray = { buId,chatOnRelatedPartyIdParam, chatPartyIdParam,
				recordTypeIdParam, chatContactTypeIDParam, feedItemPostParam,
				feedFilePostParam, feedLinkPostParam,feedLinkURLParam,createdByParam,isAttachmentParam,
				attachmentCountParam, documentXMLParam,chatTypeParam,parentChatIdParam,feedItemCommentPostParam,
				feedFileCommentPostParam,feedLinkCommentPostParam,feedLinkCommentURLParam,isTaggingParam,xmlStringUserNameParam,basePathDbParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("buId", addchat.getBuId());
		paranValues.put("chatOnRelatedPartyId", addchat.getChatOnRelatedPartyId());
		paranValues.put("chatPartyId", addchat.getChatPartyId());	
		paranValues.put("recordTypeId", addchat.getRecordTypeId()); 
		paranValues.put("chatContactTypeID", addchat.getContact());
		paranValues.put("feedItemPost", addchat.getFeedItemPost());
		paranValues.put("feedFilePost", addchat.getFeedFilePost());
		paranValues.put("feedLinkPost", addchat.getFeedLinkPost());
		paranValues.put("feedLinkURL", addchat.getFeedLinkURL());
		//paranValues.put("feedLinkName", addchat.getFeedLinkName());
		paranValues.put("createdBy", addchat.getCreatedBy());
		paranValues.put("isAttachment", addchat.isAttachment());
		paranValues.put("attachmentCount", addchat.getAttachmentCount());
		paranValues.put("documentXML", documentXML);
		
		
		paranValues.put("chatType", addchat.getChatType());
		paranValues.put("parentChatId", addchat.getParentChatId());
		paranValues.put("feedItemComment", addchat.getFeedItemComment());
		paranValues.put("feedFileComment", addchat.getFeedFileComment());
		paranValues.put("feedLinkComment", addchat.getFeedLinkComment());
		paranValues.put("feedLinkCommentURL", addchat.getFeedLinkCommentURL());
		paranValues.put("isTagging", addchat.getIsTagging());
		paranValues.put("xmlStringUserName", addchat.getXmlStringUserName());
		
		
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
//		addchat.setChatId((Integer) storedProcResult.get("chatIddb"));
		addchat.setBasePath((String) storedProcResult.get("basePath"));
		return addchat;
		
		
	}
	@Override
	public QueryCommentData saveComment(QueryCommentData queryCommentData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(queryCommentData.getBuId()));
		List<DocumentData> documentDatas = queryCommentData.getDocumentDatas();
		String documentXML = FiinfraUtility.getDocumentXML(documentDatas);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveQueryComment");
		SqlParameter queryIdParam = new SqlParameter("queryId", Types.INTEGER);
		SqlParameter commentOwnerParam = new SqlParameter("commentOwner",
				Types.INTEGER);
		SqlParameter commentTextParam = new SqlParameter("commentText",
				Types.VARCHAR);
		SqlParameter isAttachmentParam = new SqlParameter("isAttachment",
				Types.BOOLEAN);
		SqlParameter attachmentCountParam = new SqlParameter("attachmentCount",
				Types.INTEGER);
		SqlParameter documentXMLParam = new SqlParameter("documentXML",
				Types.VARCHAR);
		SqlOutParameter commentIdDbParam = new SqlOutParameter("commentIdDb",
				Types.INTEGER);
		SqlOutParameter basePathDbParam = new SqlOutParameter("basePath",
				Types.VARCHAR);

		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { queryIdParam,commentOwnerParam,commentTextParam, isAttachmentParam,
				attachmentCountParam, documentXMLParam,commentIdDbParam, basePathDbParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("queryId", queryCommentData.getQueryId());
		paranValues.put("commentOwner", queryCommentData.getCommentPartyId());
		paranValues.put("commentText", queryCommentData.getCommentText());
		paranValues.put("isAttachment", queryCommentData.isAttachment());
		paranValues.put("attachmentCount", queryCommentData.getAttachmentCount());
		paranValues.put("documentXML", documentXML);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		queryCommentData.setQueryCommentId((Integer) storedProcResult.get("commentIdDb"));
		queryCommentData.setBasePath((String) storedProcResult.get("basePath"));
		return queryCommentData;
	}
	

	@Override
	public List getUserForTagging(int partyId,String searchText ,int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List userList=new ArrayList();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		ChatterData chatterData = new ChatterData();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getUserForTagging");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter searchTextParam = new SqlParameter("searchText", Types.VARCHAR);
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
		SqlParameter[] paramArray = {partyIdParam,searchTextParam,buIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId",partyId);
		paranValues.put("searchText",searchText);
		paranValues.put("buId",buId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		UserData userData=null;
		for(Map<String, Object> row:l){
			
			userList.add((row.get("name")));
			
			
		
				userList.add(row.get("username"));
				
			
			
			
			
		}
		return userList;
	}
	

	@Override
	public PartyData getAllocatedTeamMembers(int partyId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		PartyData partyData=new PartyData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getAllocatedTeamMembers");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.debug("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				partyData.setPstName((String) row.get("PSTName"));
				partyData.setMstName((String) row.get("MSTName"));
				partyData.setFpaName((String) row.get("FPaName"));
				partyData.setMst2Name((String) row.get("MST2Name"));
				partyData.setPstDepartmentName((String) row.get("PSTDepartmentName"));
				partyData.setMstDepartmentName((String) row.get("MSTDepartmentName"));
				partyData.setFpaDepartmentName((String) row.get("FPADepartmentName"));
				partyData.setMst2DepartmentName((String) row.get("MST2DepartmentName"));
				partyData.setPstPartyId((int) row.get("PSTPartyId"));
				partyData.setMstPartyId((int) row.get("MSTPartyId"));
				partyData.setFpaPartyId((int) row.get("FPAPartyId"));
				partyData.setMst2PartyId((int) row.get("MST2PartyId"));
				
				
				partyData.setRmName((String) row.get("RMName"));
				partyData.setRmHeadName((String) row.get("RMHeadName"));
				partyData.setRmDepartmentName((String) row.get("RMDepartmentName"));
				partyData.setRmHeadDepartmentName((String) row.get("RMHeadDepartmentName"));
				partyData.setRmPartyId((int) row.get("RMPartyId"));
				partyData.setRmHeadPartyId((int) row.get("RMHeadPartyId"));
			}
		}
		return partyData;
	}
	@Override
	public List<CodeValueData> getCityList(int parentId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<CodeValueData> cityList=new ArrayList<CodeValueData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		//JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getCityList");
		SqlParameter parentIdParam = new SqlParameter("parentId", Types.VARCHAR);
//		SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = {parentIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		logger.debug("parentId:--"+parentId);
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("parentId",parentId);
		logger.debug("paranValues:--"+paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		CodeValueData codeValueData=null;
		for(Map<String, Object> row:l){
			codeValueData=new CodeValueData();
			codeValueData.setCodeValue((String)row.get("CodeValue"));
			codeValueData.setCodeValueId((Integer)row.get("CodeValueID"));
			cityList.add(codeValueData);
		}
		return cityList;
	}

	@Override
	public Integer updateQueryStatus(int queryId, int status, int buId,
			int lastUpdatedBy) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		Integer recordCount=0;
		//JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_updateQueryStatus");
		SqlParameter queryIdParam = new SqlParameter("queryId", Types.INTEGER);
		SqlParameter statusParam = new SqlParameter("status", Types.INTEGER);
		SqlParameter lastUpdatedByParam = new SqlParameter("lastUpdatedBy", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = {queryIdParam,statusParam,lastUpdatedByParam,recordCountParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("queryId",queryId);
		paranValues.put("status", status);
//		lastUpdatedBy = buId;
		paranValues.put("lastUpdatedBy", lastUpdatedBy);
		logger.debug("paranValues:--"+paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		return recordCount;
	}



	@Override
	public List<CodeValueData> getCodeValues(String codeType, int buId) {
		List<CodeValueData> codeValues = null;		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		codeValues = jdbcTemplate.query(SP_RETRIVE_CODE_VALUES_FROM_CODE_TYPE, new Object[] { codeType },
			new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class));
		return codeValues;
	}
	
	@Override
	public void doAudit(Audit audit) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(audit.getBuId()));
		//int result = 
		jdbcTemplate.update(FiinfraConstants.SP_DO_AUDIT,new Object[] {
				audit.getActionByPartyId(),	
				audit.getActionByUserID(), 	 
				audit.getEventID(),
				audit.getEventTextXML(),	
				audit.getSourceSystemID(), 	
				audit.getSourceModule(), 	
				audit.getSourceScreen (),	
				audit.getObjectName(), 	
				audit.getProgamNo(), 	
				audit.getDbProc(), 	
				audit.getSessionID(),	 
				audit.getBuId()
		});
		logger.debug("Audit table updated for Action:"+audit.getActionByPartyId());
		
	}
	@Override
	public void insertNotification(Notification notification) {
jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(notification.getBuId()));
	logger.info("notification.getNotifyUserID()=="+notification.getNotifyUserID());
jdbcTemplate.update(FiinfraConstants.SP_INSERT_NOTIFICATION,new Object[] {
				notification.getBuId(),
				notification.getNotifyTypeId(),
				notification.getDeliveryChannelID(),
				notification.getSourceSystemID(),
				notification.getNotifyEventID(),
				notification.getNotifyPartyID(),
				notification.getNotifyUserID(),
				FiinfraUtility.getPayloadXMLFromMap(notification.getPayloadMap()),
				notification.getSessionID(),
				notification.getBatchJobID(),
				notification.getAttachmentPresent(),
				notification.getAttachmentCount(),
				notification.getAttachment1DocumentID(), 
				notification.getAttachment2DocumentID(),
				notification.getAttachment3DocumentID()
				
		});
	}
	@Override
	public List<CodeValueData> getCodeValuesForParentId(Integer parentId, Integer buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		return jdbcTemplate.query(SP_RETRIVE_CODE_VALUES_FOR_PARENT_ID, new Object[] { parentId },
				new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class));

	}

	@Override
	public Integer updatePassword(in.fiinfra.common.common.UserData userData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(userData.getBuId()));
		Integer recordCount=0;
		//JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_updatePassword");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter oldPasswordParam = new SqlParameter("oldPassword", Types.VARCHAR);
		SqlParameter newPasswordParam = new SqlParameter("newPassword", Types.VARCHAR);
		SqlParameter lastUpdatedByParam = new SqlParameter("lastUpdatedBy", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = {partyIdParam,oldPasswordParam,newPasswordParam,lastUpdatedByParam,recordCountParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId",userData.getPartyId());
		paranValues.put("oldPassword", userData.getOldPassword());
		paranValues.put("newPassword", userData.getNewPassword());
		paranValues.put("lastUpdatedBy", userData.getUserId());
		logger.debug("paranValues:--"+paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		return recordCount;
	}

	@Override
	public List<CodeValueData> getCountries(Integer codeValueId, Integer buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_COUNTRY_CODE_VALUES, new Object[] { codeValueId },
				new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class) );
	}
	@Override
	public Integer getCodeValuIdsForCodeValue(Integer parentId,
			String codeValue, Integer buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.queryForObject(SP_GET_CODEVALUEID_FOR_CODEVALUE, new Object[]{parentId, codeValue},Integer.class);
	}
	@Override
	public String insertDocuments(String documentXML,int partyId,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		Integer recordCount=0;
		//JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_insertmultipledocuments");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter documentXMLParam = new SqlParameter("documentXML", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlOutParameter basePathParam = new SqlOutParameter("basePath", Types.VARCHAR);
		SqlParameter[] paramArray = {partyIdParam,documentXMLParam,recordCountParam,basePathParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId",partyId);
		paranValues.put("documentXML", documentXML);
		logger.debug("paranValues:--"+paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		String basePath=storedProcResult.get("basePath").toString();
		return basePath;
	}
	@Override
	public Integer deleteObject(String ids, String object, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		Integer recordCount=0;
		//JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_deleteobject");
		SqlParameter idsParam = new SqlParameter("ids", Types.VARCHAR);
		SqlParameter objectParam = new SqlParameter("object", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = {idsParam,objectParam,recordCountParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("ids",ids);
		paranValues.put("object", object);
		logger.debug("paranValues:--"+paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		return recordCount;
	}
	@Override
	public List<String> getNonAccessibleControlIds(int partyId, int buId,int sourceSystemId) {
//		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
//		return jdbcTemplate.query(SP_RETRIVE_NON_ACCESSIBLE_CONTROLIDS, new Object[] { partyId },
//				new BeanPropertyRowMapper<String>(String.class));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<String> idList=new ArrayList<String>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		//JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getNonAccessibleControlIds");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter sourceSystemIdParam = new SqlParameter("sourceSystemId", Types.INTEGER);
//		SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = {partyIdParam,sourceSystemIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
//		logger.debug("parentId:--"+parentId);
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId",partyId);
		paranValues.put("sourceSystemId",sourceSystemId);
		logger.debug("paranValues:--"+paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		//System.out.println("paranValues:-----"+paranValues);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		CodeValueData codeValueData=null;
		for(Map<String, Object> row:l){
			idList.add((String) row.get("MappedInternalControlID"));
		}
		//System.out.println("idList:-----"+idList);
		return idList;
		
	} 


	@Override
	public Response getPassword(User user) {
		
		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForObject(FiinfraConstants.SP_GETPROFILE_PWD,new Object[] {user.getUserID(),user.getUserPassword() },Integer.class);
			br.setResponseObject(count);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
			}
			catch (DataAccessException e) {
				response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
			}
			finally
			{
				return response;
					

		
	} 

	}


	@Override
	public Response updateUserPassword(User user) {
		BaseResponse<Integer> br = new BaseResponse();
		try
		{
			Integer count;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		count=jdbcTemplate.queryForObject(FiinfraConstants.SP_UPDATE_PROFILE_PWD,new Object[] {user.getUserID(),user.getUserPassword() },Integer.class);
		br.setResponseObject(count);
		r1=FiinfraResponseBuilder.getSuccessResponse(br, null);
		//System.out.println("baji"+r1);
		}
		catch (DataAccessException e) {
			r1=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return r1;
		} 
	}


	@Override
	public Response getUserProfile(User user) {

		 BaseResponse<User> br = new BaseResponse();
			try
			{
				List<User> count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			
			count=jdbcTemplate.query(FiinfraConstants.SP_GET_PROFILE,new Object[] {user.getUserID()},new BeanPropertyRowMapper(User.class));
			
			br.setResponseListObject(count);
			
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
			}
			catch (DataAccessException e) {
				response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
			}
			finally
			{
				return response;
			}

	}


	@Override
	public Response updateProfile(User user) {
		BaseResponse<Integer> br = new BaseResponse();
		try
		{
			Integer count;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		count=jdbcTemplate.queryForObject(FiinfraConstants.SP_UPDATE_PROFILE,new Object[] {user.getUserID(),user.getFirstName(),user.getLastName(),user.getEmailID(),user.getEmailName(),user.getContactMobile(),user.getPanNo(),user.getArn(),user.getTheme() },Integer.class);
		br.setResponseObject(count);
		r1=FiinfraResponseBuilder.getSuccessResponse(br, null);
		//System.out.println("baji"+r1);
		}
		catch (DataAccessException e) {
			r1=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return r1;
		} 
	}
	
	@SuppressWarnings("finally")
	public Response getReloadNotesList(int partyId, int buId) {
	
	try {
		List<NotesData> notesDatas;
		BaseResponse<NotesData> br = new BaseResponse<NotesData>();

		notesDatas = jdbcTemplate.query("{call usp_cp_getReloadNotesList(?)}", new Object[] { partyId },
				new BeanPropertyRowMapper<NotesData>(NotesData.class));
		br.setResponseListObject(notesDatas);
		response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}
	
	
	@SuppressWarnings("finally")
	public Response getReloadDocumentsList(int partyId, int buId) {
	
	try {
		List<DocumentData> documentDatas;
		BaseResponse<DocumentData> br = new BaseResponse<DocumentData>();

		documentDatas = jdbcTemplate.query("{call usp_cp_getReloadDocumentsList(?)}", new Object[] { partyId },
				new BeanPropertyRowMapper<DocumentData>(DocumentData.class));
		br.setResponseListObject(documentDatas);
		response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}


	@Override
	public List<String> getRecommandedProductForGoal(int buId, int partyId,
			RecommandedProdForGoal RecommandedProdForGoal) {
		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<String> result=new ArrayList<String>();
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_common_getRecommendationForSection");
		
		SqlParameter buIdParam=new  SqlParameter("buId",Types.VARCHAR);
		SqlParameter partyIdParam=new  SqlParameter("partyId",Types.VARCHAR);
		SqlParameter xmlStrParam=new  SqlParameter("xmlStr",Types.VARCHAR);
		//SqlParameter createdIdParam=new  SqlParameter("createdBy",Types.VARCHAR);
		
		
		SqlParameter[] paramArray = {buIdParam,partyIdParam,xmlStrParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("buId",buId);
		paramValues.put("partyId",partyId);
		paramValues.put("xmlStr",xmlTransaltor.toXMLString(RecommandedProdForGoal));
		//paramValues.put("createdBy",createdBy);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		return result;
	}
}
