package in.fiinfra.auth.ctrl;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.cp.common.util.AuthHandler;

import java.io.IOException;

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
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.web.client.RestTemplate;

public class CPLogoutHandler extends SimpleUrlLogoutSuccessHandler implements ApplicationListener<SessionDestroyedEvent> {

	@Autowired
	RestTemplate restTemplate;

	
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
	
	private static final Logger LOGGER = Logger.getLogger(CPLogoutHandler.class);

	@Override
	public void onLogoutSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		if (authentication != null && authentication.getDetails() != null) {
			try {
				request.getSession().invalidate();
			} catch (Exception e) {
				e.printStackTrace();
				e = null;
			}
		}

		// String baseUrl = "";
		// if ( ( request.getServerPort() == 80 ) ||
		// ( request.getServerPort() == 443 ) ){
		// baseUrl = request.getScheme() + "://" + request.getServerName() ;
		// }
		// else{
		// baseUrl = request.getScheme() + "://" +
		// request.getServerName() + ":" + request.getServerPort();
		// }

		String buId = request.getParameter("buId");
		response.setStatus(HttpServletResponse.SC_OK);

		
		String redirectUrl;
		if("27827".equals(buId))//Shubhchintak
		{
			redirectUrl = SHUBHCHINTAK_URL;
		}
		else if("27828".equals(buId))//ffreedom
		{
			redirectUrl = FREEDOM_URL;
		}
		else if("27829".equals(buId))//SPA
		{
			redirectUrl = SPA_URL;
		}
		else if("27830".equals(buId))//DFDA
		{
			redirectUrl = DFDA_URL;
		}
		else{
			redirectUrl = SHUBHCHINTAK_URL;
		}

		response.sendRedirect(redirectUrl);

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
			
			UserSession userSession =  AuthHandler.getCurrentUser();
			if(userSession != null){
				String sessionExpiredUrl = USER_SESSION_EXPIRED+userSession.getUserName()+"/"+userSession.getToken();
				restTemplate.getForObject(sessionExpiredUrl, BaseResponse.class);
				LOGGER.debug("Session is expired for user "+ userSession.getUserName());
			}
			
		}
		
			
			
		
		
	}
}
