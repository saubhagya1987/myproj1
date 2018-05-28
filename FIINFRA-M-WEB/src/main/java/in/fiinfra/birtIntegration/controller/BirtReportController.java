package in.fiinfra.birtIntegration.controller;

import in.fiinfra.birt.models.IssuerId;
//import in.fiinfra.birt.models.IssuerId;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/report")
public class BirtReportController{
	private static final Logger LOGGER = Logger.getLogger(BirtReportController.class);
	@Autowired
	private RestTemplate restTemplate;
	@Value("${URL_GET_ISSUERID}")
	private String URL_GET_ISSUERID;
	
	@Value("${SSRS_URL2}")
	private String SSRS_URL2;
	
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
		LOGGER.debug("Engine Initilized!!");
	}
	
	
	
	@RequestMapping(value = "birtreport", method = RequestMethod.GET)
	public void birtreport(HttpServletRequest request, HttpServletResponse response){
 
    
		try {
			LOGGER.debug("request " + request.getRequestURI());
			LOGGER.debug("request Map " + request.getParameterMap());
			LOGGER.debug("processing report complete");
			processor.processReport(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
		
		public void  destroy(){

		   processor.shutDownBirtEngine();
		
	}*/

		@RequestMapping(value = "/getIssuerID", method = { RequestMethod.GET,
				RequestMethod.POST })
		public void getIssuerID(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			LOGGER.debug("hello");
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
				
					
//			logger.info("codeValueDataList: ");

			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, issuerIdList);
			
			

		}
		
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
				
					
		//	logger.info("codeValueDataList: ");

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
				
					
			//logger.info("codeValueDataList: ");

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
				
					
		//	logger.info("codeValueDataList: ");

			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, companyList);
			
		}

	
		@RequestMapping(value = "/urlForReport", method = RequestMethod.GET)
		 public void urlForReport(HttpServletRequest request,
					HttpServletResponse response) throws Exception {
			
			
			 	String url2=SSRS_URL2;
						 
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, url2);
			 
			 
		}
		
}
