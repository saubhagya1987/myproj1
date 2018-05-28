package in.fiinfra.report.ctrl;

import in.fiinfra.birt.models.IssuerId;
import in.fiinfra.common.common.BaseRequest;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.ContactData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.common.ctrl.AbstractController;
import in.fiinfra.cp.common.model.PortfolioRequest;
import in.fiinfra.cp.common.model.ReportRequest;
import in.fiinfra.cp.common.util.AuthHandler;
import in.fiinfra.cp.common.util.Link;
import in.fiinfra.document.ctrl.DocumentController;
import in.fiinfra.document.service.DocumentService;
import in.fiinfra.portfolio.service.PortfolioService;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ObjectNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/report")
public class ReportController extends AbstractController {
	private static final Logger LOGGER = Logger
			.getLogger(ReportController.class);
	String url;

	@Autowired
	private RestTemplate restTemplate;
	@Value("${URL_GET_ISSUERID}")
	private String URL_GET_ISSUERID;

	@Value("${SSRS_URL2}")
	private String ssrsURL;


	public RestTemplate getRestTemplate() {
		return restTemplate;
	}

	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

	@Autowired
	private ObjectMapper objectMapper;

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	@Link(label="My Reports", family="My Reports", parent = "" )
	@RequestMapping(value = "/myReports", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String showReports(Model m) {
		return "cp/myReports";
	}

	@RequestMapping(value = "/reports", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String reports(ReportRequest req, Model model, HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		UserSession user = AuthHandler.getCurrentUser();
		req.setPartyId(user.getPartyId());
		req.setBuId(user.getBuId());
		model.addAttribute("q", req);
		StringBuilder param = new StringBuilder();
		
		model.addAttribute("reportTitle", getReportTitle(req.getName()));
		String redirect = "report/view";
		
		String reportURL = ssrsURL;

		if ("PD".equalsIgnoreCase(req.getName())) {
		/*	Calendar cal = Calendar.getInstance();*/
        SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");			
        Date date =new Date();	
        /*String abc=CommonUtils.format(cal.getTime(),"mm-dd-yyyy");*/
			BaseRequest.append(param, "as_on_date",formatter.format(date));
			BaseRequest.append(param, "PartyID", user.getPartyId());
			BaseRequest.append(param, "partnerId", user.getOwnerId());									
			BaseRequest.append(param, "loggedpartyId", user.getOwnerId());
			reportURL += "ClientPortfolioDetailStatement&rs:Command=Render&rc:Parameters=false";			
			model.addAttribute("ssrsUrl", reportURL);		
			
			
		}
		else if ("PS".equalsIgnoreCase(req.getName())) {
			/*Calendar cal = Calendar.getInstance();*/
			SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");			
	        Date date =new Date();
			BaseRequest.append(param, "as_at_date",formatter.format(date));
			BaseRequest.append(param, "PartyID", user.getPartyId());
			BaseRequest.append(param, "partnerId", user.getOwnerId());
			BaseRequest.append(param, "loggedpartyId", user.getOwnerId());

			model.addAttribute("type", "birt");

			reportURL += "ClientPortfolioSummary&rs:Command=Render&rc:Parameters=false"; 
			model.addAttribute("ssrsUrl", reportURL);
			/*model.addAttribute("reportTitle", "Portfolio Summary Report");*/
		}		
		else if ("TD".equalsIgnoreCase(req.getName())) {
		/*	Calendar cal = Calendar.getInstance();*/
/*			SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");			
	        Date date =new Date();*/
			/*BaseRequest.append(param, "start_date",formatter.format(date));
			BaseRequest.append(param, "end_date",formatter.format(date));	*/		
			
			BaseRequest.append(param, "partnerId", user.getOwnerId());
			BaseRequest.append(param, "Party_id", user.getPartyId());
			BaseRequest.append(param, "loggedpartyId", user.getOwnerId());
			//BaseRequest.append(param, "partnerId", user.getOwnerId());
			
			
		
			model.addAttribute("type", "birt");
			reportURL += "ClientWiseTransactionStatement&rs:Command=Render&rc:Parameters=false"; 
			model.addAttribute("ssrsUrl", reportURL);
			
			
			/*BaseRequest.append(param, "EndDate",CommonUtils.format(cal.getTime(), "mm/dd/yyyy"));
		cal.add(Calendar.MONTH, -6);
			BaseRequest.append(param, "StartDate",CommonUtils.format(cal.getTime(), "mm/dd/yyyy"));*/
			DocumentService service = getBean(DocumentService.class);
			req.setPartyId(user.getPartyId());
			List<IssuerId> companyID = service.getCompanyId(req);
			List<IssuerId> productID = service.getProductId(req);
			model.addAttribute("companyID", companyID);
			//model.addAttribute("productID", productID);
	/*		List<IssuerId> lst = service.getIssuerId(req);
		    model.addAttribute("issuers", lst);
		    
		    List<KeyValue> trxTypes = toKeyValue(service.getCodeValue("502"));
		    trxTypes.add(0, new KeyValue(0, "Select"));
		    model.addAttribute("trxTypes", trxTypes);*/
		    
			return "report/trx" ;
		} 
		else if ("UH".equalsIgnoreCase(req.getName())) {
			/*Calendar cal = Calendar.getInstance();*/
			SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");			
	        Date date =new Date();
			BaseRequest.append(param, "AsOnDate",formatter.format(date));
			BaseRequest.append(param, "Party_id", user.getPartyId());
			BaseRequest.append(param, "partnerId", user.getOwnerId());
			BaseRequest.append(param, "partnerId", user.getOwnerId());
			BaseRequest.append(param, "loggedpartyId", user.getOwnerId());

			model.addAttribute("type", "birt");
			reportURL += "ClientUnitHoldReport&rs:Command=Render&rc:Parameters=false";
			model.addAttribute("ssrsUrl", reportURL);
			
		} 
		else if ("SIP".equalsIgnoreCase(req.getName())) {
			/*Calendar cal = Calendar.getInstance();*/
			SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");			
	        Date date =new Date();
			BaseRequest.append(param, "as_at_date",formatter.format(date));
			BaseRequest.append(param, "PartyID", user.getPartyId());
			BaseRequest.append(param, "partnerId", user.getOwnerId());
			BaseRequest.append(param, "loggedpartyId", user.getOwnerId());

			model.addAttribute("type", "birt");
			reportURL += "ClientWiseSIPDetails&rs:Command=Render&rc:Parameters=false";
			model.addAttribute("ssrsUrl", reportURL);
			
		} 
		else if ("GD".equalsIgnoreCase(req.getName())) {
			
			BaseRequest.append(param, "partyId", user.getPartyId());
			BaseRequest.append(param, "partnerId", user.getOwnerId());
			BaseRequest.append(param, "loggedpartyId", user.getOwnerId());
			BaseRequest.append(param, "buId", user.getBuId());
			

			model.addAttribute("type", "birt");
			reportURL += "ClientGoalDetailsReport&rs:Command=Render&rc:Parameters=false";
			
			model.addAttribute("ssrsUrl", reportURL);
			
		}
		else if ("GS".equalsIgnoreCase(req.getName())) {
			int no=0;
			String s=String.valueOf(no);
			BaseRequest.append(param, "partyId", user.getPartyId());
			BaseRequest.append(param, "partnerId", user.getOwnerId());
			BaseRequest.append(param, "loggedpartyId", user.getOwnerId());
			BaseRequest.append(param, "buId", user.getBuId());
			BaseRequest.append(param, "nodeId", s);

			model.addAttribute("type", "birt");
			reportURL += "ClientGoalSummaryReport&rs:Command=Render&rc:Parameters=false";
			model.addAttribute("ssrsUrl", reportURL);
			
		}
		else {
			model.addAttribute("type", "doc");
			BaseRequest.append(param, "ReportName",req.getName());
		}

		model.addAttribute("paramUrl", param.toString());
		model.addAttribute("ReportFormat", "html");
		return redirect;
	}

	private String getReportTitle(String reportType){
		if ("PD".equalsIgnoreCase(reportType)) {
			return "Portfolio Detail Report";
		}
		else if ("PS".equalsIgnoreCase(reportType)) {
			return "Portfolio Summary Report";
		}		
		else if ("AP".equalsIgnoreCase(reportType)) {
			return "Action Plan";
		}		
		else if ("UH".equalsIgnoreCase(reportType)) {
			return "My Holdings";
		}		
		else if ("SIP".equalsIgnoreCase(reportType)) {
			return "SIP";
		}		
		else if ("APQ".equalsIgnoreCase(reportType)) {
			return "Quick Analysis";
		}		
		else if ("APS".equalsIgnoreCase(reportType)) {
			return "Summary Analysis";
		}		
		else if ("APD".equalsIgnoreCase(reportType)) {
			return "Detailed Analysis";
		}		
		else if ("LP".equalsIgnoreCase(reportType)) {
			return "Last Generated Plan";
		}		
		else if ("GS".equalsIgnoreCase(reportType)) {
			return "Goal Summary";
		}		
		else if ("GD".equalsIgnoreCase(reportType)) {
			return "Goal Details";
		}		
		else if ("TD".equalsIgnoreCase(reportType)) {
			return "My Transactions";
		}

		return "";
	}

/*	private void renderBirt(String reportName, HttpServletRequest request,
			HttpServletResponse response) {

		ReportProcessor processor = ReportProcessor.getReportProcessor();
		processor.initilizeBirtEngine();

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
	private void renderDocument(String reportName, HttpServletRequest request,
			HttpServletResponse response) {
		UserSession user = AuthHandler.getCurrentUser();
		user.getPartyId();

		DocumentRequest req = new DocumentRequest();
		req.setPartyId(user.getPartyId());
		req.setBuId(user.getBuId());
		req.setReportType(reportName);

//		if ("AP".equalsIgnoreCase(reportName)) {
//			req.setRefTypeId(111010);
//		}
//		else if("APQ".equalsIgnoreCase(reportName) || "APD".equalsIgnoreCase(reportName) || "APS".equalsIgnoreCase(reportName)){
//			req.setRefTypeId(111008);
//		}
//		else if("LP".equalsIgnoreCase(reportName)){
//			req.setRefTypeId(111010);
//		}
		
		DocumentData doc = null;

		
			DocumentService service = getBean(DocumentService.class);

			List<DocumentData> docs = service.getDocuments(req);
			if (docs != null && !docs.isEmpty()) {
				doc = docs.iterator().next();
			}
		
		boolean download = "PDF".equalsIgnoreCase(request.getParameter("reportFormat"));

		if (doc == null) {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("<div class='noData'> Report Not Found.. <div>");
				writer.flush();
				return;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} else {

			try {
				File f = new File(doc.getFileStoragePathURI());
				if (f.exists()) {
					String fileType = doc.getFileName().substring(
							doc.getFileName().lastIndexOf(".") + 1);
					response.setContentType(DocumentController
							.getContentType(fileType));
					 response.setHeader("Content-Disposition",
							 (download?"attachment;":"inline;") +" filename=\"" + doc.getFileName() + "\"");
					FileCopyUtils.copy(
							new FileInputStream(doc.getFileStoragePathURI()),
							response.getOutputStream());
					response.flushBuffer();
				} else {
					PrintWriter writer;
					try {
						writer = response.getWriter();
					} catch (IOException e1) {
						try {
							response.sendRedirect("/report/myReports");
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						;
						return;
					}
					writer.write("<div class='noData' id='errorMsg'>Error downloading File. File Not Found. </div>");
					writer.flush();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	@RequestMapping(value = "/birtreport", method = RequestMethod.GET)
	public void birtreport(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession user = AuthHandler.getCurrentUser();
		request.setAttribute("partyid", user.getPartyId());

		String reportName = request.getParameter("ReportName");
		if (reportName == null) {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("<div> Invalid Report !!! <div>");
				writer.flush();
				return;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		/*if (reportName.endsWith("rptdesign")) {
			renderBirt(reportName, request, response);
		} else {
			renderDocument(reportName, request, response);
		}*/
	}

	@RequestMapping(value = "/getIssuerID", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void getIssuerID(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("hello");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();

		String url = URL_GET_ISSUERID + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		uriCB.queryParam("buId", buId);
		BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<IssuerId> issuerIdList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			issuerIdList = br.getResponseListObject();
		}

		// logger.info("codeValueDataList: ");

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, issuerIdList);

	}

