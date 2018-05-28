package in.fiinfra.login;

import in.fiinfra.common.common.StringUtils;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.FiinfraConstants;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationProvider;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;



public class UserAuthenticationProvider extends PreAuthenticatedAuthenticationProvider {

	
	   @Autowired
	    UserService userService;
		
		@Override
		public Authentication authenticate(Authentication authentication)
				throws AuthenticationException {
			Authentication auth =  super.authenticate(authentication);
			String token = (String)authentication.getCredentials();
			
			if(StringUtils.isEmpty(token)){
				throw new BadCredentialsException("Token Not Found");
			}
			
			UserSession sessionUser =  userService.getUserByToken( FiinfraConstants.INTEGRATION_PORTAL,auth.getName(), token);
			if(sessionUser ==null){
				throw new BadCredentialsException("Invalid Token.");
			}
			
			sessionUser.setSourceSystemId(FiinfraConstants.INTEGRATION_PORTAL);
			sessionUser.setUserName(auth.getName());
			//@todo hardcoded remove it
			sessionUser.setToken("1234");
			
			ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			HttpServletRequest request = attributes.getRequest();


			saveAccessLog(sessionUser, request);
			
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
			userService.saveUserAccessLog(accessLog,user);
			

		}

		


}
