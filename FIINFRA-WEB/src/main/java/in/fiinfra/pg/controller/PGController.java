package in.fiinfra.pg.controller;

import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.pg.BillDeskAPI;
import in.fiinfra.pg.BilldeskResponseData;
import in.fiinfra.pg.NachData;
import in.fiinfra.pg.OrderData;
import in.fiinfra.pg.OrderDetailData;
import in.fiinfra.pg.PGException;
import in.fiinfra.pg.PaymentData;
import in.fiinfra.pg.SubscriptionData;
import in.fiinfra.pg.SubxProductData;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.codehaus.jackson.node.ObjectNode;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class PGController extends MultiActionController {

	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	private static final Logger logger = Logger.getLogger(PGController.class);
	String url;

	@Value("${URL_GET_SubscriptionData_List}")
	private String URL_GET_SubscriptionData_List;
	@Value("${getSubxProducts}")
	private String getSubxProducts;

	@Value("${getCurrent_Subx}")
	private String getCurrent_Subx;

	@Value("${URL_GET_PAYMENT_List}")
	private String URL_GET_PymentData_List;

	@Value("${URL_GET_TransactionData_List}")
	private String URL_GET_TransactionData_List;

	@Value("${URL_GET_ORDER_BY_ID}")
	private String URL_GET_ORDER_BY_ID;

	@Value("${URL_SAVE_PAYMENT}")
	private String URL_SAVE_PymentData;

	@Value("${URL_UPDATE_ORDER}")
	private String URL_UPDATE_ORDER;

	@Value("${URL_GET_NACH_BY_PARTYID}")
	private String URL_GET_NACH_BY_PARTYID;

	public RestTemplate getRestTemplate() {
		return restTemplate;
	}

	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	public ModelAndView orderConfirmation(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("pg/order");

		// Integer categoryId = new Integer(request.getParameter("categoryId"));
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		SubxProductData[] products = getProducts(userSession);
		// mav.addObject("order",getOrder(orderId, null,userSession));
		/**/
		List<KeyValue> subxProducts = new ArrayList<KeyValue>();
		Set<Integer> pIds = new HashSet<Integer>();
		for (SubxProductData s : products) {
			if (pIds.add(s.getProductID())) {
				KeyValue k = new KeyValue();
				k.setId(s.getProductID());
				k.setName(s.getProductName());
				subxProducts.add(k);
			}
		}
		NachData data = getNachDetails(userSession);
		mav.addObject("nach", data);
		mav.addObject("products", subxProducts);
		return mav;
	}

	@SuppressWarnings("unchecked")
	public void getProductData(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String productId = request.getParameter("productId");
		SubxProductData[] products = getProducts(userSession);
		// List<SubxProductData> lst=new ArrayList<SubxProductData>();
		ObjectMapper mapper = new ObjectMapper();
		ArrayNode lst = mapper.createArrayNode();
		SubscriptionData activeSub = getCurrentSubxData(userSession);
		PaymentData p = new PaymentData();
		int months = 0;
		Calendar expDate = Calendar.getInstance();
		expDate.setTime(activeSub.getSubscriptionExpiryDate());

		Calendar monthEnd = Calendar.getInstance();

		monthEnd.set(Calendar.DAY_OF_MONTH,
				monthEnd.getActualMaximum(Calendar.DAY_OF_MONTH));

		if (!activeSub.getSubscriptionStatusID().equals(147001)) {
			Calendar today = Calendar.getInstance();
			today.add(Calendar.DAY_OF_YEAR, -1);
			activeSub.setSubscriptionExpiryDate(today.getTime());
		}

		for (SubxProductData s : products) {
			if (s.getProductID().equals(new Integer(productId))) {

				ObjectNode map = mapper.createObjectNode();
				if (s.getPaymentFrequencyId() == 63003) {
					months = 1;
				} else if (s.getPaymentFrequencyId() == 63005) {
					months = 6;
				} else if (s.getPaymentFrequencyId() == 63006) {
					months = 12;
				}

				if (!activeSub.getSubscriptionStatusID().equals(147001)) {

					months += 1;
					int diff = CommonUtils.getGapInDays(monthEnd.getTime());
					double amnt = s.getPriceValue();
					double durationInDays = months * 30;
					double currentMonthCharge = diff * (amnt / durationInDays);
					s.setPriceValue((int) (amnt + currentMonthCharge));

					addValue(mapper, map, "currentMonthCharge",
							CommonUtils.formatAmountINR(currentMonthCharge,
									true));

				}

				addValue(mapper, map, "productName", s.getProductName() + " "
						+ s.getPaymentFrequency());

				Date[] startEndDate = p.calculateStartEndDate(
						activeSub.getSubscriptionExpiryDate(), months);

				BillDeskAPI api = new BillDeskAPI();
				String option = api.buildPgOptionForm(s.getProductID(),
						s.getPaymentFrequencyId(),
						CommonUtils.format(startEndDate[0], "yyyyMMDD"),
						CommonUtils.format(startEndDate[1], "yyyyMMDD"),
						s.getPriceValue());

				addValue(mapper, map, "partyProductId", s.getPartyProductID());
				addValue(mapper, map, "startDate",
						CommonUtils.format(startEndDate[0], "dd-MMM-yyyy"));
				addValue(mapper, map, "endDate",
						CommonUtils.format(startEndDate[1], "dd-MMM-yyyy"));
				addValue(mapper, map, "amount",
						CommonUtils.formatAmountINR(s.getPriceValue(), true));
				addValue(mapper, map, "option", option);
				addValue(mapper, map, "paymentFrequencyId",
						s.getPaymentFrequencyId());
				// addValue(mapper, map, "hiddenStartDate", new Date());
				// addValue(mapper, map, "hiddenEndDate", new Date());
				lst.add(map);
			}
		}

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, lst);

	}

	public ModelAndView confirmFinalOrder(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("pg/order_confirmation");

		Integer productId = (Integer) request.getAttribute("productId");
		// Integer categoryId = new Integer(request.getParameter("categoryId"));
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		return mav;
	}

	private PaymentData createPaymentEntry(PaymentData paymentData,
			UserSession userSession) throws Exception {

		// check valid order details

		url = URL_SAVE_PymentData + userSession.getUserName() + "/1234";
		logger.info("URL ---------------------> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<PaymentData> br = new BaseResponse<PaymentData>();
		paymentData.setPartyID(partyId);
		paymentData.setUserId(userSession.getUserId());
		paymentData.setBuId(buId);
		paymentData.setAction("PGRequest");
		paymentData.setpGRequestMessage("");
		paymentData.setpGResponseMessage("");
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB),
				paymentData, BaseResponse.class);
		PaymentData payData = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			payData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					PaymentData.class);
		}

		return payData;

	}

	public ModelAndView msgToPg(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String returnUrl = getCurrentBaseURL(request)
				+ "/FIINFRA-WEB/pg/pgReturn";

		BillDeskAPI api = new BillDeskAPI();

		String[] tokens;
		try {
			tokens = api.retrivePgOptionForm(request
					.getParameter("productOption"));
		} catch (PGException ex) {
			request.setAttribute("errorMsg", ex.getMessage());
			return new ModelAndView("redirect:/pg/orderConfirmation.htm");
		}

		int pId = CommonUtils.toInt(tokens[0]);
		int fId = CommonUtils.toInt(tokens[1]);
		Date startDate = CommonUtils.convertToDate(tokens[2], "yyyyMMDD");
		Date endDate = CommonUtils.convertToDate(tokens[3], "yyyyMMDD");
		long amount = CommonUtils.toLong(tokens[4]);

		PaymentData paymentData = new PaymentData();
		paymentData.setProductID(pId);
		paymentData.setStartDate(startDate);
		paymentData.setEndDate(endDate);
		paymentData.setPaymentAmount(amount);
		paymentData.setPaymentStatusId(148001);

		// create orderPayment Entry
		PaymentData payData = createPaymentEntry(paymentData, userSession);

		String reqMsg = api.buildForm(api.BILLDESK_MERCHANT_ID,
				api.BILLDESK_ChecksumKey, returnUrl, payData);
		payData.setAction("PGRequestUpdate");
		request.setAttribute("msg", reqMsg);

		payData.setpGRequestMessage(reqMsg);
		payData.setBuId(userSession.getBuId());
		payData.setUserId(userSession.getUserId());
		payData.setPartyID(userSession.getPartyId());
		/***********/
		url = URL_SAVE_PymentData + userSession.getUserName() + "/1234";
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<PaymentData> br = new BaseResponse<PaymentData>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB),
				payData, BaseResponse.class);

		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			payData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					PaymentData.class);
		}
		request.setAttribute("paymentData", payData);
		audit(userSession.getPartyId(), userSession.getUserId(),
				FiinfraConstants.SUBX_AUDIT_ID,
				FiinfraConstants.SUBX_SOURCE_MODULE_SUBSCRIPTION,
				"paymentCreation");

		return new ModelAndView("pg/pgRedirect");
	}

	private String getCurrentBaseURL(HttpServletRequest request) {
		String baseUrl = "";
		if ((request.getServerPort() == 80) || (request.getServerPort() == 443)) {
			baseUrl = request.getScheme() + "://" + request.getServerName();
		} else {
			baseUrl = request.getScheme() + "://" + request.getServerName()
					+ ":" + request.getServerPort();
		}

		return baseUrl;
	}

	public ModelAndView pgReturn(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// ModelAndView mav = new ModelAndView("pg/failed");
		String msg = request.getParameter("msg");

		LogFactory.getLog(getClass()).info(
				"Response from payment Gateway: " + msg);

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		ModelAndView mav = new ModelAndView("pg/paymentRecieved");
		if (StringUtils.isEmpty(msg)) {
			LogFactory.getLog(getClass()).error(
					"Invalid Response from payment Gateway: Msg is Empty");
			request.setAttribute("errorMsg",
					"Sorry! Your payment could not be processed this time.Please try again later.");
			return mav;
		}

		// call api and get secret Key
		String secretKey = "Sib8tU95LaYb";
		BillDeskAPI api = new BillDeskAPI();

		BilldeskResponseData res = api.parseResponse(msg, secretKey);

		PaymentData paymentData = new PaymentData();

		paymentData.setpGTxnRefNo(res.getTxnReferenceNo());
		paymentData.setTrxReference(res.getCustomerId());
		paymentData.setpGErrorDescription(res.getErrorDesc());
		paymentData.setpGResponseMessage(msg);
		paymentData.setPaymentStatusId(148002);
		paymentData.setBuId(userSession.getBuId());

		if ("0300".equals(res.getAuthStatus())) {
			paymentData.setpGStatusID(151001);
			paymentData.setPaymentStatusId(148003);
			paymentData.setpGPaidAmount(CommonUtils.toLong(res.getAmount()));
			paymentData.setPaymentAmount(CommonUtils.toLong(res.getAmount()));
		} else if ("0399".equals(res.getAuthStatus())) {
			paymentData.setpGStatusID(151002);
		} else if ("NA".equals(res.getAuthStatus())) {
			paymentData.setpGStatusID(151003);
		} else if ("0002".equals(res.getAuthStatus())) {
			paymentData.setpGStatusID(151004);
			paymentData.setPaymentStatusId(148001);
		} else {
			paymentData.setpGStatusID(151005);
		}

		if (!"0300".equals(res.getAuthStatus())) {
			request.setAttribute("errorMsg",
					"Sorry! Your payment could not be processed this time.Please try again later.");
		}

		paymentData.setAction("PGResponse");
		paymentData.setPartyID(userSession.getPartyId());
		paymentData.setUserId(userSession.getUserId());
		paymentData.setpGRespnseDttm(Calendar.getInstance().getTime());

		// update payment Status (API call)

		url = URL_SAVE_PymentData + userSession.getUserName() + "/1234";
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);

		BaseResponse<PaymentData> br = new BaseResponse<PaymentData>();

		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB),
				paymentData, BaseResponse.class);

		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			paymentData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					PaymentData.class);
		}
		request.setAttribute("paymentData", paymentData);
		audit(userSession.getPartyId(), userSession.getUserId(),
				FiinfraConstants.SUBX_AUDIT_ID,
				FiinfraConstants.SUBX_SOURCE_MODULE_SUBSCRIPTION,
				"paymentResponse");

		// notification.setAttachment1DocumentID(doc.getDocumentId());
		// notification.setSessionID(servletRequest.getSession().getId());
		mav.addObject("paymentId", paymentData.getPaymentID());
		mav.addObject("partyId", userSession.getPartyId());
		mav.addObject("buId", userSession.getBuId());
		mav.addObject("partnerName",
				CommonUtils.emptyIfNull(paymentData.getPartyName()));
		return mav;
	}

	@SuppressWarnings("unchecked")
	public void showPayment(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_PymentData_List + userSession.getUserName() + "/1234";
		logger.info("URL ---------------------> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<PaymentData> br = new BaseResponse<PaymentData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		ObjectMapper mapper = new ObjectMapper();
		ArrayNode lst = mapper.createArrayNode();

		PaymentData[] paymentData = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			paymentData = objectMapper
					.readValue(objectMapper.writeValueAsString(br
							.getResponseListObject()), PaymentData[].class);
		}
		for (PaymentData p : paymentData) {

			ObjectNode map = mapper.createObjectNode();
			addValue(mapper, map, "paymentDate", CommonUtils.format(
					p.getpGRequestDttm(), "dd-MMM-yyyy HH:mm"));
			addValue(mapper, map, "orderNumber", p.getOrderNo());
			addValue(mapper, map, "productName", p.getProductName());
			addValue(mapper, map, "TrxnRefNo",
					CommonUtils.emptyIfNull(p.getTrxReference()));
			addValue(mapper, map, "pgTrx",
					CommonUtils.emptyIfNull(p.getpGTxnRefNo()));
			addValue(mapper, map, "paymentAmount",
					CommonUtils.formatAmountINR(p.getPaymentAmount(), true));
			addValue(mapper, map, "paymentStatusID", p.getPaymentStatusId());
			addValue(mapper, map, "paymentStatus", p.getPaymentStatus());
			addValue(mapper, map, "orderID", p.getOrderID());
			addValue(mapper, map, "paymentID", p.getPaymentID());
			addValue(mapper, map, "validTill",
					CommonUtils.format(p.getEndDate(), "dd-MMM-yyyy"));

			lst.add(map);

		}

		/************/

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");

		objectMapper.writeValue(out, lst);

		/************/
	}

	@SuppressWarnings("unchecked")
	public void showSubscription(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_SubscriptionData_List + userSession.getUserName()
				+ "/1234";
		logger.info("URL ---------------------> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<SubscriptionData> br = new BaseResponse<SubscriptionData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		SubscriptionData[] subData = null;

		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			subData = objectMapper
					.readValue(objectMapper.writeValueAsString(br
							.getResponseListObject()), SubscriptionData[].class);

		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		/***********************/

		SubscriptionData activeSubx = null;
		SubscriptionData activeSubData = getCurrentSubxData(userSession);
		ObjectMapper mapper = new ObjectMapper();
		ArrayNode lst = mapper.createArrayNode();
		ArrayNode actSubx = mapper.createArrayNode();
		/***********************/
		for (SubscriptionData s : subData) {
			/*
			 * if(! (s.getSubscriptionStatusID().intValue() == 147004
			 * ||s.getSubscriptionStatusID().intValue() == 147005 )){ ObjectNode
			 * map = mapper.createObjectNode(); addValue(mapper, map,
			 * "activeSubx", s.getProductName()
			 * +"("+CommonUtils.formatAmountINR(
			 * s.getSubscriptionCostAmount())+")"
			 * +" ("+CommonUtils.formatAmountINR
			 * (s.getSubscriptionCostAmount(),true)+")"); addValue(mapper, map,
			 * "categoryId", s.getCurrentSubscriptionCategoryID());
			 * addValue(mapper, map, "paymentStatusID", s.getPaymentStatusID());
			 * addValue(mapper, map, "amountDue",s.getCumulativeAmountDue());
			 * addValue(mapper, map, "planCount",s.getPlanCount()); activeSubx =
			 * s; //actSubx.add(map); }
			 */
			ObjectNode map = mapper.createObjectNode();
			/*
			 * addValue( mapper, map, "productName", s.getProductName() + " " +
			 * CommonUtils.emptyIfNull(activeSubData .getPaymentFrequency()));
			 */
			int days = activeSubData.getSubscriptionExpiryDate().compareTo(
					new Date());
			/*
			 * if (days >= 0) { addValue( mapper, map, "activeSubx",
			 * activeSubData.getProductName() + "(" +
			 * activeSubData.getCurrentSubscriptionType() + ") - " +
			 * CommonUtils.getGapInDays(activeSubData
			 * .getSubscriptionExpiryDate()) + " days to go"); } else if (days <
			 * 0) {
			 * 
			 * addValue( mapper, map, "productName",
			 * activeSubData.getProductName() + "(" +
			 * activeSubData.getCurrentSubscriptionType() + ") - " +
			 * CommonUtils.getGapInDays(activeSubData
			 * .getSubscriptionExpiryDate()) + " days overdue"); }
			 */
			addValue(mapper, map, "productName", activeSubData.getProductName());
			addValue(mapper, map, "startDate", CommonUtils.format(
					s.getSubscriptionStartDate(), "dd-MMM-yyyy"));
			addValue(mapper, map, "endDate", CommonUtils.format(
					s.getSubscriptionExpiryDate(), "dd-MMM-yyyy"));
			addValue(mapper, map, "status", s.getSubscriptionStatus());
			addValue(mapper, map, "type", s.getCurrentSubscriptionType());
			addValue(mapper, map, "subscriptionCost",
					CommonUtils.formatAmountINR(s.getSubscriptionCostAmount(),
							true));
			addValue(
					mapper,
					map,
					"paymentDetails",
					s.getPaymentStatus()
							+ " "
							+ CommonUtils.emptyIfNull(CommonUtils.format(
									s.getLastPaymentDttm(), "dd-MMM-yyyy")));

			lst.add(map);
		}

		Object[] data = new Object[3];
		if (activeSubx != null) {

			// data[0]=actSubx;
		}
		if (activeSubData != null) {
			ObjectNode map = mapper.createObjectNode();
			int days = activeSubData.getSubscriptionExpiryDate().compareTo(
					new Date());
			if (days >= 0) {
				addValue(
						mapper,
						map,
						"activeSubx",
						activeSubData.getProductName()
								+ "("
								+ activeSubData.getCurrentSubscriptionType()
								+ ") - "
								+ CommonUtils.getGapInDays(activeSubData
										.getSubscriptionExpiryDate())
								+ " days to go");
			} else if (days < 0) {

				addValue(
						mapper,
						map,
						"activeSubx",
						activeSubData.getProductName()
								+ "("
								+ activeSubData.getCurrentSubscriptionType()
								+ ") - "
								+ CommonUtils.getGapInDays(activeSubData
										.getSubscriptionExpiryDate())
								+ " days overdue");
			}

			/*
			 * addValue( mapper, map, "activeSubx",
			 * activeSubData.getProductName() + "(" +
			 * activeSubData.getCurrentSubscriptionType() + ") - " +
			 * CommonUtils.getGapInDays(activeSubData
			 * .getSubscriptionExpiryDate()) + " days to go");
			 */
			addValue(mapper, map, "categoryId",
					activeSubData.getCurrentSubscriptionCategoryID());
			addValue(mapper, map, "paymentStatusID",
					activeSubData.getPaymentStatusID());
			addValue(mapper, map, "amountDue",
					activeSubData.getCumulativeAmountDue());
			addValue(mapper, map, "planCount", activeSubData.getPlanCount());
			addValue(mapper, map, "subxPlanLimit",
					activeSubData.getSubxPlanLimit());

			actSubx.add(map);
			data[0] = actSubx;
		}
		data[1] = lst;

		objectMapper.writeValue(out, data);
	}

	private SubxProductData[] getProducts(UserSession userSession)
			throws Exception {

		url = getSubxProducts + userSession.getUserName() + "/1234";
		logger.info("URL ---------------------> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<OrderData> br = new BaseResponse<OrderData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		ObjectMapper mapper = new ObjectMapper();
		ArrayNode lst = mapper.createArrayNode();
		SubxProductData[] subxProductData = null;

		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			subxProductData = objectMapper
					.readValue(objectMapper.writeValueAsString(br
							.getResponseListObject()), SubxProductData[].class);
		}
		return subxProductData;
	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			String value) {
		map.put(key, value);
	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			Integer value) {
		map.put(key, value);
	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			Long value) {
		map.put(key, value);
	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			double value) {
		map.put(key, value);
	}

	@SuppressWarnings("unchecked")
	public void showTransactions(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_TransactionData_List + userSession.getUserName()
				+ "/1234";
		logger.info("URL ---------------------> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<OrderData> br = new BaseResponse<OrderData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		ObjectMapper mapper = new ObjectMapper();
		ArrayNode lst = mapper.createArrayNode();
		OrderData[] orderData = null;

		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			orderData = objectMapper
					.readValue(objectMapper.writeValueAsString(br
							.getResponseListObject()), OrderData[].class);

		}
		for (OrderData o : orderData) {
			for (OrderDetailData od : o.getOrderDetails()) {
				ObjectNode map = mapper.createObjectNode();
				addValue(mapper, map, "orderNumber", o.getOrderNO());
				addValue(mapper, map, "orderDate",
						CommonUtils.format(o.getOrderDttm(), "dd-MMM-yyyy"));
				addValue(mapper, map, "startDate", CommonUtils.format(
						o.getSubscriptionStartDate(), "dd-MMM-yyyy"));
				addValue(mapper, map, "endDate", CommonUtils.format(
						o.getSubscriptionExpiryDate(), "dd-MMM-yyyy"));
				addValue(mapper, map, "orderAmount",
						CommonUtils.formatAmountINR(o.getOrderAmount(), true));
				addValue(mapper, map, "orderStatus", o.getOrderStatus());
				addValue(mapper, map, "productDetails", od.getProductName());
				lst.add(map);
			}
		}

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");

		objectMapper.writeValue(out, lst);
	}

	public void printReceipt(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		/*ReportProcessor processor = ReportProcessor.getReportProcessor();
		processor.initilizeBirtEngine();
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		request.setAttribute("partyId", userSession.getPartyId());
		String reportName = "paymentReceipt.rptdesign";
		request.setAttribute("ReportName", reportName);
		Integer paymentId = new Integer(request.getParameter("paymentId"));

		try {
			logger.info("request " + request.getRequestURI());
			logger.info("request Map " + request.getParameterMap());
			logger.info("processing report complete");
			processor.processReport(request, response);
		} catch (Exception e) {
			logger.error(e);
		}*/
	}

	private void audit(int actionByPartyId, int actionByUserId, int eventId,
			String sourceModule, String sourceScreen) {
		try {
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);
			audit.setActionByUserID(actionByUserId);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_MOBILE_PORTAL);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
			FrameworkUtil.audit(audit);
		} catch (Exception exception) {
			// LOGGER.error("Error occured while doing Audit", exception);
		}
	}

	private SubscriptionData getCurrentSubxData(UserSession userSession)
			throws Exception {

		url = getCurrent_Subx + userSession.getUserName() + "/1234";
		logger.info("URL ---------------------> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<SubscriptionData> br = new BaseResponse<SubscriptionData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		ObjectMapper mapper = new ObjectMapper();

		SubscriptionData s = new SubscriptionData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			s = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					SubscriptionData.class);
		}
		return s;
	}

	@SuppressWarnings("unchecked")
	public void getHeaderSubxData(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		SubscriptionData s = getCurrentSubxData(userSession);
		ObjectMapper mapper = new ObjectMapper();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		ObjectNode map = mapper.createObjectNode();

		if (s != null) {
			Calendar cal = Calendar.getInstance();
			Calendar rCal = Calendar.getInstance();
			rCal.setTime(s.getRenewalNoticeDate());

			addValue(mapper, map, "recharge", "Pay Now!");
			// addValue(mapper, map, "activeSubx", s.getProductName());

			if (s.getSubscriptionStatusID() == 147002) {
				int gap = CommonUtils.getActualGapInDays(s
						.getSubscriptionExpiryDate());
				addValue(mapper, map, "activeSubx",
						"Your Subscription is over due by" + gap + " days	");

			} else if (CommonUtils.compare(cal, rCal) >= 0) {
				int gap = CommonUtils.getActualGapInDays(s
						.getSubscriptionExpiryDate());

				if (s.getCurrentSubscriptionTypeID().equals(149002) && gap == 0) {
					addValue(mapper, map, "activeSubx",
							"Your Trial Period is Expiring today.");
				} else if (s.getCurrentSubscriptionTypeID().equals(149002)
						&& gap == 1) {
					addValue(mapper, map, "activeSubx",
							"Your Trial Subscription is Expiring tomorrow.");
				} else if (s.getCurrentSubscriptionTypeID().equals(149002)
						&& gap < 0) {
					addValue(mapper, map, "activeSubx",
							"Your Trial Period has Expired, Your payment is overdue");
					//Your Trial Subscription is Expired, Please renew before suspension
				} else if (s.getCurrentSubscriptionTypeID().equals(149002)
						&& gap > 0) {
					addValue(mapper, map, "activeSubx",
							"Your Trial Subscription will expire in " + gap
									+ " Days.");
				} else if (gap == 0) {
					addValue(mapper, map, "activeSubx",
							"Your Subscription is Expiring today.");
				} else if (gap == 1) {
					addValue(mapper, map, "activeSubx",
							"Your Subscription is Expiring tomorrow.");
				} else if (gap < 0) {
					addValue(mapper, map, "activeSubx",
							"Your Subscription is Expired, Please renew before suspension");
				} else if (gap > 0) {
					addValue(mapper, map, "activeSubx",
							"Your Subscription will expire in " + gap
									+ " Days.");
				}
			}

			/*
			 * else { if (days >= 0) { addValue( mapper, map, "activeSubx",
			 * "Subscription is expiring in " + CommonUtils.getGapInDays(s
			 * .getSubscriptionExpiryDate()) + " days"); addValue(mapper, map,
			 * "recharge", "Recharge Now"); } }
			 */
		}
		objectMapper.writeValue(out, map);

	}

	private NachData getNachDetails(UserSession userSession) throws IOException {

		url = URL_GET_NACH_BY_PARTYID + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("userId", userSession.getUserId());
		uriCB.queryParam("partyId", partyId);
		BaseResponse<NachData> br = new BaseResponse<NachData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		NachData nachData = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			nachData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					NachData.class);
		}

		return nachData;
	}

}
