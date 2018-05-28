package in.fiinfra.controller;

import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.token.FiinfraToken;
import in.fiinfra.common.token.FiinfraTokenException;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class LoginOnbehalfController extends MultiActionController {
	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(LoginOnbehalfController.class);
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	
	 @Value("${CLIENT_PORTAL_PROFILE_PAGE}")
	 private String CLIENT_PORTAL_PROFILE_PAGE;
	 @Value("${PARTNER_PORTAL_ENTRY_POINT}")
	 private String PARTNER_PORTAL_ENTRY_POINT;
	 @Value("${SERVICE_PORTAL_ENTRY_POINT}")
	 private String SERVICE_PORTAL_ENTRY_POINT;
	 @Value("${CLIENT_PORTAL_ENTRY_POINT}")
	 private String CLIENT_PORTAL_ENTRY_POINT;
	 @Value("${M_WEB_PORTAL_ENTRY_POINT}")
	 private String M_WEB_PORTAL_ENTRY_POINT;
	 
	 @Value("${SAVE_USER_ACCESS_LOG}") 
		private  String SAVE_USER_ACCESS_LOG;

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

	
	
	
	public  ModelAndView getPartnerInfo(HttpServletRequest request,HttpServletResponse response){
	
		 UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId=userSession.getBuId();
			int userId=userSession.getUserId();
			int pstroleId=userSession.getRoleId();
		
		String newRedirectUrl="";

		
		logger.info("\nHELLO getLogin LoginonbehalfController ");
		
		logger.info("in loadallocationlist userName:::"+ request.getParameter("userName"));
		request.setAttribute("userName", request.getParameter("userName"));
		//request.setAttribute("roleId", request.getParameter("roleId"));
		request.setAttribute("roleId", request.getParameter("6"));
		
		
		String sourceSystemId = Integer.toString(FiinfraConstants.PARTNER_PORTAL);
		  String securityToken = "";
		  
		  try {
		   securityToken = FiinfraToken.generateRestToken("username", sourceSystemId, request.getLocalAddr());
		  } catch (FiinfraTokenException e) {
			  logger.info("Exception:  "+e.getMessage());
		   
		  }
		
	
		if( request.getParameter("GOTO").equalsIgnoreCase("index")){
			request.setAttribute("GOTO", request.getParameter("GOTO"));
			newRedirectUrl = PARTNER_PORTAL_ENTRY_POINT+"?TOKEN=abc&USER_NAME="+request.getParameter("userName")
					+"&USER_NAME="+request.getParameter("userName")		
					+"&securityToken="+securityToken
					+"&GOTO="+request.getParameter("GOTO")
					+"&PST="+userId
					+"&pstroleId="+pstroleId
					+"&LOB=true";
		}else if( request.getParameter("GOTO").equalsIgnoreCase("profile")){
			request.setAttribute("GOTO", request.getParameter("GOTO"));
			newRedirectUrl = PARTNER_PORTAL_ENTRY_POINT+"?TOKEN=abc&USER_NAME="+request.getParameter("userName")
					+"&securityToken="+securityToken
					+"&GOTO="+request.getParameter("GOTO")
					+"&PST="+userId
					+"&pstroleId="+pstroleId
					+"&LOB=true";
		}
		request.getSession().invalidate();
		return new ModelAndView("redirect:" + newRedirectUrl);
	}
	
	public  ModelAndView getUserInfo(HttpServletRequest request,HttpServletResponse response){
		
		 UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId=userSession.getBuId();
			int userId=userSession.getUserId();
			int pstroleId=userSession.getRoleId();
			
		String newRedirectUrl="";
		
		logger.info("\nHELLO getLogin LoginonbehalfController ");
		
		logger.info("in loadallocationlist userName:::"+ request.getParameter("userName"));
		request.setAttribute("userName", request.getParameter("userName"));
		
		logger.info("in loadallocationlist roleID:::"+ request.getParameter("roleID"));
		request.setAttribute("roleID", request.getParameter("roleID"));
		
		//int roleID=Integer.parseInt(request.getParameter("roleID"));
		
		
		int recordTypeId=Integer.parseInt(request.getParameter("recordTypeId"));
		
		request.setAttribute("userName", request.getParameter("recordTypeId"));
		 
		//Partner Portal: 14003	Partner
		if(recordTypeId==14003)
		{
			
			String sourceSystemId = Integer.toString(FiinfraConstants.PARTNER_PORTAL);
			  String securityToken = "";
			  
			  try {
			   securityToken = FiinfraToken.generateRestToken("username", sourceSystemId, request.getLocalAddr());
			  } catch (FiinfraTokenException e) {
				  logger.info("Exception:  "+e.getMessage());
			   
			  }
			
			if( request.getParameter("GOTO").equalsIgnoreCase("index"))
			{
				request.setAttribute("GOTO", request.getParameter("GOTO"));
				newRedirectUrl = PARTNER_PORTAL_ENTRY_POINT+"?TOKEN=abc&USER_NAME="+request.getParameter("userName")
						+"&securityToken="+securityToken
						+"&GOTO="+request.getParameter("GOTO")
						+"&PST="+userId
						+"&pstroleId="+pstroleId
						+"&LOB=true";
			}
			else if( request.getParameter("GOTO").equalsIgnoreCase("profile"))
			{
				request.setAttribute("GOTO", request.getParameter("GOTO"));
				newRedirectUrl = PARTNER_PORTAL_ENTRY_POINT+"?TOKEN=abc&USER_NAME="+request.getParameter("userName")
						+"&securityToken="+securityToken
						+"&GOTO="+request.getParameter("GOTO")
						+"&PST="+userId
						+"&pstroleId="+pstroleId
						+"&LOB=true";
			}
			
		}
		else if(recordTypeId==14004 || recordTypeId==14005 || recordTypeId==14006 || recordTypeId==14007)//Client Portal: 14004	Lead, 14005	Opportunity, 14006
		{
			if( request.getParameter("GOTO").equalsIgnoreCase("index"))
			{
				request.setAttribute("GOTO", request.getParameter("GOTO"));
				newRedirectUrl = CLIENT_PORTAL_ENTRY_POINT+"?TOKEN=abc&USER_NAME="+request.getParameter("userName")+"&GOTO="+request.getParameter("GOTO")+"&PST="+userId+"&LOB=true";
			}
			else if( request.getParameter("GOTO").equalsIgnoreCase("profile"))
			{
				request.setAttribute("GOTO", request.getParameter("GOTO"));
				newRedirectUrl = CLIENT_PORTAL_PROFILE_PAGE+"?TOKEN=abc&USER_NAME="+request.getParameter("userName")+"&GOTO="+request.getParameter("GOTO")+"&PST="+userId+"&LOB=true";
			}
			
		} 
		else if (recordTypeId==14008 || recordTypeId==14012)//Service portal: 14008 User,14012 Service Team Member 
		{
			   if( request.getParameter("GOTO").equalsIgnoreCase("index"))
			   {
				    request.setAttribute("GOTO", request.getParameter("GOTO"));
				    newRedirectUrl = SERVICE_PORTAL_ENTRY_POINT+"?TOKEN=abc&USER_NAME="+request.getParameter("userName")+"&GOTO="+request.getParameter("GOTO")+"&PST="+userId+"&LOB=true";
				   
			   }
		}
		 
		
		request.getSession().invalidate();
		
		FiinfraUtility.doAudit(userSession.getPartyId(), 
							   userSession.getUserId(), 
							   FiinfraConstants.SRP_LOGINONBEHALF_USER_EVENT_ID,
							   FiinfraConstants.SERVICE_PORTAL,
							   FiinfraConstants.SRP_SOURCE_MODULE_USER,
							   FiinfraConstants.SRP_LOGINONBEHALF_USER,
							   "Login On Behalf: "+request.getParameter("userName"));
		
		/*start-- entry of login on behalf in login details */
			try{
					String baseUrl = "";
					Integer userid=0;
					String ipaddress="";
					String sessionId="";
					String username="";
					String password=null;
					if(userSession != null)
					{
						userid = userSession.getUserId();
						username = userSession.getUserName();
						if(request.getSession().getAttribute("password")!=null){
							password = request.getSession().getAttribute("password").toString();
						}else{
							password="";
						}
				
//						password = new MD5Encryption().encrypt(password);
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
					String portalURL = baseUrl+"/FIINFRA-Service/index.htm" ;
					response.setHeader("token", userSession.getUserName());
					//log user for successfull login
					saveUserAccessLog(userid, password, portalURL, sessionId, ipaddress, username);
					//userSession.setSuccessfulLoginCount(1);
					request.getSession().setAttribute("userSession", userSession);
				}catch(Exception e){
					e.printStackTrace();
				}
			/*End---entry of login on behalf in login details */
		
		return new ModelAndView("redirect:" + newRedirectUrl);
	}
	
	public  void saveUserAccessLog(Integer userId,String password,String url,String sessionId,String ipAddress,String username)
	{
		String token = "23d";
		UserAccessLog accessLog = new UserAccessLog();
		accessLog.setUserId(userId);
		accessLog.setLoginAccessModeId(FiinfraConstants.LOGIN_ACCESS_MODE_LOB);
		accessLog.setEnteredPassword(password);
		accessLog.setLoginSuccessful(1);
		accessLog.setRedirectUrl(url);
		accessLog.setSessionId(sessionId);
		accessLog.setSourceIPAddress(ipAddress);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_USER_ACCESS_LOG+ username+"/" + token);
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), accessLog, BaseResponse.class);		
		
	}
}

