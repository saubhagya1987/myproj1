package in.fiinfra.common.facade;

import in.fiinfra.common.admin.AddChat;
import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.BroadCastData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.ContactUsData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentValueData;
import in.fiinfra.common.common.FaqsQuestionsData;
import in.fiinfra.common.common.MultipleDocumentData;
import in.fiinfra.common.common.PartyData;
import in.fiinfra.common.common.QueryCommentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.common.QueryRequest;
import in.fiinfra.common.common.RecommandedProdForGoal;
import in.fiinfra.common.common.SearchResultData;
import in.fiinfra.common.partner.StockPortfolioData;
import in.fiinfra.common.service.CommonService;
import in.fiinfra.common.service.vo.Product;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;

import com.sun.jersey.api.core.InjectParam;

@Component
@Path("/common")
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	
	Response response;
	private static final Logger logger = Logger.getLogger(CommonController.class);
	// @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason =
	// "Runtime Exception")
	// @ExceptionHandler(RuntimeException.class)
	// public void exceptionHandling() {
	// logger.debug("I am in exceptionHandling");
	// }
	
	/*Viraj To Do: Replace all Sting token by java.util.UUID when token implementation is done*/

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSearchList/{user}/{token}")
	public Response getSearchList(@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("searchText") String searchText,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		System.out.println("In App Controller..Search..............................");
		logger.debug("opportunityDatas:---" + partyId);
		logger.debug("buId:---" + buId);
		List<SearchResultData> searchResultDatas =  commonService.getSearchList(partyId, buId,searchText);  		
		BaseResponse<SearchResultData> br=new BaseResponse<>();
		//System.out.println("A........................"+searchResultDatas);
		br.setResponseListObject(searchResultDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPicklistValueList/{user}/{token}")
	public Response getPicklistValueList(
			@QueryParam("codeTypeIds") String codeTypeIds,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		
		
		// List<CodeValueData> codeValueDataList = trial(codeTypeIds, buId);
		try{
		List<CodeValueData> codeValueDataList = commonService
				.getQueryPicklistValues(codeTypeIds, buId);
		BaseResponse<CodeValueData> br = new BaseResponse<>();
		br.setResponseListObject(codeValueDataList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch(Exception e){
			logger.debug(""+e.getMessage());
		}
		return response;
	}
		
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDownloadsList/{user}/{token}")
	public Response getDownloadsList(@QueryParam("buId") int buId,@QueryParam("sourceSysId") String sourceSysId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {

		//logger.debug("in:----getDownloadsList");

		List<DocumentValueData> documentValueData = commonService.getDownloadsList(buId,sourceSysId);
		return Response.status(200).entity(documentValueData).build();

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFaqsQuestionsList/{user}/{token}")
	public Response getFaqsQuestions(@QueryParam("buId") int buId,@QueryParam ("sourceSystemId") int sourceSystemId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		//logger.debug("in:----getFaqsQuestionsList");

		List<FaqsQuestionsData> faqsQuestionsData = commonService
				.getFaqsQuestionsList(buId,sourceSystemId);
		return Response.status(200).entity(faqsQuestionsData).build();

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getBroadCastList/{user}/{token}")
	public Response getBroadCastList(@QueryParam("buId") int buId,@QueryParam ("sourceSystemId") int sourceSystemId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		//logger.debug("in:----getBroadCastList");

		List<BroadCastData> broadCastDatas = commonService
				.getBroadCastList(buId,sourceSystemId);
		return Response.status(200).entity(broadCastDatas).build();

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFaqs/{user}/{token}")
	public Response getFaqs(@QueryParam("buId") int buId,@QueryParam("sourceSystemId") int sourceSystemId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		//logger.debug("in:----getFaqs");

		List<FaqsQuestionsData> faqsQuestionsData = commonService
				.getFaqsQuestionsList(buId, sourceSystemId);
		BaseResponse<FaqsQuestionsData> resposne = new BaseResponse<FaqsQuestionsData>();
		resposne.setResponseListObject(faqsQuestionsData);
		return FiinfraResponseBuilder.getSuccessResponse(resposne, null);
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFaqList/{user}/{token}")
	public Response getFaqList(@QueryParam("buId") int buId,@QueryParam("sourceSystemId") int sourceSystemId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		logger.debug("in:----getFaqs");

		List<FaqsQuestionsData> faqsQuestionsData = commonService
				.getFaqsQuestionsList(buId,sourceSystemId);
		BaseResponse<FaqsQuestionsData> resposne = new BaseResponse<FaqsQuestionsData>();
		resposne.setResponseListObject(faqsQuestionsData);
		return FiinfraResponseBuilder.getSuccessResponse(resposne, null);
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getContactUsRecord/{user}/{token}")
	public Response getContactUs(@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		//System.out.println("in:----getContactUsRecord");

		List<ContactUsData> contactUsData = commonService
				.getContactUsRecord(buId);
		return Response.status(200).entity(contactUsData).build();

	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertQuery/{user}/{token}")
	public Response insertQuery(QueryData queryData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		queryData = commonService.saveQuery(queryData);
		BaseResponse<QueryData> br=new BaseResponse<>();
		br.setResponseObject(queryData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteQuery/{user}/{token}")
	public Response deleteQuery(@QueryParam("queryIds") String queryIds,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String result = commonService.deleteQuery(queryIds,buId);
		BaseResponse<String> br = new BaseResponse<String>();
		if(result.equalsIgnoreCase(FiinfraConstants.success)){
			br.setStatus(FiinfraConstants.success);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
		}
		logger.debug("result:---"+result);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getQueryList/{user}/{token}")
	public Response getQueryList(@QueryParam("partyId") int partyId,@QueryParam("searchValue") String querySearchValue,
			@QueryParam("buId") int buId,@QueryParam("queryPanel") String queryPanel,@QueryParam("nodeId") int nodeId,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		logger.debug("queryDatas:---" + partyId);
		logger.debug("buId:---" + buId);
		List<QueryData> queryDatas = commonService.getQueryList(partyId, buId,queryPanel,querySearchValue,nodeId);
		BaseResponse<QueryData> br=new BaseResponse<>();
		br.setResponseListObject(queryDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getQueries/{user}/{token}")
	public Response getQueries(@InjectParam QueryRequest querySearch, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		logger.debug("queryDatas:---" + querySearch.getPartyId());
		logger.debug("buId:---" + querySearch.getBuId());
		List<QueryData> queryDatas = commonService.getQueries(querySearch.getBuId(),querySearch);
		BaseResponse<QueryData> br=new BaseResponse<>();
		br.setResponseListObject(queryDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUnreadQueryCountListWithSearch/{user}/{token}")
	public Response getUnreadQueryCountListWithSearch(@InjectParam QueryRequest querySearch, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		logger.debug("queryDatas:---" + querySearch.getPartyId());
		logger.debug("buId:---" + querySearch.getBuId());
		List<Integer> unreadQueryCount = commonService.getUnreadQueryCountWithSearch(querySearch.getBuId(),querySearch);
		BaseResponse<Integer> br=new BaseResponse<Integer>();
		br.setResponseListObject(unreadQueryCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getQueriesForClient/{user}/{token}")
	public Response getQueriesForClient(@InjectParam QueryRequest querySearch, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		logger.debug("queryDatas:---" + querySearch.getPartyId());
		logger.debug("buId:---" + querySearch.getBuId());
		List<QueryData> queryDatas = commonService.getQueriesForClient(querySearch.getBuId(),querySearch);
		BaseResponse<QueryData> br=new BaseResponse<>();
		br.setResponseListObject(queryDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUnreadQueryCountList/{user}/{token}")
	public Response getUnreadQueryCountList(@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,
			@QueryParam("queryPanel") String queryPanel,@QueryParam("searchValue") String searchValue,@QueryParam("nodeId") int nodeId ,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		logger.debug("queryDatas:---" + partyId);
		logger.debug("buId:---" + buId);
		logger.debug("queryPanel:---" + queryPanel);
		List<Integer> unreadQueryCount = commonService.getUnreadQueryCount(partyId,
				buId, queryPanel,searchValue,nodeId);
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(unreadQueryCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getQueryRecord/{user}/{token}")
	public Response getQueryRecord(@QueryParam("queryId") int queryId,@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("queryId:---" + queryId);
		QueryData queryData = commonService.getQueryDetails(queryId,partyId,buId);
		BaseResponse<QueryData> br=new BaseResponse<QueryData>();
		br.setResponseObject(queryData);
		//System.out.println("queryData:--------"+br.getResponseObject());
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAllocatedTeamMemberList/{user}/{token}")
	public Response getAllocatedTeamMemberList(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		PartyData partyData = commonService.getAllocatedTeamMembers(partyId,buId);
		BaseResponse<PartyData> br=new BaseResponse<PartyData>();
		br.setResponseObject(partyData);
		//System.out.println("partyData:--------"+br.getResponseObject());
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateQueryStatus/{user}/{token}")
	public Response updateQueryStatus(@QueryParam("queryId") int queryId,@QueryParam("lastUpdatedBy") int lastUpdatedBy,@QueryParam("status") int status,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + queryId);
		Integer recordCount = commonService.updateQueryStatus(queryId,status,buId,lastUpdatedBy);
		BaseResponse<Integer> br=new BaseResponse<Integer>();
		br.setResponseObject(recordCount);
		//System.out.println("recordcount:--------"+br.getResponseObject());
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
		
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertQueryComment/{user}/{token}")
	public Response insertQueryComment(QueryCommentData queryCommentData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		queryCommentData = commonService.saveComment(queryCommentData);
		BaseResponse<QueryCommentData> br=new BaseResponse<>();
		br.setResponseObject(queryCommentData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDocumentRecord/{user}/{token}")
	public Response getDocumentRecord(@QueryParam("docId") int docId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("docId:---" + docId);
		DocumentData documentData = commonService.getDocumentDetails(docId,buId);
		BaseResponse<DocumentData> br=new BaseResponse<>();
		br.setResponseObject(documentData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	


	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getContactDetailsList/{user}/{token}")
	public Response getContactDetailsList(
			@QueryParam("loggedInUserPartyId") int loggedInUserPartyId,
			@QueryParam("roleId") int roleId,
			@QueryParam("buId") int buId,
			@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		logger.debug("In getContatctDetailsInApp loggedInUserPartyId======="+loggedInUserPartyId);

		List<CodeValueData> codeValueDataList = commonService
				.getContatcDetails(roleId, loggedInUserPartyId,buId);
		return Response.status(200).entity(codeValueDataList).build();
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUserList/{user}/{token}")
	public Response getUserList(
			@QueryParam("loggedInUserPartyId") int loggedInUserPartyId,
			@QueryParam("recordType") int recordType,
			@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {

		List<UserData> userList = commonService.getUserList(recordType,
				loggedInUserPartyId,buId);
		return Response.status(200).entity(userList).build();
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAllchatsAndCommentList/{user}/{token}")
	public Response getAllchatsAndCommentList(
			@QueryParam("loggedInUserPartyId") int loggedInUserPartyId,
			@QueryParam("startValue") int startValue,
			@QueryParam("buId") int buId,@QueryParam("nodeId") int nodeId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
//		System.out
//				.println("In getAllchatsAndCommentsinApp id================= "
//						+ loggedInUserPartyId);
		List<Object> chatterList = commonService
				.getChatAndComments(loggedInUserPartyId,startValue,buId,nodeId);
		//logger.debug("Chatter List=====================" + chatterList);
		return Response.status(200).entity(chatterList).build();

	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertChatRecord/{user}/{token}")
	public Response insertChatRecord(AddChat addChat, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		logger.debug("addChat in facade getChatOnRelatedPartyId:---" + addChat.getChatOnRelatedPartyId());
		logger.debug("addChat in facade getChatType:---" + addChat.getChatType());
		logger.debug("addChat in facade getChatContentTypeId:---" + addChat.getChatContentTypeId());
		
		addChat = commonService.saveChat(addChat);
		return Response.status(200).entity(addChat).build();
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUserForTaggingList/{user}/{token}")
	public Response getUserForTaggingList(
			@QueryParam("partyId") int partyId,
			@QueryParam("searchText") String searchText,
			@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		
		List chatterList = commonService
				.getUserForTagging(partyId,searchText,buId);
		logger.debug("Chatter List=====================" + chatterList);
		return Response.status(200).entity(chatterList).build();

	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCityList/{user}/{token}")
	public Response getCityList(
			@QueryParam("parentId") int parentId,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		logger.debug("in:----getCityList");
		// String codeTypeIds="20";
		// int buId=153;
		logger.debug("parentId:---" + parentId);
		logger.debug("buId:---" + buId);
		logger.debug("Token:---" + token);
		// List<CodeValueData> codeValueDataList = trial(codeTypeIds, buId);
		List<CodeValueData> codeValueDataList = commonService
				.getCityList(parentId, buId);
		BaseResponse<CodeValueData> br = new BaseResponse<>();
		br.setResponseListObject(codeValueDataList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);

		return response;

	}
	

	

	public CommonService getCommonService() {
		return commonService;
	}

	public void setCommonService(CommonService commonService) {
		this.commonService = commonService;
	}

	public List<CodeValueData> trial(String codeTypeIds, int buId) {
		// List<CodeValueData>
		// codeValueDataList=commonDao.getQueryPicklistValues(codeTypeIds,buId);
		CodeValueData c = new CodeValueData();
		CodeValueData d = new CodeValueData();
		c.setCodeTypeId(5555);
		c.setCodeValue("Code Value 55555");

		d.setCodeTypeId(66666);
		d.setCodeValue("Code Value 6666");
		List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
		codeValueDataList.add(c);
		codeValueDataList.add(d);
		return codeValueDataList;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCodeValues/{codeType}/{buId}")
	public Response getCodeValues(@PathParam("codeType") String codeType,
			@PathParam("token") String token, @QueryParam("buId") int buId) {

		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		List<CodeValueData> codeValues = commonService.getCodeValues(codeType,
				buId);
		BaseResponse<CodeValueData> baseResponse = new BaseResponse<>();
		baseResponse.setResponseListObject(codeValues);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCountries/{codeValueId}/{token}")
	public Response getCountries(@PathParam("codeValueId") Integer codeValueId,
			@PathParam("token") String token, @QueryParam("buId") int buId) {

		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		List<CodeValueData> codeValues = commonService.getCountries(codeValueId,buId);
		BaseResponse<CodeValueData> baseResponse = new BaseResponse<>();
		baseResponse.setResponseListObject(codeValues);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCodeValuesForParentId/{parentId}/{token}") 
	public Response getCodeValuesForParentValueId(@PathParam("parentId") Integer parentId, 
			@PathParam("token") String token, @QueryParam("buId") Integer buId ) {
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<CodeValueData> codeValues = commonService.getCodeValuesForParentId(parentId,buId);
		BaseResponse<CodeValueData> baseResponse = new BaseResponse<>();
		baseResponse.setResponseListObject(codeValues);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
		
	}
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCodeValuIdsForCodeValue/{parentId}/{codeValue}/{token}") 
	public Response getCodeValuIdsForCodeValue(@PathParam("parentId") Integer parentId, @PathParam("codeValue") String codeValue, 
			@PathParam("token") String token, @QueryParam("buId") Integer buId ) {
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		Integer codeValueId = commonService.getCodeValuIdsForCodeValue(parentId, codeValue, buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(codeValueId);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
		
	}
	
	
	@POST
	@Path("/doAudit/{user}/{token}")
	public int doAudit(Audit audit,
						@PathParam("token") String token,
						@PathParam("user") String name) {
		logger.debug("APP Commoncontroller: Audit:"+audit.toString());
		/*audit.setActionByPartyId(111);
		audit.setEventName("eventName");
		audit.setActionByUserID(222);
		audit.setBuId(153);
		audit.setDbProc("usp_pp_someStoreProc");
		audit.setEventID(111);
		audit.setEventTextXML("SomeXML");
		audit.setObjectName("SomeObject");
		audit.setProgamNo("progamNo");
		audit.setSourceModule("sourceModule");
		audit.setSourceScreen("sourceScreen");
		audit.setSourceSystemID(33344);*/
		
		commonService.doAudit(audit);
		return 0;
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/insertNotification/{user}/{token}")
	public void insertNotification(Notification notification,
								   @PathParam("token") String token,
								   @PathParam("user") String name) {
		logger.debug("APP Commoncontroller: insertNotification:"+notification.getNotifyPartyID());
		commonService.insertNotification(notification);
		
	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updatePassword/{user}/{token}")
	public Response updatePassword(in.fiinfra.common.common.UserData userData,@PathParam("token") String token, @QueryParam("buId") Integer buId ) {
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		Integer result = commonService.updatePassword(userData);
		BaseResponse<Integer> baseResponse = new BaseResponse<>();
		baseResponse.setResponseObject(result);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
		
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertDocuments/{user}/{token}")
	public Response insertDocuments(MultipleDocumentData multipleDocumentData,@PathParam("token") String token, @QueryParam("buId") Integer buId,@QueryParam("partyId") Integer partyId ) {
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		String documentXML=FiinfraUtility.getDocumentXML(multipleDocumentData.getDocumentDatas());
		//System.out.println("documentXML:----"+documentXML);
		//System.out.println("partyId:----"+partyId);
		//System.out.println("buId:----"+buId);
		
		String result = commonService.insertDocuments(documentXML,partyId,buId);
		BaseResponse<String> baseResponse = new BaseResponse<>();
		baseResponse.setResponseObject(result);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
		
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteObject/{user}/{token}")
	public Response deleteObject(@QueryParam("ids") String ids,@QueryParam("object") String object,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		Integer result = commonService.deleteObject(ids,object,buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<>();
		baseResponse.setResponseObject(result);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;

	}
//	
//	@POST
//	@Consumes(MediaType.APPLICATION_JSON)
//	@Produces(MediaType.APPLICATION_JSON)
//	@Path("/insertNote/{user}/{token}")
//	public Response insertNote(NotesData noteData,
//			@PathParam("token") String token, @PathParam("user") String name)
//			throws Exception {
//		noteData = commonService.saveNote(noteData);
//		BaseResponse<NotesData> br=new BaseResponse<>();
//		br.setResponseObject(noteData);
//		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
//		return response;
//	}
//
//	@GET
//	@Produces(MediaType.APPLICATION_JSON)
//	@Path("/deleteNote/{user}/{token}")
//	public Response deleteNote(@QueryParam("noteIds") String noteIds,@QueryParam("buId") int buId,
//			@PathParam("token") String token, @PathParam("user") String name)
//			throws Exception {
//		String result = commonService.deleteNote(noteIds,buId);
//		BaseResponse<String> br = new BaseResponse<String>();
//		if(result.equalsIgnoreCase(FiinfraConstants.success)){
//			br.setStatus(FiinfraConstants.success);
//			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
//		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
//			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
//			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
//		}
//		logger.debug("result:---"+result);
//		return response;
//
//	}
//
//	@GET
//	@Produces(MediaType.APPLICATION_JSON)
//	@Path("/getNoteList/{user}/{token}")
//	public Response getNoteList(@QueryParam("partyId") int partyId,
//			@QueryParam("buId") int buId,@PathParam("token") String token,
//			@PathParam("user") String name) throws Exception {
//		logger.debug("partyid:---" + partyId);
//		logger.debug("buId:---" + buId);
//		List<NotesData> noteDatas = commonService.getNoteList(partyId, buId);
//		BaseResponse<NotesData> br=new BaseResponse<>();
//		br.setResponseListObject(noteDatas);
//		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
//		return response;
//
//	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNonAccessibleControlIds/{user}/{token}")
	public Response getNonAccessibleControlIds(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("sourceSystemId") int sourceSystemId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		List<String> idList = commonService.getNonAccessibleControlIds(partyId,buId,sourceSystemId);
		BaseResponse<String> baseResponse = new BaseResponse<>();
		baseResponse.setResponseListObject(idList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;

	}


	
	@ExceptionHandler
	public Response handleException(Exception ex) {
		Response response = FiinfraResponseBuilder.getErrorResponse("Some exception");
		
		return response;
	}
	
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPassword/{user}/{token}")
	public Response getPassword(User user,	@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {

		BaseResponse<User> br=new BaseResponse<>();
		br.setResponseObject(user);
		//response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		 response=commonService.getPassword(user);
		return response;
	
		}
	
	

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateUserPassword/{user}/{token}")
	public Response updateUserPassword(User user,	@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {

		
		//response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		 response=commonService.updateUserPassword(user);
		return response;
	
		}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUserProfile/{user}/{token}")
	public Response getUserProfile(User user,	@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {

		//System.out.println("done"); 
		//response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		 response=commonService.getUserProfile(user);
		return response;
	
		}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateProfile/{user}/{token}")
	public Response updateProfile(User user,	@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {

		
		//response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		 response=commonService.updateProfile(user);
		return response;
	
		}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAttachmentForRequestQ/{user}/{token}")
	public Response getAttachmentForRequestQ(@QueryParam("docId") String docId,@QueryParam("partyId") String partyId,@QueryParam("reportTypeId") String reportTypeId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String result = commonService.getAttachmentForRequestQ(docId,partyId,reportTypeId);
		BaseResponse<String> br = new BaseResponse<String>();
		br.setResponseObject(result);
//		if(result.equalsIgnoreCase(FiinfraConstants.success)){
//			br.setStatus(FiinfraConstants.success);
//			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
//		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
//			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
//			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
//		}
		response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		logger.debug("result:---"+result);
		return response;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getReloadNotesList/{partyId}/{token}")
	public Response getReloadNotesList(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@PathParam("token") String token, @PathParam("user") String name) 
	{		
		response = commonService.getReloadNotesList(partyId, buId);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getReloadDocumentsList/{partyId}/{token}")
	public Response getReloadDocumentsList(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@PathParam("token") String token, @PathParam("user") String name) 
	{		
		response = commonService.getReloadDocumentsList(partyId, buId);
		return response;
	}
	
	
	@POST
	@Path("/getRecommandedProductGoalList")
	public Response getRecommandedProductGoalList(
		@QueryParam("buId") int buId,@QueryParam("partyId") int partyId,RecommandedProdForGoal recommandedProdForGoal) throws Exception {
		
		response = (Response) commonService.getRecommandedProductForGoal(buId, partyId, recommandedProdForGoal);
		return response; 
	}
}
