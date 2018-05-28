package in.fiinfra.order.service;

import in.fiinfra.common.dao.CommonDao;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.order.dao.OrderDao;
import in.fiinfra.pg.OrderData;
import in.fiinfra.pg.PaymentData;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("OrderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao orderDao;
	@Autowired
	CommonDao commonDao;

	@Override
	public List<OrderData> getListOfOrder(int buId, int partyId) {
		return orderDao.getListOfOrder(buId, partyId);
	}

	@Override
	public List<PaymentData> getListOfPayment(int buId, int partyId) {
		return orderDao.getListOfPayment(buId, partyId);
	}

	@Override
	public OrderData saveOrder(int buId, OrderData orderData) {

		return orderDao.saveOrder(buId, orderData);
	}

	@Override
	public PaymentData savePayment(int buId, PaymentData paymentData) {
		PaymentData payData = orderDao.savePayment(buId, paymentData);
		if (payData != null && paymentData.getPaymentStatusId().equals(148003)) {
			payData.setPlanCount(paymentData.getPlanCount());
			try {
				createPaymentReceivedNotification(payData);
			} catch (Exception ex) {
				LogFactory.getLog(getClass().getName()).error(
						"Error creating Notification Event = "
								+ paymentData.getPaymentID(), ex);
			}
		}

		return payData;
	}

	private void createPaymentReceivedNotification(PaymentData bean) {
		Notification notification = new Notification();
		Map<String, String> payloadMap = new HashMap<String, String>();
		payloadMap.put("user", bean.getPartyName());
		payloadMap.put("PaymentAmount",
				CommonUtils.formatAmountINR(bean.getPaymentAmount()));
		payloadMap.put("SubscriptionName", "" + bean.getProductName());
		payloadMap.put("AmountDue", "ZERO");
		payloadMap.put("SubscriptionEndDate",
				CommonUtils.format(bean.getEndDate(), "dd-MMM-yyyy"));
		payloadMap.put("PaymentDate",
				CommonUtils.format(bean.getPaymentDate(), "dd-MMM-yyyy"));

		payloadMap.put("PaymentNote", bean.getPaymentNote());

		// payloadMap.put("Password",map.getValue());
		int eventId = FiinfraConstants.EVENT_PG_PAYMENT_RECEIVED;
		if (bean.getPlanCount() > 0) {
			eventId = FiinfraConstants.EVENT_PG_FREE_WAIVER;
			payloadMap.put("PlanCount", "" + bean.getPlanCount());
		}

		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(bean.getPartyID());
		notification.setNotifyEventID(eventId);
		notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
		notification.setBuId(bean.getBuId());
		notification.setPayloadMap(payloadMap);
		notification.setSessionID("1234");

		commonDao.insertNotification(notification);

	}

	@Override
	public OrderData getOrderById(int buId, Integer orderId, int partyId) {
		return orderDao.getOrderById(buId, orderId, partyId);
	}

	@Override
	public PaymentData getPaymentById(int buId, int partyId, int paymentId) {
		return orderDao.getPaymentById(buId, partyId, paymentId);
	}

	@Override
	public Integer savePgRecoData(int buId, int partyId, String pgRecoData) {
		return orderDao.savePgRecoData(buId, partyId, pgRecoData);
	}

	@Override
	public List<PaymentData> getPendingPayments() {
		return orderDao.getPendingPayments();
	}

}
