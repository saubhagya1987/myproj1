package in.fiinfra.controller;


import in.fiinfra.common.common.DocumentValueData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.Download;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.utils.FileUpload;
import static in.fiinfra.common.util.FiinfraConstants.LOCATION_TO_UPLOADFILE;

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
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.Gson;
import com.google.gson.JsonParseException;

public class DownloadController extends MultiActionController
{
	//private static final Logger logger = Logger.getLogger(DownloadController.class);
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

	

	@Value("${URL_GET_DOWNLOAD_LIST}")
	private String URL_GET_DOWNLOAD_LIST;

	@Value("${URL_DELETE_DOWNLOAD}")
	private String URL_DELETE_DOWNLOAD;
	
	@Value("${URL_GET_DOWNLOAD_SECTION}")
	private String URL_GET_DOWNLOAD_SECTION;
	
	@Value("${URL_GET_PARTY_BY_PARTYID}")
	private String URL_GET_PARTY_BY_PARTYID;
	
	@Value("${URL_GET_FILE_NAME}")
	private String URL_GET_FILE_NAME;

	@Value("${URL_ADD_DOWNLOAD}")
	private String URL_ADD_DOWNLOAD;
	
	@Value("${URL_EDIT_DOWNLOAD}")
	private String URL_EDIT_DOWNLOAD;
	
	

	public void getDownloadsList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		String sourceSysId = "31003";
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/common/getDownloadsList/"+userSession.getUserName()+"/1234";
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("sourceSysId", sourceSysId);
		logger.info("URl Downloads===================="+url);
		List<DocumentValueData> documentValueData = (List<DocumentValueData>) FiinfraUtility.postRequest(uriCB, Object.class, restTemplate); 

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, documentValueData);
	}
	
	
	
	
	//@RequestMapping(value = "/loaddownloadlist", method = RequestMethod.GET)
	public ModelAndView loaddownloadlist(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		
		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal =request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
		// return jsp page
		ModelAndView mav = new ModelAndView("download/DownloadList");

		try {

			url = URL_GET_DOWNLOAD_LIST +"kjhklhkj/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("searchText", searchTextVal);
			BaseResponse<Download> br = new BaseResponse<Download>();
			br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<Download> DownloadList = new ArrayList<Download>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				DownloadList = br.getResponseListObject();
			
			
			mav.addObject("downloadList",  objectMapper.writeValueAsString(DownloadList));
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
	
	
	
	
	public void deleteDownloadList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		if (request.getParameter("selectedlvalz") != null) {

			String list = request.getParameter("selectedlvalz");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int userid = userSession.getUserId();
			url = URL_DELETE_DOWNLOAD + "aaaa/1234";
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
			FiinfraUtility.doAudit(userSession.getPartyId(), userSession.getBuId(), FiinfraConstants.SRP_DELETE_DOWNLOAD_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_DOWNLOAD,FiinfraConstants.SRP_DELETE_DOWNLOAD,list);
			objectMapper.writeValue(out, codeValueDataList);

		}
	}
	

	
	public void getDownloadSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		logger.info("in value");
		
//		List<Download> codeValue=downloadServices.ShowDownloadSection();
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
//		userSession.getUserName() +
		url = URL_GET_DOWNLOAD_SECTION +"aaaa/1234";

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		BaseResponse<Download> br = new BaseResponse<Download>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<Download> codeValue = new ArrayList<Download>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValue = br.getResponseListObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValue);
	}
   	
	
	public void getPartyByPartyId(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		logger.info("in value");
		
//		List<Download> codeValue=downloadServices.ShowDownloadSection();
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
//		userSession.getUserName() +
		url = URL_GET_PARTY_BY_PARTYID +"aaaa/1234";

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		BaseResponse<Download> br = new BaseResponse<Download>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<Download> party = new ArrayList<Download>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			party = br.getResponseListObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, party);
	}
	
	
	
	public void getFileName(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		logger.info("in value");
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		url = URL_GET_FILE_NAME +"aaaa/1234";

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		BaseResponse<Download> br = new BaseResponse<Download>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<Download> returnedFileName = new ArrayList<Download>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			returnedFileName = br.getResponseListObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, returnedFileName);
	}
	
	
	
