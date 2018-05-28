package in.fiinfra.serviceportal.facade;


import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.service.vo.LoginHistory;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.serviceportal.service.PartnerSPService;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;


@Controller
@Path("/partnersp")
public class PartnerSPController extends MultiActionController{

	private static final Logger logger = Logger.getLogger(PartnerSPController.class);
	
	Response response;
	String url;
	@Autowired
	PartnerSPService partnerSPService;
	

	public PartnerSPService getPartnerSPService() {
		return partnerSPService;
	}


	public void setPartnerSPService(PartnerSPService partnerSPService) {
		this.partnerSPService = partnerSPService;
	}


/* 	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	public ObjectMapper getObjectMapper() {
		logger.info(objectMapper);
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
	public RestTemplate getRestTemplate() {
		return restTemplate;
	}
	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}
	*/



	/*@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerList/{user}/{token}")
	public Response getPartnerList(@QueryParam("buId") String buId, 
			@QueryParam("userId") String userId,  @QueryParam("searchText") String searchText,
			@PathParam("token") String token,
			@PathParam("user") String name) {
		   BaseResponse<Partner> br = new BaseResponse<Partner>();
		   logger.info(searchText);
		   response=partnerSPService.showPartnerList(buId, userId,searchText);
		   logger.info(br);
			return response;
	
	}*/
	  
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerList/{user}/{token}") 
	public Response getPartnerList(@PathParam("token") String token,
			@PathParam("user") String name,@RequestBody Partner partner) {
		  BaseResponse<Partner> br = new BaseResponse<Partner>();
			response=partnerSPService.showPartnerList(partner); 
			return response; 
	
	}
	
	  
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getRMlist/{user}/{token}") 
	public Response getRMlist(@PathParam("token") String token,
			@PathParam("user") String name,@RequestBody Partner partner) {
		  BaseResponse<Partner> br = new BaseResponse<Partner>();
			response=partnerSPService.getRMlist(partner); 
			return response; 
	
	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addPartner/{user}/{token}")
	public Response  addPartner(Partner partner, 
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		   response=partnerSPService.addPartner(partner.getFirstName(), partner.getLastName(),  (partner.getCompanyName()!=null)?partner.getCompanyName():"", partner.getContactEmail(), Long.parseLong(partner.getContactMobile()), partner.getArn(), partner.getPstTeamMemberId(), partner.getPktTeamMemberId(), partner.getPotTeamMemberId(), partner.getRmTeamMemberId(), partner.getRmHeadTeamMemberId(),partner.getBuId(),partner.getUserId(),(partner.getEuin()!=null)?partner.getEuin():"",partner.getState(),partner.getLocation(),partner.getLoginName(),partner.geteNCPassword(),partner.getCommunicationEmailId());
			return response;
		

	}


	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editPartner/{user}/{token}")
	public Response editPartner(Partner partner,
			@PathParam("token") String token) throws IOException,
			NumberFormatException {

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.editPartner(partner.getFirstName(), partner
				.getLastName(),
				(partner.getCompanyName() != null) ? partner.getCompanyName()
						: "", partner.getContactEmail(), (Long) Long
						.parseLong(partner.getContactMobile()),partner.getArn(), partner
						.getPstTeamMemberId(), partner.getPktTeamMemberId(),
				partner.getPotTeamMemberId(), partner.getRmTeamMemberId(), partner.getRmHeadTeamMemberId(), partner.getBuId(), partner
						.getUserId(), partner.getPartyID().toString(), (partner
						.getEuin() != null) ? partner.getEuin() : "",partner.getState(), partner
						.getLocation(),partner.getCommunicationEmailId());
		return response;

	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/assignCommunicationEmail/{user}/{token}")
	public Response assignCommunicationEmail(Partner partner,
			@PathParam("token") String token) throws IOException,
			NumberFormatException {

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.assignCommunicationEmail(
				partner.getEmailCommunicationName(),
				partner.getContactEmail(), partner.getBuId(),
				partner.getUserId(), partner.getPartyID().toString());
		return response;

	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveChecklist/{user}/{token}")
	public Response saveChecklist(Partner partner,
			@PathParam("token") String token) throws IOException,
			NumberFormatException {

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.saveChecklist(partner);
			/* partner.getEmailCommunicationName(),
				partner.getContactEmail(), partner.getBuId(),
				partner.getUserId(), partner.getPartyID().toString());*/	
		return response;

	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/savelegends/{user}/{token}")
	
	public Response savelegends(Partner partner,
			@PathParam("token") String token) throws IOException,
			NumberFormatException {

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.savelegends(partner);
				
		return response;

	}
	

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getlegendsChecklist/{user}/{token}")
	public Response getlegendsChecklist(@PathParam("token") String token, @PathParam("user") String name,Partner partner)
			throws IOException{
	

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.getlegendsChecklist(partner);
		return response;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPSTPKTPOTNames/{user}/{token}")
	public Response getPSTPKTPOTNames(@QueryParam("buId") String buId,
			@PathParam("token") String token, @PathParam("user") String name) {
		BaseResponse<Partner> br = new BaseResponse<>();
		response = partnerSPService.getPSTPKTPOTNames(buId);
		logger.info(br);
		return response;

	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/searchPSTPKTPOT/{user}/{token}")
	public Response searchPSTPKTPOT(@QueryParam("buId") String buId,
			@QueryParam("deptTypeId") String deptTypeId,
			@PathParam("token") String token, @PathParam("user") String name) {
		BaseResponse<Partner> br = new BaseResponse<>();
		response = partnerSPService.searchPSTPKTPOT(buId, deptTypeId);
		logger.info(br);
		return response;

	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addSTAforPartner/{user}/{token}")
	public Response addSTAforPartner(Partner partner,
			@PathParam("token") String token, @PathParam("user") String name)
			throws IOException {

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.addSTAforPartner(
				partner.getPstTeamMemberId(), partner.getPktTeamMemberId(),
				partner.getPotTeamMemberId(), partner.getRmTeamMemberId(), partner.getRmHeadTeamMemberId(), partner.getPartyID().toString());
		return response;

	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addBulkSTAforPartner/{user}/{token}")
	public Response addBulkSTAforPartner(Partner partner,
			@PathParam("token") String token, @PathParam("user") String name)
			throws IOException {

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.addBulkSTAforPartner(
				partner.getPstTeamMemberId(), partner.getPktTeamMemberId(),
				partner.getPotTeamMemberId(), partner.getRmTeamMemberId(), partner.getRmHeadTeamMemberId(), partner.getBulkSTAselect());
		return response;

	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getLocation/{user}/{token}")
	public Response getLocation(@PathParam("token") String token,
			@PathParam("user") String name) {
		BaseResponse<Partner> br = new BaseResponse<>();
		response = partnerSPService.getLocation();
		logger.info(br);
		return response;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getLoginName/{user}/{token}")
	public Response getLoginName(@QueryParam("partyId") String partyId,@PathParam("token") String token,
			@PathParam("user") String name) {
		BaseResponse<Partner> br = new BaseResponse<>();
		response = partnerSPService.getLoginName(partyId);
		logger.info(br);
		return response;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUniqueArn/{user}/{token}")
	public Response getUniqueArn(@QueryParam("arn") String arn,@PathParam("token") String token,
			@PathParam("user") String name) {
		BaseResponse<Partner> br = new BaseResponse<>();
		response = partnerSPService.getUniqueArn(arn);
		logger.info(br);
		return response;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUniqueCommunicationEmail/{user}/{token}")
	public Response getUniqueCommunicationEmail(
			@QueryParam("communicationEmailId") String communicationEmailId,
			@QueryParam("hdnbuId") String buId,
			@QueryParam("contactEmail") String contactEmail,
			@QueryParam("isedit") String edit,
			@PathParam("token") String token, @PathParam("user") String name) {
		BaseResponse<Partner> br = new BaseResponse<>();
		Partner partner = new Partner();
		partner.setCommunicationEmailId(communicationEmailId);
		partner.setContactEmail(contactEmail);
		partner.setBuId(buId);
		partner.setEdit(edit);
		response = partnerSPService.getUniqueCommunicationEmail(partner);
		logger.info(br);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/showTopPartnerList/{user}/{token}")
	public Response showTopPartnerList(@QueryParam("buId") int buId, @QueryParam("userId") int userId,@PathParam("token") String token,
			@PathParam("user") String name) {
		BaseResponse<Partner> br = new BaseResponse<>();
		response = partnerSPService.showTopPartnerList(buId, userId);
		logger.info(br);
		return response;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deletePartner/{user}/{token}")
	public Response deletePartner(@QueryParam("deletelist") String deletelist,@QueryParam("lastmodifyby") int lastmodifyby,
			@PathParam("token") String token, @PathParam("user") String name)
			throws IOException {

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.deletePartner(deletelist,lastmodifyby);
		return response;

	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertBulkPartner/{user}/{token}")
	public Response insertBulkPartner(Partner partner,
			@PathParam("token") String token, @PathParam("user") String name){		
		String bulkPartnerXML=partner.getBulkPartnerXml();
		
		logger.info("Bulk Partner In APP----"+bulkPartnerXML);
		
		List<List<Partner>> recordCount=partnerSPService.insertBulkPartner(bulkPartnerXML);
		logger.info("Partner list in app controller:-----"+recordCount);
		BaseResponse<List<Partner>> br=new BaseResponse<>();
		br.setResponseListObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	

	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/showLoginHistory/{user}/{token}") 
	public Response showLoginHistory(@PathParam("token") String token,
			@PathParam("user") String name, @RequestBody LoginHistory loginHistory) {
		BaseResponse<LoginHistory> br = new BaseResponse<>();
		response = partnerSPService.showLoginHistory(loginHistory.getSearchText(),loginHistory.getUserId()+"");
		logger.info(br);
		return response;
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/sendWelcomeMail/{user}/{token}")
	public Response sendWelcomeMail(Partner partner,
			@PathParam("token") String token, @PathParam("user") String name){		
		String userDataXML=partner.getUserDataXML();
		
		logger.info("sendWelcomeMail In APP----"+userDataXML);
		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.sendWelcomeMail(userDataXML);
		return response;
	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTaskListAssign/{user}/{token}")
	public Response getTaskListAssign(User user,
			@PathParam("token") String token, @PathParam("user") String name){		
		
		
	
		response = partnerSPService.getTaskListAssign(user);
		return response;
	}
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getParnerListforTask/{user}/{token}")
	public Response getParnerListforTask(Task task,
			@PathParam("token") String token, @PathParam("user") String name){		
		
		
	
		response = partnerSPService.getParnerListforTask(task);
		return response;
	}
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTaskDetail/{user}/{token}")
	public Response getTaskDetail(Task task,
			@PathParam("token") String token, @PathParam("user") String name){		
		
		
	
		response = partnerSPService.getTaskDetail(task);
		return response;
	}
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/movePartner/{user}/{token}")
	public Response movePartner(@PathParam("token") String token, @PathParam("user") String name,Partner partner)
			throws IOException {

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.movePartner(partner);
		return response;

	}
	

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerListForChange/{user}/{token}")
	public Response getPartnerListForChange(@PathParam("token") String token, @PathParam("user") String name,Partner partner)
			throws IOException {

		BaseResponse<Integer> br = new BaseResponse<>();
		
		response = partnerSPService.getPartnerListForChange(partner);
		return response;

	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/moveClientOrOpportunity/{user}/{token}")
	public Response moveClientOrOpportunity(@PathParam("token") String token, @PathParam("user") String name,Partner partner)
			throws IOException {

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.moveClientOrOpportunity(partner);
		return response;

	}

	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTasksForAdvisor/{user}/{token}")
	public Response getTasksForAdvisor(Task task) 
	{
	
		Response response = null;
		if (task.getBuPartyId()<= 0) {
			task.setBuPartyId (FiinfraConstants.AXISMFBUID);
		}

		response = partnerSPService.getListOfTask(task.getPartyID(),task.getSubject(),task.getCurrentNodeId());
		return response;
	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getOnboardChecklist/{user}/{token}")
	public Response getOnboardChecklist(@PathParam("token") String token, @PathParam("user") String name,Partner partner)
			throws IOException{
	

		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		response = partnerSPService.getOnboardChecklist(partner);
		return response;
	}
	
		
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTaskAlert/{user}/{token}")
	public Response getTaskAlert(Task task,
			@PathParam("token") String token, @PathParam("user") String name){		
		
		
		response = partnerSPService.getTaskAlert(task);
		return response;
	}
}
