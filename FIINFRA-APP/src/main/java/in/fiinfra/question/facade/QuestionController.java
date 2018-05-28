package in.fiinfra.question.facade;

import java.util.ArrayList;

import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.utility.XrayData;
import in.fiinfra.question.AnswerData;
import in.fiinfra.question.QuestionData;
import in.fiinfra.question.service.QuestionService;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Path("/question")
public class QuestionController {
	@Autowired
	QuestionService questionService;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getListOfQuestions/{user}/{token}")
	public Response getListOfQuestions(@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId,@QueryParam("sourceSystemId") int sourceSystemId,
			@QueryParam("questionType") int questionType 
			) {
		Response response = null;
		BaseResponse<QuestionData> baseResponse = new BaseResponse<QuestionData>();
		baseResponse.setResponseListObject(questionService.getQuestions(buId,sourceSystemId,questionType,partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveAnswer/{user}/{token}")
	public Response saveAnswer(@PathParam("token") String token,
			AnswerData answer, @QueryParam("buId") int buId) {
		Response response = null;
		BaseResponse<AnswerData> baseResponse = new BaseResponse<AnswerData>();
		baseResponse.setResponseObject(questionService.saveQuestionAnswer(buId,answer));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPolls/{user}/{token}")
	public Response getListOfPolls(@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId,@QueryParam("sourceSystemId") int sourceSystemId) {
		Response response = null;
		BaseResponse<QuestionData> baseResponse = new BaseResponse<QuestionData>();
		baseResponse.setResponseListObject(questionService.getPolls(buId,sourceSystemId,partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/savePolls/{user}/{token}")
	public Response savePolls(@PathParam("token") String token,
		AnswerData answer, @QueryParam("buId") int buId) {
		Response response = null;
		BaseResponse<AnswerData> baseResponse = new BaseResponse<AnswerData>();
		baseResponse.setResponseObject(questionService.savePollsAnswer(buId, answer));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertXray/{user}/{token}")
	public Response insertXray(@PathParam("token") String token,
			XrayData xrayData) {
		Response response = null;
		ArrayList<Integer> lstResult = new ArrayList<Integer>();
		lstResult =questionService.insertXray(xrayData.getPartyId(),xrayData.getBuId(),xrayData.getXmlString(),xrayData.getLastmodifiedBy());
		BaseResponse<Integer> br=new BaseResponse<Integer>();
		br.setResponseListObject(lstResult);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		//System.out.println("recordcount:--------"+br.getResponseObject());
		return response;
	}

}
