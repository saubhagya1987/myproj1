package in.fiinfra.partner.facade;

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.ChartData;
import in.fiinfra.common.common.PartyEmailCommunicationData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.diy.models.ConfigurationProductsList;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductPurchaseURLs;
import in.fiinfra.common.facade.CommonController;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.partner.AutoPlanData;
import in.fiinfra.common.partner.BusinessValuationData;
import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.partner.LocationData;
import in.fiinfra.common.partner.NotificationDetails;
import in.fiinfra.common.partner.PerformanceMatrixData;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.RoleAccess;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.partner.service.PartnerService;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestBody;

@Component
@Path("/partner")
public class PartnerController {
	@Autowired
	private PartnerService partnerService;
	Response response;
	private static final Logger logger = Logger.getLogger(CommonController.class);
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProfileRecord/{user}/{token}")
	public Response getProfileRecord(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		ProfileData documentData = partnerService.getProfileDetails(partyId,buId);
		BaseResponse<ProfileData> br=new BaseResponse<>();
		br.setResponseObject(documentData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getchartDataList/{user}/{token}")
	public Response getchartDataList(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("chartType") String chartType,@QueryParam("nodeId") int nodeId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		
		List<ChartData> lstchartData = partnerService.getChartDataList(partyId, buId, chartType,nodeId);
		
		BaseResponse<ChartData> br = new BaseResponse<>();
		br.setResponseListObject(lstchartData);
		response = FiinfraResponseBuilder
				.getSuccessResponse(br, null);
		return response;
	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updatePartnerProfile/{user}/{token}")
	public Response updatePartnerProfile(ProfileData profileData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String sectionName=profileData.getSectionName();
		String dataXml=FiinfraUtility.getProfileDataXML(profileData, sectionName);
		int buId=profileData.getBuId();
		int partyId=profileData.getPartyId();
		int recordCount = partnerService.updatePartnerProfile(sectionName,dataXml,buId,partyId,profileData.getLastModifiedBy());
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updatePartnerAutoPlanConfiguration/{user}/{token}")
	public Response updatePartnerAutoPlanConfiguration(@QueryParam("isAutoPlanEnabled") int isAutoPlanEnabled,@QueryParam("partyId") int partyId,@QueryParam("lastModifiedBy") int lastModifiedBy,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		Integer recordCount = partnerService.updatePartnerAutoPlanConfiguration(partyId,lastModifiedBy,isAutoPlanEnabled);
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getActionPlanDetailsList/{user}/{token}")
	public Response getActionPlanDetailsList(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("isBiased") boolean isBiased,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		List<Object> apDetailsList = partnerService.getActionPlanDetailsList(partyId,buId,isBiased);
		BaseResponse<Object> br=new BaseResponse<>();
		br.setResponseListObject(apDetailsList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/convertContact/{user}/{token}")
	public Response convertContact(UserData userData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		int buId=userData.getBuID();
		int lastModifiedBy=userData.getCreatedBy();
		List<Integer> recordCount = partnerService.convertContact(buId,lastModifiedBy,userData.getUserDataXML());
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/savePartnerLocationData/{user}/{token}")
	public Response savePartnerLocationData(LocationData locationData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		int recordCount = partnerService.savePartnerLocationData(locationData);
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deletePartnerLocationData/{user}/{token}")
	public Response deletePartnerLocationData(LocationData locationData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		List<Integer> recordCount = partnerService.deletePartnerLocationData(locationData);
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNotificationListForPartner/{user}/{token}")
	public Response getNotificationListForPartner(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		List<NotificationDetails> notificationDetailsList = partnerService.getNotificationListForPartner(partyId,buId);
		BaseResponse<NotificationDetails> br=new BaseResponse<>();
		br.setResponseListObject(notificationDetailsList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertOrUpdateBisunessValuation/{user}/{token}")
	public Response insertOrUpdateBisunessValuation(BusinessValuationData businessValuationData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String dataXml=FiinfraUtility.getBusinessDataXML(businessValuationData);
		int partyId=businessValuationData.getPartyId();
		int recordCount = partnerService.insertOrUpdateBisunessValuation(dataXml,partyId,businessValuationData.getCreatedBy());
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getBusinessValuationRecord/{user}/{token}")
	public Response getBusinessValuationRecord(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		BusinessValuationData businessValuationData = partnerService.getBusinessValuationDetails(partyId,buId);
		BaseResponse<BusinessValuationData> br=new BaseResponse<>();
		br.setResponseObject(businessValuationData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getInterstedFpSection/{user}/{token}")
	public Response getInterstedFpSection(@QueryParam("partnerPartyId") int partnerPartyId,@QueryParam("buId") int buId,@QueryParam("clientPartyId") int clientPartyId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(partnerService.getInterstedFpSection(partnerPartyId, clientPartyId));
		baseResponse.setStatus("SUCCESS");
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Path(value = "/saveInterstedFpSection/{username}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response saveInterstedFpSection(@PathParam("username") String userName,@PathParam("token") String token,
			@QueryParam("partyId") int partyId,@QueryParam("lastModifiedBy") Integer lastModifiedBy,@QueryParam("buId") Integer buId, @RequestBody KeyValue keyValue) {
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();	
		baseResponse.setResponseObject(new Boolean(true));
		partnerService.saveInterstedFpSection(partyId, lastModifiedBy, keyValue);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;	
	}	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAutoPlanClinetDetailsRecord/{user}/{token}")
	public Response getAutoPlanClinetDetailsRecord(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		BaseResponse<AutoPlanData> baseResponse = new BaseResponse<AutoPlanData>();
		baseResponse.setResponseObject(partnerService.getAutoPlanClinetDetailsRecord(partyId, buId));
		baseResponse.setStatus("SUCCESS");
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Path(value = "/updateClientAutoPlanDetails/{username}/{token}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateClientAutoPlanDetails(AutoPlanData autoPlanData,@PathParam("username") String userName,@PathParam("token") String token) {
		BaseResponse<Integer> baseResponse = new BaseResponse<>();	
		baseResponse.setResponseObject(partnerService.updateClientAutoPlanDetails(autoPlanData));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;	
	}
	
	@POST
	@Path(value = "/updateQuickDCDetails/{username}/{token}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateQuickDCDetails(AutoPlanData autoPlanData,@PathParam("username") String userName,@PathParam("token") String token) {
		BaseResponse<Integer> baseResponse = new BaseResponse<>();	
		baseResponse.setResponseObject(partnerService.updateQuickDCDetails(autoPlanData));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;	
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getperformanceMatrixReport/{user}/{token}")
	public Response getperformanceMatrixReport(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@QueryParam("benchMark") int benchMark,@QueryParam("banchMarkCategory") int banchMarkCategory,@QueryParam("dataTagId") int dataTagId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		BaseResponse<PerformanceMatrixData> baseResponse = new BaseResponse<PerformanceMatrixData>();
		baseResponse.setResponseListObject(partnerService.getperformanceMatrixReport(partyId, buId,benchMark,banchMarkCategory,dataTagId));
		baseResponse.setStatus("SUCCESS");
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/savePartnerData/{user}/{token}")
	public Response  savePartnerData(Partner partner, 
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {
		//System.out.println("In APP Calling SavePartner");
		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		br.setResponseObject(partnerService.addPartner(partner));
		//Response  response=partnerService.addPartner(partner);
		Response response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;	
		

	}
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getHeirarchyData/{user}/{token}")
	public Response getHeirarchyData(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		HeirarchyData heirarchyData = partnerService.getHeirarchyData(partyId,buId);
		BaseResponse<HeirarchyData> br=new BaseResponse<>();
		br.setResponseObject(heirarchyData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getHeirarchyDataForVP/{user}/{token}")
	public Response getHeirarchyDataForVP(@QueryParam("partyId") int partyId,@QueryParam("currentNodeId") int currentNodeId,@QueryParam("level") int level,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		logger.debug("currentNodeId:---" + currentNodeId);
		logger.debug("level:---" + level);
		HeirarchyData heirarchyData = partnerService.getHeirarchyDataForVP(partyId,currentNodeId,level);
		BaseResponse<HeirarchyData> br=new BaseResponse<>();
		br.setResponseObject(heirarchyData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNameOfPartnerOrNode/{user}/{token}")
	public Response getNameOfPartnerOrNode(@QueryParam("partyId") Integer partyId,@QueryParam("currentNodeId") Integer currentNodeId,
			@PathParam("token") String token, @PathParam("user") String userName)
			throws JsonGenerationException, JsonMappingException, IOException {
		String name = partnerService.getNameOfPartnerOrNode(partyId, currentNodeId);
		BaseResponse<String> br=new BaseResponse<>();
		br.setResponseObject(name);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerDetails/{user}/{token}")
	public Response getPartnerDetails(@QueryParam("buId") int buId,@QueryParam("partyId") int partyId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		Partner partner = partnerService.getPartnerDetails(partyId,buId);
		BaseResponse<Partner> br=new BaseResponse<>();
		br.setResponseObject(partner);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		//System.out.println("Response======"+response);
		return response;
	}
	
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deletePartner/{user}/{token}")
	public Response  deletePartner(@QueryParam("buId") int buId,@QueryParam("partyId") int partyId, 
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {
		//System.out.println("In APP Calling deletePartner");
		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		br.setResponseObject(partnerService.deletePartner(partyId,buId));
		//Response  response=partnerService.addPartner(partner);
		Response response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		//System.out.println("Delete Partner="+response);
		return response;	
	}
	
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPlanType/{user}/{token}")
	public Response  getPlanType(@QueryParam("buId") int buId,@QueryParam("partyId") int partyId, 
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {			
		BaseResponse<Integer> br = new BaseResponse<>();			
		br.setResponseObject(partnerService.getPlanType(partyId,buId));			
		Response response = FiinfraResponseBuilder.getSuccessResponse(br, null);			
		return response;	
	}

	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/UpadatePlanType/{user}/{token}")
	public Response  UpdatePlanType(@QueryParam("buId") int buId,@QueryParam("partyId") int partyId,
			@QueryParam("planTypeId") int planTypeId,
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {			
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();			
		br.setResponseObject(partnerService.updatePlanType(partyId, planTypeId, buId));			
		Response response = FiinfraResponseBuilder.getSuccessResponse(br, null);			
		return response;	
	}
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteLogoOrPhoto/{user}/{token}")
	public Response  deleteLogoOrPhoto(@QueryParam("buId") int buId,@QueryParam("partyId") int partyId, @QueryParam("attributeCodeId") int attributeCodeId ,
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {
		//System.out.println("In APP Calling deletePartner");
		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		br.setResponseObject(partnerService.deleteLogoOrPhoto(partyId,buId,attributeCodeId));
		//Response  response=partnerService.addPartner(partner);
		Response response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		//System.out.println("Delete Partner="+response);
		return response;	
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerAutoPlanConfiguration/{user}/{token}")
	public Response  getPartnerAutoPlanConfiguration(@PathParam("token") String token,
			@PathParam("user") String name,@QueryParam("partyId") int partyId) throws IOException
	{			
		BaseResponse<Integer> br = new BaseResponse<Integer>();			
		br.setResponseObject(partnerService.getPartnerAutoPlanCongiguration(partyId));			
		Response response = FiinfraResponseBuilder.getSuccessResponse(br, null);			
		return response;	
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getRtaFilePasswords/{user}/{token}")
	public Response getRtaFilePasswords(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		ProfileData rtaFilePasswords = partnerService.getRtaFilePasswords(partyId,buId);
		BaseResponse<ProfileData> br=new BaseResponse<ProfileData>();
		br.setResponseObject(rtaFilePasswords);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	@GET
	@Path(value="/updateCurrentNodeIdForPartyId/{username}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateCurrentNodeIdForPartyId( @PathParam("username") String userName,@PathParam("token") String token,@QueryParam("partyId") int partyId, @QueryParam("nodeId") int nodeId)
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();	
		baseResponse.setResponseObject(partnerService.updateCurrentNodeIdForPartyId(partyId,nodeId));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
		
		
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveRtaFilePasswords/{user}/{token}")
	public Response  saveRtaFilePasswords(@PathParam("token") String token,
			@PathParam("user") String user,
			@QueryParam("partyId") Integer partyId,
			@QueryParam("userId") Integer userId,
			@RequestBody List<String> passwords
			) throws IOException {
		//System.out.println("In APP Calling SavePartner");
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		logger.info(br);
		br.setResponseObject(partnerService.saveRtaFilePasswords(partyId,passwords,userId));
		//Response  response=partnerService.addPartner(partner);
		Response response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;	
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEmailCommunicationDetails/{user}/{token}")
	public Response getEmailCommunicationDetails(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		PartyEmailCommunicationData partyEmailCommunicationData = partnerService.getEmailCommunicationDetails(partyId,buId);
		BaseResponse<PartyEmailCommunicationData> br=new BaseResponse<PartyEmailCommunicationData>();
		br.setResponseObject(partyEmailCommunicationData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAllRoleAccessList/{user}/{token}")
	public Response getAllRoleAccessList(@PathParam("token") String token, @PathParam("user") String name,@RequestBody RoleAccess roleAccess) 
	{
		response = partnerService.getAllRoleAccessList(roleAccess);
		return response;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateRoleAccessList/{user}/{token}")
	public Response updateRoleAccessList(
			@QueryParam("Lists") String objectIdList,
			@QueryParam("partyId") int partyId,
			@QueryParam("createdby") int createdby,
			@QueryParam("sourceId") int sourceId,
			@PathParam("token") String token, 
			@PathParam("user") String name) {


		response = partnerService.updateRoleAccessList(objectIdList,partyId,createdby,sourceId);
		return response;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getOLTransactionConfiguration/{username}/{token}")
	public Response getOLTransactionConfiguration(@PathParam("username") String username ,@PathParam("token") String token,
			@QueryParam("partyId") Integer partyId,@QueryParam("attrCodeId") Integer attrCodeId,@QueryParam("attrCodeList") String attrCodeList,
			@QueryParam("buId") Integer buId){
		
		BaseResponse<ConfigurationProductsList> br = new BaseResponse<ConfigurationProductsList>();
		br.setResponseObject(partnerService.getConfigurationProductsList(partyId, attrCodeId, attrCodeList, buId));
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPurchaseProductsURLs/{username}/{token}")
	public Response getPurchaseProductsURLs(@PathParam("username") String username ,@PathParam("token") String token,
			@QueryParam("partnerPartyId") Integer partnerPartyId,@QueryParam("executionId") Integer executionId,@QueryParam("productsId") String productsId,
			@QueryParam("settingTypeID") Integer settingTypeID){
		
		BaseResponse<ProductPurchaseURLs> br = new BaseResponse<ProductPurchaseURLs>();
		br.setResponseListObject(partnerService.getProductPurchaseURLs(partnerPartyId, executionId, settingTypeID, productsId.replace("%2C", ",")));
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
}
