package in.fiinfra.common.token;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class ClientIntereceptor implements ClientHttpRequestInterceptor
{
	private static final Logger LOGGER = Logger.getLogger(ClientIntereceptor.class);

	@Override
	public ClientHttpResponse intercept(HttpRequest request, byte[] body,
			ClientHttpRequestExecution execution) throws IOException {
		// TODO Auto-generated method stub
		try 
		{
			HttpServletRequest servletRequest =((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
			String IPAddress="";
			if(servletRequest != null){
				//IPAddress = servletRequest.getLocalAddr();
				LOGGER.info("ip at client  remote "+IPAddress);
				IPAddress = request.getURI().getHost();//if not IP address then go with server name
			}
			
			// getting source system id through property file
			String sourceSystemID = "31001";// default partner portal
			//read properties file
			Properties properties = new Properties();
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream("token.properties");
			if(inputStream != null){
				properties.load(inputStream);
				sourceSystemID = properties.getProperty("SOURCE_SYSTEM_ID");
			}
			String username = "Ketan";
			String encreptedString = FiinfraToken.generateRestToken(username, sourceSystemID, IPAddress);
			HttpHeaders headers = request.getHeaders();
			headers.set("token", encreptedString);
			return execution.execute(request, body);
		} catch (FiinfraTokenException e) {
			e.printStackTrace();
		}
		return execution.execute(request, body);
	}

}
