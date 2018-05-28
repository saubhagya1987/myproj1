package in.fiinfra.common.facade;

import java.util.List;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DndData;
import in.fiinfra.common.common.QueryCommentData;
import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.common.RecipientListData;
import in.fiinfra.common.common.ScheduledPindData;
import in.fiinfra.common.common.TagData;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.service.CommonService;
import in.fiinfra.common.service.PingService;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Path("/ping")
public class PingController {
	
	@Autowired
	private PingService pingService;
	
	Response response;
	private static final Logger logger = Logger.getLogger(PingController.class);

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTagList/{user}/{token}")
	public Response getTagList(
			@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		List<TagData> tagDatas = pingService.getTagList(buId);
		BaseResponse<TagData> br = new BaseResponse<>();
		br.setResponseListObject(tagDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getStandardTagsForNotificationTarget/{user}/{token}")
	public Response getStandardTagsForNotificationTarget(
			@QueryParam("notifyTargetId") int notifyTargetId,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		List<CodeValueData> codeValueDatas = pingService.getStandardTagsForNotificationTarget(notifyTargetId,buId);
		BaseResponse<CodeValueData> br = new BaseResponse<>();
		br.setResponseListObject(codeValueDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTagsList/{user}/{token}")
	public Response getTagsList(
			
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		List<TagData> tagDatas = pingService.getTagsList(buId);
		BaseResponse<TagData> br = new BaseResponse<>();
		br.setResponseListObject(tagDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteTags/{user}/{token}")
	public Response deleteTags(
			
			@QueryParam("buId") int buId,@QueryParam("tagIds") String tagIds ,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		String result = pingService.deleteTags(tagIds, buId);
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
	@Path("/insertTags/{user}/{token}")
	public Response insertTags(TagData tagData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		//System.out.println("tag isActive=========="+tagData.isActive());
		tagData = pingService.insertTags(tagData);
		BaseResponse<TagData> br=new BaseResponse<>();
		br.setResponseObject(tagData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	

	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertOrUpdatePing/{user}/{token}")
	public Response insertOrUpdatePing(NotifyTemplateData notifyTemplateData,@PathParam("token") String token) {
		List<String> resultList = pingService.insertOrUpdatePing(notifyTemplateData);
		BaseResponse<String> baseResponse = new BaseResponse<>();
		baseResponse.setResponseListObject(resultList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
		
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/sendCustomPing/{user}/{token}")
	public Response sendCustomPing(NotifyTemplateData notifyTemplateData,@PathParam("token") String token) {
		List<String> resultList = pingService.sendCustomPing(notifyTemplateData);
		BaseResponse<String> baseResponse = new BaseResponse<>();
		baseResponse.setResponseListObject(resultList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
		
	}
	
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTagDetailsByTagId/{user}/{token}")
	public Response getTagDetailsByTagId(
			
			@QueryParam("notifyTagId") int tagId,@QueryParam("buId") int buId,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		TagData tagDatas  = pingService.getTagDetailsByTagId(tagId, buId);
		BaseResponse<TagData> br=new BaseResponse<>();
		br.setResponseObject(tagDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
		
//		logger.debug("result:---"+result);
//		return response;
	}
	
	

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPingRecord/{user}/{token}")
	public Response getPingRecord(
			@QueryParam("notifyTemplateId") int notifyTemplateId,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		NotifyTemplateData notifyTemplateData = pingService.getPingRecord(notifyTemplateId,buId);
		BaseResponse<NotifyTemplateData> br = new BaseResponse<>();
		br.setResponseObject(notifyTemplateData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTagValueList/{user}/{token}")
	public Response getTagValueList(
			@QueryParam("notifyTagId") int notifyTagId,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		List<CodeValueData> codeValueDatas = pingService.getTagValueList(notifyTagId,buId);
		BaseResponse<CodeValueData> br = new BaseResponse<>();
		br.setResponseListObject(codeValueDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getStandardPingList/{user}/{token}")
	public Response getStandardPingList(
			@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId, @QueryParam("nodeId") int nodeId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		List<NotifyTemplateData> notifyTemplateDatas = pingService.getStandardPingList(partyId,buId,nodeId);
		//System.out.println("in APP getStandardPingList ="+partyId);
		BaseResponse<NotifyTemplateData> br = new BaseResponse<>();
		
		br.setResponseListObject(notifyTemplateDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getRecipientListForSchedulePing/{user}/{token}")
	public Response getRecipientListForSchedulePing(
			@QueryParam("notifyTagId") String notifyTagId ,@QueryParam("recipientType") String recipientType, @QueryParam("notifyTempletId") int notifyTempletId,
			@QueryParam("buId") int buId,@QueryParam("partyId") int partyId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		//System.out.println("notifyTagId APP-"+notifyTagId);
		List<RecipientListData> reciepeentList = pingService.getRecipientList(notifyTagId,buId,recipientType,notifyTempletId,partyId);
		BaseResponse<RecipientListData> br = new BaseResponse<>();
		br.setResponseListObject(reciepeentList);
		//System.out.println("reciepeentList-"+reciepeentList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updatePingActiveFlag/{user}/{token}")
	public Response updatePingActiveFlag(
			
			@QueryParam("buId") int buId,@QueryParam("notifyTemplateId") int notifyTemplateId ,@QueryParam("lastModifiedBy") int lastModifiedBy ,@QueryParam("isActive") Boolean isActive ,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		int recordCount = pingService.updatePingActiveFlag(notifyTemplateId,isActive,lastModifiedBy, buId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/clonePing/{user}/{token}")
	public Response clonePing(
			
			@QueryParam("buId") int buId,@QueryParam("notifyTemplateId") int notifyTemplateId ,@QueryParam("lastModifiedBy") int lastModifiedBy ,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		int recordCount = pingService.clonePing(notifyTemplateId,lastModifiedBy, buId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/markPingAsFavourite/{user}/{token}")
	public Response markPingAsFavourite(
			@QueryParam("buId") int buId,@QueryParam("notifyTemplateId") int notifyTemplateId ,@QueryParam("lastModifiedBy") int lastModifiedBy,@QueryParam("partyId") int partyId ,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		int recordCount = pingService.markPingAsFavourite(notifyTemplateId,lastModifiedBy,partyId, buId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}



	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertSchedulePings/{user}/{token}")
	public Response insertSchedulePings(RecipientListData reciepientData,@PathParam("token") String token) {
		reciepientData = pingService.insertSchedulePings(reciepientData);
		BaseResponse<RecipientListData> br=new BaseResponse<>();
		br.setResponseObject(reciepientData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
		
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deletePing/{user}/{token}")
	public Response deletePing(
			@QueryParam("buId") int buId,@QueryParam("notifyTemplateIds") String notifyTemplateIds ,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		int recordCount = pingService.deletePing(notifyTemplateIds,buId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTagsFroNotifyTempletId/{user}/{token}")
	public Response getTagsFroNotifyTempletId(
			@QueryParam("notifyTempletId") int notifyTempletId,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		//System.out.println("In App ---getTagsFroNotifyTempletId=");
		List<TagData> tagList = pingService.getTagsFroNotifyTempletId(notifyTempletId,buId);
		//System.out.println("In App ---getTagsFroNotifyTempletId="+tagList);
		BaseResponse<TagData> br = new BaseResponse<>();
		br.setResponseListObject(tagList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getScheduledPings/{user}/{token}")
	public Response getScheduledPings(
			@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		//System.out.println("In App ---getTagsFroNotifyTempletId=");
		List<ScheduledPindData> scheduledPingData = pingService.getScheduledPings(partyId,buId);
		//System.out.println("In App ---getScheduledPings="+scheduledPingData);
		BaseResponse<ScheduledPindData> br = new BaseResponse<>();
		br.setResponseListObject(scheduledPingData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSchedulePingDatilsByScheduleId/{user}/{token}")
	public Response getSchedulePingDatilsByScheduleId(
			@QueryParam("notifyScheduleId") int notifyScheduleID,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		//System.out.println("In App ---getTagsFroNotifyTempletId=");
		RecipientListData scheduledPingData = pingService.getSchedulePingDatilsByScheduleId(notifyScheduleID,buId);
		//System.out.println("In App ---getScheduledPings="+scheduledPingData);
		BaseResponse<RecipientListData> br = new BaseResponse<>();
		br.setResponseObject(scheduledPingData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getScheduleRecipientDatilsByScheduleId/{user}/{token}")
	public Response getScheduleRecipientDatilsByScheduleId(
			@QueryParam("notifyScheduleId") int notifyScheduleID,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		//System.out.println("In App ---getTagsFroNotifyTempletId=");
		List<RecipientListData> scheduledPingData = pingService.getScheduleRecipientDatilsByScheduleId(notifyScheduleID,buId);
		//System.out.println("In App ---getScheduledPings="+scheduledPingData);
		BaseResponse<RecipientListData> br = new BaseResponse<>();
		br.setResponseListObject(scheduledPingData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteSchedulePings/{user}/{token}")
	public Response deleteSchedulePings(
			
			@QueryParam("schedulePingIds") String schedulePingIds,@QueryParam("buId") int buId ,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		String result = pingService.deleteSchedulePings(schedulePingIds, buId);
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
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/resolveTagsTemplateXML/{user}/{token}")
	public Response resolveTagsTemplateXML(
			NotifyTemplateData notifyTemplateData, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		NotifyTemplateData notifyTemplateData1 = pingService.resolveTagsTemplateXML(notifyTemplateData);
		BaseResponse<NotifyTemplateData> br = new BaseResponse<>();
		br.setResponseObject(notifyTemplateData1);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getMatchingTagsAndPotentialPings/{user}/{token}")
	public Response getMatchingTagsAndPotentialPings(
			@QueryParam("ownerpartyId") int ownerpartyId,
			@QueryParam("buId") int buId, @QueryParam("partyId") int partyId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		//System.out.println("In App ---getTagsFroNotifyTempletId=");
		List<NotifyTemplateData> scheduledPingData = pingService.getMatchingTagsAndPotentialPings(ownerpartyId,partyId,buId);
		//System.out.println("In App ---getScheduledPings="+scheduledPingData);
		BaseResponse<NotifyTemplateData> br = new BaseResponse<>();
		br.setResponseListObject(scheduledPingData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDelivaryHistory/{user}/{token}")
	public Response getDelivaryHistory(
			
			@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("notifyTemplateId") int notifyTemplateId , @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		//System.out.println("In App ---notifyTemplateId="+notifyTemplateId);
		List<RecipientListData> scheduledPingData = pingService.getDelivaryHistory(partyId,buId,notifyTemplateId);
		//System.out.println("In App ---getScheduledPings="+scheduledPingData);
		BaseResponse<RecipientListData> br = new BaseResponse<>();
		br.setResponseListObject(scheduledPingData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEmailAndContactOfContact/{user}/{token}")
	public Response getEmailAndContactOfContact(
			
			@QueryParam("contactId") int contactId,@QueryParam("buId") int buId,@QueryParam("buId") int notifyTemplateId , @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		//System.out.println("In App ---getTagsFroNotifyTempletId=");
		OpportunityData oppData = pingService.getEmailAndContactOfContact(contactId,buId);
		
		BaseResponse<OpportunityData> br = new BaseResponse<>();
		br.setResponseObject(oppData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertDnd/{user}/{token}")
	public Response insertDnd(DndData dndData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		//System.out.println("tag isActive=========="+dndData.isActive());
		dndData = pingService.insertDnd(dndData);
		BaseResponse<DndData> br=new BaseResponse<>();
		br.setResponseObject(dndData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDNDList/{user}/{token}")
	public Response getDNDList(
			
			@QueryParam("partyId") int partyId,@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		//System.out.println("In App ---getTagsFroNotifyTempletId=");
		List<DndData> dndData = pingService.getDelivaryHistory(partyId,buId);
		//System.out.println("In App ---getScheduledPings="+dndData);
		BaseResponse<DndData> br = new BaseResponse<>();
		br.setResponseListObject(dndData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDNDDetails/{user}/{token}")
	public Response getDNDDetails(
			
			@QueryParam("dndId") int dndId,@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		//System.out.println("In App ---getTagsFroNotifyTempletId=");
		DndData dndData = pingService.getDNDDetails(dndId,buId);
		//System.out.println("In App ---getScheduledPings="+dndData);
		BaseResponse<DndData> br = new BaseResponse<>();
		br.setResponseObject(dndData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	 
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteDnd/{user}/{token}")
	public Response deleteDnd(
			
			@QueryParam("buId") int buId,@QueryParam("dndIds") String dndIds ,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		String result = pingService.deleteDNDs(dndIds, buId);
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
	@Path("/updatePingRecipient/{user}/{token}")
	public Response updatePingRecipient(@QueryParam("buId") int buId,@QueryParam("partyId") int partyId ,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		Integer recordCount = pingService.updatePingRecipient(partyId, buId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	
}
