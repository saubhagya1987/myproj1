package in.fiinfra.controller;



import static in.fiinfra.common.util.FiinfraConstants.LOCATION_TO_UPLOADFILE;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.AutoPing;
import in.fiinfra.common.service.vo.FileUpload;
import in.fiinfra.common.service.vo.NotifyEvent;
import in.fiinfra.common.service.vo.NotifyTemplate;
import in.fiinfra.common.service.vo.ProductCategoryRevenue;
import in.fiinfra.common.service.vo.Query;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.CommonUtils;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
//import org.quartz.CronExpression;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonParseException;


/*
 * Created by
Author:Sanket Navale
 */
public class AutoPingController extends MultiActionController{
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	String url;
	
	@Value("${URL_GET_AUTOPING_EDIT_LIST}")
	private String URL_GET_AUTOPING_EDIT_LIST;

	@Value("${URL_SAVE_AP_PING}")
	private String URL_SAVE_AP_PING;
	
	@Value("${URL_GET_STANDARD_AUTOPING_LIST}")
	private String URL_GET_STANDARD_AUTOPING_LIST;
	
	@Value("${URL_DELETE_TEMPLATE}")
	private String URL_DELETE_TEMPLATE;
	
	@Value("${URL_DELETE_AUTOPING}")
	private String URL_DELETE_AUTOPING;
	
	@Value("${URL_ADD_TEMPLATE}")
	private String URL_ADD_TEMPLATE;
	
	@Value("${URL_EVENT_EDITLIST}")
	String URL_EVENT_EDITLIST;
	
	@Value("${URL_SAVE_AUTO_PING_EVENT}")
	String URL_SAVE_AUTO_PING_EVENT;
	
	@Value("${URL_AUTO_PING_LIST}")
	String URL_AUTO_PING_LIST;
	
	@Value("${URL_GET_SELECT_EVENT_LIST}")
	String URL_GET_SELECT_EVENT_LIST;
	
	@Value("${URL_SAVE_AUTO_PING}")
	String URL_SAVE_AUTO_PING;
	
	@Value("${URL_SCHEDULED_AUTO_PING}")
	String URL_SCHEDULED_AUTO_PING;

	@Value("${URL_AUTO_PING_EVENT_LIST}")
	String URL_AUTO_PING_EVENT_LIST;

