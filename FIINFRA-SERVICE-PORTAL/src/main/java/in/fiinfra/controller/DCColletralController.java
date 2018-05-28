package in.fiinfra.controller;

import static in.fiinfra.common.util.FiinfraConstants.LOCATION_TO_UPLOADFILE;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.Download;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.utils.FileUpload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;





public class DCColletralController extends MultiActionController  
{

	
private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(DownloadController.class);
	
	private RestTemplate restTemplate;
	String url;
	
	
	private ObjectMapper objectMapper;	
	
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
	


	@Value("${URL_DELETE_DC_COLLETRAL}")
	private String URL_DELETE_DC_COLLETRAL;

	@Value("${URL_GET_DC_COLLETRAL}")
	private String URL_GET_DC_COLLETRAL;

	@Value("${URL_ADD_DC_COLLETRAL}")
	private String URL_ADD_DC_COLLETRAL;
	
	
	public ModelAndView loaddccolletralist(HttpServletRequest request,
			HttpServletResponse response) {
		
		
	UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		
		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchstext")) {
			searchTextVal =request.getParameter("searchstext").trim();
		} else {
			searchTextVal = "";
		}
		// return jsp page
		ModelAndView mav = new ModelAndView("dccolletral/DCcolletral");

		try {

			url = URL_GET_DC_COLLETRAL +"kjhklhkj/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("searchText", searchTextVal);
			BaseResponse<Download> br = new BaseResponse<Download>();
			br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<Download> DownloadList = new ArrayList<Download>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				DownloadList = br.getResponseListObject();
			
			
			mav.addObject("dccolletral", objectMapper.writeValueAsString(DownloadList));
			mav.addObject("size", pagesize);
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;

	}
	
	
	
  	 
	public ModelAndView addDCcolletral(HttpServletRequest request,
			HttpServletResponse response, FileUpload fileUpload) throws IOException, ParseException
	{	
		Download download = new Download();
	    int partyId = 0;
	    String bizUnitName=null;
		String downloadSectionName =null;
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		url = URL_ADD_DC_COLLETRAL +"abc/1234";
		String documentName= null;
		
		

		File baseFolder=null;
		String fileName = null;
		String filePath = null;
		String extension = null;
		String basePath = null;
		int FileSize = 0;
		String documentfilename=null;
		MultipartFile multipartFile = null;
		try {
			 multipartFile = (fileUpload).getFile();
			String originalFileName = "";
			// originalFileName=request.getParameter("filename");

			if (multipartFile != null) {
				originalFileName = multipartFile.getOriginalFilename();
				System.out.println("FILE SIZE in KB:::::"+multipartFile.getSize()/1024+"kb");
				FileSize =(int) multipartFile.getSize();
				download.setFileSizeKB(FileSize);
			if(multipartFile.getSize() > 0 && multipartFile.getSize()<=10000000){

			long currentTime = System.currentTimeMillis();
			 basePath = LOCATION_TO_UPLOADFILE;
			 baseFolder = new File(basePath);
			 fileName = null;
			 extension = null;
			fileName = originalFileName.substring(0,
					originalFileName.lastIndexOf("."));
			documentfilename=fileName.toString();
			extension = originalFileName.substring(originalFileName
					.lastIndexOf("."));
			logger.info("File name is :--" + fileName);
			logger.info("extension is:--" + extension);

			logger.info("filename to set:---" + fileName + "_"
					+ currentTime + extension);
			fileName = fileName.replace(" ", "_") + "_" + currentTime + extension;
			
			filePath = basePath + "\\" + fileName;
			logger.info("filePath:-------" + filePath);
			
			File fileToUpload = new File(filePath);
			if (baseFolder.exists()) {
			
				 } else {
				baseFolder.mkdirs();// creates directory
			}
			// uploads file to that directory

			logger.info("fileToUpload::" + fileToUpload);
			multipartFile.transferTo(fileToUpload);
			}else{
				logger.info("Size  should be less than 10000000 bytes and greater than 0.");
				//return ;
			}
		 }
		  } catch (Exception e) {
			e.printStackTrace();
			// logger.error(e.getMessage());
		}
		
		download.setFileName(fileName);
		download.setFileStoragePathURI(filePath);
		download.setCreatedBy(userSession.getUserId());
		download.setLastModifiedBy(userSession.getUserId());
		int  buId2 = userSession.getBuId();
		download.setBuId2(buId2);
		download.setParty(userSession.getPartyId());
		download.setDocumentName(fileName);
	partyId= userSession.getPartyId();
		//download.setParty(partyId);
		
		if(request.getParameter("dccolletralSection")!=null){
			downloadSectionName = request.getParameter("dccolletralSection");
			download.setSectionid(downloadSectionName);
			logger.info("dccolletralSection:"+downloadSectionName);
		
			
		}
		if(request.getParameter("documentName")!=null){
			documentName = request.getParameter("documentName");
			
			logger.info("documentName:"+documentName);
		}else{
			documentName=documentfilename.toString();
			logger.info("documentName:"+documentName);
			
		}
		
		
	
//		url = URL_ADD_DOWNLOAD + userSession.getUserName() + "/1234";
		
		ObjectMapper om = new CustomJacksonObjectMapper();
		String jsonString=om.writeValueAsString(download);
		logger.info("jsonString:---"+jsonString);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<Download> downloadList=new ArrayList<>();
		
		//downloadServices.addNewDownload(10001,documentText,false,documentName,23,fileName,basePath,2555,multipartFile.getSize()/1024,partyId,true,downloadModuleID,downloadDescription,222,4444,45545,33333,true,true,true);
		if(fileName!=null && basePath!=null && multipartFile!=null ){
			if(request.getParameter("hiddenIsToClose")!=null && request.getParameter("hiddenIsToClose").equals("0"))
			{
				request.setAttribute("hiddenIsToClosee","0");
				
			}else{
				
				request.setAttribute("hiddenIsToClosee","");
			}
			
			
			BaseResponse<List<Download>> br = new BaseResponse<List<Download>>();
			logger.info("In WEb AddDownloadData.....");
			br = restTemplate.postForObject(url, download, BaseResponse.class);
			
		//	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				//downloadList = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()),List.class);
			
		}
		String objectname = downloadSectionName+","+documentName+extension; 
		@SuppressWarnings("unused")
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		String s = "/"; 
		FiinfraUtility.doAudit(userSession.getPartyId(), userSession.getBuId(), FiinfraConstants.SRP_ADD_DOWNLOAD_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_DOWNLOAD,FiinfraConstants.SRP_ADD_DOWNLOAD,"SP="+FiinfraConstants.SP_ADD_DC_COLLETRAL,objectname);
		return new ModelAndView("redirect:"+s+"/dccolletral/loaddccolletralist.htm?isToClose="+request.getParameter("hiddenIsToClose")+"");
	}
	


