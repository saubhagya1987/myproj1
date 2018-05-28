package in.fiinfra.analysis.facade;

import in.fiinfra.analysis.service.AnalysisService;
import in.fiinfra.common.diy.models.CashFlowData;
import in.fiinfra.common.diy.models.DcAnalysisHelper;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.utility.GoalData;

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

@Controller
@Path("/analysis")
public class AnalysisFacade {
	
	@Autowired
	AnalysisService analysisService;
		
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAnalysisData/{partyId}/{dataFor}/{user}/{token}")
	public Response getAnalysisData(@PathParam("partyId") Integer partyId,
			@PathParam("user") String user, @PathParam("token") String token,
			@QueryParam("buId") Integer buId,
			@PathParam("dataFor") String dataFor)
	{
		Response response = null;
		DcAnalysisHelper analysisXML = analysisService.getAnalysisData(partyId, dataFor);
		BaseResponse<DcAnalysisHelper> baseResponse = new BaseResponse<DcAnalysisHelper>();
		baseResponse.setResponseObject(analysisXML);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAnalysisForGoals/{partyId}/{goalId}/{sectionId}/{user}/{token}")
	public Response getAnalysisForGoals(@PathParam("partyId") Integer partyId,@PathParam("goalId") Integer goalId,
			@PathParam("sectionId") Integer sectionId,@PathParam("user") String user, @PathParam("token") String token,
			@QueryParam("buId") Integer buId)
	{
		Response response = null;
		GoalData analysisResult = analysisService.getAnalysisForGoals(partyId,goalId,sectionId);
		BaseResponse<GoalData> baseResponse = new BaseResponse<GoalData>();
		baseResponse.setResponseObject(analysisResult);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAnalysisForDashboardGoals/{user}/{token}/{advisorPartyId}/{contactPartyId}")
	public Response getAnalysisForDashboardGoals(@PathParam("advisorPartyId") Integer advisorPartyId,
			@PathParam("contactPartyId") Integer contactPartyId,
			@PathParam("user") String user, @PathParam("token") String token,
			@QueryParam("buId") Integer buId)
	{
		Response response = null;
		Integer analysisResult = analysisService.getAnalysisForDashboardGoals(advisorPartyId, contactPartyId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(analysisResult);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAnalysisForCashFlowData/{partyId}/{user}/{token}")
	public Response getAnalysisForCashFlowData(@PathParam("partyId") Integer partyId,@PathParam("user") String user, @PathParam("token") String token)
	{
		Response response = null;
		CashFlowData cashflowdata = analysisService.getAnalysisForCashFlowData(partyId);
		BaseResponse<CashFlowData> baseResponse = new BaseResponse<CashFlowData>();
		baseResponse.setResponseObject(cashflowdata);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
}
