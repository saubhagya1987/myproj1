package in.fiinfra.controller;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.LoginHistory;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.MD5Encryption;
import in.fiinfra.common.util.RandomPasswordGenerator;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Notification;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.google.gson.JsonParseException;

public class UserController extends MultiActionController 
{

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(UserController.class);
	
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	String url;
	@Value("${URL_GET_TOP_CURRENT_LIST}")
	private String URL_GET_TOP_CURRENT_LIST;
	
	@Value("${URL_GET_USER_LIST_BU}")
	private String URL_GET_USER_LIST_BU;
	
	@Value("${URL_DELETE_USER}")
	private String URL_DELETE_USER;
	
	@Value("${URL_GET_PARTYTYPE}")
	private String URL_GET_PARTYTYPE;
	
	@Value("${URL_GET_ROLE}")
	private String URL_GET_ROLE;
	
	@Value("${URL_GET_USERNAME}")
	private String URL_GET_USERNAME;
	
	@Value("${URL_GET_USER_DETAIL}")
	private String URL_GET_USER_DETAIL;
	
	@Value("${URL_GET_UNIQUSERNAME}")
	private String URL_GET_UNIQUSERNAME;
	
	@Value("${URL_ADD_USER}")
	private String URL_ADD_USER;

	@Value("${URL_UPDATE_USER}")
	private String URL_UPDATE_USER;
	
	@Value("${URL_RESETPASSWORD}")
	private String URL_RESETPASSWORD;
	
	@Value("${URL_GET_USERLOGIN_HISTORY}")
	private String URL_GET_USERLOGIN_HISTORY;  
	
	@Value("${URL_GET_USERAUDIT_HISTORY}")
	private String URL_GET_USERAUDIT_HISTORY;
	
	@Value("${URL_UPDATE_USE_PROFILE_HEIRARCHY}")
	private String URL_UPDATE_USE_PROFILE_HEIRARCHY;
	
	
	public ObjectMapper getObjectMapper()
	{
		return objectMapper;
	}
	public void setObjectMapper(ObjectMapper objectMapper)
	{
		this.objectMapper = objectMapper;
	}
	
	
	public RestTemplate getRestTemplate()
	{
		return restTemplate;
	}
	public void setRestTemplate(RestTemplate restTemplate) 
	{
		this.restTemplate = restTemplate;
		
	} 
	
