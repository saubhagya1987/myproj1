package in.fiinfra.controller;

import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.service.vo.LoggedUser;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;
import in.fiinfra.common.util.MD5Encryption;
import in.fiinfra.common.web.CustomJacksonObjectMapper;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonParseException;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.ContactUsData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.SearchResultData;
import in.fiinfra.common.common.UserData;
import in.fiinfra.cp.TestimonialData;

public class CommonController extends MultiActionController {

	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(CommonController.class);
	String url;
	
	 
	@Value("${LOGOUT_URL}") 
	private  String LOGOUT_URL;
	@Value("${URL_CHANGE_PASSWORD}")
	private String URL_CHANGE_PASSWORD;
	@Value("${URL_GET_CONTACT_LIST}")
	private String URL_GET_CONTACT_LIST;
	
	
	@Value("${URL_GET_CITY_LIST}") 
	private  String URL_GET_CITY_LIST;
	
	@Value("${URL_GET_USER_PASSWORD}")
	private String URL_GET_USER_PASSWORD;
	

	@Value("${URL_GET_SAVE_USER_PASSWORD}")
	private String URL_GET_SAVE_USER_PASSWORD;
	
	@Value("${URL_GET_USER_PROFILE}")
	private String URL_GET_USER_PROFILE;
	
	@Value("${URL_GET_UPDATE_PROFILE}")
	private String URL_GET_UPDATE_PROFILE;
	
	@Value("${URL_GET_SEARCH_LIST}")
	private String URL_GET_SEARCH_LIST;
	
	@Value("${URL_GET_DOCUMENT_RECORD}")
	private String URL_GET_DOCUMENT_RECORD;
	/**
	 * retrieves searchResultDatas list based on the party.
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonGenerationException 
	 */
	@SuppressWarnings("unchecked")
	public ModelAndView getSearchList(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		int partyId=userSession.getPartyId();
		//int partyId=userSession.getBuId(); 
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";   
		}
		
		System.out.println("pageSize------"+pagesize);
		String searchText=request.getParameter("serachText");
		request.setAttribute("serachText", searchText);
		
		String url = FiinfraUtility.getRestDBURL();
		 
