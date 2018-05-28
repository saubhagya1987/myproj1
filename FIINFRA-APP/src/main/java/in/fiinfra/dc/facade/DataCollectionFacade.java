package in.fiinfra.dc.facade;

import in.fiinfra.common.diy.models.DcInputData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.dc.service.DataCollectionService;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@Path("/dc")
public class DataCollectionFacade {

	@Autowired
	DataCollectionService dataCollectionService;
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/createFpPlan/{PartyId}/{token}")
	public Response createFpPlan(@PathParam("PartyId") Integer partyId,
			@PathParam("token") String token, @QueryParam("buId") Integer buId) 
	{	
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(dataCollectionService.createFpPlan(partyId));
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDcInputData/{PartyId}")
	public Response getDataCollectionData(@PathParam("PartyId") Integer partyId,
			@PathParam("token") String token, @QueryParam("buId") Integer buId, 
			@RequestBody List<Integer> attributeCodeIds) 
	{	
		BaseResponse<DcInputData> baseResponse = new BaseResponse<DcInputData>();
		baseResponse.setResponseObject(null);
		baseResponse.setResponseListObject(dataCollectionService.getDcInputData(partyId, attributeCodeIds));
		baseResponse.setStatus("SUCCESS");
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveOrUpdateDcInputData/{token}")
	public Response saveOrUpdateDcInputData(@PathParam("token") String token, @QueryParam("buId") Integer buId, 
			@RequestBody List<DcInputData> dcInputDataList) 
	{	
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(dataCollectionService.saveOrUpdateDcInputData(dcInputDataList));
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getRelationshipIdForPartyId/{partyId}/{token}")
	public Response getRelationshipIdForPartyId( @PathParam("partyId") Integer partyId, 
			@PathParam("token") String token,@QueryParam("buId") Integer buId) {
		BaseResponse<KeyValue> baseResponce  = new BaseResponse<KeyValue>();
		List<KeyValue> realtions = dataCollectionService.getRelationshipIdForPartyId(partyId);
		baseResponce.setResponseListObject(realtions);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponce,null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateFpPlanActivityTracker/{currentStatus}/{partyId}/{token}")
	public Response updateFpPlanActivityTracker(@PathParam("currentStatus") Integer currentStatus,@PathParam("partyId") Integer partyId, 
			@PathParam("token") String token,@QueryParam("buId") Integer buId) {
		BaseResponse<Boolean> baseResponce  = new BaseResponse<Boolean>();
		dataCollectionService.updateFpPlanActivityTracker(currentStatus, partyId);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponce,null);
		return response;
	}	
}
