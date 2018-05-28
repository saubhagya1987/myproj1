package in.fiinfra.controller;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.TransactionData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class UploadController extends MultiActionController{

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(UploadController.class);
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	String url;
	@Value("${URL_GET_PICKLIST_VALUE_LIST}")
	private String URL_GET_PICKLIST_VALUE_LIST;
	
	@Value("${URL_GET_CITY_LIST}")
	private String URL_GET_CITY_LIST;
	
	@Value("${URL_GET_FTP_BASEPATH}")
	private String URL_GET_FTP_BASEPATH;
	
	

	public void getSourceList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	   System.out.println("HIEEEEEEEEEEEEE");
	   UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_PICKLIST_VALUE_LIST+"xyz/1234";
		String codeTypeIds=request.getParameter("codeTypeIds");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("codeTypeIds", codeTypeIds);
		uriCB.queryParam("buId", FiinfraConstants.AXISMFBUID);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			 codeValueDataList= br.getResponseListObject();
		
		Logger.logEntry(this.getClass(), "codeValueDataList:---"
				+ codeValueDataList, Logger.DEBUG, Thread.currentThread()
				.getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);
	}
  
	public void getCityList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		//url = URL_GET_CITY_LIST+userSession.getUserName()+"/1234";
		url = URL_GET_CITY_LIST+"xyz/1234";
		int parentId=Integer.parseInt(request.getParameter("parentId"));
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("parentId", parentId);
		//uriCB.queryParam("buId", userSession.getBuId());
		uriCB.queryParam("buId", 27827);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		logger.info("br:------"+br);
		List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			 codeValueDataList= br.getResponseListObject();
		
		logger.info("codeValueDataList:------"+codeValueDataList);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);
	}
	
	@SuppressWarnings("unchecked")
    public void getFTPBasePath(HttpServletRequest request,
    		HttpServletResponse response) throws Exception{
    	logger.info("\n getUniqueBasePath  SERTController ");
    try {
    	/*UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
    	logger.info(userSession.getUserName());*/
    	url = URL_GET_FTP_BASEPATH +"ramu/1234"; 
    	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
    	uriCB.queryParam("txnSourceID", request.getParameter("txnSourceID")); 
    	uriCB.queryParam("protocol", request.getParameter("protocol"));   
    	Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
    	BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
    	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
    	List<TransactionData> list = new ArrayList<TransactionData>();
    	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
    		list= br.getResponseListObject();
    	PrintWriter out = null;      
    	out = response.getWriter(); 
    	response.setContentType("application/json");
    	
    	objectMapper.writeValue(out, list); 
    } catch (RestClientException | IOException e) {
    	e.printStackTrace();
     }
    }  
	
/*	 @SuppressWarnings("unchecked")
	    public void getFTPBasePath(HttpServletRequest request,
	    		HttpServletResponse response) throws Exception{
	    	logger.info("\n getUniqueBasePath  SERTController ");
	    try {
	    	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	    	logger.info(userSession.getUserName());
	    	url = URL_GET_FTP_BASEPATH +"ramu/1234"; 
	    	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	    	uriCB.queryParam("txnSourceID", request.getParameter("txnSourceID")); 
	    	uriCB.queryParam("protocol", request.getParameter("protocol"));   
	    	Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
	    	BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
	    	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	    	List<TransactionData> list = new ArrayList<TransactionData>();
	    	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
	    		list= br.getResponseListObject();
	    	PrintWriter out = null;      
	    	out = response.getWriter(); 
	    	response.setContentType("application/json");
	    	List<TransactionData> list = new ArrayList<TransactionData>();
	    	TransactionData t=new TransactionData();
	    	t.setBasepath("ftp://"+"viraj:viraj123@127.0.0.1:21/Viraj/karvy");
	    	list.add(t);
	    	PrintWriter out = null;      
	    	out = response.getWriter(); 
	    	response.setContentType("application/json");
	    	objectMapper.writeValue(out, list); 
	    } catch (RestClientException | IOException e) {
	    	e.printStackTrace();
	     }
	    } */ 
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