	@Value("${URL_AUTO_PING_SCH_LIST}")
	String URL_AUTO_PING_SCH_LIST;

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
	public ModelAndView saveAutoPingAttach(HttpServletRequest request,HttpServletResponse response,FileUpload fileUpload)throws Exception{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_ADD_TEMPLATE + userSession.getUserName()+ "/1234";
		  
		NotifyTemplate Notifytemplate =  new NotifyTemplate();
		
		File baseFolder=null;
		String fileName = null; 
		String filePath = null;
		String extension = null;
		String basePath = null;  
		MultipartFile multipartFile = null;
		  
		try {  
			
			 multipartFile = (fileUpload).getFile(); 
			String originalFileName = "";
			originalFileName=request.getParameter("ftxtid");    
			

			if (multipartFile != null) {
				originalFileName = multipartFile.getOriginalFilename();
				logger.debug("FILE SIZE in KB:::::"+multipartFile.getSize()/1024+"kb");
			
			if(multipartFile.getSize() > 0 && multipartFile.getSize()<=10000000){

			long currentTime = System.currentTimeMillis();
			 basePath = LOCATION_TO_UPLOADFILE;
			 baseFolder = new File(basePath);
			 fileName = null;  
			 extension = null;  
			fileName = originalFileName.substring(0,
					originalFileName.lastIndexOf("."));  
			extension = originalFileName.substring(originalFileName
					.lastIndexOf("."));
			//logger.info("File name is :--" + fileName);
			//logger.info("extension is:--" + extension); 
			//System.out.println("File name is :--" + fileName); 
			//System.out.println("extension is:--" + extension); 
			/*String[] s = extension.split(".");
			if(s[0].equalsIgnoreCase("BMP")){
				String filetypeId = "11001";   
			}*/
			logger.debug("filename to set:---" + fileName + "_"
					+ currentTime + extension);
			fileName = fileName + "_" + currentTime + extension;
			filePath = basePath + "\\" + fileName;
			logger.debug("filePath:-------" + filePath);     
			File fileToUpload = new File(filePath);   
			if (baseFolder.exists()) {  
				/*
				 * FileUtils.deleteDirectory(baseFolder); baseFolder = new
				 * File(basePath); baseFolder.mkdirs();  
				 */}  else { 
				baseFolder.mkdirs();// creates directory
			}
			// uploads file to that directory 

			logger.debug("fileToUpload::" + fileToUpload); 
			multipartFile.transferTo(fileToUpload);
			}else{ 
				logger.debug("Size  should be less than 10000000 bytes and greater than 0.");
				//return ;
			}
		 }
		  } catch (Exception e) {   
			
			logger.error(e);                  
		}     
		  
		String fileName1 = null;  
		String filePath1 = null;
		String extension1 = null;
		String basePath1 = null;  
		      
		try {       
			
			 multipartFile = (fileUpload).getFile1(); 
			String originalFileName = "";
			originalFileName=request.getParameter("ftxtid1");    
			  

			if (multipartFile != null) {
				originalFileName = multipartFile.getOriginalFilename();
				logger.debug("FILE SIZE in KB:::::"+multipartFile.getSize()/1024+"kb");
			
			if(multipartFile.getSize() > 0 && multipartFile.getSize()<=10000000){

			long currentTime = System.currentTimeMillis();
			 basePath1= LOCATION_TO_UPLOADFILE;
			 baseFolder = new File(basePath1);
			 fileName1 = null;  
			 extension1 = null;  
			fileName1 = originalFileName.substring(0,
					originalFileName.lastIndexOf("."));  
			extension1 = originalFileName.substring(originalFileName
					.lastIndexOf("."));
			//logger.info("File name is :--" + fileName);
			//logger.info("extension is:--" + extension);
			//System.out.println("File name is :--" + fileName1); 
			//System.out.println("extension is:--" + extension1); 
			/*String[] s = extension.split(".");
			if(s[0].equalsIgnoreCase("BMP")){
				String filetypeId = "11001";
			}*/
			logger.debug("filename to set:---" + fileName1 + "_"
					+ currentTime + extension1);
			fileName1 = fileName1 + "_" + currentTime + extension1;
			filePath1 = basePath1 + "\\" + fileName1;
			logger.debug("filePath:-------" + filePath1);   
			File fileToUpload = new File(filePath1);   
			if (baseFolder.exists()) {  
				/*
				 * FileUtils.deleteDirectory(baseFolder); baseFolder = new
				 * File(basePath); baseFolder.mkdirs();  
				 */} else { 
				baseFolder.mkdirs();// creates directory
			}
			// uploads file to that directory

			logger.debug("fileToUpload::" + fileToUpload); 
			multipartFile.transferTo(fileToUpload);
			}else{ 
				logger.debug("Size  should be less than 10000000 bytes and greater than 0.");
				//return ;
			} 
		 } 
		  } catch (Exception e) {     
			
			logger.error(e);                       
		}   
		
		String fileName2 = null;
		String filePath2 = null;
		String extension2 = null;
		String basePath2 = null;  
		      
		try {       
			
			 multipartFile = (fileUpload).getFile2(); 
			String originalFileName = "";
			originalFileName=request.getParameter("ftxtid2");    
			

			if (multipartFile != null) {
				originalFileName = multipartFile.getOriginalFilename();
				logger.debug("FILE SIZE in KB:::::"+multipartFile.getSize()/1024+"kb");
			
			if(multipartFile.getSize() > 0 && multipartFile.getSize()<=10000000){

			long currentTime = System.currentTimeMillis();
			 basePath2= LOCATION_TO_UPLOADFILE; 
			 baseFolder = new File(basePath2);    
			 fileName2 = null;  
			 extension2 = null;  
			fileName2 = originalFileName.substring(0,
					originalFileName.lastIndexOf("."));  
			extension2 = originalFileName.substring(originalFileName
					.lastIndexOf("."));
			//logger.info("File name is :--" + fileName);
			//logger.info("extension is:--" + extension);
			//System.out.println("File name is :--" + fileName2); 
			//System.out.println("extension is:--" + extension2); 
			/*String[] s = extension.split(".");
			if(s[0].equalsIgnoreCase("BMP")){
				String filetypeId = "11001";    
			}*/
			logger.debug("filename to set:---" + fileName2 + "_"
					+ currentTime + extension2);
			fileName2 = fileName2 + "_" + currentTime + extension2;
			filePath2 = basePath2 + "\\" + fileName2;
			logger.debug("filePath:-------" + filePath2);   
			File fileToUpload = new File(filePath2);   
			if (baseFolder.exists()) {  
				/*
				 * FileUtils.deleteDirectory(baseFolder); baseFolder = new
				 * File(basePath); baseFolder.mkdirs();  
				 */} else { 
				baseFolder.mkdirs();// creates directory
			}
			// uploads file to that directory

			logger.debug("fileToUpload::" + fileToUpload); 
			multipartFile.transferTo(fileToUpload);
			}else{ 
				logger.debug("Size  should be less than 10000000 bytes and greater than 0.");
				//return ;
			}
		 } 
		  } catch (Exception e) {     
			
			logger.error(e);                       
		}       
	  
		
		int partyId      = 	userSession.getPartyId();
		int notifyTypeId = 	56004;
		String name 	 = 	request.getParameter("pingName"); 
		String desc		 = 	request.getParameter("pindDescription"); 
		int notifyEventId=	Integer.parseInt(request.getParameter("eventId"))	;
		int notifyTargetId= Integer.parseInt(request.getParameter("notifyTargetId"));
		int deliveryChannelId = Integer.parseInt(request.getParameter("deliveryChannelId"));
		int useSignId = Integer.parseInt(request.getParameter("useSignature")); 
		Boolean  isActive = Boolean.parseBoolean((request.getParameter("true")));
		Boolean isDND = Boolean.parseBoolean(request.getParameter("true")) ;
		Boolean isDisclamer = Boolean.parseBoolean(request.getParameter("true")); 
		/*String from = request.getParameter("searchStringEmailName");    
		String  fromId = request.getParameter("searchString").replaceAll("," ,";");
		String  to = request.getParameter("searchStringTo").replaceAll("," ,";");
		*/
		String cc =  request.getParameter("cc"); 
		String bcc =  request.getParameter("bcc"); 
		String subject = request.getParameter("subject");   
		String body = request.getParameter("emailBody");
		//String replyto = request.getParameter("searchString1");    
		  
		String templateXML = "<root><from></from><fromId></fromId><to></to><cc>"+cc+"</cc><bcc>"+bcc+"</bcc><phone></phone><subject>"+subject+"</subject><body><![CDATA["
				+body +"]]></body><replyTo></replyTo></root>";   
		
		Notifytemplate.setFileName(fileName); 
		Notifytemplate.setFileName1(fileName1);
		Notifytemplate.setFileName2(fileName2); 
		Notifytemplate.setFileStoragePathURI(filePath);  
		Notifytemplate.setFileStoragePathURI1(filePath1);  
		Notifytemplate.setFileStoragePathURI2(filePath2); 
		Notifytemplate.setPartyID(partyId);
		Notifytemplate.setNotifyTypeID(notifyTypeId);
		Notifytemplate.setName(name);
		Notifytemplate.setDescription(desc);  
		Notifytemplate.setEventid(notifyEventId);
		Notifytemplate.setNotifyTargetID(notifyTargetId);
		Notifytemplate.setDeliveryChannelID(deliveryChannelId);
		Notifytemplate.setUseSignatureID(useSignId); 
		Notifytemplate.setisActive(isActive);
		Notifytemplate.setisAddDiscl(isDisclamer);
		Notifytemplate.setisAddDND(isDND);   
		Notifytemplate.setTemplate(templateXML);   
		 
		  ObjectMapper om = new CustomJacksonObjectMapper();
		  String jsonString=om.writeValueAsString(Notifytemplate);
		  logger.debug("jsonString:---"+jsonString);
		  Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
		    .currentThread().getStackTrace()[1].getMethodName());
		  List<NotifyTemplate> templateList=new ArrayList<>(); 
		     
