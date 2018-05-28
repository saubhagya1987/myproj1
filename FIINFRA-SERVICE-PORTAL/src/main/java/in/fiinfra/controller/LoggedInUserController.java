package in.fiinfra.controller;


import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.EmailSmsVo;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.LoggedUser;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.FinancialData;
import in.fiinfra.cp.TestimonialData;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;















import javax.servlet.http.HttpSession;

import org.springframework.web.client.RestTemplate;






import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;


public class LoggedInUserController extends MultiActionController
{
	//private static final Logger logger = Logger.getLogger(DownloadController.class);
	//private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(DownloadController.class);
	
	private RestTemplate restTemplate;
	String url;
	

	private ObjectMapper objectMapper;	
	
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

	
	@Value("${URL_GET_EMAIL_CHART}")
	private String URL_GET_EMAIL_CHART;

	@Value("${URL_GET_LOGGED_USERS}")
	private String URL_GET_LOGGED_USERS;

	@Value("${URL_GET_CHART_USERS}")
	private String URL_GET_CHART_USERS;
	
	@Value("${URL_GET_EMAIL_SMS_LIST}")
	private String URL_GET_EMAIL_SMS_LIST;
	
	@RequestMapping(value = "/loadLoggedInUserList", method = RequestMethod.GET)
	public ModelAndView loadLoggedInUserList(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("vkjhsjkfdhdsfcs");
	
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		int partyId = userSession.getPartyId();
		int buId = userSession.getBuId();
		
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		String viewstatus =request.getParameter("viewStatus") ;
		if (viewstatus == null) 
		{
			viewstatus = "53001";
		}
		HttpSession hes=request.getSession();
		hes.setAttribute("status", viewstatus); 
		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchstext")) {
			searchTextVal = request.getParameter("searchstext").trim();
		} else {
			searchTextVal = "";
		}
		
		
	
		ModelAndView mav = new ModelAndView("loggedinuser/MonitorLoggedInUser");
		

		try {

			
			
			BaseResponse<LoggedUser> br = new BaseResponse<LoggedUser>();
			LoggedUser loggedUser = new LoggedUser();
			loggedUser.setStatusViewId(viewstatus);
			loggedUser.setSearchtext(searchTextVal);
			loggedUser.setBuId(buId);
			url = URL_GET_LOGGED_USERS +"kjhklhkj/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			br = restTemplate.postForObject(url, loggedUser, BaseResponse.class);
			
			//br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<LoggedUser> loggedUserList = new ArrayList<LoggedUser>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				loggedUserList = br.getResponseListObject();
			

			mav.addObject("loggedUserList", objectMapper.writeValueAsString( loggedUserList));
			mav.addObject("size", pagesize);
			//mav.addObject("viewstatus", viewstatus);
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;

	}
	
	
	
