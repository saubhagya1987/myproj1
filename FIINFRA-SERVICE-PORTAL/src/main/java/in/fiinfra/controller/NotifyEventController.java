package in.fiinfra.controller;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.NotifyEvent;
import in.fiinfra.common.service.vo.Product;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;   
import in.fiinfra.cp.CommonUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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

import com.google.gson.JsonParseException;
 
public class NotifyEventController extends MultiActionController {
	
	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(NotifyEventController.class);
	 
	private RestTemplate restTemplate;
	String url;   
	
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
	
	@Value("${URL_GET_EVENT_LIST}")
	private String URL_GET_EVENT_LIST;
	@Value("${URL_DELETE_EVENT}")
	private String URL_DELETE_EVENT;
	@Value("${URL_GET_EVENT_CATEGORY}")
	private String URL_GET_EVENT_CATEGORY;
	@Value("${URL_GET_EVENT_SYSTEM}")
	private String URL_GET_EVENT_SYSTEM;
	@Value("${URL_ADD_EVENT}")
	private String URL_ADD_EVENT;
	@Value("${URL_UPDATE_EVENT}")
	private String URL_UPDATE_EVENT;   
	
	@SuppressWarnings("unchecked")  
	@RequestMapping(value = "/getEventlist", method = RequestMethod.GET)
	public ModelAndView getEventlist(HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			ModelAndView mav = new ModelAndView("notification/notificationEventList");     
			 
			String userToken = null;
			if(userSession.getUserName()!=null){
				userToken = userSession.getUserName();
			}
			else{
				userToken = "abc";
			}

			String pagesize = request.getParameter("pageSize");
			if (pagesize == null) {
				pagesize = "10";
			}
			
			String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
				 
			} else {
				searchTextVal = "";   
			} 
			     