/*	public void getFileName(HttpServletRequest request,HttpServletResponse response)throws IOException
	   {
 	
 	logger.info("editftxtid:"+request.getParameter("editftxtid"));
 	
 	logger.info("hdndocumentId::"+request.getParameter("hdndocumentIdd")); 
 	String  s = request.getParameter("hdndocumentIdd");
 	int documentId = Integer.parseInt(s);
 	String fileNamee = null;
 	List<Download> returnedFileName=downloadServices.fileName(documentId);
 	
 	 for(Download d: returnedFileName){
		  
 		 // System.out.println("getUserStatussssssssssssssssss::::::::::::::::"+s.getUserStatus());
 		  request.setAttribute("fileNamee", d.getFileName());
 		  fileNamee= d.getFileName();
 		  logger.info("filename:"+fileNamee);
 		  
 	  }
 	 String path = "D:/App/uploadedfiles/";
 	 String filePathName=path+fileNamee;
 	 File file2 = new File(filePathName);
 	 if(request.getParameter("editftxtid").equalsIgnoreCase(fileNamee)){
 		 ;
 	 }else{
	    	 if (file2.exists()) 
	    	 { 
	          logger.info("delete file incase of  overwriting");
	          file2.delete();
	         }
 	 }
	
	*/
	
	
