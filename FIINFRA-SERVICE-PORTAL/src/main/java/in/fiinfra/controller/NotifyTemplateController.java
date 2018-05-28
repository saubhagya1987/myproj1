package in.fiinfra.controller;

import static in.fiinfra.common.util.FiinfraConstants.LOCATION_TO_UPLOADFILE;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.FileUpload;
import in.fiinfra.common.service.vo.NotifyTemplate; 
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.CommonUtils;

import java.io.File; 
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonParseException;

import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.CharacterData; 
import org.w3c.dom.Element;
import org.w3c.dom.Node; 
import org.xml.sax.SAXException; 
import org.xml.sax.SAXParseException; 
 
   

public class NotifyTemplateController extends MultiActionController {
	    
	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(NotifyTemplateController.class);
	 
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
	
	@Value("${URL_GET_TEMPLATE_LIST}")
	private String URL_GET_TEMPLATE_LIST;  
	@Value("${URL_DELETE_TEMPLATE}")
	private String URL_DELETE_TEMPLATE;
	@Value("${URL_GET_BIZUNIT_SECTION}")
	private String URL_GET_BIZUNIT_SECTION; 
	@Value("${URL_GET_SYSTEM_SECTION}")
	private String URL_GET_SYSTEM_SECTION;
	@Value("${URL_GET_EVENT_SECTION}")
	private String URL_GET_EVENT_SECTION; 
	@Value("${URL_GET_NAME_SECTION}")
	private String URL_GET_NAME_SECTION; 
	@Value("${URL_GET_EMAIL_SECTION}")
	private String URL_GET_EMAIL_SECTION;
	@Value("${URL_GET_RECEPIENT_SECTION}")
	private String URL_GET_RECEPIENT_SECTION;
	@Value("${URL_GET_CHANNEL_SECTION}")
	private String URL_GET_CHANNEL_SECTION; 
	@Value("${URL_GET_SIGNATURE_SECTION}")
	private String URL_GET_SIGNATURE_SECTION;
	@Value("${URL_GET_XML_VALUES}") 
	private String URL_GET_XML_VALUES;
	@Value("${URL_ADD_TEMPLATE}")
	private String URL_ADD_TEMPLATE;
	@Value("${URL_EDIT_TEMPLATE}")
	private String URL_EDIT_TEMPLATE; 
	@Value("${URL_GET_EMAILPHONE_SECTION}") 
	private String URL_GET_EMAILPHONE_SECTION;
	@Value("${URL_IMPORT_TEMPLATE}") 
	private String URL_IMPORT_TEMPLATE;  
	
	 
	
	@SuppressWarnings("unchecked")  
	@RequestMapping(value = "/getTemplateList", method = RequestMethod.GET)
	public ModelAndView getTemplateList(HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		ModelAndView mav = new ModelAndView("notification/notificationTemplateList");     
			
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
		  
		String exportBizUnit = null;
		if (request.getParameterMap().containsKey("bizUnitForList")) {
			exportBizUnit = request.getParameter("bizUnitForList").trim();
			
		} else {  
			exportBizUnit = "";  
		}  
		 
		try {   
					BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
					
					NotifyTemplate templateVo = new NotifyTemplate(); 
					templateVo.setSearchText(searchTextVal);
					templateVo.setBizunit(exportBizUnit);   
					url = URL_GET_TEMPLATE_LIST + userToken + "/1234";
					br = restTemplate.postForObject(url, templateVo, BaseResponse.class);
					List<NotifyTemplate> templateList = new ArrayList<NotifyTemplate>();
					if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						templateList = br.getResponseListObject();
					 
					/*mav.addObject("templateList", templateList);*/ 
					mav.addObject("templateList", objectMapper.writeValueAsString(templateList)); 
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

	public void deleteTemplateList(HttpServletRequest request,HttpServletResponse response) throws IOException 
	  { 
			
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			String list=request.getParameter("Lists");
			url = URL_DELETE_TEMPLATE + userSession.getUserName()+ "/1234";
			logger.debug("selectedlvalzzzzzzzzzzzzzzzzzzzzzzzzzzzzz:::"+request.getParameter("Lists"));
			   
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("Lists", list);
			uriCB.queryParam("userID", userSession.getUserId());  
		     
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
	
	public void getBizUnitSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException{ 
				
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				url = URL_GET_BIZUNIT_SECTION + userSession.getUserName()+ "/1234"; 
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<NotifyTemplate> bizUnitlist = new ArrayList<NotifyTemplate>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					bizUnitlist= br.getResponseListObject();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					bizUnitlist= br.getResponseListObject();
				
				Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ bizUnitlist, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				PrintWriter out = null;
				out = response.getWriter(); 
				response.setContentType("application/json");
				objectMapper.writeValue(out, bizUnitlist);  
		} 
	 
	public void getSystemSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
				
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				url = URL_GET_SYSTEM_SECTION + userSession.getUserName()+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<NotifyTemplate> systemList = new ArrayList<NotifyTemplate>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					systemList= br.getResponseListObject();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					systemList= br.getResponseListObject();
				  
				Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ systemList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				PrintWriter out = null;
				out = response.getWriter(); 
				response.setContentType("application/json");
				objectMapper.writeValue(out, systemList);  
		}
	
	public void getEventSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
				
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				url = URL_GET_EVENT_SECTION + userSession.getUserName()+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<NotifyTemplate> systemList = new ArrayList<NotifyTemplate>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					systemList= br.getResponseListObject();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					systemList= br.getResponseListObject();
				
				Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ systemList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				PrintWriter out = null;
				out = response.getWriter(); 
				response.setContentType("application/json");
				objectMapper.writeValue(out, systemList);  
		}
	
	public void getNameSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
				String searchNameString = null;
				if(request.getParameter("searchString")!=null)
				{
					searchNameString = request.getParameter("searchString").toString();
				}
				else
				{
					searchNameString = "";  
				}  
				
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				url = URL_GET_NAME_SECTION + userSession.getUserName()+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				 uriCB.queryParam("searchNameString",searchNameString);   
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<NotifyTemplate> nameList = new ArrayList<NotifyTemplate>();  
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					nameList= br.getResponseListObject();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					nameList= br.getResponseListObject();
				 
				Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ nameList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				PrintWriter out = null;
				out = response.getWriter(); 
				response.setContentType("application/json");
				objectMapper.writeValue(out, nameList);  
		}
	  
