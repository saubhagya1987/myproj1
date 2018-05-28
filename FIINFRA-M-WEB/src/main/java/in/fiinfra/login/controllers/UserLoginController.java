package in.fiinfra.login.controllers;


import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.joda.time.DateTime;
import org.joda.time.Minutes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;


@Controller
public class UserLoginController extends SimpleUrlLogoutSuccessHandler implements LogoutSuccessHandler, ApplicationListener<SessionDestroyedEvent>
{
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	HttpServletRequest httpServletRequest;
	
	@Value("${LOGOUT_USER_FROM_SYSTEM}") 
	private String LOGOUT_USER_FROM_SYSTEM;
	

	@Value("${GET_USERID_FOR_USER}") 
	private String GET_USERID_FOR_USER;
	

	@Value("${USER_SESSION_EXPIRED}") 
	private String USER_SESSION_EXPIRED;
	
	
	@Value("${SHUBHCHINTAK_URL}") 
	private String SHUBHCHINTAK_URL;
	
	@Value("${DFDA_URL}") 
	private String DFDA_URL;
	
	@Value("${FREEDOM_URL}") 
	private String FREEDOM_URL;
	
	@Value("${SPA_URL}") 
	private String SPA_URL;
	
		
	private static final Logger LOGGER = Logger.getLogger(UserLoginController.class);
	
	private static final String NEWS_XML = "business.xml";

	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String showLoginPage(Model model, HttpServletRequest request)
	{ 
		String xmlData = getXmlForNews(request);
		model.addAttribute("newsData", xmlData);		
		return "login";
	}
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException 
			{
		if(authentication!= null )
		{
			String token = "43f";
			String logouturl = LOGOUT_USER_FROM_SYSTEM+authentication.getName()+"/"+token;
			restTemplate.getForObject(logouturl, BaseResponse.class);
			LOGGER.debug("user "+ authentication.getName()+" is logout from system");
		}
		super.onLogoutSuccess(request, response, authentication);
	}
	
	@Override
	public void onApplicationEvent(SessionDestroyedEvent event) 
	{
		
		HttpSession session = (HttpSession) event.getSource();
		DateTime lastActiveTime = new DateTime(session.getLastAccessedTime());
		DateTime currentTime = new DateTime(System.currentTimeMillis());
		int timeoutMinutes = session.getMaxInactiveInterval();
		Minutes actualMinutes = Minutes.minutesBetween(lastActiveTime, currentTime);
		if(actualMinutes.isGreaterThan(Minutes.minutes(timeoutMinutes).dividedBy(60)) || actualMinutes.equals(Minutes.minutes(timeoutMinutes).dividedBy(60)) )
		{
			
			String token = "43f";
			String sessionExpiredUrl = USER_SESSION_EXPIRED+session.getAttribute("USER_NAME")+"/"+token;
			restTemplate.getForObject(sessionExpiredUrl, BaseResponse.class);
			LOGGER.debug("Session is expired for user "+ session.getAttribute("USER_NAME"));
			
			String redirectUrl="";
			UserSession userSession =  (UserSession) session.getAttribute("userSession");
			Integer buId= userSession.getBuId();
			
			if(buId==27827)//Shubhchintak
			{
				redirectUrl = SHUBHCHINTAK_URL;
			}
			else if(buId==27828)//ffreedom
			{
				redirectUrl = FREEDOM_URL;
			}
			else if(buId==27829)//SPA
			{
				redirectUrl = SPA_URL;
			}
			else if(buId==27830)//DFDA
			{
				redirectUrl = DFDA_URL;
			}
			
			
			
			
			
			
		}
		
			
			
		
		
	}
	public String getXmlForNews(HttpServletRequest request){
		BufferedReader bufferedReader = null;
		StringBuilder strBuilder = new StringBuilder();
		try {
			ServletContext servletContext = request.getSession().getServletContext();			
			String absoluteDiskPath = servletContext.getRealPath(NEWS_XML);
			
			bufferedReader = new BufferedReader(new FileReader(absoluteDiskPath));
			String sCurrentLine;
			
			
			boolean isChannelFound = false;
			
			while ((sCurrentLine = bufferedReader.readLine()) != null) {
								
				if(!isChannelFound && sCurrentLine.indexOf("<channel")!=-1){
					isChannelFound = true;
				}
								
				if(isChannelFound){
					strBuilder.append(sCurrentLine);
					strBuilder.append("\n");
					
					if(sCurrentLine.indexOf("</channel>")!=-1){
						break;
					}
				}				
			}			
		} catch (FileNotFoundException fileNotFoundException) {
			LOGGER.error("File not present", fileNotFoundException);			
		} catch (IOException ioException) {
			LOGGER.error("Error occured while reading file", ioException);
		}			
		finally{
			if(bufferedReader != null)
				try {
					bufferedReader.close();
				} catch (IOException e) {
					LOGGER.error("Error occured while closing connection", e);
				}
		}
		LOGGER.debug("Xml for News is" + strBuilder.toString());
		return strBuilder.toString();
	}

			

}
