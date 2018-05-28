package in.fiinfra.goal.facade;

import in.fiinfra.common.diy.models.AdviserGoalChart;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.goal.service.GoalService;

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
@Path("/goal")
public class GoalFacade {
	
	@Autowired
	GoalService goalService;
	
	@POST
	@Path(value="/saveFutureGoals/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response saveFutureGoals( @PathParam("user") String user, @PathParam("token") String token, @RequestBody GoalData goalData )
	{
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(goalService.saveFutureGoals(goalData));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value="/getFutureGoals/{partyId}/{goalTypeId}/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getFutureGoals( @PathParam("user") String user, @PathParam("token") String token, @PathParam("partyId") Integer partyId, @PathParam("goalTypeId") Integer goalTypeId,  @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<GoalData> goalDataList = goalService.getFutureGoals(partyId,goalTypeId);
		BaseResponse<GoalData> baseResponse = new BaseResponse<GoalData>();
		baseResponse.setResponseListObject(goalDataList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Path(value="/updateFutureGoals/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateFutureGoals( @PathParam("user") String user, @PathParam("token") String token, @RequestBody GoalData goalData, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(goalService.updateFutureGoals(goalData));
		response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value = "/getListOfFutureGoalsForPartyId/{partyId}/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getListOfFutureGoalsForPartyId( @PathParam("user") String user, @PathParam("token") String token, @PathParam("partyId") Integer partyId, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0  ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<GoalData> goalDataList = goalService.getListOfFutureGoalsForPartyId(partyId);
		BaseResponse<GoalData> baseResponse = new BaseResponse<GoalData>();
		baseResponse.setResponseListObject(goalDataList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value="/getFutureGoalForGoalId/{goalId}/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getFutureGoalForGoalId( @PathParam("user") String user, @PathParam("token") String token, @PathParam("goalId") Integer goalId, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		GoalData goalData = goalService.getFutureGoalForGoalId(goalId);
		BaseResponse<GoalData> baseResponse = new BaseResponse<GoalData>();
		baseResponse.setResponseObject(goalData);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value="/getGoalsForAdvisor/{user}/{partyId}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getGoalsForAdviser(@PathParam("partyId") Integer partyId, @PathParam("user") String user, @PathParam("token") String token, @PathParam("goalId") Integer goalId, 
			@QueryParam("buId") Integer buId,@QueryParam("nodeId") String nodeId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<AdviserGoals> baseResponse = new BaseResponse<AdviserGoals>();
		baseResponse.setResponseListObject(goalService.getGoalsForAdviser(partyId,nodeId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value="/getGoalChartForAdvisor/{user}/{partyId}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getGoalChartForAdviser(@PathParam("partyId") Integer partyId, @PathParam("user") String user, @PathParam("token") String token, @PathParam("goalId") Integer goalId, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<AdviserGoalChart> baseResponse = new BaseResponse<AdviserGoalChart>();
		baseResponse.setResponseListObject(goalService.getGoalChartForAdviser(partyId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value = "/getCountOfFutureGoalsForPartyId/{partyId}/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getCountOfFutureGoalsForPartyId( @PathParam("user") String user, @PathParam("token") String token, @PathParam("partyId") Integer partyId, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0  ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		String goalDataCount = goalService.getCountOfFutureGoalsForPartyId(partyId);
		BaseResponse<String> baseResponse = new BaseResponse<String>();
		baseResponse.setResponseObject(goalDataCount);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value = "/getPlanIdForPartyId/{user}/{partyId}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getPlanIdForPartyId( @PathParam("user") String user, @PathParam("partyId") Integer partyId, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0  ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		Integer planId = goalService.getPlanIdForPartyId(partyId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(planId);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value = "/deleteGoalForPartyId/{user}/{partyId}/{goalId}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteGoalForPartyId( @PathParam("user") String user, @PathParam("partyId") Integer partyId, @PathParam("goalId") Integer goalId, @PathParam("token") String token, @QueryParam("buId") Integer buId,@QueryParam("lastModifiedBy") Integer lastModeifiedBy)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(goalService.deleteGoalForGoalId(partyId,goalId,buId,lastModeifiedBy));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value="/saveAssetAllocationForRetriement/{partyId}/{lastModifiedBy}/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response saveAssetAllocationForRetriement( @PathParam("user") String user, @PathParam("partyId") Integer partyId, @PathParam("lastModifiedBy") Integer lastModifiedBy, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(goalService.saveAssetAllocationForRetriement(partyId,lastModifiedBy,buId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value="/getNumberOfGoalsForGoalTypeID/{username}/{goalTypeId}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getNumberOfGoalsForGoalTypeID( @PathParam("username") String username,@PathParam("goalTypeId") Integer goalTypeId,@PathParam("token") String token,
			@QueryParam("buId") Integer buId,@QueryParam("partyId") Integer partyID )
	{
		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(goalService.getNumberOfGoalsForGoalTypeID(partyID, goalTypeId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Path(value="/saveGoalPriority/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response saveGoalPriority( @PathParam("user") String user, @PathParam("token") String token, @QueryParam("partyId") Integer partyId, @RequestBody List<GoalData> goalDataList, @QueryParam("buId") Integer buId, @QueryParam("userId") Integer userId)
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(goalService.saveGoalPriority(goalDataList,partyId,buId,userId));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
}
