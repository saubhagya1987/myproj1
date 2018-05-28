package in.fiinfra.common.controller;

import in.fiinfra.common.common.ContactUsData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.util.Logger;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class ContactUsController extends MultiActionController{
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;

	
	public void getContactUsRecord(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/common/getContactUsRecord/"+userSession.getUserName()+"/1234";
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<ContactUsData> contactUsData = (List<ContactUsData>) FiinfraUtility.postRequest(uriCB, Object.class, restTemplate); 

		Logger.logEntry(this.getClass(), "Contacts  :---"
				+ contactUsData, Logger.DEBUG, Thread.currentThread()
				.getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, contactUsData);
	}
	
	
	
	public RestTemplate getRestTemplate() {
		return restTemplate;
	}
	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}
	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}
	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
	
}