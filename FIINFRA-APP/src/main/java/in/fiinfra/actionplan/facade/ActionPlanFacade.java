package in.fiinfra.actionplan.facade;

import in.fiinfra.actionplan.service.ActionPlanService;
import in.fiinfra.common.diy.models.ActionPlan;
import in.fiinfra.common.diy.models.ActionPlanRisk;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductCommension;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;

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
@Path("/actionplan")
public class ActionPlanFacade {
	
	@Autowired
	ActionPlanService actionPlanService;
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getActionPlanData/{partyId}/{goalId}/{goalTypeId}/{investmentType}/{user}/{token}")
	public Response getActionPlanData( @PathParam("partyId") Integer partyId, @PathParam("goalId") Integer goalId, @PathParam("goalTypeId") Integer goalTypeId, 
			@PathParam("investmentType") Integer investmentType,
			@PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 )
		{
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<ActionPlan> actionPlan =  actionPlanService.getActionPlanData(partyId,goalId,goalTypeId,investmentType);
		BaseResponse<ActionPlan> baseResponse = new BaseResponse<ActionPlan>();
		baseResponse.setResponseListObject(actionPlan);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getActionPlanDataForRiskCover/{partyId}/{sectionTypeId}/{user}/{token}")
	public Response getActionPlanDataForRiskCover( @PathParam("partyId") Integer partyId, @PathParam("sectionTypeId") Integer sectionTypeId, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 )
		{
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<ActionPlanRisk> actionPlanRiskList =  actionPlanService.getActionPlanDataForRiskCover(partyId,sectionTypeId);
		BaseResponse<ActionPlanRisk> baseResponse  = new BaseResponse<ActionPlanRisk>();
		baseResponse.setResponseListObject(actionPlanRiskList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/insertOrUpdateActionPlanData/{user}/{token}")
	public Response insertOrUpdateActionPlan(@PathParam("user") String user, @PathParam("token") String token, @RequestBody List<ActionPlan> actionplanList, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(actionPlanService.insertOrUpdateActionPlanData(actionplanList));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="insertOrUpdateActionPlanForRisk/{user}/{token}")
	public Response insertOrUpateActionPlanForRisk( @PathParam("user") String user, @PathParam("token") String token, @RequestBody List<ActionPlanRisk> actionPlanRiskList, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(actionPlanService.insertOrUpdateActionPlanDataForRisk(actionPlanRiskList));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="getProductPremiumAmount/{user}/{token}")
	public Response getProductPremiumAmount( @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId, @RequestBody ActionPlanRisk actionPlanRisk)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		ProductCommension premiumAmount = actionPlanService.getProductPremiumAmount(actionPlanRisk);
		BaseResponse<ProductCommension> baseResponse = new BaseResponse<ProductCommension>();
		baseResponse.setResponseObject(premiumAmount);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="getProductsForRiskId/{riskId}/{dataFor}/{user}/{token}")
	public Response getProductsForRiskId(@PathParam("user") String user, @PathParam("token") String token, @PathParam("riskId") Integer riskId, @PathParam("dataFor") String dataFor, @QueryParam("buId") Integer buId)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> products = actionPlanService.getProductsForRiskCover(riskId,dataFor);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(products);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
}
