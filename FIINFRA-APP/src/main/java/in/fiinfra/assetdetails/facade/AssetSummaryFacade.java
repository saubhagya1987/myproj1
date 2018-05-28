package in.fiinfra.assetdetails.facade;

import in.fiinfra.assetdetails.service.AssetSummaryService;
import in.fiinfra.common.diy.models.AssetData;
import in.fiinfra.common.diy.models.AssetSummary;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.PartyGoals;
import in.fiinfra.common.partner.AssetAllocatedToGoal;
import in.fiinfra.common.partner.AssetAvailableValue;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.JsonData;

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
@Path("/assetSumary")
public class AssetSummaryFacade {
	
	@Autowired
	private AssetSummaryService assetSummaryService;
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAssetSummaryForPartyId/{userName}/{partyId}/{token}")
	public Response getAssetSummaryForPartyId( @PathParam("userName") String userName, @PathParam("partyId") String partyId, @PathParam("token") String token, @QueryParam("buId") Integer buId ){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		
		List<AssetAllocatedToGoal> assetSummaryDetails = assetSummaryService.getAssetSummaryForPartyId(partyId);
		BaseResponse<AssetAllocatedToGoal> baseResponse = new BaseResponse<AssetAllocatedToGoal>();
		baseResponse.setResponseListObject(assetSummaryDetails);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
		
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAssetDetailsForPartyId/{userName}/{partyId}/{assetId}/{token}")
	public Response getAssetDetailsForPartyId( @PathParam("userName") String userName, @PathParam("partyId") String partyId, @PathParam("assetId") String assetId, @PathParam("token") String token, @QueryParam("buId") Integer buId ){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AssetSummary> assetDetails = assetSummaryService.getAssetDetailsForPartyId(partyId,assetId);
		BaseResponse<AssetSummary> baseResponse = new BaseResponse<AssetSummary>();
		baseResponse.setResponseListObject(assetDetails);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAssetTypeList/{userName}/{token}")
	public Response getAssetTypeList( @PathParam("userName") String userName, @PathParam("token") String token, @QueryParam("buId") Integer buId ){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> assetTypeList = assetSummaryService.getAssetTypeList();
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(assetTypeList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAssetNameList/{partyId}/{assetTypeId}/{goalId}/{userName}/{token}")
	public Response getAssetTypeList( @PathParam("partyId") Integer partyId, @PathParam("assetTypeId") Integer assetTypeId, @PathParam("goalId") Integer goalId, @PathParam("userName") String userName, @PathParam("token") String token, @QueryParam("buId") Integer buId ){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> assetNameList = assetSummaryService.getAssetNameList(partyId,assetTypeId,goalId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(assetNameList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAssetAvailableValue/{partyAssetId}/{goalId}/{partyId}/{userName}/{token}")
	public Response getAssetAvailableValue( @PathParam("partyAssetId") Integer partyAssetId, @PathParam("userName") String userName, @PathParam("token") String token, @QueryParam("buId") Integer buId, @PathParam("goalId") Integer goalId, @PathParam("partyId") Integer partyId ){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		AssetAvailableValue assetAvailableValue = assetSummaryService.getAssetAvailableValue(partyAssetId, goalId, partyId);
		BaseResponse<AssetAvailableValue> baseResponse = new BaseResponse<AssetAvailableValue>();
		baseResponse.setResponseObject(assetAvailableValue);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	// Display Goals List for Party 
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAssetAllocatedToGoalsList/{partyId}/{userName}/{token}")
	public Response getAssetAllocatedToGoalsList( @PathParam("partyId") Integer partyId, @PathParam("userName") String userName, @PathParam("token") String token, @QueryParam("buId") Integer buId ){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<PartyGoals> assetAllocatedToGoalsList = assetSummaryService.getAssetAllocatedToGoalsList(partyId);
		BaseResponse<PartyGoals> baseResponse = new BaseResponse<PartyGoals>();
		baseResponse.setResponseListObject(assetAllocatedToGoalsList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
		
	//edit Assets Allocated To Goal
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAssetAllocatedToGoalList/{partyId}/{goalId}/{userName}/{token}")
	public Response getAssetAllocatedToGoalList( @PathParam("partyId") Integer partyId, @PathParam("goalId") Integer goalId, @PathParam("userName") String userName, @PathParam("token") String token, @QueryParam("buId") Integer buId ){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AssetAllocatedToGoal> assetAllocatedToGoalList = assetSummaryService.getAssetAllocatedToGoalList(partyId, goalId);
		BaseResponse<AssetAllocatedToGoal> baseResponse = new BaseResponse<AssetAllocatedToGoal>();
		baseResponse.setResponseListObject(assetAllocatedToGoalList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveAssetAllocatedToGoal/{userName}/{token}")
	public Response saveAssetAllocatedToGoal(@PathParam("userName") String userName, @PathParam("token") String token, @RequestBody List<AssetAllocatedToGoal> assetAllocatedToGoalList, @QueryParam("buId") Integer buId) 
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(assetSummaryService.saveAssetAllocatedToGoal(assetAllocatedToGoalList));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProductsForAssets/{productData}/{assetTypeId}/{userName}/{token}")
	public Response getProductsForAssets(@PathParam("productData") String productData, @PathParam("assetTypeId") Integer assetTypeId, @PathParam("userName") String userName, @PathParam("token") String token, @QueryParam("buId") Integer buId){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<KeyValue> assetAllocatedToGoalList = assetSummaryService.getProductAssetList(productData, assetTypeId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(assetAllocatedToGoalList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateAsset/{user}/{token}")
	public Response saveAsset(@RequestBody AssetData asset,
			 @QueryParam("buId") int buId) {

		Response response = null;
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(assetSummaryService.insertUpdateAsset(buId, asset));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse,null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteAsset/{partyAssetId}/{partyId}/{userName}/{token}")
	public Response deleteAsset(@PathParam("partyAssetId") Integer partyAssetId, @PathParam("partyId") String partyId, @PathParam("userName") String userName, @PathParam("token") String token, @QueryParam("buId") Integer buId){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(assetSummaryService.deleteAsset(partyAssetId, partyId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getManufacturer/{productId}/{userName}/{token}")
	public Response getManufacturer(@PathParam("productId") Integer productId, @PathParam("userName") String userName, @PathParam("token") String token, @QueryParam("buId") Integer buId){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		KeyValue result = assetSummaryService.getManufacturer(productId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseObject(result);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFrequency/{codeTypeId}/{userName}/{token}")
	public Response getFrequency( @PathParam("codeTypeId") Integer codeTypeId, @PathParam("userName") String userName, @PathParam("token") String token, @QueryParam("buId") Integer buId ){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<JsonData> result = assetSummaryService.getFrequency(codeTypeId);
		BaseResponse<JsonData> baseResponse = new BaseResponse<JsonData>();
		baseResponse.setResponseListObject(result);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTotalAssetAllocation/{partyId}/{userName}/{token}")
	public Response getTotalAssetAllocation( @PathParam("partyId") String partyId, @PathParam("userName") String userName, @PathParam("token") String token, @QueryParam("buId") Integer buId ){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AssetSummary> result = assetSummaryService.getTotalAssetAllocation(partyId);
		BaseResponse<AssetSummary> baseResponse = new BaseResponse<AssetSummary>();
		baseResponse.setResponseListObject(result);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	// Display Goals List for Party 
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getGoalsAllocatedToAsset/{assetTypeId}/{partyId}/{userName}/{token}")
	public Response getGoalsAllocatedToAsset( @PathParam("assetTypeId") String assetTypeId,
			@PathParam("partyId") String partyId, @PathParam("userName") String userName, @PathParam("token") String token, @QueryParam("buId") Integer buId ){
		
		Response response = null;
		if( buId <= 0 ){
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<PartyGoals> assetAllocatedToGoalsList = assetSummaryService.getGoalsAllocatedToAsset(assetTypeId,partyId);
		BaseResponse<PartyGoals> baseResponse = new BaseResponse<PartyGoals>();
		baseResponse.setResponseListObject(assetAllocatedToGoalsList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFamilyMembers/{user}/{token}")
	public Response getFamilyMembers(@PathParam("token") String token,
			@QueryParam("partyId") Integer partyId,@QueryParam("buId") Integer buId) {
		Response response = null;
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(assetSummaryService.getFamilyMembers(partyId,buId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPieChartForGoal/{partyId}/{user}/{token}")
	public Response getPieChartForGoal(@PathParam("token") String token, @PathParam("user") String userName,
			@PathParam("partyId") Integer partyId,@QueryParam("buId") Integer buId){
		
		Response response = null;
		BaseResponse<AssetSummary> baseResponse = new BaseResponse<AssetSummary>();
		baseResponse.setResponseListObject(assetSummaryService.getPieChartForGoal(partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGoalsForAssets/{partyId}/{assetTypeId}/{user}/{token}")
	public Response getGoalsForAssets( @PathParam("partyId") String partyId, @PathParam("assetTypeId") Integer assetTypeId, @PathParam("token") String token, @PathParam("user") String userName ){
		
		Response response = null;
		List<PartyGoals> resultGoals = assetSummaryService.getGoalsForAssets(partyId,assetTypeId);
		BaseResponse<PartyGoals> baseResponse = new BaseResponse<PartyGoals>();
		baseResponse.setResponseListObject(resultGoals);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);

		return response;
	}
}
