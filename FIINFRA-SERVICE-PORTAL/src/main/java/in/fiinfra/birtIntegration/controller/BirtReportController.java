package in.fiinfra.birtIntegration.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import in.fiinfra.birt.models.ClientList;
import in.fiinfra.birt.models.ClientListOnly;
import in.fiinfra.birt.models.IssuerId;
import in.fiinfra.birt.models.PartnerList;
import in.fiinfra.birt.models.ServiceTeamMemberID;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.ActionPlanData;
import in.fiinfra.common.partner.ContactData;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
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
	@Value("${URL_GET_PARTNERLIST}")
	private String URL_GET_PARTNERLIST;
	@Value("${URL_GET_CLIENTLIST}")
	private String URL_GET_CLIENTLIST;
	@Value("${URL_GET_CLIENTLISTONLY}")
	private String URL_GET_CLIENTLISTONLY;
	@Value("${URL_GET_ServiceTeamMember}")
	private String URL_GET_ServiceTeamMember;
	
	
	@Value("${SSRS_URL2}")
	private String SSRS_URL2;
	
	public RestTemplate getRestTemplate() {
		return restTemplate;
	}

	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

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
		
	}*/
	
	
	
/*	@RequestMapping(value = "/birtreport", method = RequestMethod.GET)
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
		
	}
*/
		@RequestMapping(value = "/getIssuerID", method = RequestMethod.GET)
		public void getIssuerID(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId = userSession.getBuId();
			
			
			String url = URL_GET_ISSUERID+userSession.getUserName()+"/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
			uriCB.queryParam("buId",FiinfraConstants.BU_DEFAULT);
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
		
		@RequestMapping(value = "/getPartnerList", method = RequestMethod.GET)
		public void getPartnerList(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
	 
			
			
			
			String searchString=request.getParameter("searchString");			 
			 logger.info("in value");
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				int partyId = userSession.getPartyId();
				int buId = userSession.getBuId();
				String url = URL_GET_PARTNERLIST + userSession.getUserName()+ "/1234";
			//	String codeTypeIds=request.getParameter("codeTypeIds");
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				uriCB.queryParam("buId", buId);
				uriCB.queryParam("searchString",searchString);
				uriCB.queryParam("partyId", partyId);
				//uriCB.queryParam("buId", FiinfraConstants.AXISMFBUID);
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<PartnerList> br = new BaseResponse<PartnerList>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<PartnerList> list = new ArrayList<PartnerList>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					list= br.getResponseListObject();
		
				Logger.logEntry(this.getClass(), "codeValueDataList:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, list);
			
			

		}													
		
		

@RequestMapping(value = "/getPartnerListTwo", method = RequestMethod.GET)
public void getPartnerListTwo(HttpServletRequest request,
		HttpServletResponse response) throws Exception {

	
	
	
	String searchString=request.getParameter("searchString");			 
	 logger.info("in value");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int partyId = userSession.getPartyId();
		int buId = userSession.getBuId();
	//	url = URL_GET_BUPARTY_NAME+"xyz/1234";
		String url = URL_GET_PARTNERLIST + userSession.getUserName()+ "/1234";
	//	String codeTypeIds=request.getParameter("codeTypeIds");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId",buId);
		uriCB.queryParam("searchString",searchString);
		uriCB.queryParam("partyId", partyId);
		//uriCB.queryParam("buId", FiinfraConstants.AXISMFBUID);
		Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<PartnerList> br = new BaseResponse<PartnerList>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<PartnerList> list = new ArrayList<PartnerList>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			list= br.getResponseListObject();

		Logger.logEntry(this.getClass(), "codeValueDataList:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, list);
	
	
	

}
		
		@RequestMapping(value = "/getClientList", method = RequestMethod.GET)
		public void getClientList(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
	 
			
			
			String searchString=request.getParameter("searchString");	
			String partnerId=request.getParameter("partnerId");
			 logger.info("in value");
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			//	url = URL_GET_BUPARTY_NAME+"xyz/1234";
				String url = URL_GET_CLIENTLIST + userSession.getUserName()+ "/1234";
			//	String codeTypeIds=request.getParameter("codeTypeIds");
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				
				uriCB.queryParam("searchString",searchString);
				uriCB.queryParam("partnerId",partnerId);
				//uriCB.queryParam("codeTypeIds", codeTypeIds);
				//uriCB.queryParam("buId", FiinfraConstants.AXISMFBUID);
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<ClientList> br = new BaseResponse<ClientList>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<ClientList> list = new ArrayList<ClientList>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					list= br.getResponseListObject();
		
				Logger.logEntry(this.getClass(), "codeValueDataList:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, list);
			
			

		}		
		
		
		@RequestMapping(value = "/getClientListOnly", method = RequestMethod.GET)
		public void getClientListOnly(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
	 
			
			
			String searchString=request.getParameter("searchString");	
			String partnerId=request.getParameter("partnerId");
			 logger.info("in value");
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			//	url = URL_GET_BUPARTY_NAME+"xyz/1234";
				String url = URL_GET_CLIENTLISTONLY + userSession.getUserName()+ "/1234";
			//	String codeTypeIds=request.getParameter("codeTypeIds");
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				
				uriCB.queryParam("searchString",searchString);
				uriCB.queryParam("partnerId",partnerId);
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
	// url = SSRS_URL;
	 //Logger.logEntry("Hiiiiii"+url2);
	 //return url2;
	 
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, url2);
	 
	 
}
 
 
 @RequestMapping(value = "/getServiceTeamMember", method = RequestMethod.GET)
	public void getServiceTeamMember(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		
		
		String url = URL_GET_ServiceTeamMember+userSession.getUserName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	
		uriCB.queryParam("buId",FiinfraConstants.BU_DEFAULT);
		BaseResponse<ServiceTeamMemberID> br = new BaseResponse<ServiceTeamMemberID>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<ServiceTeamMemberID> ServiceTeamIdList =null;
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			ServiceTeamIdList = br.getResponseListObject();
		}
			
				
		logger.info("ServiceTeamMember: ");

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, ServiceTeamIdList);
		
		

	}
	
	
	
	
	// Foe Common jsp viewer jsp add by Naval
	
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
		
	
	
	


