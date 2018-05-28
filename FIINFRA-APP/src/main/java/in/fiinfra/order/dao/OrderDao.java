package in.fiinfra.order.dao;

import in.fiinfra.pg.OrderData;
import in.fiinfra.pg.PaymentData;

import java.util.List;

public interface OrderDao {
	
	OrderData saveOrder(int buId,OrderData orderData);
	PaymentData savePayment(int buId,PaymentData paymentData);
	List<OrderData> getListOfOrder(int buId,int partyId);
	List<PaymentData> getListOfPayment(int buId,int partyId);
	OrderData getOrderById(int buId,Integer orderId,int partyId);
	PaymentData getPaymentById(int buId,int partyId, int paymentId);
	Integer savePgRecoData(int buId,int partyId,String pgRecoData);

	List<PaymentData> getPendingPayments();
}