	@RequestMapping(value = "/getChartData", method = RequestMethod.GET)
	public void getChartData(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
	
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		int buId = userSession.getBuId();
		//UserSession user = AuthHandler.getCurrentUser();
		//FinancialRequest request = new FinancialRequest();
		//request.setPartyId(user.getPartyId());
		//FinancialService service = getBean(FinancialService.class);
		
			
			
		url = URL_GET_CHART_USERS +"kjhklhkj/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);	
		BaseResponse<LoggedUser> br = new BaseResponse<LoggedUser>();
		br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<LoggedUser> chartList = new ArrayList<LoggedUser>();
		//List<LoggedUser> lstLoggedUser = service.getMyFinancials(user.getPartyId());
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			chartList = br.getResponseListObject();
		
		ObjectMapper mapper = new ObjectMapper();
		ArrayNode array =  mapper.createArrayNode();
		{
			ArrayNode title = mapper.createArrayNode();
			title.add("Time");
			title.add("Partner");
			title.add("Client");
			array.add(title);
		}	
		List<LoggedUser> myObjects=null;
		
		ObjectMapper mapper2 = new CustomJacksonObjectMapper();
		String jsonSuccessString=mapper.writeValueAsString(chartList);
		logger.info(jsonSuccessString);
		 myObjects = mapper2.readValue(jsonSuccessString, mapper2.getTypeFactory().constructCollectionType(List.class, LoggedUser.class));
	for(int i=0;i<chartList.size();i++){
		ArrayNode value = mapper.createArrayNode();
		value.add(myObjects.get(i).getTime());
		value.add(myObjects.get(i).getPartner_ct());
		value.add(myObjects.get(i).getClient_ct());
		array.add(value);
	}
		
		
		Object[] data = new Object[4];
		data[0] = array;
		
		
		//return data;

		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, array);
		

		
	
	}

	 
	 
	
	

	 public void getExecl(HttpServletRequest request, HttpServletResponse response) {
		 logger.info("In export in Testimmonial excel");
		  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		  try{
		  
		   if(userSession == null) {
		   response.sendRedirect("/login");
		   return ;
		  }
		   
				int buId = userSession.getBuId();
				String viewstatus =request.getParameter("viewStatus") ;
				if (viewstatus == null) {
					viewstatus = "53001";
				}
				
				
		   String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal = "";
			}
		  //TODO change hard coding
			LoggedUser loggedUser = new LoggedUser();
			loggedUser.setStatusViewId(viewstatus);
			loggedUser.setSearchtext(searchTextVal);
			loggedUser.setBuId(buId);
		  url = URL_GET_LOGGED_USERS+"ramu"+"/1234";
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		  /*uriCB.queryParam("searchtext", searchTextVal);	*/
		  BaseResponse<LoggedUser> baseResponse = new BaseResponse<LoggedUser>();
		  
		  //call service for all parties associated 
		 // baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		  baseResponse = restTemplate.postForObject(url, loggedUser, BaseResponse.class);
		  List<LoggedUser> testimonialAsJson = new ArrayList<LoggedUser> ();
		  List<LoggedUser> testimonialList = new ArrayList<LoggedUser> ();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   testimonialAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<testimonialAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   LoggedUser testimonialList2;
				   testimonialList2 = objectMapper.readValue(objectMapper.writeValueAsString(testimonialAsJson.get(i)), LoggedUser.class);
									
					
				   testimonialList.add(testimonialList2);
				}


		   } catch (JsonParseException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (JsonMappingException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (JsonGenerationException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (IOException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   }
		  }
		  
		  							
		  
		   response.addHeader("Content-Disposition", "attachment;filename=LoggedinuserList.xls");
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("User Type "));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("User Name "));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Biz Unit"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Email ID"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Contact No"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Assigned Role"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Last Login On"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Session ID"));
		   
		   
		  /* writer.print("\t");
		   writer.print(CommonUtils.escape( "Updated on"));*/
	/*	   writer.print(",");
		   writer.print(CommonUtils.escape("STATUS"));*/
		   
		   writer.println();
		   for(LoggedUser list:testimonialList){
			   
			   
		    writer.print(CommonUtils.escape(list.getPartyType()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getUserName()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getBizUnit()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getEmailId()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getContactNo()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getAssignedRole()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getLastLoginOn().replaceAll("\\<.*?\\>", "")));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getSessionId()));
		  
		    writer.println();
		    /*writer.print(CommonUtils.escape(task.getStatusName()));
		    writer.println();*/
		   }
		       
		  } catch (IOException e) {
		      e.printStackTrace();
		  }
		 }

	
	

		

	 public void getCSV(HttpServletRequest request, HttpServletResponse response) {
		 logger.info("In export in Testimmonial excel");
		  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		  try{
		  
		   if(userSession == null) {
		   response.sendRedirect("/login");
		   return ;
		  }
		   
				int buId = userSession.getBuId();
				String viewstatus =request.getParameter("viewStatus") ;
				if (viewstatus == null) {
					viewstatus = "53001";
				}
					
				
		   String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal = "";
			}
		  //TODO change hard coding]
			LoggedUser loggedUser = new LoggedUser();
			loggedUser.setStatusViewId(viewstatus);
			loggedUser.setSearchtext(searchTextVal);
			loggedUser.setBuId(buId);
		  url = URL_GET_LOGGED_USERS+"ramu"+"/1234";
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		  uriCB.queryParam("searchtext", searchTextVal);	
		  BaseResponse<LoggedUser> baseResponse = new BaseResponse<LoggedUser>();
		  
		  //call service for all parties associated 
		  //baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		  baseResponse = restTemplate.postForObject(url, loggedUser, BaseResponse.class);
		  List<LoggedUser> testimonialAsJson = new ArrayList<LoggedUser> ();
		  List<LoggedUser> testimonialList = new ArrayList<LoggedUser> ();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   testimonialAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<testimonialAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   LoggedUser testimonialList2;
				   testimonialList2 = objectMapper.readValue(objectMapper.writeValueAsString(testimonialAsJson.get(i)), LoggedUser.class);
									
					
				   testimonialList.add(testimonialList2);
				}


		   } catch (JsonParseException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (JsonMappingException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (JsonGenerationException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (IOException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   }
		  }
		  
		  							
		  
		   response.addHeader("Content-Disposition", "attachment;filename=LoggedinuserList.csv");
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("User Type "));
		   writer.print(",");
		   writer.print(CommonUtils.escape("User Name "));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Biz Unit"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Email ID"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Contact No"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Assigned Role"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Last Login On"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Session ID"));
		   
		   
		  /* writer.print("\t");
		   writer.print(CommonUtils.escape( "Updated on"));*/
	/*	   writer.print(",");
		   writer.print(CommonUtils.escape("STATUS"));*/
		   
		   writer.println();
		   for(LoggedUser list:testimonialList){
			   
			   
		    writer.print(CommonUtils.escape(list.getPartyType()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getUserName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getBizUnit()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getEmailId()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getContactNo()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getAssignedRole()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getLastLoginOn().replaceAll("\\<.*?\\>", "")));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getSessionId()));
		  
		    writer.println();
		    /*writer.print(CommonUtils.escape(task.getStatusName()));
		    writer.println();*/
		   }
		       
		  } catch (IOException e) {
		      e.printStackTrace();
		  }
		 }







