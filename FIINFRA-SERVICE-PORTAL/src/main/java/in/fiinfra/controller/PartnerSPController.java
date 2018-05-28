package in.fiinfra.controller;
 

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.client.ClientData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.PartyData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.FileUpload;
import in.fiinfra.common.service.vo.LoginHistory;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.GridData;
import in.fiinfra.common.util.Logger;
import in.fiinfra.common.util.MD5Encryption;
import in.fiinfra.common.util.RandomPasswordGenerator;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.PutMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.internal.FileHelper;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;


public class PartnerSPController extends MultiActionController{

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(PartnerSPController.class);
	String url;
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	static Properties properties =null;
	static String APP_ID_MAIL_BOX = null;
	static String SECRET_KEY_MAIL_BOX = null;
	static String SHUBHCHINTAK_USER_MITHI_PASSWORD = null;
	static String DFDAONLINE_USER_MITHI_PASSWORD = null;
	static String FIINFRA_USER_MITHI_PASSWORD = null;
	static String MITHI_SERVER = null;
	static String SHUBHCHINTAK_DOMAIN=null;
	static String DFDAONLINE_DOMAIN=null;
	static String MITHI_ERROR_MESSAGE=null;
	static String MITHI_AUTH_FAILED=null;
	static String MITHI_EMAIL_CREATION_FAILED_DOMAIN=null;
	static String SPA_DOMAIN=null;	
	static String SPA_USER_MITHI_PASSWORD=null;	
	static String SHUBHCHINTAKBUID=null;	
	static String SPABUID=null;	
	static String DFDABUID=null;	
	static String FIINFRABUID=null;	
	static String ADD_TASK=null;	
	static String EDIT_TASK=null;	
	

	static{
	try {
		Properties properties = new Properties();
		InputStream stream = FileHelper.class.getClassLoader()
				.getResourceAsStream("ApplicationResources.properties");
		properties.load(stream);
		APP_ID_MAIL_BOX=properties.getProperty("APP_ID_MAIL_BOX");
		SECRET_KEY_MAIL_BOX=properties.getProperty("SECRET_KEY_MAIL_BOX");
		
		SHUBHCHINTAK_USER_MITHI_PASSWORD=properties.getProperty("SHUBHCHINTAK_USER_MITHI_PASSWORD");
		DFDAONLINE_USER_MITHI_PASSWORD=properties.getProperty("DFDAONLINE_USER_MITHI_PASSWORD");
		FIINFRA_USER_MITHI_PASSWORD=properties.getProperty("FIINFRA_USER_MITHI_PASSWORD");
		MITHI_SERVER=properties.getProperty("MITHI_SERVER");
		
		SHUBHCHINTAK_DOMAIN=properties.getProperty("SHUBHCHINTAK_DOMAIN");
		DFDAONLINE_DOMAIN=properties.getProperty("DFDAONLINE_DOMAIN");
		MITHI_ERROR_MESSAGE=properties.getProperty("MITHI_ERROR_MESSAGE");
		MITHI_AUTH_FAILED=properties.getProperty("MITHI_AUTH_FAILED");
		MITHI_EMAIL_CREATION_FAILED_DOMAIN=properties.getProperty("MITHI_EMAIL_CREATION_FAILED_DOMAIN");
		SPA_DOMAIN=properties.getProperty("SPA_DOMAIN");
		SPA_USER_MITHI_PASSWORD=properties.getProperty("SPA_USER_MITHI_PASSWORD");
		
		SHUBHCHINTAKBUID=properties.getProperty("SHUBHCHINTAKBUID");
		SPABUID=properties.getProperty("SPABUID");
		DFDABUID=properties.getProperty("DFDABUID");
		FIINFRABUID=properties.getProperty("FIINFRABUID");
		
		ADD_TASK=properties.getProperty("ADD_NEW_TASK_SP");
		EDIT_TASK=properties.getProperty("EDIT_TASK_SP");
		// 
		
	} catch (Exception e) {
	}
	}

