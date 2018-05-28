package in.fiinfra.auth.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

public class AuthEntryPoint implements AuthenticationEntryPoint {

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException arg2) throws IOException, ServletException {
		String baseUrl = "";
		if ( ( request.getServerPort() == 80 ) ||
		         ( request.getServerPort() == 443 ) ){
			baseUrl = request.getScheme() + "://" + request.getServerName() ;				
		}
		else{
			baseUrl = request.getScheme() + "://" +
			        request.getServerName() + ":" + request.getServerPort();				
		}
		
		String buId = request.getParameter("buId");
		String reqString =  request.getQueryString();

		/* @todo remove hardcoding should be get from database*/
		response.sendRedirect(baseUrl+ "/FIINFRA-Welcome/common/login.htm");
	}
}
