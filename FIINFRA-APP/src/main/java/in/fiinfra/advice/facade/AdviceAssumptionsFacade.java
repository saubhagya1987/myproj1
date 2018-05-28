package in.fiinfra.advice.facade;

import in.fiinfra.advice.service.AdviceAssumptionsService;
import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.cp.Assumption;

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

import com.sun.jersey.spi.resource.PerRequest;

@Controller
@Path("/advice")
public class AdviceAssumptionsFacade {
	
	@Autowired
	AdviceAssumptionsService adviceAssumptionsService;
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAdvicesForAdvisor/{token}")
	public Response getAdviceAssumptionsForPartyId(@PathParam("token") String token, @QueryParam("buId") Integer buId, @RequestBody PartySettingInput partySettingInput ) 
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AdviceAssumption> adviceAssumptions = adviceAssumptionsService.getAdvicesForPartyId(partySettingInput);
		BaseResponse<AdviceAssumption> baseResponse = new BaseResponse<AdviceAssumption>();
		baseResponse.setResponseListObject(adviceAssumptions);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/saveAdviceForAdvisor/{token}")
	public Response saveOrUpdateAdviceAssumptionsForPartyId( @PathParam("token") String token, @QueryParam("buId") Integer buId, @RequestBody List<AdviceAssumption> adviceAssumptions )
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(adviceAssumptionsService.saveOrUpdateAdvicesForPartyId(adviceAssumptions));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/deleteAdviceForAdvisor/{partyId}/{token}")
	public Response deleteAdviceAssumptionsForPartyId( @PathParam("token") String token, @PathParam("partyId") Integer partyId, @QueryParam("buId") Integer buId)
	{
		Response response = null;
		if(buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(adviceAssumptionsService.deleteAdviceAssumptionForPartyId(partyId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/saveAssumptions/{username}/{token}")
	public Response saveAssumptions(@PathParam("username") String username, @PathParam("token") String token, @QueryParam("partnerPartyId") Integer partnerPartyId, 
			@QueryParam("clientId") Integer clientId, @QueryParam("buId") Integer buId, @RequestBody List<AdviceAssumption> assumtionList)
	{
		Response response = null;
		if(buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(adviceAssumptionsService.saveAssumptions(partnerPartyId,clientId,buId,assumtionList));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
}
