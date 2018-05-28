package in.fiinfra.opportunity.facade;


import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.NotesData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.opportunity.BulkUploadOpportunityData;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.opportunity.OpportunityStageData;
import in.fiinfra.common.opportunity.OpportunityTask;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.opportunity.service.OpportunityService;






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

@Component
@Path("/opportunity")
public class OpportunityController {
	@Autowired
	private OpportunityService opportunityService;
	Response response;
	private static final Logger logger = Logger.getLogger(OpportunityController.class);
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getOpportunityProfileRecord/{user}/{token}")
	public Response getOpportunityProfileRecord(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		OpportunityProfileData opportunityProfileData = opportunityService.getOpportunityProfileDetails(partyId,buId);
		BaseResponse<OpportunityProfileData> br=new BaseResponse<>();
		br.setResponseObject(opportunityProfileData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateOpportunityProfile/{user}/{token}")
	public Response updateOpportunityProfile(OpportunityProfileData opportunityProfileData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String sectionName=opportunityProfileData.getSectionName();
		
		//System.out.println("In App Controller "+sectionName);
		String dataXml=FiinfraUtility.getOpportunityProfileDataXML(opportunityProfileData, sectionName);
		int buId=opportunityProfileData.getBuId();
		String partyId=opportunityProfileData.getPartyId();
		//System.out.println("partyId===========APP================>>>>>>>>>"+partyId);
		List<Integer> recordCount = opportunityService.updateOpportunityProfile(sectionName,dataXml,buId,partyId,opportunityProfileData.getLastModifiedBy(),opportunityProfileData.getOfferingsXML());
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
		
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteOpportunities/{user}/{token}")
	public Response deleteOpportunities(@QueryParam("partyIds") String partyIds,@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String result = opportunityService.deleteOpportunities(partyIds,buId,createdBy);
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
	@Path("/getOpportunitiesList/{user}/{token}")
	public Response getOpportunitiesList(@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("nodeId") int nodeId,@QueryParam("pageNo") int pageNo,@QueryParam("pageSize") int pageSize,@QueryParam("orderBy") String orderBy,@PathParam("token") String token,
			@PathParam("user") String name,@QueryParam("oppSearchValue") String oppSearchValue,@QueryParam("sord") String sord ) throws Exception {
		response = opportunityService.getOpportunitiesList(partyId, buId,oppSearchValue,nodeId,pageNo,pageSize,orderBy,sord);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getOpportunitiesTask/{user}/{token}")
	public Response getOpportunitiesTask(@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@PathParam("token") String token,
			@PathParam("user") String name,@QueryParam("oppSearchValue") String oppSearchValue) throws Exception {
		//System.out.println("In App Controller................................");
		logger.debug("opportunityDatas:---" + partyId);
		logger.debug("buId:---" + buId);
		/*List<OpportunityTask> opportunityDatas =  opportunityService.getOpportunitiesTask(partyId, buId,oppSearchValue);  		
		BaseResponse<OpportunityTask> br=new BaseResponse<>();
		//System.out.println("A........................"+opportunityDatas);
		br.setResponseListObject(opportunityDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;*/
		response = opportunityService.getOpportunitiesTask(partyId, buId,oppSearchValue);
		return response;

	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertOpportunity/{user}/{token}")
	public Response insertOpportunity(OpportunityData opportunityData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String opportunityXMLString=FiinfraUtility.getopportunityXMLString(opportunityData);
		int buId=opportunityData.getBuId();
		int partyId=opportunityData.getOwnerPartyID();
		List<Integer> recordCount=opportunityService.saveOpportunity(partyId, opportunityXMLString,opportunityData.getCreatedBy(), buId,opportunityData.getOfferingsXML(),opportunityData.getPartyId());
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertBulkOpportunity/{user}/{token}")
	public Response insertBulkOpportunity(BulkUploadOpportunityData bulkUploadOpportunityData,
			@PathParam("token") String token){		
		String bulkopportunityXML=bulkUploadOpportunityData.getBulkopportunityXml();
		
		List<List<OpportunityData>> recordCount=opportunityService.insertBulkOpportunity(bulkopportunityXML,bulkUploadOpportunityData.getCreatedBy());
		BaseResponse<List<OpportunityData>> br=new BaseResponse<>();
		
		br.setResponseListObject(recordCount);		
//		System.out.println("Br-Success--"+recordCount.get(0));
//		List<OpportunityData> lstSuccessOpportunityDC=new ArrayList<OpportunityData>();
//		lstSuccessOpportunityDC=recordCount.get(0);
//		
//		int recordDCSuccess=opportunityService.insertBulkDcActivationForBulkOpportunity(lstSuccessOpportunityDC,bulkUploadOpportunityData.getCreatedBy(),bulkUploadOpportunityData.getBuId());
//		int recordXRaySuccess=opportunityService.insertBulkXRayActivationForBulkOpportunity(lstSuccessOpportunityDC,bulkUploadOpportunityData.getCreatedBy(),bulkUploadOpportunityData.getBuId());
		
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertDcActivationRecord/{user}/{token}")
	public Response insertDcActivationRecord(UserData userData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String userXMLString=userData.getUserDataXML();
		int buId=userData.getBuID();
		int partyId=userData.getPartyId();
		List<Integer> recordCount=opportunityService.insertDcActivationRecord(userXMLString,userData.getCreatedBy(), buId);
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertXRayActivationRecord/{user}/{token}")
	public Response insertXRayActivationRecord(UserData userData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
//		String userXMLString=userData.getUserDataXML();
		String userXMLString=userData.getUserDataXML();
		String partyIds=userData.getPartyIds();
		logger.info("redirectXRayActivation----APP------"+partyIds);
		int buId=userData.getBuID();
		int partyId=userData.getPartyId();
		List<String> recordCount=opportunityService.insertXRayActivationRecord(userXMLString,partyIds,userData.getCreatedBy(), buId);
		BaseResponse<String> br=new BaseResponse<>();
		br.setResponseListObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getOpportunityRecord/{partyId}/{token}")
	public Response getOpportunityRecord(@QueryParam("partyId") int partyId,@PathParam("token") String token, @PathParam("user") String name) 
	{
		Response response = null;
		
		BaseResponse<OpportunityData> baseResponse = new BaseResponse<OpportunityData>();
		baseResponse.setResponseObject(opportunityService.getOpportunityRecord(partyId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getOpportunitiesStageList/{partyId}/{token}")
	public Response getOpportunitiesStageList(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("nodeId") int nodeId,@PathParam("token") String token, @PathParam("user") String name) 
	{
		/*Response response = null;
		BaseResponse<OpportunityStageData> baseResponse = new BaseResponse<OpportunityStageData>();
		baseResponse.setResponseListObject(opportunityService.getOpportunitiesStageList(partyId,buId,nodeId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;*/
		response = opportunityService.getOpportunitiesStageList(partyId, buId,nodeId);
		return response;
	}
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertBulkDcActivation/{user}/{token}")
	public Response insertBulkDcActivation(@QueryParam("partyIds") String partyIds,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		List<Integer> result = opportunityService.insertBulkDcActivation(partyIds,buId);
//		BaseResponse<String> br = new BaseResponse<String>();
//		if(result.equalsIgnoreCase(FiinfraConstants.success)){
//			br.setStatus(FiinfraConstants.success);
//			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
//		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
//			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
//			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
//		}
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(result);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);

		logger.debug("result:---"+result);
		return response;

	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertNote/{user}/{token}")
	public Response insertNote(NotesData noteData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
//		noteData = opportunityService.insertNote(noteData);
//		BaseResponse<NotesData> br=new BaseResponse<>();
//		br.setResponseObject(noteData);
//		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
//		return response;
		
		List<Integer> recordCount=opportunityService.insertNote(noteData);
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteNote/{user}/{token}")
	public Response deleteNote(@QueryParam("noteIds") String noteIds,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String result = opportunityService.deleteNote(noteIds,buId);
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
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertDocument/{user}/{token}")
	public Response insertDocument(DocumentData documentData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		documentData = opportunityService.insertDocument(documentData);
		BaseResponse<DocumentData> br=new BaseResponse<>();
		br.setResponseObject(documentData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteDocument/{user}/{token}")
	public Response deleteDocument(@QueryParam("documentIds") String documentIds,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String result = opportunityService.deleteDocument(documentIds,buId);
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
	@Path("/updateFpplanType/{user}/{token}")
	public Response updateFpplanType(@QueryParam("fpPlanTypeId") int fpPlanTypeId,@QueryParam("dcInputPartyId") int dcInputPartyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String inflationRate="";
		inflationRate = opportunityService.updateFpplanType(fpPlanTypeId,dcInputPartyId,buId);
		BaseResponse<String> br=new BaseResponse<>();
		br.setResponseObject(inflationRate);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSendReport/{user}/{token}")
	public Response getSendReport(@QueryParam("partyId") int partyId) throws Exception {
		List<OpportunityData> sendReportDatas =  opportunityService.getSendReport(partyId);  		
		BaseResponse<OpportunityData> br=new BaseResponse<>();
		br.setResponseListObject(sendReportDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
}
