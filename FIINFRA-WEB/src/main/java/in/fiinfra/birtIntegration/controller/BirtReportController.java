package in.fiinfra.birtIntegration.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;












import in.fiinfra.birt.models.ClientListOnly;
import in.fiinfra.birt.models.IssuerId;
import in.fiinfra.birt.models.SectionTypeID;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;


public class BirtReportController extends MultiActionController{

	private RestTemplate restTemplate;
	@Value("${URL_GET_ISSUERID}")
	private String URL_GET_ISSUERID;
	@Value("${URL_GET_CLIENTLISTONLY}")
	private String URL_GET_CLIENTLISTONLY;
	@Value("${SSRS_URL2}")
	private String SSRS_URL2;
	@Value("${URL_GET_SECTIONTYPEID}")
	private String URL_GET_SECTIONTYPEID;
	
	@Value("${URL_GET_COMPANYID}")
	private String URL_GET_COMPANYID;
	
	@Value("${URL_GET_PRODUCTID}")
	private String URL_GET_PRODUCTID;
	
	@Value("${URL_GET_INVESTORTXNSTARTDATE}")
	private String URL_GET_INVESTORTXNSTARTDATE;
	
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
	/*private ReportProcessor processor ;

	
	public BirtReportController(){
		processor = ReportProcessor.getReportProcessor();
		processor.initilizeBirtEngine();
		
	}
	
	
	
	@RequestMapping(value = "/birtreport", method = RequestMethod.GET)
	public void birtreport(HttpServletRequest request, HttpServletResponse response){
 
    
		try {
			System.out.println("request " + request.getRequestURI());
			System.out.println("request Map " + request.getParameterMap());
			System.out.println("processing report complete");
			processor.processReport(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
		
		public void  destroy(){

		   processor.shutDownBirtEngine();
		
	}*/
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getCompanyId", method = RequestMethod.GET)
	public void getCompanyId(HttpServletRequest request,HttpServletResponse response) throws Exception 
	{

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		int BuId = userSession.getBuId();
		int PartyId=Integer.parseInt(request.getParameter("partyid"));
		
		String url = URL_GET_COMPANYID+userSession.getUserName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	
		uriCB.queryParam("BuId",BuId);
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
		objectMapper.writeValue(out, companyList);
		
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getProductId", method = RequestMethod.GET)
	public void getProductId(HttpServletRequest request,HttpServletResponse response) throws Exception 
	{

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		int BuId = userSession.getBuId();
		int Compartyid=Integer.parseInt(request.getParameter("compartyid"));
		int PartyId=Integer.parseInt(request.getParameter("partyid"));
		
		String url = URL_GET_PRODUCTID+userSession.getUserName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	
		uriCB.queryParam("BuId",BuId);
		uriCB.queryParam("PartyId", PartyId);
		uriCB.queryParam("Compartyid", Compartyid);
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
		objectMapper.writeValue(out, companyList);
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getInvestorStartDate", method = RequestMethod.GET)
	public void getInvestorStartDate(HttpServletRequest request,HttpServletResponse response) throws Exception 
	{

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
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
		objectMapper.writeValue(out, companyList);
		
	}

		@RequestMapping(value = "/getIssuerID", method = RequestMethod.GET)
		public void getIssuerID(HttpServletRequest request,
				HttpServletResponse response) throws Exception {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId = userSession.getBuId();
			
			
			String url = URL_GET_ISSUERID+userSession.getUserName()+"/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
			uriCB.queryParam("buId",buId);
			BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<IssuerId> issuerIdList =null;
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				issuerIdList = br.getResponseListObject();
			}
				
					
			logger.info("codeValueDataList: ");

			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, issuerIdList);
			
			

		}
	
		
		@RequestMapping(value = "/getSectionTypeID", method = RequestMethod.GET)
		public void getSectionTypeID(HttpServletRequest request,
				HttpServletResponse response) throws Exception {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId = userSession.getBuId();
			
			
			String url = URL_GET_SECTIONTYPEID+userSession.getUserName()+"/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
			uriCB.queryParam("buId",buId);
			BaseResponse<SectionTypeID> br = new BaseResponse<SectionTypeID>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<SectionTypeID> issuerIdList =null;
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				issuerIdList = br.getResponseListObject();
			}
				
					
			logger.info("codeValueDataList: ");

			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, issuerIdList);
			
			

		}
	
		
		@RequestMapping(value = "/getClientListOnly", method = RequestMethod.GET)
		public void getClientListOnly(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
	 
			String searchString=request.getParameter("searchString");			 
			 logger.info("in value");
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				int partyId = userSession.getPartyId();
				int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
				String url = URL_GET_CLIENTLISTONLY + userSession.getUserName()+ "/1234";
			//	String codeTypeIds=request.getParameter("codeTypeIds");
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				
				uriCB.queryParam("searchString",searchString);
				uriCB.queryParam("partnerId",partyId);
				uriCB.queryParam("nodeId",nodeId);
				//uriCB.queryParam("codeTypeIds", codeTypeIds);
				//uriCB.queryParam("buId", FiinfraConstants.AXISMFBUID);
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<ClientListOnly> br = new BaseResponse<ClientListOnly>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<ClientListOnly> list = new ArrayList<ClientListOnly>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					list= br.getResponseListObject();
				
				Logger.logEntry(this.getClass(), "codeValueDataList:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, list);
			
			

		}	
		
		public void auditForReport(HttpServletRequest request,
				HttpServletResponse response){
		 
		 String actionByPartyId = request.getParameter("actionByPartyId");
		 
		 String actionByUserID = request.getParameter("actionByUserID");
		 String eventID =  request.getParameter("eventID");
		 String sourceSystemID =  request.getParameter("sourceSystemID");
		 String sourceModule =  request.getParameter("sourceModule");
		 String sourceScreen =  request.getParameter("sourceScreen");
		 String objectName = request.getParameter("objectName");
		 /////////////doAudit(int actionByPartyId, int actionByUserID,
			/*int eventID, int sourceSystemID, String sourceModule,
			String sourceScreen) */
		 FiinfraUtility.doAudit(Integer.parseInt(actionByPartyId), Integer.parseInt(actionByUserID),Integer.parseInt(eventID),Integer.parseInt(sourceSystemID), sourceModule, sourceScreen,objectName);
		 
	 }

		 public void urlForReport(HttpServletRequest request,
					HttpServletResponse response) throws Exception {
			
			
			 	String url2=SSRS_URL2;
						 
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, url2);
			 
			 
		}
		 
		 
		 @SuppressWarnings("unchecked")
			@RequestMapping(value = "/loadreport", method = RequestMethod.GET)
			public ModelAndView loadreport(HttpServletRequest request,
					HttpServletResponse response) {
				
			
				ModelAndView mav = new ModelAndView("report/showReport");
				String url=(String) request.getParameter("url");
				mav.addObject("url", url);
			
				return mav;

			}
		
}
