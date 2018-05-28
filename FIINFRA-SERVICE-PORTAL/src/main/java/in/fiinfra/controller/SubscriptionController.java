package in.fiinfra.controller;


import in.fiinfra.common.common.ReportData;
import in.fiinfra.common.common.ReportRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.pg.OrderData;
import in.fiinfra.pg.PaymentData;
import in.fiinfra.pg.SubscriptionData;
import in.fiinfra.pg.SubxProductData;
import in.fiinfra.service.SubxRequest;
import in.fiinfra.service.SubxService;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.codehaus.jackson.node.ObjectNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@RequestMapping("/subx")
public class SubscriptionController extends MultiActionController {

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(SubscriptionController.class);

	private ObjectMapper objectMapper;
	@Autowired
	private SubxService subxService;

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				new SimpleDateFormat("MM/dd/yyyy"), true));
	}

	@RequestMapping(value = "/list", method = { RequestMethod.GET })
	public ModelAndView loadSubscription(HttpServletRequest request,
			HttpServletResponse response, SubxRequest req) {
		logger.info("in loadpartner PartnerSPController");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		req.setBuId(userSession.getBuId());
		logger.info(userSession.getUserName());
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "100";
		}

		ModelAndView mav = new ModelAndView("partner/subscriptionList");

		List<SubxProductData> products = subxService.getSubxProducts(req);
		List<SubxProductData> filterdProducts = new ArrayList<SubxProductData>();

		Set<Integer> set = new HashSet<Integer>();

		for (SubxProductData p : products) {
			if (set.add(p.getProductID())) {
				filterdProducts.add(p);
			}
		}

		mav.addObject("allProducts", products);
		mav.addObject("products", filterdProducts);
		mav.addObject("paymentMethods",
				subxService.getCodeValue(userSession.getBuId(), "154"));
		mav.addObject("paymentFreq",
				subxService.getCodeValue(userSession.getBuId(), "63"));

		List<SubscriptionData> subxData = subxService.getListOfSubx(req);
		mav.addObject("subxData", subxData);
		mav.addObject("partyId", req.getPartyId());
		mav.addObject("subxStatus",
				subxService.getCodeValue(userSession.getBuId(), "147"));
		mav.addObject("paymentData", subxService.getListOfPayments(req));
		mav.addObject("size", pagesize);
		mav.addObject("partyId", req.getPartyId());
		if (subxData != null && subxData.size() > 0) {
			mav.addObject("partyName", subxData != null ? subxData.get(0)
					.getPartyName() : "");
		}

		mav.addObject("paymentMethods",
				subxService.getCodeValue(userSession.getBuId(), "154"));

		return mav;
	}

	@RequestMapping(value = "/getSubxProducts", method = { RequestMethod.GET })
	public @ResponseBody
	List<SubxProductData> getSubxProducts(HttpServletRequest request,
			HttpServletResponse response, SubxRequest req) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		req.setBuId(userSession.getBuId());
		req.setPartyId(userSession.getPartyId());

		return subxService.getSubxProducts(req);
	}

	private SubscriptionData convertToSubxData(HttpServletRequest request) {
		Enumeration<String> e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String key = e.nextElement();
			LogFactory.getLog("Request Param").info(
					key + "  = " + request.getParameter(key));
		}

		SubscriptionData subxData = new SubscriptionData();
		subxData.setPartyID(CommonUtils.toInt(request.getParameter("partyID")));
		subxData.setProductID(CommonUtils.toInt(request
				.getParameter("productID")));
		subxData.setSubscriptionCostAmount((long) CommonUtils.toDouble(request
				.getParameter("subscriptionCostAmount")));
		subxData.setPaymentFrequencyId(CommonUtils.toInt(request
				.getParameter("paymentFrequencyId")));
		subxData.setSubscriptionStartDate(CommonUtils.convertToDate(
				request.getParameter("subscriptionStartDate"), "dd-MMM-yyyy"));
		subxData.setSubscriptionExpiryDate(CommonUtils.convertToDate(
				request.getParameter("subscriptionExpiryDate"), "dd-MMM-yyyy"));
		subxData.setTrialStartDate(CommonUtils.convertToDate(
				request.getParameter("trialStartDate"), "dd-MMM-yyyy"));
		subxData.setTrialEndDate(CommonUtils.convertToDate(
				request.getParameter("trialEndDate"), "dd-MMM-yyyy"));
		subxData.setRenewalNoticeDate(CommonUtils.convertToDate(
				request.getParameter("renewalNoticeDate"), "dd-MMM-yyyy"));

		return subxData;
	}

	private PaymentData convertToPaymentData(SubscriptionData currentSubx,
			HttpServletRequest request) {
		// Enumeration<String> e = request.getParameterNames();
		// while (e.hasMoreElements()) {
		// String key = e.nextElement();
		// LogFactory.getLog("Request Param").info(
		// key + "  = " + request.getParameter(key));
		// }

		PaymentData paymentData = new PaymentData();
		paymentData.setProductID(CommonUtils.toInt(request
				.getParameter("productID")));
		paymentData.setPartyID(CommonUtils.toInt(request
				.getParameter("partyID")));
		paymentData.setPaymentAmount(CommonUtils.toLong(request
				.getParameter("paymentAmount")));
		paymentData.setPaymentMethodID(CommonUtils.toInt(request
				.getParameter("paymentMethodID")));
		paymentData.setPaymentNote(request.getParameter("paymentNote"));
		int freqId = CommonUtils.toInt(request
				.getParameter("paymentFrequencyId"));
		int extraMonth = CommonUtils.toInt(request.getParameter("extraMonth"));
		int noOfMonths = 0;
		if (freqId == 63003) {
			noOfMonths = 1;
		} else if (freqId == 63005) {
			noOfMonths = 6;
		} else if (freqId == 63006) {
			noOfMonths = 12;
		}
		noOfMonths += extraMonth;

		Date[] startEndDates = paymentData.calculateStartEndDate(
				currentSubx.getSubscriptionExpiryDate(), noOfMonths);
		paymentData.setStartDate(startEndDates[0]);
		paymentData.setEndDate(startEndDates[1]);

		return paymentData;
	}

	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public @ResponseBody
	String saveSubx(HttpServletRequest request, HttpServletResponse response) {

		SubscriptionData subxData = convertToSubxData(request);

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		subxData.setUserId(userSession.getUserId());
		subxData.setSubscriptionStatusID(147001);
		subxData.setPaymentStatusID(148001);
		subxData.setCurrentSubscriptionTypeID(149001);

		SubxRequest req = new SubxRequest();
		req.setBuId(userSession.getBuId());

		subxService.addUpdateSubx(subxData);

		return "success";

	}

	@RequestMapping(value = "/subxById", method = { RequestMethod.GET })
	public void getSubxById(HttpServletRequest request,
			HttpServletResponse response, SubxRequest req) throws Exception {
		if (req.getSubxId() == null || req.getPartyId() == null) {
			return;
		}
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		req.setBuId(userSession.getBuId());

		/* return subxService.getSubscriptionById(req); */

		ObjectMapper mapper = new ObjectMapper();
		ArrayNode lst = mapper.createArrayNode();

		/***********************/
		SubscriptionData s = subxService.getSubscriptionById(req);

		ObjectNode map = mapper.createObjectNode();
		addValue(mapper, map, "partySubscriptionID", s.getPartySubscriptionID());
		addValue(mapper, map, "paymentFrequency", s.getPaymentFrequency());
		addValue(mapper, map, "paymentFrequencyId", s.getPaymentFrequencyId());
		addValue(mapper, map, "productName", s.getProductName());
		addValue(mapper, map, "productID", s.getProductID());
		addValue(mapper, map, "subscriptionStatusId",
				s.getSubscriptionStatusID());
		addValue(mapper, map, "subscriptionExpiryDate", CommonUtils.format(
				s.getSubscriptionExpiryDate(), "dd-MMM-yyyy"));
		addValue(mapper, map, "subscriptionStartDate",
				CommonUtils.format(s.getSubscriptionStartDate(), "dd-MMM-yyyy"));
		addValue(mapper, map, "subscriptionStartDate",
				CommonUtils.format(s.getSubscriptionStartDate(), "dd-MMM-yyyy"));

		addValue(mapper, map, "trialendDate",
				CommonUtils.format(s.getTrialEndDate(), "dd-MMM-yyyy"));
		addValue(mapper, map, "trialstartDate",
				CommonUtils.format(s.getTrialStartDate(), "dd-MMM-yyyy"));
		addValue(mapper, map, "renewalNoticeDate",
				CommonUtils.format(s.getRenewalNoticeDate(), "dd-MMM-yyyy"));
		addValue(mapper, map, "status", s.getSubscriptionStatus());
		addValue(mapper, map, "subscriptionCost",
				"" + s.getSubscriptionCostAmount());
		addValue(
				mapper,
				map,
				"paymentDetails",
				s.getPaymentStatus()
						+ " "
						+ CommonUtils.emptyIfNull(CommonUtils.format(
								s.getLastPaymentDttm(), "dd-MMM-yyyy")));

		lst.add(map);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		/*
		 * s = mapper.readValue( objectMapper.writeValueAsString(s),
		 * SubscriptionData.class);
		 */
		mapper.writeValue(out, lst);
	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			String value) {
		map.put(key, value);

	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			Integer value) {
		map.put(key, value);

	}

	@RequestMapping(value = "/checkActive", method = { RequestMethod.GET })
	public @ResponseBody
	Boolean[] isActiveSubxExists(HttpServletRequest request,
			HttpServletResponse response, SubxRequest req) {
		if (req.getPartyId() == null) {
			return null;
		}
		List<SubscriptionData> lstSubx = subxService.getListOfSubx(req);
		Boolean[] result = new Boolean[3];

		for (SubscriptionData s : lstSubx) {
			if (s.getSubscriptionStatusID().intValue() == 147001) {
				result[0] = true;
			}
			if (s.getSubscriptionStatusID().intValue() == 147002) {
				result[1] = true;
			}
			if (s.getSubscriptionStatusID().intValue() == 147003) {
				result[2] = true;
			}

		}
		return result;
	}

	@RequestMapping(value = "/renew", method = { RequestMethod.GET })
	public @ResponseBody
	Boolean[] renewSubx(HttpServletRequest request,
			HttpServletResponse response, SubxRequest req) {
		if (req.getPartyId() == null) {
			return null;
		}
		List<SubscriptionData> lstSubx = subxService.getListOfSubx(req);
		Boolean[] result = new Boolean[3];

		List<SubscriptionData> activeSubx = new ArrayList<SubscriptionData>();

		for (SubscriptionData s : lstSubx) {
			if (s.getSubscriptionStatusID().intValue() == 147001
					|| s.getSubscriptionStatusID().intValue() == 147002
					|| s.getSubscriptionStatusID().intValue() == 147003) {
				activeSubx.add(s);
			}
		}
		SubscriptionData lastSubx = null;
		if (!activeSubx.isEmpty()) {
			Collections.sort(activeSubx);
			lastSubx = activeSubx.iterator().next();
		}
		if (lastSubx == null && !lstSubx.isEmpty()) {
			Collections.sort(lstSubx);
			lastSubx = lstSubx.iterator().next();
		}
		if (lastSubx == null) {
			// get Subx defaulted from BU
		}

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		SubscriptionData newSubx = new SubscriptionData();
		newSubx.setUserId(userSession.getUserId());
		newSubx.setPartyID(lastSubx.getPartyID());

		return result;
	}

	@RequestMapping(value = "/order", method = { RequestMethod.GET })
	public ModelAndView getOrderList(HttpServletRequest request,
			HttpServletResponse response, SubxRequest subxReq) {
		logger.info("in loadpartner PartnerSPController");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		logger.info(userSession.getUserName());
		String pagesize = request.getParameter("pageSize");

		if (pagesize == null) {
			pagesize = "100";
		}

		subxReq.setBuId(userSession.getBuId());

		ModelAndView mav = new ModelAndView("partner/orderList");
		List<OrderData> orderData = subxService.getListOfOrders(subxReq);
		mav.addObject("orderData", orderData);
		mav.addObject("size", pagesize);
		mav.addObject("partyId", subxReq.getPartyId());

		return mav;
	}

	@RequestMapping(value = "/paymentList", method = { RequestMethod.GET })
	public ModelAndView loadPayment(HttpServletRequest request,
			HttpServletResponse response, SubxRequest subxReq) {
		logger.info("in loadpartner PartnerSPController");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		logger.info(userSession.getUserName());

		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "100";
		}

		subxReq.setBuId(userSession.getBuId());

		ModelAndView mav = new ModelAndView("partner/paymentList");
		mav.addObject("paymentData", subxService.getListOfPayments(subxReq));
		mav.addObject("size", pagesize);
		mav.addObject("partyId", subxReq.getPartyId());
		mav.addObject("paymentMethods",
				subxService.getCodeValue(userSession.getBuId(), "154"));

		return mav;
	}

	@RequestMapping(value = "/savePayment", method = { RequestMethod.POST })
	public @ResponseBody
	ObjectNode saveP(HttpServletRequest request, HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int partyID = CommonUtils.toInt(request.getParameter("partyID"));
		SubxRequest req = new SubxRequest();
		req.setPartyId(partyID);
		req.setBuId(userSession.getBuId());

		String action = request.getParameter("action");
		// req.setUserId(userSession.getUserId());

		SubscriptionData currentSubx = subxService.getCurrentSubx(req);

		PaymentData paymentData = convertToPaymentData(currentSubx, request);
		paymentData.setUserId(userSession.getUserId());
		paymentData.setPaymentStatusId(148003);
		paymentData.setBuId(userSession.getBuId());
		paymentData.setAction("ManualCreate");

		ObjectMapper mapper = new ObjectMapper();
		ObjectNode result = mapper.createObjectNode();
		paymentData = subxService.addUpdatePayment(paymentData);

		if (paymentData != null) {
			addValue(mapper, result, "result", "OK");
			if ("Extend".equalsIgnoreCase(action)) {
				addValue(
						mapper,
						result,
						"msg",
						"Subscription Extended Till "
								+ CommonUtils.format(paymentData.getEndDate(),
										"dd-MMM-yyyy"));
			} else {
				addValue(
						mapper,
						result,
						"msg",
						"Subscription Renewed Till "
								+ CommonUtils.format(paymentData.getEndDate(),
										"dd-MMM-yyyy"));

			}
		} else {
			addValue(mapper, result, "result", "Fail");
			if ("Extend".equalsIgnoreCase(action)) {
				addValue(mapper, result, "msg",
						"Error While Extending Subscription.");
			} else {
				addValue(mapper, result, "msg",
						"Error While Renewing Subscription.");
			}

		}
		return result;

	}

	@RequestMapping(value = "/getCurrentSubx", method = { RequestMethod.GET })
	public @ResponseBody
	ObjectNode getCurrentSubx(HttpServletRequest request, SubxRequest req,
			HttpServletResponse response, Partner partner) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		req.setBuId(userSession.getBuId());
		ObjectMapper mapper = new ObjectMapper();
		// ArrayNode lst = mapper.createArrayNode();
		SubscriptionData s = subxService.getCurrentSubx(req);
		ObjectNode map = mapper.createObjectNode();
		if (s != null) {
			addValue(
					mapper,
					map,
					"subxName",
					s.getProductName()
							+ "("
							+ s.getCurrentSubscriptionType()
							+ ") - "
							+ CommonUtils.getGapInDays(s
									.getSubscriptionExpiryDate())
							+ " days to go");
			addValue(mapper, map, "lastPaymentAmount",
					CommonUtils.formatAmountINR(s.getLastPaymentAmount()));
			addValue(mapper, map, "lastPaymentDate",
					CommonUtils.format(s.getLastPaymentDttm(), "dd-MMM-yyyy"));
			addValue(mapper, map, "lastPaymentStatus", s.getPaymentStatus());
			addValue(mapper, map, "partySubscriptionID",
					s.getPartySubscriptionID());
			addValue(mapper, map, "paymentFrequency", s.getPaymentFrequency());
			addValue(mapper, map, "paymentFrequencyId",
					s.getPaymentFrequencyId());
			addValue(mapper, map, "productName", s.getProductName());
			addValue(mapper, map, "productID", s.getProductID());
			addValue(mapper, map, "subscriptionStatusId",
					s.getSubscriptionStatusID());
			addValue(mapper, map, "subscriptionExpiryDate", CommonUtils.format(
					s.getSubscriptionExpiryDate(), "dd-MMM-yyyy"));
			addValue(mapper, map, "subscriptionStartDate", CommonUtils.format(
					s.getSubscriptionStartDate(), "dd-MMM-yyyy"));
			addValue(mapper, map, "subscriptionStartDate", CommonUtils.format(
					s.getSubscriptionStartDate(), "dd-MMM-yyyy"));

			addValue(mapper, map, "trialendDate",
					CommonUtils.format(s.getTrialEndDate(), "dd-MMM-yyyy"));
			addValue(mapper, map, "trialstartDate",
					CommonUtils.format(s.getTrialStartDate(), "dd-MMM-yyyy"));
			addValue(mapper, map, "renewalNoticeDate",
					CommonUtils.format(s.getRenewalNoticeDate(), "dd-MMM-yyyy"));
			addValue(mapper, map, "status", s.getSubscriptionStatus());
			addValue(mapper, map, "subscriptionCost",
					"" + s.getSubscriptionCostAmount());
			addValue(
					mapper,
					map,
					"paymentDetails",
					s.getPaymentStatus()
							+ " "
							+ CommonUtils.emptyIfNull(CommonUtils.format(
									s.getLastPaymentDttm(), "dd-MMM-yyyy")));
		}
		// lst.add(map);

		return map;
	}

	public String getAmountDue(SubscriptionData data) {
		if (data.getPaymentStatusID() == 148003)
			return "0";
		else
			return CommonUtils.formatAmountINR(
					data.getSubscriptionCostAmount(), true);
	}

	/*@RequestMapping(value = "/report", method = { RequestMethod.GET })
	public void renderBirt(HttpServletRequest request,
			HttpServletResponse response) {

		ReportProcessor processor = ReportProcessor.getReportProcessor();
		processor.initilizeBirtEngine();
		request.getParameter("ReportName");
		request.getParameter("userID");
		try {
			System.out.println("request " + request.getRequestURI());
			System.out.println("request Map " + request.getParameterMap());
			System.out.println("processing report complete");
			processor.processReport(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
*/
	public static String[] showSubscriptionStatus(Partner partner) {
		String[] subscriptionStatus = new String[4];
		subscriptionStatus[0] = "";
		subscriptionStatus[1] = "";
		subscriptionStatus[2] = "";
		subscriptionStatus[3] = "";
		if (partner.getCurrentSubscriptionTypeID() == null) {
			subscriptionStatus[0] = "Pending T&C Acceptance";
			return subscriptionStatus;
		}
		if (partner.getCurrentSubscriptionTypeID().intValue() == 149001) {
			int gap = CommonUtils.getActualGapInDays(partner
					.getSubscriptionExpiryDate());

			if (partner.getSubscriptionStatusID().intValue() == 147003) {
				subscriptionStatus[0] = "Cancelled ";
			} else if (partner.getSubscriptionStatusID().intValue() == 147001) {
				subscriptionStatus[0] = "Valid Till "
						+ CommonUtils.formatDate(partner
								.getSubscriptionExpiryDate());
			} else if (partner.getSubscriptionStatusID().intValue() == 147002) {
				subscriptionStatus[0] = "Expired On "
						+ CommonUtils.formatDate(partner
								.getSubscriptionExpiryDate());
			}
			if (gap >= 0) {
				subscriptionStatus[3] = " " + gap + " Days to Go.";
			} else {
				subscriptionStatus[3] = " Overdue By " + Math.abs(gap) + " .";
			}

		} else {
			int gap = CommonUtils.getActualGapInDays(partner
					.getSubscriptionExpiryDate());
			if (partner.getSubscriptionStatusID().intValue() == 147003) {
				subscriptionStatus[0] = "Cancelled ";
			} else if (partner.getSubscriptionStatusID().intValue() == 147001) {
				subscriptionStatus[0] = "Valid Till "
						+ CommonUtils.formatDate(partner
								.getSubscriptionExpiryDate());
			} else if (partner.getSubscriptionStatusID().intValue() == 147002) {
				subscriptionStatus[0] = "Expired On "
						+ CommonUtils.formatDate(partner
								.getSubscriptionExpiryDate());
			}
			if (gap >= 0) {
				subscriptionStatus[3] = " " + gap + " Days to Go.";
			} else {
				subscriptionStatus[3] = " Overdue By " + Math.abs(gap)
						+ " Days.";
			}

		}

		if (partner.getSubscriptionStatusID().intValue() == 147001) {
			Calendar c1 = Calendar.getInstance();
			c1.setTime(partner.getSubscriptionExpiryDate());
			Calendar c2 = Calendar.getInstance();
			boolean isExpired = CommonUtils.compare(c1, c2) < 0;
			if (partner.getCurrentSubscriptionTypeID().intValue() == 149002) {
				subscriptionStatus[1] = partner.getCurrentSubscriptionType();
				subscriptionStatus[2] = "label label-success";
			} else {
				subscriptionStatus[1] = partner.getSubscriptionStatus();
				subscriptionStatus[2] = "label label-info";
			}
			if (isExpired) {
				subscriptionStatus[2] = "label label-warning";
			}

		} else if (partner.getSubscriptionStatusID().intValue() == 147002) {
			subscriptionStatus[2] = "label label-danger";
			subscriptionStatus[1] = partner.getSubscriptionStatus();
		} else {
			subscriptionStatus[2] = "label label-danger";
			subscriptionStatus[1] = partner.getSubscriptionStatus();
		}

		return subscriptionStatus;

	}

	@RequestMapping(value = "/reportview", method = { RequestMethod.GET })
	public ModelAndView showReport(HttpServletRequest request,
			HttpServletResponse response, ReportRequest repReq) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		repReq.setBuId(userSession.getBuId());
		repReq.setUserId(userSession.getUserId());
		// subxReq.setPartyId(userSession.getPartyId());
		String reportType = request.getParameter("type");
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		ModelAndView mav = new ModelAndView(
				"report/report_PartnersInTrialPeriod");
		mav.addObject("size", pagesize);
		if ("0".equalsIgnoreCase(reportType)) {
			repReq.setReportType("PartnerInTrial");
			repReq.setUserId(userSession.getUserId());
			repReq.setBuId(userSession.getBuId());

			ReportData data = subxService.getSubscriptionReports(repReq);

			if ("xls".equalsIgnoreCase(repReq.getFormat())) {
				xlsExport(request, response, data, "Partner In Trial Period ");
				return null;
			}

			mav.addObject("category",
					subxService.getCodeValue(userSession.getBuId(), "150"));
			mav.addObject("payment",
					subxService.getCodeValue(userSession.getBuId(), "154"));

			mav.addObject("reportData", data);

			return mav;

		}
		if ("1".equalsIgnoreCase(reportType)) {
			repReq.setReportType("PaymentDue");
			repReq.setUserId(userSession.getUserId());
			repReq.setBuId(userSession.getBuId());

			ReportData data = subxService.getSubscriptionReports(repReq);

			if ("xls".equalsIgnoreCase(repReq.getFormat())) {
				xlsExport(request, response, data, "Payment Due");
				return null;
			}

			mav = new ModelAndView("report/report_PartnersPaymentDue");
			mav.addObject("category",
					subxService.getCodeValue(userSession.getBuId(), "150"));
			mav.addObject("size", pagesize);
			mav.addObject("reportData", data);
			return mav;

		}
		if ("2".equalsIgnoreCase(reportType)) {
			repReq.setReportType("SubxMis");
			repReq.setUserId(userSession.getUserId());
			repReq.setBuId(userSession.getBuId());

			ReportData data = subxService.getSubscriptionReports(repReq);

			if ("xls".equalsIgnoreCase(repReq.getFormat())) {
				xlsExport(request, response, data, "Subx Mis");
				return null;
			}
			mav.addObject("reportRequest", repReq);
			mav = new ModelAndView("report/report_SubscriptionMIS");
			mav.addObject("reportData", data);
			mav.addObject("size", pagesize);
			return mav;

		}
		if ("3".equalsIgnoreCase(reportType)) {
			repReq.setReportType("PaymentMis");
			repReq.setUserId(userSession.getUserId());
			repReq.setBuId(userSession.getBuId());

			ReportData data = subxService.getSubscriptionReports(repReq);

			if ("xls".equalsIgnoreCase(repReq.getFormat())) {
				xlsExport(request, response, data, "Payment Mis");
				return null;
			}

			mav = new ModelAndView("report/report_PaymentMIS");
			mav.addObject("category",
					subxService.getCodeValue(userSession.getBuId(), "150"));

			mav.addObject("reportData", data);
			mav.addObject("reportRequest", repReq);
			mav.addObject("size", pagesize);
			return mav;

		}
		if ("4".equalsIgnoreCase(reportType)) {
			repReq.setReportType("TransactionReport");
			repReq.setUserId(userSession.getUserId());
			repReq.setBuId(userSession.getBuId());

			ReportData data = subxService.getSubscriptionReports(repReq);

			if ("xls".equalsIgnoreCase(repReq.getFormat())) {
				xlsExport(request, response, data, "Transaction Details");
				return null;
			}

			mav = new ModelAndView("report/report_TransactionDetails");
			mav.addObject("category",
					subxService.getCodeValue(userSession.getBuId(), "150"));

			mav.addObject("reportData", data);
			mav.addObject("reportRequest", repReq);
			mav.addObject("size", pagesize);
			return mav;

		}
		return mav;
	}

	@RequestMapping(value = "/partnerList.json", method = { RequestMethod.GET })
	public @ResponseBody
	List<KeyValue> getPartners(Model m, HttpServletRequest request,
			HttpServletResponse response, SubxRequest req) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		req.setPartyId(userSession.getPartyId());
		req.setBuId(userSession.getBuId());
		if (StringUtils.isEmpty(req.getSearchText())) {
			req.setSearchText("");
		}
		if (StringUtils.isEmpty(req.getSearchType())) {
			req.setSearchType("");
		}
		List<KeyValue> lst = subxService.getPartners(req);
		Collections.sort(lst);
		return lst;
	}

	@RequestMapping(value = "/subxProducts", method = { RequestMethod.GET })
	public ModelAndView subxProducts(HttpServletRequest request,
			HttpServletResponse response, SubxRequest req) {
		logger.info("in loadpartner PartnerSPController");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		req.setBuId(userSession.getBuId());
		logger.info(userSession.getUserName());
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "100";
		}

		ModelAndView mav = new ModelAndView("partner/subx_products");

		List<SubxProductData> products = subxService.getPartyProducts(req);
		List<SubxProductData> filterdProducts = new ArrayList<SubxProductData>();

		mav.addObject("allProducts", products);
		mav.addObject("products", filterdProducts);
		mav.addObject("paymentMethods",
				subxService.getCodeValue(userSession.getBuId(), "154"));
		mav.addObject("paymentFreq",
				subxService.getCodeValue(userSession.getBuId(), "63"));

		return mav;
	}

	private void xlsExport(HttpServletRequest request,
			HttpServletResponse response, ReportData data, String reportName) {

		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font = workbook.createFont();
		/* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		/* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet(reportName);

		int rowNum = 0;
		int column = 0;
		HSSFRow excelRow = sheet.createRow(rowNum++);
		for (String c : data.getFields()) {
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(c.toUpperCase());
		}
		for (Object ob : data.getData()) {
			excelRow = sheet.createRow(rowNum++);
			column = 0;
			for (String h : data.getFields()) {
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue((String) ((Map) ob).get(h));
			}
		}

		try {
			response.addHeader("Content-type", "application/vnd.ms-excel");
			response.addHeader("Content-Disposition", "attachment;filename="
					+ reportName + ".xls");
			workbook.write(response.getOutputStream());

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "subxProduct/add", method = { RequestMethod.GET })
	public ModelAndView addSubxProducts(Model m, HttpServletRequest request,
			HttpServletResponse response, SubxRequest req) {

		ModelAndView mav = new ModelAndView("partner/subx_products_add");
		List<KeyValue> products = subxService.getProducts(req);
		mav.addObject("products", products);
		return mav;
	}

	@RequestMapping(value = "subxProduct/save", method = { RequestMethod.POST })
	@ResponseBody
	public SubxProductData convertToProducts(HttpServletRequest request) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		userSession.getBuId();
		userSession.getPartyId();
		SubxProductData req = new SubxProductData();
		req.addAttribute(153001, request.getParameter("TrialPeriodDays"));
		req.addAttribute(153003, request.getParameter("SubscriptionPeriod"));
		req.addAttribute(153004, request.getParameter("RenewalNoticePeriod"));
		req.addAttribute(153009,
				request.getParameter("TrialExpiryFirstNotifyDays"));
		req.addAttribute(153010,
				request.getParameter("TrialExpiryReminderNotifyStartDays"));
		req.addAttribute(153011,
				request.getParameter("SubscriptionRenewalNotifyDays"));
		req.addAttribute(153012, request
				.getParameter("SubscriptionExpiryReminderNotifyStartDays"));
		req.addAttribute(153013, request.getParameter("PaymentDueNotifyDays"));
		req.addAttribute(153014,
				request.getParameter("PaymentDueNotifyReminderStartDays"));
		req.addAttribute(153015,
				request.getParameter("AccessRestrictedNotifyDays"));
		req.addAttribute(153016, request.getParameter("PartnerCientUsers"));
		req.addAttribute(153017, request.getParameter("SMSperContact"));
		req.addAttribute(153018, request.getParameter("EmailperContact"));
		req.addAttribute(153019, request.getParameter("Clients"));
		req.addAttribute(153020, request.getParameter("Opportunities"));
		req.addAttribute(153021, request.getParameter("Folios"));
		req.addAttribute(153022, request.getParameter("PreprintedForms"));
		req.addAttribute(153023, request.getParameter("ContactDocuments"));
		req.addAttribute(153024,
				request.getParameter("FreeSubscriptionPlanCount"));

		return req;
	}

	@RequestMapping(value = "/saveProduct", method = { RequestMethod.POST })
	public @ResponseBody
	String savePartyProduct(HttpServletRequest request) {

		SubxProductData subxProductData = convertToProducts(request);

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		SubxRequest req = new SubxRequest();
		req.setBuId(userSession.getBuId());

		subxService.addUpdateProduct(subxProductData);

		return "success";

	}

	@RequestMapping(value = "/report/resourceUtil", method = { RequestMethod.GET })
	public ModelAndView showResourceUtilReport(HttpServletRequest request,
			HttpServletResponse response, ReportRequest req) throws Exception {

		ModelAndView mav = new ModelAndView(
				"report/report_resource_utilization");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		// ReportData data = subxService.getResourceUtilReport(req);
		// req.setBuId(userSession.getBuId());
		// mav.addObject("data", data);
		return mav;
	}

}
