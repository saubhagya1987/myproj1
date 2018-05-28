package in.fiinfra.order.facade;

import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.order.service.OrderService;
import in.fiinfra.pg.OrderData;
import in.fiinfra.pg.PaymentData;

import java.io.IOException;

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
import org.springframework.stereotype.Controller;

@Controller
@Path("/order")
public class OrderController {
	
	
	@Autowired
	OrderService orderService;

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/createOrder/{user}/{token}")
	public Response saveOrder(@QueryParam("buId") int buId, 
			@QueryParam("userId") String userId,OrderData orderData,@PathParam("token") String token
			) {
		Response response = null;
		BaseResponse<OrderData> baseResponse = new BaseResponse<OrderData>();
		baseResponse.setResponseObject(orderService.saveOrder(buId,orderData));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getListOfOrder/{user}/{token}")
	public Response getListOfOrder(@QueryParam("buId") int buId, 
			@QueryParam("partyId") int partyId,
			@PathParam("token") String token
			) {
			
		Response response = null;
		BaseResponse<OrderData> baseResponse = new BaseResponse<OrderData>();
		baseResponse.setResponseListObject(orderService.getListOfOrder(buId,partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	/*@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/savePayment/{user}/{token}")
	public Response createPayment(@QueryParam("buId") int buId, 
			PaymentData paymentData,
			@PathParam("token") String token
			) {
		Response response = null;
		BaseResponse<PaymentData> baseResponse = new BaseResponse<PaymentData>();
		baseResponse.setResponseObject(orderService.savePayment(buId,paymentData));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;
	}*/
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getListOfPayment/{user}/{token}")
	public Response getListOfPayment(@QueryParam("buId") int buId, 
			@QueryParam("partyId") int partyId,
			@PathParam("token") String token
			) {
			
		Response response = null;
		BaseResponse<PaymentData> baseResponse = new BaseResponse<PaymentData>();
		baseResponse.setResponseListObject(orderService.getListOfPayment(buId,partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addOrders/{user}/{token}")
	public Response saveOrders(OrderData order,
			@PathParam("user") String name, @QueryParam("buId") int buId) throws IOException {

		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		order = orderService.saveOrder(buId, order);
		
		if (order.getOrderID() != null
				&& order.getOrderID() > 0) {
			baseResponse.setResponseObject(order.getOrderID());
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse,
					null);
		} else {
			response = FiinfraResponseBuilder
					.getErrorResponse("Unable to Save Subscription");
		}
		return response;

	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/savePayment/{user}/{token}")
	public Response savePayments(PaymentData payment,
			@PathParam("user") String name ) throws IOException {

		Response response = null;
		BaseResponse<PaymentData> baseResponse = new BaseResponse<PaymentData>();
		payment = orderService.savePayment(payment.getBuId(), payment);
		
		if (payment != null && payment.getPaymentID() != null
				&& payment.getPaymentID() > 0) {
			baseResponse.setResponseObject(payment);
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse,
					null);
		} else {
			response = FiinfraResponseBuilder
					.getErrorResponse("Unable to Save Payment");
		}
		return response;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getOrderById/{user}/{token}")
	public Response getOrderById(@QueryParam("orderId")Integer orderId, 
			@PathParam("user") String name,@QueryParam("partyId") int partyId, @QueryParam("buId") int buId) throws IOException {

		Response response = null;
		BaseResponse<OrderData> baseResponse = new BaseResponse<OrderData>();
		baseResponse.setResponseObject(orderService.getOrderById(buId,orderId,partyId));	
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPaymentById/{user}/{token}")
	public Response getPaymentById(@QueryParam("paymentId")Integer paymentId, 
			@PathParam("user") String name,@QueryParam("partyId") int partyId, @QueryParam("buId") int buId) throws IOException {

		Response response = null;
		BaseResponse<PaymentData> baseResponse = new BaseResponse<PaymentData>();
		baseResponse.setResponseObject(orderService.getPaymentById(buId,partyId,paymentId));	
		
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}

	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateOrder/{user}/{token}")
	public Response updateOrder(@QueryParam("orderId")int orderId,
			@PathParam("user") String name,@QueryParam("partyId") int partyId, @QueryParam("buId") int buId) throws IOException {

		Response response = null;
		BaseResponse<OrderData> baseResponse = new BaseResponse<OrderData>();
		baseResponse.setResponseObject(orderService.getOrderById(buId,partyId,orderId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/savePgReco/{user}/{token}")
	public Response savePgReco(@PathParam("user") String name,@QueryParam("partyId") int partyId, @QueryParam("buId") int buId,String pgRecoData) throws IOException {

		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse.setResponseObject(orderService.savePgRecoData(buId, partyId, pgRecoData));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);
		return response;

	}
	
	
	
}