		//if(fileName!=null && basePath!=null && fileName1!=null && basePath1!=null && fileName2!=null && basePath2!=null  && multipartFile!=null  ){  
			if(request.getParameter("hiddenIsToClose")!=null && request.getParameter("hiddenIsToClose").equals("0"))
			{  
				request.setAttribute("hiddenIsToClosee","0");  
				    
			}else{
				  
				request.setAttribute("hiddenIsToClosee","");
			}                 
			
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			       
		    BaseResponse<List<NotifyTemplate>> br = new BaseResponse<List<NotifyTemplate>>();
			   logger.debug("In template ....."); 
			   br = restTemplate.postForObject(url, Notifytemplate, BaseResponse.class);
			      
			   if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))    
				   templateList = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()),List.class);
		//} 
			    
			 //insert code for audit functionality
			 FiinfraUtility.doAudit(userSession.getPartyId(), 
									   userSession.getUserId(), 
									   97113, 
									   FiinfraConstants.SERVICE_PORTAL, 
									   FiinfraConstants.SRP_SOURCE_MODULE_NOTIFYTEMPLATE, 
									   FiinfraConstants.SRP_ADD_NOTIFYTEMPLATE, 
									   "SP="+FiinfraConstants.SP_ADD_NOTIFY_TEMPLATE+",name="+name+",description="+desc+",notifyEventId="+notifyEventId+",notifyTargetId="+notifyTargetId,
									   "Notify Template : " +name);       
			   
			                 
		String s = "/";  
		return new ModelAndView("redirect:"+s+"notifytemplate/getTemplateList.htm?isToClose="+request.getParameter("hiddenIsToClose")+"");
		
	}
	
	public void getAutoPingEditList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		int eventId=Integer.parseInt(request.getParameter("eventId"));
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_EVENT_EDITLIST + userSession.getName()
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("eventId", eventId);
		BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
		br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<AutoPing> editeventList = new ArrayList<AutoPing>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			editeventList= br.getResponseListObject();
	
		logger.info(editeventList);
		
	/*	String AddPingList= "NotifyTemplateID = "+notifyTemplateData.getNotifyTemplateID()+
				",PartyID ="+ notifyTemplateData.getPartyID();
		
		FiinfraUtility.doAudit(userSession.getPartyId(),
				   userSession.getUserId(),
	               FiinfraConstants.SRP_ADD_USER_EVENT_ID,
	               FiinfraConstants.SERVICE_PORTAL,
	               FiinfraConstants.SRP_SOURCE_MODULE_USER,
	               FiinfraConstants.SRP_ADD_USER,
	               "SP="+FiinfraConstants.SP_AUTOPING_EDIT_LIST+",List="+AddUserList,
	               "List="+AddUserList);
*/
		
		PrintWriter out=null ;	
		out = response.getWriter();
		response.setContentType("application/json");
  		objectMapper.writeValue(out,editeventList);
	}
	
	//this method use to redirect autoping page
	public ModelAndView getAutoPing(HttpServletRequest request,HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("/autoping/autoping");
		return mav;
	}
	
	public void saveEvent(HttpServletRequest request,HttpServletResponse response,AutoPing autoping)throws Exception{
		System.out.println("welcome");
		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdby = userSession.getUserId();
		int lastModifiedBy = userSession.getUserId();
		
		
		autoping.setCreatedby(createdby);
		autoping.setLastModifiedBy(lastModifiedBy);
		
		url = URL_SAVE_AUTO_PING_EVENT + "xyz" + "/1234";
		
		
		logger.info("url:-" + url);
		   
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, autoping, BaseResponse.class);
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
	//this method use to show auto ping list
	@RequestMapping(value = "/getAutoPingEvent", method = RequestMethod.GET)
	public ModelAndView getAutoPingEvent(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		url = URL_AUTO_PING_EVENT_LIST+ "abc"
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
		br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<AutoPing> autoping_eventlist = new ArrayList<AutoPing>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			autoping_eventlist= br.getResponseListObject();
		logger.info(autoping_eventlist);
		ModelAndView mav = new ModelAndView("autoping/autopingEvent");
		mav.addObject("autoping_eventlist",  objectMapper.writeValueAsString(autoping_eventlist));
		mav.addObject("size", pagesize);
		return mav;
	}
	
	//this method use to show auto ping list
	@RequestMapping(value = "/getAutoPingScheduled", method = RequestMethod.GET)
	public ModelAndView getAutoPingScheduled(HttpServletRequest request,HttpServletResponse response)throws IOException{
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		url = URL_AUTO_PING_SCH_LIST+ "abc"
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
		br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<AutoPing> autoping_schlist = new ArrayList<AutoPing>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			autoping_schlist= br.getResponseListObject();
		logger.info(autoping_schlist);
		ModelAndView mav = new ModelAndView("autoping/autopingScheduled");
		mav.addObject("autoping_schlist",  objectMapper.writeValueAsString(autoping_schlist));
		mav.addObject("size", pagesize);
		return mav;
	}
	
	//this method use to show auto ping list
	@RequestMapping(value = "/showAutoPingList", method = RequestMethod.GET)
	public ModelAndView showAutoPingList(HttpServletRequest request,HttpServletResponse response)throws IOException{
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		url = URL_AUTO_PING_LIST+ "abc"
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
		br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<AutoPing> autopinglist = new ArrayList<AutoPing>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			autopinglist= br.getResponseListObject();
		logger.info(autopinglist);
		ModelAndView mav = new ModelAndView("autoping/autoping");
		mav.addObject("autopinglist", autopinglist);
		mav.addObject("size", pagesize);
		return mav;
	}
	
	@RequestMapping(value = "/addAutoPing", method = RequestMethod.GET)
	public ModelAndView addAutoPing(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("autoping/addautoping");
		String id = request.getParameter("notifyTemplateId");
		String action = "Add";
		if (id != null && id!="") {
			action = "Edit";
		}
		mav.addObject("action", action);
		return mav;
	}
	
	//redirect to add evnt page
		@RequestMapping(value = "/addAutoPingEvent", method = RequestMethod.GET)
		public ModelAndView addAutoPingEvent(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView("/autoping/addEvent");
			String eventid = request.getParameter("eventId");
			String action = "Add";
			if (eventid != null && eventid!="") {
				action = "Edit";
			}
			//mav.addObject("action", action);
			mav.addObject("eventId",eventid);
			return mav;
		}
	
	@RequestMapping(value = "/scheduleAp.htm", method = RequestMethod.GET)
	public ModelAndView scheduleAp(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		ModelAndView mav=new ModelAndView("/autoping/ap_schedule");
		mav.addObject("pingId", request.getParameter("pingId"));
		mav.addObject("pingName", request.getParameter("pingName"));
		mav.addObject("source",request.getParameter("source"));
		mav.addObject("event", request.getParameter("event"));
		return mav;
	}

	//select Event based on source
	public void selectEventTypes(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		  UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		  url = URL_GET_SELECT_EVENT_LIST+"xyz/1234";
		  
		  String selectSource=request.getParameter("selectSourceId");
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		  uriCB.queryParam("selectSource", selectSource);
		  BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
		  br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		  List<AutoPing> NotifyEventList = new ArrayList<AutoPing>();
		  if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			  NotifyEventList= br.getResponseListObject();
		  PrintWriter out = null;
		  out = response.getWriter();
		  response.setContentType("application/json");
		  objectMapper.writeValue(out, NotifyEventList);
		  
	}
	
