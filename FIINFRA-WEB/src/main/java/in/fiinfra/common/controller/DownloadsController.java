package in.fiinfra.common.controller;

import in.fiinfra.common.common.DocumentValueData;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.util.Logger;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class DownloadsController extends MultiActionController{
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	
	public void getDownloadsList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		String sourceSysId = "31001";
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/common/getDownloadsList/"+userSession.getUserName()+"/1234";
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("sourceSysId",sourceSysId);
		logger.info("URl Downloads===================="+url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<DocumentValueData> documentValueDataAsJson = (List<DocumentValueData>) FiinfraUtility.postRequest(uriCB, Object.class, restTemplate); 

		Logger.logEntry(this.getClass(), "DocumentValue  :---"
				+ documentValueDataAsJson, Logger.DEBUG, Thread.currentThread()
				.getStackTrace()[1].getMethodName());
		int size = documentValueDataAsJson.size();
		List<DocumentValueData> documentValueDataList = new ArrayList<DocumentValueData>();
		for(int i = 0; i<size; i++){
			//get the actual party object from its LinkedHashMap representation
			DocumentValueData documentValueData = objectMapper.readValue(objectMapper.writeValueAsString(documentValueDataAsJson.get(i)), DocumentValueData.class);
			documentValueDataList.add(documentValueData);
		}
		Collections.sort(documentValueDataList, new DocumentValueData());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, documentValueDataList);
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