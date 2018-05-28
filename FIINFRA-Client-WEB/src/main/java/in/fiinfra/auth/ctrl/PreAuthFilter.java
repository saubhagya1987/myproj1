package in.fiinfra.auth.ctrl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.authentication.preauth.RequestHeaderAuthenticationFilter;

public class PreAuthFilter extends RequestHeaderAuthenticationFilter {

	@Override
	protected Object getPreAuthenticatedPrincipal(HttpServletRequest request) {
//		if(request.getRequestURL() != null && request.getRequestURL().toString().toUpperCase().
//				contains("FIINFRA-WELCOME")){
		String token  = request.getParameter("TOKEN");
		String userName  = request.getParameter("USER_NAME");
		return userName;
	}
	

}
