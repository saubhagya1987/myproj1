package in.fiinfra.portfolio.facade;

import java.io.IOException;
import java.security.Provider.Service;

import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.cp.AchievementScaleData;
import in.fiinfra.cp.AssetData;
import in.fiinfra.cp.FinancialAccountData;
import in.fiinfra.cp.LoanData;
import in.fiinfra.cp.PlanData;
import in.fiinfra.portfolio.service.PortfolioService;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Path("/portfolio")
public class PortfolioController {
	@Autowired
	PortfolioService portfolioService;
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPortfolio/{user}/{token}")
	public Response getListOfPortfolio(@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId) {
		Response response = null;
		BaseResponse<AssetData> baseResponse = new BaseResponse<AssetData>();
		baseResponse.setResponseListObject(portfolioService.getListOfPortfolio(
				buId, partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null); 

		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAsset/{user}/{token}")
	public Response getAsset(@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId,@QueryParam("assetId") int assetId) {
		Response response = null;
		BaseResponse<AssetData> baseResponse = new BaseResponse<AssetData>();
		baseResponse.setResponseObject(portfolioService.getAsset(
				buId, partyId,assetId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFamilyMembers/{user}/{token}")
	public Response getFamilyMembers(@PathParam("token") String token,
			@QueryParam("partyId") int partyId,@QueryParam("buId") int buId) {
		Response response = null;
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(portfolioService.getFamilyMembers(partyId,buId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProducts/{user}/{token}")
	public Response getProducts(@PathParam("token") String token,
			@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@QueryParam("type")  String type ,@QueryParam("searchStr") String searchStr) {
		Response response = null;
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(portfolioService.getProducts(partyId,buId,type,searchStr));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFinancialAccounts/{user}/{token}")
	public Response getFinancialAccounts(@PathParam("token") String token, @QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId) {
		Response response = null;
		BaseResponse<FinancialAccountData> baseResponse = new BaseResponse<FinancialAccountData>();
		baseResponse.setResponseListObject(portfolioService.getFinancialAccounts(buId, partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}


	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPlans/{user}/{token}")
	public Response getPlans(@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId) {
		Response response = null;
		BaseResponse<PlanData> baseResponse = new BaseResponse<PlanData>();
		baseResponse.setResponseListObject(portfolioService.getPlans(buId,
				partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/approvePlans/{user}/{token}")
	public Response approvePlan(@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId, @QueryParam("prodAllocationId") int prodAllocationId,
			@QueryParam("fpActionPlanId") int fpActionPlanId) {
		Response response = null;
		BaseResponse<String> baseResponse = new BaseResponse<String>();
		baseResponse.setResponseObject(portfolioService.approvePlan(partyId, prodAllocationId,fpActionPlanId,buId).toString());
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getLoan/{user}/{token}")
	public Response getLoan(@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId) {
		Response response = null;
		BaseResponse<LoanData> baseResponse = new BaseResponse<LoanData>();
		baseResponse.setResponseListObject(portfolioService.getLoan(buId,
				partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateLoan/{user}/{token}")
	public Response saveLoan(LoanData loanData,
			 @QueryParam("buId") int buId) {

		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		loanData = portfolioService.insertUpdateLoan(buId, loanData);
		if (loanData.getPartyLoanId() != null
				&& loanData.getPartyLoanId() > 0) {
			baseResponse.setResponseObject(loanData.getPartyLoanId());
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse,
					null);
		} else {
			response = FiinfraResponseBuilder
					.getErrorResponse("Unable to Save Loan");
		}
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateLoanAndSaveDC/{user}/{token}")
	public Response saveLoanAndUpdateDC(LoanData loanData,
			 @QueryParam("buId") int buId) {

		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		loanData = portfolioService.insertUpdateLoanAndSaveDC(buId, loanData);
		if (loanData.getPartyLoanId() != null
				&& loanData.getPartyLoanId() > 0) {
			baseResponse.setResponseObject(loanData.getPartyLoanId());
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse,
					null);
		} else {
			response = FiinfraResponseBuilder
					.getErrorResponse("Unable to Save Loan");
		}
		return response;
	}
	
	
 
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/loan/delete/{user}/{token}")
	public Response deleteLoan(@PathParam("token") String token,  @QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("partyLoanId") int partyLoanId) 
	{
		Response response = null;
		String result=portfolioService.deleteLoan(buId, partyId, partyLoanId);
		BaseResponse<String> br = new BaseResponse<String>();
		if(result.equalsIgnoreCase(FiinfraConstants.success)){
			br.setStatus(FiinfraConstants.success);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
		}
		//logger.debug("result:---"+result);
		return response;

		
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/loan/deleteAndUpdateDC/{user}/{token}")
	public Response deleteLoanAndUpdateDc(@PathParam("token") String token,  @QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("loanId") int loanId) 
	{
		Response response = null;
		String result=portfolioService.deleteLoanAndUpdateDC(buId, partyId, loanId);
		BaseResponse<String> br = new BaseResponse<String>();
		if(result.equalsIgnoreCase(FiinfraConstants.success)){
			br.setStatus(FiinfraConstants.success);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
		}
		//logger.debug("result:---"+result);
		return response;

		
	}

	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateAsset/{user}/{token}")
	public Response saveAsset(AssetData asset,
			 @QueryParam("buId") int buId) {

		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		asset = portfolioService.insertUpdateAsset(buId, asset);
		if (asset.getPartyAssetId() != null
				&& asset.getPartyAssetId() > 0) {
			baseResponse.setResponseObject(asset.getPartyAssetId());
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse,
					null);
		} else {
			response = FiinfraResponseBuilder
					.getErrorResponse("Unable to Save Loan");
		}
		return response;
	}
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveAccount/{user}/{token}")
	public Response saveFinancialAccount(FinancialAccountData data,
			 @QueryParam("buId") int buId) {

		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		data = portfolioService.saveFinancialAccount(buId, data);
		return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/loan/asset/{user}/{token}")
	public Response deleteAsset(@PathParam("token") String token,  @QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("assetId") int assetId) 
	{
		Response response = null;
		String result=portfolioService.deleteAsset(buId, partyId, assetId);
		BaseResponse<String> br = new BaseResponse<String>();
		if(result.equalsIgnoreCase(FiinfraConstants.success)){
			br.setStatus(FiinfraConstants.success);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
		}
		//logger.debug("result:---"+result);
		return response;

		
	}
	
	@GET
	@Path(value="/getGoalsForClient/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getGoalsForClient(@QueryParam("partyId") Integer partyId, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<GoalData> baseResponse = new BaseResponse<GoalData>();
		baseResponse.setResponseListObject(portfolioService.getGoalsForClient(partyId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}

	@GET
	@Path(value="/getAchievementScale/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAchievementScale(@QueryParam("partyId") Integer partyId,  @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<AchievementScaleData> baseResponse = new BaseResponse<AchievementScaleData>();
		baseResponse.setResponseObject(portfolioService.getAchievementScale(partyId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getLoanForId/{user}/{token}")
	public Response getLoanForId(@QueryParam("partyLoanId") int partyLoanId,@QueryParam("partyId") int partyId,@QueryParam("buId") int buId)
			throws JsonGenerationException, JsonMappingException, IOException {
		Response response = null;
		LoanData loanData = portfolioService.getLoanForId(partyLoanId,partyId,buId);
		BaseResponse<LoanData> br=new BaseResponse<LoanData>();
		br.setResponseObject(loanData);
		//System.out.println("queryData:--------"+br.getResponseObject());
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	

}
