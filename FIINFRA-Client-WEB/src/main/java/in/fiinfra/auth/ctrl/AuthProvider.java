package in.fiinfra.auth.ctrl;

import in.fiinfra.auth.service.UserService;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.FiinfraConstants;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationProvider;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class AuthProvider extends PreAuthenticatedAuthenticationProvider{
	
    @Autowired
    UserService userService;
	
	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		Authentication auth =  super.authenticate(authentication);
		
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attributes.getRequest();
		
		UserSession sessionUser =  userService.getUserByToken(auth.getName(), request.getRemoteAddr());
		
		sessionUser.setSourceSystemId(31004);
		sessionUser.setUserName(auth.getName());
		//@todo hardcoded remove it
		sessionUser.setToken("1234");

		if(!sessionUser.isFirstLogin()){
			saveAccessLog(sessionUser, request);
		}
		
		
		return new PreAuthenticatedAuthenticationToken(sessionUser, auth.getCredentials().toString(), auth.getAuthorities());
		
	}

	private void saveAccessLog(UserSession user, HttpServletRequest request){
		UserAccessLog accessLog = new UserAccessLog();
		accessLog.setUserId(user.getUserId());
		accessLog
				.setLoginAccessModeId(FiinfraConstants.LOGIN_ACCESS_MODE_STANDARD);
		accessLog.setEnteredPassword("");
		accessLog.setLoginSuccessful(1);
		accessLog.setRedirectUrl(request.getRequestURL().toString());
		accessLog.setSessionId(request.getRequestedSessionId());
		accessLog.setSourceIPAddress(request.getRemoteAddr());
		accessLog.setSourceSystemId(31006);
		userService.saveUserAccessLog(accessLog,user);
		

	}

	
	

}
