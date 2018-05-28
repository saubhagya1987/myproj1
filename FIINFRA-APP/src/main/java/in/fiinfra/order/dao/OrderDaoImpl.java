package in.fiinfra.order.dao;

import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.pg.OrderData;
import in.fiinfra.pg.PaymentData;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("OrderDao")
public class OrderDaoImpl implements OrderDao {
	@Autowired
	DataSourceProvider dataSourceProvider;

	private static final String SP_GET_ORDERS = "{CALL usp_pg_getOrders(?,?)}";
	
	private static final String SP_GET_PAYMENTS = "{CALL usp_pg_getPayments(?,?,?)}";

	private static final String SP_INSERT_OR_UPDATE_ORDERS = "usp_pg_saveOrders";

	private static final String SP_INSERT_OR_UPDATE_PAYMENT = "usp_pg_savePayment";
	
	private static final String SP_GET_PENDING_PAYMENT = "{CALL usp_pg_getPendingPayments()}";
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<OrderData> getListOfOrder(int buId, int partyId) {
  	  jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
	  return jdbcTemplate.query(SP_GET_ORDERS, new Object[]{partyId,0},
		  new OrderMapper());
		 
	}

	@Override
	public List<PaymentData> getListOfPayment(int buId, int partyId) {
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		 return jdbcTemplate.query(SP_GET_PAYMENTS, new
		 Object[]{partyId,0,0},new PaymentMapper());
	}

	@Override
	public OrderData saveOrder(int buId, OrderData orderData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		CommonStoredProcedure sp = new CommonStoredProcedure(jdbcTemplate,
				SP_INSERT_OR_UPDATE_ORDERS);

		sp.setParameters(new SqlParameter[] {
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("orderID", Types.INTEGER),
				new SqlParameter("userId", Types.INTEGER),
				new SqlParameter("orderXml", Types.VARCHAR),
				new SqlOutParameter("output", Types.INTEGER) });

		sp.compile();

		Integer userId = orderData.getOrderID() != null
				&& orderData.getOrderID() > 0 ? orderData.getLastModifiedBy()
				: orderData.getLastModifiedBy();

		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId",
				orderData.getPartyID() != null ? orderData.getPartyID() : 0);
		paranValues.put("orderID", orderData.getOrderID());
		paranValues.put("userId", userId);
		paranValues.put("orderXml", getOrderXMLData(orderData));

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		// logger.debug("storedProcResult:------" + storedProcResult);

		orderData.setOrderID((Integer) storedProcResult.get("result"));