// ---------------Email/Sms Notification monitor -------------





@RequestMapping(value = "/loadEmailSmslist", method = RequestMethod.GET)
public ModelAndView loadEmailSmslist(HttpServletRequest request,
		HttpServletResponse response) {
	System.out.println("vkjhsjkfdhdsfcs");

	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
	int partyId = userSession.getPartyId();
	int buId = userSession.getBuId();
	
	String pagesize = request.getParameter("pageSize");
	if (pagesize == null) {
		pagesize = "10";
	}

	
	String searchTextVal = null;
	if (request.getParameterMap().containsKey("searchstext")) {
		searchTextVal = request.getParameter("searchstext").trim();
	} else {
		searchTextVal = "";
	}
	
	

	ModelAndView mav = new ModelAndView("loggedinuser/MonitorEmailSms");


	try {

		
		BaseResponse<EmailSmsVo> br = new BaseResponse<EmailSmsVo>();
		EmailSmsVo emailSmsVo = new EmailSmsVo();
		emailSmsVo.setSearchtext(searchTextVal);
		emailSmsVo.setBuId(buId);
		url = URL_GET_EMAIL_SMS_LIST +"kjhklhkj/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		br = restTemplate.postForObject(url, emailSmsVo, BaseResponse.class);
		
		
		List<EmailSmsVo> emailSmsList = new ArrayList<EmailSmsVo>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			emailSmsList = br.getResponseListObject();
		
//System.out.println("data"+emailSmsList);
		mav.addObject("emailSmsList", objectMapper.writeValueAsString(emailSmsList));
		mav.addObject("size", pagesize);
		//mav.addObject("viewstatus", viewstatus);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	return mav;

}





@RequestMapping(value = "/getEmailChart", method = RequestMethod.GET)
public void getEmailChart(HttpServletRequest request,
		HttpServletResponse response) throws Exception{

	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
	int buId = userSession.getBuId();
	
		
	url = URL_GET_EMAIL_CHART +"kjhklhkj/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("buId", buId);	
	BaseResponse<EmailSmsVo> br = new BaseResponse<EmailSmsVo>();
	br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
	List<EmailSmsVo> chartList = new ArrayList<EmailSmsVo>();
	//List<LoggedUser> lstLoggedUser = service.getMyFinancials(user.getPartyId());
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		chartList = br.getResponseListObject();
	
	ObjectMapper mapper = new ObjectMapper();
	ArrayNode array =  mapper.createArrayNode();
	{
		ArrayNode title = mapper.createArrayNode();
		title.add("Time");
		title.add("Email");
		title.add("SMS");
		array.add(title);
	}	
	List<EmailSmsVo> myObjects=null;
	
	ObjectMapper mapper2 = new CustomJacksonObjectMapper();
	String jsonSuccessString=mapper.writeValueAsString(chartList);
	logger.info(jsonSuccessString);
	 myObjects = mapper2.readValue(jsonSuccessString, mapper2.getTypeFactory().constructCollectionType(List.class, EmailSmsVo.class));

	 
for(int i=0;i<chartList.size();i++){
	ArrayNode value = mapper.createArrayNode();
	value.add(myObjects.get(i).getTime());
	value.add(myObjects.get(i).getEmail_ct());
	value.add(myObjects.get(i).getSms_ct());
	array.add(value);
}
	
	
	
	
	//return data;
	System.out.println("dada"+array);
	
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, array);
	

	

}








