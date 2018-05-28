package in.fiinfra.service;

import in.fiinfra.common.common.GetRequest;
import in.fiinfra.common.common.ReportData;
import in.fiinfra.common.common.ReportRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.pg.OrderData;
import in.fiinfra.pg.PaymentData;
import in.fiinfra.pg.SubscriptionData;
import in.fiinfra.pg.SubxProductData;

import java.util.List;

public class SubxService extends BasicService {
	public List<SubscriptionData> getListOfSubx(SubxRequest request) {

		return getService().getForObjectCollection(Services.getSubxList,
				request, SubscriptionData.class, appendPathParam());
	}

	public SubscriptionData createSubscription(UserSession user,
			SubxRequest param) {

		SubscriptionData buSubx = getService().getForObject(
				Services.getSubxByProductAndPartyId, param,
				SubscriptionData.class, appendPathParam());
		buSubx.setUserId(user.getUserId());
		buSubx.setPartyID(param.getPartyId());

		return addUpdateSubx(buSubx);

	}

	public SubscriptionData addUpdateSubx(SubscriptionData subxData) {
		return getService().postForObject(Services.saveSubx, subxData,
				SubscriptionData.class, appendPathParam());

	}

	public List<SubxProductData> getSubxProducts(SubxRequest request) {

		return getService().getForObjectCollection(Services.getSubxProducts,
				request, SubxProductData.class, appendPathParam());
	}

	public List<OrderData> getListOfOrders(SubxRequest request) {

		return getService().getForObjectCollection(Services.getOrderList,
				request, OrderData.class, appendPathParam());
	}

	public List<PaymentData> getListOfPayments(SubxRequest request) {

		return getService().getForObjectCollection(Services.getPaymentList,
				request, PaymentData.class, appendPathParam());
	}

	public PaymentData addUpdatePayment(PaymentData data) {
		return getService().postForObject(Services.savePayment, data,
				PaymentData.class, appendPathParam());

	}

	public Integer addUpdateOrder(OrderData data) {
		return getService().postForObject(Services.saveOrder, data,
				Integer.class, appendPathParam());
	}

	public OrderData getOrderById(SubxRequest request) {

		return getService().getForObject(Services.getOrderById, request,
				OrderData.class, appendPathParam());
	}

	public SubscriptionData getSubscriptionById(SubxRequest req) {

		return getService().getForObject(Services.getSubxById, req,
				SubscriptionData.class, appendPathParam());
	}

	public SubscriptionData getSubxProductByBuId(SubxRequest req) {

		return getService().getForObject(Services.getSubxProductByBuId, req,
				SubscriptionData.class, appendPathParam());
	}

	public Integer createSubx(UserSession user, Partner partner) {
		GetRequest req = new GetRequest()
				.param("partyId", partner.getPartyID())
				.param("buId", user.getBuId())
				.param("productId", partner.getSubscriptionPackageId());

		return getService().getForObject(Services.createSubx, req,
				Integer.class, appendPathParam());
	}

	public String getPartyProfile(SubxRequest req, String userName) {
		return getService().getForObject(Services.getPartyName, req,
				String.class, appendPathParam(userName));
	}

	public List<KeyValue> getPartners(SubxRequest request) {

		return getService().getForObjectCollection(Services.getPartnerList,
				request, KeyValue.class, appendPathParam());
	}

	public SubscriptionData getCurrentSubx(SubxRequest req) {
		return getService().getForObject(Services.getCurrentSubx, req,
				SubscriptionData.class, appendPathParam());
	}

	public List<SubxProductData> getPartyProducts(SubxRequest request) {

		return getService().getForObjectCollection(Services.getPartyProducts,
				request, SubxProductData.class, appendPathParam());
	}

	public ReportData getSubscriptionReports(ReportRequest request) {

		return getService().postForObject(Services.getPGReports, request,
				ReportData.class, appendPathParam());
	}

	public List<KeyValue> getProducts(SubxRequest req) {
		return getService().getForObjectCollection(Services.getProducts, req,
				KeyValue.class, appendPathParam());
	}

	public Integer addUpdateProduct(SubxProductData subxProductData) {
		return getService().postForObject(Services.saveProduct,
				subxProductData, Integer.class, appendPathParam());

	}

	public ReportData getResourceUtilReport(ReportRequest req) {
		return getService().getForObject(Services.getResourceUtilReport, req,
				ReportData.class, appendPathParam());

	}

}