/*	public void saveAutoPing(HttpServletRequest request,HttpServletResponse response,AutoPing autoping) throws Exception{
		System.out.println("welcome");
		String result = FiinfraConstants.FAIL;
		String templateXML;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partyId=userSession.getPartyId();
		int createdby = userSession.getUserId();
		int lastModifiedBy = userSession.getUserId();
		int deliveryChannelId=autoping.getDeliveryChannelId();
		
		if(deliveryChannelId == 32001){
			templateXML = "<root><from></from><fromId></fromId><to></to><cc>"+autoping.getCc()+"</cc><bcc>"+autoping.getBcc()+"</bcc><phone></phone><body><![CDATA["
					+autoping.getEmailBody() +"]]></body></root>"; 
			autoping.setTemplateXML(templateXML);	
		}else 
		if(deliveryChannelId == 32002){
			templateXML = "<root><from></from><fromId></fromId><to></to><cc></cc><bcc></bcc><phone></phone><body><![CDATA["
					+autoping.getSmsBody() +"]]></body></root>"; 
			autoping.setTemplateXML(templateXML);
			autoping.setUseSignature(29002);
		}
		
		
		autoping.setPartyId(partyId);
		autoping.setNotifyTypeId(56004);
		
		autoping.setCreatedby(createdby);
		autoping.setLastModifiedBy(lastModifiedBy);
		
		url = URL_SAVE_AUTO_PING + "xyz" + "/1234";
		logger.info("url:-" + url);
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, autoping, BaseResponse.class);
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
*/	
	
	//save autoping deatils
	@SuppressWarnings("unchecked")
	public void saveAutoPing(HttpServletRequest request,HttpServletResponse response,NotifyTemplateData notifyTemplateData) throws IOException{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		int createdBy = userSession.getUserId();
		
		int partyID= userSession.getBuId();
		
		notifyTemplateData.setNotifyTypeID(56004);
		notifyTemplateData.setNotifyTargetID(28005);
		notifyTemplateData.setPartyID(partyID);
		notifyTemplateData.setSourceSystemID(FiinfraConstants.SERVICE_PORTAL);
		notifyTemplateData.setCreatedBy(createdBy);
		notifyTemplateData.setLastModifiedBy(createdBy);
		String result = FiinfraConstants.FAIL;
		url = URL_SAVE_AP_PING+ "abc" + "/1234";
		logger.info("url:-"+url);
		BaseResponse<String> br = new BaseResponse<String>();
		List<String> resultList=new ArrayList<>();
		br = restTemplate.postForObject(url, notifyTemplateData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
		}

		
			
				
String AddPingList="NotifyTemplateID = "+notifyTemplateData.getNotifyTemplateID()+
			",PartyID="+notifyTemplateData.getPartyID()+
			",NotifyTypeID="+notifyTemplateData.getNotifyTypeID()+
			",Name="+notifyTemplateData.getName()+
            ",Description="+notifyTemplateData.getDescription()+
            ",NotifyEventID="+notifyTemplateData.getNotifyEventID()+
            ",NotifyTargetID="+notifyTemplateData.getNotifyTargetID()+
            ",DeliveryChannelID="+notifyTemplateData.getDeliveryChannelID()+
			",UseSignatureID="+notifyTemplateData.getUseSignatureID()+
			",NotifyTemplateXML="+notifyTemplateData.getNotifyTemplateXML()+
			",Createdby="+notifyTemplateData.getCreatedBy()+
			",LastModifiedBy="+notifyTemplateData.getLastModifiedBy();

	
		//insert code for audit functionality
		FiinfraUtility.doAudit(userSession.getPartyId(),
				   userSession.getUserId(),
	               FiinfraConstants.SRP_ADD_AUTOPING_EVENT_ID,
	               FiinfraConstants.SERVICE_PORTAL,
	               FiinfraConstants.SRP_SOURCE_MODULE_AUTOPING,
	               FiinfraConstants.SRP_ADD_AUTOPING,
	               "SP="+FiinfraConstants.SP_ADD_AUTOPING+",List="+AddPingList,
	               "List="+AddPingList);
	
		
	
		
		
		
		
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
		}

	
	public void saveAutoPingScheduled(HttpServletRequest request,HttpServletResponse response,AutoPing autoping)throws Exception{
		String result = FiinfraConstants.FAIL;
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdby = userSession.getUserId();
		int lastModifiedBy = userSession.getUserId();
		int frqId=autoping.getFrequencyId();
		int selectType=autoping.getSelectType();
	//	CronExpression expression=new CronExpression(autoping.getFrequencyValue());
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
	//	System.out.println(expression.getExpressionSummary());
	//	System.out.println(expression.getNextValidTimeAfter(new Date()));
		Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
	      
        Date currentTime = localCalendar.getTime();
        int currentDay = localCalendar.get(Calendar.DATE);
       
        int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
        int currentYear = localCalendar.get(Calendar.YEAR);
        int currentHour= localCalendar.get(Calendar.HOUR);
        int currentHourWeek=localCalendar.get(Calendar.HOUR_OF_DAY);
        int currentDayOfWeek = localCalendar.get(Calendar.DAY_OF_WEEK);
        int currentDayOfMonth = localCalendar.get(Calendar.DAY_OF_MONTH);
        int CurrentDayOfYear = localCalendar.get(Calendar.DAY_OF_YEAR);
        Date currentFireDate;
        	if(selectType == 1){
			autoping.setFrequencyId(63009);
			autoping.setFrequencyValue(-autoping.getFrequencyValue());
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.MINUTE, 15);
			autoping.setScheduleDttm(sdf.format(cal.getTime()));		
		}else if(selectType == 2){
			autoping.setFrequencyId(63009);
			autoping.setFrequencyValue(autoping.getFrequencyValue());
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.MINUTE, 15);
			autoping.setScheduleDttm(sdf.format(cal.getTime()));		
		}

		if(frqId == 63001 )
		{
			localCalendar.set(Calendar.HOUR,10);
			currentFireDate=localCalendar.getTime();
			autoping.setScheduleDttm(sdf.format(currentFireDate));
		}else
		if(frqId == 63002 )
		{ 
		
				switch(currentDayOfWeek) {
		        case Calendar.MONDAY:
		        	localCalendar.add(Calendar.DAY_OF_WEEK,6);
	            break;
		        case Calendar.TUESDAY:
		        	localCalendar.add(Calendar.DAY_OF_WEEK,5);
	            break;
		        case Calendar.WEDNESDAY:
		        	localCalendar.add(Calendar.DAY_OF_WEEK,4);
	            break;
		        case Calendar.THURSDAY:
		        	localCalendar.add(Calendar.DAY_OF_WEEK,3);
	            break;
		        case Calendar.FRIDAY:
		        	localCalendar.add(Calendar.DAY_OF_WEEK,2);
	            break;
		        case Calendar.SATURDAY:
		        	localCalendar.add(Calendar.DAY_OF_WEEK,1);
	            break;
		        case Calendar.SUNDAY:
		        	localCalendar.add(Calendar.DAY_OF_WEEK,0);
	            break;
	            
			 }	
			 currentFireDate=localCalendar.getTime();
				autoping.setScheduleDttm(sdf.format(currentFireDate));
		
		}else
		if(frqId == 63003 )
		{
			localCalendar.add(Calendar.MONTH, 1);
			localCalendar.set(Calendar.DATE, localCalendar.getActualMinimum(Calendar.DAY_OF_MONTH));
			currentFireDate=localCalendar.getTime();
			autoping.setScheduleDttm(sdf.format(currentFireDate));
			
		}else	
		if(frqId == 63004 )
		{
			localCalendar.add(Calendar.MONTH, 3);
			localCalendar.set(Calendar.DATE, localCalendar.getActualMinimum(Calendar.DAY_OF_MONTH));
			currentFireDate=localCalendar.getTime();
			autoping.setScheduleDttm(sdf.format(currentFireDate));
		}else 
			
		if(frqId == 63005 )
		{
			localCalendar.add(Calendar.MONTH, 6);
			localCalendar.set(Calendar.DATE, localCalendar.getActualMinimum(Calendar.DAY_OF_MONTH));
			currentFireDate=localCalendar.getTime();
			autoping.setScheduleDttm(sdf.format(currentFireDate));
		}else
			if(frqId == 63006 )
		{	
			localCalendar.add(Calendar.YEAR, 1);
			currentFireDate=localCalendar.getTime();
			autoping.setScheduleDttm(sdf.format(currentFireDate));
		}
		else if(frqId == 63007){
			
			Calendar cal = Calendar.getInstance();
			autoping.setScheduleDttm(sdf.format(cal.getTime()));
		}
		else if(frqId == 63009){
			Calendar cal = Calendar.getInstance();
			autoping.setScheduleDttm(sdf.format(cal.getTime()));		
		}
		
		 autoping.setTemplateId(autoping.getPingId());
		autoping.setFrequencyId(autoping.getFrequencyId());
		
		autoping.setCreatedby(createdby);
		autoping.setIsRecuring(1);
		autoping.setFrequencyValue(autoping.getFrequencyValue());
		autoping.setLastModifiedBy(lastModifiedBy);
	
		url = URL_SCHEDULED_AUTO_PING + "xyz" + "/1234";
		
		
		logger.info("url:-" + url);
		   
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, autoping, BaseResponse.class);
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
	public void eventExport(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		
		

		try {

			//AutoPing revBook = new AutoPing();
			
			List<AutoPing> premAsJson = new ArrayList<AutoPing>();
			List<AutoPing> premumList = new ArrayList<AutoPing>();

			/*BaseResponse<AutoPing> baseResponse = new BaseResponse<AutoPing>();
			url = URL_AUTO_PING_EVENT_LIST+ userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, revBook,
					BaseResponse.class);*/
			url = URL_AUTO_PING_EVENT_LIST+ "abc"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<AutoPing> baseResponse = new BaseResponse<AutoPing>();
			baseResponse =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			//List<AutoPing> autoping_eventlist = new ArrayList<AutoPing>();
			/*if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				autoping_eventlist= baseResponse.getResponseListObject();*/

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					premAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < premAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						AutoPing list2;
						list2 = objectMapper.readValue(objectMapper
								.writeValueAsString(premAsJson.get(i)),
								AutoPing.class);

						premumList.add(list2);
					}

				} catch (JsonParseException e) {
					logger.error(""+e);
				} catch (JsonMappingException e) {
					logger.error(""+e);
				} catch (JsonGenerationException e) {
					logger.error(""+e);
				} catch (IOException e) {
					logger.error(""+e);
				}
			}

			String type = request.getParameter("type");
			String seperator = ",";
			if (type.equals("CSV")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=event.csv"); 	
				seperator = ",";
			}
			if (type.equals("excel")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=event.xls");
				seperator = "\t";
			}

			/*
			 * if (type.equals("CSV")) {
			 * response.addHeader("Content-Disposition",
			 * "attachment;filename=ProductCategoryRevenue.csv");
			 */

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Event"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Event Description"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Source"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("LastModifiedDate"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("LastModifiedBy"));

			

			writer.println();
			for (AutoPing list : premumList) {

				writer.print(CommonUtils.escape("" + list.getEvent()));
				writer.print(seperator);

				writer.print(CommonUtils.escape("" + list.getEventDescription()));
				writer.print(seperator);

				writer.print(CommonUtils.escape("" + list.getSource()));
				writer.print(seperator);

				writer.print(CommonUtils.escape("" + list.getLastModifiedDate()));
				writer.print(seperator);
				
				writer.print(CommonUtils.escape("" + list.getEventCreatedBy()));
				writer.print(seperator);

				

				writer.println();
			}

			// }

		} catch (Exception e) {
			logger.error(""+e);
		}

	}
	@SuppressWarnings("unchecked")
	public void scheduledExport(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}
		try {

			//AutoPing revBook = new AutoPing();
			
			List<AutoPing> premAsJson = new ArrayList<AutoPing>();
			List<AutoPing> premumList = new ArrayList<AutoPing>();

			/*BaseResponse<AutoPing> baseResponse = new BaseResponse<AutoPing>();
			url = URL_AUTO_PING_EVENT_LIST+ userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, revBook,
					BaseResponse.class);*/
			url = URL_AUTO_PING_SCH_LIST+ "abc"
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<AutoPing> baseResponse = new BaseResponse<AutoPing>();
			baseResponse =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			//List<AutoPing> autoping_eventlist = new ArrayList<AutoPing>();
			/*if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				autoping_eventlist= baseResponse.getResponseListObject();*/

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					premAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < premAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						AutoPing list2;
						list2 = objectMapper.readValue(objectMapper
								.writeValueAsString(premAsJson.get(i)),
								AutoPing.class);

						premumList.add(list2);
					}

				} catch (JsonParseException e) {
					logger.error(""+e);
				} catch (JsonMappingException e) {
					logger.error(""+e);
				} catch (JsonGenerationException e) {
					logger.error(""+e);
				} catch (IOException e) {
					logger.error(""+e);
				}
			}

			String type = request.getParameter("type");
			String seperator = ",";
			if (type.equals("CSV")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=AutoPingSchedule.csv"); 	
				seperator = ",";
			}
			if (type.equals("excel")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=AutoPingSchedule.xls");
				seperator = "\t";
			}

			/*
			 * if (type.equals("CSV")) {
			 * response.addHeader("Content-Disposition",
			 * "attachment;filename=ProductCategoryRevenue.csv");
			 */

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Auto Ping Name"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Event"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Schedule Date"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Schedule Type"));

			writer.println();
			for (AutoPing list : premumList) {

				writer.print(CommonUtils.escape("" + list.getPingName()));
				writer.print(seperator);

				writer.print(CommonUtils.escape("" + list.getEvent()));
				writer.print(seperator);

				writer.print(CommonUtils.escape("" + list.getScheduleDttm()));
				writer.print(seperator);
				
				writer.print(CommonUtils.escape("" + list.getNextFiretime()));
				writer.print(seperator);

				

				writer.println();
			}

			// }

		} catch (Exception e) {
			logger.error(""+e);
		}

	}
	
	public void deleteAutoPingAttach(HttpServletRequest request,HttpServletResponse response) throws IOException 
	  { 
			
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			String list=request.getParameter("Lists");
			url = URL_DELETE_TEMPLATE + userSession.getUserName()+ "/1234";
			logger.debug("selectedlvalzzzzzzzzzzzzzzzzzzzzzzzzzzzzz:::"+request.getParameter("Lists"));
			   
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("Lists", list);
		    
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			Integer templateList=null;
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			templateList= br.getResponseObject();    
			   
			Logger.logEntry(this.getClass(), "templateList:---"+ templateList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(), 
					   userSession.getUserId(), 
					   97115, 
					   FiinfraConstants.SERVICE_PORTAL, 
					   FiinfraConstants.SRP_SOURCE_MODULE_NOTIFYTEMPLATE, 
					   FiinfraConstants.SRP_DELETE_NOTIFYTEMPLATE, 
					   "SP="+FiinfraConstants.SP_DELETE_NOTIFYTEMPLATE+",List="+list, 
					   "Notify Templates : " + list);  
			
			PrintWriter out = null;
			out = response.getWriter(); 
			response.setContentType("application/json");
			objectMapper.writeValue(out, templateList); 
			 
			
			 
			}
	
	//Get standard autoping list 
		@SuppressWarnings("unchecked")
		@RequestMapping(value = "/getAutoPings.htm", method = RequestMethod.GET)
		public ModelAndView getAutoPings(HttpServletRequest request,
				HttpServletResponse response) throws Exception {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			String userToken = null;
			if (userSession.getUserName() != null) {
				userToken = userSession.getUserName();
			} else {
				userToken = "abc";
			}

			ModelAndView mav = new ModelAndView("/autoping/autoping");
			String pagesize = request.getParameter("pageSize");
			if (pagesize == null) {
				pagesize = "10";
			}
			try {

				NotifyTemplateData autopingList = new NotifyTemplateData();
				url = URL_GET_STANDARD_AUTOPING_LIST + userToken + "/1234";

				BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
				br = restTemplate.postForObject(url, autopingList, BaseResponse.class);
				List<NotifyTemplateData> autoping_List = new ArrayList<NotifyTemplateData>();
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					autoping_List = br.getResponseListObject();
				//mav.addObject("autoping_List", autoping_List);
				
				mav.addObject("autoping_List",  objectMapper.writeValueAsString(autoping_List));
				mav.addObject("size", pagesize);
			} catch (Exception e) {
				logger.error("" + e);
			}

			return mav;
		}
		
		@SuppressWarnings("unchecked")
		public void autopingExport(HttpServletRequest request,
				HttpServletResponse response) {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			String userToken = null;
			if (userSession.getUserName() != null) {
				userToken = userSession.getUserName();
			} else {
				userToken = "abc";
			}
			try {

				NotifyTemplateData revBook = new NotifyTemplateData();

				url = URL_GET_STANDARD_AUTOPING_LIST+ "abc"
						+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				BaseResponse<AutoPing> baseResponse = new BaseResponse<AutoPing>();
				baseResponse =  restTemplate.postForObject(url, revBook,
						BaseResponse.class);

				List<NotifyTemplateData> premAsJson = new ArrayList<NotifyTemplateData>();
				List<NotifyTemplateData> teamMemberList = new ArrayList<NotifyTemplateData>();

				if (baseResponse.getStatus().equalsIgnoreCase(
						FiinfraConstants.success)) {
					try {
						premAsJson = objectMapper.readValue(objectMapper
								.writeValueAsString(baseResponse
										.getResponseListObject()), ArrayList.class);

						for (int i = 0; i < premAsJson.size(); i++) {
							// get the actual party object from its LinkedHashMap
							// representation
							NotifyTemplateData list2;
							list2 = objectMapper.readValue(objectMapper
									.writeValueAsString(premAsJson.get(i)),
									NotifyTemplateData.class);

							teamMemberList.add(list2);
						}

					} catch (JsonParseException e) {
						logger.error(""+e);
					} catch (JsonMappingException e) {
						logger.error(""+e);
					} catch (JsonGenerationException e) {
						logger.error(""+e);
					} catch (IOException e) {
						logger.error(""+e);
					}
				}

				String type = request.getParameter("type");
				String seperator = ",";
				if (type.equals("CSV")) {
					response.addHeader("Content-Disposition",
							"attachment;filename=AutoPingList.csv"); 	
					seperator = ",";
				}
				if (type.equals("excel")) {
					response.addHeader("Content-Disposition",
							"attachment;filename=AutoPingList.xls");
					seperator = "\t";
				}

				/*
				 * if (type.equals("CSV")) {
				 * response.addHeader("Content-Disposition",
				 * "attachment;filename=ProductCategoryRevenue.csv");
				 */

				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("AutoPing Name"));

				writer.print(seperator);
				writer.print(CommonUtils.escape("Source"));

				writer.print(seperator);
				writer.print(CommonUtils.escape("Event"));

				writer.print(seperator);
				writer.print(CommonUtils.escape("Delivery Channel"));

				writer.print(seperator);
				writer.print(CommonUtils.escape("Creation Date"));

				

				writer.println();
				for (NotifyTemplateData list : teamMemberList) {

					writer.print(CommonUtils.escape("" + list.getName()));
					writer.print(seperator);

					writer.print(CommonUtils.escape("" + list.getSource()));
					writer.print(seperator);

					writer.print(CommonUtils.escape("" + list.getEvent()));
					writer.print(seperator);

					writer.print(CommonUtils.escape("" + list.getDeliveryChannel()));
					writer.print(seperator);
					
					writer.print(CommonUtils.escape("" + list.getCreatedDate()));
					writer.print(seperator);

					

					writer.println();
				}

				// }

			} catch (Exception e) {
				
				
				logger.error(""+e);
			}

		}
		
		public void getAutoPingEditDetails(HttpServletRequest request,HttpServletResponse response) throws IOException{
			
			 UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			  url = URL_GET_AUTOPING_EDIT_LIST+"xyz/1234";
			  int buId = userSession.getBuId();
			  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			  uriCB.queryParam("notifyTemplateId", request.getParameterValues("notifyTemplateId"));
				uriCB.queryParam("buId", buId);
			  BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
			  br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			  List<NotifyTemplateData> NotifyEventList = new ArrayList<NotifyTemplateData>();
			  if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				  NotifyEventList= br.getResponseListObject();
			
		
				FiinfraUtility.doAudit(userSession.getPartyId(),
						   userSession.getUserId(),
			               FiinfraConstants.SRP_EDIT_AUTOPING_EVENT_ID,
			               FiinfraConstants.SERVICE_PORTAL,
			               FiinfraConstants.SRP_SOURCE_MODULE_AUTOPING,
			               FiinfraConstants.SRP_EDIT_AUTOPING,
			               "SP="+FiinfraConstants.SP_AUTOPING_EDIT_LIST+",buId="+buId,
			               "buId="+buId);
			 
				  PrintWriter out = null;
				  out = response.getWriter();
				  response.setContentType("application/json");
				  objectMapper.writeValue(out, NotifyEventList);            
			  
			  
		}
	
}
