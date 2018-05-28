package in.fiinfra.controller;


import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.NotifyEvent;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.common.web.CustomJacksonObjectMapper;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;













import org.springframework.web.client.RestTemplate;






import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;


public class TestimonialController extends MultiActionController
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

	

	@Value("${URL_GET_TESTIMONIALS}")
	private String URL_GET_TESTIMONIALS;

	@Value("${URL_ADD_TESTIMONIALS}")
	private String URL_ADD_TESTIMONIALS;

	@Value("${URL_EDIT_TESTIMONIALS}")
	private String URL_EDIT_TESTIMONIALS;

	@Value("${URL_DELETE_TESTIMONIALS}")
	private String URL_DELETE_TESTIMONIALS;
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadtestimonialsList", method = RequestMethod.POST)
	public ModelAndView loadtestimonialsList(HttpServletRequest request,
			HttpServletResponse response) {
		
	
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partyId = userSession.getPartyId();
		int buId = userSession.getBuId();
		String searchPartnerId = request.getParameter("searchPartnerId");
		String searchclientId = request.getParameter("searchClientId");
		
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		
		TestimonialData cp = new TestimonialData();
		int rows = cp.getRows();
		
		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchstext")) {
			searchTextVal = request.getParameter("searchstext").trim();
		} else {
			searchTextVal = "";
		}
		
		ModelAndView mav = new ModelAndView("testimonials/TestimonialsList");
		
		System.out.println(searchTextVal+"String");
		System.out.println(searchPartnerId+"partnerId");
		System.out.println(searchclientId+"clientId");
		try {

			
			BaseResponse<TestimonialData> br = new BaseResponse<TestimonialData>();
			TestimonialData testimonialdata = new TestimonialData();
			testimonialdata.setBuPartyId(buId);
			testimonialdata.setPartyId(partyId);
			testimonialdata.setPartnerId(searchPartnerId);
			testimonialdata.setClientId(searchclientId);
			testimonialdata.setSearchtext(searchTextVal);
			/*uriCB.queryParam("buId", buId);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("partnerId", searchPartnerId);
			uriCB.queryParam("clientId", searchclientId);
			uriCB.queryParam("searchtext", searchTextVal);	*/
			url = URL_GET_TESTIMONIALS +"kjhklhkj/1234"; 
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
			br = restTemplate.postForObject(url, testimonialdata, BaseResponse.class);
			//br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<TestimonialData> TestimonialList = new ArrayList<TestimonialData>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				TestimonialList = br.getResponseListObject();
			mav.addObject("testimonialsList", objectMapper.writeValueAsString(TestimonialList));
			mav.addObject("size", pagesize);
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
	
	

	  
	
	
	@SuppressWarnings("unchecked")
	//@RequestMapping(value ="/getPicklistValues", method = RequestMethod.GET)
	public void addTestimonial(HttpServletRequest request,HttpServletResponse response,TestimonialData testimonialData) throws Exception {
		logger.info("In add Testimonial");
		
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
		String partnername=request.getParameter("searchString");
		url = URL_ADD_TESTIMONIALS + "dffdff/1234";
		
		Integer kaka =testimonialData.getId();
		System.out.println("kaka"+kaka);
		
		testimonialData.setBuPartyId(userSession.getBuId());
		testimonialData.setCreatedById(userSession.getUserId());
		testimonialData.setUserID(userSession.getUserId());
		testimonialData.setPartyId(userSession.getPartyId());
		//Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		
		BaseResponse<Integer> br = new BaseResponse<>();
		br = restTemplate.postForObject(url, testimonialData, BaseResponse.class);
		
		int recordCount=0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		String ObjName = testimonialData.getPartnerName()+", "+testimonialData.getClientName();
		
		FiinfraUtility.doAudit(userSession.getPartyId(), userSession.getBuId(), FiinfraConstants.SRP_ADD_TESTIMONIAL_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_TESTIMONIAL,FiinfraConstants.SRP_ADD_TESTIMONIAL,ObjName);
		
		objectMapper.writeValue(out, recordCount);
	}


	@SuppressWarnings("unchecked")
	//@RequestMapping(value ="/getPicklistValues", method = RequestMethod.GET)
	public void editTestimonial(HttpServletRequest request,HttpServletResponse response,TestimonialData testimonialData) throws Exception {
		logger.info("In add Testimonial");
		
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
		//int bupartyid=Integer.parseInt(request.getParameter("bupartyname"));
	
		url = URL_EDIT_TESTIMONIALS + "dffdff/1234";
		
		testimonialData.setBuPartyId(userSession.getBuId());
		testimonialData.setUserID(userSession.getUserId());
		testimonialData.setPartyId(userSession.getPartyId());
		//Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		
		BaseResponse<Integer> br = new BaseResponse<>();
		br = restTemplate.postForObject(url, testimonialData, BaseResponse.class);
		String ObjName = testimonialData.getPartnerName()+", "+testimonialData.getClientName();
		int recordCount=0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		FiinfraUtility.doAudit(userSession.getPartyId(), userSession.getBuId(), FiinfraConstants.SRP_EDIT_TESTIMONIAL_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_TESTIMONIAL,FiinfraConstants.SRP_EDIT_TESTIMONIAL,ObjName);
		objectMapper.writeValue(out, recordCount);
	}

	
	
	
	
	public void deleteTestimonial(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String partnername=request.getParameter("partnerName");
		if (request.getParameter("selectedlvalz") != null) {
			
			String list = request.getParameter("selectedlvalz");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");

			int userid=userSession.getUserId();
			url = URL_DELETE_TESTIMONIALS + "aaaa/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("Lists", list);
			uriCB.queryParam("userId", userid);
			
			
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			Integer codeValueDataList=null;
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				 codeValueDataList= br.getResponseObject();
		
			Logger.logEntry(this.getClass(), "codeValueDataList:---"+ codeValueDataList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			FiinfraUtility.doAudit(userSession.getPartyId(), userSession.getBuId(), FiinfraConstants.SRP_DELETE_TESTIMONIAL_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_TESTIMONIAL,FiinfraConstants.SRP_DELETE_TESTIMONIAL,list);
			objectMapper.writeValue(out, codeValueDataList);

		}
	}
	

	 public void testimonialsExecl(HttpServletRequest request, HttpServletResponse response) {
		 logger.info("In export in Testimmonial excel");
		  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		  try{
		  
		   if(userSession == null) {
		   response.sendRedirect("/login");
		   return ;
		  }
		   
			  int partyId = userSession.getPartyId();
				int buId = userSession.getBuId();
				String searchPartnerId = request.getParameter("searchPartnerId");
				String searchclientId = request.getParameter("searchClientId");
				
				
		   String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal = "";
			}
		  //TODO change hard coding
			 BaseResponse<TestimonialData> baseResponse = new BaseResponse<TestimonialData>();
			  
			TestimonialData testimonialdata = new TestimonialData();
			testimonialdata.setBuPartyId(buId);
			testimonialdata.setPartyId(partyId);
			testimonialdata.setPartnerId(searchPartnerId);
			testimonialdata.setClientId(searchclientId);
			testimonialdata.setSearchtext(searchTextVal);
		  url = URL_GET_TESTIMONIALS+"ramu"+"/1234";
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		 /* uriCB.queryParam("buId", buId);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("partnerId", searchPartnerId);
			uriCB.queryParam("clientId", searchclientId);
			uriCB.queryParam("searchtext", searchTextVal);	*/
		 
		  //call service for all parties associated 
		  baseResponse = restTemplate.postForObject(url, testimonialdata, BaseResponse.class);
		 // baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		  
		  List<TestimonialData> testimonialAsJson = new ArrayList<TestimonialData> ();
		  List<TestimonialData> testimonialList = new ArrayList<TestimonialData> ();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   testimonialAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<testimonialAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   TestimonialData testimonialList2;
				   testimonialList2 = objectMapper.readValue(objectMapper.writeValueAsString(testimonialAsJson.get(i)), TestimonialData.class);
									
					
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
		  
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=TestimonialList.xls");
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Partner Name "));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Client Name "));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Testimonial Name"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Header"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Description Note"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Status"));
		   
		   
		  /* writer.print("\t");
		   writer.print(CommonUtils.escape( "Updated on"));*/
	/*	   writer.print(",");
		   writer.print(CommonUtils.escape("STATUS"));*/
		   
		   writer.println();
		   for(TestimonialData list:testimonialList){
			   
			   
		    writer.print(CommonUtils.escape(list.getPartnerName()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getClientName()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getUserName()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getUrl()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getText()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getStatusRefId()==137002 ? "Approved" : list.getStatusRefId()==137001 ? "New" : "Rejected"));
		  
		    writer.println();
		    /*writer.print(CommonUtils.escape(task.getStatusName()));
		    writer.println();*/
		   }
		       
		  } catch (IOException e) {
		      e.printStackTrace();
		  }
		 }

	
	
	 

	 public void testimonialsCSV(HttpServletRequest request, HttpServletResponse response) {
		 logger.info("In export in Testimmonial excel");
		  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		  try{
		  
		   if(userSession == null) {
		   response.sendRedirect("/login");
		   return ;
		  }
		   
			  int partyId = userSession.getPartyId();
				int buId = userSession.getBuId();
				String searchPartnerId = request.getParameter("searchPartnerId");
				String searchclientId = request.getParameter("searchClientId");
				
				
		   String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal = "";
			}
		  //TODO change hard coding
			BaseResponse<TestimonialData> baseResponse = new BaseResponse<TestimonialData>();
			TestimonialData testimonialdata = new TestimonialData();
			testimonialdata.setBuPartyId(buId);
			testimonialdata.setPartyId(partyId);
			testimonialdata.setPartnerId(searchPartnerId);
			testimonialdata.setClientId(searchclientId);
			testimonialdata.setSearchtext(searchTextVal);
		  url = URL_GET_TESTIMONIALS+"ramu"+"/1234";
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	/*	  uriCB.queryParam("buId", buId);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("partnerId", searchPartnerId);
			uriCB.queryParam("clientId", searchclientId);
			uriCB.queryParam("searchtext", searchTextVal);	*/
		  
		  
		  //call service for all parties associated 
		//  baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		  baseResponse = restTemplate.postForObject(url, testimonialdata, BaseResponse.class);
		  List<TestimonialData> testimonialAsJson = new ArrayList<TestimonialData> ();
		  List<TestimonialData> testimonialList = new ArrayList<TestimonialData> ();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   testimonialAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<testimonialAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   TestimonialData testimonialList2;
				   testimonialList2 = objectMapper.readValue(objectMapper.writeValueAsString(testimonialAsJson.get(i)), TestimonialData.class);
									
					
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
		  
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=TestimonialList.csv");
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Partner Name "));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Client Name "));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Testimonial Name"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Header"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Description Note"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Status"));
		   
		   
		  /* writer.print("\t");
		   writer.print(CommonUtils.escape( "Updated on"));*/
	/*	   writer.print(",");
		   writer.print(CommonUtils.escape("STATUS"));*/
		   
		   writer.println();
		   for(TestimonialData list:testimonialList){
			   
			   
		    writer.print(CommonUtils.escape(list.getPartnerName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getClientName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getUserName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getUrl()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getText()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getStatusRefId()==137002 ? "Approved" : list.getStatusRefId()==137001 ? "New" : "Rejected"));
		  
		    writer.println();
		    /*writer.print(CommonUtils.escape(task.getStatusName()));
		    writer.println();*/
		   }
		       
		  } catch (IOException e) {
		      e.printStackTrace();
		  }
		 }

	 
	 
	 
}