	public ObjectMapper getObjectMapper() 
	{
		logger.info(objectMapper);
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
	public RestTemplate getRestTemplate() {
		return restTemplate;
	}
	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

	@Value("${URL_GET_PARTNER_LIST}")
	private String URL_GET_PARTNER_LIST;
	
	@Value("${URL_ADD_PARTNER}")
	private String URL_ADD_PARTNER;
	
	@Value("${URL_EDIT_PARTNER}")
	private String URL_EDIT_PARTNER;
	
	@Value("${URL_ASSIGN_COMMUNICATION_EMAIL_PARTNER}")
	private String URL_ASSIGN_COMMUNICATION_EMAIL_PARTNER;
	
	@Value("${URL_ADD_STA_FOR_PARTNER}")
	private String URL_ADD_STA_FOR_PARTNER;
	
	@Value("${URL_ADD_BULK_STA_FOR_PARTNER}")
	private String URL_ADD_BULK_STA_FOR_PARTNER;
				
	@Value("${URL_GET_PST_PKT_POT_NAMES}")
	private String URL_GET_PST_PKT_POT_NAMES;
	
	@Value("${URL_GET_SEARCH_PST_PKT_POT}")
	private String URL_GET_SEARCH_PST_PKT_POT;
	
	@Value("${URL_DELETE_PARTNER}")
	private String URL_DELETE_PARTNER;
	
	@Value("${URL_GET_LOCATION}")
	private String URL_GET_LOCATION;
	
	@Value("${URL_SHOW_TOP_PARTNER_LIST}")
	private String URL_SHOW_TOP_PARTNER_LIST;
	
	@Value("${URL_GET_LOGIN_NAME}")
	private String URL_GET_LOGIN_NAME;
	
	@Value("${URL_GET_UNIQUE_ARN}")
	private String URL_GET_UNIQUE_ARN;
	
	@Value("${URL_GET_UNIQUE_COMMUNICATION_EMAIL}")
	private String URL_GET_UNIQUE_COMMUNICATION_EMAIL;
	
	@Value("${URL_INSERT_BULK_PARTNER}")
	private String URL_INSERT_BULK_PARTNER;
	
	
	@Value("${URL_GET_ALLOCATED_TEAMMEMBER_LIST}")
	private String URL_GET_ALLOCATED_TEAMMEMBER_LIST;
	
	
	@Value("${URL_GET_TASK_RECORD}")
	private String URL_GET_TASK_RECORD;
	
	@Value("${URL_INSERT_Task}")
	private String URL_INSERT_Task;
	
	@Value("${URL_GET_TASK_LIST}")
	private String URL_GET_TASK_LIST;
	
	@Value("${URL_DELETE_Task_SP}")
	private String URL_DELETE_Task_SP;
	
	@Value("${URL_GET_USER_LIST}")
	private String URL_GET_USER_LIST;
	
	@Value("${URL_GET_LOGIN_HISTORY}")
	private String URL_GET_LOGIN_HISTORY;
	
	@Value("${URL_SEND_WELCOME_MAIL}")
	private String URL_SEND_WELCOME_MAIL;
	
	@Value("${URL_GET_TASK_LIST_ASSIGN}")
	private String URL_GET_TASK_LIST_ASSIGN;
		
	@Value("${URL_GET_TASK_PARTNER_LIST}")
	private String URL_GET_TASK_PARTNER_LIST;
	
	
	@Value("${URL_GET_TASK_DETAIL}")
	private String URL_GET_TASK_DETAIL;
	
	
	@Value("${URL_GET_MOVE_PARTNER}")
	private String URL_GET_MOVE_PARTNER;
	
	@Value("${URL_GET_PARTNER_LIST_FOR_CHANGE}")
	private String URL_GET_PARTNER_LIST_FOR_CHANGE;
	
	@Value("${URL_PARTNER_OF_CLIENT_OR_OPPORTUNITY}")
	private String URL_PARTNER_OF_CLIENT_OR_OPPORTUNITY;
	
	@Value("${URL_GET_TASK_LIST_SP}")
	private String URL_GET_TASK_LIST_SP;

	@Value("${URL_GET_ONBOARD_CHECKLIST}")
	private String URL_GET_ONBOARD_CHECKLIST;
	

	@Value("${URL_GET_TASK_ALERT}")
	private String URL_GET_TASK_ALERT;
	
	@Value("${URL_GET_TASK_ALERT_ONE_DAY}")
	private String URL_GET_TASK_ALERT_ONE_DAY;
	
	
	@Value("${URL_SAVE_LEGENDS_CHECKLIST}")
	private String URL_SAVE_LEGENDS_CHECKLIST;
	

	@Value("${URL_GET_LEGENDS_CHECKLIST}")
	private String URL_GET_LEGENDS_CHECKLIST;
	

	@Value("${URL_SAVE_ONBOARD_CHECKLIST}")
	private String URL_SAVE_ONBOARD_CHECKLIST;
	
/*URL_GET_LEGENDS_CHECKLIST
	@Autowired
	Md5PasswordEncoder passwordEncoder;*/
	
	
	



	
	
	
	private List<Partner> lstSuccessPartner;
	private List<Partner> lstFailedPartner;
	private List<Partner> lstExistingPartner;
	private List<Partner> lstMithiFailedContactEmails;
	

	
	Partner partner = new Partner();
	Map<Integer,String> passwordMap=new HashMap<>();
	/*List<String> hexStringz = new ArrayList<>();*/
	Map<String,String> hexStringzz=new HashMap<>();
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadPartner", method = RequestMethod.GET)
	public ModelAndView loadPartner(HttpServletRequest request,HttpServletResponse response) {
		logger.info("in loadpartner PartnerSPController");
	
		    UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		    ModelAndView mav = new ModelAndView("partner/PartnerList");
		    logger.info(userSession.getUserName());
			
			String userToken = null;
			if(userSession.getUserName()!=null){
				userToken = userSession.getUserName();
			}
			else{
				userToken = "abc";
			}
			
			String pagesize = request.getParameter("pageSize");
			if (pagesize == null) {
				pagesize = "100";
			}
			
			String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal = "";
			}
		    
		    
			try {
				int buid = userSession.getBuId();
				int userid = userSession.getPartyId();
				
				BaseResponse<Partner> br = new BaseResponse<Partner>();
				Partner partnerVo = new Partner();
				partnerVo.setBuId(buid+"");   
				partnerVo.setUserId(userid+""); 
				partnerVo.setSearchText(searchTextVal);
				
				partnerVo.setNodeId(userSession.getCurrentNodeId());
				
				url = URL_GET_PARTNER_LIST + userToken + "/1234";
				br = restTemplate.postForObject(url, partnerVo, BaseResponse.class);
				//List<Partner> partnerList = new ArrayList<Partner>();
				List<Partner> partnerList = null;
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
					partnerList = br.getResponseListObject();
					/*partnerList = objectMapper.readValue(
							objectMapper.writeValueAsString(br.getResponseListObject()),
							Partner[].class);*/
					
				}
				/*if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					partnerList = br.getResponseListObject();*/
				mav.addObject("partnerData", objectMapper.writeValueAsString(partnerList));
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
	public void addPartner(HttpServletRequest request,HttpServletResponse response){
	logger.info("in addPartner PartnerSPController");
	
	int iRetCode=0;
	int recordCount=0;
	String szResponse="";
	String [] szResponsez;
	String szResponsezz = "";
	String szResponsezx = "";
	final String ZERO ="0";
	final String ONE ="1";

	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	logger.info(userSession.getUserName());
	

		String buid = request.getParameter("hdnbuId");
		String communicationEmailId = request.getParameter("communicationEmailId");
		
		String contactEmail = request.getParameter("contactEmail");
		
		
	
	url = URL_ADD_PARTNER +"ramu"+"/1234";
	
	
	PrintWriter out=null ;
	final String OBJECT_STRING;
	try {
		/*if(szResponse.equals(ZERO)){*/
			
		Partner partner=new Partner();
		partner.setFirstName(request.getParameter("firstName"));
		partner.setLastName(request.getParameter("lastName"));

		partner.setCompanyName(request.getParameter("companyName"));
		partner.setContactEmail(request.getParameter("contactEmail"));
		partner.setContactMobile(request.getParameter("contactMobile"));
		partner.setArn(request.getParameter("ARN"));
		partner.setEuin(request.getParameter("euin"));
		partner.setState(request.getParameter("state"));
		partner.setLocation(request.getParameter("location"));
		partner.setPstTeamMemberId(request.getParameter("pst"));
		partner.setPktTeamMemberId(request.getParameter("pkt"));
		partner.setPotTeamMemberId(request.getParameter("pot"));
		partner.setRmTeamMemberId(request.getParameter("rm"));
		partner.setRmHeadTeamMemberId(request.getParameter("rmHead"));
		partner.setLoginName(request.getParameter("loginname"));
		partner.setBuId(request.getParameter("hdnbuId"));
		partner.setUserId(request.getParameter("hdnuserId"));
		partner.setCommunicationEmailId(request.getParameter("communicationEmailId"));
		
		
		
			OBJECT_STRING = FiinfraConstants.SP_ADD_PARTNER + ","
					+ request.getParameter("firstName") + ","
					+ request.getParameter("lastName") + ","
					+ request.getParameter("companyName") + ","
					+ request.getParameter("contactEmail") + ","
					+ request.getParameter("contactMobile") + ","
					+ request.getParameter("ARN") + ","
					+ request.getParameter("pst") + ","
					+ request.getParameter("pkt") + ","
					+ request.getParameter("pot") + ","
					+ request.getParameter("rm") + ","
					+ request.getParameter("rmHead") + ","
					+ request.getParameter("hdnbuId") + ","
					+ request.getParameter("hdnuserId") + ","
					+ request.getParameter("euin") + ","
					+ request.getParameter("state") + ","
					+ request.getParameter("location") + ","
					+ request.getParameter("loginname") + ","
					+ request.getParameter("communicationEmailId") ;
				
		@SuppressWarnings("unused")
		String userDataXML="<Root>";
		int noOfCAPSAlpha = 1;
		int noOfDigits = 1;
		int noOfSplChars = 1;
		int minLen = 8;
		int maxLen = 15;
		Map<Integer,String> passwordMap=new HashMap<>();
		//for(String partyId:partyIdArray){

			String hexString = null;
			String encryptrdPassword = null;
			String plainString = null;

			
		try {
				char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
						noOfCAPSAlpha, noOfDigits, noOfSplChars);

				hexString = new String(pswd);
				logger.info("hexString is-----" + hexString);
			//	MD5Encryption md5Encryption = new MD5Encryption();
			//	 encryptrdPassword = md5Encryption.encrypt(hexString);

				plainString = new String(pswd);
				logger.info("hexString is-----" + plainString);
				MD5Encryption md5Encryption = new MD5Encryption();
				 encryptrdPassword = md5Encryption.encrypt(plainString);
				 //encryptrdPassword = passwordEncoder.encodePassword(plainString, null);
				
				userDataXML+="<User>";
				userDataXML+="<userPassword>"+encryptrdPassword+"</userPassword>";
				//userDataXML+="<partyid>"+partyId+"</partyid>";
				//userDataXML+="<RoleId>"+roleId+"</RoleId>";
				userDataXML+="</User>";
				
							
			//passwordMap.put(Integer.valueOf(partyId), hexString);
			//}
			userDataXML+="</Root>";
			partner.seteNCPassword(encryptrdPassword);
			
			
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<>();
			br = restTemplate.postForObject(url, partner, BaseResponse.class);
			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
							if(br.getResponseObject()!=null){recordCount = br.getResponseObject();}
			
			
			out = response.getWriter();
			response.setContentType("application/json");
			} catch (RestClientException e1) {
				e1.printStackTrace();
			}
		String strRecordCount = recordCount+"";
		
		
		if(strRecordCount.equals(ONE)){}else{
		try {
			passwordMap.put(recordCount, plainString);
			Notification notification=null;
			for(Map.Entry<Integer,String> map:passwordMap.entrySet()){
				Map<String,String> payloadMap=new HashMap<String, String>();
				payloadMap.put("Password",map.getValue());
				
				if(communicationEmailId.contains("shubhchintak")){				
					payloadMap.put("CommEmailPassword",SHUBHCHINTAK_USER_MITHI_PASSWORD);}
				else if(communicationEmailId.contains("spacaptial")){				
					payloadMap.put("CommEmailPassword",SPA_USER_MITHI_PASSWORD);}
				else if(communicationEmailId.contains("dfdaonline")){				
					payloadMap.put("CommEmailPassword",DFDAONLINE_USER_MITHI_PASSWORD);}
				
				logger.info("Notification started 1.1 -----");
			
				
				notification=new Notification();
				notification.setSourceSystemID(31003); // need to add in finfra coinstants
				logger.info("SourceSystemID is-----" + notification.getSourceSystemID());
				notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
				logger.info("NotifyTypeId is-----" + notification.getNotifyTypeId());
				notification.setNotifyUserID(Integer.parseInt(request.getParameter("hdnuserId")));
				logger.info("NotifyUserID is-----" + notification.getNotifyUserID());
				notification.setNotifyPartyID(map.getKey());
				logger.info("NotifyPartyID is-----" + notification.getNotifyPartyID());
			    notification.setNotifyEventID(172);   // need to add a param for new admin portal add partner
			    logger.info("NotifyEventID is-----" + notification.getNotifyEventID());
				//notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
				notification.setBuId(Integer.parseInt(request.getParameter("hdnbuId")));
			    logger.info("BuId is-----" + notification.getBuId());
				notification.setPayloadMap(payloadMap);
				 logger.info("PayloadMap is-----" + notification.getPayloadMap());
				notification.setSessionID(request.getSession().getId());
				 logger.info("SessionID is-----" + notification.getSessionID());
				FrameworkUtil.notify(notification);
				logger.info("Notification ended 1.2 -----");
			 }
		   }catch (NumberFormatException e) {
			e.printStackTrace();
		   }	
		/*
		if(buid.equals("27827")){
			communicationEmailId+="@"+SHUBHCHINTAK_DOMAIN;
		}
		if(buid.equals("27828")){
			communicationEmailId=contactEmail;
		}
		if(buid.equals("27829")){
			communicationEmailId+="@"+SHUBHCHINTAK_DOMAIN;
		}
		if(buid.equals("27830") || buid.equals("109612")){
			// 27830
			communicationEmailId+="@"+DFDAONLINE_DOMAIN;
		}
		*/
		String [] domain = communicationEmailId.split("@");
		System.out.println("domain"+domain);
		
		System.out.println("communicationEmailId"+communicationEmailId);
		
		System.out.println("SHUBHCHINTAK_DOMAIN"+SHUBHCHINTAK_DOMAIN);
	try {
		// Domain name
		String szDomain=domain[1];
		String userPassword=null;
			if (szDomain.equalsIgnoreCase(SHUBHCHINTAK_DOMAIN)) {
				userPassword=SHUBHCHINTAK_USER_MITHI_PASSWORD;
			}
			if (communicationEmailId.equalsIgnoreCase(contactEmail)) {
				userPassword=FIINFRA_USER_MITHI_PASSWORD;
			}
			if (szDomain.equalsIgnoreCase(DFDAONLINE_DOMAIN)) {
				userPassword=DFDAONLINE_USER_MITHI_PASSWORD;
			}
			if (szDomain.equalsIgnoreCase(SPA_DOMAIN)) {
				userPassword=SPA_USER_MITHI_PASSWORD;
			}
			
		// Server ip 
		String szServer = MITHI_SERVER;
		// Payload to add user
		String szPostMethodPayLoad=null;
		if(communicationEmailId!=null && userPassword!=null){
		   String[] splitedCommunEmailId = communicationEmailId.split("@");
		   szPostMethodPayLoad=" {'username': '"+splitedCommunEmailId[0]+"', 'password': '"+userPassword+"', 'usercos': 'allpopusers' }"; 
		}
		if(szPostMethodPayLoad!=null){
		// create request entity object
		RequestEntity requestEntity = new StringRequestEntity(szPostMethodPayLoad, "application/json", "UTF-8");
		// e.g. http://localhost/connectxf.ws/domain/mykotaklife.com/user
		PostMethod post = new PostMethod(szServer + "/connectxf.ws/domain/" + szDomain + "/user");

		logger.info("PostMethod URL:::"+szServer + "/connectxf.ws/domain/" + szDomain + "/user");
		logger.info("PostMethod Payload:::"+szPostMethodPayLoad);
		// adding payload to post method object
		post.setRequestEntity(requestEntity);
		// add request headers viz. appkey and secretkey for authorization
		post.addRequestHeader("appkey", APP_ID_MAIL_BOX);
		post.addRequestHeader("secretkey", SECRET_KEY_MAIL_BOX);
		
		logger.info("appkey:::"+APP_ID_MAIL_BOX);
		logger.info("secretkey:::"+SECRET_KEY_MAIL_BOX);
		
		// creating httpclient
		HttpClient httpclient = new HttpClient();
		// calling add contact webservice
		// you will get http 401 Status code, if authorization failed

		iRetCode = httpclient.executeMethod(post);
		logger.info("iRetCode is-----" + iRetCode);
		// get response as string
		try {
			szResponse = post.getResponseBodyAsString();
			logger.info("szResponse is-----" + szResponse);
			szResponse=szResponse.replaceAll("\"", "");
			szResponsezz=szResponse;
			szResponsezx=szResponse;
			if(szResponse.contains("returncode:")){
			szResponse=szResponse.split("returncode:")[1].split("}")[0];
			if(szResponse.contains(ONE)){
				szResponse=ONE;
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		
		String szUser = "" ;
		String alternateemail=contactEmail;
		
		try {
			if(communicationEmailId!=null && userPassword!=null){
				   String[] splitedCommunEmailId = communicationEmailId.split("@");
				   szUser=splitedCommunEmailId[0];
				   szPostMethodPayLoad=" {'alternateemailaddress':'"+alternateemail+"'}"; 
				}
			if(szPostMethodPayLoad!=null){
				// create request entity object
				RequestEntity requestEntity = new StringRequestEntity(szPostMethodPayLoad, "application/json", "UTF-8");
				// e.g. http://localhost/connectxf.ws/domain/mykotaklife.com/user
				PutMethod put = new PutMethod(szServer + "/connectxf.ws/domain/" + szDomain + "/user/"+szUser);
		
				logger.info("PutMethod URL:::"+szServer + "/connectxf.ws/domain/" + szDomain + "/user/"+szUser);
				logger.info("PutMethod Payload:::"+szPostMethodPayLoad);
				// adding payload to post method object
				put.setRequestEntity(requestEntity);
				// add request headers viz. appkey and secretkey for authorization
				put.addRequestHeader("appkey", APP_ID_MAIL_BOX);
				put.addRequestHeader("secretkey", SECRET_KEY_MAIL_BOX);
				
				logger.info("alternate email  appkey:::"+APP_ID_MAIL_BOX);
				logger.info("alternate email secretkey:::"+SECRET_KEY_MAIL_BOX);
				
				// creating httpclient
				HttpClient httpclient = new HttpClient();
				// calling add contact webservice
				// you will get http 401 Status code, if authorization failed

				iRetCode = httpclient.executeMethod(put);
				logger.info("alternate email  iRetCode is-----" + iRetCode);
				// get response as string
				szResponse = put.getResponseBodyAsString();
				logger.info("alternate email szResponse is-----" + szResponse);
				szResponse=szResponse.replaceAll("\"", "");
				szResponsezz=szResponse;
				szResponsezx=szResponse;
				if(szResponse.contains("returncode:")){
				szResponse=szResponse.split("returncode:")[1].split("}")[0];
				if(szResponse.contains(ONE)){
					szResponse=ONE;
				}
				}
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	   }catch (Exception e) {e.printStackTrace();}
		}
	
			try {
				try {
					szResponsez = szResponsezz.split("</u>");
					szResponsezz = szResponsez[1].split("<u>")[1];
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (szResponse.equals(ONE)) {
					// szResponse=szResponsezx.replaceAll("\'", "");
					szResponsezx = szResponsezx.split("cause:")[1].split(",operationmsg")[0].split("See usage")[0];
				}
				out = response.getWriter();
				response.setContentType("application/json");
			}catch (Exception e1) {
				e1.printStackTrace();
			}
			/*}*/
		
	    /*	--------------------------------------------------------------------------------------------------------- */
				try {
					FiinfraUtility.doAudit(recordCount,userSession.getUserId(), FiinfraConstants.EVENT_NEW_PARNER_SRP, FiinfraConstants.SERVICE_PORTAL, FiinfraConstants.SRP_SOURCE_MODULE_PARTNER, FiinfraConstants.SRP_ADD_EDIT_PARTNER,"SP="+FiinfraConstants.SP_ADD_PARTNER,OBJECT_STRING);
				} catch (Exception e) {
					e.printStackTrace();
				}
		/*	--------------------------------------------------------------------------------------------------------- */
		
		logger.info("szResponse:::::::"+szResponse); 
		try {
			if(szResponse.equals(ONE)){
			     objectMapper.writeValue(out, recordCount+"~"+szResponsezx);
			     logger.info("szResponse.equals(ONE)::::"+recordCount+"~"+szResponsezx);
			}
			if(iRetCode!=200){
				 objectMapper.writeValue(out, recordCount+"~"+szResponsezz);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(szResponse.equals(ZERO)){
			 objectMapper.writeValue(out, recordCount+"~0");
			 logger.info("szResponse.equals(ZERO)::::"+recordCount+"~0");
		}
		 
	} catch (IOException e) {
		e.printStackTrace();
	}     	 
}
	
	
	@SuppressWarnings("unchecked")
	public void getPSTPKTPOTNames(HttpServletRequest request,
			HttpServletResponse response) {
		
		    logger.info("in getPSTPKTPOTNames");
			try {
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				logger.info(userSession.getUserName());
				url = URL_GET_PST_PKT_POT_NAMES +"ramu"+"/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				uriCB.queryParam("buId", request.getParameter("buId"));
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<Partner> br = new BaseResponse<Partner>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<Partner> list = new ArrayList<Partner>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					list= br.getResponseListObject();
				Logger.logEntry(this.getClass(), "DATA LIST:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, list);
			} catch (RestClientException | IOException e) {
				e.printStackTrace();
			}
	  }
	
	
	@SuppressWarnings("unchecked")
	public void searchPSTPKTPOT(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("\n searchPSTPKTPOT  PartnerSPController ");
				
		try {
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			logger.info(userSession.getUserName());
			url = URL_GET_SEARCH_PST_PKT_POT +"ramu"+"/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("buId", request.getParameter("buId"));
			uriCB.queryParam("deptTypeId", request.getParameter("deptTypeId"));
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Partner> br = new BaseResponse<Partner>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<Partner> list = new ArrayList<Partner>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				list= br.getResponseListObject();
			Logger.logEntry(this.getClass(), "DATA LIST:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, list);
		} catch (RestClientException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public void addSTAforPartner(HttpServletRequest request,HttpServletResponse response){

		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info(userSession.getUserName());
		url = URL_ADD_STA_FOR_PARTNER +"ramu"+"/1234";
		
		PrintWriter out=null ;  
		final String OBJECT_STRING;
		try {
			
			Partner partner=new Partner();
			partner.setPstTeamMemberId(request.getParameter("pst"));
			partner.setPktTeamMemberId(request.getParameter("pkt"));
			partner.setPotTeamMemberId(request.getParameter("pot"));
			partner.setRmTeamMemberId(request.getParameter("rm"));
			partner.setRmHeadTeamMemberId(request.getParameter("rmHead"));
			int partnerspartyid = Integer.parseInt(request.getParameter("partnerspartyid"));
			partner.setPartyID(partnerspartyid);
			
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<>();
			br = restTemplate.postForObject(url, partner, BaseResponse.class);
			int recordCount=0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				if(br.getResponseObject()!=null){
				recordCount = br.getResponseObject();
				}
			out = response.getWriter();
			response.setContentType("application/json");
			OBJECT_STRING=partnerspartyid+"";
			
		    /*	--------------------------------------------------------------------------------------------------------- */
			try {
				FiinfraUtility.doAudit(partnerspartyid,userSession.getUserId(), FiinfraConstants.EVENT_STA_FOR_PARNER_SRP, FiinfraConstants.SERVICE_PORTAL, FiinfraConstants.SRP_SOURCE_MODULE_PARTNER, FiinfraConstants.SRP_STA_PARTNER,"SP="+FiinfraConstants.SP_STA_FOR_PARTNER,OBJECT_STRING);
			} catch (Exception e) {
				e.printStackTrace();
			}
	     /*	--------------------------------------------------------------------------------------------------------- */
			
			objectMapper.writeValue(out, recordCount);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	
	
	@SuppressWarnings("unchecked")
	public void addBulkSTAforPartner(HttpServletRequest request,HttpServletResponse response){
		
	
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info(userSession.getUserName());
		url = URL_ADD_BULK_STA_FOR_PARTNER +"ramu"+"/1234";
		
		PrintWriter out=null ;  
		final String OBJECT_STRING;
		try {
			
			Partner partner=new Partner();
			partner.setPstTeamMemberId(request.getParameter("pst"));
			partner.setPktTeamMemberId(request.getParameter("pkt"));
			partner.setPotTeamMemberId(request.getParameter("pot"));
			partner.setRmTeamMemberId(request.getParameter("rm"));
			partner.setRmHeadTeamMemberId(request.getParameter("rmHead"));
			String partnerspartyidz = request.getParameter("partnerspartyidz");
			partner.setBulkSTAselect(partnerspartyidz);
			
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<>();
			br = restTemplate.postForObject(url, partner, BaseResponse.class);
			int recordCount=0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				if(br.getResponseObject()!=null){
				recordCount = br.getResponseObject();
				}
			out = response.getWriter();
			response.setContentType("application/json");
			
			OBJECT_STRING=partnerspartyidz+"";
		  /*	--------------------------------------------------------------------------------------------------------- */
			try {
				FiinfraUtility.doAudit(0/*partnerspartyidz*/,userSession.getUserId(), FiinfraConstants.EVENT_BULK_STA_FOR_PARNER_SRP, FiinfraConstants.SERVICE_PORTAL, FiinfraConstants.SRP_SOURCE_MODULE_PARTNER, FiinfraConstants.SRP_BULK_STA_PARTNER,"SP="+FiinfraConstants.SP_BULK_STA_FOR_PARTNER,OBJECT_STRING);
			} catch (Exception e) {
				e.printStackTrace();
			}
	     /*	--------------------------------------------------------------------------------------------------------- */
			
			
			objectMapper.writeValue(out, recordCount);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	

	@SuppressWarnings("unchecked")
	public void sendWelcomeMail(HttpServletRequest request,HttpServletResponse response){
		
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		PrintWriter out=null ;  
		String OBJECT_STRING="";
		try {
			String partnerspartyidz = request.getParameter("partnerspartyidz");
			String userDataXML="<Root>";
		
			String [] splitedpartyidz = partnerspartyidz.split(",");
			String hexString = null;
			for(int i=0;i<splitedpartyidz.length;i++){
				hexString = null;
				int noOfCAPSAlpha = 1;
				int noOfDigits = 1;
				int noOfSplChars = 1;
				int minLen = 8;
				int maxLen = 15;
			
				char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
							noOfCAPSAlpha, noOfDigits, noOfSplChars);
				hexString = new String(pswd);
				MD5Encryption md5Encryption = new MD5Encryption();
				String encryptrdPassword = md5Encryption.encrypt(hexString);
				
			//	String encryptrdPassword = passwordEncoder.encodePassword(hexString, null);
		
				
				
				logger.info("hexString is-----" + hexString);
				userDataXML+="<User>";
				userDataXML+="<userPassword>"+encryptrdPassword+"</userPassword>";
				userDataXML+="<PartyId>"+splitedpartyidz[i]+"</PartyId>";
				userDataXML+="<UserId>"+userSession.getUserId()+"</UserId>";
				userDataXML+="<buId>"+userSession.getBuId()+"</buId>";
				userDataXML+="</User>";
				hexStringzz.put(splitedpartyidz[i],hexString);
			 }
			
			userDataXML+="</Root>";
			partner.setUserDataXML(userDataXML);
			
	        url = URL_SEND_WELCOME_MAIL +"ramu"+"/1234";
			
			BaseResponse<Integer> br = new BaseResponse<>();
			br = restTemplate.postForObject(url, partner, BaseResponse.class);
			int recordCount=0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				if(br.getResponseObject()!=null){recordCount = br.getResponseObject();}
			out = response.getWriter();
			response.setContentType("application/json");

			for (int i = 0; i < splitedpartyidz.length; i++) {
			  for (String key : hexStringzz.keySet()) {
				if(splitedpartyidz[i].equals(key)){
					logger.info(key);
					Notification notification = null;
					Map<String, String> payloadMap = new HashMap<String, String>();
					payloadMap.put("Password", hexStringzz.get(key));
					notification = new Notification();
					notification.setSourceSystemID(31003); // need to add in
															// finfra coinstants
					logger.info("SourceSystemID is-----" + notification.getSourceSystemID());
					notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
					logger.info("NotifyTypeId is-----" + notification.getNotifyTypeId());
					notification.setNotifyUserID(userSession.getUserId());
					logger.info("NotifyUserID is-----" + notification.getNotifyUserID());
					notification.setNotifyPartyID(Integer.parseInt(splitedpartyidz[i]));
					OBJECT_STRING=splitedpartyidz[i]+"";
					logger.info("NotifyPartyID is-----" + notification.getNotifyPartyID());
					notification.setNotifyEventID(172); // need to add a param
														// for new admin portal
														// add partner
				    logger.info("NotifyEventID is-----" + notification.getNotifyEventID());
					notification.setBuId(userSession.getBuId());
				    logger.info("BuId is-----" + notification.getBuId());
					notification.setPayloadMap(payloadMap);
					 logger.info("PayloadMap is-----" + notification.getPayloadMap());
					notification.setSessionID(request.getSession().getId());
					 logger.info("SessionID is-----" + notification.getSessionID());
					FrameworkUtil.notify(notification);
					recordCount++;
				}
			}
		}
			out = response.getWriter();
			response.setContentType("application/json");
		    /*	--------------------------------------------------------------------------------------------------------- */
					try {

						FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(), FiinfraConstants.EVENT_SEND_WELCOME_MAIL_PARNER_SRP, FiinfraConstants.SERVICE_PORTAL, FiinfraConstants.SRP_SOURCE_MODULE_PARTNER, FiinfraConstants.SRP_SEND_WELCOME_MAIL_PARTNER,"SP="+FiinfraConstants.SP_SEND_WELCOME_MAIL, OBJECT_STRING);

					} catch (Exception e) {
						e.printStackTrace();
					}
			/*	--------------------------------------------------------------------------------------------------------- */
			
			objectMapper.writeValue(out, recordCount);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	
	
	@SuppressWarnings({ "unchecked", "unused" })
	public void editPartner(HttpServletRequest request,HttpServletResponse response){
		
		logger.info("in editPartner PartnerSPController");
		
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info(userSession.getUserName());
		
			int iRetCode=0;
			int recordCount=0;
			String szResponse="";
			String [] szResponsez;
			String szResponsezz = "";
			String szResponsezx = "";
			final String ZERO ="0";
			final String ONE ="1";
		
		try {
			String buid = request.getParameter("ehdnbuId");
			String communicationEmailId = request.getParameter("ecommunicationEmailId");
			communicationEmailId = communicationEmailId.split("@")[0];
			String contactEmail = request.getParameter("econtactEmail");
			
			if(buid.equals("27827")){
				communicationEmailId+="@"+SHUBHCHINTAK_DOMAIN;
			}
			if(buid.equals("27828")){
				communicationEmailId=contactEmail;
			}
			if(buid.equals("27829")){
				communicationEmailId+="@"+SHUBHCHINTAK_DOMAIN;
			}
			if(buid.equals("27830") || buid.equals("109612")){
				communicationEmailId+="@"+DFDAONLINE_DOMAIN;
			}

			String [] domain = communicationEmailId.split("@");
			// Domain name
			String szDomain=domain[1];
			
			// Server ip 
			String szServer = MITHI_SERVER;
			String szPostMethodPayLoad=null;

			String szUser = "" ;
			String alternateemail=contactEmail;
			
			try {
				if(communicationEmailId!=null){
					   String[] splitedCommunEmailId = communicationEmailId.split("@");
					   szUser=splitedCommunEmailId[0];
					   szPostMethodPayLoad=" {'alternateemailaddress':'"+alternateemail+"'}"; 
					}
				if(szPostMethodPayLoad!=null){
					// create request entity object
					RequestEntity requestEntity = new StringRequestEntity(szPostMethodPayLoad, "application/json", "UTF-8");
					// e.g. http://localhost/connectxf.ws/domain/mykotaklife.com/user
					PutMethod put = new PutMethod(szServer + "/connectxf.ws/domain/" + szDomain + "/user/"+szUser);
					logger.info("PutMethod URL:::"+szServer + "/connectxf.ws/domain/" + szDomain + "/user/"+szUser);
					logger.info("PutMethod Payload:::"+szPostMethodPayLoad);
					// adding payload to post method object
					put.setRequestEntity(requestEntity);
					// add request headers viz. appkey and secretkey for authorization
					put.addRequestHeader("appkey", APP_ID_MAIL_BOX);
					put.addRequestHeader("secretkey", SECRET_KEY_MAIL_BOX);
					
					logger.info("alternate email  appkey:::"+APP_ID_MAIL_BOX);
					logger.info("alternate email secretkey:::"+SECRET_KEY_MAIL_BOX);
					
					// creating httpclient
					HttpClient httpclient = new HttpClient();
					// calling add contact webservice
					// you will get http 401 Status code, if authorization failed

					iRetCode = httpclient.executeMethod(put);
					logger.info("alternate email  iRetCode is-----" + iRetCode);
					// get response as string
					szResponse = put.getResponseBodyAsString();
					logger.info("alternate email szResponse is-----" + szResponse);
					szResponse=szResponse.replaceAll("\"", "");
					szResponsezz=szResponse;
					szResponsezx=szResponse;
					if(szResponse.contains("returncode:")){
					szResponse=szResponse.split("returncode:")[1].split("}")[0];
					if(szResponse.contains(ONE)){
						szResponse=ONE;
					}
					}
					}
			} catch (Exception e) {
				e.printStackTrace();
			}
		  }catch (Exception e) {e.printStackTrace();}
		
		url = URL_EDIT_PARTNER +"ramu"+"/1234";
		
		PrintWriter out=null ;  
		final String OBJECT_STRING;
		try {
			
			Partner partner=new Partner();
			partner.setFirstName(request.getParameter("efirstName"));
			partner.setLastName(request.getParameter("elastName"));
		
			partner.setCompanyName(request.getParameter("ecompanyName"));
			partner.setContactEmail(request.getParameter("econtactEmail"));
			partner.setContactMobile(request.getParameter("econtactMobile"));
			partner.setArn(request.getParameter("eARN"));
			partner.setEuin(request.getParameter("eeuin"));
			partner.setState(request.getParameter("estate"));
			partner.setLocation(request.getParameter("elocation"));
			partner.setPstTeamMemberId(request.getParameter("epst"));
			partner.setPktTeamMemberId(request.getParameter("epkt"));
			partner.setPotTeamMemberId(request.getParameter("epot"));
			partner.setRmTeamMemberId(request.getParameter("erm"));
			partner.setRmHeadTeamMemberId(request.getParameter("ermHead"));
			partner.setBuId(request.getParameter("ehdnbuId"));
			partner.setUserId(request.getParameter("ehdnuserId"));
			partner.setCommunicationEmailId(request.getParameter("ecommunicationEmailId"));
			int hdnpartyId = Integer.parseInt(request.getParameter("hdnpartyId"));
			partner.setPartyID(hdnpartyId);
			
			
			OBJECT_STRING = FiinfraConstants.SP_EDIT_PARTNER + ","
					+ request.getParameter("efirstName") + ","
					+ request.getParameter("elastName") + ","
					+ request.getParameter("ecompanyName") + ","
					+ request.getParameter("econtactEmail") + ","
					+ request.getParameter("econtactMobile") + ","
					+ request.getParameter("eARN") + ","
					+ request.getParameter("epst") + ","
					+ request.getParameter("epkt") + ","
					+ request.getParameter("epot") + ","
					+ request.getParameter("erm") + ","
					+ request.getParameter("ermHead") + ","
					+ request.getParameter("ehdnbuId") + ","
					+ request.getParameter("ehdnuserId") + ","
					+ request.getParameter("eeuin") + ","
					+ request.getParameter("estate") + ","
					+ request.getParameter("elocation") + ","
					+ request.getParameter("eloginname") + ","
					+ request.getParameter("ecommunicationEmailId") ;
			
			
			
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<>();
			br = restTemplate.postForObject(url, partner, BaseResponse.class);
			//int recordCount=0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				if(br.getResponseObject()!=null){
				recordCount = br.getResponseObject();
				}
			out = response.getWriter();
			response.setContentType("application/json");
			
/*	--------------------------------------------------------------------------------------------------------  */
			
			String newpst = request.getParameter("newpst");
			String newrm = request.getParameter("newrm");
			//String ZERO="0";
			Notification notification=null;
			
			try {
				if(((!newpst.equals("")) && (newpst!=null)) || ((!newrm.equals("")) && (newrm!=null) && (!newrm.equals(ZERO)))){
					
				Map<String,String> payloadMap=new HashMap<String, String>();
				payloadMap.put(" "," ");
				notification=new Notification();
				notification.setSourceSystemID(31003); // need to add in finfra coinstants
				logger.info("SourceSystemID is-----" + notification.getSourceSystemID());
				notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
				logger.info("NotifyTypeId is-----" + notification.getNotifyTypeId());
				notification.setNotifyUserID(Integer.parseInt(request.getParameter("ehdnuserId")));
				logger.info("NotifyUserID is-----" + notification.getNotifyUserID());
				notification.setNotifyPartyID(hdnpartyId);
				logger.info("NotifyPartyID is-----" + notification.getNotifyPartyID());
				notification.setNotifyEventID(265);   // need to add a param for new admin portal add partner
				logger.info("NotifyEventID is-----" + notification.getNotifyEventID());
				//notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
				notification.setBuId(Integer.parseInt(request.getParameter("ehdnbuId")));
				logger.info("BuId is-----" + notification.getBuId());
				notification.setPayloadMap(payloadMap);
				 logger.info("PayloadMap is-----" + notification.getPayloadMap());
				notification.setSessionID(request.getSession().getId());
				 logger.info("SessionID is-----" + notification.getSessionID());
				FrameworkUtil.notify(notification);
				
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			
    /*	--------------------------------------------------------------------------------------------------------- */
			try {
				FiinfraUtility.doAudit(hdnpartyId, userSession.getUserId(), FiinfraConstants.EVENT_EDIT_PARNER_SRP, FiinfraConstants.SERVICE_PORTAL, FiinfraConstants.SRP_SOURCE_MODULE_PARTNER, FiinfraConstants.SRP_ADD_EDIT_PARTNER,"SP="+FiinfraConstants.SP_EDIT_PARTNER, OBJECT_STRING);
			} catch (Exception e) {
				e.printStackTrace();
			}
	/*	--------------------------------------------------------------------------------------------------------- */
			
			objectMapper.writeValue(out, recordCount);
		} catch (IOException e) {
			e.printStackTrace();
		}		 
	}
	
	@SuppressWarnings("unchecked")
	public void assignCommunicationEmail(HttpServletRequest request,HttpServletResponse response){
		
		logger.info("in assignCommunicationEmail PartnerSPController"); 
		
		logger.info("communname::"+request.getParameter("communname"));
		logger.info("contactEmail:"+request.getParameter("contactEmail"));
		logger.info("hdnbuId:"+request.getParameter("hdnbuId"));
		logger.info("hdnuserId:"+request.getParameter("hdnuserId"));
		logger.info("hdnpartyId:"+request.getParameter("hdnpartyId"));
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info(userSession.getUserName());
		url = URL_ASSIGN_COMMUNICATION_EMAIL_PARTNER +"ramu"+"/1234";
		
		PrintWriter out=null ;  
		final String OBJECT_STRING;
		try {
			
			Partner partner=new Partner();
			partner.setEmailCommunicationName(request.getParameter("communname"));
			partner.setContactEmail(request.getParameter("contactEmail"));
			partner.setBuId(request.getParameter("hdnbuId"));
			partner.setUserId(request.getParameter("hdnuserId"));
			int hdnpartyId = Integer.parseInt(request.getParameter("hdnpartyId"));
			partner.setPartyID(hdnpartyId);
			
			BaseResponse<Integer> br = new BaseResponse<>();
			br = restTemplate.postForObject(url, partner, BaseResponse.class);
			int recordCount=0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				if(br.getResponseObject()!=null){
				recordCount = br.getResponseObject();
				}
			out = response.getWriter();
			response.setContentType("application/json");
		    /*	--------------------------------------------------------------------------------------------------------- */
					try {
						OBJECT_STRING=request.getParameter("communname");
						FiinfraUtility.doAudit(hdnpartyId, userSession.getUserId(), FiinfraConstants.EVENT_ASSIGN_COMMUNICATION_EMAIL_PARNER_SRP, FiinfraConstants.SERVICE_PORTAL, FiinfraConstants.SRP_SOURCE_MODULE_PARTNER, FiinfraConstants.SRP_ASSIGN_COMMUNICATION_EMAIL_PARTNER,"SP="+FiinfraConstants.SP_ASSIGN_COMMUNICATION_EMAIL_PARTNER,OBJECT_STRING);
					} catch (Exception e) {
						e.printStackTrace();
					}
			/*	--------------------------------------------------------------------------------------------------------- */
			objectMapper.writeValue(out, recordCount); 
		} catch (IOException e) {
			e.printStackTrace();
		}		 
	}
	
	

	@SuppressWarnings("unchecked")
	public void saveChecklist(HttpServletRequest request,HttpServletResponse response){
		
		
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info(userSession.getUserName());
		
		
		url = URL_SAVE_ONBOARD_CHECKLIST +"ramu"+"/1234";
		
		PrintWriter out=null ;  
		final String OBJECT_STRING;
		try {
			 //hdnpartyId+"&hdnuserId="+hdnuserId+"&PSdate="+PSdate+"&WCdate="+WCdate+"&ASdate="+ASdate+"&OBdate="+OBdate+"&region="+region
			
			int hdnpartyId = Integer.parseInt(request.getParameter("hdnpartyId"));
			int buId = Integer.parseInt(request.getParameter("hdnbuId"));
			String hdnuserId=request.getParameter("hdnuserId");
			String PSdate=request.getParameter("PSdate");
			String WCdate=request.getParameter("WCdate");
			String ASdate=request.getParameter("ASdate");
			String OBdate=request.getParameter("OBdate");
			String region=request.getParameter("region");
			
			String execution_tracker=request.getParameter("execution_tracker");
			String goal_tracking_achievement=request.getParameter("goal_tracking_achievement");
			String track_your_practice=request.getParameter("track_your_practice");
			String self_Financial_Plan=request.getParameter("self_Financial_Plan");
			
//			 var execution_tracker =$('#execution_tracker').val();
//			 var goal_tracking_achievement =  $('#goal_tracking_achievement').val(); 
//		 	 var track_your_practice =	$('#track_your_practice').val();
//			 var self_Financial_Plan =  $('#self_Financial_Plan').val() ;	
			//String onboardxml= "<root><hdnpartyId>"+hdnpartyId+"</hdnpartyId><hdnuserId>"+hdnuserId+"</hdnuserId><PSdate>"+PSdate+"</PSdate><WCdate>"+WCdate+"</WCdate><ASdate>"+ASdate+"</ASdate><OBdate>"+OBdate+"</OBdate><region>"+region+"</region><buId>"+buId+"</buId></root>";
			//logger.info("Onboard Xml String 1.1"+onboardxml);
			Partner partner=new Partner();
			partner.setBuId(request.getParameter("hdnbuId"));
			partner.setUserId(request.getParameter("hdnuserId"));
			partner.setPartyID(hdnpartyId);
			partner.setProgramSponsor(PSdate);
			partner.setWelcomeContacted(WCdate);
			partner.setAgreementCheckD(ASdate);
			partner.setOnboardingCheck(OBdate);
			partner.setRagion(region);
	/*		partner.setExecution_tracker(execution_tracker);
			partner.setGoal_tracking_achievement(goal_tracking_achievement);
			partner.setTrack_your_practice(track_your_practice);
			partner.setSelf_Financial_Plan(self_Financial_Plan);*/
						
			//partner.setOnboardxml(onboardxml);
		/*	
		 *  programSponsor ;
		 private String agreementCheckD ;
		 private String onboardingCheck ;
		 private String ragion ;
		private String ratting;
		 * partner.setCommEmailID(request.getParameter("hdnpartyId"));
			partner.setRatting(request.getParameter("rating"));
			partner.setBuId(request.getParameter("hdnbuId"));
			partner.setUserId(request.getParameter("hdnuserId"));*/
		
		
			BaseResponse<Integer> br = new BaseResponse<>();
			br = restTemplate.postForObject(url, partner, BaseResponse.class);
			int recordCount=0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				if(br.getResponseObject()!=null){
							recordCount = br.getResponseObject();
				}
			out = response.getWriter();
			response.setContentType("application/json");
		    /*	--------------------------------------------------------------------------------------------------------- */
					try {
						OBJECT_STRING=hdnpartyId+","+buId+","+hdnuserId+","+PSdate+","+WCdate+","+ASdate+","+OBdate+","+region+","+execution_tracker+","+goal_tracking_achievement+","+track_your_practice+","+self_Financial_Plan;
						FiinfraUtility.doAudit(hdnpartyId, userSession.getUserId(), FiinfraConstants.EVENT_SAVE_ONBOARD_CHECKLIST_SRP, FiinfraConstants.SERVICE_PORTAL, FiinfraConstants.SRP_SOURCE_MODULE_PARTNER, FiinfraConstants.SRP_SAVE_CHECKLIST,"SP="+FiinfraConstants.SP_SAVE_ONBOARD_CHECK_LIST,OBJECT_STRING);
					} catch (Exception e) {
						e.printStackTrace();
					}
			/*	--------------------------------------------------------------------------------------------------------- */
			objectMapper.writeValue(out, recordCount); 
		} catch (IOException e) {
			e.printStackTrace();
		}		 
	}
	
	
	
	 public void loadlegendsChecklist(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
		
		 int partnerspartyid = Integer.parseInt(request.getParameter("partnerspartyid"));
		 
	String url=URL_GET_LEGENDS_CHECKLIST+ "sa" + "/1234";
		
	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	
		Partner partner=new Partner();
		partner.setPartyID(partnerspartyid);
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		br =  restTemplate.postForObject(url, partner, BaseResponse.class);
		List<Partner> checklist = new ArrayList<Partner>();
		
		request.setAttribute("rollId",userSession.getRoleId());
		
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			checklist= br.getResponseListObject();
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, checklist);
		 
	}

	@SuppressWarnings("unchecked")
	public void savelegends(HttpServletRequest request,HttpServletResponse response){
		
		
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info(userSession.getUserName());
		
		
		url = URL_SAVE_LEGENDS_CHECKLIST +"ramu"+"/1234";
		
		PrintWriter out=null ;  
		final String OBJECT_STRING;
		try {
			 //hdnpartyId+"&hdnuserId="+hdnuserId+"&PSdate="+PSdate+"&WCdate="+WCdate+"&ASdate="+ASdate+"&OBdate="+OBdate+"&region="+region
//			
			int hdnpartyId = Integer.parseInt(request.getParameter("hdnpartyId"));
			int buId = Integer.parseInt(request.getParameter("hdnbuId"));
			String hdnuserId=request.getParameter("hdnuserId");
			String OBlegends=request.getParameter("PSdate");
			String legendradiolist=request.getParameter("OBdate");
			String onboardxml= "<root><hdnpartyId>"+hdnpartyId+"</hdnpartyId><hdnuserId>"+hdnuserId+"</hdnuserId><OBlegends>"+OBlegends+"</OBlegends><legendradiolist>"+legendradiolist+"</legendradiolist><buId>"+buId+"</buId></root>";
			logger.info("Onboard Xml String 1.1"+onboardxml);
			Partner partner=new Partner();
			partner.setBuId(request.getParameter("hdnbuId"));
			partner.setUserId(request.getParameter("hdnuserId"));
			partner.setPartyID(hdnpartyId);
			partner.setProgramSponsor(OBlegends);
			partner.setOnboardingCheck(legendradiolist);
	
			BaseResponse<Integer> br = new BaseResponse<>();
			br = restTemplate.postForObject(url, partner, BaseResponse.class);
			int recordCount=0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				if(br.getResponseObject()!=null){
							recordCount = br.getResponseObject();
				}
			out = response.getWriter();
			response.setContentType("application/json");
		    /*	--------------------------------------------------------------------------------------------------------- */
//					try {
//						OBJECT_STRING=hdnpartyId+","+buId+","+hdnuserId+","+PSdate+","+WCdate+","+ASdate+","+OBdate+","+region;
//						FiinfraUtility.doAudit(hdnpartyId, userSession.getUserId(), FiinfraConstants.EVENT_SAVE_ONBOARD_CHECKLIST_SRP, FiinfraConstants.SERVICE_PORTAL, FiinfraConstants.SRP_SOURCE_MODULE_PARTNER, FiinfraConstants.SRP_SAVE_CHECKLIST,"SP="+FiinfraConstants.SP_SAVE_ONBOARD_CHECK_LIST,OBJECT_STRING);
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
			/*	--------------------------------------------------------------------------------------------------------- */
			objectMapper.writeValue(out, recordCount); 
		} catch (IOException e) {
			e.printStackTrace();
		}		 
	}
	
@SuppressWarnings("unchecked")
public void deletePartner(HttpServletRequest request,HttpServletResponse response){
		
	logger.info("in delete method");
	
	try {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int lastmodifyby = userSession.getUserId();
		logger.info(userSession.getUserName());
		url = URL_DELETE_PARTNER +"ramu"+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("deletelist",request.getParameter("selectedlvalz"));
		uriCB.queryParam("lastmodifyby",lastmodifyby);
		
		Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<Partner> list = new ArrayList<Partner>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			list= br.getResponseListObject();
		Logger.logEntry(this.getClass(), "DATA LIST:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		
		Audit audit = new Audit();
		//audit.setActionByPartyId(request.getParameter("selectedlvalz"));
		//audit.setObjectName(FiinfraConstants.SRP_DELETE_PARTNER);
		audit.setActionByUserID(userSession.getUserId());
		//audit.setEventID(FiinfraConstants.NEW_USER_PARNER_PORTAL);
		audit.setSourceSystemID(FiinfraConstants.SERVICE_PORTAL);
		audit.setSourceModule(FiinfraConstants.SRP_SOURCE_MODULE_PARTNER);	
		audit.setSourceScreen(FiinfraConstants.SRP_DELETE_PARTNER);
		FrameworkUtil.audit(audit);
		final String OBJECT_STRING;
		OBJECT_STRING=request.getParameter("selectedlvalz");
	    /*	--------------------------------------------------------------------------------------------------------- */
		try {

			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(), FiinfraConstants.EVENT_DELETE_PARNER_SRP, FiinfraConstants.SERVICE_PORTAL, FiinfraConstants.SRP_SOURCE_MODULE_PARTNER, FiinfraConstants.SRP_DELETE_PARTNER,"SP="+FiinfraConstants.SP_DELETE_PARTNER,OBJECT_STRING);

		} catch (Exception e) {
			e.printStackTrace();
		}
     /*	--------------------------------------------------------------------------------------------------------- */
		
		objectMapper.writeValue(out, list);
	} catch (RestClientException | IOException e) {
		e.printStackTrace();
	}
}
	

@SuppressWarnings("unchecked")
public void getLocation(HttpServletRequest request,
		HttpServletResponse response) {
	
	logger.info("\n getLocation  PartnerSPController ");
try {
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	logger.info(userSession.getUserName());
	url = URL_GET_LOCATION +"ramu"+"/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
	BaseResponse<Partner> br = new BaseResponse<Partner>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	List<Partner> list = new ArrayList<Partner>();
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		list= br.getResponseListObject();
	Logger.logEntry(this.getClass(), "DATA LIST:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, list);
} catch (RestClientException | IOException e) {
	e.printStackTrace();
 }
}





@SuppressWarnings("unchecked")
public void getLoginName(HttpServletRequest request,
		HttpServletResponse response) {
	logger.info("\n getLoginName  PartnerSPController ");
try {
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	logger.info(userSession.getUserName());
	url = URL_GET_LOGIN_NAME +"ramu"+"/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", request.getParameter("partyId"));
	Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
	BaseResponse<Partner> br = new BaseResponse<Partner>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	List<Partner> list = new ArrayList<Partner>();
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		list= br.getResponseListObject();
	Logger.logEntry(this.getClass(), "DATA LIST:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, list);
} catch (RestClientException | IOException e) {
	e.printStackTrace();
 }
}


@SuppressWarnings("unchecked")
public void getUniqueArn(HttpServletRequest request,
		HttpServletResponse response) {
	logger.info("\n getUniqueArn  PartnerSPController ");
try {
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	logger.info(userSession.getUserName());
	url = URL_GET_UNIQUE_ARN +"ramu"+"/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("arn", request.getParameter("arn"));
	Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
	BaseResponse<Partner> br = new BaseResponse<Partner>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	List<Partner> list = new ArrayList<Partner>();
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		list= br.getResponseListObject();
	/*String arnz=null;
	for(Partner uniqarn : list){
		arnz=uniqarn.getArn();
	}*/
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	
	objectMapper.writeValue(out, list);
} catch (RestClientException | IOException e) {
	e.printStackTrace();
 }
}




@SuppressWarnings("unchecked")
public void showTopPartnerList(HttpServletRequest request,HttpServletResponse response)throws IOException{

 	logger.info("\n showTopPartnerList  PartnerSPController ");
 	try {
 		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
 		logger.info(userSession.getUserName());
 	    int buId=userSession.getBuId();
 	    int userId=userSession.getUserId();
 		url = URL_SHOW_TOP_PARTNER_LIST + "ramu"+ "/1234";
 		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
 		uriCB.queryParam("buId", buId);
 		uriCB.queryParam("userId", userId);
 		Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
 		BaseResponse<Partner> br = new BaseResponse<Partner>();
 		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
 		List<Partner> list = new ArrayList<Partner>();
 		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
 			list= br.getResponseListObject();
 		Logger.logEntry(this.getClass(), "DATA LIST:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
 		PrintWriter out = null;
 		out = response.getWriter();
 		response.setContentType("application/json");
 		objectMapper.writeValue(out, list);
 	} catch (RestClientException | IOException e) {
 		e.printStackTrace();
 	 }
}


//  add by sourabh 



@Value("${URL_GET_OPPORTUNITIES_LIST}")
private String URL_GET_OPPORTUNITIES_LIST;

@Value("${URL_GET_CLIENT_LIST}")
private String URL_GET_CLIENT_LIST;

@Value("${URL_GET_QUERY_LIST}")
private String URL_GET_QUERY_LIST;

@Value("${URL_GET_QUERY_UNREAD_COUNT}")
private String URL_GET_QUERY_UNREAD_COUNT;

@SuppressWarnings("unchecked")
public ModelAndView getOpportunitiesList(HttpServletRequest request,
		HttpServletResponse response) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException {
	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int buId = userSession.getBuId();
	//int partyId = userSession.getPartyId();
	Integer partyId = null;
	int nodeId = 0;
	HttpSession hes = request.getSession();
	try{
	partyId = Integer.parseInt(request.getParameter("partyId"));
	nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
	}
	catch(Exception e){
		//partyId=(Integer) hes.getAttribute("bulkPartyid");
		nodeId=0;
	}
	
	hes.setAttribute("bulkPartyid", partyId);

	
	/*String pageSize = request.getParameter("pageSize");
	if (pageSize == null) {
		pageSize = "10";
	}*/
	//logger.info("pageSize------" + pageSize);

	
	int pageSize=request.getParameter("rows")==null?100000:Integer.valueOf(request.getParameter("rows").toString());
	int pageNo=request.getParameter("page")==null?0:Integer.valueOf(request.getParameter("page").toString());
	String orderBy=request.getParameter("sidx")==null?"name":request.getParameter("sidx").toString();
	String sord=request.getParameter("sord")==null?"asc":request.getParameter("sord").toString();
	
	orderBy="";
	sord="";
	
	String oppSearchValue = request.getParameter("value");
	String url = FiinfraUtility.getRestDBURL();
	
	url = URL_GET_OPPORTUNITIES_LIST + userSession.getUserName() + "/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", partyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("oppSearchValue", oppSearchValue);
	uriCB.queryParam("nodeId", nodeId);
	uriCB.queryParam("pageNo", pageNo);
	uriCB.queryParam("pageSize", pageSize);
	uriCB.queryParam("orderBy", orderBy);
	uriCB.queryParam("sord", sord);
	logger.info("URL Opportunities..............");
	// Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG,
	// Thread
	// .currentThread().getStackTrace()[1].getMethodName());
/*
	BaseResponse<OpportunityData> br = new BaseResponse<OpportunityData>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
			BaseResponse.class).getBody();

	List<OpportunityData> opportunityDatas = new ArrayList<>();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		opportunityDatas = br.getResponseListObject();
*/
	BaseResponse<GridData> br = new BaseResponse<GridData>();
	br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	GridData gridData=new GridData();
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		gridData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), GridData.class);	
	
	// Logger.logEntry(this.getClass(), "opportunityDatas:---" +
	// opportunityDatas, Logger.DEBUG,
	// Thread.currentThread().getStackTrace()[1].getMethodName());

	ModelAndView mav = new ModelAndView("partner/opportunities");
	mav.addObject("opportunityDatas", objectMapper.writeValueAsString(gridData.getRows()));
	mav.addObject("pagesize", pageSize);
	return mav;
}


/**
 * retrieves Client list based on the party.
 * @param request
 * @param response
 * @return
 * @throws IOException 
 * @throws JsonMappingException 
 * @throws JsonGenerationException 
 */
@SuppressWarnings("unchecked")
public ModelAndView getClientList(HttpServletRequest request, HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	int buId=userSession.getBuId();
	/*int partyId=userSession.getPartyId();*/
	int partyId = Integer.parseInt(request.getParameter("partyId"));
	
	//partyId = 6326;
	
	String pagesize=request.getParameter("pageSize");
	int nodeId;
	
	try{
		//partyId = Integer.parseInt(request.getParameter("partyId"));
		nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		}
		catch(Exception e){
			//partyId=(Integer) hes.getAttribute("bulkPartyid");
			nodeId=0;
		}

	
	//int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
	boolean IsAutoPlan=false;
	int pageSize=request.getParameter("rows")==null?100000:Integer.valueOf(request.getParameter("rows").toString());
	int pageNo=request.getParameter("page")==null?0:Integer.valueOf(request.getParameter("page").toString());
	String orderBy=request.getParameter("sidx")==null?"party.LastModifiedDate":request.getParameter("sidx").toString();
	String sord=request.getParameter("sord")==null?"asc":request.getParameter("sord").toString();
	if(pagesize==null){
		pagesize="10";
	}
	logger.info("pageSize------"+pagesize);
	int autoPlanClient=0;
	try{
		autoPlanClient=Integer.parseInt(request.getParameter("autoPlanClient"));
		if(autoPlanClient==1){
			IsAutoPlan=true;
		}
	}catch(Exception e){
		
	}
	
	String url = FiinfraUtility.getRestDBURL();
	
	 String clientValueSearch = request.getParameter("value");
	//String clientValueSearch="";
	 logger.info("search value ......."+clientValueSearch);
	logger.info("partyId------------>>>>>>>"+partyId);
	//String url = FiinfraUtility.getRestDBURL();
	url=URL_GET_CLIENT_LIST + userSession.getUserName() + "/1234";
	logger.info("URL----------->"+url);
	
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	
	
	
	uriCB.queryParam("partyId", partyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("clientValueSearch", clientValueSearch);
	
	
	
	
	
	//uriCB.queryParam("partyId", partyId);
	//uriCB.queryParam("buId", buId);
	//uriCB.queryParam("clientValueSearch", clientValueSearch);
	uriCB.queryParam("IsAutoPlan", IsAutoPlan);
	uriCB.queryParam("nodeId", nodeId);
	uriCB.queryParam("pageNo", pageNo);
	uriCB.queryParam("pageSize", pageSize);
	uriCB.queryParam("orderBy", orderBy);
	uriCB.queryParam("sord", sord);
	
	
	BaseResponse<GridData> br = new BaseResponse<GridData>();
	br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	GridData gridData=new GridData();
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		gridData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), GridData.class);	
	
	/*ModelAndView mav = new ModelAndView("partner/opportunities");
	mav.addObject("opportunityDatas", objectMapper.writeValueAsString(gridData.getRows()));*/
	
	ModelAndView mav = new ModelAndView("partner/client");
	mav.addObject("clientDatas", objectMapper.writeValueAsString(gridData.getRows()));
	//mav.addObject("clientDatas", clientDatas);
	mav.addObject("pagesize", pagesize);
	
	return mav;
}


/**
 * retrieves query list based on the query panel.
 * 
 * @param request
 * @param response
 * @return
 */
@SuppressWarnings("unchecked")
public ModelAndView getQueryList(HttpServletRequest request,
		HttpServletResponse response) {
	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int buId = userSession.getBuId();
	int partyId = userSession.getPartyId();
	
	// partyId = 6326;
	
	String pagesize=request.getParameter("pageSize");
	if(pagesize==null){
		pagesize="10";
	}
	logger.info("pageSize------"+pagesize);
	
	
	String queryPanel = request.getParameter("queryPanel");// "inbox";
	String searchValue = request.getParameter("value");// "search value";
	logger.info("Search value ......"+searchValue);
	queryPanel = queryPanel == null ? "inbox" : queryPanel;
	request.getSession().setAttribute("queryPanel", queryPanel);
	url = URL_GET_QUERY_LIST + userSession.getUserName() + "/1234";
	logger.info("url:-"+url);
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", partyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("queryPanel", queryPanel);
	uriCB.queryParam("searchValue", searchValue);
	BaseResponse<QueryData> br = new BaseResponse<QueryData>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
			BaseResponse.class).getBody();
	List<QueryData> queryDatas = new ArrayList<>();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		queryDatas = br.getResponseListObject();
	url = URL_GET_QUERY_UNREAD_COUNT + userSession.getUserName() + "/1234";
	logger.info("url:-"+url);
	uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", partyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("queryPanel", queryPanel);
	uriCB.queryParam("searchValue", searchValue);
	BaseResponse<Integer> br1 = new BaseResponse<Integer>();
	br1 = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
			BaseResponse.class).getBody();
	List<Integer> unreadQueryCount = new ArrayList<>();
	if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		unreadQueryCount = br1.getResponseListObject();
	ModelAndView mav = new ModelAndView("partner/query");
	mav.addObject("queryDatas", queryDatas);
	mav.addObject("pagesize", pagesize);
	mav.addObject("unreadQueryInboxCount", unreadQueryCount.get(0));
	mav.addObject("unreadQuerySentboxCount", unreadQueryCount.get(1));
	
	return mav;// new ModelAndView("common/query", "queryDatas",
				// queryDatas);
}




String bulkCommunEmailId="";
String bulkContactEmail="";
String userid="";

@SuppressWarnings({ "unchecked", "unused" })
public ModelAndView insertBulkPartner(HttpServletRequest request,
			HttpServletResponse response,FileUpload fileUpload) throws IOException {
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	//Partner partner = new Partner();
	String partnerUploadFileName;
	logger.info("in insertBulkPartner..."+fileUpload.getFile());
	partnerUploadFileName=fileUpload.getFile().getOriginalFilename();
	MultipartFile partnerUploadFile;
	partnerUploadFile=fileUpload.getFile();
	
	int iRetCode=0;
	String stringiRetCode="";
	String szResponse="";
	final String FOUR_ZERO_ONE ="401";
	final String ONE ="1";
	PrintWriter out = null;
	
	logger.info(partnerUploadFile);
	
	int buId = userSession.getBuId();
	int partyId=userSession.getPartyId();
	int userId = Integer.parseInt(request.getParameter("hdnuserId"));
	userid=request.getParameter("hdnuserId");
	
	partner.setLeadUpload(fileUpload.getFile());
	partner.setOwnerPartyId(partyId+"");
	partner.setBuId(buId+"");
	partner.setUserId(userId+"");
	partner.setSessionId(request.getSession().getId());
	
	String xmlString;
	int count = 0;
	
	lstSuccessPartner=new ArrayList<>();
	lstExistingPartner=new ArrayList<>();
	lstFailedPartner=new ArrayList<>();
	lstMithiFailedContactEmails=new ArrayList<>();
	
	logger.info("To bulk Upload Partner.......");
	List<Partner> lstToCreatePartner=null;
	
	try{
		if (partnerUploadFileName.substring(
				partnerUploadFileName.lastIndexOf('.') + 1).equals("xls")) {				
			lstToCreatePartner = readXls();
				
		} else if (partnerUploadFileName.substring(
				partnerUploadFileName.lastIndexOf('.') + 1).equals("xlsx")) {
				lstToCreatePartner = readXlsx();
		}
		logger.info("lstFailedPartner size:----------"+ lstFailedPartner.size());
		//this.lstFailedPartner=lstFailedPartner;
		request.getSession().setAttribute("lstFailedPartner",lstFailedPartner);
		count = lstFailedPartner.size();
		count = count + lstToCreatePartner.size();
		request.getSession().setAttribute("TotalPartnerCount",count);	
		request.getSession().setAttribute("TotalFailedPartnerCount", lstFailedPartner.size());

		logger.info("**To Create Partner By SP**" + lstToCreatePartner);
		if(lstToCreatePartner!=null){
			if(lstToCreatePartner.size()>0){
				xmlString=getPartnerToInsertXmlString(lstToCreatePartner);
				
				partner.setBulkPartnerXml(xmlString);
				logger.info("XML String"+xmlString);
				
			}else{partner.setBulkPartnerXml("");}
		}
	}
	catch(Exception e)
	{
		  e.printStackTrace();
	}
	
	logger.info("UserName - >>"+userSession.getUserName());
	
	url=URL_INSERT_BULK_PARTNER + "ramu" + "/1234";
	logger.info("URL-------->"+url);

		ObjectMapper om = new CustomJacksonObjectMapper();
		String jsonString=om.writeValueAsString(partner);
		logger.info("jsonString:---"+jsonString);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<List<Partner>> prtnrList=new ArrayList<>();
		BaseResponse<List<Partner>> br = new BaseResponse<List<Partner>>();
		logger.info("In WEb BulkUploadPartnerData.....");
		br = restTemplate.postForObject(url, partner, BaseResponse.class);
		logger.info("Base Response"+br);
		//String result = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			prtnrList = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseListObject()),
					List.class);
		logger.info("lstFailedPartner---"+prtnrList);
		
		
		 String OBJECT_STRING="";
		try {
			List<Partner> myObjects=null;
			if(lstSuccessPartner.isEmpty()){
				lstSuccessPartner=prtnrList.get(0);
				logger.info("lstSuccessPartner.size::::"+lstSuccessPartner.size());
				ObjectMapper mapper = new CustomJacksonObjectMapper();
				String jsonSuccessString=mapper.writeValueAsString(lstSuccessPartner);
				logger.info(jsonSuccessString);
				 myObjects = mapper.readValue(jsonSuccessString, mapper.getTypeFactory().constructCollectionType(List.class, Partner.class));
			
				 for(int i=0;i<lstSuccessPartner.size();i++){
					
					for (String key : hexStringzz.keySet()) {
						
					 if(myObjects.get(i).getLoginName().equals(key)){
						if(myObjects.get(i).getPartyID()!=null){
						
						bulkCommunEmailId+=myObjects.get(i).getCommunicationEmailId()+",";
						bulkContactEmail+=myObjects.get(i).getContactEmail()+",";
												
					    passwordMap.put(myObjects.get(i).getPartyID(),hexStringzz.get(key));
					    logger.info("Password String::::"+hexStringzz.get(key));
					Notification notification=null;
					for(Map.Entry<Integer,String> map:passwordMap.entrySet()){
						Map<String,String> payloadMap=new HashMap<String, String>();
						payloadMap.put("Password",map.getValue());
						
						
							
						
						if(buId == Integer.parseInt(SHUBHCHINTAKBUID))
							payloadMap.put("CommEmailPassword",SHUBHCHINTAK_USER_MITHI_PASSWORD);
						else if(buId ==  Integer.parseInt(SPABUID))				
							payloadMap.put("CommEmailPassword",SPA_USER_MITHI_PASSWORD);
						else if(buId ==  Integer.parseInt(DFDABUID))				
							payloadMap.put("CommEmailPassword",DFDAONLINE_USER_MITHI_PASSWORD);
						
						
						
						notification=new Notification();
						notification.setSourceSystemID(31003); // need to add in finfra coinstants
						logger.info("SourceSystemID is-----" + notification.getSourceSystemID());
						notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
						logger.info("NotifyTypeId is-----" + notification.getNotifyTypeId());
						notification.setNotifyUserID(Integer.parseInt(userid));
						logger.info("NotifyUserID is-----" + notification.getNotifyUserID());
						notification.setNotifyPartyID(map.getKey());
						logger.info("NotifyPartyID is-----" + notification.getNotifyPartyID());
						OBJECT_STRING+=notification.getNotifyPartyID();
					    notification.setNotifyEventID(172);   // need to add a param for new admin portal add partner
					    logger.info("NotifyEventID is-----" + notification.getNotifyEventID());
						//notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
						notification.setBuId(buId);
					    logger.info("BuId is-----" + notification.getBuId());
						notification.setPayloadMap(payloadMap);
						
						
						
						 logger.info("PayloadMap is-----" + notification.getPayloadMap());
						notification.setSessionID(request.getSession().getId());
						 logger.info("SessionID is-----" + notification.getSessionID());
						FrameworkUtil.notify(notification);
					}
					passwordMap.clear();
				   }
				  }
				 }	
			   }
			 }
		    }catch (NumberFormatException e) {e.printStackTrace();}
		
/*	-----------------------------------------start-contact email creation on mithi-----------------------------------------------------------	*/
		
		
		try {
			String[] splitedbulkCommunEmailId = bulkCommunEmailId.split(",");
			int i = 0;
			int j = 0;
			String userPassword=null;
			if (splitedbulkCommunEmailId.length > 0) {
				for (i = 0; i < splitedbulkCommunEmailId.length; i++) {
					logger.info(splitedbulkCommunEmailId[i]);
					String[] splitedbulkContactEmail = splitedbulkCommunEmailId[i].split("@");
					//logger.info(splitedbulkContactEmail[j + 1]);
					String domain = splitedbulkContactEmail[j + 1];
					logger.info("domainz:::"+domain);
					int k = 0;
					String[] splitedbulkContactEmailz = bulkContactEmail.split(",");
					if (splitedbulkContactEmailz.length > 0) {
						try {
							for (k = 0; k < splitedbulkContactEmailz.length; k++) {
								
								try {
									if(splitedbulkCommunEmailId[i].equalsIgnoreCase(splitedbulkContactEmailz[k])){
										logger.info(splitedbulkContactEmailz[k]);
										if (splitedbulkCommunEmailId[i].equalsIgnoreCase(splitedbulkContactEmailz[k])) {
											userPassword=FIINFRA_USER_MITHI_PASSWORD;
										}
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					
					// Domain name
					String szDomain=domain;
						try {
							if (szDomain.equalsIgnoreCase(SHUBHCHINTAK_DOMAIN)) {
								userPassword=SHUBHCHINTAK_USER_MITHI_PASSWORD;
							}
							else if (szDomain.equalsIgnoreCase(DFDAONLINE_DOMAIN)) {
								userPassword=DFDAONLINE_USER_MITHI_PASSWORD;
							}
							else if (szDomain.equalsIgnoreCase(SPA_DOMAIN)) {
								userPassword=SPA_USER_MITHI_PASSWORD;
							}
							else {
								userPassword= null;
								partner.setRole(i+1+"]"+ MITHI_EMAIL_CREATION_FAILED_DOMAIN+"</b>");
								lstMithiFailedContactEmails.add(partner);
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
						if(userPassword!=null){
					// Server ip
					String szServer = MITHI_SERVER;
					// Payload to add user
					String szPostMethodPayLoad=null;
					try {
						if(splitedbulkCommunEmailId[i]!=null && userPassword!=null){
						   szPostMethodPayLoad=" {'username': '"+splitedbulkCommunEmailId[i].split("@")[0]+"', 'password': '"+userPassword+"', 'usercos': 'allpopusers' }";
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					logger.info("PostMethod URL:::"+szServer + "/connectxf.ws/domain/" + szDomain + "/user");
					logger.info("PostMethod Payload:::"+szPostMethodPayLoad);
					if(szPostMethodPayLoad!=null){
					// create request entity object
					RequestEntity requestEntity = new StringRequestEntity(szPostMethodPayLoad, "application/json", "UTF-8");
					// e.g. http://localhost/connectxf.ws/domain/mykotaklife.com/user
					PostMethod post = new PostMethod(szServer + "/connectxf.ws/domain/" + szDomain + "/user");
				  
					// adding payload to post method object
					post.setRequestEntity(requestEntity);
					// add request headers viz. appkey and secretkey for authorization
					post.addRequestHeader("appkey", APP_ID_MAIL_BOX);
					post.addRequestHeader("secretkey", SECRET_KEY_MAIL_BOX);
					
					logger.info("appkey:::"+APP_ID_MAIL_BOX);
					logger.info("secretkey:::"+SECRET_KEY_MAIL_BOX);
					
					// creating httpclient
					HttpClient httpclient = new HttpClient();
					// calling add contact webservice
					// you will get http 401 Status code, if authorization failed
					iRetCode = httpclient.executeMethod(post);
					logger.info("iRetCode is-----" + iRetCode);
					stringiRetCode+=iRetCode+",";
					// get response as string
					szResponse = post.getResponseBodyAsString();
					logger.info("szResponse is-----" + szResponse);
					szResponse=szResponse.replaceAll("\"", "");
					szResponse=szResponse.replaceAll("\'", "");
					logger.info("szResponse is--II--" + szResponse);
					String res="";
					try {
						if(szResponse.contains("returncode:")){
						 String string1 = szResponse.split("cause:")[1].split(",operationmsg")[0].split("See usage")[0].split("Reason")[0];
						 String string2 = szResponse.split("cause:")[1].split(",operationmsg")[0].split("See usage")[0].split("Reason")[1].split("is")[1].split(",")[0];
						 if(szResponse.contains(SHUBHCHINTAK_DOMAIN)){
							 logger.info(string1+string2+SHUBHCHINTAK_DOMAIN +". "+ MITHI_ERROR_MESSAGE);
							 res= string1+string2+SHUBHCHINTAK_DOMAIN +". "+ MITHI_ERROR_MESSAGE;
						}
						 if(szResponse.contains(DFDAONLINE_DOMAIN)){
							 logger.info(string1+string2+DFDAONLINE_DOMAIN +". "+ MITHI_ERROR_MESSAGE);
							 res= string1+string2+DFDAONLINE_DOMAIN +". "+ MITHI_ERROR_MESSAGE;
						}
						 if(szResponse.contains(SPA_DOMAIN)){
							 logger.info(string1+string2+SPA_DOMAIN +". "+ MITHI_ERROR_MESSAGE);
							 res= string1+string2+SPA_DOMAIN +". "+ MITHI_ERROR_MESSAGE;
						}
						 partner.setRole(i+1+"] "+res);
						 lstMithiFailedContactEmails.add(partner);
						 partner= new Partner();
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					try {
						if(szResponse.contains("description")){
							szResponse=szResponse.replaceAll("\"", "\'");
							szResponse=szResponse.split("</u>")[1].split("<u>")[1];
						partner.setRole(i+1+"]"+MITHI_AUTH_FAILED+szResponse+"</b>");
						lstMithiFailedContactEmails.add(partner);
						partner= new Partner();
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					}
				}
			}
			}
			
		   }catch (Exception e) {e.printStackTrace();}
		   /*finally{bulkCommunEmailId="";bulkContactEmail="";}*/
		
		
		/*	-----------------------------------------end-contact email creation on mithi-----------------------------------------------------------	*/
		
		
/*	-----------------------------------------start-alternate email setting on mithi-----------------------------------------------------------	*/
		
		try {
			String[] splitedbulkCommunEmailId = bulkCommunEmailId.split(",");
			int i = 0;
			int j = 0;
			String userPassword=null;
			String szServer="";
			  String szUser = "" ;
			if (splitedbulkCommunEmailId.length > 0) {
				for (i = 0; i < splitedbulkCommunEmailId.length; i++) {
					logger.info(splitedbulkCommunEmailId[i]);
					String[] splitedbulkContactEmail = splitedbulkCommunEmailId[i].split("@");

					logger.info(splitedbulkContactEmail[j + 1]);
					String domain = splitedbulkContactEmail[j + 1];
					logger.info("bulk alternate email domainz:::"+domain);
					String szPostMethodPayLoad=null;
					// Domain name
					String szDomain=domain;
						try {
							if (szDomain.equalsIgnoreCase(SHUBHCHINTAK_DOMAIN)) {
								userPassword=SHUBHCHINTAK_USER_MITHI_PASSWORD;
							}
							if (szDomain.equalsIgnoreCase(DFDAONLINE_DOMAIN)) {
								userPassword=DFDAONLINE_USER_MITHI_PASSWORD;
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					//int k = 0;
					String[] splitedbulkContactEmailz = bulkContactEmail.split(",");
					if (splitedbulkContactEmailz.length > 0) {
						try {
							for (int k = i; k < splitedbulkContactEmailz.length; k++) {
								
								try {
									// Server ip
									 szServer = MITHI_SERVER;
									// Payload to add user
									try {
										if(splitedbulkCommunEmailId[i].equalsIgnoreCase(splitedbulkContactEmailz[k])){
											logger.info(splitedbulkContactEmailz[k]);
											if (splitedbulkCommunEmailId[i].equalsIgnoreCase(splitedbulkContactEmailz[k])) {
												userPassword=FIINFRA_USER_MITHI_PASSWORD;
											}
										}
									} catch (Exception e) {
										e.printStackTrace();
									}

									try {
										if(splitedbulkContactEmailz[k]!=null && userPassword!=null){
											szUser=splitedbulkContactEmail[0];
											szPostMethodPayLoad=" {'alternateemailaddress':'"+splitedbulkContactEmailz[k]+"'}";
				
											logger.info("bulk alternate email PutMethod URL:::"+szServer + "/connectxf.ws/domain/" + szDomain + "/user/"+szUser);
											logger.info("bulk alternate email PutMethod Payload:::"+szPostMethodPayLoad);
											try {
												if(szPostMethodPayLoad!=null){
												// create request entity object
												RequestEntity requestEntity = new StringRequestEntity(szPostMethodPayLoad, "application/json", "UTF-8");
												// e.g. http://localhost/connectxf.ws/domain/mykotaklife.com/user
												PutMethod put = new PutMethod(szServer + "/connectxf.ws/domain/" + szDomain + "/user/"+szUser);
						
												// adding payload to post method object
												put.setRequestEntity(requestEntity);
												// add request headers viz. appkey and secretkey for authorization
												put.addRequestHeader("appkey", APP_ID_MAIL_BOX);
												put.addRequestHeader("secretkey", SECRET_KEY_MAIL_BOX);
												
												logger.info("bulk alternate email appkey:::"+APP_ID_MAIL_BOX);
												logger.info("bulk alternate email secretkey:::"+SECRET_KEY_MAIL_BOX);
												
												// creating httpclient
												HttpClient httpclient = new HttpClient();
												// calling add contact webservice
												// you will get http 401 Status code, if authorization failed
												iRetCode = httpclient.executeMethod(put);
												logger.info("bulk alternate email iRetCode is-----" + iRetCode);
												// get response as string
												szResponse = put.getResponseBodyAsString();
												logger.info("bulk alternate email szResponse is-----" + szResponse); 
																								
												}
											} catch (Exception e) {
												e.printStackTrace();
											}
											break;
											
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
					
								} catch (Exception e) {
									e.printStackTrace();
								}
								
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}

				}
			}
			
		   }catch (Exception e) {e.printStackTrace();}
		   finally{bulkCommunEmailId="";bulkContactEmail="";}
		
		
		
		/*	-----------------------------------------end-alternate email setting on mithi-----------------------------------------------------------	*/
		
		
		
		
		if(lstExistingPartner.isEmpty()){
			lstExistingPartner=prtnrList.get(1);
		}
		
		if(lstFailedPartner.isEmpty()){
			lstFailedPartner=prtnrList.get(2);
		}
			
		logger.info("lstSuccessPartner....."+lstSuccessPartner);
		logger.info("lstExistingPartner----"+lstExistingPartner);
		logger.info("lstFailedPartner---"+lstFailedPartner);
		

		out = response.getWriter();
		response.setContentType("application/json");
		
	    /*	--------------------------------------------------------------------------------------------------------- */
		try {
			FiinfraUtility.doAudit(partyId,userId, FiinfraConstants.EVENT_BULK_UPLOAD_PARNER_SRP, FiinfraConstants.SERVICE_PORTAL, FiinfraConstants.SRP_SOURCE_MODULE_PARTNER, FiinfraConstants.SRP_BULK_UPLOAD_PARTNER,"SP="+FiinfraConstants.SP_BULK_UPLOAD_FOR_PARTNER,OBJECT_STRING);
		} catch (Exception e) {
			e.printStackTrace();
		}
     /*	--------------------------------------------------------------------------------------------------------- */
		
		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
		
		int buid = userSession.getBuId();
	    int userid = userSession.getUserId();
		request.setAttribute("isopen", "1");
		
		url = URL_GET_PARTNER_LIST+"ramu"+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buid+"");
		uriCB.queryParam("userId", userid+"");
		uriCB.queryParam("searchText", searchTextVal);
		
	
	ModelAndView mav = new ModelAndView("partner/PartnerList");
	mav.addObject("lstSuccessPartner", objectMapper.writeValueAsString(lstSuccessPartner));
	mav.addObject("lstExistingPartner", objectMapper.writeValueAsString(lstExistingPartner));
	mav.addObject("lstFailedPartner", objectMapper.writeValueAsString(lstFailedPartner));
	mav.addObject("lstMithiFailedContactEmails", objectMapper.writeValueAsString(lstMithiFailedContactEmails));
	mav.addObject("partnerData", objectMapper.writeValueAsString(null));
	
	
	//mav.addObject("lstSuccessPartner", lstSuccessPartner);
	//mav.addObject("partnerData", null);
	/*mav.addObject("lstExistingPartner", lstExistingPartner);
	mav.addObject("lstFailedPartner", lstFailedPartner);
	mav.addObject("lstMithiFailedContactEmails", lstMithiFailedContactEmails);*/
	
	szResponse="";
	return mav;

}

public List<Partner> readXls() throws IOException, BiffException{
	List<Partner> lstToCreatePartner = new ArrayList<Partner>();
	logger.info("In Read XLS Method");
		
	MultipartFile bulkUploadFile= partner.getLeadUpload();		
	logger.info("File IN ReadXLs------------"+bulkUploadFile);
	int ownerPartyId=Integer.parseInt(partner.getOwnerPartyId());
	logger.info("ownerPartyId------------"+ownerPartyId);
	int buId=Integer.parseInt(partner.getBuId());
	logger.info("Buid---------"+buId);
	
	int userId=Integer.parseInt(partner.getUserId());
	logger.info("userId---------"+userId);
	
	Workbook workbook=null;
	if(bulkUploadFile.getInputStream()!=null){
	    workbook = Workbook.getWorkbook(bulkUploadFile.getInputStream());
	
	logger.info("File Read XLS Method"+workbook);
	logger.info("----Num of Sheets----   "+workbook.getNumberOfSheets());
	
	int numOfSheets = 0;
	int numOfRows = 1;
	
	Sheet sheet=workbook.getSheet(numOfSheets);
	
	logger.info("No of rows -----------"+sheet.getRows());
	logger.info("No of Columns-----------"+sheet.getColumns());
	logger.info("No of rows........-------"+sheet.getRows());
	logger.info("No of Columns-------"+sheet.getColumns());
	while(numOfRows < sheet.getRows())
	{
		try{		
		partner=new Partner();
		Cell cell1 = sheet.getCell(0, numOfRows);
		Cell cell2 = sheet.getCell(1, numOfRows);
		Cell cell3 = sheet.getCell(2, numOfRows);
		Cell cell4 = sheet.getCell(3, numOfRows);
		Cell cell5 = sheet.getCell(4, numOfRows);
		Cell cell6 = sheet.getCell(5, numOfRows);
		Cell cell7 = sheet.getCell(6, numOfRows);
		
		Cell cell8 = sheet.getCell(7, numOfRows);
		Cell cell9 = sheet.getCell(8, numOfRows);
		Cell cell10 = sheet.getCell(9, numOfRows);
		Cell cell11 = sheet.getCell(10, numOfRows);
		Cell cell12 = sheet.getCell(11, numOfRows);
		Cell cell13 = sheet.getCell(12, numOfRows);
		Cell cell14 = sheet.getCell(13, numOfRows);
		
		String cell1Content = cell1.getContents();
		String cell2Content = cell2.getContents();
		String cell3Content = cell3.getContents();
		String cell4Content = cell4.getContents();
		String cell5Content = cell5.getContents();
		String cell6Content = cell6.getContents();
		String cell7Content = cell7.getContents();
		
		String cell8Content = cell8.getContents();
		String cell9Content = cell9.getContents();
		String cell10Content = cell10.getContents();
		String cell11Content = cell11.getContents();
		String cell12Content = cell12.getContents();
		String cell13Content = cell13.getContents();
		String cell14Content = cell14.getContents();
		
		
		logger.info(" FirstName	 LastName	Login Name	Alternate Email	Contact Mobile	ARN  PST  PKT  POT  Location  RM  RMHead  Contact Email    EUIN");
		logger.info(cell1Content + "  " + cell2Content + "  "
				+ cell3Content + "  " + cell4Content + "  "
				+ cell5Content + "  " + cell6Content + "  "
				+ cell7Content + "  "+ cell8Content + "  "+ cell9Content + "  "+ cell10Content + "  "+ cell11Content + "  "+ cell12Content + "  "+ cell13Content + "  "+ cell14Content+ "  ");
		
		try{
			
			if(cell1Content!=null && cell1Content!=""){
			partner.setFirstName(cell1Content.trim());
			}else{cell1Content="";partner.setFirstName("");}
			
			if(cell2Content!=null && cell2Content!=""){
			partner.setLastName(cell2Content.trim());
			}else{cell2Content="";partner.setLastName("");}
			
			if(cell3Content!=null && cell3Content!=""){
				cell3Content = cell3Content.replaceAll(" ","");
			partner.setLoginName(cell3Content.trim());
			}else{cell3Content="";partner.setLoginName("");}
			
			if(cell4Content!=null && cell4Content!=""){
				cell4Content = cell4Content.replaceAll(" ","");
			partner.setContactEmail(cell4Content.trim());
			}else{cell4Content="";partner.setContactEmail("");}
			
			if(cell5Content!=null && cell5Content!=""){
			partner.setContactMobile(cell5Content.trim());
			}else{cell5Content="";partner.setContactMobile("");}
			
			if(cell6Content!=null && cell6Content!=""){
		    partner.setArn(cell6Content.trim());
			}else{cell6Content="";partner.setArn("");}
			if(cell7Content!=null && cell7Content!=""){
		    partner.setPstName(cell7Content.trim());
			}else{cell7Content="";partner.setPstName("");}
			
			if(cell8Content!=null && cell8Content!=""){
			    partner.setPktName(cell8Content.trim());
			}else{cell8Content="";partner.setPktName("");}
			
			if(cell9Content!=null && cell9Content!=""){
			    partner.setPotName(cell9Content.trim());
			}else{cell9Content="";partner.setPotName("");}
			
			if(cell10Content!=null && cell10Content!=""){
			    partner.setLocation(cell10Content.trim());
			}else{cell10Content="";partner.setLocation("");}
			
			if(cell11Content!=null && cell11Content!=""){
			    partner.setRmName(cell11Content.trim());
			}else{cell11Content="";partner.setRmName("");}
			
			if(cell12Content!=null && cell12Content!=""){
			    partner.setRmHeadName(cell12Content.trim());
			}else{cell12Content="";partner.setRmHeadName("");}
			
			if(cell13Content!=null && cell13Content!=""){
				cell13Content = cell13Content.replaceAll(" ","");
			    partner.setCommunicationEmailId(cell13Content.trim());
			}else{cell13Content="";partner.setCommunicationEmailId("");}
			
			
			if(cell14Content!=null && cell14Content!=""){
				//cell14Content = cell14Content.replaceAll(" ","");
			    partner.setEuin(cell14Content.trim());
			}else{cell14Content="";partner.setEuin("");}
			
			
			partner.setOwnerPartyId(ownerPartyId+"");
			partner.setBuId(buId+"");
			partner.setUserId(userId+"");
			
		
			logger.info("cell2Content.trim():--"
				+ cell2Content.trim());
		
		String regex = "[0-9]+"; 
		String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
		//if((!cell2Content.trim().equals("")  || cell2Content.trim() != null) && (!cell3Content.trim().equals("") || cell3Content.trim() != null) && (!cell4Content.trim().equals("") || cell4Content.trim() != null)  && (!cell6Content.trim().equals("")|| cell6Content.trim() != null) && cell6Content.length()<=10){
		if((!cell2Content.trim().equals("")) && (!cell3Content.trim().equals("")) && (!cell4Content.trim().equals("")) && (cell4Content.matches(EMAIL_REGEX)==true)  && (!cell6Content.trim().equals("")) && (cell6Content.length()<=10) && (cell6Content.matches(regex)==true) && (cell13Content.matches(EMAIL_REGEX)==true) && (!cell13Content.trim().equals(""))){
			lstToCreatePartner.add(partner);
		} else {
			lstFailedPartner.add(partner);
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		numOfRows++;
	}
}
	logger.info("lstFailedPartner Size is:-------"+lstFailedPartner.size());
	logger.info("lstToCreatePartner Size is "+lstToCreatePartner.size());
	
	return lstToCreatePartner;
}





public List<Partner> readXlsx() throws FileNotFoundException, IOException, InvalidFormatException {
	List<Partner> lstToCreatePartner = new ArrayList<Partner>();
	logger.info("In Read XLSX Method");
	
	MultipartFile bulkUploadFile= partner.getLeadUpload();
	int ownerPartyId=Integer.parseInt(partner.getOwnerPartyId());
	int buId=Integer.parseInt(partner.getBuId());
	int userId=Integer.parseInt(partner.getUserId());
	logger.info("userId---------"+userId);
		
	/*XSSFWorkbook workbook = new XSSFWorkbook(bulkUploadFile.getInputStream());*/
	
	org.apache.poi.ss.usermodel.Workbook workbook = WorkbookFactory.create(bulkUploadFile.getInputStream());
	
	//int numOfSheets = 0;
	/*List<Partner> lstFailedPartner = new ArrayList<Partner>();*/
	
	/*XSSFSheet sheet;
	sheet = workbook.getSheetAt(numOfSheets);*/
	org.apache.poi.ss.usermodel.Sheet sheet = workbook.getSheetAt(0);
	int numRow = 1;

	/*XSSFRow rowIndex;*/
	org.apache.poi.ss.usermodel.Row rowIndex;
	
	while (numRow <= sheet.getLastRowNum()) {
       
		rowIndex = sheet.getRow(numRow);
		int numCol = 0;
		try {
			// while (numCol < 3) {
			org.apache.poi.ss.usermodel.Cell cellIndex1 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex2 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex3 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex4 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex5 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex6 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex7 = rowIndex.getCell(numCol);
			numCol++;
			
			org.apache.poi.ss.usermodel.Cell cellIndex8 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex9 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex10 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex11 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex12 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex13 = rowIndex.getCell(numCol);
			numCol++;
			org.apache.poi.ss.usermodel.Cell cellIndex14 = rowIndex.getCell(numCol);
			numCol++;
							
			String cell1Content = null;
			String cell2Content = null;
			String cell3Content = null;
			String cell4Content = null;
			String cell5Content = null;
			String cell6Content = null;
			String cell7Content =null;
			
			String cell8Content =null;
			String cell9Content =null;
			String cell10Content =null;
			String cell11Content =null;
			String cell12Content =null;
			String cell13Content =null;
			String cell14Content =null;
			
			
			try{
				cell1Content = cellIndex1.toString();
			}catch(Exception e){cell1Content="";}
			try{
				cell2Content = cellIndex2.toString();
			}catch(Exception e){
				cell2Content="";
			}
			try{
				cell3Content = cellIndex3.toString();
				cell3Content = cell3Content.replaceAll(" ","");
			}catch(Exception e){cell3Content="";}
			try{
				cell4Content = cellIndex4.toString();
				cell4Content = cell4Content.replaceAll(" ","");

			}catch(Exception e){cell4Content="";}
			try{
				cellIndex5.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING);
				cell5Content = cellIndex5.toString();
			}catch(Exception e){cell5Content="";}
			try{
				cell6Content = cellIndex6.toString();
			}catch(Exception e){
				cell6Content="";
			}
			try{
				cell7Content = cellIndex7.toString();
			}catch(Exception e){cell7Content="";}
			
			
			try{
				cell8Content = cellIndex8.toString();
			}catch(Exception e){cell8Content="";}
			try{
				cell9Content = cellIndex9.toString();
			}catch(Exception e){cell9Content="";}
			try{
				cell10Content = cellIndex10.toString();
			}catch(Exception e){cell10Content="";}
			try{
				cell11Content = cellIndex11.toString();
			}catch(Exception e){cell11Content="";}
			try{
				cell12Content = cellIndex12.toString();
			}catch(Exception e){cell12Content="";}
			
			try{
				cell13Content = cellIndex13.toString();
				cell13Content = cell13Content.replaceAll(" ","");

				
			}catch(Exception e){cell13Content="";}
			
			try{
				cell14Content = cellIndex14.toString();
			}catch(Exception e){cell14Content="";}
			
			
			logger.info(" FirstName	 LastName	Login Name	 Alternate Email	Contact Mobile	 ARN   PST  PKT  POT  Location  RM  RMHead  Contact Email");
			logger.info(cell1Content + "  " + cell2Content + "  "
					+ cell3Content + "  " + cell4Content + "  "
					+ cell5Content + "  " + cell6Content + "  "
					+ cell7Content + "  "+ cell8Content + "  "+ cell9Content + "  "+ cell10Content + "  "+ cell11Content + "  "+ cell12Content + "  "+ cell13Content + "  "+ cell14Content + "  ");
			
			
			Partner partner = new Partner();
			try{
				if(cell1Content!=null && cell1Content!=""){
				partner.setFirstName(cell1Content.trim());
				}else{partner.setFirstName("");}
				if(cell2Content!=null && cell2Content!=""){
				partner.setLastName(cell2Content.trim());
				}
				if(cell3Content!=null && cell3Content!=""){
				partner.setLoginName(cell3Content.trim());
				}
				
				
				if(cell4Content!=null && cell4Content!=""){
				partner.setContactEmail(cell4Content.trim());
				}
				
				if(cell5Content!=null && cell5Content!=""){
				partner.setContactMobile(String.valueOf(cell5Content.trim()));
				}else{partner.setContactMobile("");}
				if(cell6Content!=null && cell6Content!=""){
			    partner.setArn(cell6Content.trim());
				}
				if(cell7Content!=null && cell7Content!=""){
			    partner.setPstName(cell7Content.trim());
				}else{partner.setPstName("");}
				
				
				
				if(cell8Content!=null && cell8Content!=""){
				    partner.setPktName(cell8Content.trim());
				}else{partner.setPktName("");}
				if(cell9Content!=null && cell9Content!=""){
				    partner.setPotName(cell9Content.trim());
				}else{partner.setPotName("");}
				if(cell10Content!=null && cell10Content!=""){
				    partner.setLocation(cell10Content.trim());
				}else{partner.setLocation("");}
				if(cell11Content!=null && cell11Content!=""){
				    partner.setRmName(cell11Content.trim());
				}else{partner.setRmName("");}
				
				if(cell12Content!=null && cell12Content!=""){
				    partner.setRmHeadName(cell12Content.trim());
				}else{partner.setRmHeadName("");}
				
				if(cell13Content!=null && cell13Content!=""){
				    partner.setCommunicationEmailId(cell13Content.trim());
				}else{partner.setCommunicationEmailId("");}
					
				if(cell14Content!=null && cell14Content!=""){
				    partner.setEuin(cell14Content.trim());
					}else{partner.setEuin("");}
				
				
			    partner.setOwnerPartyId(ownerPartyId+"");
			    partner.setBuId(buId+"");
			    partner.setUserId(userId+"");
			   			
			logger.info("cell2Content.trim():--"
					+ cell2Content.trim());
			
			String regex = "[0-9]+"; 
			String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
			//if((!cell2Content.trim().equals("")  || cell2Content.trim() != null) && (!cell3Content.trim().equals("") || cell3Content.trim() != null) && (!cell4Content.trim().equals("") || cell4Content.trim() != null)  && (!cell6Content.trim().equals("")|| cell6Content.trim() != null) && cell6Content.length()<=10){
			if((!cell2Content.trim().equals("")) && (!cell3Content.trim().equals("")) && (!cell4Content.trim().equals("")) && (cell4Content.matches(EMAIL_REGEX)==true)  && (!cell6Content.trim().equals("")) && (cell6Content.length()<=10) && (cell6Content.matches(regex)==true) && (cell13Content.matches(EMAIL_REGEX)==true) && (!cell13Content.trim().equals(""))){
				lstToCreatePartner.add(partner);
			} else {
				lstFailedPartner.add(partner);
			}
			
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		numRow++;
	}
	//partner=new Partner();
	logger.info("lstToCreatePartner Size is:--"+lstFailedPartner.size());
	
	return lstToCreatePartner;
}


public void partnerExcel(HttpServletRequest request, HttpServletResponse response) {

	  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
	  try{
	  
	   if(userSession == null) {
	   response.sendRedirect("/login");
	   return ;
	  }
	   String userToken = null;
		if(userSession.getUserName()!=null){
			userToken = userSession.getUserName();
		}
		else{
			userToken = "abc";
		}
	   
	   String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

	  //TODO change hard coding
	  Integer advisorPartyId = userSession.getPartyId(); //6326
	  int buid = userSession.getBuId();
	    int userid = userSession.getUserId();
	  String token = "153443";
	  url = URL_GET_PARTNER_LIST+"ramu"+"/1234";
	  //UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(URL_GET_FAQ_LIST + "/"+userSession.getUserName()+"/" + advisorPartyId + "/"+token+"&buId="+buId);
	  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	  BaseResponse<Partner> baseResponse = new BaseResponse<Partner>();
	   Partner partnerVo = new Partner();
	   partnerVo.setSearchText(searchTextVal);
	   partnerVo.setBuId(buid+"");
	   partnerVo.setUserId(userid+"");  
	   
		  url = URL_GET_PARTNER_LIST + userToken + "/1234"; 
		  baseResponse = restTemplate.postForObject(url, partnerVo, BaseResponse.class); 
		 
		  List<Partner> faqListAsJson = new ArrayList<Partner>();
		  List<Partner> faqList = new ArrayList<Partner>();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   faqListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<faqListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   Partner faqList2;
				   faqList2 = objectMapper.readValue(objectMapper.writeValueAsString(faqListAsJson.get(i)), Partner.class);
									
					
				   faqList.add(faqList2);
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
	  
	  
	  
	   response.addHeader("Content-Disposition", "attachment;filename=PartnerList.xls");
	   
	        
	   PrintWriter writer = response.getWriter();
	   writer.print(CommonUtils.escape("Partner Name"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("City"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Email Id"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Contact No"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("ARN No"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Allocated PST"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Allocated POT"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Allocated PKT"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Allocated RM"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Allocated RM Head"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape( "Managed Entities"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape( "Category"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape( "Subscription Package"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape( "Subscription Status"));
	   
	   writer.println();
	   for(Partner list:faqList){
		   
			    
	   
	    writer.print(CommonUtils.escape(list.getFirstName()+" "+list.getLastName()));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getLocation()));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getContactEmail()));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getContactMobile()));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getArn()));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getPstName()));
	    writer.print("\t"); 
	    writer.print(CommonUtils.escape(list.getPotName()));
	    writer.print("\t"); 
	    writer.print(CommonUtils.escape(list.getPktName()));
	    writer.print("\t"); 
	    writer.print(CommonUtils.escape(list.getRmName()));
	    writer.print("\t"); 
	    writer.print(CommonUtils.escape(list.getRmHeadName()));
	    writer.print("\t"); 
	    writer.print(CommonUtils.escape("#Opp : "+list.getOpp()+"   "+"#Client : "+list.getClient()+"   "+"#PClient : "+list.getPclient()));
	    writer.print("\t"); 
	    writer.print(CommonUtils.escape(list.getCategory()));
	    writer.print("\t"); 
	    writer.print(CommonUtils.escape(list.getSubscriptionPackage()));
	    writer.print("\t"); 
	    writer.print(CommonUtils.escape(list.getSubscriptionStatus()));
	    
	    writer.println();
	   }
	       
	  } catch (IOException e) {
	      e.printStackTrace();
	  }
	 }
	 

//@RequestMapping(value = "/task/csv", method = RequestMethod.GET)
public void partnerCSV(HttpServletRequest request, HttpServletResponse response) {

UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
try{

if(userSession == null) {
response.sendRedirect("/login");
return ;
} 

String userToken = null;
	if(userSession.getUserName()!=null){
		userToken = userSession.getUserName();
	}
	else{
		userToken = "abc";
	}

String searchTextVal = null;
	if (request.getParameterMap().containsKey("searchtext")) {
		searchTextVal = request.getParameter("searchtext").trim();
	} else {
		searchTextVal = "";
	}
//TODO change hard coding
Integer advisorPartyId = userSession.getPartyId(); //6326
int buid = userSession.getBuId();
int userid = userSession.getUserId();
String token = "153443";
url = URL_GET_PARTNER_LIST+"ramu"+"/1234";
//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(URL_GET_FAQ_LIST + "/"+userSession.getUserName()+"/" + advisorPartyId + "/"+token+"&buId="+buId);
UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

	   BaseResponse<Partner> baseResponse = new BaseResponse<Partner>();
	   Partner partnerVo = new Partner();
	   partnerVo.setSearchText(searchTextVal);
	   partnerVo.setBuId(buid+"");
	   partnerVo.setUserId(userid+"");  
	   
		  url = URL_GET_PARTNER_LIST + userToken + "/1234"; 
		  baseResponse = restTemplate.postForObject(url, partnerVo, BaseResponse.class); 
		 
		  List<Partner> faqListAsJson = new ArrayList<Partner>();
		  List<Partner> faqList = new ArrayList<Partner>();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   faqListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<faqListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   Partner faqList2;
				   faqList2 = objectMapper.readValue(objectMapper.writeValueAsString(faqListAsJson.get(i)), Partner.class);
									
					
				    faqList.add(faqList2);
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



response.addHeader("Content-Disposition", "attachment;filename=PartnerList.csv");

PrintWriter writer = response.getWriter();
writer.print(CommonUtils.escape("Partner Name"));
writer.print(",");
writer.print(CommonUtils.escape("City"));
writer.print(",");
writer.print(CommonUtils.escape("Email Id"));
writer.print(",");
writer.print(CommonUtils.escape("Contact No"));
writer.print(",");
writer.print(CommonUtils.escape("ARN No"));
writer.print(",");
writer.print(CommonUtils.escape("Allocated PST"));
writer.print(",");
writer.print(CommonUtils.escape("Allocated POT"));
writer.print(",");
writer.print(CommonUtils.escape("Allocated PKT"));
writer.print(",");
writer.print(CommonUtils.escape("Allocated RM "));
writer.print(",");
writer.print(CommonUtils.escape("Allocated RM Head"));
writer.print(",");
writer.print(CommonUtils.escape( "Managed Entities"));
writer.print("\t");
writer.print(CommonUtils.escape( "Category"));
writer.print("\t");
writer.print(CommonUtils.escape( "Subscription Package"));
writer.print("\t");
writer.print(CommonUtils.escape( "Subscription Status"));

writer.println();

for(Partner list:faqList)
{
	   
		    

writer.print(CommonUtils.escape(list.getFirstName()+" "+list.getLastName()));
writer.print(",");
writer.print(CommonUtils.escape(list.getLocation()));
writer.print(",");
writer.print(CommonUtils.escape(list.getContactEmail()));
writer.print(",");
writer.print(CommonUtils.escape(list.getContactMobile()));
writer.print(",");
writer.print(CommonUtils.escape(list.getArn()));
writer.print(",");
writer.print(CommonUtils.escape(list.getPstName()));
writer.print(","); 
writer.print(CommonUtils.escape(list.getPotName()));
writer.print(","); 
writer.print(CommonUtils.escape(list.getPktName()));
writer.print(","); 
writer.print(CommonUtils.escape(list.getRmName()));
writer.print(","); 
writer.print(CommonUtils.escape(list.getRmHeadName()));
writer.print(","); 
writer.print(CommonUtils.escape("#Opp : "+list.getOpp()+"   "+"#Client : "+list.getClient()+"   "+"#PClient : "+list.getPclient()));
writer.print(","); 
writer.print(CommonUtils.escape(list.getCategory()));
writer.print(","); 
writer.print(CommonUtils.escape(list.getSubscriptionPackage()));
writer.print(","); 
writer.print(CommonUtils.escape(list.getSubscriptionStatus()));


writer.println();


}
   
} catch (IOException e) {
  e.printStackTrace();
}
}

private String getPartnerToInsertXmlString(List<Partner> lstToCreatePartner) {
	logger.info("lstToCreatePartner-----s"+lstToCreatePartner);
	if (lstToCreatePartner.size() > 0) {
		StringBuilder sb = new StringBuilder("<root>");
		Iterator<Partner> it = lstToCreatePartner.iterator();
		
		
		while (it.hasNext()) {
			Partner partnerData = it.next();	
			int noOfCAPSAlpha = 1;
			int noOfDigits = 1;
			int noOfSplChars = 1;
			int minLen = 8;
			int maxLen = 15;
			
			String hexString = null;
			char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
						noOfCAPSAlpha, noOfDigits, noOfSplChars);
			hexString = new String(pswd);
			logger.info("hexString is-----" + hexString);
			hexStringzz.put(partnerData.getLoginName(),hexString);
	
			MD5Encryption md5Encryption = new MD5Encryption();
			String encryptrdPassword = md5Encryption.encrypt(hexString);
			
	//	String encryptrdPassword = passwordEncoder.encodePassword(hexString, null);
			
	
			
			/*partner.seteNCPassword(encryptrdPassword);*/
			sb.append("<Partner>");
			sb.append("<FirstName><![CDATA[" + partnerData.getFirstName() + "]]></FirstName>");
			sb.append("<LastName><![CDATA[" + partnerData.getLastName() + "]]></LastName>");
			sb.append("<LoginName><![CDATA[" + partnerData.getLoginName() + "]]></LoginName>");
			sb.append("<userPassword><![CDATA[" + encryptrdPassword + "]]></userPassword>");
			sb.append("<ContactEmail><![CDATA[" + partnerData.getContactEmail() + "]]></ContactEmail>");
			sb.append("<ContactMobile><![CDATA[" + partnerData.getContactMobile() + "]]></ContactMobile>");
			sb.append("<ARN><![CDATA[" + partnerData.getArn() + "]]></ARN>");	
			sb.append("<PST><![CDATA[" + partnerData.getPstName() + "]]></PST>");
			sb.append("<PKT><![CDATA[" + partnerData.getPktName() + "]]></PKT>");
			sb.append("<POT><![CDATA[" + partnerData.getPotName() + "]]></POT>");
			sb.append("<RM><![CDATA[" + partnerData.getRmName() + "]]></RM>");
			sb.append("<RMHEAD><![CDATA[" + partnerData.getRmHeadName() + "]]></RMHEAD>");
			sb.append("<Location><![CDATA[" + partnerData.getLocation() + "]]></Location>");
			sb.append("<UserId>" + partner.getUserId() + "</UserId>");
			sb.append("<ownerPartyId>" + partnerData.getOwnerPartyId() + "</ownerPartyId>");
			sb.append("<buId>" + partnerData.getBuId() + "</buId>");
			sb.append("<communicationEmailId>" + partnerData.getCommunicationEmailId() + "</communicationEmailId>");
			sb.append("<EUIN>" + partnerData.getEuin() + "</EUIN>");
			sb.append("</Partner>");
			/*bulkCommunEmailId+=partnerData.getCommunicationEmailId()+",";
			bulkContactEmail+=partnerData.getContactEmail()+",";*/
		 }
		sb.append("</root>");
		logger.info("SB---"+sb);
		logger.info("SB.toString()---"+sb.toString());
		return sb.toString();
	}
	  return null;
}

/**
 * Downloads the document
 * @param request
 * @param response
 * @throws IOException
 */

public void downloadAttachmentDownload(HttpServletRequest request,
		HttpServletResponse response) throws IOException{
	logger.info("URL --> " + url);
	logger.info("In downloadAttachmentDownload");
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	logger.info("USERNAME( --> " + userSession.getUserName());
	String path= request.getSession().getServletContext()
			.getRealPath("/")+"/PartnerBulkUploadTemplate.xls";
	/*String path= "E:\\PartnerBulkUploadTemplate.xls";*/
	
	InputStream file = new FileInputStream(new File(path));
	logger.info("file:----"+file.available());
    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition","attachment; filename=\"PartnerBulkUploadTemplate.xls\"");
    FileCopyUtils.copy(file, response.getOutputStream());
}

public String downloadAttachmentDownload1(HttpServletRequest request,
		HttpServletResponse response) throws IOException{
	
	try {    
		logger.info("URL --> " + url);
		logger.info("In downloadAttachmentDownload");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info("USERNAME --> " + userSession.getUserName());
		 
		String realPath = request.getParameter("filepath"); 
		//String path= request.getSession().getServletContext().getRealPath("/")+realPath;  
		String path= realPath; 
		String filename = request.getParameter("fileName");
		    
	//	realPath="D:\Ffreedom-DI\Attachments\Task\1655\sai ram_1412750450278.txt";
		
		String extension = null;
		extension = filename.substring(filename.lastIndexOf("."));  
		logger.info("extension is:--" + extension);
		 
		InputStream file = new FileInputStream(new File(path));     
		logger.info("file:----"+file.available());  
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition","attachment; filename=\"" +filename+extension+"\"");     
		FileCopyUtils.copy(file, response.getOutputStream());
	} catch (Exception e) { 
		// TODO Auto-generated catch block 
		
		return "redirect:/partnersp/getTaskList.htm";   

	}        
	return "";   
}


//

@SuppressWarnings("unchecked")
public void getTaskDetails(HttpServletRequest request,
		HttpServletResponse response) throws JsonGenerationException,
		JsonMappingException, IOException, IllegalAccessException,
		InvocationTargetException {
	Integer TaskId = Integer.parseInt(request.getParameter("taskId").toString());
	
	
	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int partyId = userSession.getPartyId();
	int buId = userSession.getBuId();
	
	


	url = URL_GET_TASK_RECORD + "abx"+ "/" + TaskId
			+ "/1234";
	logger.info("url:-" + url);
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	// uriCB.queryParam("partyId", partyId);
	uriCB.queryParam("buId", buId);
	BaseResponse<Task> br = new BaseResponse<Task>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
			BaseResponse.class).getBody();
	Task taskData = new Task();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		taskData = objectMapper.readValue(
				objectMapper.writeValueAsString(br.getResponseObject()),
				Task.class);
	taskData.setId(TaskId);

	java.sql.Timestamp t = taskData.getDueDateTime();
	java.sql.Timestamp t1 = taskData.getCompletionDateTime();
	
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH-mm-ss");
	
	
	
	String dueDate="NA";
	if(t!=null)
	{
	 dueDate = sdf.format(t.getTime());
	}
	String complDate = "NA";
	if(t1 !=null)
	complDate = sdf.format(t1.getTime());
	//System.out.println("Current date in String Format: " + dueDate);

	taskData.setDueDateTimeString(dueDate);
	taskData.setCompletionDateTimeString(complDate);

	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, taskData);
}

public void getAllocatedTeamMembers(HttpServletRequest request,
		HttpServletResponse response) throws IOException{
	//System.out.println("URL --> " + url);
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	url = URL_GET_ALLOCATED_TEAMMEMBER_LIST+userSession.getUserName()+"/1234";
	int buId=userSession.getBuId();
	int partyId=userSession.getPartyId();
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("buId",buId);
	uriCB.queryParam("partyId",partyId);
//	DocumentData documentData=(DocumentData) FiinfraUtility.postRequest(uriCB,DocumentData.class,restTemplate);
	BaseResponse<PartyData> br = new BaseResponse<PartyData>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	PartyData partyData=new PartyData();
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
//		partyData=<>br.getResponseObject();
		partyData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), PartyData.class);
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, partyData);
}



/**
 * save the task details
 * 
 * @param request
 * @param response
 * @param queryData
 * @return
 * @throws Exception
 */
@SuppressWarnings("unchecked")
public ModelAndView saveTask(HttpServletRequest request,HttpServletResponse response, Task taskData) throws Exception {
	
	
	
	Integer isclose=0;
	
	isclose=taskData.getTaskIsClose();
	
	String result = FiinfraConstants.FAIL;
	request.getSession().setAttribute("TaskResult", result);
	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int createdBy = userSession.getUserId();
	int taskOwner = userSession.getPartyId();
	int buId = userSession.getBuId();

	int taskId = Integer.parseInt(request.getParameter("taskId").toString());
	//System.out.println("taskId"+ String.valueOf(taskId));

	//System.out.println("taskId"+taskId);
	
	taskData.setCreatedBy(createdBy);
	taskData.setOriginatedPartyId(taskOwner);
	if (taskId == 0)
		taskData.setId(null);
	else
		taskData.setId(taskId);
	long currentTime = new Date().getTime();
	MultipartFile[] m = taskData.getTaskAttachment();
	List<Document> documentDatas = new ArrayList<Document>();
	if(m!=null)
	{
	for (MultipartFile f : m) {
		//System.out.println("f.getOriginalFilename():--"				+ f.getOriginalFilename());
		if (f.getOriginalFilename() != null
				&& !f.getOriginalFilename().equals("")) {
			String fileName = null;
			String extension = null;
			Document d = new Document();
			d.setDocumentName(f.getOriginalFilename());
			d.setDocumentStorageLocation(82001);
			d.setDocumentType(10001);
			d.setCreatedBy(createdBy);
			fileName = f.getOriginalFilename().substring(0,
					f.getOriginalFilename().lastIndexOf("."));
			extension = f.getOriginalFilename().substring(
					f.getOriginalFilename().lastIndexOf("."));
			//System.out.println("File name is :--" + fileName);
		//	System.out.println("extension is:--" + extension);
		//	System.out.println("filename to set:---" + fileName + "_"					+ currentTime + extension);
			d.setFileName(fileName + "_" + currentTime + extension);
			d.setFileSize((int) f.getSize());
			d.setFileTypeId(11006);
			documentDatas.add(d);
			if (f.getSize() > FiinfraConstants.MAX_FILE_SIZE) {
				documentDatas = null;
				break;
			}
		}
	}
	}
	taskData.setTaskAttachment(null);

	logger.info("documentDatas:-" + documentDatas);
	if (documentDatas == null) {
		result = "Attachment size greater than "
				+ FiinfraConstants.MAX_FILE_SIZE + " kb is not allowed.";
	} else {
		if (documentDatas.size() > 0) {
			// taskData.setAttachmentCount(documentDatas.size());
			// taskData.setAttachment(true);
		}
	}

	String duedate = taskData.getDueDateTimeString();
	
	String enddate = taskData.getEndDateTimeString();
	//String Completionndate = taskData.getCompletionDateTimeString();

	int recordCount = 0;
	
	
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy h:mm a");
	
	 //DateFormat outputformat = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
	String dateInString = duedate;
		Date date = formatter.parse(dateInString);

	java.sql.Timestamp due = new java.sql.Timestamp(date.getTime());
	taskData.setDueDateTime(due);
	
	
	
	
	
	String endInString = enddate;
	Date date1 = formatter.parse(endInString);

java.sql.Timestamp end = new java.sql.Timestamp(date1.getTime());
taskData.setTaskEndDate(end);
//.setDueDateTime(end);

	
	
/*String s = "03/24/2013 21:54";
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
try
{
    Date date1 = simpleDateFormat.parse(s);

    System.out.println("date : "+simpleDateFormat.format(date));
}
catch (ParseException ex)
{
    System.out.println("Exception "+ex);
}
*/



	
	
	
	//	System.out.println("due date time before conversion ......"+duedate);
//	System.out.println("due date time ......"+due);
	
	url = URL_INSERT_Task + userSession.getUserName() + "/1234";
	logger.info("url:-" + url);
	taskData.setDocumentList(documentDatas);
	BaseResponse<String> br = new BaseResponse<String>();
	
	int owner=taskData.getOwnerPartyId();
	String ownername=taskData.getOwnerPartyName();
	int target=taskData.getTargetPartyId();
	taskData.setTargetPartyId(null);
	
	String targetname=taskData.getTargetPartyName();
	taskData.setOwnerPartyId(target);
	//taskData.setOwnerPartyName(ownername);
		taskData.setOriginatedPartyId(owner);
	
	br = restTemplate.postForObject(url, taskData, BaseResponse.class);
	taskData.setTargetPartyId(target);
	
	
	
	
	//Boolean resultTask = false;
	
	List<String> resultList=new ArrayList<>();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
	{
		resultList=br.getResponseListObject();
		result = FiinfraConstants.SUCCESS;
	}
	String Path=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)), String.class);
//	System.out.println("----------------------------Path" + Path);
	//System.out.println("----------------------------Path" + resultList);
	
	if (documentDatas.size() > 0) {
		 result = FiinfraUtility.uploadAttachments(m, Path,
		 currentTime);
	 } 
		

	String OBJECT_STRING ="Task ID="+taskData.getId()+",TaskOwnerPartyid="+taskData.getOwnerPartyId()+",CategoryId="+taskData.getCategoryId()+",getTargetContactTypeId="+taskData.getTargetContactTypeId()+",Status="+taskData.getStatusId()+",Priority"+taskData.getPriorityId()+
			",TargetPartyId="+taskData.getTargetPartyId()+",DueDate="+taskData.getDueDateTime()+"Completed Date="+taskData.getCompletionDateTime()+",Subject="+taskData.getSubject()+
			",Description="+taskData.getDescription()+",lastModifiedBy="+userSession.getUserId()+
			",CreatedBY="+userSession.getUserId()+",OriginatedPartyId="+taskData.getOriginatedPartyId()+
			",EndDate="+taskData.getTaskEndDate()+
	"Attachment1"+taskData.getAttachment1DocumentID()+
	"Attachment1"+taskData.getAttachment2DocumentID()+
	"Attachment1"+taskData.getAttachment3DocumentID();
	
	
	

	if(taskId==0)
	{
		//FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_TASK_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_TASK,FiinfraConstants.SRP_ADD_TASK);
		FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_TASK_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_TASK,FiinfraConstants.SRP_ADD_TASK,"SP=CALL usp_DIY_insertOrUpdateTask(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",OBJECT_STRING);
		
		Notification notification=null;
			Map<String,String> taskEmailData=new HashMap<String, String>();
			
			
			  taskEmailData.put("Task.Subject",taskData.getSubject());
			  taskEmailData.put("Task.Description",taskData.getDescription());
			  taskEmailData.put("Task.SubjectCategory",taskData.getSubject());
			  taskEmailData.put("Task.ActivityDate",taskData.getDueDateTimeString());
			  taskEmailData.put("Task.OwnerName",taskData.getTargetPartyName());
			  taskEmailData.put("RelatedTo",taskData.getDescription());
			  taskEmailData.put("Task.AssignedBy",userSession.getName());
			  taskEmailData.put("Task.Description",taskData.getDescription());
			  taskEmailData.put("Task.Email",userSession.getContactEmail());
			  
			notification=new Notification();
			notification.setSourceSystemID(31003); //need to add in finfra coinstants
			notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
			notification.setNotifyPartyID(taskData.getTargetPartyId());
			notification.setNotifyEventID(Integer.parseInt(ADD_TASK)); //need to add a param for new admin portal add partner
			notification.setBuId(userSession.getBuId());
			notification.setPayloadMap(taskEmailData);
			notification.setSessionID(request.getSession().getId());
			FrameworkUtil.notify(notification);
		

		
		
	}
	else
	{
//FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_EDIT_TASK_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_TASK,FiinfraConstants.SRP_EDIT_TASK);
	//	FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_BU_DISCLAIMER_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_ADD_BU_DISCLAIMER,"SP="+FiinfraConstants.SP_ADD_DISCLIAMER_BIZ_UNIT,OBJECT_STRING);
	
FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_TASK_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_TASK,FiinfraConstants.SRP_ADD_TASK,"SP=CALL usp_DIY_insertOrUpdateTask(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",OBJECT_STRING);
		Map<String,String> taskEmailData=new HashMap<String, String>();
		  taskEmailData.put("Subject",taskData.getSubject());
		//  taskEmailData.put("Task.Description",taskData.getDescription());
		 // taskEmailData.put("Task.SubjectCategory",taskData.getSubject());
		  taskEmailData.put("Task.OwnerName",taskData.getTargetPartyName());
		  taskEmailData.put("Task.AssignedBy",userSession.getName());
		  taskEmailData.put("Status",taskData.getStatusName());
		  taskEmailData.put("Task.Email",userSession.getContactEmail());

		  
		  
		Notification notification=null;
		notification=new Notification();
		notification.setSourceSystemID(31003); //need to add in finfra coinstants
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);

		notification.setNotifyPartyID(taskData.getTargetPartyId());
		notification.setNotifyEventID(Integer.parseInt(EDIT_TASK)); //need to add a param for new admin portal add partner
		notification.setBuId(userSession.getBuId());
		notification.setPayloadMap(taskEmailData);
		notification.setSessionID(request.getSession().getId());
		FrameworkUtil.notify(notification);
		
		
	}
	
	
	
/*
	PrintWriter out = null;
	try {
		out = response.getWriter();
	} catch (IOException e) {
		e.printStackTrace();
	}
	objectMapper.writeValue(out, 1);*/


	//FIINFRA-SERVICE-PORTAL/partnersp/getTaskList.htm
String s = "/";  
if(isclose==0)
{
	return new ModelAndView("redirect:"+s+"/addtask.htm");	
		
}
else
{
	return new ModelAndView("redirect:"+s+"partnersp/getTaskList.htm");
}



}




@SuppressWarnings("unchecked")
public ModelAndView getTaskList(HttpServletRequest request,
		HttpServletResponse response) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException {
	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int buId = userSession.getBuId();
	int partyId = userSession.getPartyId();
	Task t1=new Task();
	String pagesize=request.getParameter("pageSize");
	if(pagesize==null){
		pagesize="10";
	}
	 String taskSearchValue = "serviceportal";// "inbox";
	// queryPanel = queryPanel == null ? "inbox" : queryPanel;
	// request.getSession().setAttribute("queryPanel", queryPanel);
	 
	String value=request.getParameter("value");
	if(value==null)
	{
		
	}
	else
	{
		taskSearchValue=taskSearchValue+value;
	}

	url = URL_GET_TASK_LIST_SP + "abc"  
			+ "/1234";
	logger.info("url:-" + url);
/*	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	// uriCB.queryParam("partyId", partyId);
	// System.out.println("PartyID for task "+partyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("taskSearchValue", taskSearchValue);*/
	
	t1.setBuPartyId(buId);
	t1.setSubject(taskSearchValue);
	t1.setPartyID(partyId);
	
	
	BaseResponse<Task> br = new BaseResponse<Task>();
	//br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
	
	
	
	br = restTemplate.postForObject(url, t1, BaseResponse.class);

	
	List<Task> taskDatas = new ArrayList<>();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		
		taskDatas=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
		
		
  //   System.out.println("taskDatas:-------------------"+taskDatas); 
	List<Task> taskDatas1 = new ArrayList<>();  
	
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	
	Iterator<Task> i=taskDatas.iterator();
	while(i.hasNext()){
		Task t=objectMapper.readValue(objectMapper.writeValueAsString(i.next()), Task.class);
		java.sql.Timestamp t123 = t.getDueDateTime();
		String dueDate = sdf.format(t123.getTime());
		t.setDueDateTimeString(dueDate);
		taskDatas1.add(t);
	}
	
	taskDatas=taskDatas1;
	//System.out.println("taskDatas:-------------------------------"			+ taskDatas);

	
	ModelAndView mav = new ModelAndView("partner/task");
	//mav.addObject("taskDatas", taskDatas);
	
	mav.addObject("taskDatas", objectMapper.writeValueAsString(taskDatas));
	mav.addObject("pagesize", pagesize);
	
	return mav;// new ModelAndView("common/query", "queryDatas",
				// queryDatas);
}
	

public void getTaskListXLS(HttpServletRequest request, HttpServletResponse response) throws IOException {
/*	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int buId = userSession.getBuId();
	int partyId = userSession.getPartyId();
	String pagesize=request.getParameter("pageSize");
	if(pagesize==null){
		pagesize="10";
	}
	 String taskSearchValue =request.getParameter("value");// "inbox";
	// queryPanel = queryPanel == null ? "inbox" : queryPanel;
	// request.getSession().setAttribute("queryPanel", queryPanel);
	url = URL_GET_TASK_LIST_SP + userSession.getUserName() + "/" + partyId
			+ "/1234";
	logger.info("url:-" + url);
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	// uriCB.queryParam("partyId", partyId);
	// System.out.println("PartyID for task "+partyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("taskSearchValue", taskSearchValue);
	BaseResponse<Task> br = new BaseResponse<Task>();
	//br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),			BaseResponse.class).getBody();
	
	//uriCB.queryParam("taskSearchValue", taskSearchValue);*/
	
	/*Task t1=new Task();
	t1.setBuPartyId(buId);
	t1.setSubject(taskSearchValue);
	t1.setPartyID(partyId);
	
	
	br = restTemplate.postForObject(url, t1, BaseResponse.class);*/
	UserSession userSession = (UserSession) request.getSession()
	.getAttribute("userSession");
int buId = userSession.getBuId();
int partyId = userSession.getPartyId();
Task t1=new Task();
String pagesize=request.getParameter("pageSize");
if(pagesize==null){
pagesize="10";
}
String taskSearchValue = "serviceportal";// "inbox";
// queryPanel = queryPanel == null ? "inbox" : queryPanel;
// request.getSession().setAttribute("queryPanel", queryPanel);

String value=request.getParameter("value");
if(value==null)
{

}
else
{

taskSearchValue=taskSearchValue+value;
}

url = URL_GET_TASK_LIST_SP + "abc"  
	+ "/1234";
logger.info("url:-" + url);
/*	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
// uriCB.queryParam("partyId", partyId);
// System.out.println("PartyID for task "+partyId);
uriCB.queryParam("buId", buId);
uriCB.queryParam("taskSearchValue", taskSearchValue);*/

t1.setBuPartyId(buId);
t1.setSubject(taskSearchValue);
t1.setPartyID(partyId);


BaseResponse<Task> br = new BaseResponse<Task>();
//br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);



br = restTemplate.postForObject(url, t1, BaseResponse.class);

	List<Task> taskDatas = new ArrayList<>();
	List<Task> taskDatas1 = new ArrayList<>();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		
		taskDatas=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			for(int i = 0; i<taskDatas.size(); i++){
				//get the actual party object from its LinkedHashMap representation
				Task task;
				task = objectMapper.readValue(objectMapper.writeValueAsString(taskDatas.get(i)), Task.class);
				try{
				java.sql.Timestamp t123 = task.getDueDateTime();
				String dueDate = sdf.format(t123.getTime());
				task.setDueDateTimeString(dueDate);
				}catch(Exception e){
					task.setDueDateTimeString("");
				}
				taskDatas1.add(task);
			}

	response.addHeader("Content-type", "application/vnd.ms-excel");
	response.addHeader("Content-Disposition", "attachment;filename=TaskList.xls");
	
	HSSFWorkbook workbook = new HSSFWorkbook();
	CellStyle style = workbook.createCellStyle();
	HSSFFont font=workbook.createFont();
    /* set the weight of the font */
	font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
    /* attach the font to the style created earlier */
	style.setFont(font);
	style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

	HSSFSheet sheet = workbook.createSheet("Task List");
	int rowNum = 0;
	int column = 0;
	HSSFRow excelRow =  sheet.createRow(rowNum++);
	{	HSSFCell cell =  excelRow.createCell(column++);
	cell.setCellStyle(style);
	cell.setCellValue("Task Owner");
	}
	{	HSSFCell cell =  excelRow.createCell(column++);
	cell.setCellStyle(style);
	cell.setCellValue("Subject Category");
	}
	{	HSSFCell cell =  excelRow.createCell(column++);
	cell.setCellStyle(style);
	cell.setCellValue("Task Created By");
	}
	{	HSSFCell cell =  excelRow.createCell(column++);
	cell.setCellStyle(style);
	cell.setCellValue("Subject");
	}

	{	HSSFCell cell =  excelRow.createCell(column++);
	cell.setCellStyle(style);
	cell.setCellValue("Start Date");
}
	{	HSSFCell cell =  excelRow.createCell(column++);
	cell.setCellStyle(style);
	cell.setCellValue("End Date");
}
	{	HSSFCell cell =  excelRow.createCell(column++);
	cell.setCellStyle(style);
	cell.setCellValue("Priority");
}
	{	HSSFCell cell =  excelRow.createCell(column++);
	cell.setCellStyle(style);
	cell.setCellValue("Status");
}


	for(Task task:taskDatas1){
		column = 0;
		excelRow =  sheet.createRow(rowNum++);
		{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(task.getOwnerPartyName());
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue(task.getCategoryName());
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue(task.getTaskCreatedBy());
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue(task.getSubject());
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue(task.getDueDateTimeString());
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue(task.getEndDateTimeString());
	}
		
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue(task.getPriorityName());
	}
		
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue(task.getStatusName());
	}

	}

	workbook.write(response.getOutputStream());
}

public void getTaskListCSV(HttpServletRequest request, HttpServletResponse response) throws IOException {

	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int buId = userSession.getBuId();
	int partyId = userSession.getPartyId();
	String pagesize=request.getParameter("pageSize");
	if(pagesize==null){
		pagesize="10";
	}
	 String value =request.getParameter("value");// "inbox";
	// queryPanel = queryPanel == null ? "inbox" : queryPanel;
	// request.getSession().setAttribute("queryPanel", queryPanel);
	url = URL_GET_TASK_LIST_SP +  "user/" 
			+ "/1234";
	logger.info("url:-" + url);
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	// uriCB.queryParam("partyId", partyId);
	// System.out.println("PartyID for task "+partyId);
	///uriCB.queryParam("buId", buId);
	//uriCB.queryParam("taskSearchValue", taskSearchValue);
	BaseResponse<Task> br = new BaseResponse<Task>();
	
	 String taskSearchValue = "serviceportal";// "inbox";
	// queryPanel = queryPanel == null ? "inbox" : queryPanel;
	// request.getSession().setAttribute("queryPanel", queryPanel);
	 
//	String value=request.getParameter("value");
	if(value==null)
	{
		
	}
	else
	{
	
		taskSearchValue=taskSearchValue+value;
	}
	
	
	
	Task t1=new Task();
	t1.setBuPartyId(buId);
	t1.setSubject(taskSearchValue);
	t1.setPartyID(partyId);
	
	
	br = restTemplate.postForObject(url, t1, BaseResponse.class);
	
	//br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),	BaseResponse.class).getBody();
	List<Task> taskDatas = new ArrayList<>();
	List<Task> taskDatas1 = new ArrayList<>();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		
		taskDatas=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			for(int i = 0; i<taskDatas.size(); i++){
				//get the actual party object from its LinkedHashMap representation
				Task task;
				task = objectMapper.readValue(objectMapper.writeValueAsString(taskDatas.get(i)), Task.class);
				try{
				java.sql.Timestamp t123 = task.getDueDateTime();
				String dueDate = sdf.format(t123.getTime());
				task.setDueDateTimeString(dueDate);
				}catch(Exception e){
					task.setDueDateTimeString("");
				}
				taskDatas1.add(task);
			}
		response.addHeader("Content-Disposition", "attachment;filename=TaskList.csv");
		PrintWriter writer = response.getWriter();
		writer.print(CommonUtils.escape("Task Owner"));
		writer.print(",");
		writer.print(CommonUtils.escape("Subject Category"));
		writer.print(",");
		writer.print(CommonUtils.escape("Task Created By"));
		writer.print(",");
		writer.print(CommonUtils.escape("Subject"));
		writer.print(",");
		writer.print(CommonUtils.escape("Stast Date"));
		writer.print(",");
		writer.print(CommonUtils.escape("End Date"));
		writer.print(",");
		writer.print(CommonUtils.escape("Priority"));
		writer.print(",");
		writer.print(CommonUtils.escape("Status"));
		writer.println();
		for(Task task:taskDatas1){
			writer.print(CommonUtils.escape(task.getOwnerPartyName()));
			writer.print(",");
			writer.print(CommonUtils.escape(task.getCategoryName()));
			writer.print(",");
			writer.print(CommonUtils.escape(task.getTaskCreatedBy()));
			writer.print(",");
			writer.print(CommonUtils.escape(task.getSubject()));
			writer.print(",");
			writer.print(CommonUtils.escape(task.getDueDateTimeString()));
			writer.print(",");
			writer.print(CommonUtils.escape(task.getEndDateTimeString()));
			writer.print(",");
			writer.print(CommonUtils.escape(task.getPriorityName()));
			writer.print(",");
			writer.print(CommonUtils.escape(task.getStatusName()));
			writer.println();
		}
}

/**
 * deletes the task and related details
 * 
 * @param request
 * @param response
 * @throws IOException
 */
@SuppressWarnings("unchecked")
public void deleteTask(HttpServletRequest request,
		HttpServletResponse response) throws IOException {
	String TaskIds = request.getParameter("TaskIds");
/*	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int buId = userSession.getBuId();
	url = URL_DELETE_Task + userSession.getUserName() + "/" + TaskIds
			+ "/1234?buId=" + buId;
	// url = URL_DELETE_Task + userSession.getUserName() + "/1234";
	logger.info("url:-" + url);
	// UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	// uriCB.queryParam("queryIds", queryIds);
	// uriCB.queryParam("buId", buId);
	BaseResponse<String> br = new BaseResponse<String>();
	try {
		br = restTemplate.postForObject(url, null, BaseResponse.class);

	} catch (Exception e) {
		e.printStackTrace();
	}*/
	
	
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				url = URL_DELETE_Task_SP + userSession.getUserName()+ "/1234";
				BaseResponse<Integer> br = new BaseResponse<Integer>();
				Task t=new Task();
				t.setDescription(TaskIds);
				t.setCreatedBy(userSession.getUserId());
				br = restTemplate.postForObject(url, t, BaseResponse.class);
				Integer codeValueDataList=null;
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					 codeValueDataList= br.getResponseObject();
				String OBJECT_STRING="Task ID="+TaskIds+",UpDated By="+userSession.getUserId();
				FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_DELETE_TASK_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_TASK,FiinfraConstants.SRP_DELETE_TASK,"SP="+FiinfraConstants.SP_DELETE_TASK_SP,OBJECT_STRING);
				//FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_DELETE_TASK_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_TASK,FiinfraConstants.SRP_DELETE_TASK);
	
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, br.getStatus());// TO Do: here status can
													// be SUCCESS or
													// .EMPTY_RESULT_SET.
													// Accordingly handle
													// this in View.
}

public void getUserList(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	String recordType;
	String loggedInUserPartyId;
//	loggedInUserPartyId=request.getParameter("loggedInUserPartyId");
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");

//	loggedInUserPartyId=Integer.parseInt(userSession.getPartyId());

	loggedInUserPartyId=userSession.getPartyId().toString();

	int buId=userSession.getBuId();
	recordType=request.getParameter("recordType");
	
	//System.out.println("recordType in getUserList="+recordType);
	//System.out.println("buId in getUserList="+buId);
	url = URL_GET_USER_LIST+userSession.getName()+"/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("recordType", recordType);
	uriCB.queryParam("loggedInUserPartyId",loggedInUserPartyId);
	uriCB.queryParam("buId",buId);
	List<UserData> userList=(List<UserData>) FiinfraUtility.postRequest(uriCB,List.class,restTemplate);
	//System.out.println("userList:---"+userList);
	
//	Gson gson= new Gson();
//	  System.out.println("userList========="+gson.toJson(userList));
	
	Logger.logEntry(this.getClass(), "userList:---" + userList,
			Logger.DEBUG,
			Thread.currentThread().getStackTrace()[1].getMethodName());
	PrintWriter out= null; 
	try {
		out = response.getWriter();
	} catch (IOException e) {
		e.printStackTrace();
	}
	objectMapper.writeValue(out, userList);
 
}



@SuppressWarnings("unchecked")
public ModelAndView loadLoginHist(HttpServletRequest request,
		HttpServletResponse response) {

	    UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	    logger.info(userSession.getUserName());
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "100";
		}
		
		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
	    ModelAndView mav = new ModelAndView("partner/loginhisto");
	    int buid = userSession.getBuId();
	    String userid = request.getParameter("userId");
		try {
			url = URL_GET_LOGIN_HISTORY+"ramu"+"/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

			LoginHistory loginHistory = new LoginHistory();
			loginHistory.setBuId(buid+"");   
			loginHistory.setUserId(Integer.parseInt(userid));
			loginHistory.setSearchText(searchTextVal);
			
			
			BaseResponse<LoginHistory> br = new BaseResponse<LoginHistory>();
			br = restTemplate.postForObject(url, loginHistory, BaseResponse.class);
			List<LoginHistory> loginhist = new ArrayList<LoginHistory>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				loginhist = br.getResponseListObject();
			
			
			mav.addObject("loginHist", loginhist);
			mav.addObject("size", pagesize);
			@SuppressWarnings("unused")
			PrintWriter out= null; 
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


public void loginHistCSV(HttpServletRequest request, HttpServletResponse response) {

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
Integer advisorPartyId = userSession.getPartyId(); //6326
int buid = userSession.getBuId();
//int userid = userSession.getUserId();
String userid = request.getParameter("userId");
String token = "153443";
url = URL_GET_LOGIN_HISTORY+"ramu"+"/1234";
//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(URL_GET_FAQ_LIST + "/"+userSession.getUserName()+"/" + advisorPartyId + "/"+token+"&buId="+buId);
UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

/*uriCB.queryParam("buId", buid+"");
	uriCB.queryParam("userId", userid+"");
	uriCB.queryParam("searchText", searchTextVal);*/
LoginHistory loginHistory = new LoginHistory();
loginHistory.setBuId(buid+"");   
//loginHistory.setUserId(userid);
loginHistory.setUserId(Integer.parseInt(userid));
loginHistory.setSearchText(searchTextVal);


BaseResponse<LoginHistory> baseResponse = new BaseResponse<LoginHistory>();
baseResponse = restTemplate.postForObject(url, loginHistory, BaseResponse.class);

List<LoginHistory> listAsJson = new ArrayList<LoginHistory> ();
List<LoginHistory> list = new ArrayList<LoginHistory> ();

if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
 try {
	   listAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
	   
     
	   for(int i = 0; i<listAsJson.size(); i++){
			//get the actual party object from its LinkedHashMap representation
		   LoginHistory list2;
			list2 = objectMapper.readValue(objectMapper.writeValueAsString(listAsJson.get(i)), LoginHistory.class);
							
			
			list.add(list2);
		}


 } catch (JsonParseException e) {
  e.printStackTrace();
 } catch (JsonMappingException e) {
  e.printStackTrace();
 } catch (JsonGenerationException e) {
  e.printStackTrace();
 } catch (IOException e) {
  e.printStackTrace();
 }
}




 response.addHeader("Content-Disposition", "attachment;filename=LoginHist.csv");
 
      
 PrintWriter writer = response.getWriter();

 writer.print(CommonUtils.escape("User Name"));
 writer.print(",");
 writer.print(CommonUtils.escape("Login Mode"));
 writer.print(",");
 writer.print(CommonUtils.escape("Source IP Address"));
 writer.print(",");
 writer.print(CommonUtils.escape("Failure Reason"));
 writer.print(",");
 writer.print(CommonUtils.escape("Login Date Time"));
 writer.print(",");
 writer.print(CommonUtils.escape("Logout Date Time"));
 writer.print(",");
 writer.print(CommonUtils.escape("Redirect URL"));
 writer.println();
 
 for(LoginHistory llist:list){
	   
	 
 
  writer.print(CommonUtils.escape(llist.getUserName()+""));
  writer.print(",");
  writer.print(CommonUtils.escape(llist.getLoginAccessMode()));
  writer.print(",");
  writer.print(CommonUtils.escape(llist.getSourceIPAddress() +""));
  writer.print(","); 
  writer.print(CommonUtils.escape(llist.getFailureText() +""));
  writer.print(",");
  writer.print(CommonUtils.escape(llist.getLoginDateTime()+""));
  writer.print(",");
  writer.print(CommonUtils.escape(llist.getLogoutDateTime()+""));
  writer.print(",");
  writer.print(CommonUtils.escape(llist.getRedirectURLFullPath()+""));
  writer.print(",");


  writer.println();
 }
     
} catch (IOException e) {
    e.printStackTrace();
}
}

public void loginHistExcel(HttpServletRequest request, HttpServletResponse response) {

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

	  Integer advisorPartyId = userSession.getPartyId(); //6326
	  int buid = userSession.getBuId();
	  //int userid = userSession.getUserId();
	  String userid = request.getParameter("userId");
	  String token = "153443";
	  url = URL_GET_LOGIN_HISTORY+"ramu"+"/1234";
	  //UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(URL_GET_FAQ_LIST + "/"+userSession.getUserName()+"/" + advisorPartyId + "/"+token+"&buId="+buId);
	  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	  LoginHistory loginHistory = new LoginHistory();
	  loginHistory.setBuId(buid+"");   
	  //loginHistory.setUserId(userid);
	  loginHistory.setUserId(Integer.parseInt(userid));
	  loginHistory.setSearchText(searchTextVal);


	  BaseResponse<LoginHistory> baseResponse = new BaseResponse<LoginHistory>();
	  baseResponse = restTemplate.postForObject(url, loginHistory, BaseResponse.class);
	  
	  List<LoginHistory> faqListAsJson = new ArrayList<LoginHistory> ();
	  List<LoginHistory> faqList = new ArrayList<LoginHistory> ();
	  
	  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
	   try {
		   faqListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
	       
		   for(int i = 0; i<faqListAsJson.size(); i++){
				//get the actual party object from its LinkedHashMap representation
			   LoginHistory faqList2;
				faqList2 = objectMapper.readValue(objectMapper.writeValueAsString(faqListAsJson.get(i)), LoginHistory.class);
								
				
				faqList.add(faqList2);
			}


	   } catch (JsonParseException e) {
	    e.printStackTrace();
	   } catch (JsonMappingException e) {
	    e.printStackTrace();
	   } catch (JsonGenerationException e) {
	    e.printStackTrace();
	   } catch (IOException e) {
	    e.printStackTrace();
	   }
	  }
	  
	  
	  
	   response.addHeader("Content-Disposition", "attachment;filename=LoginHist.xls");
	   
	        
	   PrintWriter writer = response.getWriter();
	  
	  
	   writer.print(CommonUtils.escape("User Name"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Login Mode"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Source IP Address"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Failure Reason"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Login Date Time"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Logout Date Time"));
	   writer.print("\t");
	   writer.print(CommonUtils.escape("Redirect URL"));
	   
	   writer.println();
	   for(LoginHistory list:faqList){
		   
	    writer.print(CommonUtils.escape(list.getUserName()+""));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getLoginAccessMode()+""));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getSourceIPAddress()+""));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getFailureText()));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getLoginDateTime()+""));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getLogoutDateTime()+""));
	    writer.print("\t");
	    writer.print(CommonUtils.escape(list.getRedirectURLFullPath()+""));


	    writer.println();
	   }
	       
	  } catch (IOException e) {
	      e.printStackTrace();
	  }
	 }



@SuppressWarnings("unchecked")
public void getUniqueCommunicationEmail(HttpServletRequest request,
		HttpServletResponse response) {
	logger.info("\n getUniqueCommunicationEmail  PartnerSPController ");
try {
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	logger.info(userSession.getUserName());
	url = URL_GET_UNIQUE_COMMUNICATION_EMAIL +"ramu"+"/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("communicationEmailId", request.getParameter("communicationEmailId"));
	uriCB.queryParam("hdnbuId", request.getParameter("hdnbuId"));
	uriCB.queryParam("contactEmail", request.getParameter("contactEmail"));
	uriCB.queryParam("isedit", request.getParameter("isedit"));
	Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
	BaseResponse<Partner> br = new BaseResponse<Partner>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	List<Partner> list = new ArrayList<Partner>();
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		list= br.getResponseListObject();
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	
	objectMapper.writeValue(out, list);
} catch (RestClientException | IOException e) {
	e.printStackTrace();
 }
}






@SuppressWarnings("unchecked")
public void getTaskAssign(HttpServletRequest request,HttpServletResponse response) throws IOException 
{
 
 
 logger.info("in value");
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	url = URL_GET_TASK_LIST_ASSIGN + userSession.getUserName()+ "/1234";


	Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
	BaseResponse<User> br = new BaseResponse<User>();
	
	User user=new User();
	user.setUserID(userSession.getUserId());
	user.setBuPartyId(userSession.getBuId());
	
	br = restTemplate.postForObject(url, user, BaseResponse.class);
	
	List<User> list = new ArrayList<User>();
	
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
	list= br.getResponseListObject();
	
//	System.out.println("welcome"+list);
	
	//Logger.logEntry(this.getClass(), "RoleList:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, list);

} 	


@RequestMapping(value = "/getPartnerList", method = RequestMethod.GET)
public void getPartnerList(HttpServletRequest request,
		HttpServletResponse response) throws Exception {

	
	
	
	String searchString=request.getParameter("searchString");	
	Integer taskto=Integer.parseInt(request.getParameter("taskTo"));
	
	//System.out.println("naval"+searchString);
	
	 logger.info("in value");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int partyId = userSession.getPartyId();
		
		
		
		
		Task task=new Task();
		task.setUserId(userSession.getUserId());
		task.setBuPartyId(userSession.getBuId());
		task.setId(userSession.getRoleId());
		task.setAssignTo(taskto);
		task.setPartyName(searchString);
		
		
	//	url = URL_GET_BUPARTY_NAME+"xyz/1234";
		String url = URL_GET_TASK_PARTNER_LIST + userSession.getUserName()+ "/1234";
	//	String codeTypeIds=request.getParameter("codeTypeIds");

		Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Task> br = new BaseResponse<Task>();
		
	
		
		br = restTemplate.postForObject(url, task, BaseResponse.class);
		
		List<Task> list = new ArrayList<Task>();
		
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		list= br.getResponseListObject();
		
		//System.out.println("welcome"+list);
		
		Logger.logEntry(this.getClass(), "RoleList:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, list);
	
	

}




public ModelAndView getTaskDetail(HttpServletRequest request,HttpServletResponse response)
{

	
	ModelAndView mav = new ModelAndView("partner/add_task");

	
	logger.info("Get biz unit detail");
	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int taskId = Integer.parseInt(request.getParameter("taskId"));
	//System.out.println("baba"+taskId);
	try
	{
	url = URL_GET_TASK_DETAIL + userSession.getUserName() + "/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	Task task=new Task();
	task.setId(taskId);
	BaseResponse<Task> br = new BaseResponse<Task>();
	//br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB),BaseResponse.class);
	br = restTemplate.postForObject(url, task, BaseResponse.class);
//	System.out.println("baji");

	Task list = null;
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		list = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()),
				Task.class);
//System.out.println("list"+list);

mav.addObject("taskOwnerPartyID",list.getTaskOwnerPartyID());
mav.addObject("ownerPartyName",list.getOwnerPartyName());
mav.addObject("targetPartyName",list.getTargetPartyName());
mav.addObject("taskOnRelatedPartyID",list.getTaskOnRelatedPartyID());
mav.addObject("taskTypeID",list.getTaskTypeID());
mav.addObject("taskPriorityID",list.getTaskPriorityID());
mav.addObject("taskStatusID",list.getTaskStatusID());
mav.addObject("taskSubject",list.getTaskSubject());
mav.addObject("taskText",list.getTaskText());
mav.addObject("taskContactTypeID",list.getTaskContactTypeID());
mav.addObject("dueDateTime",list.getDueDateTime1());
mav.addObject("taskId",taskId);
mav.addObject("attachment1",list.getAttachment1DocumentName());
mav.addObject("attachment2",list.getAttachment2DocumentName());
mav.addObject("attachment3",list.getAttachment3DocumentName());
mav.addObject("completionDateTime1",list.getCompletionDateTime1());
mav.addObject("endDateTime",list.getEndDateTime1());


mav.addObject("attachment1ID",list.getAttachment1DocumentID());
mav.addObject("attachment2ID",list.getAttachment2DocumentID());
mav.addObject("attachment3ID",list.getAttachment3DocumentID());


request.setAttribute("kkk", taskId);



















	mav.addObject("taskdetail", list);
	
	
	

	
	
	

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

	//move partner
	@SuppressWarnings("unchecked")
	public void switchPartner(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int bupartyid = Integer.parseInt(request.getParameter("bupartyid"));
		int PartyId = Integer.parseInt(request.getParameter("PartyId"));
		String pstTeamMemberId = request.getParameter("pstId");
		String potTeamMemberId = request.getParameter("potId");
		String pktTeamMemberId = request.getParameter("pktId");
		String rmTeamMemberId = request.getParameter("rmId");
		String rmHeadTeamMemberId = request.getParameter("rmHeadId");
		url = URL_GET_MOVE_PARTNER + "sa"
				+ "/1234";
		
		
		Partner partner=new Partner();
		partner.setPartyID(PartyId);
		partner.setBuPartyId(bupartyid);
		partner.setPstTeamMemberId(pstTeamMemberId);
		partner.setPotTeamMemberId(potTeamMemberId);
		partner.setPktTeamMemberId(pktTeamMemberId);
		partner.setRmTeamMemberId(rmTeamMemberId);
		partner.setRmHeadTeamMemberId(rmHeadTeamMemberId);
		
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		br =  restTemplate.postForObject(url, partner, BaseResponse.class);
		List<Partner> move = new ArrayList<Partner>();
		
		
		
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			move= br.getResponseListObject();
		logger.info(move);
		PrintWriter out=null ;	
		out = response.getWriter();
		response.setContentType("application/json");
  		objectMapper.writeValue(out,move);
		
	}
	
	@SuppressWarnings("unchecked")
	public void getPartnerListForChange(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		String searchText = request.getParameter("addquickSearch");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int buId = userSession.getBuId();
		int userId = userSession.getUserId();
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		Partner data = new Partner();
		
		data.setSearchText(searchText);
		data.setBuId(Integer.toString(buId));
		data.setUserId(Integer.toString(userId));
		
		BaseResponse<Partner> br1 = new BaseResponse<Partner>();
		url = URL_GET_PARTNER_LIST_FOR_CHANGE + userToken + "/1234";
		br1 = restTemplate.postForObject(url, data, BaseResponse.class);
		List<Partner> recList = new ArrayList<Partner>();
		if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recList = br1.getResponseListObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recList);
	}
	
