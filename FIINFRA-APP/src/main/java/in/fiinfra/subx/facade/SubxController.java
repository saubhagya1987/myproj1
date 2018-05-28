package in.fiinfra.subx.facade;

import in.fiinfra.common.common.ReportData;
import in.fiinfra.common.common.ReportRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.pg.SubscriptionData;
import in.fiinfra.pg.SubxProductData;
import in.fiinfra.subx.service.SubxService;

import java.io.IOException;
import java.util.List;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@Path("/subx")
public class SubxController {
	private static final Logger logger = Logger.getLogger(SubxController.class);
	@Autowired
	private SubxService subxService;
	Response response;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSubscriptionList/{user}/{token}")
	public Response getSubscriptionList(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId, @PathParam("token") String token) {
		Response response = null;
		BaseResponse<SubscriptionData> baseResponse = new BaseResponse<SubscriptionData>();
		baseResponse.setResponseListObject(subxService.showSubscriptionList(
				buId, partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCurrentSubx/{user}/{token}")
	public Response getCurrentSubx(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId, @PathParam("token") String token) {
		Response response = null;
		BaseResponse<SubscriptionData> baseResponse = new BaseResponse<SubscriptionData>();
		baseResponse.setResponseObject(subxService
				.getCurrentSubx(buId, partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;

	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveSubscription/{user}/{token}")
	public Response saveSubscription(SubscriptionData subscription,
			@PathParam("user") String name, @QueryParam("buId") int buId)
			throws IOException {

		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		subscription = subxService.insertUpdateSubx(buId, subscription);
		if (subscription.getPartySubscriptionID() != null
				&& subscription.getPartySubscriptionID() > 0) {
			baseResponse.setResponseObject(subscription
					.getPartySubscriptionID());
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse,
					null);
		} else {
			response = FiinfraResponseBuilder
					.getErrorResponse("Unable to Save Subscription");
		}
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSubXProducts/{user}/{token}")
	public Response getSubXProducts(@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name) {
		BaseResponse<SubxProductData> baseResponse = new BaseResponse<SubxProductData>();
		List<SubxProductData> lst = subxService.getSubXProducts(buId);
		baseResponse.setResponseListObject(lst);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSubXProductById/{user}/{token}")
	public Response getSubXProductById(@QueryParam("buId") int buId,
			@QueryParam("partyProductId") int partyProductId,
			@PathParam("token") String token, @PathParam("user") String name) {
		BaseResponse<SubxProductData> baseResponse = new BaseResponse<SubxProductData>();
		SubxProductData p = subxService
				.getSubxProductById(buId, partyProductId);
		baseResponse.setResponseObject(p);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSubxById/{user}/{token}")
	public Response getSubxById(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId,
			@QueryParam("subxId") int subxId, @PathParam("token") String token,
			@PathParam("user") String name) {
		BaseResponse<SubscriptionData> baseResponse = new BaseResponse<SubscriptionData>();
		SubscriptionData data = subxService.getSubxById(buId, partyId, subxId);
		baseResponse.setResponseObject(data);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/activateSubx/{user}/{token}")
	public Response activateSubx(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId,
			@QueryParam("userId") int userId, @PathParam("token") String token,
			@PathParam("user") String name) {
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		Integer result = subxService
				.activateSubscription(buId, userId, partyId);
		baseResponse.setResponseObject(result);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/createSubx/{user}/{token}")
	public Response createSubx(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId,
			@QueryParam("userId") int userId,
			@QueryParam("productId") int productId,
			@PathParam("token") String token, @PathParam("user") String name) {
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		Integer result = subxService.createSubscription(buId, userId, partyId,
				productId);
		baseResponse.setResponseObject(result);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerList/{user}/{token}")
	public Response getPartnerList(@QueryParam("buId") int buId,
			@QueryParam("userId") int userId,
			@QueryParam("searchText") String searchText,@QueryParam("searchType") String searchType,
			@PathParam("token") String token, @PathParam("user") String name) {
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		logger.info(searchText);
		// response=subxService.showPartnerList();
		List<KeyValue> lst = subxService.showPartnerList(buId, userId,
				searchText,searchType);
		baseResponse.setResponseListObject(lst);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartyProducts/{user}/{token}")
	public Response getPartyProducts(@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name) {
		BaseResponse<SubxProductData> baseResponse = new BaseResponse<SubxProductData>();
		List<SubxProductData> lst = subxService.getPartyProducts(buId);
		baseResponse.setResponseListObject(lst);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPGReports/{user}/{token}")
	public Response getPGReports(ReportRequest req,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			@PathParam("user") String name) {

		BaseResponse<ReportData> baseResponse = new BaseResponse<ReportData>();
		ReportData data = subxService.getPGReports(req);
		baseResponse.setResponseObject(data);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProducts/{user}/{token}")
	public Response getProducts(@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name) {
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		List<KeyValue> lst = subxService.getProducts(buId);
		baseResponse.setResponseListObject(lst);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/savePartyProduct/{user}/{token}")
	public Response savePartyProduct(SubxProductData subxProduct,
			@PathParam("user") String name, @QueryParam("buId") int buId)
			throws IOException {

		Response response = null;
		subxProduct = subxService.saveProduct(buId, subxProduct);
		response = FiinfraResponseBuilder
				.getErrorResponse("Unable to Save Subscription");
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getResourceUtilReport/{user}/{token}")
	public Response getResourceUtilReport(@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId, @PathParam("token") String token,
			ReportRequest req, @PathParam("user") String name) throws Exception {
		BaseResponse<ReportData> baseResponse = new BaseResponse<ReportData>();
		ReportData data = subxService.getResourceUtiReports(req);
		baseResponse.setResponseObject(data);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

}
