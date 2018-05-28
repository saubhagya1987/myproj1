package in.fiinfra.party.facade;

import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.party.service.PartyService;

import java.util.List;

import javax.print.attribute.standard.Media;
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
import org.springframework.web.bind.annotation.RequestBody;

@Component
@Path("/party")
public class PartyFacade {

	@Autowired
	PartyService partyService;
	
	private static final Logger LOGGER = Logger.getLogger(PartyFacade.class);
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getContactsForAdvisor/{username}/{advisorPartyId}/{token}")
	public Response getContactsForAdvisor(@PathParam("username") String userName,@PathParam("advisorPartyId") Integer advisorPartyId,
			@PathParam("token") String token, @QueryParam("buId") Integer buId) {

		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<PartySearchCriteria> partyList = partyService.getAllPartiesForAdvisor(advisorPartyId);
		BaseResponse<PartySearchCriteria> baseResponse = new BaseResponse<PartySearchCriteria>();
		baseResponse.setResponseListObject(partyList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}

	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getContactsForSearchCriteria/{username}/{token}")
	public Response getContactsForSearchCriteria(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") Integer buId,
			 @QueryParam("nodeId") String nodeId,@RequestBody PartySearchCriteria partySearchCriteria) 
	{

		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<PartySearchCriteria> partyList = partyService.getAllPartiesForSearchCriteria(partySearchCriteria,nodeId);
		BaseResponse<PartySearchCriteria> baseResponse = new BaseResponse<PartySearchCriteria>();
		baseResponse.setResponseListObject(partyList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAutoPlanClients/{username}/{token}")
	public Response getAutoPlanClients(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") Integer buId,
			@RequestBody PartySearchCriteria partySearchCriteria) 
	{

		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<PartySearchCriteria> partyList = partyService.getAutoPlanClients(partySearchCriteria);
		BaseResponse<PartySearchCriteria> baseResponse = new BaseResponse<PartySearchCriteria>();
		baseResponse.setResponseListObject(partyList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartyProfile/{username}/{partyId}/{token}")
	public Response getPartyProfileForPartyId(@PathParam("username") String userName,@PathParam("partyId") Integer partyId,
			@PathParam("token") String token, @QueryParam("buId") int buId) {
	
		
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		Party party = partyService.getParty(partyId);

		BaseResponse<Party> baseResponse = new BaseResponse<Party>();	
		baseResponse.setResponseObject(party);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		
		return response;		
	}
	
	@POST
	@Path(value = "/update/{username}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateParty(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") Integer buId, @RequestBody Party party) {
		LOGGER.debug("request for create party arrived");
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();	
		baseResponse.setResponseObject(new Boolean(true));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		partyService.updatePartyDetails(party);
		LOGGER.debug("party updated successfully");
		return response;	
	}	
	
	@POST
	@Path(value="/saveParty/{username}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response saveParty(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") Integer buId,@RequestBody Party party)
	{
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(partyService.saveParty(party));
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		party.setBuPartyId(buId);//set BUid as BuPartyID
		return response;
	}
	
	@POST
	@Path(value="/deleteParty/{username}/{listOFParty}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteParty(@PathParam("username") String userName,@PathParam("listOFParty") String listOFParty,@PathParam("token") String token, @QueryParam("buId") Integer buId)
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(partyService.deleteParty(listOFParty));
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Path(value="/activateDCT/{username}/{listOFParty}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response activateDCT(@PathParam("username") String userName,@PathParam("listOFParty") String listOFParty,@PathParam("token") String token, @QueryParam("buId") Integer buId,
			@QueryParam("userId") Integer userId)
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(partyService.activateDCT(listOFParty,userId));
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value="/getFamilyMembersForPartyId/{username}/{token}/{partyId}/{recordTypeId}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getFamilyMembersForPartyIdAndRecordTypeId( @PathParam("username") String username, @PathParam("token") String token,@PathParam("partyId") Integer partyId, @PathParam("recordTypeId") Integer recordTypeId,@QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			
		}
		List<JsonData> familyMemberList = partyService.getFamilyMembers(partyId, recordTypeId);
		BaseResponse<JsonData> baseResponse = new BaseResponse<JsonData>();
		baseResponse.setResponseListObject(familyMemberList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Path(value = "/updateContact/{username}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response updatePartyForContact(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") Integer buId, @RequestBody Party party) {
		LOGGER.debug("request for create party arrived");
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();	
		baseResponse.setResponseObject(new Boolean(true));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		partyService.updatepartyForContact(party);
		LOGGER.debug("party updated successfully");
		return response;	
	}
	
	@GET
	@Path(value="/validatePanNumber/{username}/{panNo}/{partyId}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response validatePanNumber( @PathParam("panNo") String panNo, @PathParam("partyId") Integer partyId, @PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		String msg = partyService.getValidatePanNumber(panNo,partyId);
		BaseResponse<String> baseResponse = new BaseResponse<String>();
		baseResponse.setResponseObject(msg);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value="/deleteFamilyMember/{username}/{partyId}/{familyPartyId}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteFamilyMember( @PathParam("partyId") Integer partyId, @PathParam("familyPartyId") Integer familyPartyId, @PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		Integer result = partyService.deleteFamilyMemmberForPArtyId(partyId, familyPartyId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(result);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value="/insertEntryForXray/{username}/{partyId}/{userId}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response insertEntryForXray(@PathParam("username") String userName,@PathParam("partyId") Integer partyId,@PathParam("userId") Integer userId,@PathParam("token") String token)
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(partyService.insertEntryForXray(partyId,userId));
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Path(value = "/updatePartyAttributeForPartyId/{username}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response updatePartyAttributeForPartyId(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") Integer buId, @RequestBody List<PartyAttribute> partyAttributes,@QueryParam("partyId")Integer partyId) {
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();			
		baseResponse.setResponseObject(partyService.updatePartyAttributeForPartyId(partyAttributes,partyId));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;	
	}
	
	
	@GET
	@Path(value="/getPartyAttributeForPartyId/{username}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getPartyAttributeForPartyId( @PathParam("username") String username, @PathParam("token") String token,@QueryParam("partyId") Integer partyId,@QueryParam("buId") Integer buId,@QueryParam("attributeCodeIds") String attributeCodeIds )
	{
		Response response = null;
		if( buId <= 0 ) {
			
		}
		List<PartyAttribute> partyAttributes = partyService.getPartyAttributeForPartyId(partyId,attributeCodeIds);
		BaseResponse<PartyAttribute> baseResponse = new BaseResponse<PartyAttribute>();
		baseResponse.setResponseListObject(partyAttributes);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
}