	@SuppressWarnings("unchecked")
	public void changePartnerForOPPOrClient(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		String selectedPartyIds = request.getParameter("selectedOpp");
		int PartyId = Integer.parseInt(request.getParameter("PartyId"));
		
		url = URL_PARTNER_OF_CLIENT_OR_OPPORTUNITY + "sa" + "/1234";
		
		
		Partner partner=new Partner();
		partner.setPartyID(PartyId);
		//used search string to store multiple ids of client or opportunity
		partner.setSearchText(selectedPartyIds);
		
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		br =  restTemplate.postForObject(url, partner, BaseResponse.class);
		List<Partner> move = new ArrayList<Partner>();
		
		
		
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			move= br.getResponseListObject();
		
		PrintWriter out=null ;	
		out = response.getWriter();
		response.setContentType("application/json");
  		objectMapper.writeValue(out,move);
		
	}
	

	 public void loadOnboardChecklist(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
		
		Integer partnerspartyid = Integer.parseInt(request.getParameter("partnerspartyid"));
		request.setAttribute("partnerspartyid", partnerspartyid);
	String url=URL_GET_ONBOARD_CHECKLIST+ "sa" + "/1234";
		
	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	
		Partner partner=new Partner();
		partner.setPartyID(partnerspartyid);
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		br =  restTemplate.postForObject(url, partner, BaseResponse.class);
		List<Partner> checklist = new ArrayList<Partner>();
		
		request.setAttribute("rollId",userSession.getRoleId());
		
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			checklist= br.getResponseListObject();
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, checklist);
		 
	}
	


	

	

	public void getTaskAlert(HttpServletRequest request,

			HttpServletResponse response) throws Exception {
		logger.info("In get code value from code type");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_TASK_ALERT+"xyz/1234";
	//	String codeTypeIds=request.getParameter("codeTypeIds");
		
		
		Task t=new Task();
		t.setPartyID(userSession.getPartyId());


		BaseResponse<Task> br = new BaseResponse<Task>();
		br = restTemplate.postForObject(url, t, BaseResponse.class);
		List<Task> task = new ArrayList<Task>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			task= br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, task);
	}
	public void getTaskAlertOneDay(HttpServletRequest request,

			HttpServletResponse response) throws Exception {
		logger.info("In get code value from code type");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_TASK_ALERT_ONE_DAY+"xyz/1234";
		
		
		Task t=new Task();
		t.setPartyID(userSession.getPartyId());


		BaseResponse<Task> br = new BaseResponse<Task>();
		br = restTemplate.postForObject(url, t, BaseResponse.class);
		List<Task> task = new ArrayList<Task>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			task= br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, task);
	}
	
	
}
