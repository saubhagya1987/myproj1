package in.fiinfra.partner.facade;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.facade.CommonController;
import in.fiinfra.common.partner.AssetAllocationOfGoal;
import in.fiinfra.common.partner.GoalDetail;
import in.fiinfra.common.partner.GoalListData;
import in.fiinfra.common.partner.GoalSummeryData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.partner.service.GoalSummeryService;
import in.fiinfra.partner.service.PartnerService;

import javax.ws.rs.GET;
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
@Path("/goalSummery")
public class GoalController {
	@Autowired
	private GoalSummeryService goalSummeryService;
	Response response;
	private static final Logger logger = Logger.getLogger(CommonController.class);
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGoalSummaryDetails/{user}/{token}")
	public Response getGoalSummaryDetails(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("nodeId") int nodeId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:In App getGoalSummaryDetails---" + partyId);
		//System.out.println("partyId:In App getGoalSummaryDetails---" + partyId);
		List<GoalSummeryData> goalSummeryDataList  =new ArrayList<GoalSummeryData>();
		goalSummeryDataList  = goalSummeryService.getGoalSummaryDetails(partyId,buId,nodeId);
		BaseResponse<GoalSummeryData> br=new BaseResponse<>();
		br.setResponseListObject(goalSummeryDataList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	
	/// i am working on this
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGoalDetail/{user}/{token}")
	public Response getGoalDetail(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("type") String type,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:In App getGoalDetail---" + partyId);
		//System.out.println("partyId:In App getGoalDetail---" + partyId);
		List<GoalDetail> goalSummeryDataList  =new ArrayList<GoalDetail>();
		goalSummeryDataList  = goalSummeryService.getGoalDetail(partyId,buId,type);
		BaseResponse<GoalDetail> br=new BaseResponse<>();
		br.setResponseListObject(goalSummeryDataList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAssetAllocation/{user}/{token}")
	public Response getAssetAllocation(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("type") String type,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:In App getGoalDetail---" + partyId);
		//System.out.println("partyId:In App getGoalDetail---" + partyId);
		List<AssetAllocationOfGoal> goalAssetAllocationList  =new ArrayList<AssetAllocationOfGoal>();
		goalAssetAllocationList  = goalSummeryService.getAssetAllocation(partyId,buId,type);
		BaseResponse<AssetAllocationOfGoal> br=new BaseResponse<>();
		br.setResponseListObject(goalAssetAllocationList);
		
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGoalList/{user}/{token}")
	public Response getGoalList(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@QueryParam("condition") String condition,@QueryParam("parameterValue") String parameterValue,@QueryParam("firstElement") String firstElement
			,@QueryParam("lastElement") String lastElement,@QueryParam("nodeId") int nodeId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:In App getGoalList---" + partyId);
		//System.out.println("partyId:In App getGoalList---" + partyId);
		List<GoalListData> goalDataList =new ArrayList<GoalListData>();
		goalDataList  = goalSummeryService.getGoalList(partyId,buId,condition,parameterValue,firstElement,lastElement,nodeId);
		BaseResponse<GoalListData> br=new BaseResponse<>();
		br.setResponseListObject(goalDataList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	

	public GoalSummeryService getGoalSummeryService() {
		return goalSummeryService;
	}

	public void setGoalSummeryService(GoalSummeryService goalSummeryService) {
		this.goalSummeryService = goalSummeryService;
	}
	
}
