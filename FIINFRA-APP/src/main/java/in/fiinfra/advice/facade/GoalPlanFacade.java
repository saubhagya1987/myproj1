package in.fiinfra.advice.facade;

import in.fiinfra.advice.service.GoalPlanService;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
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
@Path("/goalplan")
public class GoalPlanFacade {
	
	@Autowired
	GoalPlanService goalPlanService;
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getRecommendationForAsset/{user}/{token}")
	public Response getRecommendationForAsset(@PathParam("token") String token, @PathParam("user") String name, @RequestBody GoalPlanInput goalPlanInput, @QueryParam("buId") Integer buId)
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AdviceRecommendation> recommendations = goalPlanService.getRecommendationForAsset(goalPlanInput); 
		BaseResponse<AdviceRecommendation> baseResponse = new BaseResponse<AdviceRecommendation>();
		baseResponse.setResponseListObject(recommendations);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getRecommendationForProductType/{user}/{token}")
	public Response getRecommendationForProductType(@PathParam("token") String token, @PathParam("user") String name, @RequestBody GoalPlanInput goalPlanInput, @QueryParam("buId") Integer buId)
	{
		Response response = null;
		if(buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AdviceRecommendation> recommendations = goalPlanService.getRecommendationForProductType(goalPlanInput);
		BaseResponse<AdviceRecommendation> baseResponse = new BaseResponse<AdviceRecommendation>();
		baseResponse.setResponseListObject(recommendations);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getRecommendationForProductCategory/{user}/{token}")
	public Response getRecommendationForProductCategory(@PathParam("token") String token, @PathParam("user") String name, @RequestBody GoalPlanInput goalPlanInput, @QueryParam("buId") Integer buId)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AdviceRecommendation> recommendations = goalPlanService.getRecommendationForProductCategory(goalPlanInput);
		BaseResponse<AdviceRecommendation> baseResponse = new BaseResponse<AdviceRecommendation>();
		baseResponse.setResponseListObject(recommendations);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getCommensionsForProductId/{user}/{token}")
	public Response getCommensionsForProductId( @PathParam("token") String token, @PathParam("user") String user, @RequestBody GoalPlanInput goalPlanInput, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<ProductCommension> productCommension = goalPlanService.getCommensionForProductId(goalPlanInput);
		BaseResponse<ProductCommension> baseResponse = new BaseResponse<ProductCommension>();
		baseResponse.setResponseListObject(productCommension);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAllProductsName/{productData}/{assetClassId}/{productTypeId}/{categoryId}/{user}/{token}")
	public Response getAllProductsName( @PathParam("token") String token, @PathParam("user") String username, 
			@QueryParam("buId") Integer buId, @PathParam("productData") String productData, @PathParam("assetClassId") Integer assetClassId, @PathParam("productTypeId") Integer productTypeId, @PathParam("categoryId") Integer categoryId )
	{
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> productList = goalPlanService.getAllProductsName(assetClassId,productTypeId,categoryId,productData);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(productList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/insertOrUpdateRecommendationForAsset/{user}/{token}")
	public Response insertOrUpdateRecommendationForAsset(@PathParam("token") String token, @PathParam("user") String name, @QueryParam("buId") Integer buId, 
				@RequestBody List<AdviceRecommendation> adviceRecommendations)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(goalPlanService.insertOrUpdateRecommendationForAsset(adviceRecommendations));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/insertOrUpdateRecommendationForProductTypeId/{user}/{token}")
	public Response insertOrUpdateRecommendationForProductTypeId(@PathParam("token") String token, @PathParam("user") String name, @RequestBody List<AdviceRecommendation> adviceRecommendations,
			@QueryParam("buId") Integer buId)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(goalPlanService.insertOrUpdateRecommendationForProductTypeId(adviceRecommendations));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/insertOrUpateRecommendationForProductCategory/{user}/{token}")
	public Response insertOrUpdateRecommendationForProductCategory(@PathParam("token") String token, @PathParam("user") String name, @RequestBody List<AdviceRecommendation> adviceRecommendations,
				@QueryParam("buId") Integer buId)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(goalPlanService.insertOrUpdateRecommendationForProductCategory(adviceRecommendations));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/insertOrUpdateRecommendationForProduct/{user}/{token}")
	public Response insertOrUpdateRecommendationForProduct(@PathParam("token") String token, @PathParam("user") String name, @RequestBody List<AdviceRecommendation> adviceRecommendations,
				@QueryParam("buId") Integer buId)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(goalPlanService.insertOrUpdateRecommendationForProduct(adviceRecommendations));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	// DELETE PRODUCT CATEGORY
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/deleteRecommendationForProductCategory/{FPAdviceRecommendId}/{user}/{token}")
	public Response deleteRecommendationForProductCategory(@PathParam("token") String token, @PathParam("user") String name, @PathParam("FPAdviceRecommendId") String FPAdviceRecommendId, @QueryParam("buId") Integer buId)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(goalPlanService.deleteRecommendationForProductCategory(FPAdviceRecommendId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	
	//set default
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/goalPlanSetDefault/{partyId}/{FPSectionTypeId}/{user}/{token}")
	public Response goalPlanSetDefault(@PathParam("token") String token, @PathParam("user") String name, 
			@PathParam("FPSectionTypeId") String fpSectionTypeId,@PathParam("partyId") String partyId, 
			@QueryParam("buId") Integer buId)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(goalPlanService.resetGoalPlanData(fpSectionTypeId, partyId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	// get Goal Bucket Product Allocation
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="getGoalBucketProductAllocations/{user}/{token}")
	public Response getGoalBucketProductAllocations( @PathParam("token") String token, @PathParam("user") String username, 
			@QueryParam("buId") Integer buId, @RequestBody GoalPlanInput goalPlanInput )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AdviceRecommendation> adviceRecommendationList = goalPlanService.getGoalBucketProductAllocations(goalPlanInput);
		BaseResponse<AdviceRecommendation> baseResponse = new BaseResponse<AdviceRecommendation>();
		baseResponse.setResponseListObject(adviceRecommendationList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	
	// Edit Goal Bucket Product Allocation
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="getEditGoalBucketProductAllocations/{user}/{token}")
	public Response getEditGoalBucketProductAllocation( @PathParam("token") String token, @PathParam("user") String username, 
			@QueryParam("buId") Integer buId, @RequestBody GoalPlanInput goalPlanInput )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AdviceRecommendation> adviceRecommendationList = goalPlanService.getEditGoalBucketProductAllocation(goalPlanInput);
		BaseResponse<AdviceRecommendation> baseResponse = new BaseResponse<AdviceRecommendation>();
		baseResponse.setResponseListObject(adviceRecommendationList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="getProductsForEditGoalBucketAllocation/{productData}/{assetClassId}/{productTypeId}/{categoryId}/{user}/{token}")
	public Response getProductsForEditGoalBucketAllocation( @PathParam("token") String token, @PathParam("user") String username, 
			@QueryParam("buId") Integer buId, @PathParam("productData") String productData, @PathParam("assetClassId") Integer assetClassId, @PathParam("productTypeId") Integer productTypeId, @PathParam("categoryId") Integer categoryId )
	{
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> productList = goalPlanService.getProductsForEditGoalBucketAllocation(assetClassId,productTypeId,categoryId,productData);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(productList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	//set default goal plan
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="goalBucketSetDefault/{partyId}/{riskProfileId}/{goalYearRangeId}/{user}/{token}")
	public Response goalBucketSetDefault(@PathParam("token") String token, @PathParam("user") String name,@PathParam("riskProfileId") String riskProfileId,@PathParam("goalYearRangeId") String goalYearRangeId,@PathParam("partyId") String partyId, 
			@QueryParam("buId") Integer buId)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(goalPlanService.resetGoalBucketData(riskProfileId, goalYearRangeId, partyId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="insertOrUpdateGoalBucketAllocation/{user}/{token}")
	public Response insertOrUpdateGoalBucketAllocation( @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId, @RequestBody List<AdviceRecommendation> adviceRecommendations )
	{
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(goalPlanService.insertOrUpdateGoalBucketAllocation(adviceRecommendations));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
}