		return orderData;
		/* return null; */
	}

	private static String getOrderXMLData(OrderData orderData) {
		StringBuilder sb = new StringBuilder();

		sb.append("<Root>");
		sb.append("<OrderAmount>").append(orderData.getOrderAmount())
				.append("</OrderAmount>");
		sb.append("</Root>");
		return sb.toString();

	}

	private static String getPaymentXMLData(PaymentData paymentData) {
		StringBuilder sb = new StringBuilder();

		sb.append("<Root>");
		appendXMLField(sb, "Action", paymentData.getAction());
		appendXMLField(sb, "PartyPaymentId", paymentData.getPaymentID());
		appendXMLField(sb, "TxnRefNo", paymentData.getTrxReference());
		appendXMLField(sb, "StartDate", paymentData.getStartDate());
		appendXMLField(sb, "EndDate", paymentData.getEndDate());
		appendXMLField(sb, "PaymentAmount", paymentData.getPaymentAmount());
		appendXMLField(sb, "PaymentStatusID", paymentData.getPaymentStatusId());
		appendXMLField(sb, "PaymentMethodId", paymentData.getPaymentMethodID());
		appendXMLField(sb, "PGRespnseDttm", paymentData.getpGRespnseDttm());
		appendXMLField(sb, "PGTxnRefNo", paymentData.getpGTxnRefNo());
		appendXMLField(sb, "ProductID", paymentData.getProductID());

		
		appendXMLField(sb, "PGStatusID", paymentData.getpGStatusID());
		appendXMLField(sb, "PGErrorCode", paymentData.getpGErrorCode());
		appendXMLField(sb, "PGErrorDescription",
				paymentData.getpGErrorDescription());

		appendXMLField(sb, "PGPaidAmount", paymentData.getpGPaidAmount());
		appendXMLField(sb, "PGStatusID", paymentData.getpGStatusID());
		appendXMLField(sb, "PGErrorCode", paymentData.getpGErrorCode());
		appendXMLField(sb, "PGRequestMessage",
				paymentData.getpGRequestMessage());
		appendXMLField(sb, "PGResponseMessage",
				paymentData.getpGResponseMessage());
		appendXMLField(sb, "PaymentNote", paymentData.getPaymentNote());
		appendXMLField(sb, "OrderNo", paymentData.getOrderNo());
		appendXMLField(sb, "OrderId", paymentData.getOrderID());
		appendXMLField(sb, "PlanCredit", paymentData.getPlanCount());
		
		sb.append("</Root>");
		return sb.toString();

	}

	public static void appendXMLField(StringBuilder sb, String param,
			Integer value) {
		if(value ==null){
			return ;
		}
		sb.append("<" + param + ">").append(value ).append("</" + param + ">");
	}

	public static void appendXMLField(StringBuilder sb, String param, Long value) {
		if(value != null){
			sb.append("<" + param + ">").append(value ).append("</" + param + ">");
		}
	}

	public static void appendXMLField(StringBuilder sb, String param,
			String value) {
		if(value != null){
			sb.append("<" + param + ">").append(value).append("</" + param + ">");
		}
	}

	public static void appendXMLField(StringBuilder sb, String param,
			Double value) {
		if(value != null){
			sb.append("<" + param + ">").append(value).append("</" + param + ">");
		}
	}
	

	public static void appendXMLField(StringBuilder sb, String param, Date value) {
		if(value != null){
			sb.append("<" + param + ">").append(CommonUtils.format(value, "MM/dd/yyyy")).append("</" + param + ">");
		}
	}

	@Override
	public PaymentData savePayment(int buId, PaymentData paymentData) {
		CommonStoredProcedure sp = new CommonStoredProcedure(jdbcTemplate,
				SP_INSERT_OR_UPDATE_PAYMENT);

		sp.setParameters(new SqlParameter[] {
				new SqlParameter("partyId", Types.INTEGER),
				
				new SqlParameter("userId", Types.INTEGER),
				new SqlParameter("paymentDataXml", Types.VARCHAR),
				new SqlOutParameter("result", Types.INTEGER) });

		sp.compile();

		

		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId",paymentData.getPartyID() );
		
		paranValues.put("userId", paymentData.getUserId());
		paranValues.put("paymentDataXml", getPaymentXMLData(paymentData));

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		 //logger.debug("storedProcResult:------" + storedProcResult);
		if(paymentData.getPaymentID() == null || paymentData.getPaymentID() <=0){
			paymentData.setPaymentID((Integer) storedProcResult.get("result"));	
		}
		if(paymentData.getPaymentID() != null && paymentData.getPaymentID() >0){
			return getPaymentById(buId, paymentData.getPartyID(), paymentData.getPaymentID());	
		}
		return null;
				
		}

	@Override
	public OrderData getOrderById(int buId, Integer orderId, int partyId) {
		 List<OrderData> order= jdbcTemplate.query(SP_GET_ORDERS, new Object[]{partyId,orderId},
				  new OrderMapper());
		
		 return order.iterator().next();
	}
	
	@Override
	public PaymentData getPaymentById(int buId,int partyId, int paymentId){
		 List<PaymentData> payments= jdbcTemplate.query(SP_GET_PAYMENTS, new Object[]{partyId,0,paymentId},
				  new PaymentMapper());
		 if(!payments.isEmpty()){
			 return payments.iterator().next();
		 }
		
		 return null;
	}

	@Override
	public List<PaymentData> getPendingPayments(){
		 List<PaymentData> payments= jdbcTemplate.query(SP_GET_PENDING_PAYMENT, new Object[0],
				  new PaymentMapper());
		
		 return payments;
	}

	

	@Override
	public Integer savePgRecoData(int buId, int partyId,
			String pgRecoData) {
		CommonStoredProcedure sp = new CommonStoredProcedure(jdbcTemplate,
				SP_INSERT_OR_UPDATE_PAYMENT);

		sp.setParameters(new SqlParameter[] {
				new SqlParameter("partyId", Types.INTEGER),
			new SqlParameter("paymentDataXml", Types.VARCHAR),
				new SqlOutParameter("result", Types.INTEGER) });

		sp.compile();

		
			
		

		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("pgRecoDataXml", pgRecoData);

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		
			 
		
		return null;
	}
	
	
}