		public void getEmailSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
				String searchEmailString = null;
				if(request.getParameter("searchString")!=null)
				{
					searchEmailString = request.getParameter("searchString").toString();
				}
				else
				{ 
					searchEmailString = "";  
				}  
				
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				url = URL_GET_EMAIL_SECTION + userSession.getUserName()+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				
				 uriCB.queryParam("searchEmailString",searchEmailString);    
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<NotifyTemplate> emailList = new ArrayList<NotifyTemplate>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					emailList= br.getResponseListObject();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					emailList= br.getResponseListObject(); 
				 
				Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ emailList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				PrintWriter out = null;
				out = response.getWriter(); 
				response.setContentType("application/json");
				objectMapper.writeValue(out, emailList);  
		}   
	        
		
		   
		public void getEmailPhoneSection(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
					
					UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
					url = URL_GET_EMAILPHONE_SECTION+"ramu/1234";
					UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);   
					String channel = request.getParameter("channel");
					 uriCB.queryParam("channel",channel);    
					Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
					br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
					List<NotifyTemplate> nameList = new ArrayList<NotifyTemplate>(); 
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						nameList= br.getResponseListObject();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						nameList= br.getResponseListObject();
					  
					Logger.logEntry(this.getClass(), "SectionList:---"+ nameList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					PrintWriter out = null;  
					out = response.getWriter(); 
					response.setContentType("application/json");
					objectMapper.writeValue(out, nameList);  
			} 
		

		public void getRecepientSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
				  
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				url = URL_GET_RECEPIENT_SECTION + userSession.getUserName()+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<NotifyTemplate> recepientList = new ArrayList<NotifyTemplate>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					recepientList= br.getResponseListObject();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					recepientList= br.getResponseListObject(); 
				 
				Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ recepientList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				PrintWriter out = null;
				out = response.getWriter();  
				response.setContentType("application/json");
				objectMapper.writeValue(out, recepientList);   
		}
		
		public void getChannelSection(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
					
					UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
					url = URL_GET_CHANNEL_SECTION + userSession.getUserName()+ "/1234";
					UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
					Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
					br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
					List<NotifyTemplate> channelList = new ArrayList<NotifyTemplate>();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						channelList= br.getResponseListObject();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						channelList= br.getResponseListObject(); 
					 
					Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ channelList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					PrintWriter out = null;
					out = response.getWriter(); 
					response.setContentType("application/json");
					objectMapper.writeValue(out, channelList);    
			}
		
		public void getSignSection(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
					   
					UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
					url = URL_GET_SIGNATURE_SECTION + userSession.getUserName()+ "/1234";
					UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
					Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
					br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
					List<NotifyTemplate> signatureList = new ArrayList<NotifyTemplate>();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						signatureList= br.getResponseListObject();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						signatureList= br.getResponseListObject(); 
					 
					Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ signatureList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					PrintWriter out = null;
					out = response.getWriter(); 
					response.setContentType("application/json");
					objectMapper.writeValue(out, signatureList);     
			}  
	  
			@SuppressWarnings("unchecked")
			public void getXmlValues(HttpServletRequest request,
			  HttpServletResponse response) {
			
			try {
					 UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
					 logger.debug(userSession.getUserName());
					 url = URL_GET_XML_VALUES +"ramu"+"/1234";
					 UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
					 String list=request.getParameter("Lists");
					 uriCB.queryParam("Lists", list);
					 Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					 BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
					 br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
					 List<NotifyTemplate> list1 = new ArrayList<NotifyTemplate>();
					 if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					  list1= br.getResponseListObject();
					 Logger.logEntry(this.getClass(), "DATA LIST:---"+ list1, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					 PrintWriter out = null; 
					 out = response.getWriter();
					 response.setContentType("application/json");
					 objectMapper.writeValue(out, list1);
			} catch (RestClientException | IOException e) {
				logger.error(e);
			 } 
			}   

			 
			@SuppressWarnings("unchecked")
			public ModelAndView addNotifyTemplate(HttpServletRequest request,
					HttpServletResponse response ,FileUpload fileUpload) throws IOException
				{
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
			  
				
				int partyId      = 	Integer.parseInt(request.getParameter("bizUnit"));
				int notifyTypeId = 	Integer.parseInt(request.getParameter("system"));
				String name 	 = 	request.getParameter("templatename"); 
				String desc		 = 	request.getParameter("desc");
				int notifyEventId=	Integer.parseInt(request.getParameter("event"))	;
				int notifyTargetId= Integer.parseInt(request.getParameter("recepient"));
				int deliveryChannelId = Integer.parseInt(request.getParameter("channel"));
				int useSignId = Integer.parseInt(request.getParameter("signature"));   
				Boolean  isActive = Boolean.parseBoolean((request.getParameter("chkTemp")));
				Boolean isDND = Boolean.parseBoolean(request.getParameter("chkDnd")) ;
				Boolean isDisclamer = Boolean.parseBoolean(request.getParameter("chkDisc")); 
				String from = request.getParameter("searchStringEmailName");    
				String  fromId = request.getParameter("searchString").replaceAll("," ,";");
				String  to = request.getParameter("searchStringTo").replaceAll("," ,";");
				String cc =  request.getParameter("searchString2").replaceAll("," ,";"); 
				String bcc =  request.getParameter("searchString3").replaceAll("," ,";"); 
				String subject = request.getParameter("subject");   
				String body = request.getParameter("hdnAddBodytext");
				String replyto = request.getParameter("searchString1");  
				int userID =  userSession.getUserId(); 
				  
				String templateXML = "<root><from>"+from+"</from><fromId>"+fromId+"</fromId><to>"+to+"</to><cc>"+cc+"</cc><bcc>"+bcc+"</bcc><phone></phone><subject>"+subject+"</subject><body><![CDATA["
						+body +"]]></body><replyTo>"+replyto+"</replyTo></root>";   
				
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
				Notifytemplate.setUserID(userID); 
				 
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
			  
			
			@SuppressWarnings("unchecked")
			public ModelAndView editNotifyTemplate(HttpServletRequest request,
					HttpServletResponse response ,FileUpload fileUpload) throws IOException
				{
					UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
					url = URL_EDIT_TEMPLATE + userSession.getUserName()+ "/1234";
				    
					NotifyTemplate Notifytemplate =  new NotifyTemplate();
					
					int notifyTemplateId = Integer.parseInt(request.getParameter("eventIdEdit")); 
					String editName 	 = 	request.getParameter("editName");
					String editDesc		 = 	request.getParameter("editDesc"); 
					 int editBizUnitID = Integer.parseInt(request.getParameter("editBizUnit"));   
					int editSystemID  = Integer.parseInt(request.getParameter("editSystem"));
					int editRecepientID = Integer.parseInt(request.getParameter("editRecepient")); 
					int editChannelID = Integer.parseInt(request.getParameter("editChannel"));
					int editEventID = Integer.parseInt(request.getParameter("editEvent"));  
					int editSignatureID = Integer.parseInt(request.getParameter("editSignature"));
					String editFrmEmailNm 	 = 	request.getParameter("editFrmEmailNm");
					String  editFrmEmail = request.getParameter("editFrmEmail").replaceAll("," ,";");
					String editReplyTo 	 = 	request.getParameter("editReplyTo");
					String  editTo = request.getParameter("editTo").replaceAll("," ,";");
					String  editCc = request.getParameter("editCc").replaceAll("," ,";");
					String  editBcc = request.getParameter("editBcc").replaceAll("," ,";");
					String editSubject 	 = 	request.getParameter("editSubject");
					String editBodytxt 	 = 	request.getParameter("hdnBodytext");    
					Boolean editIsDND = Boolean.parseBoolean(request.getParameter("editchkDnd")) ; 
					Boolean editIsDisclamer = Boolean.parseBoolean(request.getParameter("editchkDisc"));
					int userID =  userSession.getUserId(); 
					  
					String templateXML = "<root><from>"+editFrmEmailNm+"</from><fromId>"+editFrmEmail+"</fromId><to>"+editTo+"</to><cc>"+editCc+"</cc><bcc>"+editBcc+"</bcc><phone></phone><subject>"+editSubject+"</subject><body><![CDATA["  
							+editBodytxt +"]]></body><replyTo>"+editReplyTo+"</replyTo></root>";  
				       
					                 
					     
					Notifytemplate.setName(editName);     
					Notifytemplate.setDescription(editDesc);  
					Notifytemplate.setNotifyTemplateID(notifyTemplateId);
					Notifytemplate.setPartyID(editBizUnitID);  
					Notifytemplate.setSourceSystemID(editSystemID); 
					Notifytemplate.setEventid(editEventID);
					Notifytemplate.setNotifyTargetID(editRecepientID);
					Notifytemplate.setDeliveryChannelID(editChannelID);
					Notifytemplate.setUseSignatureID(editSignatureID);   
					Notifytemplate.setTemplate(templateXML); 
					Notifytemplate.setisAddDiscl(editIsDisclamer);
					Notifytemplate.setisAddDND(editIsDND);   
					Notifytemplate.setUserID(userID); 
					
					ObjectMapper om = new CustomJacksonObjectMapper();
					String jsonString=om.writeValueAsString(Notifytemplate);
					logger.debug("jsonString:---"+jsonString); 
					Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					List<NotifyTemplate> templateList=new ArrayList<>();
				     
				//if(fileName!=null && basePath!=null && fileName1!=null && basePath1!=null && fileName2!=null && basePath2!=null  && multipartFile!=null  ){  
					if(request.getParameter("hiddenEditIsToClose")!=null && request.getParameter("hiddenEditIsToClose").equals("0"))
					{   
						request.setAttribute("hiddenEditIsToClose","0");  
					 	    
					}else{
						 
						request.setAttribute("hiddenEditIsToClose","");
					}             
					
					Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					       
				    BaseResponse<List<NotifyTemplate>> br = new BaseResponse<List<NotifyTemplate>>();
					   
					   br = restTemplate.postForObject(url, Notifytemplate, BaseResponse.class);  
					       
					   if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))    
						   templateList = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()),List.class);
				//}   
					   
					   //insert code for audit functionality
					   FiinfraUtility.doAudit(userSession.getPartyId(), 
							   userSession.getUserId(), 
							   97114, 
							   FiinfraConstants.SERVICE_PORTAL, 
							   FiinfraConstants.SRP_SOURCE_MODULE_NOTIFYTEMPLATE, 
							   FiinfraConstants.SRP_EDIT_NOTIFYTEMPLATE, 
							   "SP="+FiinfraConstants.SP_EDIT_NOTIFYTEMPLATE+",name="+editName+",description="+editDesc+",notifyEventId="+editEventID+",notifyTargetId="+editRecepientID,
							   "Notify Template : " +editName);   
					                     
				String s = "/";  
				return new ModelAndView("redirect:"+s+"notifytemplate/getTemplateList.htm?isToClose="+request.getParameter("hiddenEditIsToClose")+"");
			} 
			  
			 


			 public void notifytemplateExeclold(HttpServletRequest request, HttpServletResponse response) {
				
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
					
					int idTemplate =Integer.parseInt(request.getParameter("TemplateId")); 
					
					
				      
				  //TODO change hard coding
				  Integer advisorPartyId = userSession.getPartyId(); //6326
				  Integer buId = userSession.getBuId();
				  String token = "153443";
				  
				  BaseResponse<NotifyTemplate> baseResponse = new BaseResponse<NotifyTemplate>();
				  NotifyTemplate templateVo = new NotifyTemplate();
				  templateVo.setSearchText(searchTextVal); 
				  
				  url = URL_GET_TEMPLATE_LIST + userToken + "/1234"; 
				  baseResponse = restTemplate.postForObject(url, templateVo, BaseResponse.class); 
				 
				  List<NotifyTemplate> notifyTemplateAsJson = new ArrayList<NotifyTemplate>();
				  List<NotifyTemplate> notifyTemplateList = new ArrayList<NotifyTemplate>();	 
				  
				  
				  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				   try {
					   notifyTemplateAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
				       
					   for(int i = 0; i<notifyTemplateAsJson.size(); i++){
							//get the actual party object from its LinkedHashMap representation
						   NotifyTemplate notifyTemplateList2;
						   notifyTemplateList2 = objectMapper.readValue(objectMapper.writeValueAsString(notifyTemplateAsJson.get(i)), NotifyTemplate.class);
											
							
						   notifyTemplateList.add(notifyTemplateList2);
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
				  
				  response.addHeader("Content-Disposition", "attachment;filename=NotifyTemplateList.xls");
				         
				   PrintWriter writer = response.getWriter();
				   writer.print(CommonUtils.escape("Biz Unit ").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("System").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Recipient").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Channel").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Event").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Is Active?").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("From").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("FromId").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("to").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("CC").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("BCC").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Phone").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Subject").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("ReplyTo").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Body").toUpperCase());
				   writer.println();  
				         
				   
				   for(NotifyTemplate list:notifyTemplateList){
					   if(list.getNotifyTemplateID()==idTemplate )
					   { 
					   writer.print(CommonUtils.escape(list.getBizunit()));
					    writer.print("\t");
					    writer.print(CommonUtils.escape(list.getSystem()));
					    writer.print("\t");
					    writer.print(CommonUtils.escape(list.getRecepient()));
					    writer.print("\t");
					    writer.print(CommonUtils.escape( list.getChannel()));
					    writer.print("\t");
					    writer.print(CommonUtils.escape( list.getEvent()));
					    writer.print("\t");
					    writer.print(CommonUtils.escape( list.getisActive()==true ? "Active" : "Inactive"));
					    writer.print("\t");
					    String str= list.getTemplate();       
					    String resultFrom =null;  
					    if(str.indexOf("<from>")>=0) 
						resultFrom = str.substring(str.indexOf("<from>") +6, str.indexOf("</from>"));

					    writer.print(CommonUtils.escape( resultFrom));
						 writer.print("\t");
						
						String resultFromId=null;
						if(str.indexOf("<fromId>")>=0)
						 resultFromId = str.substring(str.indexOf("<fromId>") +8, str.indexOf("</fromId>"));
						
						 
						 writer.print(CommonUtils.escape( resultFromId));
						 writer.print("\t");
						 
						String resultTo =null;
						if(str.indexOf("<to>")>0)
						resultTo = str.substring(str.indexOf("<to>") +4, str.indexOf("</to>"));
						
						writer.print(CommonUtils.escape( resultTo));
						writer.print("\t");
						
						String resultcc =null;
						if(str.indexOf("<cc>")>0)
						resultcc = str.substring(str.indexOf("<cc>") +4, str.indexOf("</cc>"));
						
						writer.print(CommonUtils.escape( resultcc));
						writer.print("\t");
						
						String resultBcc = null;
						if(str.indexOf("<bcc>")>0)
						resultBcc = str.substring(str.indexOf("<bcc>") +5, str.indexOf("</bcc>"));
						
						writer.print(CommonUtils.escape( resultBcc));
						writer.print("\t");
						
						String resultphone =null;
						if(str.indexOf("<phone>")>0)
						resultphone = str.substring(str.indexOf("<phone>") +7, str.indexOf("</phone>"));
						
						writer.print(CommonUtils.escape( resultphone));
						writer.print("\t");
						
						String resultSubject = null;
						if(str.indexOf("<subject>")>0)
						resultSubject = str.substring(str.indexOf("<subject>") +9, str.indexOf("</subject>"));
						
						writer.print(CommonUtils.escape( resultSubject));
						writer.print("\t");  
						
						String resultreplyTo = null;
						if(str.indexOf("<replyTo>")>0) 
						resultreplyTo = str.substring(str.indexOf("<replyTo>") +9, str.indexOf("</replyTo>"));
						  
						writer.print(CommonUtils.escape( resultreplyTo));
						writer.print("\t"); 
						
						
						String resultBody = null;
						if(str.indexOf("<body>")>0)  
						resultBody = str.substring(str.indexOf("<body>")+6, str.indexOf("</body>"));
						String resultBodyNew = resultBody;       
						logger.debug("Print 1............"+resultBodyNew.replace("&quot;", ""));  
						String s1="" ; 
						String s = resultBodyNew.replace("&nbsp;", " ").replaceAll("<br>", "").replaceAll("    ", " ").replaceAll("</p>", "");
						s = s.trim();  
					    if (s.startsWith("<![CDATA[")){  
					      s = s.substring(9);
					      int i = s.indexOf("]]>");   
					      if (i == -1) {
					        throw new IllegalStateException( 
					            "argument starts with <![CDATA[ but cannot find pairing ]]&gt;");
					      }  
					      s = s.substring(0, i); 
					       s1= s.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
					       
					      logger.debug("Parsing string 2................"+s); 
					    }     
					     
					    logger.debug("Parsing string  3................"+s1); 
					    writer.print(CommonUtils.escape(s1.trim().replace("\r\n", " "))); 
					        
	 					writer.println();   
				   }
				           
				    }      
				         
				  } catch (IOException e) {
					  logger.error(e);
				  }    
				 }   
 
   
			 public void notifytemplateCSVOld(HttpServletRequest request, HttpServletResponse response) throws ParserConfigurationException, SAXException,SAXParseException {
				 
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
					
					int idTemplate =Integer.parseInt(request.getParameter("TemplateId")) ;
					
			      //TODO change hard coding
				  BaseResponse<NotifyTemplate> baseResponse = new BaseResponse<NotifyTemplate>();
				  NotifyTemplate templateVo = new NotifyTemplate();
				  templateVo.setSearchText(searchTextVal);   
				  //templateVo.setBizunit(listBIzUnit);
				  url = URL_GET_TEMPLATE_LIST + userToken + "/1234"; 
				  baseResponse = restTemplate.postForObject(url, templateVo, BaseResponse.class); 
				 
				  List<NotifyTemplate> notifyTemplateAsJson = new ArrayList<NotifyTemplate>();
				  List<NotifyTemplate> notifyTemplateList = new ArrayList<NotifyTemplate>();
				  
				  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				   try {
					   notifyTemplateAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
				       
					   for(int i = 0; i<notifyTemplateAsJson.size(); i++){
							//get the actual party object from its LinkedHashMap representation
						   NotifyTemplate notifyTemplateList2;
						   notifyTemplateList2 = objectMapper.readValue(objectMapper.writeValueAsString(notifyTemplateAsJson.get(i)), NotifyTemplate.class);
											
							
						   notifyTemplateList.add(notifyTemplateList2);
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
				  
				  
				  
				   response.addHeader("Content-Disposition", "attachment;filename=NotifyTemplateList.csv");
				        
				   PrintWriter writer = response.getWriter();
				   writer.print(CommonUtils.escape("Biz Unit ").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("System").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Recipient").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Channel").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Event").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Is Active?").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("From").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("FromId").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("to").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("CC").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("BCC").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Phone").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Subject").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("ReplyTo").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Body").toUpperCase());
				   writer.println();     
				     
				   //writer.println(); 
				   for(NotifyTemplate list:notifyTemplateList){
					   if(list.getNotifyTemplateID() == idTemplate) 
					   { 
						   writer.print(CommonUtils.escape(list.getBizunit()));
						    writer.print(",");
						    writer.print(CommonUtils.escape(list.getSystem()));
						    writer.print(",");
						    writer.print(CommonUtils.escape(list.getRecepient()));
						    writer.print(",");
						    writer.print(CommonUtils.escape( list.getChannel()));
						    writer.print(",");
						    writer.print(CommonUtils.escape( list.getEvent()));
						    writer.print(",");
						    writer.print(CommonUtils.escape( list.getisActive()==true ? "Active" : "Inactive"));
						    writer.print(","); 
						    String str= list.getTemplate();       
						    String resultFrom =null;  
						    if(str.indexOf("<from>")>=0) 
							resultFrom = str.substring(str.indexOf("<from>") +6, str.indexOf("</from>"));
							
							 writer.print(CommonUtils.escape( resultFrom));
							 writer.print(",");
							
							String resultFromId=null;
							if(str.indexOf("<fromId>")>=0)
							 resultFromId = str.substring(str.indexOf("<fromId>") +8, str.indexOf("</fromId>"));
							 
							 writer.print(CommonUtils.escape( resultFromId));
							 writer.print(",");
							 
							String resultTo =null;
							if(str.indexOf("<to>")>0)
							resultTo = str.substring(str.indexOf("<to>") +4, str.indexOf("</to>"));
							
							writer.print(CommonUtils.escape( resultTo));
							writer.print(",");
							
							String resultcc =null;
							if(str.indexOf("<cc>")>0)
							resultcc = str.substring(str.indexOf("<cc>") +4, str.indexOf("</cc>"));
							
							writer.print(CommonUtils.escape( resultcc));
							writer.print(",");
							
							String resultBcc = null;
							if(str.indexOf("<bcc>")>0)
							resultBcc = str.substring(str.indexOf("<bcc>") +5, str.indexOf("</bcc>"));
							
							writer.print(CommonUtils.escape( resultBcc));
							writer.print(",");
							
							String resultphone =null;
							if(str.indexOf("<phone>")>0)
							resultphone = str.substring(str.indexOf("<phone>") +7, str.indexOf("</phone>"));
							
							writer.print(CommonUtils.escape( resultphone));
							writer.print(",");
							
							String resultSubject = null;
							if(str.indexOf("<subject>")>0)
							resultSubject = str.substring(str.indexOf("<subject>") +9, str.indexOf("</subject>"));
							
							writer.print(CommonUtils.escape( resultSubject));
							writer.print(",");  
							
							String resultreplyTo = null;
							if(str.indexOf("<replyTo>")>0) 
							resultreplyTo = str.substring(str.indexOf("<replyTo>") +9, str.indexOf("</replyTo>"));
							  
							writer.print(CommonUtils.escape( resultreplyTo));
							writer.print(","); 
							
							
							String resultBody = null;
							if(str.indexOf("<body>")>0)  
							resultBody = str.substring(str.indexOf("<body>")+6, str.indexOf("</body>"));
							String resultBodyNew = resultBody;       
							logger.debug("Print 1............"+resultBodyNew.replace("&quot;", ""));  
							String s1="" ; 
							String s = resultBodyNew.replace("&nbsp;", " ").replaceAll("<br>", "").replaceAll("    ", " ").replaceAll("</p>", "").replaceAll("\\&quot;", "").replaceAll("&quot;", "");
							s = s.trim();  
						    if (s.startsWith("<![CDATA[")){  
						      s = s.substring(9);
						      int i = s.indexOf("]]>");   
						      if (i == -1) { 
						        throw new IllegalStateException( 
						            "argument starts with <![CDATA[ but cannot find pairing ]]&gt;");
						      }  
						      s = s.substring(0, i); 
						       s1= s.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
						      
						       logger.debug("Parsing string 2................"+s);  
						    }     
						     
						    logger.debug("Parsing string  3................"+s1); 
						    writer.print(CommonUtils.escape(s1.trim().replace("\r\n", " ")));  
						    writer.println();   
					   }  
				    }    
				       
				  } catch (IOException e) {
					  logger.error(e);   
				  } 
				 }  
  
			 public static String getCharacterDataFromElement(Element e) {
					Node child = e.getFirstChild();
					if (child instanceof CharacterData) {
						CharacterData cd = (CharacterData) child;
						return cd.getData();
					}
					return "";
				}
			 
			 public void notifytemplateCSV(HttpServletRequest request, HttpServletResponse response) throws ParserConfigurationException, SAXException,SAXParseException {
				 
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
					   
					
					
					String listBIzUnit = null;
					
					
					if (request.getParameterMap().containsKey("listBIzUnit")) {
						listBIzUnit = request.getParameter("listBIzUnit").trim();
						
					} else {  
						listBIzUnit = "";  
					}  
					 
					
				     
					String userToken = null;
					if(userSession.getUserName()!=null){
						userToken = userSession.getUserName();
					} 
					else{  
						userToken = "abc";
					} 
					
				  //TODO change hard coding
				  Integer advisorPartyId = userSession.getPartyId(); //6326
				  Integer buId = userSession.getBuId();
				  String token = "153443";   
		
				  BaseResponse<NotifyTemplate> baseResponse = new BaseResponse<NotifyTemplate>();
				  NotifyTemplate templateVo = new NotifyTemplate();
				  templateVo.setSearchText(searchTextVal); 
				  templateVo.setBizunit(listBIzUnit);  
				  url = URL_GET_TEMPLATE_LIST + userToken + "/1234"; 
				  baseResponse = restTemplate.postForObject(url, templateVo, BaseResponse.class); 
				 
				  List<NotifyTemplate> notifyTemplateAsJson = new ArrayList<NotifyTemplate>();
				  List<NotifyTemplate> notifyTemplateList = new ArrayList<NotifyTemplate>();
				  
				  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				   try {
					   notifyTemplateAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
				       
					   for(int i = 0; i<notifyTemplateAsJson.size(); i++){
							//get the actual party object from its LinkedHashMap representation
						   NotifyTemplate notifyTemplateList2;
						   notifyTemplateList2 = objectMapper.readValue(objectMapper.writeValueAsString(notifyTemplateAsJson.get(i)), NotifyTemplate.class);
											
							
						   notifyTemplateList.add(notifyTemplateList2);
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
				  
				  
				  
				   response.addHeader("Content-Disposition", "attachment;filename=NotifyTemplateList.csv");
				        
				   PrintWriter writer = response.getWriter();
				   writer.print(CommonUtils.escape("Biz Unit ").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("System").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Recipient").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Channel").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Event").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Is Active?").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("From").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("FromId").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("to").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("CC").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("BCC").toUpperCase());
				   writer.print(",");
				  /* writer.print(CommonUtils.escape("Phone").toUpperCase());
				   writer.print(",");*/
				   writer.print(CommonUtils.escape("Subject").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("ReplyTo").toUpperCase());
				   writer.print(",");
				   writer.print(CommonUtils.escape("Body").toUpperCase());
				   writer.println();        
				     
				   //writer.println(); 
				   for(NotifyTemplate list:notifyTemplateList){
					   
					     
					   writer.print(CommonUtils.escape(list.getBizunit()));
					    writer.print(",");
					    writer.print(CommonUtils.escape(list.getSystem()));
					    writer.print(",");
					    writer.print(CommonUtils.escape(list.getRecepient()));
					    writer.print(",");
					    writer.print(CommonUtils.escape( list.getChannel()));
					    writer.print(",");
					    writer.print(CommonUtils.escape( list.getEvent()));
					    writer.print(",");
					    writer.print(CommonUtils.escape( list.getisActive()==true ? "Active" : "Inactive"));
					    writer.print(","); 
					    String str= list.getTemplate();       
					    String resultFrom =null;  
					    if(str.indexOf("<from>")>=0) 
						resultFrom = str.substring(str.indexOf("<from>") +6, str.indexOf("</from>"));
						if(resultFrom.contains("0"))
						{
							resultFrom = resultFrom.replace("0", "");
						}  
						 writer.print(CommonUtils.escape( resultFrom));
						 writer.print(",");
						
						String resultFromId=null; 
						if(str.indexOf("<fromId>")>=0)
						 resultFromId = str.substring(str.indexOf("<fromId>") +8, str.indexOf("</fromId>"));
						 
						 writer.print(CommonUtils.escape( resultFromId));
						 writer.print(",");
						  
						String resultTo =null;
						if(str.indexOf("<to>")>0)
						resultTo = str.substring(str.indexOf("<to>") +4, str.indexOf("</to>"));
						
						writer.print(CommonUtils.escape( resultTo));
						writer.print(",");
						
						String resultcc =null;
						if(str.indexOf("<cc>")>0)
						resultcc = str.substring(str.indexOf("<cc>") +4, str.indexOf("</cc>"));
						
						writer.print(CommonUtils.escape( resultcc));
						writer.print(",");
						
						String resultBcc = null;
						if(str.indexOf("<bcc>")>0)
						resultBcc = str.substring(str.indexOf("<bcc>") +5, str.indexOf("</bcc>"));
						
						writer.print(CommonUtils.escape( resultBcc));
						writer.print(",");
						
						/*String resultphone =null;
						if(str.indexOf("<phone>")>0)
						resultphone = str.substring(str.indexOf("<phone>") +7, str.indexOf("</phone>"));
						writer.print(CommonUtils.escape( resultphone));
						writer.print(",");*/
						
						String resultSubject = null;
						if(str.indexOf("<subject>")>0)
						resultSubject = str.substring(str.indexOf("<subject>") +9, str.indexOf("</subject>"));
						
						writer.print(CommonUtils.escape( resultSubject));
						writer.print(",");  
						
						String resultreplyTo = null;
						if(str.indexOf("<replyTo>")>0) 
						resultreplyTo = str.substring(str.indexOf("<replyTo>") +9, str.indexOf("</replyTo>"));
						  
						writer.print(CommonUtils.escape( resultreplyTo));
						writer.print(","); 
						
						
						String resultBody = null;
						if(str.indexOf("<body>")>0)  
						resultBody = str.substring(str.indexOf("<body>")+6, str.indexOf("</body>"));
						String resultBodyNew = resultBody;       
						logger.debug("Print 1............"+resultBodyNew.replace("&quot;", ""));  
						String s1="" ; 
						String s = resultBodyNew.replace("&nbsp;", " ").replaceAll("<br>", "").replaceAll("    ", " ").replaceAll("</p>", "");
						s = s.trim();  
					    if (s.startsWith("<![CDATA[")){  
					      s = s.substring(9);
					      int i = s.indexOf("]]>");   
					      if (i == -1) {
					        throw new IllegalStateException( 
					            "argument starts with <![CDATA[ but cannot find pairing ]]&gt;");
					      }  
					      s = s.substring(0, i); 
					       s1= s.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
					      
					       logger.debug("Parsing string 2................"+s); 
					    }     
					     
					    logger.debug("Parsing string  3................"+s1); 
					    writer.print(CommonUtils.escape(s1.trim().replace("\r\n", " ")));  
					    writer.println();  
					   
				    }     
				       
				  } catch (IOException e) {
					  logger.error(e);
				  }
				 }
   
			
			 
			 public void notifytemplateExecl(HttpServletRequest request, HttpServletResponse response) {
				
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
				      
					String listBIzUnit = null;
					
					
					if (request.getParameterMap().containsKey("listBIzUnit")) {
						listBIzUnit = request.getParameter("listBIzUnit").trim();
						
					} else {  
						listBIzUnit = "";  
					}  
					 
					
					
				  //TODO change hard coding
				  Integer advisorPartyId = userSession.getPartyId(); //6326
				  Integer buId = userSession.getBuId();
				  String token = "153443";
				  
				  BaseResponse<NotifyTemplate> baseResponse = new BaseResponse<NotifyTemplate>();
				  NotifyTemplate templateVo = new NotifyTemplate();
				  templateVo.setSearchText(searchTextVal);  
				  templateVo.setBizunit(listBIzUnit);  
				  url = URL_GET_TEMPLATE_LIST + userToken + "/1234"; 
				  baseResponse = restTemplate.postForObject(url, templateVo, BaseResponse.class); 
				 
				  List<NotifyTemplate> notifyTemplateAsJson = new ArrayList<NotifyTemplate>();
				  List<NotifyTemplate> notifyTemplateList = new ArrayList<NotifyTemplate>();	 
				  
				  
				  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				   try {
					   notifyTemplateAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
				       
					   for(int i = 0; i<notifyTemplateAsJson.size(); i++){
							//get the actual party object from its LinkedHashMap representation
						   NotifyTemplate notifyTemplateList2;
						   notifyTemplateList2 = objectMapper.readValue(objectMapper.writeValueAsString(notifyTemplateAsJson.get(i)), NotifyTemplate.class);
											
							
						   notifyTemplateList.add(notifyTemplateList2);
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
				  
				  response.addHeader("Content-Disposition", "attachment;filename=NotifyTemplateList.xls");
				         
				   PrintWriter writer = response.getWriter();
				  /* writer.print(CommonUtils.escape("Notify TemplateId ").toUpperCase());
				   writer.print("\t");*/
				   writer.print(CommonUtils.escape("Biz Unit ").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("System").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Recipient").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Channel").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Event").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Is Active?").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("From").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("FromId").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("to").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("CC").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("BCC").toUpperCase());
				   writer.print("\t");
				   /*writer.print(CommonUtils.escape("Phone").toUpperCase());
				   writer.print("\t");*/
				   writer.print(CommonUtils.escape("Subject").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("ReplyTo").toUpperCase());
				   writer.print("\t");
				   writer.print(CommonUtils.escape("Body").toUpperCase());
				   writer.println();  
				        
				   
				   for(NotifyTemplate list:notifyTemplateList){
					
					/*writer.print(CommonUtils.escape(list.getNotifyTemplateID()+""));
					writer.print("\t"); */    
					writer.print(CommonUtils.escape(list.getBizunit()));
				    writer.print("\t");
				    writer.print(CommonUtils.escape(list.getSystem()));
				    writer.print("\t");
				    writer.print(CommonUtils.escape(list.getRecepient()));
				    writer.print("\t");
				    writer.print(CommonUtils.escape( list.getChannel()));
				    writer.print("\t");
				    writer.print(CommonUtils.escape( list.getEvent()));
				    writer.print("\t");
				    writer.print(CommonUtils.escape( list.getisActive()==true ? "Active" : "Inactive"));
				    writer.print("\t");
				    String str= list.getTemplate();        
				    String resultFrom =null;  
				    if(str.indexOf("<from>")>=0) 
					resultFrom = str.substring(str.indexOf("<from>") +6, str.indexOf("</from>"));
					
					 writer.print(CommonUtils.escape( resultFrom));
					 writer.print("\t");  
					
					String resultFromId=null;
					if(str.indexOf("<fromId>")>=0)
					 resultFromId = str.substring(str.indexOf("<fromId>") +8, str.indexOf("</fromId>"));
					 
					 writer.print(CommonUtils.escape( resultFromId));
					 writer.print("\t");
					 
					String resultTo =null;
					if(str.indexOf("<to>")>0)
					resultTo = str.substring(str.indexOf("<to>") +4, str.indexOf("</to>"));
					
					writer.print(CommonUtils.escape( resultTo));
					writer.print("\t");
					
					String resultcc =null;
					if(str.indexOf("<cc>")>0)
					resultcc = str.substring(str.indexOf("<cc>") +4, str.indexOf("</cc>"));
					
					writer.print(CommonUtils.escape( resultcc));
					writer.print("\t");
					
					String resultBcc = null;
					if(str.indexOf("<bcc>")>0)
					resultBcc = str.substring(str.indexOf("<bcc>") +5, str.indexOf("</bcc>"));
					
					writer.print(CommonUtils.escape( resultBcc));
					writer.print("\t");
					
					/*String resultphone =null;
					if(str.indexOf("<phone>")>0)
					resultphone = str.substring(str.indexOf("<phone>") +7, str.indexOf("</phone>"));
					
					writer.print(CommonUtils.escape( resultphone));
					writer.print("\t");*/ 
					
					String resultSubject = null;
					if(str.indexOf("<subject>")>0)
					resultSubject = str.substring(str.indexOf("<subject>") +9, str.indexOf("</subject>"));
					
					writer.print(CommonUtils.escape( resultSubject));
					writer.print("\t");  
					
					String resultreplyTo = null;
					if(str.indexOf("<replyTo>")>0) 
					resultreplyTo = str.substring(str.indexOf("<replyTo>") +9, str.indexOf("</replyTo>"));
					  
					writer.print(CommonUtils.escape( resultreplyTo));
					writer.print("\t"); 
					
					
					String resultBody = null;
					if(str.indexOf("<body>")>0)  
					resultBody = str.substring(str.indexOf("<body>")+6, str.indexOf("</body>"));
					String resultBodyNew = resultBody;       
					logger.debug("Print 1............"+resultBodyNew.replace("&quot;", ""));  
					String s1="" ; 
					String s = resultBodyNew.replace("&nbsp;", " ").replaceAll("<br>", "").replaceAll("    ", " ").replaceAll("</p>", "").replaceAll("\\&quot;", "").replaceAll("&quot;", "");
					s = s.trim();   
				    if (s.startsWith("<![CDATA[")){   
				      s = s.substring(9);
				      int i = s.indexOf("]]>");    
				      if (i == -1) {
				        throw new IllegalStateException( 
				            "argument starts with <![CDATA[ but cannot find pairing ]]&gt;");
				      }  
				      s = s.substring(0, i); 
				       s1= s.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
				       
				       logger.debug("Parsing string 2................"+s); 
				    }     
				     
				    logger.debug("Parsing string  3................"+s1); 
				    writer.print(CommonUtils.escape(s1.trim().replace("\r\n", " "))); 
				        
 					writer.println();     
 					 
 					}     
				         
				  } catch (IOException e) {
					  logger.error(e); 
				  }    
				 }  
			 
			 
			 @SuppressWarnings("unchecked")
				@RequestMapping(value = "/importTemplate", method = RequestMethod.GET)
				public ModelAndView importTemplate(HttpServletRequest request,HttpServletResponse response) throws IOException
				{  
					ModelAndView mav = new ModelAndView("notification/importTemplate");  
					return mav;
				} 
			 
			 @SuppressWarnings("unchecked") 
				public ModelAndView importTemplateToDB(HttpServletRequest request,
						HttpServletResponse response ,FileUpload fileUpload) throws IOException
					{
				 	
				 	
				    UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				    url = URL_IMPORT_TEMPLATE + userSession.getUserName()+ "/1234"; 
				    
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
						  
						logger.debug("basepath is:--" + basePath);  
						 baseFolder = new File(basePath);   
						 fileName = null;   
						 extension = null;   
						fileName = originalFileName.substring(0,
								originalFileName.lastIndexOf("."));  
						extension = originalFileName.substring(originalFileName
								.lastIndexOf("."));
						logger.debug("File name is :--" + fileName);
						logger.debug("extension is:--" + extension); 
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
						
						
						try{   
					        FileInputStream input = new FileInputStream(fileToUpload);     
					       
					        POIFSFileSystem fs = new POIFSFileSystem(input);     
					        
					        HSSFWorkbook wb = new HSSFWorkbook(fs);  
					       
					        HSSFSheet sheet = wb.getSheetAt(0); 
					      
					        Row row;    
					        
					        for(int i=1; i<=sheet.getLastRowNum(); i++){
					            row = sheet.getRow(i);
					           
					              
					            int NotifyTemplateID =0 ; 
					            if( row.getCell(0) == null){
					            	NotifyTemplateID = 0;
					            } 
					            else{
					            	NotifyTemplateID = (int) row.getCell(0).getNumericCellValue();  
					            }
					             
					            String PartyID ="";
					            if(row.getCell(1)  == null){
					            	PartyID = "";
					            }
					            else 
					            {
					            	 PartyID = row.getCell(1).getStringCellValue(); 
					            }
					            
					            String NotifyTypeID ="";
					            if(row.getCell(2)  == null){
					            	NotifyTypeID = "";
					            }
					            else
					            {
					            	 NotifyTypeID = row.getCell(2).getStringCellValue();
					            }
					            
					            String NotifyTargetID = "";
					            if(row.getCell(3)  == null){
					            	NotifyTargetID = "";
					            }
					            else{
					            	NotifyTargetID = row.getCell(3).getStringCellValue();
					            }
					            
					             
					            String DeliveryChannelID = "";
					            if(row.getCell(4)  == null){ 
					            	DeliveryChannelID="";
					            }
					            else{
					            	DeliveryChannelID = row.getCell(4).getStringCellValue();
					            }
					            
					            String NotifyEventID = "";
					            if(row.getCell(5) == null){
					            	NotifyEventID="";
					            }
					            else{
					            	NotifyEventID = row.getCell(5).getStringCellValue();
					            }
					            
					            String IsActive = ""; 
					            if(row.getCell(6) == null){
					            
					            	IsActive=""; 
					            } 
					            else{
					            	
					            	IsActive = row.getCell(6).getStringCellValue();
					            }
					            
					           
					              
					            String FromTemplateXML = "";
					            if(row.getCell(7) == null  ){  
					            	FromTemplateXML = ""; 
					            } 
					            else     
					            {
					            	FromTemplateXML = row.getCell(7).getStringCellValue();
					            }
					            
					            String FromIDTemplateXML = "";
					            if(row.getCell(8) == null){
					            	FromIDTemplateXML="";
					            }
					            else{
					            	FromIDTemplateXML = row.getCell(8).getStringCellValue();
					            } 
					            
					            String ToTemplateXML = "";
					            if( row.getCell(9) ==  null ){ 
					            	ToTemplateXML = "";
					            	
					            } 
					            else {
					            	ToTemplateXML = row.getCell(9).getStringCellValue(); 
					            } 
					            
					            String CCTemplateXML = "";
					            if( row.getCell(10) ==  null){ 
					            	CCTemplateXML="";
					            }
					            else{
					            	CCTemplateXML = row.getCell(10).getStringCellValue();
					            }
					            
					            String BCCTemplateXML = "";
					            if( row.getCell(11) ==  null || row.getCell(11).equals(0)){ 
					            	BCCTemplateXML=""; 
					            } 
					            else{
					            	BCCTemplateXML = row.getCell(11).getStringCellValue(); 
					            }  
					               
					            String PhoneTemplateXML =  "";
					            if( row.getCell(12) ==  null){ 
					            	PhoneTemplateXML="";
					            }
					            else{
					            	PhoneTemplateXML = row.getCell(12).getStringCellValue();
					            } 
					            
					            String SubjectTemplateXML = "";
					            if( row.getCell(13) ==  null){ 
					            	SubjectTemplateXML="";
					            }
					            else{
					            	SubjectTemplateXML = row.getCell(13).getStringCellValue();
					            }
					            
					            String ReplyToTemplateXML =  "";
					            if( row.getCell(14) ==  null){ 
					            	ReplyToTemplateXML="";
					            }
					            else{
					            	ReplyToTemplateXML = row.getCell(14).getStringCellValue();
					            }
					            
					            String BodyTemplateXML = "";
					            if( row.getCell(15) ==  null){ 
					            	BodyTemplateXML="";
					            } 
					            else{
					            	BodyTemplateXML = row.getCell(15).getStringCellValue();
					            } 
					             
					           String NotifyTemplateXML ="<root><from>"+FromTemplateXML+"</from><fromId>"
					            							+FromIDTemplateXML+"</fromId><to>"
					            							+ToTemplateXML+"</to><cc>"
					            							+CCTemplateXML+"</cc><bcc>"
					            							+BCCTemplateXML+"</bcc><phone>"
					            							+PhoneTemplateXML+"</phone><subject>"
					            							+SubjectTemplateXML+"</subject><body><![CDATA["
					            							+BodyTemplateXML +"]]></body><replyTo>"
					            							+ReplyToTemplateXML+"</replyTo></root>";         
					            																   
					           logger.debug("Template  output ....."+NotifyTemplateID+PartyID+NotifyTypeID+NotifyTargetID+DeliveryChannelID+NotifyEventID+IsActive+NotifyTemplateXML);
					           
					           Notifytemplate.setTemplate(NotifyTemplateXML);  
					           Notifytemplate.setNotifyTemplateID(NotifyTemplateID);
					           
					           ObjectMapper om = new CustomJacksonObjectMapper();
							   String jsonString=om.writeValueAsString(Notifytemplate);
							   logger.debug("jsonString:---"+jsonString); 
							   Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
							   List<NotifyTemplate> templateList=new ArrayList<>(); 
					           
							   Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
						       
							    BaseResponse<List<NotifyTemplate>> br = new BaseResponse<List<NotifyTemplate>>();
								logger.debug("In template .....");  
								br = restTemplate.postForObject(url, Notifytemplate, BaseResponse.class);  
								         
								if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))    
								templateList = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()),List.class);
							
					            //System.out.println("Import rows........ "+i);  
					        }
					          
					        input.close(); 
					        //System.out.println("Success import excel ....................................");  
					      
					        
					       }catch(IOException ioe){ 
					    	   logger.error(ioe);
					    }    
						
						}else{ 
							logger.debug("Size  should be less than 10000000 bytes and greater than 0.");
						}   
					 }
					  } catch (Exception e) {   
						
						logger.error(e);  
						
					}        
					    
					String s = "/";  
					return new ModelAndView("redirect:"+s+"notifytemplate/importTemplate.htm");     
					 
				}   
			 
}
