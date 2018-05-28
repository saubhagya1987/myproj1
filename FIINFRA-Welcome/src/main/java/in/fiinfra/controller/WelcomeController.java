package in.fiinfra.controller;

import in.fiinfra.common.authentication.UserDetailsImpl;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.token.FiinfraToken;
import in.fiinfra.common.token.FiinfraTokenException;
import in.fiinfra.common.util.FiinfraConstants;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.openxml4j.opc.internal.FileHelper;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class WelcomeController extends MultiActionController

{
	 String url;
	 
	 String ipAddress;
	 @Value("${SUCCESSFULL_LOGIN}")
	 private String SUCCESSFULL_LOGIN;
	 @Value("${PARTNER_PORTAL_ENTRY_POINT}")
	 private String PARTNER_PORTAL_ENTRY_POINT;
	 @Value("${SERVICE_PORTAL_ENTRY_POINT}")
	 private String SERVICE_PORTAL_ENTRY_POINT;
	 @Value("${CLIENT_PORTAL_ENTRY_POINT}")
	 private String CLIENT_PORTAL_ENTRY_POINT;
	 @Value("${M_WEB_PORTAL_ENTRY_POINT}")
	 private String M_WEB_PORTAL_ENTRY_POINT;
	 
	private static final Logger logger = Logger
			.getLogger(WelcomeController.class);
	private RestTemplate restTemplate;
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


	//@RequestMapping(value = "/loadhome", method = RequestMethod.GET)
	public ModelAndView loadHome(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String newRedirectUrl;
		String prefix;
		try {
			logger.info("\nHELLO loadhome WelcomeController ");
			newRedirectUrl = "";
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String url = SUCCESSFULL_LOGIN + authentication.getName() + "/" + request.getRemoteAddr();
			String userAgent=request.getHeader("user-agent");
			logger.info("userAgent:" +userAgent);

			HttpSession session = request.getSession(false);
			if (session == null) {
				
				session = request.getSession(true);
			}
			ipAddress = request.getLocalAddr();
			UserSession userSession =  restTemplate.getForObject(url, UserSession.class);
			Object principal = authentication.getPrincipal();
			String password=null;
			if (principal instanceof UserDetailsImpl) {
				password = ((UserDetailsImpl) (principal)).getPassword();
			    
			}
			

			logger.info("authentication getNamee:" + authentication.getName());

			if (userSession != null) {
				userSession.setUserName(authentication.getName());
				session.setAttribute("userSession", userSession);
				session.setAttribute("password", password);
				logger.info("authentication getName:" + userSession.getName());
			}
			
				
				
			 if(userSession.getRecordtypeId()==14003 || userSession.getRecordtypeId()==14014){ //Partner Portal: 14003	Partner
				 if( (userAgent.contains("Mobi") || userAgent.contains("Android"))
						 && (userSession.getSuccessfulLoginCount()>0))
				 {
					 String sourceSystemId = Integer.toString(FiinfraConstants.DIY);
					 String securityToken = FiinfraToken.generateRestToken(authentication.getName(), sourceSystemId, ipAddress);
					 newRedirectUrl = M_WEB_PORTAL_ENTRY_POINT+"?TOKEN=abc&USER_NAME="+authentication.getName()+"&securityToken="+securityToken;
				 }
				 else{
					 String sourceSystemId = Integer.toString(FiinfraConstants.PARTNER_PORTAL);
					 String securityToken = FiinfraToken.generateRestToken(authentication.getName(), sourceSystemId, ipAddress);
					 newRedirectUrl =  PARTNER_PORTAL_ENTRY_POINT+"?TOKEN=abc&USER_NAME="+authentication.getName()+"&securityToken="+securityToken;
				 }
			 }
			 else if(userSession.getRecordtypeId()==14004 || userSession.getRecordtypeId()==14005         //Client Portal: 14004	Lead, 14005	Opportunity, 14006
					 || userSession.getRecordtypeId()==14006 || userSession.getRecordtypeId()==14007 )    // Client, 14007	Premium Client
				 {
					 String sourceSystemId = Integer.toString(FiinfraConstants.CLIENT_PORTAL);
					 String securityToken = FiinfraToken.generateRestToken(authentication.getName(), sourceSystemId, ipAddress);
					 newRedirectUrl = CLIENT_PORTAL_ENTRY_POINT+"?TOKEN=ab&USER_NAME="+authentication.getName()+"&securityToken="+securityToken;
				 }
			 else if(userSession.getRecordtypeId()==14001 || userSession.getRecordtypeId()==14008         //Service Portal: 14001	System, 14008 User
				 	  || userSession.getRecordtypeId()==14012)   //14012	Service Team Member
			      {
					 String sourceSystemId = Integer.toString(FiinfraConstants.SERVICE_PORTAL);
					 String securityToken = FiinfraToken.generateRestToken(authentication.getName(), sourceSystemId, ipAddress);
					 newRedirectUrl = SERVICE_PORTAL_ENTRY_POINT+"?TOKEN=abc&USER_NAME="+authentication.getName()+"&securityToken="+securityToken;
			      }
			
			prefix = "";
				Properties properties = new Properties();
				InputStream stream = FileHelper.class.getClassLoader()
						.getResourceAsStream("ApplicationResources.properties");
				properties.load(stream);
				
			if(userSession.getBuId()==27830){
				prefix = properties.getProperty("DFDA_BU_PREFIX_URL");
			}else if(userSession.getBuId()==27829){
				prefix = properties.getProperty("SPA_BU_PREFIX_URL");
			}else if(userSession.getBuId()==27828){
				prefix = properties.getProperty("FIINFRA_BU_PREFIX_URL");
			}else if(userSession.getBuId()==460355){
				prefix = properties.getProperty("ESSEL_BU_PREFIX_URL");
			}else if(userSession.getBuId()==457481){
				prefix = properties.getProperty("VISTA_BU_PREFIX_URL");
			}else{
				prefix = properties.getProperty("SHUBHCHINTAK_BU_PREFIX_URL");
			}
			
			
			return new ModelAndView("redirect:" + prefix+newRedirectUrl);	
		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FiinfraTokenException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return new ModelAndView("/home/home");
		return null;
	}
	
	
}
