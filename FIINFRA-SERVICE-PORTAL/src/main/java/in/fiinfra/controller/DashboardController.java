package in.fiinfra.controller;

import in.fiinfra.common.common.BroadCastData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.ActivityTarcker;
import in.fiinfra.common.service.vo.BroadCastNews;
import in.fiinfra.common.service.vo.Chat;
import in.fiinfra.common.service.vo.DataCollection;
import in.fiinfra.common.service.vo.Entities;
import in.fiinfra.common.service.vo.Execution;
import in.fiinfra.common.service.vo.ExecutionEnabler;
import in.fiinfra.common.service.vo.GupShup;
import in.fiinfra.common.service.vo.Like;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.PartnerRating;
import in.fiinfra.common.service.vo.PostComment;
import in.fiinfra.common.service.vo.Query;
import in.fiinfra.common.service.vo.Task;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.Logger;
import in.fiinfra.framework.models.Notification;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

public class DashboardController extends MultiActionController {

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(DashboardController.class);
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	
	String url;
	//("${URL_GET_PARTNER_PROFILE_RECORD}")
	
	@Value("${URL_GUPSHUP_LIKE_LIST}")
	String URL_GUPSHUP_LIKE_LIST;
	
	@Value("${URL_GUPSHUP_COMMENT_LIST}")
	String URL_GUPSHUP_COMMENT_LIST;
	
	@Value("${URL_GET_GS_EDIT}")
	String URL_GET_GS_EDIT;
	
	@Value("${URL_GUPSHUP_ISLIKE}")
	String URL_GUPSHUP_ISLIKE;
	
	@Value("${URL_GUPSHUP_COMMENT_COUNT}")
	String URL_GUPSHUP_COMMENT_COUNT;
	
	@Value("${URL_GUPSHUP_LIKE_COUNT}")
	String URL_GUPSHUP_LIKE_COUNT;
	
	@Value("${URL_ADD_GUPSHUP_COMMENT}")
	String URL_ADD_GUPSHUP_COMMENT;
	
	@Value("${URL_ADD_GUPSHUP_LIKE}")
	String URL_ADD_GUPSHUP_LIKE;
	
	@Value("${URL_GUPSHUP_LIST}")
	String URL_GUPSHUP_LIST;
	
	@Value("${URL_ADD_GUPSHUP}")
	String URL_ADD_GUPSHUP;
	
	@Value("${URL_PARTNER_BASED_TYPE}")
	String URL_PARTNER_BASED_TYPE;
	
	@Value("${URL_GET_ACTIVITY}")
	String URL_GET_ACTIVITY;
	
	@Value("${URL_ADD_RECENT_CHAT}")
	String URL_ADD_RECENT_CHAT;
	
	@Value("${URL_ADD_ACTIVITY}")
	String URL_ADD_ACTIVITY;
	
	@Value("${URL_PARTNER_ACTIVITY_CONTEXT}")
	String URL_PARTNER_ACTIVITY_CONTEXT;
	
	@Value("${URL_PARTNER_ACTIVITY_TYPE}")
	String URL_PARTNER_ACTIVITY_TYPE;
	
	@Value("${URL_PARTNER_ACTIVITY}")
	String URL_PARTNER_ACTIVITY;
	
	@Value("${URL_GET_BROADCAST_NEWS}")
	String URL_GET_BROADCAST_NEWS;
	
	@Value("${URL_TASK_COUNT_DETAIL}")
	String URL_TASK_COUNT_DETAIL;
	
	@Value("${URL_PARTNER_DATA_COLLECTION}")
	String URL_PARTNER_DATA_COLLECTION;
	
	@Value("${URL_PARTNER_EXECUTION}")
	String URL_PARTNER_EXECUTION;
	
	@Value("${URL_PARTNER_ENTITIES_ACCOUNTS}")
	String URL_PARTNER_ENTITIES_ACCOUNTS;
	
	@Value("${URL_PARTNER_EXE_TRACKER}")
	String URL_PARTNER_EXE_TRACKER;
	
	@Value("${URL_PARTNER_LAST_LOGIN}")
	String URL_PARTNER_LAST_LOGIN;
	
	@Value("${URL_PARTNER_RECENT_CHAT}")
	String URL_PARTNER_RECENT_CHAT;
	
	@Value("${URL_PARTNER_PENDING_QUERY}")
	String URL_PARTNER_PENDING_QUERY;
	
	@Value("${URL_ADV_TASK_CAL}")
	String URL_ADV_TASK_CAL;
	
	@Value("${URL_QUERY_ALERT_LIST}")
	String URL_QUERY_ALERT_LIST;
	
	@Value("${URL_GET_TOP_PARTNER_LIST}")
	String URL_GET_TOP_PARTNER_LIST;
	
	@Value("${URL_TASK_COUNT_ALERT}")
	String URL_TASK_COUNT_ALERT;
	
	@Value("${URL_REASON_FOR_RATING}")
	String URL_REASON_FOR_RATING;
	
