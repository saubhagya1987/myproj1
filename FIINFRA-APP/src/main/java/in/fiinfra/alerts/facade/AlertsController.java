package in.fiinfra.alerts.facade;

import in.fiinfra.common.diy.models.Alerts;
import in.fiinfra.alerts.service.AlertsService;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@Path("/alerts")
public class AlertsController
{
	@Autowired
	AlertsService alertsService;
	
	// get alerts for partyId
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/getAlertsForParty/{username}/{partyId}/{nodeId}/{token}")
	public Response getAlertsForParty(@PathParam("username") String username,@PathParam("partyId") Integer partyId,
			@PathParam("nodeId") Integer nodeId,@PathParam("token") String token) 
	{
		BaseResponse<Alerts> baseResponse = new BaseResponse<Alerts>();
		baseResponse.setResponseObject(alertsService.getAlertsForPartyId(partyId,nodeId));
		baseResponse.setResponseListObject(null);
		baseResponse.setStatus("SUCCESS");
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	
	// get Number of alerts for partyId
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/getNumberOfAlerts/{username}/{partyId}/{nodeId}/{token}")
	public Response getNumberOfalertsForPartyId(@PathParam("username") String username,@PathParam("partyId") Integer partyId,
			@PathParam("nodeId") Integer nodeId,@PathParam("token") String token) 
	{
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(alertsService.getNumberOfAlertsForPartyId(partyId,nodeId));
		baseResponse.setResponseListObject(null);
		baseResponse.setStatus("SUCCESS");
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
}
