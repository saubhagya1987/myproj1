package in.fiinfra.filter;

import in.fiinfra.common.token.FiinfraTokenDecrypter;
import in.fiinfra.common.token.FiinfraTokenException;

import java.io.IOException;

import javax.print.attribute.standard.Severity;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class SecurityFilter implements Filter 
{

	private static final Logger LOGGER = Logger.getLogger(SecurityFilter.class);
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException 
	{
		// look for token
		HttpServletRequest  httpServletRequest;
		try {
			httpServletRequest = (HttpServletRequest) request;
			String requestURL = httpServletRequest.getRequestURI().toString();
			if(requestURL.contains("common/insertNotification/Ramu/1234") || requestURL.contains("common/doAudit/Ramu/1234")){
				LOGGER.info("URL is "+requestURL);
				chain.doFilter(request, response);
			}
			else{
				String ipAddress="";
				ipAddress = httpServletRequest.getHeader("X-Forwarded-For");
				if(ipAddress == null){
					//ipAddress = request.getLocalAddr();
				}
				LOGGER.info("request Ip"+ipAddress);
				ipAddress = request.getServerName();//if not IP address then go with server name
				String token = httpServletRequest.getHeader("token");
				LOGGER.info("URL is "+requestURL);
				if (token != null) {
					if (FiinfraTokenDecrypter.isTokenValidated(ipAddress, token)) {
						LOGGER.info("token is validate");
						chain.doFilter(request, response);
					} else {
						//throw an exception
						LOGGER.info("Error:   Invalide Token");
						throw new FiinfraTokenException("Exception : Invalide Token");
					}
				} else {
					//throw an exception
					LOGGER.debug("Error: Request does n ot conatains the token");
					throw new FiinfraTokenException("Exception :  Request does not conatains the token");
					
				}
			}
		} catch (Exception e) {
			LOGGER.info("Exception: while validating the token  "+e.getMessage());
			//chain.doFilter(request, response);
			throw new IOException("Sorry! Request is not authenticated");
			
		
		}
		
		
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