	@RequestMapping(value = "/clientholding", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String clientholding(Model model, HttpServletRequest request,
			HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		request.getSession().removeAttribute("headerName");
		return "report/clientholding";
	}

	@RequestMapping(value = "/clientsipdue", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String clientsipdue(Model model, HttpServletRequest request,
			HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		request.getSession().removeAttribute("headerName");
		return "report/clientsipdue";
	}

	@RequestMapping(value = "/clientportfoliodetailedstatement", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String clientportfoliodetailedstatement(Model model,
			HttpServletRequest request, HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		request.getSession().removeAttribute("headerName");
		return "report/clientportfoliodetailedstatement";
	}

	@RequestMapping(value = "/clienttransactionhistory", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String clienttransactionhistory(Model model,
			HttpServletRequest request, HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		request.getSession().removeAttribute("headerName");
		return "report/clienttransactionhistory";
	}

	@RequestMapping(value = "/clientmissingnomination", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String clientmissingnomination(Model model,
			HttpServletRequest request, HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		request.getSession().removeAttribute("headerName");
		return "report/clientmissingnomination";
	}

	@RequestMapping(value = "/getContactList", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void getContactList(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException {

		String url = FiinfraUtility.getRestDBURL();
		String searchString = request.getParameter("searchString");
		// partner and bu id needs to fetch from session
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		url = url + "services/et/quickSearchContacts?buId=" + buId
				+ "&searchString=" + searchString + "&partnerId=" + partnerId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		System.out.println("url::::::" + url);
		List<ContactData> contactData = Arrays.asList(restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
						ContactData[].class).getBody());
		System.out.println("contactData::::::" + contactData);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, contactData);
	}

	@RequestMapping(value = "/getCompanyId", method = RequestMethod.GET)
	public String getCompanyId(HttpServletRequest request,HttpServletResponse response,PortfolioRequest req,Model m) throws Exception 
	{

		UserSession userSession = AuthHandler.getCurrentUser();
		PortfolioService service = getBean(PortfolioService.class);
		req.setPartnerPartyID(userSession.getPartyId());
		req.setBuId(userSession.getBuId());
		//List<IssuerId> companyID = service.getCompanyId(req);
		/*String url = URL_GET_COMPANYID+userSession.getUserName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);*/
	
	/*	uriCB.queryParam("BuId",BuId);
		uriCB.queryParam("PartyId", PartyId);
		BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();*/
		/*List<IssuerId> companyList =null;
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			companyList = br.getResponseListObject();
		}
			

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, companyList);
*/		
		//m.addAttribute("companyID", companyID);
		return "";
	}
	
	
	
	@RequestMapping(value = "/getProductId", method = RequestMethod.GET)
	public void getProductId(HttpServletRequest request,HttpServletResponse response,ReportRequest req) throws Exception 
	{
		UserSession user = AuthHandler.getCurrentUser();
		req.setPartyId(user.getPartyId());
		DocumentService service = getBean(DocumentService.class);
		List<IssuerId> product = service.getProductId(req);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, product);
			}

	
	
	@RequestMapping(value = "/getInvestorStartDate", method = RequestMethod.GET)
	public void getInvestorStartDate(HttpServletRequest request,HttpServletResponse response) throws Exception 
	{

		/*UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		int BuId = userSession.getBuId();
		int ProductId=Integer.parseInt(request.getParameter("productId"));
		int PartyId=Integer.parseInt(request.getParameter("partyid"));
		
		String url = URL_GET_INVESTORTXNSTARTDATE+userSession.getUserName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	
		uriCB.queryParam("BuId",BuId);
		uriCB.queryParam("ProductId", ProductId);
		uriCB.queryParam("PartyId", PartyId);
		BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<IssuerId> companyList =null;
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			companyList = br.getResponseListObject();
		}
			
				
		logger.info("codeValueDataList: ");

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, companyList);*/
		
		
	/*	UserSession user = AuthHandler.getCurrentUser();
		req.setPartyId(user.getPartyId());
		DocumentService service = getBean(DocumentService.class);
		List<IssuerId> product = service.getInvestorStartDate(req);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, product);*/
		
	}

	
	
}