	//RSS FEED READER
	public void RSSFeedsReader(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		
		PrintWriter out = null;
		String allDataListDetails = null;
		try{
			URL rssURL;
			Properties properties = new Properties();
			InputStream stream = getClass().getClassLoader().getResourceAsStream("ApplicationResources.properties");
			properties.load(stream);
					
			String urlString=properties.getProperty("NewsFeedLink");
			rssURL= new URL(urlString);
					
			DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			Document doc=builder.parse(rssURL.openStream());
					
			NodeList items = doc.getElementsByTagName("item");
			List<String> allDataList = new ArrayList<String>();
			for(int i=0;i < 10;i++)
			{
				Element item = (Element) items.item(i);
				
				allDataList.add(getValue(item, "title"));
				allDataList.add(getValue(item, "link"));
				allDataList.add(getValue(item, "pubDate"));
			}		
				allDataListDetails = new flexjson.JSONSerializer().serialize(allDataList);	
			}
			catch(Exception e)
			{
				//e.printStackTrace();
			}
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out,allDataListDetails);
			}
	
			public String getValue(Element parent,String nodeName)
			{
				return parent.getElementsByTagName(nodeName).item(0).getFirstChild().getNodeValue();
			}
		
	//SHOW CURRENT LOGIN LIST OF USER			
	@SuppressWarnings("unchecked")
	public void showCurrentLoginList(HttpServletRequest request,HttpServletResponse response)throws IOException
	{
		 	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			int buId=userSession.getBuId();
			int userId=userSession.getUserId();
			
			url = URL_GET_TOP_CURRENT_LIST + userSession.getName()+ "/1234";
			logger.debug("URL ---------------------> " + url);
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("buId", buId);
			uriCB.queryParam("userId", userId);
			BaseResponse<User> br = new BaseResponse<User>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<User> toplist = new ArrayList<User>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				toplist= br.getResponseListObject();
			
			PrintWriter out=null ;	
			out = response.getWriter();
			response.setContentType("application/json");
	  		objectMapper.writeValue( out,toplist);
		}
	 
	
		//LISTING OF USER
		@SuppressWarnings("unchecked")
		public ModelAndView loaduser(HttpServletRequest request,HttpServletResponse response) 
		{
			logger.debug("LOAD USER LIST");
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			ModelAndView mav = new ModelAndView("user/UserList");
			
			String pagesize = request.getParameter("pageSize");
			if (pagesize == null) {
				pagesize = "10";
			}

			String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) 
			{
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal = "";
			}
			
			String userToken = null;
			if(userSession.getUserName()!=null)
			{
				userToken = userSession.getUserName();
			}
			else
			{
				userToken = "abc";
			}
			try 
			{
				BaseResponse<User> br = new BaseResponse<User>();
				User userData = new User();
				userData.setSearchText(searchTextVal); 
				
				url = URL_GET_USER_LIST_BU + userToken + "/1234";
				br = restTemplate.postForObject(url, userData, BaseResponse.class);
				
				List<User> list = new ArrayList<User>();
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				list = br.getResponseListObject();
				//mav.addObject("userData", list);
				mav.addObject("userDatalist",objectMapper.writeValueAsString(list));
				mav.addObject("size", pagesize);
				PrintWriter out = null;
			try 
			{
				out = response.getWriter();
			} 
			catch (Exception e) 
			{
				//e.printStackTrace();
			}
			} 
			catch (Exception e) 
			{
				//e.printStackTrace();
			}

			return mav;

		}
	 
		//DELETE USER
		@SuppressWarnings("unchecked")
		public void deleteUser(HttpServletRequest request,HttpServletResponse response) throws IOException 
		{

			if (request.getParameter("Lists") != null) 
			{
				String deleteList = request.getParameter("Lists");
		
				UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
				int modifyby = userSession.getUserId();
				
				url = URL_DELETE_USER +"fdgvdfg/1234";
			
				BaseResponse<Integer> br = new BaseResponse<Integer>();
				User userData = new User();
				userData.setDeleteList(deleteList);
				userData.setModifiedBy(modifyby);
	
				br = restTemplate.postForObject(url, userData, BaseResponse.class);
				
				Integer result = null;
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				result = br.getResponseObject();
				
			

				FiinfraUtility.doAudit(userSession.getPartyId(),
									   userSession.getUserId(),
									   FiinfraConstants.SRP_DELETE_USER_EVENT_ID,
									   FiinfraConstants.SERVICE_PORTAL,
									   FiinfraConstants.SRP_SOURCE_MODULE_USER, 
									   FiinfraConstants.SRP_DELETE_USER,
									   "SP="+FiinfraConstants.SP_DELETE_USER+",List="+deleteList+",lastModifiedBy="+modifyby,
									   FiinfraConstants.SRP_DELETE_USER+",List="+deleteList);
				
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, result);

			}
		
		}
	
	//DROPDOWN PARTY NAME	
	@SuppressWarnings("unchecked")
	public void getPartyName(HttpServletRequest request,HttpServletResponse response) throws IOException 
		{
		    logger.debug("IN GET PARTY NAME");
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			url = URL_GET_PARTYTYPE + userSession.getUserName()+ "/1234";
		
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			BaseResponse<User> br = new BaseResponse<User>();
			
			br = restTemplate.postForObject(url, null, BaseResponse.class);
			
			List<User> list = new ArrayList<User>();
			
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			list= br.getResponseListObject();
			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, list);

		} 	
	
	//DROPDOWN ROLE LIST
	@SuppressWarnings("unchecked")
	public void getRoleName(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_ROLE + userSession.getUserName()+ "/1234";
	
		BaseResponse<User> br = new BaseResponse<User>();
		
		br = restTemplate.postForObject(url, null, BaseResponse.class);
		
		List<User> list = new ArrayList<User>();
		
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		list= br.getResponseListObject();
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, list);

	} 	
	
	//USER DETAIL FOR UPDATE
	@SuppressWarnings("unchecked")
	public void getUserDetail(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		logger.debug("IN GET USER DETAILS");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
		int userID=Integer.parseInt(request.getParameter("userIDs"));
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
		//Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<User> br = new BaseResponse<User>();
		User userData = new User();
		userData.setUserID(userID);
		
		url = URL_GET_USER_DETAIL + userSession.getUserName()+ "/1234";
		br = restTemplate.postForObject(url, userData, BaseResponse.class);
	
		List<User> list = new ArrayList<User>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		list= br.getResponseListObject();
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, list);

	}
	
	//UNIQUE USER NAME
	@SuppressWarnings("unchecked")
	public void getUnqUserName(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		
        String userName=request.getParameter("userName");
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		String userToken = null;
		if(userSession.getUserName()!=null)
		{
			userToken = userSession.getUserName();
		}
		else
		{
			userToken = "abc";
		}
        
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			User userData = new User();
			userData.setUserName(userName);
        
			url = URL_GET_UNIQUSERNAME + userToken + "/1234?userName=" + userName;
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
			br = restTemplate.postForObject(url, userData, BaseResponse.class);

			Integer userStatus=null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			userStatus = br.getResponseObject();
			
			//logger.debug(" UserData"+userStatus);
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, userStatus);
 	
	  }
		 
	
	
	
	
	//ADD NEW USER
	@SuppressWarnings("unchecked")
	public void updateUserProfile(HttpServletRequest request,HttpServletResponse response, User userData) throws IOException 
		{

		
		 
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		/*int fAQModuleID = Integer.parseInt(request.getParameter("qtypes"));
		int  bupartyid=Integer.parseInt(request.getParameter("partyname"));
		String qtext=request.getParameter("editque");
		String atext=request.getParameter("editans");
		int faqid=Integer.parseInt(request.getParameter("faqsId"));
		String newQue=qtext.replaceAll("[^\\p{Print}]", "");
		String newAns = atext.replaceAll("[^\\p{Print}]", "");  
		String sourceID=request.getParameter("sourceId");
		FaqList faq=new FaqList();
		faq.setFaqId(String.valueOf(faqid));
		faq.setBuId(bupartyid);
		faq.setFaqQuestionText(newQue);
		faq.setFaqAnswerText(newAns);
		faq.setFaqModuleID(String.valueOf(fAQModuleID));
		faq.setCreatedBy( userSession.getUserId());
		faq.setSourceID(sourceID);*/
		
		//String OBJECT_STRING ="Faq ID"+faqid+"bizUnitName="+ bupartyid +",fAQModuleID="+fAQModuleID +",Question text="+newQue+",Answer Text="+ newAns +",Portal="+sourceID+"Updated by"+userSession.getUserId();
		url = URL_UPDATE_USE_PROFILE_HEIRARCHY + userSession.getUserName()+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, userData, BaseResponse.class);
		Integer codeValueDataList=null;
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			 codeValueDataList= br.getResponseObject();
		//Logger.logEntry(this.getClass(), "codeValueDataList:---"+ codeValueDataList, Logger.DEBUG, Thread.currentThread()				.getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");

		
		
		String UpdateUserList="UserID="+userData.getUserID()+
							  ",RecordTypeId="+ userData.getRecordTypeId()+
							  ",FirstName="+ userData.getFirstName()+
							  ",LastName="+ userData.getLastName()+
							  ",EmailID="+ userData.getEmailID()+
							  ",SecurityQueID="+ userData.getSecurityQueID()+
							  ",SecurityAns="+userData.getSecurityAns()+ 
							  ",StartDate="+ userData.getAccessStartDate()+ 
							  ",EndDate="+ userData.getAccessEndDate()+ 
							  ",RoleID="+ userData.getRoleID()+
							  ",isLocked="+ userData.getisLocked()+ 
							  ",isForceChange="+ userData.getisForceChange()+ 
							  ",LoginAttempts="+ userData.getLoginAttempts()+ 
							  ",lastModifiedBy="+userData.getModifiedBy();
		
		FiinfraUtility.doAudit(userSession.getPartyId(),
								userSession.getUserId(),
								FiinfraConstants.SRP_EDIT_USER_EVENT_ID,
								FiinfraConstants.SERVICE_PORTAL,
								FiinfraConstants.SRP_SOURCE_MODULE_USER,
								FiinfraConstants.SRP_EDIT_USER,
								"SP="+FiinfraConstants.SP_UPDATE_USER+",List="+UpdateUserList,
								"List="+UpdateUserList);
		
		
		
		objectMapper.writeValue(out, codeValueDataList);
		
		}
	
	
	
	
	//ADD NEW USER
	@SuppressWarnings("unchecked")
	public void addNewUser(HttpServletRequest request,HttpServletResponse response, User userData) throws IOException 
		{
		 	int noOfCAPSAlpha = 1;
			int noOfDigits = 1;
			int noOfSplChars = 1;
			int minLen = 8;
			int maxLen = 15;
			String hexString = null;

			char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,noOfCAPSAlpha, noOfDigits, noOfSplChars);
			hexString = new String(pswd);
			
			//String encryptrdPassword = MD5Encryption.encrypt(hexString);
			
			MD5Encryption md5Encryption = new MD5Encryption();
			String encryptrdPassword = md5Encryption.encrypt(hexString);
			
			
			userData.setUserPassword(encryptrdPassword);
			userData.setSecurityQueID(null);
			userData.setSecurityAns(null);
			
			String result = FiinfraConstants.FAIL;
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			int buPartyId=userSession.getBuId();
			int userid=userSession.getUserId();
			userData.setBuPartyId(buPartyId);
	
			userData.setModifiedBy(userid);
			url = URL_ADD_USER + userSession.getUserName()+ "/1234" ;
			BaseResponse<User> br = new BaseResponse<User>();
			br = restTemplate.postForObject(url, userData, BaseResponse.class);
		
			List<User> list = new ArrayList<User>();	
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			list= br.getResponseListObject();
				
			Map<Integer,String> passwordMap=new HashMap<>();
			List<User> myObjects=null;
			ObjectMapper mapper = new CustomJacksonObjectMapper();
			String jsonSuccessString=mapper.writeValueAsString(list);
			logger.debug(jsonSuccessString);
			
 			myObjects = mapper.readValue(jsonSuccessString, mapper.getTypeFactory().constructCollectionType(List.class, User.class));
			for(int i=0;i<list.size();i++)
			{
				if(myObjects.get(i).getPartyId()!=null)
				{
					logger.debug(myObjects.get(i).getPartyId());
					passwordMap.put(myObjects.get(i).getPartyId(), hexString);
				 
					Notification notification=null;
					for(Map.Entry<Integer,String> map:passwordMap.entrySet())
					{
						Map<String,String> payloadMap=new HashMap<String, String>();
						payloadMap.put("Password",map.getValue());
						notification=new Notification();
						notification.setSourceSystemID(31003); //need to add in finfra coinstants
						notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
						notification.setNotifyUserID(userSession.getUserId());
						notification.setNotifyPartyID(map.getKey());
						notification.setNotifyEventID(170); //need to add a param for new admin portal add partner
						notification.setBuId(userSession.getBuId());
						notification.setPayloadMap(payloadMap);
						notification.setSessionID(request.getSession().getId());
						FrameworkUtil.notify(notification);
					} 	 
				}
			}
		
			{
				result = FiinfraConstants.SUCCESS;
			}
			
			SimpleDateFormat formatter = null;
			formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date startDate = null;
			Date endDate = null;
			
			if (userData.getAccessStartDate() != null && !userData.getAccessStartDate().equals("")) 
			{
				String stDate = userData.getAccessStartDate();
				try 
				{
					startDate = (Date) formatter.parse(stDate);
				} 
				catch (ParseException e) 
				{
					//e.printStackTrace();
				}
			}

			if (userData.getAccessEndDate() != null && !userData.getAccessEndDate().equals("")) 
			{
				String edDate = userData.getAccessEndDate();
				try 
				{
					endDate = (Date) formatter.parse(edDate);
				} 
				catch (ParseException e) 
				{
					//e.printStackTrace();
				}
			}
			
			String AddUserList="RecordTypeID="+userData.getRecordTypeId()+
		               ",UserName="+userData.getUserName()+
		               ",FirstName="+userData.getFirstName()+
		               ",LastName="+userData.getLastName()+
		               ",BuPartyId="+userData.getBuPartyId()+
		               ",EmailId="+userData.getEmailID()+
		               ",UserPassword="+userData.getUserPassword()+
		               ",SecurityId="+ userData.getSecurityQueID()+
		               ",SecurityAns="+userData.getSecurityAns()+
		               ",StartDate="+startDate +
		               ",EndDate="+endDate+
		               ",RoeId="+userData.getRoleID()+
		               ",createdBy="+userData.getModifiedBy()+
		               ",lastModifiedby="+userData.getModifiedBy();
			
			FiinfraUtility.doAudit(userSession.getPartyId(),
								   userSession.getUserId(),
					               FiinfraConstants.SRP_ADD_USER_EVENT_ID,
					               FiinfraConstants.SERVICE_PORTAL,
					               FiinfraConstants.SRP_SOURCE_MODULE_USER,
					               FiinfraConstants.SRP_ADD_USER,
					               "SP="+FiinfraConstants.SP_ADD_USER+",List="+AddUserList,
					               "List="+AddUserList);
			
			
			
			
			PrintWriter out = null;
			try 
			{
				out = response.getWriter();
			} 
			catch (IOException e) 
			{
				//e.printStackTrace();
			}

			objectMapper.writeValue(out, result);
			
		}

	   //UPDATE USER
	   @SuppressWarnings("unchecked")
	   public void updateUser(HttpServletRequest request,HttpServletResponse response) throws IOException ,NumberFormatException
			{
		        logger.debug("in update");
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				int modifyBy=userSession.getUserId();
				int userID=0; 
			 
			
					userID = Integer.parseInt(request.getParameter("userId"));	
			
				int recordTypeId=Integer.parseInt(request.getParameter("partytype"));
				String firstName=request.getParameter("firstName");
				String lastName=request.getParameter("lastName");
				int roleID=Integer.parseInt(request.getParameter("roleID"));
				String emailID=request.getParameter("emailID");
				
				String accessStartDate=request.getParameter("accessStartDate");
				String accessEndDate=request.getParameter("accessEndDate");
				Boolean isLocked=Boolean.parseBoolean(request.getParameter("isLogged"));
				Boolean isForceChange=Boolean.parseBoolean(request.getParameter("isForceChange"));
				int loginAttempts = Integer.parseInt(request.getParameter("loginAttempts"));
			
				User userData=new User();
				
				userData.setUserID(userID);
				
				//userData.setPartyId(partyId);
				userData.setRecordTypeId(recordTypeId);
				userData.setFirstName(firstName);
				userData.setLastName(lastName);
				userData.setRoleID(roleID);
				userData.setEmailID(emailID);
				userData.setSecurityQueID(null);
				userData.setSecurityAns(null);
				userData.setAccessStartDate(accessStartDate);
				userData.setAccessEndDate(accessEndDate);
				userData.setisLocked(isLocked);
				userData.setisForceChange(isForceChange);
				userData.setLoginAttempts(loginAttempts);
				userData.setModifiedBy(modifyBy);
				url = URL_UPDATE_USER + userSession.getUserName()+ "/1234" + userSession.getBuId();
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
				//Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<Integer> br = new BaseResponse<Integer>();
			
				br = restTemplate.postForObject(url, userData, BaseResponse.class);
				
				Integer UserDataList=null;
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				UserDataList= br.getResponseObject();
				
				
				String UpdateUserList="UserID="+userData.getUserID()+
									  ",RecordTypeId="+ userData.getRecordTypeId()+
									  ",FirstName="+ userData.getFirstName()+
									  ",LastName="+ userData.getLastName()+
									  ",EmailID="+ userData.getEmailID()+
									  ",SecurityQueID="+ userData.getSecurityQueID()+
									  ",SecurityAns="+userData.getSecurityAns()+ 
									  ",StartDate="+ accessStartDate+ 
									  ",EndDate="+ accessEndDate+ 
									  ",RoleID="+ userData.getRoleID()+
									  ",isLocked="+ userData.getisLocked()+ 
									  ",isForceChange="+ userData.getisForceChange()+ 
									  ",LoginAttempts="+ userData.getLoginAttempts()+ 
									  ",lastModifiedBy="+userData.getModifiedBy();
				
				FiinfraUtility.doAudit(userSession.getPartyId(),
										userSession.getUserId(),
										FiinfraConstants.SRP_EDIT_USER_EVENT_ID,
										FiinfraConstants.SERVICE_PORTAL,
										FiinfraConstants.SRP_SOURCE_MODULE_USER,
										FiinfraConstants.SRP_EDIT_USER,
										"SP="+FiinfraConstants.SP_UPDATE_USER+",List="+UpdateUserList,
										"List="+UpdateUserList);
				
				
				
				
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, UserDataList);
			}
			
	     //RESET PASSWORD
		 @SuppressWarnings("unchecked")
		 public void repassword(HttpServletRequest request,HttpServletResponse response, User userData) throws IOException 
		 {
			    int userID = Integer.parseInt(request.getParameter("userId"));
			 	int noOfCAPSAlpha = 1;
				int noOfDigits = 1;
				int noOfSplChars = 1;
				int minLen = 8;
				int maxLen = 15;
				String hexString = null;

				char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,noOfCAPSAlpha, noOfDigits, noOfSplChars);
				hexString = new String(pswd);
				
				String password= null;
				password=(hexString);
				MD5Encryption md5Encryption = new MD5Encryption();
				String encryptrdPassword = md5Encryption.encrypt(hexString);
				
				userData.setUserPassword(encryptrdPassword);
				userData.setUserID(userID);   
				
				UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			    
				url = URL_RESETPASSWORD + "ramu/1234";
				
				BaseResponse<String> br = new BaseResponse<String>();
				br = restTemplate.postForObject(url, userData, BaseResponse.class);
				
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, password);
		 }
	
		//LOGIN HISTORY PAGE USER LIST
		@SuppressWarnings("unchecked")
		public ModelAndView loadLoginHist(HttpServletRequest request,HttpServletResponse response) 
			{
				    UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				
				    //Code for display sub tab
				    System.out.println("currentPage="+request.getParameter("currentPage"));
				    String page=request.getParameter("currentPage");
				    request.setAttribute("codes",page);
				    //end for display sub tab
				    
				    int userid = Integer.parseInt(request.getParameter("userId"));
					String pagesize = request.getParameter("pageSize");
					if (pagesize == null) {
						pagesize = "100";
					}
					
					String searchTextVal = null;
					if (request.getParameterMap().containsKey("searchtext")) 
					{
						searchTextVal = request.getParameter("searchtext").trim();
					} else
					{
						searchTextVal = "";
					}
				    ModelAndView mav = new ModelAndView("partner/loginhisto");
				    int buid = userSession.getBuId();
					try 
					{
						url = URL_GET_USERLOGIN_HISTORY+"ramu"+"/1234";
						UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

						LoginHistory loginHistory = new LoginHistory();
						loginHistory.setBuId(buid+"");   
						loginHistory.setUserId(userid); 
						loginHistory.setSearchText(searchTextVal);
						
						
						BaseResponse<LoginHistory> br = new BaseResponse<LoginHistory>();
						br = restTemplate.postForObject(url, loginHistory, BaseResponse.class);
						List<LoginHistory> loginhist = new ArrayList<LoginHistory>();
						
						if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
							loginhist = br.getResponseListObject();
						
						
						//mav.addObject("loginHist", loginhist);
						mav.addObject("loginHist",objectMapper.writeValueAsString(loginhist));
						mav.addObject("size", pagesize);
						@SuppressWarnings("unused")
						PrintWriter out= null; 
						try 
						{
							out = response.getWriter();
						}
						catch (Exception e) 
						{
							//e.printStackTrace();
						}
					} 
					catch (Exception e)
					{
						//e.printStackTrace();
					}
						
						return mav;

			}

		//AUDIT HISTORY PAGE USER LIST	 
		@SuppressWarnings("unchecked")
		public ModelAndView loadAuditHistory(HttpServletRequest request,HttpServletResponse response) 
			{

				    UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				    
				    int userID = Integer.parseInt(request.getParameter("userId"));
				    String userName= request.getParameter("userName");
					String pagesize = request.getParameter("pageSize");
					if (pagesize == null) 
					{
						pagesize = "100";
					}
					
					String searchTextVal = null;
					if (request.getParameterMap().containsKey("searchtext")) 
					{
						searchTextVal = request.getParameter("searchtext").trim();
					} else
					{
						searchTextVal = "";
					}
				    ModelAndView mav = new ModelAndView("user/auditHistory");
				    int buPartyId = userSession.getBuId();
					try 
					{
						url = URL_GET_USERAUDIT_HISTORY+"ramu"+"/1234";
						UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

						User userData = new User();
						//User.setBuId(buid+"");
						userData.setBuPartyId(buPartyId);
						userData.setUserID(userID);
						userData.setSearchText(searchTextVal);
						
						
						BaseResponse<User> br = new BaseResponse<User>();
						br = restTemplate.postForObject(url, userData, BaseResponse.class);
						List<User> auditHistory = new ArrayList<User>();
						
						if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						auditHistory = br.getResponseListObject();
						
						
						//mav.addObject("auditHistory", auditHistory);
						mav.addObject("auditHistory",objectMapper.writeValueAsString(auditHistory));
						mav.addObject("userName",userName);
						mav.addObject("size", pagesize);
						@SuppressWarnings("unused")
						PrintWriter out= null; 
						try 
						{
							out = response.getWriter();
						}
						catch (Exception e) 
						{
							//e.printStackTrace();
						}
					} 
					catch (Exception e)
					{
						//e.printStackTrace();
					}
						
						return mav;
			}

		//USER EXECLE
		@SuppressWarnings("unchecked")
		public void userExecl(HttpServletRequest request, HttpServletResponse response) 
		{
			  logger.debug("IN USER EXECL");
			  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			  try
			  {
			   if(userSession == null) 
			   {
				   response.sendRedirect("/login");
				   return ;
			   }
			   String searchTextVal = null;
				if (request.getParameterMap().containsKey("searchtext")) 
				{
					searchTextVal = request.getParameter("searchtext").trim();
				} 
				else 
				{
					searchTextVal = "";
				}
			  BaseResponse<User> baseResponse = new BaseResponse<User>();
			  User userData= new User();
			  userData.setSearchText(searchTextVal); 
			  url = URL_GET_USER_LIST_BU+"ramu"+"/1234";
			
			  baseResponse = restTemplate.postForObject(url, userData, BaseResponse.class); 
			  List<User> userListAsJson = new ArrayList<User> ();
			  List<User> userList = new ArrayList<User> ();
			  
			  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			  {
			   try 
			   {
				   userListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
				   for(int i = 0; i<userListAsJson.size(); i++)
				   {
					   User userList2;
					   userList2 = objectMapper.readValue(objectMapper.writeValueAsString(userListAsJson.get(i)), User.class);	
					   userList.add(userList2);
				   }
			   } 
			   catch (JsonParseException e) 
			   {
				   //e.printStackTrace();
			   } 
			   catch (JsonMappingException e) 
			   { 
				   //e.printStackTrace();
			   } 
			   catch (JsonGenerationException e) 
			   {
				   //e.printStackTrace();
			   } 
			   catch (IOException e) 
			   {			    
				   //e.printStackTrace();
			   }
			  }
			  
			   response.addHeader("Content-Disposition", "attachment;filename=UserList.xls");
			   
			   PrintWriter writer = response.getWriter();
			   writer.print(CommonUtils.escape("User Type "));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("User Name"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("Biz Unit"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("Email ID"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("Contact No"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("Assigned Role"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("Last Login Time"));	   
			   writer.println();
			   
			   for(User list:userList)
			   {
			    writer.print(CommonUtils.escape(list.getCodeValueName()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getUserName()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getLastName()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getEmailID()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getContactMobile()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getRoleName()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getLastLoginTime()));
				writer.println();
			   }
			  } 
			  catch (IOException e) 
			  {
			      //e.printStackTrace();
			  }
			 }

		//USER CSV 
		@SuppressWarnings("unchecked")
		public void userCSV(HttpServletRequest request, HttpServletResponse response) 
		 {
			  logger.debug("IN USER CSV");
			  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			  try
			  {
			   if(userSession == null) 
			   {
			   response.sendRedirect("/login");
			   return ;
			   }
			   
			   String searchTextVal = null;
				if (request.getParameterMap().containsKey("searchtext")) 
				{
					searchTextVal = request.getParameter("searchtext").trim();
				}
				else 
				{
					searchTextVal = "";
				}
			  BaseResponse<User> baseResponse = new BaseResponse<User>();
			  User userData= new User();
			  userData.setSearchText(searchTextVal); 
			  url = URL_GET_USER_LIST_BU+"ramu"+"/1234";
			  baseResponse = restTemplate.postForObject(url, userData, BaseResponse.class);
			  
			  List<User> userListAsJson = new ArrayList<User> ();
			  List<User> userList = new ArrayList<User> ();
			  
			  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			  {
			   try
			   {
				   userListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
			       
				   for(int i = 0; i<userListAsJson.size(); i++)
				   {
					   User userList2;
					   userList2 = objectMapper.readValue(objectMapper.writeValueAsString(userListAsJson.get(i)), User.class);
					   userList.add(userList2);
				   }

			   } 
			   catch (JsonParseException e) 
			   {
				   //e.printStackTrace();
			   } 
			   catch (JsonMappingException e) 
			   {			    
				   //e.printStackTrace();
			   } 
			   catch (JsonGenerationException e) 
			   {			    
				   //e.printStackTrace();
			   } 
			   catch (IOException e) 
			   {			    
				   //e.printStackTrace();
			   }	
			  }
			 
			   response.addHeader("Content-Disposition", "attachment;filename=UserList.csv");
			    
			   PrintWriter writer = response.getWriter();
			   writer.print(CommonUtils.escape("User Type"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("User Name"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("Biz Unit"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("Email ID"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("Contact No"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("Assigned Role"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("Last Login Time"));		   
			   writer.println();
			   
			   for(User list:userList)
			   {   
			    writer.print(CommonUtils.escape(list.getCodeValueName()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getUserName()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getLastName()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getEmailID()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getContactMobile()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getRoleName()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getLastLoginTime()));
				writer.println();
			   }
			       
			  } 
			  catch (IOException e) 
			  {
			      //e.printStackTrace();
			  }
			 }

		 
		//AUDIT HISTORY EXECL
		@SuppressWarnings("unchecked")
		public void userAuditHistoryExecl(HttpServletRequest request, HttpServletResponse response) 
		{
			  logger.debug("IN AUDIT HISTORY EXECL");
			  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			  int userID = Integer.parseInt(request.getParameter("userId"));
			  try
			  {
			   if(userSession == null) 
			   {
				   response.sendRedirect("/login");
				   return ;
			   }
			   String searchTextVal = null;
				if (request.getParameterMap().containsKey("searchtext")) 
				{
					searchTextVal = request.getParameter("searchtext").trim();
				} 
				else 
				{
					searchTextVal = "";
				}
			  BaseResponse<User> baseResponse = new BaseResponse<User>();
			  User userData= new User();
			  userData.setSearchText(searchTextVal); 
			  userData.setUserID(userID);
			  url = URL_GET_USERAUDIT_HISTORY+"ramu"+"/1234";
			
			  baseResponse = restTemplate.postForObject(url, userData, BaseResponse.class); 
			  List<User> userListAsJson = new ArrayList<User> ();
			  List<User> userList = new ArrayList<User> ();
			  
			  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			  {
			   try 
			   {
				   userListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
				   for(int i = 0; i<userListAsJson.size(); i++)
				   {
					   User userList2;
					   userList2 = objectMapper.readValue(objectMapper.writeValueAsString(userListAsJson.get(i)), User.class);	
					   userList.add(userList2);
				   }
			   } 
			   catch (JsonParseException e) 
			   {
				   //e.printStackTrace();
			   } 
			   catch (JsonMappingException e) 
			   { 
				   //e.printStackTrace();
			   } 
			   catch (JsonGenerationException e) 
			   {
				   //e.printStackTrace();
			   } 
			   catch (IOException e) 
			   {			    
				   //e.printStackTrace();
			   }
			  }
			  
			   response.addHeader("Content-Disposition", "attachment;filename=userAuditHistoryList.xls");
			   
			   PrintWriter writer = response.getWriter();
			   writer.print(CommonUtils.escape("Partner Name"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("User Name"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("Event ID"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("Source System ID"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("Source Module"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("Source Screen"));
			   writer.print("\t");
			   writer.print(CommonUtils.escape("Audit Date Time"));	   
			   writer.println(); 
			   
			   for(User list:userList)
			   {
			    writer.print(CommonUtils.escape(list.getPartyName()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getUserName()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getEventID()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getSourceSystemID()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getSourceModule()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getSourceScreen()));
			    writer.print("\t");
			    writer.print(CommonUtils.escape(list.getAuditdatetime()));
				writer.println();
			   }
			  } 
			  catch (IOException e) 
			  {
			      //e.printStackTrace();
			  }
			 }

		//AUDIT HISTORY CSV
		@SuppressWarnings("unchecked")
		public void userAuditHistoryCSV(HttpServletRequest request, HttpServletResponse response) 
		 {
			  logger.debug("IN AUDIT HISTORY CSV");
			  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			  int userID = Integer.parseInt(request.getParameter("userId"));
			  try
			  {
			   if(userSession == null) 
			   {
			   response.sendRedirect("/login");
			   return ;
			   }
			   
			   String searchTextVal = null;
				if (request.getParameterMap().containsKey("searchtext")) 
				{
					searchTextVal = request.getParameter("searchtext").trim();
				}
				else 
				{
					searchTextVal = "";
				}
			  BaseResponse<User> baseResponse = new BaseResponse<User>();
			  User userData= new User();
			  userData.setSearchText(searchTextVal);
			  userData.setUserID(userID);
			  url = URL_GET_USERAUDIT_HISTORY+"ramu"+"/1234";
			  baseResponse = restTemplate.postForObject(url, userData, BaseResponse.class);
			  
			  List<User> userListAsJson = new ArrayList<User> ();
			  List<User> userList = new ArrayList<User> ();
			  
			  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			  {
			   try
			   {
				   userListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
			       
				   for(int i = 0; i<userListAsJson.size(); i++)
				   {
					   User userList2;
					   userList2 = objectMapper.readValue(objectMapper.writeValueAsString(userListAsJson.get(i)), User.class);
					   userList.add(userList2);
				   }

			   } 
			   catch (JsonParseException e) 
			   {
				   //e.printStackTrace();
			   } 
			   catch (JsonMappingException e) 
			   {			    
				   //e.printStackTrace();
			   } 
			   catch (JsonGenerationException e) 
			   {			    
				   //e.printStackTrace();
			   } 
			   catch (IOException e) 
			   {			    
				   //e.printStackTrace();
			   }	
			  }
			 
			   response.addHeader("Content-Disposition", "attachment;filename=userAuditHistoryList.csv");
			    
			   PrintWriter writer = response.getWriter();
			   writer.print(CommonUtils.escape("Partner Name"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("User Name"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("Event ID"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("Source System ID"));            
			   writer.print(",");
			   writer.print(CommonUtils.escape("Source Module"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("Source Screen"));
			   writer.print(",");
			   writer.print(CommonUtils.escape("Audit Date Time"));		   
			   writer.println();
			   
			   for(User list:userList)
			   {   
			    writer.print(CommonUtils.escape(list.getPartyName()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getUserName()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getEventID()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getSourceSystemID()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getSourceModule()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getSourceScreen()));
			    writer.print(",");
			    writer.print(CommonUtils.escape(list.getAuditdatetime()));
				writer.println();
			   }
			       
			  } 
			  catch (IOException e) 
			  {
			      //e.printStackTrace();
			  }
			 }
	
		
}
