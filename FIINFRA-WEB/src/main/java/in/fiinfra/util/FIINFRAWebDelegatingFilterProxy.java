package in.fiinfra.util;


import in.fiinfra.common.token.FiinfraTokenDecrypter;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import org.apache.poi.openxml4j.opc.internal.FileHelper;

public class FIINFRAWebDelegatingFilterProxy implements Filter {
	
	
	private static final Logger LOGGER = Logger.getLogger(FIINFRAWebDelegatingFilterProxy.class);
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}	

	public void doFilter(ServletRequest req, ServletResponse response,
			FilterChain filterChain) throws ServletException, IOException {
		int buid=0;
		String url="";
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse res = (HttpServletResponse) response;
		String uri = request.getRequestURI();
//		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
//		buid=userSession.getBuId();
		LOGGER.info("buid in logout="+buid);
		if(!uri.contains("/images")){
		HttpSession session = request.getSession();
		LOGGER.info("In FIINFRAWebDelegatingFilterProxy " + request.getRequestURI());
		if (session.isNew() || session.getAttribute("SECURITY_TOKEN") == null) {
			String token = request.getParameter("TOKEN");
			String userName= request.getParameter("USER_NAME");
			String securityToken = request.getParameter("securityToken");
			if(securityToken  != null){
				//validate security token
				if(FiinfraTokenDecrypter.validateLocalToken(request.getLocalAddr(), securityToken)){
					LOGGER.info("valid token");
					//do logic
					// decrypt the token and extract user name and put it in session
					if ("abc".equals(token)) {
						session.setAttribute("USER_NAME", userName);
						session.setAttribute("SECURITY_TOKEN", token);
						filterChain.doFilter(req, response);
					} else {
//						throw new ServletException("BAD token or invalid access");
						
						try {
							String serverPath = request
									.getRequestURL()
									.toString()
									.replace(request.getRequestURI().substring(0),
											request.getContextPath());
						/*	Logger.logEntry(this.getClass(),"request.getRequestURI():--------------"+serverPath,Logger.DEBUG,
									Thread.currentThread().getStackTrace()[1].getMethodName());*/
							Properties properties = new Properties();
							InputStream stream = FileHelper.class.getClassLoader()
									.getResourceAsStream("ApplicationResources.properties");
							properties.load(stream);
							if(serverPath.contains(properties.getProperty("SHUBHCHINTAK_URL_PREFIX"))){
								url = properties.getProperty("LOGOUT_URL_SHUBHCHINTAK");
							}else if(serverPath.contains(properties.getProperty("FIINFRA_URL_PREFIX"))){
								url = properties.getProperty("LOGOUT_URL_FIINFRA");
							}if(serverPath.contains(properties.getProperty("DFDA_URL_PREFIX"))){
								url = properties.getProperty("LOGOUT_URL_DFDA");
							}if(serverPath.contains(properties.getProperty("SPA_URL_PREFIX"))){
								url = properties.getProperty("LOGOUT_URL_SPA");
							}
							if(serverPath.contains(properties.getProperty("ESSEL_URL_PREFIX"))){
								url = properties.getProperty("LOGOUT_URL_ESSEL");
							}if(serverPath.contains(properties.getProperty("VISTA_URL_PREFIX"))){
								url = properties.getProperty("LOGOUT_URL_VISTA");
							}	
							else{
								url = properties.getProperty("LOGOUT_URL_SHUBHCHINTAK");
							}
//							if(properties.getProperty("businessUnitId_Fiinfra").equals(String.valueOf(buid)))
//							{  
//								url = properties.getProperty("LOGOUT_URL_FIINFRA");
//							}
//							else if(properties.getProperty("businessUnitId_Spa").equals(String.valueOf(buid))){
//								url = properties.getProperty("LOGOUT_URL_SPA");
//							}
//						else if(properties.getProperty("businessUnitId_DFDA").equals(String.valueOf(buid))){
//							url = properties.getProperty("LOGOUT_URL_DFDA");
//							}
//							else{
//								url = properties.getProperty("LOGOUT_URL_SHUBHCHINTAK");
//							}
//							url = properties.getProperty("LOGOUT_URL_SHUBHCHINTAK");
							res.sendRedirect(url);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					
				}
				else{
					//throw exception if token is invalid
					LOGGER.info("invalid token");
					throw new IOException("Sorry ! Request is not authoriesed!");
					
					
				}
			}else{
				//throw exception if token is not present
				LOGGER.info("Token is upsent ");
				String serverPath = request
						.getRequestURL()
						.toString()
						.replace(request.getRequestURI().substring(0),
								request.getContextPath());
			/*	Logger.logEntry(this.getClass(),"request.getRequestURI():--------------"+serverPath,Logger.DEBUG,
						Thread.currentThread().getStackTrace()[1].getMethodName());*/
				Properties properties = new Properties();
				InputStream stream = FileHelper.class.getClassLoader()
						.getResourceAsStream("ApplicationResources.properties");
				properties.load(stream);
				if(serverPath.contains(properties.getProperty("SHUBHCHINTAK_URL_PREFIX"))){
					url = properties.getProperty("LOGOUT_URL_SHUBHCHINTAK");
				}else if(serverPath.contains(properties.getProperty("FIINFRA_URL_PREFIX"))){
					url = properties.getProperty("LOGOUT_URL_FIINFRA");
				}if(serverPath.contains(properties.getProperty("DFDA_URL_PREFIX"))){
					url = properties.getProperty("LOGOUT_URL_DFDA");
				}if(serverPath.contains(properties.getProperty("SPA_URL_PREFIX"))){
					url = properties.getProperty("LOGOUT_URL_SPA");
				}
				if(serverPath.contains(properties.getProperty("ESSEL_URL_PREFIX"))){
					url = properties.getProperty("LOGOUT_URL_ESSEL");
				}if(serverPath.contains(properties.getProperty("VISTA_URL_PREFIX"))){
					url = properties.getProperty("LOGOUT_URL_VISTA");
				}	
				else{
					url = properties.getProperty("LOGOUT_URL_SHUBHCHINTAK");
				}
				res.sendRedirect(url);
				//throw new IOException("Sorry ! Request is not authoriesed!");
			}
							
		}
		else {
			filterChain.doFilter(req, response);
		}
		}else{
			filterChain.doFilter(req, response);
		}
		
		
		
	}
	
	@Override
	public void destroy() {
	}
	
	/*@Override
	public void doFilter(ServletRequest req, ServletResponse response,
			FilterChain filterChain) throws ServletException, IOException {

		HttpServletRequest request = (HttpServletRequest) req;
		
		
		if (isSSORequest(request.getRequestURL().toString())) {
			String token = request.getParameter("TOKEN");
			
			FIINFRATokenDecrypter tokenDecrypter = new FIINFRATokenDecrypter();
			Map<String, String> map = null;
			String requestType = getRequestType(request.getRequestURL().toString());
			
			try {
				map = tokenDecrypter.decrypterToken(token);
				
			} catch(Exception ex) {
				map = new HashMap<String, String>();
				map.put("isTokenValid", "false");
			}
			
			map.put("requestType", requestType);			
			request.setAttribute("INTEGRATION_MAP", map);
			
			// parse & validate the token here
			filterChain.doFilter(req, response);
		}
		else {
			super.doFilter(request, response, filterChain);
		}
	}
	
	private boolean isSSORequest(String requestURL) {
		if (requestURL.indexOf("buwebaccess") != -1 || 
				requestURL.indexOf("buRESTaccess") != -1 || 
				requestURL.indexOf("buWSaccess") != -1) {
			return true;
		}
		
		return false;
	}
	
	private String getRequestType(String requestURL) {
		if (requestURL.indexOf("buwebaccess") != -1) {
			return "buwebaccess";
		}
		else if (requestURL.indexOf("buRESTaccess") != -1) {
			return "buRESTaccess";
		}
		else if (requestURL.indexOf("buWSaccess") != -1) {
			return "buWSaccess";
		}
		return null;
	}*/
}