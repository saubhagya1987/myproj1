package in.fiinfra.cp.common.util;

import in.fiinfra.common.diy.models.UserSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;


public class AuthHandler {

	
	public static UserSession getCurrentUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth instanceof PreAuthenticatedAuthenticationToken) {
		         return (UserSession)auth.getPrincipal();
		}
		return null;
	}
	
}
