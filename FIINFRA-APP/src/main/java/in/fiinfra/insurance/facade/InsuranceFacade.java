package in.fiinfra.insurance.facade;

import in.fiinfra.common.common.InsuranceData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.insurance.service.InsuranceService;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;

@Component
@Path("/insurance")
public class InsuranceFacade {

	@Autowired
	InsuranceService insuranceService;
	
	private static final Logger LOGGER = Logger.getLogger(InsuranceFacade.class);
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getInsuranceForPartyId/{username}/{token}")
	public Response getInsuranceForPartyId(@PathParam("username") String userName,
			@PathParam("token") String token, @QueryParam("buId") Integer buId, @RequestBody InsuranceData insuranceData) {

		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<InsuranceData> insuranceList = insuranceService.getInsuranceForPartyId(insuranceData);
		BaseResponse<InsuranceData> baseResponse = new BaseResponse<InsuranceData>();
		baseResponse.setResponseListObject(insuranceList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertOrUpdateInsurance/{username}/{token}")
	public Response insertOrUpdateInsurance(@PathParam("username") String userName,
			@PathParam("token") String token, @QueryParam("buId") Integer buId, @RequestBody InsuranceData insuranceData) {

		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		Integer result = insuranceService.insertOrUpdateInsurance(insuranceData);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(result);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getInsuranceDetailList/{username}/{token}")
	public Response getInsuranceDetailList(@PathParam("username") String userName,
			@PathParam("token") String token, @QueryParam("buId") Integer buId, @QueryParam("partyId") Integer partyId, @QueryParam("insuranceType") String insuranceTypeIds) {

		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<InsuranceData> insuranceList = insuranceService.getInsuranceDetailList(partyId, insuranceTypeIds);
		BaseResponse<InsuranceData> baseResponse = new BaseResponse<InsuranceData>();
		baseResponse.setResponseListObject(insuranceList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getInsuranceDetail/{username}/{token}")
	public Response getInsuranceDetails(@PathParam("username") String userName,
			@PathParam("token") String token, @QueryParam("buId") Integer buId, @QueryParam("partyId") Integer partyId, @QueryParam("partyInsuranceId") Integer partyInsuranceId) {

		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		InsuranceData insurance = insuranceService.getInsuranceDetails(partyId, partyInsuranceId);
		BaseResponse<InsuranceData> baseResponse = new BaseResponse<InsuranceData>();
		baseResponse.setResponseObject(insurance);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value = "/deleteInsuranceDetails/{user}/{partyId}/{partyInsuranceId}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteGoalForPartyId( @PathParam("user") String user, @PathParam("partyId") Integer partyId, @PathParam("partyInsuranceId") Integer partyInsuranceId, @PathParam("token") String token, @QueryParam("buId") Integer buId, @QueryParam("isAsset") Integer isAsset)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(insuranceService.deleteInsuranceDetails(partyId,partyInsuranceId, isAsset));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	
}