public void getEmailExecl(HttpServletRequest request, HttpServletResponse response) {
	 logger.info("In export in Email Sms Monitor excel");
	  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
	
	  try{
	  
	   if(userSession == null) {
	   response.sendRedirect("/login");
	   return ;
	  }
	   
	int buId = userSession.getBuId();

		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
	  //TODO change hard coding
		EmailSmsVo loggedUser = new EmailSmsVo();
		loggedUser.setSearchtext(searchTextVal);
		
		loggedUser.setBuId(buId);
	  url = URL_GET_EMAIL_SMS_LIST+"ramu"+"/1234";
	  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	  /*uriCB.queryParam("searchtext", searchTextVal);	*/
	  BaseResponse<EmailSmsVo> baseResponse = new BaseResponse<EmailSmsVo>();
	  
	  //call service for all parties associated 
	 // baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	  baseResponse = restTemplate.postForObject(url, loggedUser, BaseResponse.class);
	  List<EmailSmsVo> testimonialAsJson = new ArrayList<EmailSmsVo> ();
	  List<EmailSmsVo> testimonialList = new ArrayList<EmailSmsVo> ();
	  
	  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
	   try {
		   testimonialAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
	       
		   for(int i = 0; i<testimonialAsJson.size(); i++){
				//get the actual party object from its LinkedHashMap representation
			   EmailSmsVo testimonialList2;
			   testimonialList2 = objectMapper.readValue(objectMapper.writeValueAsString(testimonialAsJson.get(i)), EmailSmsVo.class);
								
				
			   testimonialList.add(testimonialList2);
			}


	   } catch (JsonParseException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	   } catch (JsonMappingException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	   } catch (JsonGenerationException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	   } catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	   }
	  }
	  
	  							
	  
	   response.addHeader("Content-Disposition", "attachment;filename=EmailSmslist.xls");
	        
	   PrintWriter writer = response.getWriter();
	   writer.print(CommonUtils.escape("Email/SMS"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("From "));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Name"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("To"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Event"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Date Time"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Status"));
	  
	   
	   writer.println();
	   for(EmailSmsVo list:testimonialList){
		   
		   
	    writer.print(CommonUtils.escape(list.getEmailSms()));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getFrom()));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getName()));
	    writer.print("\t");
	    writer.print(CommonUtils.escape( list.getTo()));
	    writer.print("\t");
	    writer.print(CommonUtils.escape( list.getSubject()));
	    writer.print("\t");
	    writer.print(CommonUtils.escape( list.getLastemailOn().replaceAll("\\<.*?\\>", "")));
	    writer.print("\t");
	    writer.print(CommonUtils.escape( list.getStatus()));
	    
	    writer.println();
	    /*writer.print(CommonUtils.escape(task.getStatusName()));
	    writer.println();*/
	   }
	       
	  } catch (IOException e) {
	      e.printStackTrace();
	  }
	 }