/*	@SuppressWarnings("unchecked")
	public void addNewDownload(HttpServletRequest request,
			HttpServletResponse response,  FileUpload fileUpload)
					throws JsonGenerationException, JsonMappingException, IOException, ParseException {
	
		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		
				
//		url = URL_ADD_DOWNLOAD + userSession.getUserName() + "/1234";
		url = URL_ADD_DOWNLOAD +"abc/1234";
		
		logger.info("url:-" + url);
		 
		
		
		
		
		BaseResponse<String> br = new BaseResponse<String>();
//		br = restTemplate.postForObject(url, download, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			result = FiinfraConstants.SUCCESS;
		}
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		objectMapper.writeValue(out, result);
			
		

	}*/
	
	    
	    	 
	public ModelAndView addNewDownload(HttpServletRequest request,
			HttpServletResponse response, FileUpload fileUpload) throws IOException, ParseException
	{	
		Download download = new Download();
	    int partyId = 0;
	    String bizUnitName=null;
		String downloadSectionName =null;
		int downloadModuleID=0;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		url = URL_ADD_DOWNLOAD +"abc/1234";
		String documentName= null;
		String downloadDescription =null;
/*		boolean isShareDownload = false;
		boolean isShareEmail = false;
		boolean isShareView = false;*/
		Date downloadExpiryDate = null;
		
		SimpleDateFormat formatter = null;
		File baseFolder=null;
		String fileName = null;
		String filePath = null;
		String extension = null;
		String basePath = null;
		int FileSize = 0;
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
			extension = originalFileName.substring(originalFileName
					.lastIndexOf("."));
			logger.info("File name is :--" + fileName);
			logger.info("extension is:--" + extension);
//			String[] s = extension.split(".");
//			logger.info("s[0] :--" + s[0]);
//			if(s[0].equalsIgnoreCase("BMP")){
//				String filetypeId = "11001";
//				logger.info("filetypeId:--" +filetypeId);
//			}
			logger.info("filename to set:---" + fileName + "_"
					+ currentTime + extension);
			fileName = fileName.replace(" ", "_") + "_" + currentTime + extension;
			
			filePath = basePath + "\\" + fileName;
			logger.info("filePath:-------" + filePath);
			
			File fileToUpload = new File(filePath);
			if (baseFolder.exists()) {
				
				 /* FileUtils.deleteDirectory(baseFolder); baseFolder = new
				 * File(basePath); baseFolder.mkdirs();*/
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
	
		
	//	partyId= userSession.getPartyId();
		//download.setParty(partyId);
		if(request.getParameter("bizUnitName")!=null){
			bizUnitName = request.getParameter("bizUnitName");			
			logger.info("bizUnitName:"+bizUnitName);
			//download.setParty(bizUnitName);
			download.setParty(Integer.parseInt(request.getParameter("bizUnitName")));
			partyId=Integer.parseInt(bizUnitName);
		}
	
		if(request.getParameter("downloadSectionName")!=null){
			downloadSectionName = request.getParameter("downloadSectionName");
			logger.info("downloadSectionName:"+downloadSectionName);
			download.setDownloadModuleName(downloadSectionName);
			downloadModuleID=Integer.parseInt(downloadSectionName);
			download.setDownloadModuleID(downloadModuleID);
		}
		if(request.getParameter("documentName")!=null){
			documentName = request.getParameter("documentName");
			download.setDocumentName(documentName+extension);
			logger.info("documentName:"+documentName);
		}
		if(request.getParameter("descriptionNote")!=null){
			downloadDescription = request.getParameter("descriptionNote");
			download.setDownloadDescription(downloadDescription);
			logger.info("descriptionNote:"+downloadDescription);
		}
		if(request.getParameter("viewName")!=null){
					
			if(request.getParameter("viewName").equals("on") || request.getParameter("viewName").equals("1")){
				logger.info("viewName:"+request.getParameter("viewName"));
//				isShareView = true;
				download.setIsShareView(true);
		}
			
	   }
		if(request.getParameter("emailName")!=null){
			if(request.getParameter("emailName").equals("on") || request.getParameter("emailName").equals("1")){
				logger.info("emailName:"+request.getParameter("emailName"));
//				isShareEmail = true;
				download.setIsShareEmail(true);
			}
			
		}
		if(request.getParameter("downloadName")!=null){
			if(request.getParameter("downloadName").equals("on") || request.getParameter("downloadName").equals("1")){
				logger.info("downloadName:"+request.getParameter("downloadName"));
//				isShareDownload = true;
				download.setIsShareDownload(true);
			}
		}
		
		String SourceSysid = "";
		
		if(request.getParameter("serviceName")!=null){
			
			if(request.getParameter("serviceName").equals("on") || request.getParameter("serviceName").equals("1")){
				logger.info("serviceName:"+request.getParameter("serviceName"));
//				isShareView = true;
				download.setServicePortal(true);
				if(SourceSysid == ""){
				SourceSysid = SourceSysid+"31003";
				}else {
					SourceSysid = SourceSysid+",31003";
				}
		}
			
	   }
		if(request.getParameter("partnerName")!=null){
			if(request.getParameter("partnerName").equals("on") || request.getParameter("partnerName").equals("1")){
				logger.info("partnerName:"+request.getParameter("partnerName"));
//				isShareEmail = true;
				download.setPartnerPortal(true);
				if(SourceSysid == ""){
					SourceSysid = SourceSysid+"31001";
					}else {
						SourceSysid = SourceSysid+",31001";
					}
			}
			
		}
		if(request.getParameter("clientName")!=null){
			if(request.getParameter("clientName").equals("on") || request.getParameter("clientName").equals("1")){
				logger.info("clientName:"+request.getParameter("clientName"));
//				isShareDownload = true;
				download.setClientPortal(true);
				if(SourceSysid == ""){
					SourceSysid = SourceSysid+"31004";
					}else {
						SourceSysid = SourceSysid+",31004";
					}
			}
		}
		
		if(SourceSysid != ""){
		//download.setSourceSysid(SourceSysid);
		download.setSourceSystemid(SourceSysid);
		}
		
		if(request.getParameter("datepickerName")!=null){
			formatter = new SimpleDateFormat("dd/MM/yyyy");			
			
			
			try {
				String expdate=request.getParameter("datepickerName");
				  
				downloadExpiryDate =(Date) formatter.parse(expdate);
			   
			    
				logger.info(downloadExpiryDate);
				logger.info(formatter.format(downloadExpiryDate));
				download.setDatepickerName(expdate);
				download.setDownloadExpiryDate(downloadExpiryDate);
				
			  }
			  catch(Exception e)
			  {
			   e.printStackTrace();
			  }
			
			logger.info("datepickerName:"+downloadExpiryDate);
		     }
		
		
	
//		url = URL_ADD_DOWNLOAD + userSession.getUserName() + "/1234";
		
		ObjectMapper om = new CustomJacksonObjectMapper();
		String jsonString=om.writeValueAsString(download);
		logger.info("jsonString:---"+jsonString);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<Download> downloadList=new ArrayList<>();
		
		//downloadServices.addNewDownload(10001,documentText,false,documentName,23,fileName,basePath,2555,multipartFile.getSize()/1024,partyId,true,downloadModuleID,downloadDescription,222,4444,45545,33333,true,true,true);
		if(fileName!=null && documentName!=null && basePath!=null && multipartFile!=null && partyId!=0 && downloadModuleID!=0 &&  downloadDescription!=null && downloadExpiryDate!=null){
			if(request.getParameter("hiddenIsToClose")!=null && request.getParameter("hiddenIsToClose").equals("0"))
			{
				request.setAttribute("hiddenIsToClosee","0");
				
			}else{
				
				request.setAttribute("hiddenIsToClosee","");
			}
			
			
			BaseResponse<List<Download>> br = new BaseResponse<List<Download>>();
			logger.info("In WEb AddDownloadData.....");
			br = restTemplate.postForObject(url, download, BaseResponse.class);
			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				downloadList = objectMapper.readValue(
						objectMapper.writeValueAsString(br.getResponseListObject()),
						List.class);
			
			
			
//			downloadServices.addNewDownload(false,documentName,fileName,basePath,(int) (multipartFile.getSize()/1024),partyId,
//					true,downloadModuleID,downloadDescription,222,4444,isShareEmail,isShareView,isShareDownload,downloadExpiryDate);
		}
		String objectname =bizUnitName+","+ downloadSectionName; 
		@SuppressWarnings("unused")
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		String s = "/"; 
		FiinfraUtility.doAudit(userSession.getPartyId(), userSession.getBuId(), FiinfraConstants.SRP_ADD_DOWNLOAD_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_DOWNLOAD,FiinfraConstants.SRP_ADD_DOWNLOAD,objectname);
		return new ModelAndView("redirect:"+s+"download/loaddownloadlist.htm?isToClose="+request.getParameter("hiddenIsToClose")+"");
	}
	
	
	  /*  public void getPartyByPartyId(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
	    	List<Download> party=downloadServices.getPartyByPartyId();
	    	logger.info("party name: ");
	    	
	    	  Gson gson = new Gson();
	    	  System.out.println(gson.toJson(party));
	    	  System.out.println(party);
	    	  PrintWriter out=null ; 
	    	  out = response.getWriter();	    	   
	    	  response.setContentType("application/json");
	    	  objectMapper.writeValue( out,party);    	
	    	
	    	
	    }
	    public  void getDownloadSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
	    	List<Download> codeValue=downloadServices.ShowDownloadSection();

	    	  Gson gson = new Gson();
	    	  logger.info(gson.toJson(codeValue));
	    	  logger.info(codeValue);
	    	  PrintWriter out=null ; 
	    	  out = response.getWriter();	    	   
	    	  response.setContentType("application/json");
	    	  objectMapper.writeValue( out,codeValue);
			
		}*/
	    
	 public ModelAndView editDocument(HttpServletRequest request,
				HttpServletResponse response,FileUpload fileUpload) throws IOException, ParseException
				{
	    	Download download = new Download();
	    	int partyId = 0;
		    String editBizUnitName=null;
			String editDownloadSectionName =null;
			int downloadModuleID=0;
	UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
			url = URL_EDIT_DOWNLOAD +"abc/1234";
			
			String editDocumentName= null;
			String downloadDescription =null;
//			boolean isShareDownload = false;
//			boolean isShareEmail = false;
//			boolean isShareView = false;
			Date downloadExpiryDate = null;
			String documentIds;
			int documentId=0;
			
			SimpleDateFormat formatter = null;
			File baseFolder=null;
			String fileName = null;
			String filePath =  null;
			String extension = null;
			String basePath = null;
		int FileSize = 0;
			MultipartFile multipartFile = null;
			try {
				 multipartFile = (fileUpload).getEditfile();
				String originalFileName = "";
				originalFileName=request.getParameter("filename");

				if (multipartFile != null) {
					originalFileName = multipartFile.getOriginalFilename();
				
			
				logger.info("FILE SIZE in KB:::::"+multipartFile.getSize()/1024+"kb");
				logger.info("FILE SIZE in KB:::::"+multipartFile.getSize() +"bytes");
				FileSize =(int) multipartFile.getSize();
				download.setFileSizeKB(FileSize);
			if(multipartFile.getSize() > 0 && multipartFile.getSize()<=10000000)
			{

				long currentTime = System.currentTimeMillis();
				 basePath = LOCATION_TO_UPLOADFILE;
				 baseFolder = new File(basePath);
				 fileName = null;
				 extension = null;
				fileName = originalFileName.substring(0,
						originalFileName.lastIndexOf("."));
				extension = originalFileName.substring(originalFileName
						.lastIndexOf("."));
				logger.info("File name is :--" + fileName);
				logger.info("extension is:--" + extension);
//				String[] s = extension.split(".");
//				if(s[0].equalsIgnoreCase("BMP")){
//					String filetypeId = "11001";
//				}
				logger.info("filename to set:---" + fileName + "_"
						+ currentTime + extension);
				fileName = fileName.replace(" ", "_") + "_" + currentTime + extension;
				filePath = basePath + "\\" + fileName;
				logger.info("filePath:-------" + filePath);
				File fileToUpload = new File(filePath);
				if (baseFolder.exists()) {
					
//					 * FileUtils.deleteDirectory(baseFolder); baseFolder = new
//					 * File(basePath); baseFolder.mkdirs();
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
			
			if(request.getParameter("editBizUnitName")!=null){
				editBizUnitName = request.getParameter("editBizUnitName");			
				logger.info("editBizUnitName:"+editBizUnitName);
				partyId=Integer.parseInt(editBizUnitName);
				download.setParty(partyId);
				download.setBizUnit(editBizUnitName);
			}
			
			if(request.getParameter("editDownloadSectionName")!=null){
				editDownloadSectionName = request.getParameter("editDownloadSectionName");
				logger.info("editDownloadSectionName:"+editDownloadSectionName);
				downloadModuleID=Integer.parseInt(editDownloadSectionName);
				download.setDownloadModuleID(downloadModuleID);
				download.setDownloadModuleName(editDownloadSectionName);
			}
			if(request.getParameter("editDocumentNametxtName")!=null){
				editDocumentName = request.getParameter("editDocumentNametxtName");
				logger.info("editDocumentName:"+editDocumentName);
				download.setDocumentName(editDocumentName);
			}
			if(request.getParameter("editDescriptionNote")!=null){
				downloadDescription = request.getParameter("editDescriptionNote");
				logger.info("descriptionNote:"+downloadDescription);
				download.setDownloadDescription(downloadDescription);
			}
			if(request.getParameter("editViewName")!=null){
						
				if(request.getParameter("editViewName").equals("on") || request.getParameter("editViewName").equals("1")){
					logger.info("editViewName:"+request.getParameter("editViewName"));
					download.setIsShareView(true);
				}
				
			}
			if(request.getParameter("editDownloadName")!=null){
				if(request.getParameter("editDownloadName").equals("on") || request.getParameter("editDownloadName").equals("1")){
					logger.info("editDownloadName:"+request.getParameter("editDownloadName"));
					download.setIsShareDownload(true);
				}
			}
			if(request.getParameter("editEmailName")!=null){
				if(request.getParameter("editEmailName").equals("on") || request.getParameter("editEmailName").equals("1")){
					logger.info("editEmailName:"+request.getParameter("editEmailName"));
					download.setIsShareEmail(true);
				}
				
			}
		
			
			
			
			
			String SourceSysid = "";
			
			if(request.getParameter("editserviceName")!=null){
				
				if(request.getParameter("editserviceName").equals("on") || request.getParameter("editserviceName").equals("1")){
					logger.info("editserviceName:"+request.getParameter("editserviceName"));
//					isShareView = true;
					download.setServicePortal(true);
					if(SourceSysid == ""){
					SourceSysid = SourceSysid+"31003";
					}else {
						SourceSysid = SourceSysid+",31003";
					}
			}
				
		   }
			if(request.getParameter("editpartnerName")!=null){
				if(request.getParameter("editpartnerName").equals("on") || request.getParameter("editpartnerName").equals("1")){
					logger.info("editpartnerName:"+request.getParameter("editpartnerName"));
//					isShareEmail = true;
					download.setPartnerPortal(true);
					if(SourceSysid == ""){
						SourceSysid = SourceSysid+"31001";
						}else {
							SourceSysid = SourceSysid+",31001";
						}
				}
				
			}
			if(request.getParameter("editclientName")!=null){
				if(request.getParameter("editclientName").equals("on") || request.getParameter("editclientName").equals("1")){
					logger.info("editclientName:"+request.getParameter("editclientName"));
//					isShareDownload = true;
					download.setClientPortal(true);
					if(SourceSysid == ""){
						SourceSysid = SourceSysid+"31004";
						}else {
							SourceSysid = SourceSysid+",31004";
						}
				}
			}
			
			if(SourceSysid != ""){
				download.setSourceSystemid(SourceSysid);
				}
				
			 
				if(request.getParameter("editDatepickerName")!=null){
				  
				
					formatter = new SimpleDateFormat("dd/MM/yyyy");			
					
					
					try {
						String expdate=request.getParameter("editDatepickerName");
						downloadExpiryDate =(Date) formatter.parse(expdate);
						logger.info(downloadExpiryDate);
						
						download.setDatepickerName(expdate);
						download.setDownloadExpiryDate(downloadExpiryDate);
					  }
					  catch(Exception e)
					  {
					   e.printStackTrace();
					  }
					
			 
						logger.info("datepickerName:"+downloadExpiryDate);
				}
			 
			 
			 
			if(request.getParameter("hdndocumentIdNm")!=null){
				 documentIds = request.getParameter("hdndocumentIdNm");					
					documentId=Integer.parseInt(documentIds);
					logger.info("documentName:"+documentId);
					download.setHdndocumentIdNm(documentIds);
					download.setDocumentId(documentId);;
				
			}
			

			ObjectMapper om = new CustomJacksonObjectMapper();
			String jsonString=om.writeValueAsString(download);
			logger.info("jsonString:---"+jsonString);
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
					.currentThread().getStackTrace()[1].getMethodName());
			List<Download> downloadList=new ArrayList<>();
			
			
			if(documentId!=0 && editDocumentName!=null  && partyId!=0 && downloadModuleID!=0 && downloadDescription!=null && downloadExpiryDate!=null)
			{				
				request.setAttribute("hiddenIsToClosee","");
				if(request.getParameter("hiddenEditIsToClose")!=null && request.getParameter("hiddenEditIsToClose").equals("1"))
				{
					request.setAttribute("hiddenEditIsToClosee","1");
				}
				
				if(fileName!=null && basePath!=null && multipartFile!=null)
				{
					BaseResponse<List<Download>> br = new BaseResponse<List<Download>>();
					logger.info("In Edit_DownloadData.....");
					br = restTemplate.postForObject(url, download, BaseResponse.class);
					
					if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						downloadList = objectMapper.readValue(
								objectMapper.writeValueAsString(br.getResponseListObject()),
								List.class);
					
					
					
					
//					downloadServices.editDocument(documentId,editDocumentName,fileName,basePath,(int) (multipartFile.getSize()/1024),partyId,
//							downloadModuleID,downloadDescription,222,isShareEmail,isShareView,isShareDownload,downloadExpiryDate);
					
					
				}
				
			
				
				else {
	                int  sizeKB= Integer.parseInt(request.getParameter("hdnsizekbNm"));
	                String fileName1 =request.getParameter("editftxtid");
	                String basepath1 =request.getParameter("hdnbasepathNm").trim();
	                logger.info("basepath:::::"+basepath1);
				
	                download.setFileName(fileName1);
	            	download.setFileStoragePathURI(basepath1);
	            	 download.setFileSizeKB(sizeKB);
	                
	                BaseResponse<List<Download>> br = new BaseResponse<List<Download>>();
					logger.info("In else  .... Edit_DownloadData.....");
					br = restTemplate.postForObject(url, download, BaseResponse.class);
					
					if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						downloadList = objectMapper.readValue(
								objectMapper.writeValueAsString(br.getResponseListObject()),
								List.class);
					
//					downloadServices.editDocument(documentId,editDocumentName,fileName1,basepath1,sizeKB,partyId,
//							downloadModuleID,downloadDescription,222,isShareEmail,isShareView,isShareDownload,downloadExpiryDate);
				
				}
				logger.info("editftxtid:"+request.getParameter("editftxtid"));
				
				
			}
			String objectname = editBizUnitName+","+editDownloadSectionName;
			FiinfraUtility.doAudit(userSession.getPartyId(), userSession.getBuId(), FiinfraConstants.SRP_EDIT_DOWNLOAD_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_DOWNLOAD,FiinfraConstants.SRP_EDIT_DOWNLOAD,objectname);
			String s = "/"; 
			return new ModelAndView("redirect:"+s+"download/loaddownloadlist.htm?isToClosee="+request.getParameter("hiddenEditIsToClose")+"");
		}
	    
	 
	 
	 public void downloadCSV(HttpServletRequest request, HttpServletResponse response) {
		 logger.info("In export in download CSV");
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
		  url = URL_GET_DOWNLOAD_LIST+"ramu"+"/1234";
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
		  
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=DownloadList.csv");
		   
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Biz Unit "));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Download Section "));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Document Name [Type]"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("File Name"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Share Options View"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Share Options Download"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Share Options Email"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Listing Expires On"));
		  /* writer.print("\t");
		   writer.print(CommonUtils.escape( "Updated on"));*/
	/*	   writer.print(",");
		   writer.print(CommonUtils.escape("STATUS"));*/
		   
		   writer.println();
		   for(Download list:downloadList){
			   
			   
		    writer.print(CommonUtils.escape(list.getBizUnit()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getDownloadModuleName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getDocumentName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getFileName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getIsShareView()==true ? "true" : "false"));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getIsShareDownload()==true ? "true" : "false"));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getIsShareEmail()==true ? "true" : "false"));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getListingExpiresOn()));
		    writer.println();
		    /*writer.print(CommonUtils.escape(task.getStatusName()));
		    writer.println();*/
		   }
		       
		  } catch (IOException e) {
		      e.printStackTrace();
		  }
		 }
	 
	 
	 

	 public void downloadExecl(HttpServletRequest request, HttpServletResponse response) {
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
		  url = URL_GET_DOWNLOAD_LIST+"ramu"+"/1234";
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
		  
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=DownloadList.xls");
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Biz Unit "));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Download Section "));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Document Name [Type]"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("File Name"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Share Options View"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Share Options Download"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Share Options Email"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Listing Expires On"));
		  /* writer.print("\t");
		   writer.print(CommonUtils.escape( "Updated on"));*/
	/*	   writer.print(",");
		   writer.print(CommonUtils.escape("STATUS"));*/
		   
		   writer.println();
		   for(Download list:downloadList){
			   
			   
		    writer.print(CommonUtils.escape(list.getBizUnit()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getDownloadModuleName()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getDocumentName()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getFileName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape( list.getIsShareView()==true ? "true" : "false"));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getIsShareDownload()==true ? "true" : "false"));
		    writer.print("\t");
		    writer.print(CommonUtils.escape( list.getIsShareEmail()==true ? "true" : "false"));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getListingExpiresOn()));
		    writer.println();
		    /*writer.print(CommonUtils.escape(task.getStatusName()));
		    writer.println();*/
		   }
		       
		  } catch (IOException e) {
		      e.printStackTrace();
		  }
		 }

	
	 
	 
	
	 
	 
}
