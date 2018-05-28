package in.fiinfra.advice.facade;

import in.fiinfra.advice.service.RecommendationService;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
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
// emergency, life and general risk cover
@Controller
@Path("/recommendation")
public class RecommendationFacade {
	
	@Autowired
	RecommendationService recommendationService;
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getProductCategory/{user}/{ProductTypeId}/{token}")
	public Response getProductCategory( @PathParam("user") String user, @PathParam("ProductTypeId") Integer ProductTypeId, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> CategoryList = recommendationService.getProductCategory(ProductTypeId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(CategoryList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getProductCompanyName/{user}/{categoryId}/{token}")
	public Response getProductCompanyName( @PathParam("user") String user, @PathParam("categoryId") Integer categoryId, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> CompanyNameList = recommendationService.getProductCompanyName(categoryId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(CompanyNameList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProductsForProductCategory/{user}/{categoryId}/{manufacturedId}/{token}")
	public Response getProductsForProductCategory( @PathParam("user") String user, @PathParam("categoryId") Integer categoryId, @PathParam("manufacturedId") Integer manufacturedId, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> ProductsList = recommendationService.getProductsForCategory(categoryId,manufacturedId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(ProductsList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	//get emnergency recommendation
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getRecommendations/{user}/{token}")
	public Response getRecommendations( @PathParam("user") String user, @RequestBody GoalPlanInput goalPlanInput, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AdviceRecommendation> adviceRecommendations = recommendationService.getRecommendations(goalPlanInput);
		BaseResponse<AdviceRecommendation> baseResponse = new BaseResponse<AdviceRecommendation>();
		baseResponse.setResponseListObject(adviceRecommendations);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	// insert or update emergency recommendation
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/insertOrUpdateRecommendations/{user}/{token}")
	public Response insertOrUpdateRecommendations(@PathParam("user") String user,@PathParam("token") String token, @RequestBody List<AdviceRecommendation> adviceRecommendations, @QueryParam("buId") Integer buId) 
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(recommendationService.insertOrUpdateAdviceRecommendation(adviceRecommendations));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="insertOrUpdateRecommendationForLifeRiskCover/{user}/{token}")
	public Response insertOrUpdateRecommendationForLifeRiskCover( @PathParam("user") String user,@PathParam("token") String token, @RequestBody List<AdviceRecommendation> adviceRecommendations, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(recommendationService.insertOrUpdateAdviceRecommendationForLifeRiskCover(adviceRecommendations));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="insertOrUpdateAdviceRecommendationForGeneralRiskCover/{user}/{token}")
	public Response insertOrUpdateAdviceRecommendationForGeneralRiskCover( @PathParam("user") String user,@PathParam("token") String token, @RequestBody List<AdviceRecommendation> adviceRecommendations, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(recommendationService.insertOrUpdateAdviceRecommendationForGeneralRiskCover(adviceRecommendations));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	 @Produces(MediaType.APPLICATION_JSON)
	 @Path(value="/RiskCoverSetDefault/{partyId}/{FPSectionTypeId}/{ProductTypeId}/{CategoryId}/{user}/{token}")
	 public Response RiskCoverSetDefault(@PathParam("token") String token, @PathParam("user") String name, 
	   @PathParam("FPSectionTypeId") String fpSectionTypeId,@PathParam("ProductTypeId") String productTypeId, @PathParam("CategoryId") String CategoryId ,@PathParam("partyId") String partyId, 
	   @QueryParam("buId") Integer buId)
	 {
	  Response response = null;
	  if( buId <= 0 ) {
	   buId = FiinfraConstants.AXISMFBUID;
	  }
	  BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
	  baseResponse.setResponseObject(recommendationService.RiskCoverSetDefault(fpSectionTypeId, productTypeId, CategoryId, partyId));
	  response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
	  return response;
	 }
}
