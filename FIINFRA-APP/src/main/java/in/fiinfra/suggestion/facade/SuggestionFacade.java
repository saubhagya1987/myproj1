package in.fiinfra.suggestion.facade;

import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.suggestion.service.SuggestionService;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@Path("/suggestion")
public class SuggestionFacade {
	
	@Autowired
	SuggestionService suggestionService;
	
	@GET
	@Path(value="/saveSuggestionData/{partyId}/{datafor}/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response saveSuggestionData( @PathParam("partyId") Integer partyId, @PathParam("datafor") String datafor, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 )
		{
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(suggestionService.saveSuggestionData(partyId,datafor));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value="/getSuggestionData/{partyId}/{datafor}/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getSuggestionData( @PathParam("partyId") Integer partyId, @PathParam("datafor") String datafor, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 )
		{
			buId = FiinfraConstants.AXISMFBUID;
		}
		Suggestion suggestion = suggestionService.getSuggestionData(partyId,datafor);
		BaseResponse<Suggestion> baseResponse = new BaseResponse<Suggestion>();
		baseResponse.setResponseObject(suggestion);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Path(value="/getSuggestionForGoal/{partyId}/{goalId}/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getSuggestionForGaols( @PathParam("partyId") Integer partyId, @PathParam("goalId") Integer goalId, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 )
		{
			buId = FiinfraConstants.AXISMFBUID;
		}
		Suggestion suggestion = suggestionService.getSuggestionDataForGoal(partyId,goalId);
		BaseResponse<Suggestion> baseResponse = new BaseResponse<Suggestion>();
		baseResponse.setResponseObject(suggestion);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
}
