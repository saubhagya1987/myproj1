package in.fiinfra.utility.facade;

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.utility.CurrentFinancialStatusData;
import in.fiinfra.common.utility.DCOutputData;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.common.utility.SectionData;
import in.fiinfra.utility.service.DCService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
@Path("/utility")
public class DCController {
	@Autowired
	private DCService dcService;
	Response response;
	private static final Logger logger = Logger.getLogger(DCController.class);
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDCPersonalInformationRecord/{user}/{token}")
	public Response getDCPersonalInformationRecord(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		OpportunityData opportunityData = dcService.getDCPersonalInformationDetails(partyId,buId);
		//System.out.println("In APP====="+opportunityData.getHuf());
		BaseResponse<OpportunityData> br=new BaseResponse<>();
		br.setResponseObject(opportunityData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDCFutureFinancialExpectationsList/{user}/{token}")
	public Response getDCFutureFinancialExpectationsList(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		List<GoalData> goalDataList = dcService.getDCFutureFinancialExpectationsList(partyId,buId);
		BaseResponse<GoalData> br=new BaseResponse<>();
		br.setResponseListObject(goalDataList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateDCPersonalInformationRecord/{user}/{token}")
	public Response updateDCPersonalInformationRecord(OpportunityData opportunityData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String dataXml=FiinfraUtility.getOpportunityDataXML(opportunityData);
		//System.out.println("Data xml====="+dataXml);
		int buId=opportunityData.getBuId();
		int partyId=opportunityData.getPartyId();
		List<Integer> returnResultList= new ArrayList<Integer>();
		returnResultList = dcService.updateDCPersonalInformationRecord(dataXml,buId,partyId,opportunityData.getLastModifiedBy());
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(returnResultList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertDcFinancialStatusRecord/{user}/{token}")
	public Response insertDcFinancialStatusRecord(
			CurrentFinancialStatusData currentFinancialStatusData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + currentFinancialStatusData.getPartyId());
		logger.debug("XMlString:---" + currentFinancialStatusData.getXMLString());
		int recordCount =dcService.insertDcFinancialStatusRecord(currentFinancialStatusData.getPartyId(),currentFinancialStatusData.getBuId(),currentFinancialStatusData.getXMLString(),currentFinancialStatusData.getQuestionBankId(),currentFinancialStatusData.getSectionTypeId());
		BaseResponse<Integer> br=new BaseResponse<Integer>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		//System.out.println("recordcount:--------"+br.getResponseObject());
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFinancialStatusList/{user}/{token}")
	public Response getFinancialStatusList(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@QueryParam("sectionTypeId") int sectionTypeId,@QueryParam("questionBankId") int questionBankId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:getFinancialStatusList : APP---" + partyId);
		
		 List<QuestionDetails> questionDetails = dcService.getFinancialStatusList(partyId,buId,sectionTypeId);
		 //System.out.println("questionDatas in APP========"+questionDetails);
		 BaseResponse<QuestionDetails> br=new BaseResponse<>();
			br.setResponseListObject(questionDetails);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
			return response;
	}
	
	

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateDCFutureFinancialExpectationsList/{user}/{token}")
	public Response updateDCFutureFinancialExpectationsList(GoalData goalData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String dataXml=goalData.getGoalDataXml();
		int buId=goalData.getBuId();
		int partyId=goalData.getPartyId();
		int recordCount = dcService.updateDCFutureFinancialExpectationsList(dataXml,buId,partyId,goalData.getLastModifiedBy());
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFamilyMemberList/{user}/{token}")
	public Response getFamilyMemberList(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:getFinancialStatusList : APP---" + partyId);
		
		 List<UserData> userDetails = dcService.getFamilyMemberList(partyId,buId);
		 //System.out.println("userDetails in APP========"+userDetails);
		 BaseResponse<UserData> br=new BaseResponse<>();
			br.setResponseListObject(userDetails);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
			return response;
	}

	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/submitDcInput/{user}/{token}")
	public Response submitDcInput(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,
			@QueryParam("isAnalysisReportGenration") boolean isAnalysisReportGenration,@QueryParam("isActionPlanGeneration") boolean isActionPlanGeneration,
			@QueryParam("analysisReportType") int analysisReportType,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		//System.out.println("party id in App submitDcInput================"+partyId);
		int recordCount = dcService.submitDcInput(partyId,buId,createdBy,isAnalysisReportGenration,isActionPlanGeneration,analysisReportType);
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/displayCashFlowBar/{user}/{token}")
	public Response displayCashFlowBar(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		//System.out.println("party id in App submitDcInput================"+partyId);
		String [] cash; 
		cash = dcService.displayCashFlowBar(partyId,buId);
		 BaseResponse br=new BaseResponse();
		 br.setResponseObject(cash);
		 response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		 return response;
	}
	
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/showAnalysisReportPDF/{user}/{token}")
	public Response showAnalysisReportPDF(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		//System.out.println("party id in App submitDcInput================"+partyId);
		DCOutputData ouput;
		ouput = dcService.showAnalysisReportPDF(partyId,buId,createdBy);
		 BaseResponse<DCOutputData> br=new BaseResponse<DCOutputData>();
		 br.setResponseObject(ouput);
		 response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		 return response;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/checkMinimumDataForAnalysisReport/{user}/{token}")
	public Response checkMinimumDataForAnalysisReport(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,
			@PathParam("token") String token, @PathParam("user") String name)throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:getFinancialStatusList : APP---" + partyId);
		SectionData sectionData = dcService.checkMinimumDataForAnalysisReport(partyId,buId,createdBy);
		 //System.out.println("sectionData in APP========"+sectionData.getGoalCount());
		 BaseResponse<SectionData> br=new BaseResponse<>();
			br.setResponseObject(sectionData);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
			return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSectionsToShowInDC/{user}/{token}")
	public Response getSectionsToShowInDC(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:getFinancialStatusList : APP---" + partyId);
		List<Integer> objSectionSpecificDcData = dcService.getSectionsToShowInDC(partyId,buId);
		 //System.out.println("PartyAttributeDatas in APP========"+objSectionSpecificDcData);
		 BaseResponse<Integer> br=new BaseResponse<>();
			br.setResponseListObject(objSectionSpecificDcData);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
			return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getLIForAllMethods/{user}/{token}")
	public Response getLIForAllMethods(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:getFinancialStatusList : APP---" + partyId);
		List<String> resultList = dcService.getLIForAllMethods(partyId,buId);
		 BaseResponse<String> br=new BaseResponse<>();
			br.setResponseListObject(resultList);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
			return response;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateLIMethod/{user}/{token}")
	public Response updateLIMethod(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,@QueryParam("liMethodSelect") int liMethodSelect,@QueryParam("lastModifiedBy") int lastModifiedBy,
			@PathParam("token") String token, @PathParam("user") String name)throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:getFinancialStatusList : APP---" + partyId);
		Integer recordCount = dcService.updateLIMethod(partyId,buId,liMethodSelect,lastModifiedBy);
		 BaseResponse<Integer> br=new BaseResponse<>();
			br.setResponseObject(recordCount);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
			return response;
	}
	
	
	
}
