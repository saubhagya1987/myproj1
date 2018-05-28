package in.fiinfra.report.facade;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.ClientActionPlan;
import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.report.service.ReportService;

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
@Path("/report")
public class ReportFacade {
	
	@Autowired
	ReportService reportService;
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getGoalsDetailsForPartyId/{partyId}/{flag}/{user}/{token}")
	public Response getGoalsDetailsForpartyId( @PathParam("partyId") Integer partyId, @PathParam("flag") String flag, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		AdviserGoals adviserGoals = reportService.getGoalsDetailsForPartyId(partyId,flag);
		BaseResponse<AdviserGoals> baseResponse = new BaseResponse<AdviserGoals>();
		baseResponse.setResponseObject(adviserGoals);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getGoalsForPartyId/{partyId}/{user}/{token}")
	public Response getGoalsForPartyId( @PathParam("partyId") Integer partyId, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<GoalData> goalDataList = reportService.getGoalsForPartyId(partyId);
		BaseResponse<GoalData> baseResponse = new BaseResponse<GoalData>();
		baseResponse.setResponseListObject(goalDataList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getPlanningForpartyId/{partyId}/{reportFlag}/{user}/{token}")
	public Response getPlanningForPartyId( @PathParam("partyId") Integer partyId,@PathParam("reportFlag") String reportFlag, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		Suggestion suggestion  = reportService.getPlanningForPartyId(partyId,reportFlag);
		BaseResponse<Suggestion> baseResponse = new BaseResponse<Suggestion>();
		baseResponse.setResponseObject(suggestion);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="getDocumentIdsForPartyId/{partyId}/{user}/{token}")
	public Response getDocumentIdsForPartyId( @PathParam("partyId") Integer partyId, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		Party party = reportService.getDocumentIdsForPartyId(partyId);
		BaseResponse<Party> baseResponse = new BaseResponse<Party>();
		baseResponse.setResponseObject(party);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="insertOrUpdateDocumentIdsForPartyId/{user}/{token}")
	public Response insertOrUpdateDocumentIdsForPartyId( @RequestBody List<Document> documentList, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(reportService.insertOrUpdateDocumentIdsForPartyId(documentList));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAnalysisReportForPartyId/{partyId}/{user}/{token}")
	public Response getAnalysisReportForPartyId( @PathParam("partyId") Integer partyId, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		 List<ClientActionPlan> clientActionPlanList  = reportService.getAnalysisReportForPartyId(partyId);
		BaseResponse<ClientActionPlan> baseResponse = new BaseResponse<ClientActionPlan>();
		baseResponse.setResponseListObject(clientActionPlanList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getAllRecommendationCombination/{partyId}/{sectionTypeId}/{user}/{token}")
	public Response getAllRecommendationCombination( @PathParam("partyId") Integer partyId, @PathParam("sectionTypeId") Integer sectionTypeId, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId ) {
		
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<AdviceRecommendation> adviceRecommendationsList  = reportService.getAllRecommendationCombination(partyId,sectionTypeId);
		BaseResponse<AdviceRecommendation> baseResponse = new BaseResponse<AdviceRecommendation>();
		baseResponse.setResponseListObject(adviceRecommendationsList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/saveAnalysisReportForBatch/{user}/{token}")
	public Response saveAnalysisReportForBatch( @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId,
			@QueryParam("partyId") Integer partyId, @QueryParam("isAnalysisGeneration") Integer isAnalysisGeneration, @QueryParam("isActionPlanGeneration") Integer isActionPlanGeneration, @QueryParam("analysiReportType") Integer analysiReportType, @QueryParam("lastModifiedBy") Integer lastModifiedBy)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(reportService.saveAnalysisReportForBatch(partyId,isAnalysisGeneration,isActionPlanGeneration,analysiReportType,lastModifiedBy));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
}
