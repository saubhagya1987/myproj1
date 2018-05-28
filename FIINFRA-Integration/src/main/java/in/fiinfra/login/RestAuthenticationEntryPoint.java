package in.fiinfra.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

public class RestAuthenticationEntryPoint implements AuthenticationEntryPoint {

	@Override
	public void commence(HttpServletRequest arg0, HttpServletResponse response,
			AuthenticationException arg2) throws IOException, ServletException {
		response.getWriter().print("{auth:false}");
//		response.addHeader("Access-Control-Allow-Origin", "null");
//        response.addHeader("WWW-Authenticate", "Basic realm=\"" + "www.prxcloud.com" + "\"");
        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
	}
}