	public void deleteDCcolletral(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		if (request.getParameter("selectedlvalz") != null) {

			String list = request.getParameter("selectedlvalz");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
				int userid = userSession.getUserId();
			url = URL_DELETE_DC_COLLETRAL+"aaaa/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("Lists", list);
			uriCB.queryParam("userid", userid);
			
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			Integer codeValueDataList=null;
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				 codeValueDataList= br.getResponseObject();
			
			Logger.logEntry(this.getClass(), "codeValueDataList:---"+ codeValueDataList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			FiinfraUtility.doAudit(userSession.getPartyId(), userSession.getBuId(), FiinfraConstants.SRP_DELETE_DOWNLOAD_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_DOWNLOAD,FiinfraConstants.SRP_DELETE_DOWNLOAD,"SP="+FiinfraConstants.SP_DELETE_DC_COLLETRAL,list);
			objectMapper.writeValue(out, codeValueDataList);

		}
	}


	 public void Execl(HttpServletRequest request, HttpServletResponse response) {
		 logger.info("In export in download excel");
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
		  //TODO change hard coding
		  Integer advisorPartyId = userSession.getPartyId(); //6326
		  Integer buId = userSession.getBuId();
		  String token = "153443";
		  url = URL_GET_DC_COLLETRAL+"ramu"+"/1234";
		  //UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(URL_GET_FAQ_LIST + "/"+userSession.getUserName()+"/" + advisorPartyId + "/"+token+"&buId="+buId);
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		  uriCB.queryParam("searchText", searchTextVal);
		  BaseResponse<Download> baseResponse = new BaseResponse<Download>();
		  
		  //call service for all parties associated 
		  baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		  
		  List<Download> downloadAsJson = new ArrayList<Download> ();
		  List<Download> downloadList = new ArrayList<Download> ();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   downloadAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<downloadAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   Download downloadList2;
				   downloadList2 = objectMapper.readValue(objectMapper.writeValueAsString(downloadAsJson.get(i)), Download.class);
									
					
					downloadList.add(downloadList2);
				}


		   } catch (JsonParseException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (JsonMappingException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (JsonGenerationException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (IOException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   }
		  }
		  
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=DCcollateralList.xls");
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Biz Unit Name "));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Section Name"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("File Name"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Updated Date"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Updated By"));
		  /* writer.print("\t");
		   writer.print(CommonUtils.escape( "Updated on"));*/
	/*	   writer.print(",");
		   writer.print(CommonUtils.escape("STATUS"));*/
		   
		   writer.println();
		   for(Download list:downloadList){
			   
			   
		    writer.print(CommonUtils.escape(list.getBuId()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getSectionid()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getFileName()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getCreateddate()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getCreatedname()));
		    writer.println();
		    /*writer.print(CommonUtils.escape(task.getStatusName()));
		    writer.println();*/
		   }
		       
		  } catch (IOException e) {
		      e.printStackTrace();
		  }
		 }


	 public void CSV(HttpServletRequest request, HttpServletResponse response) {
		 logger.info("In export in download excel");
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
		  //TODO change hard coding
		  Integer advisorPartyId = userSession.getPartyId(); //6326
		  Integer buId = userSession.getBuId();
		  String token = "153443";
		  url = URL_GET_DC_COLLETRAL+"ramu"+"/1234";
		  //UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(URL_GET_FAQ_LIST + "/"+userSession.getUserName()+"/" + advisorPartyId + "/"+token+"&buId="+buId);
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		  uriCB.queryParam("searchText", searchTextVal);
		  BaseResponse<Download> baseResponse = new BaseResponse<Download>();
		  
		  //call service for all parties associated 
		  baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		  
		  List<Download> downloadAsJson = new ArrayList<Download> ();
		  List<Download> downloadList = new ArrayList<Download> ();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   downloadAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<downloadAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   Download downloadList2;
				   downloadList2 = objectMapper.readValue(objectMapper.writeValueAsString(downloadAsJson.get(i)), Download.class);
									
					
					downloadList.add(downloadList2);
				}


		   } catch (JsonParseException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (JsonMappingException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (JsonGenerationException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   } catch (IOException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   }
		  }
		  
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=DCcollateralList.csv");
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Biz Unit Name "));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Section Name"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("File Name"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Updated Date"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Updated By"));
		
		   
		   writer.println();
		   for(Download list:downloadList){
			   
			   
		    writer.print(CommonUtils.escape(list.getBuId()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getSectionid()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getFileName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getCreateddate()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getCreatedname()));
		    writer.println();
		    /*writer.print(CommonUtils.escape(task.getStatusName()));
		    writer.println();*/
		   }
		       
		  } catch (IOException e) {
		      e.printStackTrace();
		  }
		 }
	 
}
