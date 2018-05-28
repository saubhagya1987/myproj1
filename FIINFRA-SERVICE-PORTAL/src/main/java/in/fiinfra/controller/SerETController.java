package in.fiinfra.controller;

import static in.fiinfra.common.util.FiinfraConstants.LOCATION_TO_UPLOADFILE;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.TransactionData;
import in.fiinfra.common.partner.TransactionHistoryData;
import in.fiinfra.common.service.vo.FileUpload;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.CommonUtils;

import java.io.File;
import java.io.FileInputStream; 
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonParseException;

public class SerETController extends MultiActionController{
	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(SerETController.class);
	  
	private RestTemplate restTemplate;
	String url;   
	  
	public RestTemplate getRestTemplate() {   
		return restTemplate;  
	} 
            
	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;    
	} 
	       
	private ObjectMapper objectMapper;  
	
	public ObjectMapper getObjectMapper() {    
		return objectMapper;   
	}  
	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	} 
	                
	//URL_GET_EXECUTION 
	@Value("${URL_GET_EXECUTION}") 
	private String URL_GET_EXECUTION; 
	@Value("${URL_GET_PARTNER_PST}")
	private String URL_GET_PARTNER_PST; 
	@Value("${URL_GET_REQUEST_REPROCESS}")
	private String URL_GET_REQUEST_REPROCESS;
	@Value("${URL_GET_BULK_REPROCESS}")
	private String URL_GET_BULK_REPROCESS;   
	@Value("${URL_GET_BULK_TXNHISTORYDETAILS}")
	private String URL_GET_BULK_TXNHISTORYDETAILS;   
	@Value("${URL_GET_BULK_TXNHISTORYERRORLOG}")
	private String URL_GET_BULK_TXNHISTORYERRORLOG;  
	@Value("${URL_GET_SOURCE_LIST}") 
	private String URL_GET_SOURCE_LIST;
	@Value("${URL_GET_FILE_TYPE}")
	private String URL_GET_FILE_TYPE;      
	@Value("${URL_BULK_UPLOAD}")
	private String URL_BULK_UPLOAD;  
	@Value("${URL_UNIQUE_BASEPATH}")
	private String URL_UNIQUE_BASEPATH;
	
	 
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getUploadHistory", method = RequestMethod.GET)
	public ModelAndView getUploadHistory(HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			int sessionid =userSession.getBuId();
			int partnerid = userSession.getUserId(); 
			
			String userToken = null;
			if(userSession.getUserName()!=null){
				userToken = userSession.getUserName();
			} 
			else{   
				userToken = "abc";
			}
 
			String pagesize = request.getParameter("pageSize");
			if (pagesize == null) {
				pagesize = "10";
			} 
			
			String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
				
			} else {
				searchTextVal = "";
			}
			  
			String error = null;
			if (request.getParameterMap().containsKey("error")) {
				error = request.getParameter("error").trim();
				}    
			
		
			String partner = null;
			
			if(request.getParameter("quickSearchpart") != null){
				partner = request.getParameter("quickSearchpart"); 
			} else { 
				partner = "";
			}           
			           
			ModelAndView mav = new ModelAndView("execution/executiontracker_uploadhistory");
			try {
					BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
					TransactionData transactionVo = new TransactionData();
					transactionVo.setSearchText(searchTextVal);
					
					if(partner != null && partner != "")  
					{    
					transactionVo.setBuId(Integer.parseInt(partner)); 
					 
					}     
					else
					{
					
					transactionVo.setBuId(partnerid);  
						} 
					    
					
					 
					url = URL_GET_EXECUTION+userSession.getUserName()+"/1234"; 
					br = restTemplate.postForObject(url, transactionVo, BaseResponse.class);
					List<TransactionData> uploadHistory = new ArrayList<TransactionData>();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					uploadHistory=br.getResponseListObject();
					mav.addObject("uploadHistoryList", objectMapper.writeValueAsString(uploadHistory)); 
					mav.addObject("size", pagesize);   
					mav.addObject("error", error);
					PrintWriter out= null;       
				       
				try {           
						out = response.getWriter();
					} catch (Exception e) {
						// TODO Auto-generated catch block  
						logger.error(e);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					logger.error(e);
				} 
				   return mav; 
	} 
	 
	
	 @SuppressWarnings("unchecked")
	public void uploadHistoryExecl(HttpServletRequest request, HttpServletResponse response) {
		 
		  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		  try{
		  
		   if(userSession == null) {
		   response.sendRedirect("/login");
		   return ;    
		  }
		   String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
				
			} else {  
				searchTextVal = "";
			}
			
			
			
			int partnerId = 0;
			if (request.getParameterMap().containsKey("dpPartner")) {
				partnerId = Integer.parseInt(request.getParameter("dpPartner"));
				
			} else {
				partnerId = 0;   
			}  
			  
			
			String userToken = null;
			if(userSession.getUserName()!=null){
				userToken = userSession.getUserName();
			}
			else{
				userToken = "abc";
			}
		    
		  //TODO change hard coding
		  Integer advisorPartyId = userSession.getPartyId(); 
		  Integer buId = userSession.getBuId();
		  
		  String token = "153443";
		  String partner = null;
			 
			if(request.getParameter("quickSearchpart") != null){
				partner = request.getParameter("quickSearchpart"); 
			} else { 
				partner = "";
			}        
		  
		  BaseResponse<TransactionData> baseResponse = new BaseResponse<TransactionData>();
		  TransactionData transactionVo = new TransactionData();
			transactionVo.setSearchText(searchTextVal);
			int partnerid = userSession.getUserId(); 
			if(partner != null && partner != "")  
			{    
				transactionVo.setBuId(Integer.parseInt(partner)); 
			}     
			else
			{ 
			logger.debug("in else getbulkuploadhistory................"+partnerid); 
			transactionVo.setBuId(partnerid);  
				} 
			     
		  url = URL_GET_EXECUTION + userToken + "/1234";   
		  baseResponse = restTemplate.postForObject(url, transactionVo, BaseResponse.class); 
		 
		  List<TransactionData> uploadHistoryAsJson = new ArrayList<TransactionData>();
		  List<TransactionData> uploadHistoryList = new ArrayList<TransactionData>();	 
		  
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   uploadHistoryAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<uploadHistoryAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   TransactionData TransactionDataList2;
				   TransactionDataList2 = objectMapper.readValue(objectMapper.writeValueAsString(uploadHistoryAsJson.get(i)), TransactionData.class);
									
					
				   uploadHistoryList.add(TransactionDataList2);
				}  


		   } catch (JsonParseException e) {
		    // TODO Auto-generated catch block	
			   logger.error(e);
		   } catch (JsonMappingException e) {
		    // TODO Auto-generated catch block
			   logger.error(e);
		   } catch (JsonGenerationException e) {
		    // TODO Auto-generated catch block
			   logger.error(e);
		   } catch (IOException e) {
		    // TODO Auto-generated catch block
			   logger.error(e);
		   }
		  } 
		   
		  response.addHeader("Content-Disposition", "attachment;filename=RTAUploadHistory.xls");
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Partner Name")); 
		   writer.print("\t");
		   writer.print(CommonUtils.escape("ARN"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Date")); 
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Batch Id"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Source and File Type"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("File Name"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Status"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Error Count"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Record Count"));
		   /*writer.print("\t");
		   writer.print(CommonUtils.escape("Success Count"));
*/		   writer.println();  
		 
		   
		   for(TransactionData list:uploadHistoryList){ 
			writer.print(CommonUtils.escape(list.getPartnername()));
			writer.print("\t");
			writer.print(CommonUtils.escape(list.getArn())); 
			writer.print("\t");        
			writer.print(CommonUtils.escape(list.getCreatedDate()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getBatchId().toString())); 
		    writer.print("\t"); 
		    writer.print(CommonUtils.escape(list.getTransactionType()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getFileName()));
		    writer.print("\t"); 
		    writer.print(CommonUtils.escape( list.getStatus()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getErrorCount().toString()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getRecordCount().toString()));
		    /*writer.print("\t"); 
		    writer.print(CommonUtils.escape( list.getSuccessCount().toString()));
		  */   
		    writer.println();   
		 
		   }  
		       
		  } catch (IOException e) {
			  logger.error(e);
		  }
		 }
   

	 @SuppressWarnings("unchecked")
	public void uploadHistoryCSV(HttpServletRequest request, HttpServletResponse response) {
		
		  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		  try{
		  
		   if(userSession == null) {
		   response.sendRedirect("/login");
		   return ;
		  }
		   	
		   String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
				//searchTextVal = request.getParameter("searchtext"); 
			} else {
				searchTextVal = "";
			}
		   
			String userToken = null;
			if(userSession.getUserName()!=null){
				userToken = userSession.getUserName();
			}
			else{
				userToken = "abc";
			}
		  //TODO change hard coding
		  Integer advisorPartyId = userSession.getPartyId(); //6326
		  Integer buId = userSession.getBuId();
		  String token = "153443";   
		  
		  String partner = null;
			 
			if(request.getParameter("quickSearchpart") != null){
				partner = request.getParameter("quickSearchpart"); 
				       
			} else { 
				partner = "";
				
			}        
		  
		  BaseResponse<TransactionData> baseResponse = new BaseResponse<TransactionData>();
		  TransactionData transactionVo = new TransactionData();
			transactionVo.setSearchText(searchTextVal);
				int partnerid = userSession.getUserId();  
			
			
			
			if(partner != null && partner != "")    
			{    
			transactionVo.setBuId(Integer.parseInt(partner)); 
			  
			}       
			else
			{
			
			transactionVo.setBuId(partnerid);  
				}   
			     
		  url = URL_GET_EXECUTION + userToken + "/1234";   
		  baseResponse = restTemplate.postForObject(url, transactionVo, BaseResponse.class); 
		  
		
		 
		  List<TransactionData> uploadHistoryAsJson = new ArrayList<TransactionData>();
		  List<TransactionData> uploadHistoryList = new ArrayList<TransactionData>();	 
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   uploadHistoryAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<uploadHistoryAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   TransactionData TransactionDataList2;
				   TransactionDataList2 = objectMapper.readValue(objectMapper.writeValueAsString(uploadHistoryAsJson.get(i)), TransactionData.class);
									
					
				   uploadHistoryList.add(TransactionDataList2);
				}


		   } catch (JsonParseException e) {
		    // TODO Auto-generated catch block 
			   logger.error(e);
		   } catch (JsonMappingException e) {
		    // TODO Auto-generated catch block
			   logger.error(e);
		   } catch (JsonGenerationException e) {
		    // TODO Auto-generated catch block
			   logger.error(e);
		   } catch (IOException e) {
		    // TODO Auto-generated catch block
			   logger.error(e);
		   }
		  }
		   response.addHeader("Content-Disposition", "attachment;filename=RTAUploadHistory.csv");
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Partner Name")); 
		   writer.print(",");
		   writer.print(CommonUtils.escape("ARN")); 
		   writer.print(",");
		   writer.print(CommonUtils.escape("Date")); 
		   writer.print(",");
		   writer.print(CommonUtils.escape("Batch Id"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Source and File Type"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("FileName")); 
		   writer.print(",");
		   writer.print(CommonUtils.escape("Status"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Error Count"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Record Count"));
		  /* writer.print(",");
		   writer.print(CommonUtils.escape("Success Count"));
		*/   writer.print(",");   
		   writer.println();     
		      
		   for(TransactionData list:uploadHistoryList){ 
			writer.print(CommonUtils.escape(list.getPartnername()));
			writer.print(",");
			writer.print(CommonUtils.escape(list.getArn())); 
			writer.print(","); 
			writer.print(CommonUtils.escape(list.getCreatedDate()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getBatchId().toString()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getTransactionType()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getFileName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getStatus()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getErrorCount().toString()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getRecordCount().toString()));
		   /* writer.print(",");
		    writer.print(CommonUtils.escape( list.getSuccessCount().toString()));
		  */  writer.println(); 
 
		   }          
		       
		  } catch (IOException e) {
			  logger.error(e); 
		  }
		 }    
	 
	 @SuppressWarnings("unchecked")    
	public void getPartnerPSTSection(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
					
					UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
					url = URL_GET_PARTNER_PST + userSession.getUserName()+ "/1234";
					UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url); 
					uriCB.queryParam("sessionbuId", userSession.getBuId());
					uriCB.queryParam("sessionuserId", userSession.getUserId());  
					Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
					br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
					List<TransactionData> partnerlist = new ArrayList<TransactionData>();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						partnerlist= br.getResponseListObject();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						partnerlist= br.getResponseListObject();   
					             
					Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ partnerlist, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
					PrintWriter out = null;
					out = response.getWriter();    
					response.setContentType("application/json");  
					objectMapper.writeValue(out, partnerlist);   
			}  
	   
	 
	 @SuppressWarnings("unchecked") 
	public void requestforreprocess(HttpServletRequest request,HttpServletResponse response) {
		   try {  
		  UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		  int createdBy = userSession.getUserId();  
		  
		  url = URL_GET_REQUEST_REPROCESS +"ramu"+"/1234";
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		  uriCB.queryParam("batchId",request.getParameter("queueId"));  
		  uriCB.queryParam("createdBy",request.getParameter("createdBy")); 
		   
		  Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		  BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
		  br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		  List<TransactionData> list = new ArrayList<TransactionData>();  
		  if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		  list= br.getResponseListObject(); 
		  Logger.logEntry(this.getClass(), "DATA LIST:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		  
		//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97117,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_RTAFILE,
									FiinfraConstants.SRP_INDIVIDUAL_REPROCESS_RTAFILE, 
									"SP="+FiinfraConstants.SP_GET_REQUEST_REPROCESS+",batchId="+request.getParameter("queueId"),
									"BatchId : "+request.getParameter("queueId"));  
		     
		  PrintWriter out = null; 
		  out = response.getWriter();
		  response.setContentType("application/json");
		  objectMapper.writeValue(out, list);   
		 } catch (Exception e) { 
			 logger.error(e);
		 }
		}
	 
	  
	 @SuppressWarnings("unchecked") 
		public void bulkReprocess(HttpServletRequest request,HttpServletResponse response) throws IOException 
		  { 
				
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				String list=request.getParameter("Lists");
				url = URL_GET_BULK_REPROCESS + "abcd"+ "/1234";
				  
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				uriCB.queryParam("Lists", list);
				uriCB.queryParam("batchId",request.getParameter("queueId"));    
				  
				Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				BaseResponse<Integer> br = new BaseResponse<Integer>();
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				Integer bulkReprocessList=null;
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					bulkReprocessList= br.getResponseObject();  
				  
				Logger.logEntry(this.getClass(), "bulkReprocessList:---"+ bulkReprocessList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				
				//insert code for audit functionality
				FiinfraUtility.doAudit(userSession.getPartyId(),
										userSession.getUserId(), 97116,
										FiinfraConstants.SERVICE_PORTAL,
										FiinfraConstants.SRP_SOURCE_MODULE_RTAFILE,
										FiinfraConstants.SRP_BULK_REPROCESS_RTAFILE, 
										"SP="+FiinfraConstants.SP_GET_BULK_REPROCESS+",batchId="+request.getParameter("queueId"),
										"BatchIds : "+list);   
				
				PrintWriter out = null;    
				out = response.getWriter();   
				response.setContentType("application/json");
				objectMapper.writeValue(out, bulkReprocessList);  
					  
				}
	 
	    
	 
	 @SuppressWarnings("unchecked")
		@RequestMapping(value = "/getbulkuploadtransactiohistorydetails", method = RequestMethod.GET)
		public ModelAndView getbulkuploadtransactiohistorydetails(HttpServletRequest request,
				HttpServletResponse response) throws IOException
		{
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				int sessionid =userSession.getBuId();
				int patnerId=userSession.getPartyId();
				 
				String userToken = null;
				if(userSession.getUserName()!=null){
					userToken = userSession.getUserName();
				}
				else{  
					userToken = "abc";
				}
				 
				String batchId =request.getParameter("queueId") ; 
				
				ModelAndView mav = new ModelAndView("execution/executiontracker_uploadhistorydetails");
				try {
						BaseResponse<TransactionHistoryData> br = new BaseResponse<TransactionHistoryData>();
						TransactionHistoryData transactionVo = new TransactionHistoryData();
						transactionVo.setBatchId(batchId); 
						transactionVo.setPartyid(patnerId);
						   
						url = URL_GET_BULK_TXNHISTORYDETAILS + userSession.getUserName() + "/1234"; 
						br = restTemplate.postForObject(url, transactionVo, BaseResponse.class);
						List<TransactionHistoryData> uploadHistoryDetails = new ArrayList<TransactionHistoryData>();
						if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
							uploadHistoryDetails=br.getResponseListObject();
						mav.addObject("transactionHistoryData", uploadHistoryDetails);  
						PrintWriter out= null;       
					    
					try {          
							out = response.getWriter();
						} catch (Exception e) {
							// TODO Auto-generated catch block  
							logger.error(e);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						logger.error(e);
					} 
					   return mav;
		}       

	 
	    @SuppressWarnings("unchecked")    
		@RequestMapping(value = "/getbulkuploaderrorcount", method = RequestMethod.GET)
		public ModelAndView getbulkuploaderrorcount(HttpServletRequest request,
				HttpServletResponse response) throws IOException
		{  		
	    		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				int buId =userSession.getBuId();
				 
				String userToken = null;
				if(userSession.getUserName()!=null){
					userToken = userSession.getUserName();
				}
				else{    
					userToken = "abc";
				} 
				 
				int batchId=Integer.parseInt(request.getParameter("queueId"));   
				ModelAndView mav = new ModelAndView("execution/executiontracker_errorLog");
				
				try {
					 BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
					 TransactionData transactionVo = new TransactionData();
					 transactionVo.setBuId(buId);
					 transactionVo.setBatchId(batchId);
					        
					url = URL_GET_BULK_TXNHISTORYERRORLOG+userSession.getUserName()+"/1234"; 
					br = restTemplate.postForObject(url, transactionVo, BaseResponse.class);
					List<TransactionData> uploadErrorLog = new ArrayList<TransactionData>();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						uploadErrorLog=br.getResponseListObject(); 
					mav.addObject("uploadErrorLog", uploadErrorLog);          
					PrintWriter out= null;          
					        
					try {               
							out = response.getWriter(); 
						} catch (Exception e) {
							// TODO Auto-generated catch block  
							logger.error(e); 
						} 
					} catch (Exception e) {
						// TODO Auto-generated catch block
						logger.error(e);
					} 
				
					   return mav;
		} 
 
	    @SuppressWarnings("unchecked")
		@RequestMapping(value = "/getNewFilesUpload", method = RequestMethod.GET)
		public ModelAndView getNewFilesUpload(HttpServletRequest request,HttpServletResponse response) throws IOException
		{
			ModelAndView mav = new ModelAndView("execution/executiontracker_bulkupload");
				
			return mav;
		}
		
	    @SuppressWarnings("unchecked")
		public void getbulkuploadSourceType(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			url = URL_GET_SOURCE_LIST+"xyz/1234";
			String codeTypeIds=request.getParameter("codeTypeIds");
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("codeTypeIds", codeTypeIds);
			uriCB.queryParam("buId", userSession.getBuId());
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
	    
	    public void getbulkuploadFileType(HttpServletRequest request, 
				HttpServletResponse response) throws Exception {
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			url = URL_GET_FILE_TYPE+userSession.getUserName()+"/1234";
			int parentId=Integer.parseInt(request.getParameter("parentId"));
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("parentId", parentId); 
			uriCB.queryParam("buId", userSession.getBuId());
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
					.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			
			List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				 codeValueDataList= br.getResponseListObject();
			
			PrintWriter out = null;
			out = response.getWriter(); 
			response.setContentType("application/json");
			objectMapper.writeValue(out, codeValueDataList);
		}
		
		 
	  
	    
	    @SuppressWarnings("unchecked")
		public ModelAndView bulkUploadTxn(HttpServletRequest request,
				HttpServletResponse response ,FileUpload fileUpload) throws IOException
			{
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			url = URL_BULK_UPLOAD + userSession.getUserName()+ "/1234";
			
			DocumentData documentData =  new DocumentData();
			
			File baseFolder=null;
			String fileName = null; 
			String filePath = null; 
			String extension = null;
			String basePath = null;  
			MultipartFile multipartFile = null;
			  
			try {  
				
				 multipartFile = (fileUpload).getFile(); 
				String originalFileName = "";
				originalFileName=request.getParameter("ftxtid");    
				
  
				if (multipartFile != null) {
					originalFileName = multipartFile.getOriginalFilename();
					logger.debug("FILE SIZE in KB:::::"+multipartFile.getSize()/1024+"kb");
				
				if(multipartFile.getSize() > 0 && multipartFile.getSize()<=10000000){
 
				long currentTime = System.currentTimeMillis();
				
				basePath = request.getParameter("hdnbasepath"); 
				
				logger.debug("basepath is:--" + basePath);  
				 baseFolder = new File(basePath);   
				 fileName = null;  
				 extension = null;   
				fileName = originalFileName.substring(0,
						originalFileName.lastIndexOf("."));  
				extension = originalFileName.substring(originalFileName
						.lastIndexOf("."));
				logger.debug("File name is :--" + fileName);
				logger.debug("extension is:--" + extension); 
				/*String[] s = extension.split(".");
				if(s[0].equalsIgnoreCase("BMP")){
					String filetypeId = "11001";    
				}*/ 
				logger.debug("filename to set:---" + fileName + "_"
						+ currentTime + extension);
				fileName = fileName + "_" + currentTime + extension;
				filePath = basePath + "\\" + fileName;
				logger.debug("filePath:-------" + filePath);     
				File fileToUpload = new File(filePath);   
				if (baseFolder.exists()) {  
					/*
					 * FileUtils.deleteDirectory(baseFolder); baseFolder = new
					 * File(basePath); baseFolder.mkdirs();  
					 */}  else { 
					baseFolder.mkdirs();// creates directory
				}
				// uploads file to that directory 

				logger.debug("fileToUpload::" + fileToUpload);  
				multipartFile.transferTo(fileToUpload);
				}else{ 
					logger.debug("Size  should be less than 10000000 bytes and greater than 0.");
					//return ;
				}  
			 }
			  } catch (Exception e) {   
				
				logger.error(e);                   
			}     
			
			int txnSourceId      = 	Integer.parseInt(request.getParameter("fileType"));
			int createdBy 	 =	Integer.parseInt(request.getParameter("searchString1"));     
			
			documentData.setDocumentId(txnSourceId); 
			documentData.setFileName(fileName);
			documentData.setCreatedBy(createdBy);
			
			ObjectMapper om = new CustomJacksonObjectMapper();
			String jsonString=om.writeValueAsString(documentData);
			logger.debug("jsonString:---"+jsonString);
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			List<DocumentData> docList=new ArrayList<>(); 
			
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
				       
			BaseResponse<List<DocumentData>> br = new BaseResponse<List<DocumentData>>();
				   
				   br = restTemplate. postForObject(url, documentData, BaseResponse.class);
				  
				      
				   if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))    
					   docList = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()),List.class);
			    
				 //insert code for audit functionality
					FiinfraUtility.doAudit(userSession.getPartyId(),
											userSession.getUserId(), 97119,
											FiinfraConstants.SERVICE_PORTAL,
											FiinfraConstants.SRP_SOURCE_MODULE_RTAFILE,
											FiinfraConstants.SRP_UPLOAD_RTAFILE,
											"SP="+FiinfraConstants.SP_UPLOAD_RTAFILES+",batchId="+request.getParameter("queueId")+"fileName="+fileName+"txnSourceId="+txnSourceId,
											"fileName : "+fileName);    
				    
			String s = "/"; 
			return new ModelAndView("redirect:"+s+"seret/getUploadHistory.htm");  
		}    
		    
		
	     @SuppressWarnings("unchecked") 
	    public void getUniqueBasePath(HttpServletRequest request,
	    		HttpServletResponse response) {
	    	
	    try {
	    	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	    	logger.debug(userSession.getUserName());
	    	url = URL_UNIQUE_BASEPATH +"ramu"+"/1234"; 
	    	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	    	uriCB.queryParam("txnSourceID", request.getParameter("txnSourceID"));    
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
	    	logger.error(e);
	     } 
	    }   
	    /** 
	     * Downloads the document
	     * @param request
	     * @param response
	     * @throws IOException
	     */

	    public String downloadAttachmentDownload(HttpServletRequest request,
	    		HttpServletResponse response) throws IOException{
	    	
	    	try {    
				
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			
				 
				String realPath = request.getParameter("filepath"); 
				String path= realPath; 
				String filename = request.getParameter("fileName");
				    
				String extension = null;
				extension = filename.substring(filename.lastIndexOf("."));  
				logger.info("extension is:--" + extension);
				 
				InputStream file = new FileInputStream(new File(path));     
				logger.debug("file:----"+file.available());   
				response.setContentType("application/octet-stream");
				response.setHeader("Content-Disposition","attachment; filename=\"" +filename+extension+"\"");     
				FileCopyUtils.copy(file, response.getOutputStream());
			} catch (Exception e) { 
				// TODO Auto-generated catch block 
				 
				return "redirect:/seret/getUploadHistory.htm?error=true";    

			}        
			return "";        
	       
	    }  
	    
	    /**
		 * Downloads the document
		 * @param request
		 * @param response
		 * @throws IOException
		 */ 
		@SuppressWarnings("unchecked")
		public void downloadFileFromConext(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			String fileName=request.getParameter("fileName");
			String filePath=request.getParameter("filePath");
			String path= request.getSession().getServletContext()
					.getRealPath("/")+"/"+filePath;
			InputStream file = new FileInputStream(new File(path));
			logger.debug("file:----"+file.available());
	        response.setContentType("application/octet-stream");
	        response.setHeader("Content-Disposition","attachment; filename=\""+fileName+"\"");
	        FileCopyUtils.copy(file, response.getOutputStream());
			
		}  
 
 	  
}
