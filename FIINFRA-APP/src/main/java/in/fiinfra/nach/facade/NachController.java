package in.fiinfra.nach.facade;

import in.fiinfra.common.common.NachRequest;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.nach.service.NachService;
import in.fiinfra.pg.AutoPaymentData;
import in.fiinfra.pg.NachData;

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

import com.sun.jersey.api.core.InjectParam;

@Component
@Path("/nach")
public class NachController {
	@Autowired
	NachService service;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNach/{user}/{token}")
	public Response getNachList(@PathParam("token") String token,@InjectParam NachRequest request) {
		Response response = null;
		BaseResponse<NachData> baseResponse = new BaseResponse<NachData>();
		baseResponse
				.setResponseListObject(service.getNachList(request));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNachById/{user}/{token}")
	public Response getNachById(@PathParam("token") String token,
			@QueryParam("userId") int userId,
			@QueryParam("partyId") int partyId, @QueryParam("nachId") int nachId) {
		Response response = null;
		BaseResponse<NachData> baseResponse = new BaseResponse<NachData>();
		baseResponse.setResponseObject(service.getNachById(userId, nachId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveNach/{user}/{token}")
	public Response saveNachList(@PathParam("token") String token,
			@QueryParam("userId") int userId, NachData nach) {
		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		nach = service.insertUpdateNach(userId, nach);

		baseResponse.setResponseObject(nach.getNachId());
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNachByPartyId/{user}/{token}")
	public Response getNachByPartyId(@PathParam("token") String token,
			@QueryParam("userId") int userId, @QueryParam("partyId") int partyId) {
		Response response = null;
		BaseResponse<NachData> baseResponse = new BaseResponse<NachData>();
		baseResponse.setResponseObject(service
				.getNachByPartyId(userId, partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAutoPayment/{user}/{token}")
	public Response getAutoPaymentData(@PathParam("token") String token,
			@InjectParam NachRequest request) {
		Response response = null;
		BaseResponse<AutoPaymentData> baseResponse = new BaseResponse<AutoPaymentData>();
		baseResponse.setResponseListObject(service
				.getAutoPaymentData(request));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/sendAutoPayment/")
	public Response sendAutoPayment(@PathParam("token") String token,
			@InjectParam NachRequest request) {
		Response response = null;
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(service
				.sendAutoPayment(request));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

}