public void getEmailCSV(HttpServletRequest request, HttpServletResponse response) {
	 logger.info("In export in Email Sms Monitor CSV");
	  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
	
	  try{
	  
	   if(userSession == null) {
	   response.sendRedirect("/login");
	   return ;
	  }
	   
	int buId = userSession.getBuId();

		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
	  //TODO change hard coding
		EmailSmsVo loggedUser = new EmailSmsVo();
		loggedUser.setSearchtext(searchTextVal);
		loggedUser.setBuId(buId);
	  url = URL_GET_EMAIL_SMS_LIST+"ramu"+"/1234";
	  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	  /*uriCB.queryParam("searchtext", searchTextVal);	*/
	  BaseResponse<EmailSmsVo> baseResponse = new BaseResponse<EmailSmsVo>();
	  
	  //call service for all parties associated 
	 // baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	  baseResponse = restTemplate.postForObject(url, loggedUser, BaseResponse.class);
	  List<EmailSmsVo> testimonialAsJson = new ArrayList<EmailSmsVo> ();
	  List<EmailSmsVo> testimonialList = new ArrayList<EmailSmsVo> ();
	  
	  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
	   try {
		   testimonialAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
	       
		   for(int i = 0; i<testimonialAsJson.size(); i++){
				//get the actual party object from its LinkedHashMap representation
			   EmailSmsVo testimonialList2;
			   testimonialList2 = objectMapper.readValue(objectMapper.writeValueAsString(testimonialAsJson.get(i)), EmailSmsVo.class);
								
				
			   testimonialList.add(testimonialList2);
			}


	   } catch (JsonParseException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	   } catch (JsonMappingException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	   } catch (JsonGenerationException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	   } catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	   }
	  }
	  
	  							
	  
	   response.addHeader("Content-Disposition", "attachment;filename=EmailSmslist.csv");
	        
	   PrintWriter writer = response.getWriter();
	   writer.print(CommonUtils.escape("Email/SMS"));
	   writer.print(",");
	   writer.print(CommonUtils.escape("From "));
	   writer.print(",");
	   writer.print(CommonUtils.escape("Name"));
	   writer.print(",");
	   writer.print(CommonUtils.escape("To"));
	   writer.print(",");
	   writer.print(CommonUtils.escape("Event"));
	   writer.print(",");
	   writer.print(CommonUtils.escape("Date Time"));
	   writer.print(",");
	   writer.print(CommonUtils.escape("Status"));
	  
	   
	   writer.println();
	   for(EmailSmsVo list:testimonialList){
		   
		   
	    writer.print(CommonUtils.escape(list.getEmailSms()));
	    writer.print(",");
	    writer.print(CommonUtils.escape(list.getFrom()));
	    writer.print(",");
	    writer.print(CommonUtils.escape(list.getName()));
	    writer.print(",");
	    writer.print(CommonUtils.escape( list.getTo()));
	    writer.print(",");
	    writer.print(CommonUtils.escape( list.getSubject()));
	    writer.print(",");
	    writer.print(CommonUtils.escape( list.getLastemailOn().replaceAll("\\<.*?\\>", "")));
	    writer.print(",");
	    writer.print(CommonUtils.escape( list.getStatus()));
	    
	    writer.println();
	    /*writer.print(CommonUtils.escape(task.getStatusName()));
	    writer.println();*/
	   }
	       
	  } catch (IOException e) {
	      e.printStackTrace();
	  }
	 }


}