	@Value("${URL_SAVE_REASON_RATING}")
	String URL_SAVE_REASON_RATING;
	
	@Value("${GET_CURRUNT_RATING_REASON}")
	String GET_CURRUNT_RATING_REASON;
	
	
	@Value("${GET_RATING_HISTORY}")
	String GET_RATING_HISTORY;
	
	@Value("${URL_MULTISELECT}")
	String URL_MULTISELECT;
	
	@Value("${URL_EXECUTION_ENABLER}")
	String URL_EXECUTION_ENABLER;
	
	
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
	
	@SuppressWarnings("unchecked")
	public void showTopPartnerList(HttpServletRequest request,HttpServletResponse response)throws IOException {
		//System.out.println("In top 10 partner");
		 UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId=userSession.getBuId();
			int userId=userSession.getUserId();
			request.setAttribute("selectBased", request.getParameter("selectBased"));
			
			int selectBased = Integer.parseInt(request.getParameter("selectBased"));
			url = URL_GET_TOP_PARTNER_LIST + userSession.getName()
				+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			//uriCB.queryParam("buId", buId);
			uriCB.queryParam("buId", buId);
			uriCB.queryParam("userId", userId);
			uriCB.queryParam("selectBased", selectBased);
			
		//	uriCB.queryParam("userId", userId);
			BaseResponse<Partner> br = new BaseResponse<Partner>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<Partner> toppartnerData = new ArrayList<Partner>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				toppartnerData= br.getResponseListObject();
			logger.info(toppartnerData);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,toppartnerData);
			
	}
	@SuppressWarnings("unchecked")
	public void showTaskAlert(HttpServletRequest request,HttpServletResponse response)throws IOException {
	//	System.out.println("In Task Data List");
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId=userSession.getBuId();
		int userId=userSession.getUserId();
		url = URL_TASK_COUNT_ALERT + userSession.getName()
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("userId", userId);
		BaseResponse<Task> br = new BaseResponse<Task>();
		br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<Task> countTask = new ArrayList<Task>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			countTask= br.getResponseListObject();
		logger.info(countTask);
		PrintWriter out=null ;	
		out = response.getWriter();
		response.setContentType("application/json");
  		objectMapper.writeValue(out,countTask);
		
	}
	
	public void showPartnerBasedType(HttpServletRequest request,HttpServletResponse response)throws IOException{
		url = URL_PARTNER_BASED_TYPE+ "sanket"
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<Partner> partnerType = new ArrayList<Partner>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			partnerType= br.getResponseListObject();
		logger.info(partnerType);
		PrintWriter out=null ;	
		out = response.getWriter();
		response.setContentType("application/json");
  		objectMapper.writeValue(out,partnerType);
	}
	@SuppressWarnings("unchecked")
	public void showpendingQuery(HttpServletRequest request,HttpServletResponse response)throws IOException{
		//System.out.println("In Pending Query List");
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId=userSession.getBuId();
		int userId=userSession.getUserId();
		url = URL_QUERY_ALERT_LIST + userSession.getName()
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("userId", userId);
		BaseResponse<Query> br = new BaseResponse<Query>();
		br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<Query> queryAlert = new ArrayList<Query>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			queryAlert= br.getResponseListObject();
	
		logger.info(queryAlert);
		PrintWriter out=null ;	
		out = response.getWriter();
		response.setContentType("application/json");
  		objectMapper.writeValue(out,queryAlert);
		
		
	}
	
	public ModelAndView getPartnerdashboard(HttpServletRequest request,HttpServletResponse response) {

		
		// return jsp page
				
		logger.info("\nHELLO loadpartnerdashboard WelcomeController ");

		//request.setAttribute("active", request.getParameter("active"));
		ModelAndView mav = new ModelAndView("/partner/PartnerDashboard");
		mav.addObject("partyID", request.getParameter("partyID"));
		mav.addObject("partnername", request.getParameter("partnername"));
		mav.addObject("lastLogin", request.getParameter("lastLogin"));
		mav.addObject("active", request.getParameter("active"));
		mav.addObject("recordTypeID", request.getParameter("recordTypeID"));
		return mav;

	} 
	
	public ModelAndView getRmDashboard(HttpServletRequest request,HttpServletResponse response) {

		
		// return jsp page
				
		logger.info("\nHELLO loadpartnerdashboard WelcomeController ");

		//request.setAttribute("active", request.getParameter("active"));
		ModelAndView mav = new ModelAndView("/partner/RMDashboard");
		mav.addObject("rmname", request.getParameter("rmname"));
		mav.addObject("lastname", request.getParameter("lastname"));
		mav.addObject("partyID", request.getParameter("partyID"));

		return mav;

	}
	@SuppressWarnings("unchecked")
	public void showAdvTaskAlert(HttpServletRequest request,HttpServletResponse response)throws IOException{
		logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
		request.setAttribute("partyID", request.getParameter("partyID"));
		if (request.getParameter("partyID") != null)
		{
			
			int partyId = Integer.parseInt(request.getParameter("partyID"));
			url = URL_ADV_TASK_CAL + "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<Task> br = new BaseResponse<Task>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<Task> calAlert = new ArrayList<Task>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				calAlert= br.getResponseListObject();
			logger.info(calAlert);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,calAlert);
			
		
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public void showPartnerPendingQuery(HttpServletRequest request,HttpServletResponse response)throws IOException{
		logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
		request.setAttribute("partyID", request.getParameter("partyID"));
		if (request.getParameter("partyID") != null)
		{
			
			int partyId = Integer.parseInt(request.getParameter("partyID"));
			url = URL_PARTNER_PENDING_QUERY + "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<Query> br = new BaseResponse<Query>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<Query> ptqueryAlert = new ArrayList<Query>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				ptqueryAlert= br.getResponseListObject();
			logger.info(ptqueryAlert);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,ptqueryAlert);
			
		
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public void showPartnerRecentChat(HttpServletRequest request,HttpServletResponse response)throws IOException{
		 UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
		logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
		request.setAttribute("partyID", request.getParameter("partyID"));
		if (request.getParameter("partyID") != null)
		{
			int pstPartyId=userSession.getPartyId();
			int partnerPartyId = Integer.parseInt(request.getParameter("partyID"));
			url = URL_PARTNER_RECENT_CHAT + "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("pstPartyId", pstPartyId);
			uriCB.queryParam("partnerPartyId", partnerPartyId);		
			BaseResponse<Chat> br = new BaseResponse<Chat>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<Chat> recentChat = new ArrayList<Chat>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				recentChat= br.getResponseListObject();
			logger.info(recentChat);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,recentChat);
			
		}
	}
	
	public void showPartnerLastLogin(HttpServletRequest request,HttpServletResponse response)throws IOException{
		logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
		request.setAttribute("partyID", request.getParameter("partyID"));
		if (request.getParameter("partyID") != null)
		{
			
			int partyId = Integer.parseInt(request.getParameter("partyID"));
			url = URL_PARTNER_LAST_LOGIN + "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<User> br = new BaseResponse<User>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<User> lastLogin = new ArrayList<User>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				lastLogin= br.getResponseListObject();
			logger.info(lastLogin);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,lastLogin);
			
		}
	}
	
	
	public void showPartnerExeTracker(HttpServletRequest request,HttpServletResponse response)throws IOException{
		logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
		request.setAttribute("partyID", request.getParameter("partyID"));
		if (request.getParameter("partyID") != null)
		{
			
			int partyId = Integer.parseInt(request.getParameter("partyID"));
			url = URL_PARTNER_EXE_TRACKER + "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<Execution> br = new BaseResponse<Execution>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<Execution> exetracker = new ArrayList<Execution>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				exetracker= br.getResponseListObject();
			logger.info(exetracker);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,exetracker);
			
		}
	}
	

	public void showPartnerEntAccnts(HttpServletRequest request,HttpServletResponse response)throws IOException{
		logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
		request.setAttribute("partyID", request.getParameter("partyID"));
		if (request.getParameter("partyID") != null)
		{
			
			int partyId = Integer.parseInt(request.getParameter("partyID"));
			url = URL_PARTNER_ENTITIES_ACCOUNTS + "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<Entities> br = new BaseResponse<Entities>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<Entities> entityaccnts = new ArrayList<Entities>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				entityaccnts= br.getResponseListObject();
			logger.info(entityaccnts);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,entityaccnts);
			
		
		
		
		}	
		
	}
	
	public void  showPartnerExecution(HttpServletRequest request,HttpServletResponse response)throws IOException{
		logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
		request.setAttribute("partyID", request.getParameter("partyID"));
		if (request.getParameter("partyID") != null)
		{
			
			int partyId = Integer.parseInt(request.getParameter("partyID"));
			url = URL_PARTNER_EXECUTION+ "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<Execution> br = new BaseResponse<Execution>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<Execution> executionList = new ArrayList<Execution>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				executionList= br.getResponseListObject();
			logger.info(executionList);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,executionList);
			
		
		
		
		}	
		
	}
	
	public void showPartnerDataCollection(HttpServletRequest request,HttpServletResponse response)throws IOException{
		logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
		request.setAttribute("partyID", request.getParameter("partyID"));
		if (request.getParameter("partyID") != null)
		{
			
			int partyId = Integer.parseInt(request.getParameter("partyID"));
			url = URL_PARTNER_DATA_COLLECTION+ "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<DataCollection> br = new BaseResponse<DataCollection>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<DataCollection> dataCollection = new ArrayList<DataCollection>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				dataCollection= br.getResponseListObject();
			logger.info(dataCollection);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,dataCollection);
		}
	}
	
	@SuppressWarnings("unchecked")
	public void showTaskDetails(HttpServletRequest request,HttpServletResponse response)throws IOException {
	//	System.out.println("In Task Data List");
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId=userSession.getBuId();
		int userId=userSession.getUserId();
		url = URL_TASK_COUNT_DETAIL + userSession.getName()
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("userId", userId);
		BaseResponse<Task> br = new BaseResponse<Task>();
		br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<Task> countTask = new ArrayList<Task>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			countTask= br.getResponseListObject();
		logger.info(countTask);
		PrintWriter out=null ;	
		out = response.getWriter();
		response.setContentType("application/json");
  		objectMapper.writeValue(out,countTask);
		
	}
	
	 public void getBroadCastList(HttpServletRequest request,
			   HttpServletResponse response) throws Exception {
			  UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			  int buId=userSession.getBuId();
			  int sourceSystemId=FiinfraConstants.SERVICE_PORTAL;
			  String url = FiinfraUtility.getRestDBURL();

			  url = URL_GET_BROADCAST_NEWS+userSession.getName()+"/1234";
			  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			  uriCB.queryParam("buId", buId);
			  uriCB.queryParam("sourceSystemId", sourceSystemId);
			  
			  Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
			    .currentThread().getStackTrace()[1].getMethodName());
			 
			  List<BroadCastData> broadCastDatas = (List<BroadCastData>) FiinfraUtility.postRequest(uriCB, Object.class, restTemplate); 

			  Logger.logEntry(this.getClass(), "BroadCastData  :---"
			    + broadCastDatas, Logger.DEBUG, Thread.currentThread()
			    .getStackTrace()[1].getMethodName());
			  PrintWriter out = null;
			  out = response.getWriter();
			  response.setContentType("application/json");
			  objectMapper.writeValue(out,broadCastDatas);
			 }
	
	
	@SuppressWarnings("unchecked")
	public void showPartnerActivityTracker(HttpServletRequest request,HttpServletResponse response)throws IOException {
	//	System.out.println("In Task Data List");
		logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
		request.setAttribute("partyID", request.getParameter("partyID"));
		if (request.getParameter("partyID") != null)
		{
			
			int partyId = Integer.parseInt(request.getParameter("partyID"));
			url = URL_PARTNER_ACTIVITY+ "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<ActivityTarcker> br = new BaseResponse<ActivityTarcker>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<ActivityTarcker> actvityList = new ArrayList<ActivityTarcker>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				actvityList= br.getResponseListObject();
			logger.info(actvityList);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,actvityList);
			
		}
		
		
		}	
	
	
	@SuppressWarnings("unchecked")
	public void showPartnerActivityType(HttpServletRequest request,HttpServletResponse response)throws IOException {

			url = URL_PARTNER_ACTIVITY_TYPE+ "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<ActivityTarcker> br = new BaseResponse<ActivityTarcker>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<ActivityTarcker> actvityType = new ArrayList<ActivityTarcker>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				actvityType= br.getResponseListObject();
			logger.info(actvityType);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,actvityType);
		
		
		}	

	@SuppressWarnings("unchecked")
	public void showPartnerActivityContext(HttpServletRequest request,HttpServletResponse response)throws IOException {

			url = URL_PARTNER_ACTIVITY_CONTEXT+ "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<ActivityTarcker> br = new BaseResponse<ActivityTarcker>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<ActivityTarcker> actvityType = new ArrayList<ActivityTarcker>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				actvityType= br.getResponseListObject();
			logger.info(actvityType);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,actvityType);
		
		
		}	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addPartnerActivity", method = RequestMethod.GET)
	public void addPartnerActivity(HttpServletRequest request,HttpServletResponse response,ActivityTarcker activitytracker)throws JsonGenerationException, JsonMappingException, IOException, ParseException {
		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int lastModifiedBy = userSession.getUserId();
		activitytracker.setCreatedBy(createdBy);
		activitytracker.setLastModifiedBy(lastModifiedBy);
		
		String activityContextId=request.getParameter("activityContextId");
		String activitySubContextId=request.getParameter("activitySubContextId");
		
		activitytracker.setActivityContext(activityContextId);
		activitytracker.setActivitySubContextId(activitySubContextId);
		
		
		url = URL_ADD_ACTIVITY + "sanket" + "/1234";
		
		
		logger.info("url:-" + url);
		   
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, activitytracker, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{	
			result = FiinfraConstants.SUCCESS;
			// for audit functionality of call tracker
			String module = FiinfraConstants.SRP_ADD_CALL_TRACKER;
			int eventId = 97162;
			if (activitytracker.getActivityId() != 0 ) {
				module = FiinfraConstants.SRP_EDIT_CALL_TRACKER;
				eventId = 97163;
			}
			
			FiinfraUtility.doAudit(userSession.getPartyId(),
					userSession.getUserId(), eventId,
					FiinfraConstants.SERVICE_PORTAL,
					FiinfraConstants.SRP_SOURCE_MODULE_BROADCAST, module);
			if(activitytracker.getActivityId() == 0)
			{
				if(activitytracker.getSendEmail()==1)
				{
				Notification notification=null;
				//for(Map.Entry<Integer,String> map:passwordMap.entrySet()){
					Map<String,String> calltracklist=new HashMap<String,String>();
					calltracklist.put("callbody", activitytracker.getActivityNote());
				    calltracklist.put("callduration", Integer.toString(activitytracker.getActivitySpend()));
					notification=new Notification();
					notification.setSourceSystemID(31001); //need to add in finfra coinstants
					notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
					notification.setNotifyPartyID(activitytracker.getActivityOriginatedByPartyID());
					notification.setNotifyEventID(415); //need to add a param for new admin portal add partner
					notification.setBuId(userSession.getBuId());
				    notification.setPayloadMap(calltracklist);
					notification.setSessionID(request.getSession().getId());
					FrameworkUtil.notify(notification);
				}
				else if(activitytracker.getSendEmail()==2){
					Notification notification=null;
					//for(Map.Entry<Integer,String> map:passwordMap.entrySet()){
						Map<String,String> calltracklist=new HashMap<String,String>();
						calltracklist.put("callbody", activitytracker.getActivityNote());
					    calltracklist.put("callduration", Integer.toString(activitytracker.getActivitySpend()));
						notification=new Notification();
						notification.setSourceSystemID(31001); //need to add in finfra coinstants
						notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
						notification.setNotifyPartyID(activitytracker.getActivityOriginatedByPartyID());
						notification.setNotifyEventID(418); //need to add a param for new admin portal add partner
						notification.setBuId(userSession.getBuId());
					    notification.setPayloadMap(calltracklist);
						notification.setSessionID(request.getSession().getId());
						FrameworkUtil.notify(notification);
				}
				else if(activitytracker.getSendEmail()==3) {
					
					Notification notification=null;
					
					
					//for(Map.Entry<Integer,String> map:passwordMap.entrySet()){
						Map<String,String> calltracklist=new HashMap<String,String>();
						calltracklist.put("callbody", activitytracker.getActivityNote());
					    calltracklist.put("callduration", Integer.toString(activitytracker.getActivitySpend()));
						notification=new Notification();
						notification.setSourceSystemID(31001); //need to add in finfra coinstants
						notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
						notification.setNotifyPartyID(activitytracker.getActivityOriginatedByPartyID());
						notification.setNotifyEventID(419); //need to add a param for new admin portal add partner
						notification.setBuId(userSession.getBuId());
					    notification.setPayloadMap(calltracklist);
						notification.setSessionID(request.getSession().getId());
						FrameworkUtil.notify(notification);
					}
				else if(activitytracker.getSendEmail()==4){
						Notification notification=null;
					
					
					//for(Map.Entry<Integer,String> map:passwordMap.entrySet()){
						Map<String,String> calltracklist=new HashMap<String,String>();
						calltracklist.put("callbody", activitytracker.getActivityNote());
					    calltracklist.put("callduration", Integer.toString(activitytracker.getActivitySpend()));
						notification=new Notification();
						notification.setSourceSystemID(31001); //need to add in finfra coinstants
						notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
						notification.setNotifyPartyID(activitytracker.getActivityOriginatedByPartyID());
						notification.setNotifyEventID(421); //need to add a param for new admin portal add partner
						notification.setBuId(userSession.getBuId());
					    notification.setPayloadMap(calltracklist);
						notification.setSessionID(request.getSession().getId());
						FrameworkUtil.notify(notification);
					
				}
				
				
			}

		
		}
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, result);
		
		}	
	
	@SuppressWarnings("unchecked")
	public void getEditGSId(HttpServletRequest request,HttpServletResponse response)throws IOException {

			System.out.println("hiieeeee");
			logger.info("in loadallocationlist postId"+ request.getParameter("postId"));
		
			if (request.getParameter("postId") != null)
			{
				
				int postId = Integer.parseInt(request.getParameter("postId"));
				url = URL_GET_GS_EDIT + "sanket"
						+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				uriCB.queryParam("postId", postId);
				BaseResponse<GupShup> br = new BaseResponse<GupShup>();
				br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				List<GupShup> gupshup = new ArrayList<GupShup>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					gupshup= br.getResponseListObject();
				logger.info(gupshup);
				PrintWriter out=null ;	
				out = response.getWriter();
				response.setContentType("application/json");
		  		objectMapper.writeValue(out,gupshup);
				
			
			}
		}	
	
	@SuppressWarnings("unchecked")
	public void getActivityId(HttpServletRequest request,HttpServletResponse response)throws IOException {

			System.out.println("hiieeeee");
			logger.info("in loadallocationlist activityId"+ request.getParameter("activityId"));
		
			if (request.getParameter("activityId") != null)
			{
				
				int activityId = Integer.parseInt(request.getParameter("activityId"));
				url = URL_GET_ACTIVITY + "sanket"
						+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				uriCB.queryParam("activityId", activityId);
				BaseResponse<ActivityTarcker> br = new BaseResponse<ActivityTarcker>();
				br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				List<ActivityTarcker> actvitymyList = new ArrayList<ActivityTarcker>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					actvitymyList= br.getResponseListObject();
				logger.info(actvitymyList);
				PrintWriter out=null ;	
				out = response.getWriter();
				response.setContentType("application/json");
		  		objectMapper.writeValue(out,actvitymyList);
				
			
			}
		}	
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addgupShup", method = RequestMethod.GET)
	public void addgupShup(HttpServletRequest request,HttpServletResponse response,GupShup gupshup)throws JsonGenerationException, JsonMappingException, IOException, ParseException {
		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int postPartyId=userSession.getPartyId();
		int createdBy = userSession.getUserId();
		int lastModifiedBy = userSession.getUserId();
		int recordTypeId=userSession.getRecordtypeId();
		
		gupshup.setPostPartyId(postPartyId);
		gupshup.setRecordTypeId(recordTypeId);
		gupshup.setCreatedBy(createdBy);
		gupshup.setLastModifiedBy(lastModifiedBy);
		gupshup.setStatusRefID(137002);
		
		url = URL_ADD_GUPSHUP + "sanket" + "/1234";
		
		
		logger.info("url:-" + url);
		   
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, gupshup, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			result = FiinfraConstants.SUCCESS;
		
		}
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, result);
		
		}	
	
	@SuppressWarnings("unchecked")
	public void showGsCommentCount(HttpServletRequest request,HttpServletResponse response)throws IOException {
			
			System.out.println("hiieeeee");
			logger.info("in gupshuplist postId"+ request.getParameter("postId"));
			int postId = Integer.parseInt(request.getParameter("postId"));
			url = URL_GUPSHUP_COMMENT_COUNT+ "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("postId", postId);
			BaseResponse<GupShup> br = new BaseResponse<GupShup>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<GupShup> gupshup = new ArrayList<GupShup>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				gupshup= br.getResponseListObject();
			logger.info(gupshup);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,gupshup);
	  		
		
		}	
	@SuppressWarnings("unchecked")
	public void showGsLikeCount(HttpServletRequest request,HttpServletResponse response)throws IOException {
			
			System.out.println("hiieeeee");
			logger.info("in gupshuplist postId"+ request.getParameter("postId"));
			int postId = Integer.parseInt(request.getParameter("postId"));
			url = URL_GUPSHUP_LIKE_COUNT+ "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("postId", postId);
			BaseResponse<GupShup> br = new BaseResponse<GupShup>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<GupShup> gupshup = new ArrayList<GupShup>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				gupshup= br.getResponseListObject();
			logger.info(gupshup);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,gupshup);
	  		
		
		}	
	
	@SuppressWarnings("unchecked")
	public void showGsCommentList(HttpServletRequest request,HttpServletResponse response)throws IOException {
		   logger.info("in gupshuplist postId"+ request.getParameter("postId"));
		    int postId = Integer.parseInt(request.getParameter("postId"));
			url = URL_GUPSHUP_COMMENT_LIST+ "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("postId", postId);
			BaseResponse<PostComment> br = new BaseResponse<PostComment>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<PostComment> postcomment = new ArrayList<PostComment>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				postcomment= br.getResponseListObject();
			logger.info(postcomment);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,postcomment);
	  		
		
		}	
	@SuppressWarnings("unchecked")
	public void showGsLikeList(HttpServletRequest request,HttpServletResponse response)throws IOException {
		   logger.info("in gupshuplist postId"+ request.getParameter("likeRefID"));
		    int likeRefID = Integer.parseInt(request.getParameter("likeRefID"));
			url = URL_GUPSHUP_LIKE_LIST+ "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("likeRefID", likeRefID);
			BaseResponse<Like> br = new BaseResponse<Like>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<Like> lk = new ArrayList<Like>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				lk= br.getResponseListObject();
			logger.info(lk);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,lk);
	  		
		
		}	
	@SuppressWarnings("unchecked")
	public void showGupShupList(HttpServletRequest request,HttpServletResponse response)throws IOException {
			
			url = URL_GUPSHUP_LIST+ "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<GupShup> br = new BaseResponse<GupShup>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<GupShup> gupshup = new ArrayList<GupShup>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				gupshup= br.getResponseListObject();
			logger.info(gupshup);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,gupshup);
	  		
		
		}	
	
	@SuppressWarnings("unchecked")
	public void showGsUserLike(HttpServletRequest request,HttpServletResponse response)throws IOException {
			
		logger.info("in gupshuplist postId"+ request.getParameter("postId"));
		int likeRefId = Integer.parseInt(request.getParameter("postId"));
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int likePartyID=userSession.getPartyId();
		
		url = URL_GUPSHUP_ISLIKE+ "sanket"
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("likeRefId", likeRefId);
		uriCB.queryParam("likePartyID", likePartyID);
		BaseResponse<Like> br = new BaseResponse<Like>();
		br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<Like> like = new ArrayList<Like>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			like= br.getResponseListObject();
		logger.info(like);
		PrintWriter out=null ;	
		out = response.getWriter();
		response.setContentType("application/json");
  		objectMapper.writeValue(out,like);
	  		
		
		}	

	public void addGupShupComment(HttpServletRequest request,HttpServletResponse response,PostComment postcomment)throws IOException{
		String result = FiinfraConstants.FAIL;

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int commentPartyId=userSession.getPartyId();
		int createdBy = userSession.getUserId();
		int lastModifiedBy = userSession.getUserId();
		
		postcomment.setCommentPartyId(commentPartyId);
		postcomment.setCreatedBy(createdBy);
		postcomment.setLastModifiedBy(lastModifiedBy);
		
		
		url = URL_ADD_GUPSHUP_COMMENT + "sanket" + "/1234";
		logger.info("url:-" + url);
		   
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, postcomment, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			result = FiinfraConstants.SUCCESS;
		
		}
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, result);
		
	}
	public void addGupShupLike(HttpServletRequest request,HttpServletResponse response,Like like)throws IOException{
		String result = FiinfraConstants.FAIL;
		logger.info("in loadallocationlist likeRefID"+ request.getParameter("likeRefID"));
		int likeRefID = Integer.parseInt(request.getParameter("likeRefID"));
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int likePartyID=userSession.getPartyId();
		int createdBy = userSession.getUserId();
		int lastModifiedBy = userSession.getUserId();
		
		like.setLikeRefID(likeRefID);
		like.setLikeRefType(1);
		like.setLikePartyID(likePartyID);
		like.setCreatedBy(createdBy);
		like.setLastModifiedBy(lastModifiedBy);
		url = URL_ADD_GUPSHUP_LIKE + "sanket" + "/1234";
		logger.info("url:-" + url);
		   
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, like, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			result = FiinfraConstants.SUCCESS;
		
		}
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, result);
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/sendQuery", method = RequestMethod.GET)
	public void sendQuery(HttpServletRequest request,HttpServletResponse response,Chat chat)throws JsonGenerationException, JsonMappingException, IOException, ParseException {
		{
	
			
				System.out.println("welcome");
				String result = FiinfraConstants.FAIL;
				UserSession userSession = (UserSession) request.getSession()
						.getAttribute("userSession");
				int createdBy = userSession.getUserId();   // usersession PST
				int lastModifiedBy = userSession.getUserId();  // usersession PST
				int recordTypeID=userSession.getRecordtypeId();  // usersession PST
				int chatPartyID=userSession.getPartyId();   // usersession PST
				
				
								
				
				
				chat.setCreatedBy(createdBy); //2885
				chat.setLastModifiedBy(lastModifiedBy); //2885
				chat.setRecordTypeID(recordTypeID);
				chat.setChatPartyID(chatPartyID);
				chat.setChatContentTypeID(90001);
				
				
				url = URL_ADD_RECENT_CHAT + "sanket" + "/1234";
				
				
				logger.info("url:-" + url);
				   
				BaseResponse<String> br = new BaseResponse<String>();
				br = restTemplate.postForObject(url, chat, BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{
					result = FiinfraConstants.SUCCESS;
				
				}
				
				PrintWriter out = null;
				try {
					out = response.getWriter();
				} catch (IOException e) {
					e.printStackTrace();
				}
				objectMapper.writeValue(out, result);
				
				
		}	
}

	public void showReasonForRating(HttpServletRequest request,HttpServletResponse response)throws IOException{
		//logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
	//	request.setAttribute("partyID", request.getParameter("ratingID"));
		if (request.getParameter("ratingID") != null)
		{
			
			int ratingID = Integer.parseInt(request.getParameter("ratingID"));
			 UserSession userSession = (UserSession) request.getSession()
						.getAttribute("userSession");
				int buId=userSession.getBuId();
			url = URL_REASON_FOR_RATING+ "mac"+ "/1234";
			PartnerRating pRating = new PartnerRating();
			pRating.setRatingId(ratingID);
			pRating.setBuId(buId);
			
			BaseResponse<PartnerRating> br = new BaseResponse<PartnerRating>();
			br = restTemplate.postForObject(url, pRating, BaseResponse.class);
			List<PartnerRating> partnerRating = new ArrayList<PartnerRating>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				partnerRating= br.getResponseListObject();
			logger.info(partnerRating);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,partnerRating);
		}
	}
	
	
		

	public void saveReasonsForRating(HttpServletRequest request,HttpServletResponse response)throws IOException{

		//	request.setAttribute("partyID", request.getParameter("ratingID"));
		
			int ratingID = Integer.parseInt(request.getParameter("ratingID"));
			String reasonIdString2 = request.getParameter("reasonIdString");
			int partnerspartyid= Integer.parseInt(request.getParameter("partnerParty"));
			String otherReason = request.getParameter("otherReason");
			String lastMonthDate =  request.getParameter("lastMonthDate");
			String otherNote=request.getParameter("othernote");
			String ratingvalue=request.getParameter("ratingvalue");
			String Boarding = "ONBOARDED";
			String str = reasonIdString2.split(",")[0];
			if(str == "0"){
				Boarding = "NOT-ONBOARDED";
					}
			 UserSession userSession = (UserSession) request.getSession()
						.getAttribute("userSession");
				int buId=userSession.getBuId();
				int userId=userSession.getUserId();
		
			url = URL_SAVE_REASON_RATING+ "mac"+ "/1234";
			PartnerRating partnerRating = new PartnerRating();
			partnerRating.setPartnerspartyid(partnerspartyid);
			partnerRating.setRatingId(ratingID);
			partnerRating.setBuId(userSession.getBuId());
			partnerRating.setReasonIdString(reasonIdString2);
			partnerRating.setUserId(userId);
			partnerRating.setOtherReason(otherReason);
			partnerRating.setLastMonthDate(lastMonthDate);
			partnerRating.setExtraNote(otherNote);
			logger.info(partnerspartyid+"partnerspartyid11111");
			BaseResponse<PartnerRating> br = new BaseResponse<PartnerRating>();
			br = restTemplate.postForObject(url, partnerRating, BaseResponse.class);
			
			
			try {
				
				Notification notification=null;
					Map<String,String> payloadMap=new HashMap<String, String>();
					payloadMap.put("BoardingStatus",Boarding);
					payloadMap.put("Categorized",ratingvalue);
					
					notification=new Notification();
					notification.setSourceSystemID(31003); 
					notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
					notification.setNotifyUserID(userId);
					notification.setNotifyPartyID(partnerspartyid);
				    notification.setNotifyEventID(514); 
					notification.setBuId(buId);
					notification.setPayloadMap(payloadMap);
					notification.setSessionID(request.getSession().getId());
					FrameworkUtil.notify(notification);
				 
			   }catch (NumberFormatException e) {
				e.printStackTrace();
			   }
			
			
			
			List<PartnerRating> partnerRating2 = new ArrayList<PartnerRating>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				partnerRating2= br.getResponseListObject();
			logger.info(partnerRating);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,partnerRating2);
		}
	
	
	public void getCurruntRatingnReason(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
	
			int partnerspartyid= Integer.parseInt(request.getParameter("partnerParty"));
			 UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
				int buId=userSession.getBuId();
			url = GET_CURRUNT_RATING_REASON + "mac"+ "/1234";
			PartnerRating pRating = new PartnerRating();
			pRating.setPartnerspartyid(partnerspartyid);
			
			BaseResponse<PartnerRating> br = new BaseResponse<PartnerRating>();
			br = restTemplate.postForObject(url, pRating, BaseResponse.class);
			List<PartnerRating> partnerRating = new ArrayList<PartnerRating>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				partnerRating= br.getResponseListObject();
			logger.info(partnerRating);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,partnerRating);
		
	}
	
	
	
	
	public void showRatingHistory(HttpServletRequest request,HttpServletResponse response)throws IOException{
		//logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
	//	request.setAttribute("partyID", request.getParameter("ratingID"));
		
			
			int partnerspartyid= Integer.parseInt(request.getParameter("partnerParty"));
			 UserSession userSession = (UserSession) request.getSession()
						.getAttribute("userSession");
				int buId=userSession.getBuId();
			url = GET_RATING_HISTORY+ "mac"+ "/1234";
			PartnerRating pRating = new PartnerRating();
			pRating.setPartnerspartyid(partnerspartyid);
			pRating.setBuId(buId);
			
			BaseResponse<PartnerRating> br = new BaseResponse<PartnerRating>();
			br = restTemplate.postForObject(url, pRating, BaseResponse.class);
			List<PartnerRating> partnerRating = new ArrayList<PartnerRating>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				partnerRating= br.getResponseListObject();
			logger.info(partnerRating);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,partnerRating);
		}
	
	
	
	public void getMultiselect(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String context=request.getParameter("context");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_MULTISELECT + userSession.getName()
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("context", context);
		BaseResponse<ActivityTarcker> br = new BaseResponse<ActivityTarcker>();
		br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<ActivityTarcker> countTask = new ArrayList<ActivityTarcker>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			countTask= br.getResponseListObject();
		logger.info(countTask);
		PrintWriter out=null ;	
		out = response.getWriter();
		response.setContentType("application/json");
  		objectMapper.writeValue(out,countTask);
	}
	
	
	
	
	
	@SuppressWarnings("unchecked")
	public void getExecutionEnabler(HttpServletRequest request,HttpServletResponse response)throws IOException {
	//	System.out.println("In Task Data List");
		logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));
		request.setAttribute("partyID", request.getParameter("partyID"));
		if (request.getParameter("partyID") != null)
		{
			
			int partyId = Integer.parseInt(request.getParameter("partyID"));
			url = URL_EXECUTION_ENABLER+ "sanket"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<ExecutionEnabler> br = new BaseResponse<ExecutionEnabler>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<ExecutionEnabler> executionEnablerList = new ArrayList<ExecutionEnabler>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				executionEnablerList= br.getResponseListObject();
			logger.info(executionEnablerList);
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue(out,executionEnablerList);
			
		}
		
		
		}	
	
}