			try {  
					BaseResponse<NotifyEvent> br = new BaseResponse<NotifyEvent>();
					NotifyEvent eventVo = new NotifyEvent();
					eventVo.setSearchText(searchTextVal); 
					
					url = URL_GET_EVENT_LIST + userToken + "/1234";
					br = restTemplate.postForObject(url, eventVo, BaseResponse.class);
					List<NotifyEvent> eventList = new ArrayList<NotifyEvent>();
					if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						eventList = br.getResponseListObject();
					/*mav.addObject("eventList", eventList);*/
					mav.addObject("eventList", objectMapper.writeValueAsString(eventList));
					mav.addObject("size", pagesize);
					PrintWriter out = null; 
					    
					try {    
						out = response.getWriter();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						logger.error(e);
					} 
				} catch (Exception e) { 
					// TODO Auto-generated catch block
					logger.error(e);
				}
				   return mav;    
	} 
	  
	 
	@SuppressWarnings("unchecked")
	public void deleteEventList(HttpServletRequest request,HttpServletResponse response) throws IOException 
	  {
			
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			String list=request.getParameter("Lists");
			int userId=userSession.getUserId();
			url = URL_DELETE_EVENT + userSession.getUserName()+ "/1234";
			logger.debug("selectedlvalzzzzzzzzzzzzzzzzzzzzzzzzzzzzz:::"+request.getParameter("Lists"));
			  
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("Lists", list);
			uriCB.queryParam("userId", userId); 
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			Integer eventList=null;
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				eventList= br.getResponseObject();  
			   
			Logger.logEntry(this.getClass(), "eventList:---"+ eventList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97112,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_NOTIFYEVENT,
									FiinfraConstants.SRP_DELETE_NOTIFYEVENT, 
									"SP="+FiinfraConstants.SP_DELETE_NOTIFYEVENT+",List="+list, 
									"Notify Events : "+list);
			
			
			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, eventList);
				  
			}  
		
		public void getCategorySection(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
				
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				url = URL_GET_EVENT_CATEGORY + userSession.getUserName()+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<NotifyEvent> br = new BaseResponse<NotifyEvent>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<NotifyEvent> categorylist = new ArrayList<NotifyEvent>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					categorylist= br.getResponseListObject();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					categorylist= br.getResponseListObject();
				
				Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ categorylist, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				PrintWriter out = null;
				out = response.getWriter(); 
				response.setContentType("application/json");
				objectMapper.writeValue(out, categorylist);  
		}
		
		public void getSystemSection(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
					 
					UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
					url = URL_GET_EVENT_SYSTEM + userSession.getUserName()+ "/1234";
					UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
					Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					BaseResponse<NotifyEvent> br = new BaseResponse<NotifyEvent>();
					br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
					List<NotifyEvent> systemlist = new ArrayList<NotifyEvent>();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						systemlist= br.getResponseListObject();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						systemlist= br.getResponseListObject();
					
					Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ systemlist, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					PrintWriter out = null;
					out = response.getWriter(); 
					response.setContentType("application/json");
					objectMapper.writeValue(out, systemlist);  
			}
		
		public void addNotifyevent(HttpServletRequest request,
				HttpServletResponse response) throws IOException {  
				
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				String name= request.getParameter("name");
				String description = request.getParameter("destext");  
				int eventcategoryid = Integer.parseInt(request.getParameter("category"));
				int sourcesystemid = Integer.parseInt(request.getParameter("system"));
				int userId=userSession.getUserId();
				
		
				url = URL_ADD_EVENT + userSession.getUserName()+ "/1234";
				  
				NotifyEvent eventVo = new NotifyEvent();
				eventVo.setName(name);
				eventVo.setDescription(description);
				eventVo.setEventcategoryid(eventcategoryid);  
				eventVo.setSourcesystemid(sourcesystemid); 
				eventVo.setUserID(userId);
				
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<Integer> br = new BaseResponse<Integer>();
				br = restTemplate.postForObject(url, eventVo, BaseResponse.class);
				int recordCount=0;
				Integer addEvent=null; 
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					recordCount = br.getResponseObject(); 
				
				//insert code for audit functionality
				FiinfraUtility.doAudit(userSession.getPartyId(),
										userSession.getUserId(), 97110,
										FiinfraConstants.SERVICE_PORTAL,
										FiinfraConstants.SRP_SOURCE_MODULE_NOTIFYEVENT,
										FiinfraConstants.SRP_ADD_NOTIFYEVENT,
										"SP="+FiinfraConstants.SP_ADD_NOTIFYEVENT+",name="+name+",description="+description+",eventcategoryid="+eventcategoryid+",sourcesystemid="+sourcesystemid, 
										"Notify Event : " + name);  
				 
				PrintWriter out = null; 
				out = response.getWriter();  
				response.setContentType("application/json");
				objectMapper.writeValue(out, recordCount);         
			 
		}   
		 
		public void editNotifyevent(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
				
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				
				int notifyeventid = Integer.parseInt(request.getParameter("eventIdEdit"));            
				String name= request.getParameter("editName");
				String description = request.getParameter("editdestext");  
				int eventcategoryid = Integer.parseInt(request.getParameter("editcategory"));      
				int sourcesystemid = Integer.parseInt(request.getParameter("editsystem"));          
				int userId=userSession.getUserId();
				
				NotifyEvent eventVo = new NotifyEvent();
				eventVo.setNotifyeventid(notifyeventid);
				eventVo.setName(name);
				eventVo.setDescription(description);
				eventVo.setEventcategoryid(eventcategoryid);
				eventVo.setSourcesystemid(sourcesystemid);  
				eventVo.setUserID(userId);
					        
				url = URL_UPDATE_EVENT + userSession.getUserName()+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<Integer> br = new BaseResponse<Integer>();
			
				br = restTemplate.postForObject(url, eventVo, BaseResponse.class); 
				Integer updateEvent=null; 
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					updateEvent= br.getResponseObject();
				Logger.logEntry(this.getClass(), "Update Event:---"+ updateEvent, Logger.DEBUG, Thread.currentThread()
						.getStackTrace()[1].getMethodName());
				
				//insert code for audit functionality
				FiinfraUtility.doAudit(userSession.getPartyId(),
										userSession.getUserId(), 97111,
										FiinfraConstants.SERVICE_PORTAL,
										FiinfraConstants.SRP_SOURCE_MODULE_NOTIFYEVENT,
										FiinfraConstants.SRP_EDIT_NOTIFYEVENT,
										"SP="+FiinfraConstants.SP_EDIT_NOTIFYEVENT+",name="+name+",description="+description+",eventcategoryid="+eventcategoryid+",sourcesystemid="+sourcesystemid,
										"Notify Event : "+name);   
				
				
				PrintWriter out = null; 
				out = response.getWriter();  
				response.setContentType("application/json");
				objectMapper.writeValue(out, updateEvent);
				
			} 
		
		 @SuppressWarnings("unchecked")
		public void notifyeventExecl(HttpServletRequest request, HttpServletResponse response) {
			
			  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			  try{
			  
			   if(userSession == null) {
			   response.sendRedirect("/login");
			   return ;
			  }


				String searchTextVal = null;
				if (request.getParameterMap().containsKey("searchtext")) {
					searchTextVal = request.getParameter("searchtext").trim();
					
				} else {
					searchTextVal = "";
				}
				
				String userToken = null;
				if(userSession.getUserName()!=null){
					userToken = userSession.getUserName();
				}
				else{
					userToken = "abc";
				}
			  //TODO change hard coding
			  
			  BaseResponse<NotifyEvent> baseResponse = new BaseResponse<NotifyEvent>();
			  NotifyEvent eventVo = new NotifyEvent();
			  eventVo.setSearchText(searchTextVal);  
			  url = URL_GET_EVENT_LIST + userToken + "/1234"; 
			  baseResponse = restTemplate.postForObject(url, eventVo, BaseResponse.class); 
			 
			  List<NotifyEvent> notifyEventAsJson = new ArrayList<NotifyEvent>();
			  List<NotifyEvent> notifyEventList = new ArrayList<NotifyEvent>();	
			  
			   if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			   try {
				   notifyEventAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
			       
				   for(int i = 0; i<notifyEventAsJson.size(); i++){
						
					   NotifyEvent notifyEventList2;
					   notifyEventList2 = objectMapper.readValue(objectMapper.writeValueAsString(notifyEventAsJson.get(i)), NotifyEvent.class);
										
						
					   notifyEventList.add(notifyEventList2);
					}


			   } catch (JsonParseException e) {
			    // TODO Auto-generated catch block
				   logger.error(e);
			   } catch (JsonMappingException e) {
			    // TODO Auto-generated catch block
				   logger.error(e);
			   } catch (JsonGenerationException e) {
			    // TODO Auto-generated catch block
				   logger.error(e);
			   } catch (IOException e) {
			    // TODO Auto-generated catch block
				   logger.error(e);
			   }
			  }
			  
			  
			  
			   response.addHeader("Content-Disposition", "attachment;filename=NotifyEventList.xls");
			        
			   PrintWriter writer = response.getWriter();
			   writer.print(CommonUtils.escape("Category "));
			   writer.print("\t");  
			   writer.print(CommonUtils.escape("Event Name"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("System"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("Event Description"));
			   writer.print("\t");
			   
			   writer.println();
			   for(NotifyEvent list:notifyEventList){
				   
				   
			    writer.print(CommonUtils.escape(list.getCategory()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getName()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getEvent_System()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape( list.getDescription()));
			    writer.println();
			   }
			       
			  } catch (IOException e) {
				  logger.error(e);  
			  }
			 } 

 
		 public void notifyeventCSV(HttpServletRequest request, HttpServletResponse response) {
			 
			  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			  try{
			  
			   if(userSession == null) {
			   response.sendRedirect("/login");
			   return ;
			  }


				String searchTextVal = null;
				if (request.getParameterMap().containsKey("searchtext")) {
					searchTextVal = request.getParameter("searchtext").trim();
					
				} else {
					searchTextVal = "";
				}
				
				String userToken = null;
				if(userSession.getUserName()!=null){
					userToken = userSession.getUserName();
				}
				else{
					userToken = "abc";
				}
				
			  //TODO change hard coding	  
		   
			  BaseResponse<NotifyEvent> baseResponse = new BaseResponse<NotifyEvent>();
			  NotifyEvent eventVo = new NotifyEvent();
			  eventVo.setSearchText(searchTextVal);  
			  url = URL_GET_EVENT_LIST + userToken + "/1234"; 
			  baseResponse = restTemplate.postForObject(url, eventVo, BaseResponse.class);  
			 
			  List<NotifyEvent> notifyEventAsJson = new ArrayList<NotifyEvent>();
			  List<NotifyEvent> notifyEventList = new ArrayList<NotifyEvent>();  
			  
			  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			   try {
				   notifyEventAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
			       
				   for(int i = 0; i<notifyEventAsJson.size(); i++){
						
					   NotifyEvent notifyEventList2;
					   notifyEventList2 = objectMapper.readValue(objectMapper.writeValueAsString(notifyEventAsJson.get(i)), NotifyEvent.class);
										
					 	
					   notifyEventList.add(notifyEventList2);
					}


			   } catch (JsonParseException e) {
			    // TODO Auto-generated catch block
				   logger.error(e);
			   } catch (JsonMappingException e) {
			    // TODO Auto-generated catch block
				   logger.error(e); 
			   } catch (JsonGenerationException e) {
			    // TODO Auto-generated catch block
				   logger.error(e);
			   } catch (IOException e) {
			    // TODO Auto-generated catch block
				   logger.error(e);
			   }
			  }
			   
			   response.addHeader("Content-Disposition", "attachment;filename=NotifyEventList.csv");
			        
			   PrintWriter writer = response.getWriter();
			   writer.print(CommonUtils.escape("Category "));
			   writer.print(","); 
			   writer.print(CommonUtils.escape("Event Name"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("System"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("Event Description"));
			   writer.print(","); 
			   
			   writer.println();
			   for(NotifyEvent list:notifyEventList){
				    writer.print(CommonUtils.escape(list.getCategory()));
				    writer.print(","); 
				    writer.print(CommonUtils.escape(list.getName()));
				    writer.print(",");
				    writer.print(CommonUtils.escape(list.getEvent_System()));
				    writer.print(",");
				    writer.print(CommonUtils.escape( list.getDescription()));
				    writer.println(); 
			   }  
			       
			  } catch (IOException e) {
				  logger.error(e); 
			  }
			 }


}
