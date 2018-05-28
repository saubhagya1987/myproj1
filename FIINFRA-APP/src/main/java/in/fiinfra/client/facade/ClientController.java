package in.fiinfra.client.facade;


import in.fiinfra.client.service.ClientService;
import in.fiinfra.common.client.ClientData;
import in.fiinfra.common.client.ClientProfileData;


import in.fiinfra.common.opportunity.OpportunityStageData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.FiinfraUtility;

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

@Component
@Path("/client")
public class ClientController{
	@Autowired
	private ClientService clientService;
	Response response;
	private static final Logger logger = Logger.getLogger(ClientController.class);
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientList/{user}/{token}")
	public Response getClientList(@QueryParam("partyId") int partyId,@QueryParam("IsAutoPlan") boolean IsAutoPlan,
			@QueryParam("buId") int buId,@QueryParam("nodeId") int nodeId,@QueryParam("pageNo") int pageNo,@QueryParam("pageSize") int pageSize,@QueryParam("orderBy") String orderBy,@QueryParam("sord") String sord ,@PathParam("token") String token,
			@PathParam("user") String name,@QueryParam("clientValueSearch") String clientValueSearch) throws Exception {
		response = clientService.getClientList(partyId, buId,clientValueSearch,IsAutoPlan,nodeId,pageNo,pageSize,orderBy,sord);
		return response;
//		List<ClientData> clientDatas =  clientService.getClientList(partyId, buId,clientValueSearch,IsAutoPlan,nodeId,pageNo,pageSize,orderBy);  		
//		BaseResponse<ClientData> br=new BaseResponse<>();
//		br.setResponseListObject(clientDatas);
//		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
//		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientStageList/{partyId}/{token}")
	public Response getClientStageList(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("nodeId") int nodeId,@PathParam("token") String token, @PathParam("user") String name) 
	{
		Response response = null;
		BaseResponse<OpportunityStageData> baseResponse = new BaseResponse<OpportunityStageData>();
		baseResponse.setResponseListObject(clientService.getClientStageList(partyId,buId,nodeId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertClientRecord/{user}/{token}")
	public Response insertClientRecord(ClientData clientData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String clientXMLString=FiinfraUtility.getClientXMLString(clientData);
		int buId=clientData.getBuId();
		int partyId=clientData.getOwnerPartyID();
		List<Integer> recordCount=clientService.saveClient(partyId, clientXMLString,clientData.getCreatedBy(), buId);
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientProfileRecord/{user}/{token}")
	public Response getClientProfileRecord(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		ClientProfileData clientProfileData = clientService.getClientProfileRecord(partyId,buId);
		BaseResponse<ClientProfileData> br=new BaseResponse<>();
		br.setResponseObject(clientProfileData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateClientProfile/{user}/{token}")
	public Response updateClientProfile(ClientProfileData clientProfileData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String sectionName=clientProfileData.getSectionName();
		String dataXml=FiinfraUtility.getClientProfileDataXML(clientProfileData, sectionName);
		int buId=clientProfileData.getBuId();
		int partyId=clientProfileData.getPartyId();
		List<Integer> recordCount = clientService.updateClientProfile(sectionName,dataXml,buId,partyId,clientProfileData.getLastModifiedBy());
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteClient/{user}/{token}")
	public Response deleteClient(@QueryParam("partyIds") String partyIds,@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String result = clientService.deleteClient(partyIds,buId,createdBy);
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
	@Path("/getClientListToMerge/{user}/{token}")
	public Response getClientListToMerge(@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("contactpartyId") int contactpartyId,
			@QueryParam("isAllClients") boolean isAllClients,@QueryParam("isFromProfile") boolean isFromProfile, @QueryParam("nodeId") int nodeId ,@PathParam("token") String token, @PathParam("user") String name, @QueryParam("searchString") String searchString ) throws Exception {
		//System.out.println("In App Controller contactpartyId................................"+contactpartyId);
//		logger.debug("clientDatas:---" + partyId);
//		logger.debug("buId:---" + buId);
		List<ClientData> clientDatas =  clientService.getClientListToMerge(partyId, buId,contactpartyId,isAllClients,isFromProfile,nodeId,searchString);  		
		BaseResponse<ClientData> br=new BaseResponse<>();
		//System.out.println("A........................"+clientDatas);
		br.setResponseListObject(clientDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/mergeClients/{user}/{token}")
	public Response mergeClients(@QueryParam("partyId") int partyId,@QueryParam("mergeClientIds") String mergeClientIds,@QueryParam("buId") int buId,@QueryParam("contactPartyId") int contactPartyId, @QueryParam("nodeId") int nodeId ,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String result = clientService.mergeClients(partyId,mergeClientIds,buId,contactPartyId);
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
}
