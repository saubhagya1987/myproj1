package in.fiinfra.advice.facade;

import in.fiinfra.advice.service.AdviceRecommendationService;
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
// Tax , Vacation, Succession
@Controller
@Path("/adviceRecommendation")
public class AdviceRecommendationFacade {
	
	@Autowired
	AdviceRecommendationService adviceRecommendationService;
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProductCategories/{typeId}/{token}")
	public Response getProductCategories(@PathParam("typeId") Integer typeId,@PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> productTypesList = adviceRecommendationService.getProductCategoriesForProductId(typeId); 
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(productTypesList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProductsName/{manufacturedId}/{categoryId}/{token}")
	public Response getProductsName(@PathParam("manufacturedId") Integer manufacturedId,@PathParam("categoryId") Integer categoryId,
			@PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> ProductNamesList = adviceRecommendationService.getProductsForCategoryAndManufacturer(manufacturedId, categoryId); 
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(ProductNamesList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCompanyName/{categoryId}/{token}")
	public Response getCompanyName(@PathParam("categoryId") Integer categoryId,@PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> CompanyNamesList = adviceRecommendationService.getCompaniesForProductCategory(categoryId); 
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(CompanyNamesList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveAdviceRecommendations/{token}")
	public Response saveAdviceRecommendations(@PathParam("token") String token, @RequestBody List<AdviceRecommendation> adviceRecommendations, @QueryParam("buId") Integer buId) 
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(adviceRecommendationService.saveAdviceRecommendation(adviceRecommendations));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAdviceRecommendations/{token}")
	public Response getAdviceRecommendations(@PathParam("token") String token, @RequestBody GoalPlanInput goalPlanInput, @QueryParam("buId") Integer buId)	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AdviceRecommendation> adviceRecommendations = adviceRecommendationService.getAdviceRecommendations(goalPlanInput);
		BaseResponse<AdviceRecommendation> baseResponse = new BaseResponse<AdviceRecommendation>();
		baseResponse.setResponseListObject(adviceRecommendations);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
}