		//url = url + "services/opportunity/getOpportunitiesList/"+userSession.getUserName()+"/1234";
		url=URL_GET_SEARCH_LIST+userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);System.out.println("partyId"+ partyId);
		uriCB.queryParam("buId", buId);System.out.println("buId"+ buId);
		uriCB.queryParam("searchText", searchText);System.out.println("serachText------"+searchText); 
		
		System.out.println("URL Search Result.............");
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		BaseResponse<SearchResultData> br = new BaseResponse<SearchResultData>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	
		List<SearchResultData> searchResultDatas=new ArrayList<>();	
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			searchResultDatas=br.getResponseListObject();
		
		Logger.logEntry(this.getClass(), "searchResultDatas:---" + searchResultDatas, Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());
		
		ModelAndView mav = new ModelAndView("common/searchresult");	
		mav.addObject("searchResultDatas", objectMapper.writeValueAsString(searchResultDatas));
		mav.addObject("pagesize", pagesize); 
		
		return mav;
	}   
 
	/**
	 * Downloads the document
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public String downloadDocument(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
					String error = null;
					String searchText = null;
					 
					if (request.getParameterMap().containsKey("error")) {
					error = request.getParameter("error").trim();
					} 
				
				try { 
					
					System.out.println("URL --> " + url);
					UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
					url = URL_GET_DOCUMENT_RECORD+userSession.getUserName()+"/1234";
					int docId=Integer.parseInt(request.getParameter("docId"));
					    
					int buId=userSession.getBuId(); 
					UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
					uriCB.queryParam("docId",docId);
					uriCB.queryParam("buId",buId); 
					
					searchText=request.getParameter("searchtextId");  
					System.out.println("searchText................."+searchText); 
					  
				
					//		DocumentData documentData=(DocumentData) FiinfraUtility.postRequest(uriCB,DocumentData.class,restTemplate);
					BaseResponse<DocumentData> br = new BaseResponse<DocumentData>();
					br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
					DocumentData documentData=new DocumentData();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) 
						documentData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), DocumentData.class);
					//			documentData=br.getResponseObject();
					System.out.println("file name is:--"+documentData.getDocumentName());
					System.out.println("file path is:--"+documentData.getFileStoragePathURI());
				
					
					InputStream file;
					try
					{
						 file = new FileInputStream(new File(documentData.getFileStoragePathURI()));	
					}
					 catch(Exception e)
					 {
						 String data=documentData.getFileStoragePathURI().replaceAll(" ","");
						 
						 file = new FileInputStream(new File(data));
					 }
					System.out.println("file:----"+file.available());
					response.setContentType("application/octet-stream");
					response.setHeader("Content-Disposition","attachment; filename=\"" + documentData.getDocumentName() +"\"");
					FileCopyUtils.copy(file, response.getOutputStream());
					
					
					/*	InputStream file = new FileInputStream(new File(documentData.getFileStoragePathURI())); 
					System.out.println("file:----"+file.available());
					response.setContentType("application/octet-stream");
					response.setHeader("Content-Disposition","attachment; filename=\"" + documentData.getDocumentName() +"\"");
					FileCopyUtils.copy(file, response.getOutputStream());*/
				} catch (Exception e) {    
					// TODO Auto-generated catch block
					return "redirect:/common/getSearchList.htm?serachText="+searchText+"&error=true";     
				}   
				 
				return "";
			}      
	 
	/**
	 * Downloads the document
	 * @param request 
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void downloadAttachmentDownload(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		System.out.println("URL --> " + url);
		System.out.println("In downloadAttachmentDownload123");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		String path= request.getSession().getServletContext()
				.getRealPath("/")+"/OpportunityBulkUploadTemplate.xls";
		InputStream file = new FileInputStream(new File(path));
		System.out.println("file:----"+file.available());
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment; filename=\"OpportunityBulkUploadTemplate.xls\"");
        FileCopyUtils.copy(file, response.getOutputStream());
	}    
	
	
	public void getContactUsRecord(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/common/getContactUsRecord/"+userSession.getUserName()+"/1234";
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<ContactUsData> contactUsData = (List<ContactUsData>) FiinfraUtility.postRequest(uriCB, Object.class, restTemplate); 

		Logger.logEntry(this.getClass(), "Contacts  :---"
				+ contactUsData, Logger.DEBUG, Thread.currentThread()
				.getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, contactUsData);
	}

	
	
	@SuppressWarnings("unchecked")
	public void getContactDetailsList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String roleId;
		String loggedInUserPartyId;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
		int buId=userSession.getBuId();
		try {
			
			loggedInUserPartyId = "118769" ;//request.getParameter("loggedInUserPartyId");
			roleId= "1";//request.getParameter("roleId");
			System.out.println("URL --> " + url);
			url = URL_GET_CONTACT_LIST+"amruta/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("roleId", roleId);
			uriCB.queryParam("loggedInUserPartyId",loggedInUserPartyId);
			uriCB.queryParam("buId",buId);
			System.out.println("URL --> " + url);
			System.out.println(FiinfraUtility.getURLWithParams(uriCB));
			List<CodeValueData> codeValueDataList = Arrays.asList(restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), CodeValueData[].class).getBody());
			
//			Gson gson= new Gson();
//			  System.out.println("codeValueDataList========="+gson.toJson(codeValueDataList));
			
			System.out.println("codeValueDataList :---"+codeValueDataList);
			Logger.logEntry(this.getClass(), "codeValueDataList:---" + codeValueDataList,
					Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
//			List<ChatterData> chatterDataList=(List<ChatterData>) FiinfraUtility.postRequest(uriCB,List.class,restTemplate);
			PrintWriter out= null; 
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			objectMapper.writeValue(out, codeValueDataList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
		public void changePassword(HttpServletRequest request,HttpServletResponse response,UserData userData) throws IOException{
//		String oldPassword=request.getParameter("oldPassword");
//		String newPassword=request.getParameter("newPassword");
//		String confirmPassword=request.getParameter("confirmPassword");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		userData.setPartyId(userSession.getPartyId());
		MD5Encryption md5Encryption = new MD5Encryption();
		String encryptrdPassword = md5Encryption.encrypt(userData.getOldPassword());
	//	String encryptrdPassword = MD5Encryption.encrypt(userData.getOldPassword());
	//	userData.setOldPassword(encryptrdPassword);
	
	encryptrdPassword = md5Encryption.encrypt(userData.getNewPassword());
		//1 encryptrdPassword = MD5Encryption.encrypt(userData.getNewPassword());
		
		userData.setNewPassword(encryptrdPassword);
		userData.setUserId(userSession.getUserId());
		url = URL_CHANGE_PASSWORD+userSession.getName()+"/1234?buId="+userSession.getBuId();
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, userData, BaseResponse.class);
		Integer result=0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);
		
	}
		
		public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException 
		{
			//String redirectUrl="login.htm";
			String serverPath=request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath());
			System.out.println("server path:---"+request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath()));
			//redirectUrl=serverPath+"/login.htm";
			request.getSession().invalidate();
			response.sendRedirect(LOGOUT_URL);
//			return redirectUrl;
		}
		
		
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
		
		/*public String redirect1(HttpServletRequest request,HttpServletResponse response) throws IOException 
		{
			System.out.println("in------Service Portal redirect");
			String redirectUrl=null;
			String password=null;
			// call stored proc for successful login
			try{
				
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				if(userSession.getSuccessfulLoginCount()<1 && userSession.getRoleId()==FiinfraConstants.PARTNER_ROLE){
					redirectUrl="redirect:/setup.htm";
					}
				if(userSession.getIsForceChangePasswordOnLogin()==true && userSession.getSuccessfulLoginCount()>0){
					redirectUrl="redirect:/common/changePassword.htm";
				}else{
					try{
						String baseUrl = "";
						Integer userid=0;
						String ipaddress="";
						String sessionId="";
						String username="";
						if(userSession != null)
						{
							userid = userSession.getUserId();
							username = userSession.getUserName();
							password = request.getSession().getAttribute("password").toString();
//							password = new MD5Encryption().encrypt(password);
							ipaddress = request.getRemoteAddr();
							sessionId = request.getSession().getId();
						}
						
						if ( ( request.getServerPort() == 80 ) ||
						         ( request.getServerPort() == 443 ) ){
							baseUrl = request.getScheme() + "://" + request.getServerName() ;				
						}
						else{
							baseUrl = request.getScheme() + "://" +
							        request.getServerName() + ":" + request.getServerPort();				
						}
						String portalURL = baseUrl+"/FIINFRA-WEB/index.htm" ;
						response.setHeader("token", userSession.getUserName());
						//log user for successfull login
						saveUserAccessLog(userid, password, portalURL, sessionId, ipaddress, username);
						userSession.setSuccessfulLoginCount(1);
						request.getSession().setAttribute("userSession", userSession);
					}catch(Exception e){
						e.printStackTrace();
					}
					redirectUrl="redirect:/home/home.htm";
				}
			}catch(Exception ex){
				ex.printStackTrace();
				logger.error("Error in login", ex);
			}
			return redirectUrl;
		}
		public  void saveUserAccessLog(Integer userId,String password,String url,String sessionId,String ipAddress,String username)
		{
			String token = "23d";
			UserAccessLog accessLog = new UserAccessLog();
			accessLog.setUserId(userId);
			accessLog.setLoginAccessModeId(FiinfraConstants.LOGIN_ACCESS_MODE_STANDARD);
			accessLog.setEnteredPassword(password);
			accessLog.setLoginSuccessful(1);
			accessLog.setRedirectUrl(url);
			accessLog.setSessionId(sessionId);
			accessLog.setSourceIPAddress(ipAddress);
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_USER_ACCESS_LOG+ username+"/" + token);
			BaseResponse<Boolean> br = new BaseResponse<Boolean>();
			br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), accessLog, BaseResponse.class);
			
			
		}
	*/	

		

		@SuppressWarnings("unchecked")
		@RequestMapping(value = "/getCheckPassword", method = RequestMethod.GET)
		public void getCheckPassword(HttpServletRequest request,
				HttpServletResponse response,User user1) throws Exception {

			logger.info("Get code  value from  parent Id ");
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			
			url = URL_GET_USER_PASSWORD + "fgsdfg/1234";
		//	String password = request.getParameter("password");
			String password=user1.getOldPassword();
			
			String newPassword=(password);
		    MD5Encryption md5Encryption = new MD5Encryption();
		    String encryptrdPassword = md5Encryption.encrypt(newPassword);

		  //  String encryptrdPassword = MD5Encryption.encrypt(newPassword);
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			User user= new User();
			user.setUserID(userSession.getUserId());
			user.setUserPassword(encryptrdPassword);
		//	Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			
			br = restTemplate.postForObject(url, user, BaseResponse.class);
			Integer codeValueDataList = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				codeValueDataList = br.getResponseObject();
		
			System.out.println("codeValueDataList      "+codeValueDataList);
			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, codeValueDataList);
		}
		
		
		@SuppressWarnings("unchecked")
		//@RequestMapping(value = "/updatePassword", method = RequestMethod.GET)
		public void updatePassword(HttpServletRequest request,
				HttpServletResponse response,User user1) throws Exception {

			logger.info("Update password");
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			
			url = URL_GET_SAVE_USER_PASSWORD + "cvnghng/1234";
		/*	String password = request.getParameter("newpassword");
			
			System.out.println(password+"pass");
			String updatedPassword=(password);*/
		    MD5Encryption md5Encryption = new MD5Encryption();
		    String encryptrdPassword = md5Encryption.encrypt(user1.getNewPassword());
		  //  String encryptrdPassword = MD5Encryption.encrypt(updatedPassword);
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			User user= new User();
			user.setUserID(userSession.getUserId());
			user.setUserPassword(encryptrdPassword);
		//	Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			
			br = restTemplate.postForObject(url, user, BaseResponse.class);
			Integer codeValueDataList = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				codeValueDataList = br.getResponseObject();
		
			
			
			
			
			String OBJECT_STRING="User ID="+userSession.getUserId()+",Password="+user.getUserPassword();
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_CHANGE_PASSWORD,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_SELF,FiinfraConstants.SRP_SOURCE_MODULE_SELF,"SP="+FiinfraConstants.SP_UPDATE_PROFILE_PWD,OBJECT_STRING);
			
			
			
			
			
		//	System.out.println("codeValueDataList     naval bhai "+codeValueDataList);
			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, codeValueDataList);
		}
		
		
		
		
	
		
		public ModelAndView loaduserpassword(HttpServletRequest request,
				HttpServletResponse response) {
			logger.info("Load General Page ");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");

			ModelAndView mav = new ModelAndView("common/ViewgeneralPassword");

			return mav;

		}

		@SuppressWarnings("unchecked")
		public ModelAndView loaduserProlife(HttpServletRequest request,	HttpServletResponse response,User u) {
			logger.info("Load General Profile Page yes");
		
			logger.info("Load Bizunit List ");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			ModelAndView mav = new ModelAndView("common/ViewgeneralProfile");
		
			
			String userToken = null;
			if(userSession.getUserName()!=null){
				userToken = userSession.getUserName();
			}
			else{
				userToken = "abc";
			}


			try {

				BaseResponse<User> br = new BaseResponse<User>();
				User user= new User();
				user.setUserID(userSession.getUserId());
				url = URL_GET_USER_PROFILE + userToken + "/1234";
				br = restTemplate.postForObject(url, user, BaseResponse.class);
				System.out.println("m bhai");
				List<User> userlist = new ArrayList<User>();
				List<User> userList2 = new ArrayList<User>();
				ObjectMapper mapper = new ObjectMapper();
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					userlist =objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
				
				
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					userlist  = br.getResponseListObject();
				System.out.println(" dfg");
				System.out.println(userlist);
			
	
				List<User> myObjects=null;
				
				ObjectMapper mapper2 = new CustomJacksonObjectMapper();
				String jsonSuccessString=mapper.writeValueAsString(userlist);
				logger.info(jsonSuccessString);
				 myObjects = mapper2.readValue(jsonSuccessString, mapper2.getTypeFactory().constructCollectionType(List.class, User.class));
		//value.add(myObjects.get(i).getTime());
				//	for(User list :userlist ){
				 for(int i=0;i<userlist.size();i++){
				
					 System.out.println(" in");
					 
					 if (myObjects.get(i).getFirstName() == null) {
							mav.addObject("firstName", "");
						} else {
							  mav.addObject("firstName",myObjects.get(i).getFirstName());
							//request.setAttribute("lastName",myObjects.get(i).getLastName());
						}
					 
					if (myObjects.get(i).getLastName() == null) {
						mav.addObject("lastName", "");
					} else {
						  mav.addObject("lastName",myObjects.get(i).getLastName());
						//request.setAttribute("lastName",myObjects.get(i).getLastName());
					}
					
					if (myObjects.get(i).getUserName() == null) {
						mav.addObject("userName", "");
					} else {
						mav.addObject("userName", myObjects.get(i).getUserName());
					}
					
					if (myObjects.get(i).getPartyName()== null) {
						mav.addObject("partyName", "");
					} else {
						mav.addObject("partyName", myObjects.get(i).getPartyName());
					}
					
					if (myObjects.get(i).getEmailID()== null) {
						mav.addObject("emailID", "");
					} else {
						mav.addObject("emailID", myObjects.get(i).getEmailID());
					}
					
					
					if (myObjects.get(i).getEmailName() == null) {
						mav.addObject("emailName", "");
					} else {
						mav.addObject("emailName", myObjects.get(i).getEmailName());
					}
					
					if (myObjects.get(i).getContactMobile()== null) {
						mav.addObject("contactMobile", "");
					} else {
						mav.addObject("contactMobile", myObjects.get(i).getContactMobile());
					}

					
					if (myObjects.get(i).getPanNo()== null) {
						mav.addObject("panNo", "");
					} else {
						mav.addObject("panNo", myObjects.get(i).getPanNo());
					}

					if (myObjects.get(i).getArn() == null) {
						mav.addObject("arn", "");
					} else {
						mav.addObject("arn", myObjects.get(i).getArn());
					}
					
					
					if (myObjects.get(i).getTheme()== 0) {
						mav.addObject("theme", "");
					} else {
						mav.addObject("theme", myObjects.get(i).getTheme());
					}

				}
				
				
				//System.out.println("list list hiiiii");
				//addObject("UnitBiz", list);
			
				PrintWriter out = null;
				

				
				return mav;

			} catch (Exception e) {
				e.printStackTrace();
			}
			return mav;

		}
		
		
		
	
		@SuppressWarnings("unchecked")
		//@RequestMapping(value = "/updatePassword", method = RequestMethod.GET)
		public void updateProfile(HttpServletRequest request,
				HttpServletResponse response,User user) throws Exception {

			logger.info("Update password");
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			
			url = URL_GET_UPDATE_PROFILE + "cvnghng/1234";
		/*	String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String emailID = request.getParameter("emailID");
			String emailName = request.getParameter("emailName");
			String contactMobile = request.getParameter("contactMobile");
			String panNo = request.getParameter("panNo");
			String arn = request.getParameter("arn");
			Integer theme = Integer.parseInt(request.getParameter("theme"));
			String themename = request.getParameter("themename");*/
			
			
		///	System.out.println(lastName+"lastName");
			
			user.setUserID(userSession.getUserId());
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//	User user= new User();
	/*		
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setEmailID(emailID);
			user.setEmailName(emailName);
			user.setContactMobile(contactMobile);
			user.setPanNo(panNo);
			user.setArn(arn);
			user.setTheme(theme);
			userSession.setThemeName(themename);*/
		//	Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			
			//System.out.println(user.getThemName()+"data");
			userSession.setThemeName(user.getThemName());
			
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			
			br = restTemplate.postForObject(url, user, BaseResponse.class);
			Integer codeValueDataList = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				codeValueDataList = br.getResponseObject();
		
			
		//	String OBJECT_STRING="User ID="+userSession.getUserId()+",First Name="+firstName+",Last Name="+lastName+",EmailId="+emailID+"Email Name="+emailName+",Contact Number="+contactMobile+",Pan Number="+panNo+",Arn"+arn+",Theme"+theme;
		//	FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_CHANGE_PROFILE,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_SELF,FiinfraConstants.SRP_SOURCE_MODULE_SELF,"SP="+FiinfraConstants.SP_UPDATE_PROFILE,OBJECT_STRING);
			
			
			
			//System.out.println("codeValueDataList     "+codeValueDataList);
			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, codeValueDataList);
		}
		public void getCityList(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			url = URL_GET_CITY_LIST+userSession.getUserName()+"/1234";
			int parentId=Integer.parseInt(request.getParameter("parentId"));
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("parentId", parentId);
			uriCB.queryParam("buId", userSession.getBuId());
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
					.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			logger.info("br:------"+br);
			List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				 codeValueDataList= br.getResponseListObject();
			
			logger.info("codeValueDataList:------"+codeValueDataList);
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, codeValueDataList);
		}
		
	 
		
		/**
		 * Downloads the document
		 * @param request
		 * @param response
		 * @throws IOException
		 */
		@SuppressWarnings("unchecked")
		public String downloadDocuments(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
						String error = null;
						String searchText = null;
						 
						if (request.getParameterMap().containsKey("error")) {
						error = request.getParameter("error").trim();
						} 
					
					try { 
						
						System.out.println("URL --> " + url);
						UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
						url = URL_GET_DOCUMENT_RECORD+userSession.getUserName()+"/1234";
						int docId=Integer.parseInt(request.getParameter("docId"));
						    
						int buId=userSession.getBuId(); 
						UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
						uriCB.queryParam("docId",docId);
						uriCB.queryParam("buId",buId); 
						
						searchText=request.getParameter("searchtextId");  
						System.out.println("searchText................."+searchText); 
						  
					
						//		DocumentData documentData=(DocumentData) FiinfraUtility.postRequest(uriCB,DocumentData.class,restTemplate);
						BaseResponse<DocumentData> br = new BaseResponse<DocumentData>();
						br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
						DocumentData documentData=new DocumentData();
						if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) 
							documentData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), DocumentData.class);
						//			documentData=br.getResponseObject();
						System.out.println("file name is:--"+documentData.getDocumentName());
						System.out.println("file path is:--"+documentData.getFileStoragePathURI());
					
						
						InputStream file;
						try
						{
							 file = new FileInputStream(new File(documentData.getFileStoragePathURI()));	
						}
						 catch(Exception e)
						 {
							 String data=documentData.getFileStoragePathURI().replaceAll(" ","");
							 
							 file = new FileInputStream(new File(data));
						 }
						System.out.println("file:----"+file.available());
						response.setContentType("application/octet-stream");
						response.setHeader("Content-Disposition","attachment; filename=\"" + documentData.getDocumentName() +"\"");
						FileCopyUtils.copy(file, response.getOutputStream());
						
						
						/*	InputStream file = new FileInputStream(new File(documentData.getFileStoragePathURI())); 
						System.out.println("file:----"+file.available());
						response.setContentType("application/octet-stream");
						response.setHeader("Content-Disposition","attachment; filename=\"" + documentData.getDocumentName() +"\"");
						FileCopyUtils.copy(file, response.getOutputStream());*/
					} catch (Exception e) {    
						// TODO Auto-generated catch block
						return "redirect:/download/loaddownloadlist.htm";     
					}   
					  
					return "";
				}  
		
		
		
}