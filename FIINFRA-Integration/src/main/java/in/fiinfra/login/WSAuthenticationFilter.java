package in.fiinfra.login;

import in.fiinfra.common.common.BaseRequest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.authentication.preauth.AbstractPreAuthenticatedProcessingFilter;

public class WSAuthenticationFilter extends AbstractPreAuthenticatedProcessingFilter  {

	@Override
	protected Object getPreAuthenticatedPrincipal(HttpServletRequest request) {
		return BaseRequest.decode(request.getParameter("userName"));
	}

	@Override
	protected Object getPreAuthenticatedCredentials(HttpServletRequest request) {
		return request.getParameter("token");
	}
}
