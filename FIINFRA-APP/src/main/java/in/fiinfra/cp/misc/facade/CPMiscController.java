package in.fiinfra.cp.misc.facade;

import in.fiinfra.common.common.GupShupCommentData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.cp.AlertData;
import in.fiinfra.cp.BroadcastData;
import in.fiinfra.cp.CalenderData;
import in.fiinfra.cp.GupShupData;
import in.fiinfra.cp.LikeData;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.cp.misc.service.CPMiscService;

import javax.ws.rs.Consumes;
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
@Path("/misc")
public class CPMiscController {
	@Autowired
	CPMiscService service;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTestimonials/{user}/{token}")
	public Response getListOfTestimonials(@PathParam("token") String token,
			@QueryParam("buId") int buId, @QueryParam("partyId") int partyId,
			@QueryParam("page") int page, @QueryParam("rows") int rows) {
		Response response = null;
		BaseResponse<TestimonialData> baseResponse = new BaseResponse<TestimonialData>();
		baseResponse.setResponseListObject(service.getTestimonials(buId,
				partyId, page, rows));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTestimonialId/{user}/{token}")
	public Response getListOfTestimonialId(@PathParam("token") String token,
			@QueryParam("buId") int buId, @QueryParam("partyId") int partyId,
			@QueryParam("page") int page, @QueryParam("rows") int rows) {
		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseListObject(service.getTestimonialIds(buId,
				partyId, page, rows));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertComment/{user}/{token}")
	public Response insertComment(GupShupCommentData gupShupCommentData,
			@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId)
			throws Exception {
		Response response = null;
		gupShupCommentData = service.insertComment(buId, gupShupCommentData);
		BaseResponse<GupShupCommentData> br = new BaseResponse<>();
		br.setResponseObject(gupShupCommentData);
		response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertLike/{user}/{token}")
	public Response insertLike(LikeData likeData,
			@PathParam("token") String token, @QueryParam("buId") int buId)
			throws Exception {
		Response response = null;
		likeData = service.addLike(buId, likeData);
		BaseResponse<LikeData> br = new BaseResponse<>();
		br.setResponseObject(likeData);
		response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGupShup/{user}/{token}")
	public Response getGupShup(@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId,
			@QueryParam("page") int page, @QueryParam("rows") int rows) {
		Response response = null;
		BaseResponse<GupShupData> baseResponse = new BaseResponse<GupShupData>();
		baseResponse.setResponseListObject(service.getGupShup(partyId, buId,
				page, rows));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGupShupIds/{user}/{token}")
	public Response getGupShupIds(@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId) {
		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse
				.setResponseListObject(service.getGupShupIds(buId,partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGupShupById/{user}/{token}")
	public Response getGupShupById(@PathParam("token") String token, @QueryParam("buId") int buId,
			@QueryParam("postId") int postId, @QueryParam("partyId") int partyId) {
		Response response = null;
		BaseResponse<GupShupData> baseResponse = new BaseResponse<GupShupData>();
		baseResponse.setResponseObject(service.getGupShupById(buId, postId, partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTestimonialById/{user}/{token}")
	public Response getTestimonialById(@PathParam("token") String token,@QueryParam("buId") int buId,
			@QueryParam("testimonialId") int testimonialId,
			@QueryParam("partyId") int partyId, @QueryParam("page") int page) {
		Response response = null;
		BaseResponse<TestimonialData> baseResponse = new BaseResponse<TestimonialData>();
		baseResponse.setResponseObject(service.getTestimonialById(
				buId, testimonialId, partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertGupShupComment/{user}/{token}")
	public Response insertGupShupComment(int buId,
			GupShupCommentData gupShupCommentData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		gupShupCommentData = service.saveGupshupComment(buId,
				gupShupCommentData);
		BaseResponse<GupShupCommentData> br = new BaseResponse<GupShupCommentData>();
		br.setResponseObject(gupShupCommentData);
		return null;
	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/insertTestimonial/{user}/{token}")
	public Response insertTestimonial(TestimonialData testimonialData,
			@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId)
			throws Exception {
		Response response = null;

		testimonialData = service.insertTestimonial(buId, testimonialData);
		BaseResponse<TestimonialData> br = new BaseResponse<>();
		br.setResponseObject(testimonialData);
		response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getBroadcastList/{user}/{token}")
	public Response getBroadcastList(@PathParam("token") String token,
			@QueryParam("buId") int buId, @QueryParam("sourceSystemId") int sourceSystemId) {
		Response response = null;
		BaseResponse<BroadcastData> baseResponse = new BaseResponse<BroadcastData>();
		baseResponse.setResponseListObject(service.getBroadcastlist(sourceSystemId,
				buId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@GET
	@Path(value = "/getAlerts/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAlert(@QueryParam("partyId") Integer partyId,
			@QueryParam("buId") Integer buId) {
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<AlertData> baseResponse = new BaseResponse<AlertData>();
		baseResponse.setResponseListObject(service.getAlerts(buId, partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;
	}

	@GET
	@Path(value = "/getAlertCount/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAlertCount(@QueryParam("partyId") Integer partyId,
			@QueryParam("buId") Integer buId) {
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(service.getAlertCount(buId, partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;
	}

	@GET
	@Path(value = "/getCalenderEvents/{user}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getCalenderEvents(@QueryParam("partyId") Integer partyId,
			@QueryParam("buId") Integer buId) {
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<CalenderData> baseResponse = new BaseResponse<CalenderData>();
		baseResponse.setResponseListObject(service.getCalenderEvents(buId,
				partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;
	}

}