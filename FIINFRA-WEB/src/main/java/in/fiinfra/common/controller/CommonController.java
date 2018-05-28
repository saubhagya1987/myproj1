package in.fiinfra.common.controller;




import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.opportunity.OpportunityStageData;
import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.partner.LocationData;
import in.fiinfra.common.partner.NotesData;
import in.fiinfra.common.token.FiinfraToken;
import in.fiinfra.common.token.FiinfraTokenException;
import in.fiinfra.common.util.RandomPasswordGenerator;
import in.fiinfra.common.admin.AddChat;
import in.fiinfra.common.admin.TestData;
import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.authentication.UserDetailsImpl;
import in.fiinfra.common.common.BroadCastData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.FaqsQuestionsData;
import in.fiinfra.common.common.MultipleDocumentData;
import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.common.PartyData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.common.SearchResultData;
import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.PartySetting;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.Logger;
import in.fiinfra.common.util.MD5Encryption;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.partner.controller.PartnerController;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.URL;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.codec.binary.Base64;
import org.apache.derby.tools.sysinfo;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.poi.openxml4j.opc.internal.FileHelper;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.google.gson.Gson;

public class CommonController extends MultiActionController {
	@Autowired
	Md5PasswordEncoder passwordEncoder;
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	private int partyId;
	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(CommonController.class);
	String url;
	@Value("${SUCCESSFULL_LOGIN}")
	private String SUCCESSFULL_LOGIN;
	@Value("${URL_GET_BROADCAST_NEWS}")
	private String URL_GET_BROADCAST_NEWS;
	@Value("${URL_GET_CONTACT_LIST}")
	private String URL_GET_CONTACT_LIST;		
	@Value("${URL_GET_DOCUMENT_REQUESTQ}")
	private String URL_GET_DOCUMENT_REQUESTQ;	
	@Value("${URL_GET_USER_LIST}")
	private String URL_GET_USER_LIST;
	@Value("${URL_GET_CHAT_AND_COMMENT_LIST}")
	private String URL_GET_CHAT_AND_COMMENT_LIST;
	@Value("${URL_INSERT_CHAT_RECORD}")
	private String URL_INSERT_CHAT_RECORD;
	@Value("${URL_GET_USER_FOR_TAGGING_LIST}")
	private String URL_GET_USER_FOR_TAGGING_LIST;
	@Value("${URL_GET_DOCUMENT_RECORD}")
	private String URL_GET_DOCUMENT_RECORD;
	@Value("${URL_GET_ALLOCATED_TEAMMEMBER_LIST}")
	private String URL_GET_ALLOCATED_TEAMMEMBER_LIST;
	@Value("${URL_GET_PICKLIST_VALUE_LIST}")
	private String URL_GET_PICKLIST_VALUE_LIST;
	@Value("${URL_GET_CITY_LIST}")
	private String URL_GET_CITY_LIST;
	@Value("${URL_GET_ADVICE_ASSUMPTIONS}")
	private String URL_GET_ADVICE_ASSUMPTIONS;
	@Value("${URL_SAVE_ADVICE_ASSUMPTIONS}")
	private String URL_SAVE_ADVICE_ASSUMPTIONS;
	@Value("${URL_CHANGE_PASSWORD}")
	private String URL_CHANGE_PASSWORD;
	@Value("${URL_INSERT_DOCUMENTS}")
	private String URL_INSERT_DOCUMENTS;
	@Value("${URL_DELETE_OBJECT}")
	private String URL_DELETE_OBJECT;
	@Value("${SAVE_USER_ACCESS_LOG}") 
	private  String SAVE_USER_ACCESS_LOG;
	@Value("${LOGOUT_URL}") 
	private  String LOGOUT_URL;
	@Value("${GET_PARTY_ATTRIBUTE}") 
	private  String GET_PARTY_ATTRIBUTE;
	
	
	@Value("${URL_GET_NON_ACCESSIBLE_CONTROLIDS}") 
	private  String URL_GET_NON_ACCESSIBLE_CONTROLIDS;
	
	@Value("${DIY_ENTRY_POINT}") 
	private  String DIY_ENTRY_POINT;
	
	@Value("${PHOTO_BASEPATH_CHAT}") 
	private  String PHOTO_BASEPATH_CHAT;
	
	@Value("${APP_ID_MAIL_BOX}") 
	private  String APP_ID_MAIL_BOX;
	@Value("${SECRET_KEY_MAIL_BOX}") 
	private  String SECRET_KEY_MAIL_BOX;
	@Value("${URL_MAIL_BOX}") 
	private  String URL_MAIL_BOX;
	
	@Value("${URL_GET_SEARCH_LIST}")
	private String URL_GET_SEARCH_LIST;
	
	@Value("${businessUnitId_Spa}")
	private String businessUnitId_Spa;
	@Value("${businessUnitId_DFDA}")
	private String businessUnitId_DFDA;
	@Value("${businessUnitId_Shubhachintak}")
	private String businessUnitId_Shubhachintak;
	@Value("${businessUnitId_Fiinfra}")
	private String businessUnitId_Fiinfra;

	@Value("${businessUnitId_Essel}")
	private String businessUnitId_Essel;

	@Value("${businessUnitId_Vista}")
	private String businessUnitId_Vista;
	
	@Value("${LOGOUT_URL_SHUBHCHINTAK}") 
	private  String LOGOUT_URL_SHUBHCHINTAK;
	@Value("${LOGOUT_URL_FIINFRA}") 
	private  String LOGOUT_URL_FIINFRA;
	@Value("${LOGOUT_URL_SPA}") 
	private  String LOGOUT_URL_SPA;
	
	@Value("${LOGOUT_URL_ESSEL}") 
	private  String LOGOUT_URL_ESSEL;
	
	@Value("${LOGOUT_URL_VISTA}") 
	private  String LOGOUT_URL_VISTA;
	
	
	
	@Value("${URL_GET_HEIRARCHY_DATA_VP}")
	private String URL_GET_HEIRARCHY_DATA_VP;	
	@Value("${GET_RTA_FILE_PASSWORDS}") 
	private String GET_RTA_FILE_PASSWORDS;

	@Value("${URL_GET_NOTE_LIST}")
	private String URL_GET_NOTE_LIST;
	
	@Value("${URL_GET_DOCUMENT_LIST}")
	private String URL_GET_DOCUMENT_LIST;
	
	@Value("${URL_GET_TASK_ALERT}")
	private String URL_GET_TASK_ALERT;
	
	
	private final String DATE_FORMAT_DD_MM_YYYY = "dd-MM-yyyy";
	private int loginType=FiinfraConstants.LOGIN_ACCESS_MODE_STANDARD;
	
	
	
	
	/**
	 * retrieves searchResultDatas list based on the party.
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonGenerationException 
	 */
	@SuppressWarnings("unchecked")
	public ModelAndView getSearchList(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		int partyId=userSession.getPartyId();
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		logger.info("pageSize------"+pagesize);
		String searchText=request.getParameter("serachText");
		
		String url = FiinfraUtility.getRestDBURL();
		
		//url = url + "services/opportunity/getOpportunitiesList/"+userSession.getUserName()+"/1234";
		url=URL_GET_SEARCH_LIST+userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("searchText", searchText);
		
		logger.info("URL Search Result.............");
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		BaseResponse<SearchResultData> br = new BaseResponse<SearchResultData>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	
		List<SearchResultData> searchResultDatas=new ArrayList<>();	
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			searchResultDatas=br.getResponseListObject();
		
		Logger.logEntry(this.getClass(), "searchResultDatas:---" + searchResultDatas, Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());
		
		ModelAndView mav = new ModelAndView("common/searchresult");	
//		mav.addObject("searchResultDatas", searchResultDatas);
		mav.addObject("searchResultDatas", objectMapper.writeValueAsString(searchResultDatas));
		mav.addObject("pagesize", pagesize);
		return mav;
	}

	@SuppressWarnings("unchecked")
	public void getContactDetailsList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String roleId;
		String loggedInUserPartyId;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
		int buId=userSession.getBuId();
		try {
			
			loggedInUserPartyId=request.getParameter("loggedInUserPartyId");
			roleId=request.getParameter("roleId");
			url = URL_GET_CONTACT_LIST+userSession.getName()+"/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("roleId", roleId);
			uriCB.queryParam("loggedInUserPartyId",loggedInUserPartyId);
			uriCB.queryParam("buId",buId);
			List<CodeValueData> codeValueDataList = Arrays.asList(restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), CodeValueData[].class).getBody());
			
			
			logger.info("codeValueDataList :---"+codeValueDataList);
			Logger.logEntry(this.getClass(), "codeValueDataList:---" + codeValueDataList,
					Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			PrintWriter out= null; 
			try {
				out = response.getWriter();
			} catch (IOException e) {
				logger.error(e);
			}
			objectMapper.writeValue(out, codeValueDataList);
		} catch (Exception e) {
			logger.error(e);
		}
	}
	
	public void getUserList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String recordType;
		String loggedInUserPartyId;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");

		loggedInUserPartyId=userSession.getPartyId().toString();

		int buId=userSession.getBuId();
		recordType=request.getParameter("recordType");
		
		url = URL_GET_USER_LIST+userSession.getName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("recordType", recordType);
		uriCB.queryParam("loggedInUserPartyId",loggedInUserPartyId);
		uriCB.queryParam("buId",buId);
		List<UserData> userList=(List<UserData>) FiinfraUtility.postRequest(uriCB,List.class,restTemplate);
		
		Logger.logEntry(this.getClass(), "userList:---" + userList,
				Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out= null; 
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(e);
		}
		objectMapper.writeValue(out, userList);
	 
	}
	
	public void getAllchatsAndCommentList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int startValue;
		int partyId=0;
		
		try{
			partyId=Integer.parseInt(request.getParameter("loggedInUserPartyId").toString());
		}catch(Exception e){
			partyId=Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		}
		
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		startValue=Integer.parseInt(request.getParameter("startValue"));
		int buId=userSession.getBuId();
		url = URL_GET_CHAT_AND_COMMENT_LIST+userSession.getName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("loggedInUserPartyId",partyId);
		uriCB.queryParam("startValue", startValue);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("nodeId", nodeId);
		
		List<Object> chatterList=(List<Object>) FiinfraUtility.postRequest(uriCB,List.class,restTemplate);
		chatterList.add(PHOTO_BASEPATH_CHAT);
		PrintWriter out= null; 
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(e);
		}
		objectMapper.writeValue(out, chatterList);
	 
	}
	public void insertChatRecord(HttpServletRequest request,
			HttpServletResponse response,AddChat addChat) throws Exception {
		try{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		long currentTime = new Date().getTime();
		
		/*buId should come from session*/
		int buId=userSession.getBuId();
		addChat.setBuId(buId);
		int createdBy = userSession.getUserId();
		MultipartFile[] m=null;
		
		if(addChat.getChatType().equals("chat")){
		m = addChat.getChatAttachment();
		
		if(m!=null){
		for (MultipartFile f : addChat.getChatAttachment()) {
			if (f.getOriginalFilename() != null
					&& !f.getOriginalFilename().equals("")) {
				String fileName = null;
				String extension = null;
				DocumentData d = new DocumentData();
				d.setDocumentName(f.getOriginalFilename());
				d.setDocumentStorageLocation(82001);
				d.setDocumentType(10001);
				d.setCreatedBy(createdBy);
				fileName = f.getOriginalFilename().substring(0,
						f.getOriginalFilename().lastIndexOf("."));
				extension = f.getOriginalFilename().substring(
						f.getOriginalFilename().lastIndexOf("."));
				d.setFileName(fileName + "_" + currentTime + extension);
				d.setFileSize((int) f.getSize());
				d.setFileTypeId(11006);
				documentDatas.add(d);
			}
		}
		
		}
		}
		else{
			m = addChat.getCommentAttachment();
			
			if(m!=null){
			for (MultipartFile f : addChat.getCommentAttachment()) {
				if (f.getOriginalFilename() != null
						&& !f.getOriginalFilename().equals("")) {
					String fileName = null;
					String extension = null;
					DocumentData d = new DocumentData();
					d.setDocumentName(f.getOriginalFilename());
					d.setDocumentStorageLocation(82001);
					d.setDocumentType(10001);
					d.setCreatedBy(createdBy);
					fileName = f.getOriginalFilename().substring(0,
							f.getOriginalFilename().lastIndexOf("."));
					extension = f.getOriginalFilename().substring(
							f.getOriginalFilename().lastIndexOf("."));
					logger.info("File name is :--" + fileName);
					logger.info("extension is:--" + extension);
					logger.info("filename to set:---" + fileName + "_"
							+ currentTime + extension);
					d.setFileName(fileName + "_" + currentTime + extension);
					d.setFileSize((int) f.getSize());
					d.setFileTypeId(11006);
					documentDatas.add(d);
				}
			}
			
			}
		}
		if (documentDatas.size()>0) {
			addChat.setAttachmentCount(documentDatas.size());
			addChat.setAttachment(true);
		}
		
		/*logic to identify what type of chat is processing*/
		int chatPartyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		addChat.setChatPartyId(chatPartyId); /*this variable is in session*/
		addChat.setRecordTypeId(userSession.getPartyTypeId()); /*this variable is in session*/
		
		addChat.setCreatedBy(createdBy);
		
		url = URL_INSERT_CHAT_RECORD+userSession.getName()+"/1234";
		addChat.setDocumentDatas(documentDatas);
		addChat.setChatAttachment(null);
		addChat.setCommentAttachment(null);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		addChat = restTemplate.postForObject(url, addChat, AddChat.class);
		
		String basePath = addChat.getBasePath();
		int chatId = addChat.getChatId();
		
		if (documentDatas.size()>0) {
			File baseFolder = new File(basePath);
			for (MultipartFile f : m) {
				if (f.getOriginalFilename() != null
						&& !f.getOriginalFilename().equals("")) {
					String fileName = null;
					String extension = null;
					fileName = f.getOriginalFilename().substring(0,
							f.getOriginalFilename().lastIndexOf("."));
					extension = f.getOriginalFilename().substring(
							f.getOriginalFilename().lastIndexOf("."));
					fileName = fileName + "_" + currentTime + extension;
					String filePath = basePath + "\\" + fileName;
					File fileToUpload = new File(filePath);
					if (baseFolder.exists()) {
					} else {
						baseFolder.mkdirs();// creates directory
					}
					// uploads file to that directory
					try {
						f.transferTo(fileToUpload);
					} catch (Exception e) {
						logger.error(e);
						// logger.error(e.getMessage());
					}
				}
			}
		}
		Logger.logEntry(this.getClass(), "queryData:---" + addChat,
				Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());
		String serverPath=request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath());
		request.getSession().setAttribute("ChatResult", "success");
		response.sendRedirect(serverPath+"/chat.htm");
		
		}
		catch(Exception e)
		{
			logger.error(e);
		}
		
	}
	
	public void getUserForTaggingList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List allDataList= new ArrayList();
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		String partyId;
		String searchText;
		partyId=request.getParameter("partyId");
		searchText=request.getParameter("post");
		/*buId should come from session*/
		int buId=userSession.getBuId();
		url = URL_GET_USER_FOR_TAGGING_LIST+userSession.getName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId",partyId);
		uriCB.queryParam("searchText", searchText);
		uriCB.queryParam("buId", buId);
		List userTaggingList=(List) FiinfraUtility.postRequest(uriCB,List.class,restTemplate);
		allDataList.add(userTaggingList);
		
//		Gson gson= new Gson();
		
		PrintWriter out= null; 
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(e);
		}
		objectMapper.writeValue(out, allDataList);
	}
	
	
	/**
	 * Downloads the document
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void downloadDocument(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_DOCUMENT_RECORD+userSession.getUserName()+"/1234";
		int docId=Integer.parseInt(request.getParameter("docId"));
		
		int buId=userSession.getBuId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("docId",docId);
		uriCB.queryParam("buId",buId);
//		DocumentData documentData=(DocumentData) FiinfraUtility.postRequest(uriCB,DocumentData.class,restTemplate);
		BaseResponse<DocumentData> br = new BaseResponse<DocumentData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		DocumentData documentData=new DocumentData();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			documentData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), DocumentData.class);
//			documentData=br.getResponseObject();
	
		InputStream file;
		//StringBuilder str = new StringBuilder(documentData.getFileStoragePathURI());
	        
	    // insert character value at offset 8
		/*if(str.charAt(20)!='/')
			str.insert(20, '/');*/	  
		try
		{
			 //file = new FileInputStream(new File(str.toString()));
			file = new FileInputStream(new File(documentData.getFileStoragePathURI()));
		}
		 catch(Exception e)
		 {
			 String data=documentData.getFileStoragePathURI().replaceAll(" ","");
			 
			 file = new FileInputStream(new File(data));
		 }
		System.out.println("file:----"+file.available());
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition","attachment; filename=\"" + documentData.getDocumentName() +"\"");
		response.setHeader("Content-Disposition","attachment; filename=\"" + documentData.getDocumentName() +"\"");
		FileCopyUtils.copy(file, response.getOutputStream());
	
       
	}
	
	/**
	 * Downloads the document
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void downloadAttachmentDownload(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		String path= request.getSession().getServletContext()
				.getRealPath("/")+"/OpportunityBulkUploadTemplate.xls";
		InputStream file = new FileInputStream(new File(path));
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment; filename=\"OpportunityBulkUploadTemplate.xls\"");
        FileCopyUtils.copy(file, response.getOutputStream());
		
	}
	
	
	public void getAllocatedTeamMembers(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_ALLOCATED_TEAMMEMBER_LIST+userSession.getUserName()+"/1234";
		int buId=userSession.getBuId();
		int partyId=userSession.getPartyId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId",buId);
		uriCB.queryParam("partyId",partyId);
//		DocumentData documentData=(DocumentData) FiinfraUtility.postRequest(uriCB,DocumentData.class,restTemplate);
		BaseResponse<PartyData> br = new BaseResponse<PartyData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		PartyData partyData=new PartyData();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
//			partyData=<>br.getResponseObject();
			partyData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), PartyData.class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, partyData);
	}
	
	/**
	 * Retrieve the list of picklist values needed in add/edit query page
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void getPicklistValues(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_PICKLIST_VALUE_LIST+"xyz/1234";
		String codeTypeIds=request.getParameter("codeTypeIds");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("codeTypeIds", codeTypeIds);
		uriCB.queryParam("buId", FiinfraConstants.AXISMFBUID);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		logger.info("-----------Before Calling APP In Web(getPicklistValues)-----------");
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		logger.info("-----------After Calling APP In Web(getPicklistValues)-----------");
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
		url = URL_GET_CITY_LIST+userSession.getUserName()+"/1234";
		int parentId=Integer.parseInt(request.getParameter("parentId"));
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("parentId", parentId);
		uriCB.queryParam("buId", userSession.getBuId());
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
	
	
	/*public String buildSession(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		String redirectUrl=null;
		// call stored proc for successful login
		try{
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String url = SUCCESSFULL_LOGIN + authentication.getName() + "/" + request.getRemoteAddr();
			UserSession userSession =  restTemplate.getForObject(url, UserSession.class);
			Object principal = authentication.getPrincipal();
			String password=null;
	        if (principal instanceof UserDetailsImpl) {
	        	password = ((UserDetailsImpl) (principal)).getPassword();
	            
	        }
			userSession.setUserName(authentication.getName());
			//add UserSession object  to session
			HttpSession session = request.getSession(false);
			if(session == null)
			{
				session = request.getSession(true);
			}
			session.setAttribute("userSession", userSession);
			session.setAttribute("password", password);
			
			
		}catch(Exception ex){
			logger.error("Error in login", ex);
		}
		redirectUrl="redirect:/common/redirect.htm";
		return redirectUrl;
	}*/
	
	public String buildSession(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		String redirectUrl=null;
		// call stored proc for successful login
		try{
			
			String userName = (String) request.getSession().getAttribute("USER_NAME");
			
			//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String url = SUCCESSFULL_LOGIN + userName + "/" + request.getRemoteAddr();
			UserSession userSession =  restTemplate.getForObject(url, UserSession.class);
			//request.getSession().setAttribute("userSession", userSession);
			userSession.setUserName(userName); 
			if(request.getParameterMap().containsKey("LOB")){
				userSession.setUserId(Integer.parseInt((String) request.getParameter("PST")));
				userSession.setRoleId(Integer.parseInt((String) request.getParameter("pstroleId")));
				logger.info("PST ROLE ID TEST"+userSession.getRoleId());
				loginType=FiinfraConstants.LOGIN_ACCESS_MODE_LOB;
			}
			url = URL_GET_NON_ACCESSIBLE_CONTROLIDS + userName + "/1234?partyId="+userSession.getPartyId()+"&buId="+userSession.getBuId()+"&sourceSystemId="+FiinfraConstants.PARTNER_PORTAL;
			BaseResponse<String> br=new BaseResponse<>();
			br = restTemplate.getForEntity(url, BaseResponse.class).getBody();
			List<String> idList=new ArrayList<>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				idList = br.getResponseListObject();
			request.getSession().setAttribute("idList", idList);
			logger.info("idList:-------"+idList);
			logger.info("isHeadOfNode="+userSession.getHeadOfNode());
			logger.info("Cureent Node Id="+userSession.getCurrentNodeId());
			
			if(userSession.getHeadOfNode()==true){
			int partyId=userSession.getPartyId();
			int currentNodeId=userSession.getCurrentNodeId();
			int level=userSession.getLevel();
			url=URL_GET_HEIRARCHY_DATA_VP + userSession.getUserName() + "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("currentNodeId", currentNodeId);
			uriCB.queryParam("level", level);
			
			BaseResponse<HeirarchyData> br1= new BaseResponse<HeirarchyData>();
			br1= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
			HeirarchyData heirarchyDatas=new HeirarchyData();
			if(br1.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				heirarchyDatas=objectMapper.readValue(objectMapper.writeValueAsString(br1.getResponseObject()), HeirarchyData.class);			
			}
			logger.info("heirarchyDatas Data----------"+heirarchyDatas);
			request.getSession().setAttribute("lstLocationData", objectMapper.writeValueAsString(heirarchyDatas.getLstLocationData()));
			request.getSession().setAttribute("lstPartnerHeirarchyData", objectMapper.writeValueAsString(heirarchyDatas.getLstPartnerHeirarchyData()));
			}else{
				request.getSession().setAttribute("lstLocationData", null);
				request.getSession().setAttribute("lstPartnerHeirarchyData", null);
				
			}
			request.getSession().setAttribute("nodeId", 0);
			request.getSession().setAttribute("partyId", userSession.getPartyId());
			request.getSession().setAttribute("oldpartyId", userSession.getPartyId());
			request.getSession().setAttribute("userSession", userSession);	
			String token = "12345";
			StringBuilder strBuilder = new StringBuilder();
			strBuilder.append(GET_PARTY_ATTRIBUTE);	
			strBuilder.append("/");
			strBuilder.append(userSession.getUserName());
			strBuilder.append("/");
			strBuilder.append(token);
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(strBuilder.toString());
			uriCB.queryParam("buId", userSession.getBuId());
			uriCB.queryParam("partyId", userSession.getPartyId());
			uriCB.queryParam("attributeCodeIds", "94514,94515");
			BaseResponse<List> baseResponse1 = new BaseResponse<List>();
			baseResponse1 = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<PartyAttribute> partyAttributes = new ArrayList<>();
			try{		
				List<PartyAttribute> partyAttributesAsJson= objectMapper.readValue(objectMapper.writeValueAsString(baseResponse1.getResponseListObject()), List.class);
				for(int i = 0; i<partyAttributesAsJson.size(); i++){										
					PartyAttribute attribute = null;
					attribute = objectMapper.readValue(objectMapper.writeValueAsString(partyAttributesAsJson.get(i)), PartyAttribute.class);
					partyAttributes.add(attribute);
				}
				if(partyAttributes.size()<2) {
					((UserSession) request.getSession().getAttribute("userSession")).setLogoHeight(50);
					((UserSession) request.getSession().getAttribute("userSession")).setLogoWidth(150);
					
				} else {
					((UserSession) request.getSession().getAttribute("userSession")).setLogoHeight(Integer.parseInt(partyAttributes.get(1).getAttributeValue().toString()));
					((UserSession) request.getSession().getAttribute("userSession")).setLogoWidth(Integer.parseInt(partyAttributes.get(0).getAttributeValue().toString()));
				}
			}
			catch(Exception e) {
			logger.equals(e);	
			}
			url = GET_RTA_FILE_PASSWORDS + userName + "/1234?partyId="+userSession.getPartyId()+"&buId="+userSession.getBuId()+"&sourceSystemId="+FiinfraConstants.PARTNER_PORTAL;
			BaseResponse<ProfileData> baseRes=new BaseResponse<ProfileData>();
			baseRes = restTemplate.getForEntity(url, BaseResponse.class).getBody();
			ProfileData profileData = null;
			if (baseRes.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				profileData = objectMapper.readValue(objectMapper.writeValueAsString(baseRes.getResponseObject()), ProfileData.class);
			
			if(profileData != null) {
				if(profileData.getCamsPassword().equals("") || profileData.getKarvyPassword().equals("") || profileData.getSundaramPassword().equals("")) {
					((UserSession) request.getSession().getAttribute("userSession")).setIsRTAFilePasswordSet(false);
				} else {
					((UserSession) request.getSession().getAttribute("userSession")).setIsRTAFilePasswordSet(true);
				}
			}else {			
				((UserSession) request.getSession().getAttribute("userSession")).setIsRTAFilePasswordSet(false);
				}
			
		}catch(Exception ex){
			logger.error("Error in login", ex);
		}
		if (request.getParameterMap().containsKey("GOTO") && request.getParameter("GOTO").contains("index")){
			redirectUrl="redirect:/common/redirect.htm?&GOTO="+request.getParameter("GOTO");
			//redirectUrl="redirect:/index.htm?&GOTO="+request.getParameter("GOTO");
		}else if(request.getParameterMap().containsKey("GOTO") && request.getParameter("GOTO").contains("profile")){
			
			redirectUrl="redirect:/common/redirect.htm?&GOTO="+request.getParameter("GOTO");
		}else 
			redirectUrl="redirect:/common/redirect.htm";
		return redirectUrl;
	}
	
	public String redirect(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		logger.info("in------buildSession()");
		String redirectUrl=null;
		String password=null;
		// call stored proc for successful login
		try{
			
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			if(userSession.getSuccessfulLoginCount()<1 && (userSession.getRecordtypeId()==14003)){
				redirectUrl="redirect:/setup.htm";
			} else if(userSession.getIsForceChangePasswordOnLogin()==true && userSession.getSuccessfulLoginCount()>0){
				redirectUrl="redirect:/changePassword.htm";
			}else{
				try{
					String baseUrl = "";
					Integer userid=0;
					String ipaddress="";
					String sessionId="";
					String username="";
					if(userSession != null)
					{
						userid = userSession.getUserId();
						username = userSession.getUserName();
//						password = request.getSession().getAttribute("password").toString();
//						password = new MD5Encryption().encrypt(password);
						ipaddress = request.getRemoteAddr();
						sessionId = request.getSession().getId();
					}
					
					if ( ( request.getServerPort() == 80 ) ||
					         ( request.getServerPort() == 443 ) ){
						baseUrl = request.getScheme() + "://" + request.getServerName() ;				
					}
					else{
						baseUrl = request.getScheme() + "://" +
						        request.getServerName() + ":" + request.getServerPort();				
					}
					String portalURL = baseUrl+"/FIINFRA-WEB/index.htm" ;
					response.setHeader("token", userSession.getUserName());
					//log user for successfull login
					saveUserAccessLog(userid, password, portalURL, sessionId, ipaddress, username);
					userSession.setSuccessfulLoginCount(1);
					request.getSession().setAttribute("userSession", userSession);
				}catch(Exception e){
					logger.error(e);
				}
				if (request.getParameterMap().containsKey("GOTO") && request.getParameter("GOTO").contains("index")){
					redirectUrl="redirect:/index.htm";
				}else if(request.getParameterMap().containsKey("GOTO") && request.getParameter("GOTO").contains("profile")){
					redirectUrl="redirect:/partnerprofile.htm";
				}else 
					redirectUrl="redirect:/index.htm";
			}
		}catch(Exception ex){
			logger.error("Error in login", ex);
		}
		return redirectUrl;
	}
	
	public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		int buid=0;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		buid=userSession.getBuId();
		String redirectUrl="login.htm";
		String serverPath=request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath());
		logger.info("server path:---"+request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath()));
		redirectUrl=serverPath+"/login.htm";
		request.getSession().invalidate();
		String url="";
		try {
			Properties properties = new Properties();
			InputStream stream = FileHelper.class.getClassLoader()
					.getResourceAsStream("ApplicationResources.properties");
			properties.load(stream);
			if(businessUnitId_Fiinfra.equals(String.valueOf(buid)))
			{  
				url = properties.getProperty("LOGOUT_URL_FIINFRA");
			}
			else if(businessUnitId_Spa.equals(String.valueOf(buid))){
				url = properties.getProperty("LOGOUT_URL_SPA");
			}
		else if(businessUnitId_DFDA.equals(String.valueOf(buid))){
			url = properties.getProperty("LOGOUT_URL_DFDA");
			}
			else if(businessUnitId_Essel.equals(String.valueOf(buid))){
				url = properties.getProperty("LOGOUT_URL_ESSEL");
			}
			else if(businessUnitId_Vista.equals(String.valueOf(buid))){
				url = properties.getProperty("LOGOUT_URL_VISTA");
			}
			else{
				url = properties.getProperty("LOGOUT_URL_SHUBHCHINTAK");
			}
			
			
			
			//res.sendRedirect(url);
		} catch (Exception e) {
			logger.error(e);
		}
		
		response.sendRedirect(url);
//		return redirectUrl;
	}
	
	public void getAdviceAssumptions(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_ADVICE_ASSUMPTIONS+"/1234?buId="+userSession.getBuId();
		int clientId=Integer.parseInt(request.getParameter("partyId"));
		String assumptionCodeIds = "98021,98022,98032,98002,98047,98045,98028,98020,98055,98027,98046,98019,98001";
		PartySettingInput partySettingInput=new PartySettingInput();
		partySettingInput.setClientPartyId(clientId);
		partySettingInput.setPartnerPartyId(userSession.getPartyId());
		partySettingInput.setBuPartyId(userSession.getBuId());
		partySettingInput.setAssumptionCodeIds(assumptionCodeIds);
		BaseResponse<AdviceAssumption> br = new BaseResponse<AdviceAssumption>();
		List<AdviceAssumption> adviceAssumptions = new ArrayList<AdviceAssumption>();
		logger.info("partySettingInput:----"+objectMapper.writeValueAsString(partySettingInput));
		br = restTemplate.postForObject(url, partySettingInput, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			adviceAssumptions = br.getResponseListObject();
		logger.info("adviceAssumptions:------"+adviceAssumptions);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, adviceAssumptions);
	}
	
	public void saveAdviceAssumption(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_SAVE_ADVICE_ASSUMPTIONS+"/1234?buId="+userSession.getBuId();
		int partyId=Integer.parseInt(request.getParameter("partyId"));
		int recordTypeId=Integer.parseInt(request.getParameter("recordTypeId"));
		String dataXML=request.getParameter("dataXML");
		logger.info("dataXML:-----"+dataXML);
		List<AdviceAssumption> adviceAssumptionList = new ArrayList<AdviceAssumption>();
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = null;
		try {
			db = dbf.newDocumentBuilder();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		InputSource is = new InputSource();
		is.setCharacterStream(new StringReader(dataXML));

		Document doc = null;
		try {
			doc = db.parse(is);
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		NodeList nodes = doc.getElementsByTagName("Assumption");
		logger.info("Nodes length:--"+nodes.getLength());
		  for (int i = 0; i < nodes.getLength(); i++) {
	          Element element = (Element) nodes.item(i);
	          NodeList assumptionCodeIdNode = element.getElementsByTagName("AssumptionCodeId");
	          Element line = (Element) assumptionCodeIdNode.item(0);
	          String assumptionCodeId = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList assumptionValueNode = element.getElementsByTagName("AssumptionValue");
	          line = (Element) assumptionValueNode.item(0);
	          String assumptionValue = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList valueDataTypeIdNode = element.getElementsByTagName("ValueDataTypeId");
	          line = (Element) valueDataTypeIdNode.item(0);
	          String valueDataTypeId = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList displayLabelNode = element.getElementsByTagName("DisplayLabel");
	          line = (Element) displayLabelNode.item(0);
	          String displayLabel = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList valueEndRangeNode = element.getElementsByTagName("ValueEndRange");
	          line = (Element) valueEndRangeNode.item(0);
	          String valueEndRange = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList valueStartRangeNode = element.getElementsByTagName("ValueStartRange");
	          line = (Element) valueStartRangeNode.item(0);
	          String valueStartRange = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList idNode = element.getElementsByTagName("Id");
	          line = (Element) idNode.item(0);
	          String id = FiinfraUtility.getCharacterDataFromElement(line);
	          
	          logger.info("assumptionCodeId:----"+assumptionCodeId+":---assumptionValue--"+assumptionValue);
	          logger.info("valueDataTypeId:----"+valueDataTypeId+":---displayLabel--"+displayLabel);
	          logger.info("valueEndRange:----"+valueEndRange+":---valueStartRange--"+valueStartRange);
	          logger.info("id:----"+id+":---id--"+id);
	          AdviceAssumption assumption=new AdviceAssumption();
	          
	          assumption.setAssumptionCodeId(Integer.parseInt(assumptionCodeId));
	          assumption.setAssumptionValue(assumptionValue);
	          assumption.setValueDataTypeId(Integer.parseInt(valueDataTypeId));
	          assumption.setDisplayLabel(displayLabel);
	          assumption.setValueEndRange(valueEndRange);
	          assumption.setValueStartRange(valueStartRange);
	          assumption.setRecordTypeId(recordTypeId);
	          assumption.setPartyId(partyId);
	          assumption.setCreatedBy(userSession.getUserId());
	          assumption.setLastModifiedBy(userSession.getUserId());
	          if(id.equals("0")){
	        	  assumption.setId(null);
	          }else{
	        	  assumption.setId(Integer.parseInt(id));
	          }
	          adviceAssumptionList.add(assumption);
		}
		
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.postForObject(url, adviceAssumptionList, BaseResponse.class);
		Boolean result=false;
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result=baseResponse.getResponseObject();
		logger.info("result:------"+result);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);
	}
	
	public void chnagePassword(HttpServletRequest request,HttpServletResponse response,in.fiinfra.common.common.UserData userData) throws IOException{
//		String oldPassword=request.getParameter("oldPassword");
//		String newPassword=request.getParameter("newPassword");
//		String confirmPassword=request.getParameter("confirmPassword");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		userData.setPartyId(userSession.getPartyId());
//		MD5Encryption md5Encryption = new MD5Encryption();
//		String encryptrdPassword = md5Encryption.encrypt(userData.getOldPassword());
		String encryptrdPassword = passwordEncoder.encodePassword(userData.getOldPassword(), null);
		userData.setOldPassword(encryptrdPassword);
//		encryptrdPassword = md5Encryption.encrypt(userData.getNewPassword());
		encryptrdPassword =passwordEncoder.encodePassword(userData.getNewPassword(), null);
		userData.setNewPassword(encryptrdPassword);
		userData.setUserId(userSession.getUserId());
		url = URL_CHANGE_PASSWORD+userSession.getName()+"/1234?buId="+userSession.getBuId();
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, userData, BaseResponse.class);
		Integer result=0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);
		
	}
	
	public void saveDocuments(HttpServletRequest request,HttpServletResponse response,MultipleDocumentData documentData) throws IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		MultipartFile[] files=documentData.getDocumentFiles();
		List<DocumentData> documentDatas=new ArrayList<>();
		long currentTime = new Date().getTime();
		int createdBy=userSession.getUserId();
		if(files!=null){
			for (MultipartFile f : files) {
				logger.info("f.getOriginalFilename():--"
						+ f.getOriginalFilename());
				if (f.getOriginalFilename() != null
						&& !f.getOriginalFilename().equals("")) {
					String fileName = null;
					String extension = null;
					DocumentData d = new DocumentData();
					d.setDocumentName(f.getOriginalFilename());
					d.setDocumentStorageLocation(82001);
					d.setDocumentType(10001);
					d.setCreatedBy(createdBy);
					fileName = f.getOriginalFilename().substring(0,
							f.getOriginalFilename().lastIndexOf("."));
					extension = f.getOriginalFilename().substring(
							f.getOriginalFilename().lastIndexOf("."));
					logger.info("filename to set:---" + fileName + "_"
							+ currentTime + extension);
					d.setFileName(fileName.replace(" ","") + "_" + currentTime + extension);
					d.setFileSize((int) f.getSize());
					d.setFileTypeId(11006);
					documentDatas.add(d);
				}
		}
		}
		documentData.setDocumentDatas(documentDatas);
		documentData.setDocumentFiles(null);
		partyId=Integer.parseInt(request.getParameter("partyId"));
		url = URL_INSERT_DOCUMENTS+userSession.getName()+"/1234?buId="+userSession.getBuId()+"&partyId="+partyId;
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, documentData, BaseResponse.class);
		String result=null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), String.class);
		
		if(files!=null && result!=null){
			FiinfraUtility.uploadAttachments(files, result, currentTime);
		}
		if(result!=null){
			result=FiinfraConstants.SUCCESS;
		}else{
			result=FiinfraConstants.FAIL;
		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);
		
	}
	
	public void deleteObject(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String ids = request.getParameter("ids");
		String object = request.getParameter("object");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_DELETE_OBJECT + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("ids", ids);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("object", object);
		BaseResponse<String> br = new BaseResponse<String>();
		try {
			br = restTemplate.getForEntity(
					FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class)
					.getBody();
		} catch (Exception e) {
			logger.error(e);
		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, br.getStatus());// TO Do: here status can
														// be SUCCESS or
														// .EMPTY_RESULT_SET.
														// Accordingly handle
														// this in View.
	}
	
	public  void saveUserAccessLog(Integer userId,String password,String url,String sessionId,String ipAddress,String username)
	{
		String token = "23d";
		UserAccessLog accessLog = new UserAccessLog();
		accessLog.setUserId(userId);
		accessLog.setLoginAccessModeId(loginType);
		accessLog.setEnteredPassword(password);
		accessLog.setLoginSuccessful(1);
		accessLog.setRedirectUrl(url);
		accessLog.setSessionId(sessionId);
		accessLog.setSourceIPAddress(ipAddress);
		accessLog.setSourceSystemId(FiinfraConstants.PARTNER_PORTAL);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_USER_ACCESS_LOG+ username+"/" + token);
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), accessLog, BaseResponse.class);
		
		
	}
	
	//RSS FEED READER
	public void RSSFeedsReader(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		PrintWriter out = null;
		String allDataListDetails = null;
		try{
			URL rssURL;
			Properties properties = new Properties();
			InputStream stream = getClass().getClassLoader().getResourceAsStream("ApplicationResources.properties");
			properties.load(stream);
			
			String urlString=properties.getProperty("NewsFeedLink");
			rssURL= new URL(urlString);
			
			DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			Document doc=builder.parse(rssURL.openStream());
			
			NodeList items = doc.getElementsByTagName("item");
			List<String> allDataList = new ArrayList<String>();
			for(int i=0;i < 10;i++){
				Element item = (Element) items.item(i);
				
				allDataList.add(getValue(item, "title"));
				//allDataList.add(getValue(item, "description"));
				allDataList.add(getValue(item, "link"));
				
			}
			
			
			allDataListDetails = new flexjson.JSONSerializer().serialize(allDataList);
			logger.info("allDataListDetails:" + allDataListDetails);
			
			
			
		}catch(Exception e){
			logger.error(e);
		}
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out,allDataListDetails);
		
	}
	
	public String getValue(Element parent,String nodeName)
	{
		return parent.getElementsByTagName(nodeName).item(0).getFirstChild().getNodeValue();
	}
	
	//BroadCast News
	public void getBroadCastList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		int sourceSystemId=FiinfraConstants.PARTNER_PORTAL;
		String url = FiinfraUtility.getRestDBURL();

		url = URL_GET_BROADCAST_NEWS+userSession.getName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("sourceSystemId", sourceSystemId);
		
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
	
		List<BroadCastData> broadCastDatas = (List<BroadCastData>) FiinfraUtility.postRequest(uriCB, Object.class, restTemplate); 

		Logger.logEntry(this.getClass(), "BroadCastData  :---"
				+ broadCastDatas, Logger.DEBUG, Thread.currentThread()
				.getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out,broadCastDatas);
	}
	
	
	public ModelAndView goTOInteractivePlanningTool(HttpServletRequest request,HttpServletResponse response){
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		String username=userSession.getUserName();
		String baseUrl="";
		  if ( ( request.getServerPort() == 80 ) ||
		           ( request.getServerPort() == 443 ) ){
		   baseUrl = request.getScheme() + "://" + request.getServerName() ;    
		  }
		  else{
		   baseUrl = request.getScheme() + "://" +
		           request.getServerName() + ":" + request.getServerPort();    
		  }
		request.getSession().invalidate();
		
		String sourceSystemId = Integer.toString(FiinfraConstants.PARTNER_PORTAL);
		String securityToken = "";
		
		try {
			securityToken = FiinfraToken.generateRestToken("username", sourceSystemId, request.getLocalAddr());
		} catch (FiinfraTokenException e) {
			logger.info("Exception:  "+e.getMessage());
		}
		
		String newRedirectUrl = baseUrl+"/FIINFRA-M-WEB/partner/loadhome.htm?TOKEN=abc&USER_NAME="+username+"&securityToken="+securityToken;
		return new ModelAndView("redirect:" + newRedirectUrl);
	}
	
	public void getAccesTockenForMithi(HttpServletRequest request,HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException, ParseException{
		String token="";
		final String prefix = URL_MAIL_BOX;
		final String appId = APP_ID_MAIL_BOX;
		final String seceretKey = SECRET_KEY_MAIL_BOX;
		String info = "";
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		info = "{\"app-id\":\"" + appId + "\",\"app-sec\":\"" + seceretKey
				+ "\", \"user\":\"" + userSession.getEmailCommunicationID() + "\"}";
		Long random = new Random().nextLong();
		byte[] encodedBytes = Base64.encodeBase64(info.getBytes());
		logger.info("encodedBytes " + new String(encodedBytes));
		String url = prefix+"?info="
				+ new String(encodedBytes) + "&random="
				+ String.valueOf(random);
		HttpClient client = new DefaultHttpClient();
		HttpGet request1 = new HttpGet(url);
		HttpResponse response1 = client.execute(request1);
		
		logger.info("Response Code : "
				+ response1.getStatusLine().getStatusCode());
		BufferedReader rd = new BufferedReader(new InputStreamReader(
				response1.getEntity().getContent()));
		StringBuffer result = new StringBuffer();
		String line = "";
		while ((line = rd.readLine()) != null) {
			result.append(line);
		}
		logger.info(result.toString());
		final JSONObject obj = new JSONObject(result.toString());
		logger.info(obj.getString("result"));
		logger.info(obj.getString("operationmsg"));
		logger.info(obj.getString("returncode"));
		token = obj.getString("result");
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out,token);
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
		logger.info("file:----"+file.available());
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment; filename=\""+fileName+"\"");
        FileCopyUtils.copy(file, response.getOutputStream());
		
	}
	
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Runtime Exception")
	@ExceptionHandler(RuntimeException.class)
	public void exceptionHandling() {
		logger.info("I am in exceptionHandling of WEB");
	}

	public ModelAndView delete(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return new ModelAndView("HelloWorldPage", "msg", "delete() method");

	}

	public ModelAndView update(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return new ModelAndView("HelloWorldPage", "msg", "update() method");

	}

	public ModelAndView list(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return new ModelAndView("HelloWorldPage", "msg", "list() method");

	}
	
	
	public void getTaskAlert(HttpServletRequest request,

			HttpServletResponse response) throws Exception {
		logger.info("In get code value from code type");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_TASK_ALERT+"xyz/1234";
		
		
		Task t=new Task();
		t.setPartyID(userSession.getPartyId());


		BaseResponse<Task> br = new BaseResponse<Task>();
		br = restTemplate.postForObject(url, t, BaseResponse.class);
		List<Task> task = new ArrayList<Task>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			task= br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, task);
	}
	
	
	/**
	 * gets the Document in request Q and related details
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void getAttachmentForRequestQ(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String docId = request.getParameter("docId");
		String partyId = request.getParameter("partyId");
		String reportTypeId = request.getParameter("reportTypeId");
		
		
		
		url = URL_GET_DOCUMENT_REQUESTQ + userSession.getUserName() + "/1234";
		logger.info("url:-" + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("docId", docId);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("reportTypeId", reportTypeId);
		
		logger.info("PPPPPPPPPPPPPPPPPP----reportTypeId---------" + reportTypeId);
		BaseResponse<String> br = new BaseResponse<String>();
		try {
			br = restTemplate.getForEntity(
					FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class)
					.getBody();
		} catch (Exception e) {
			logger.error(e);
		}
		
				PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		
		objectMapper.writeValue(out, br.getResponseObject());// TO Do: here status can
														// be SUCCESS or
														// .EMPTY_RESULT_SET.
														// Accordingly handle
														// this in View.
	}
	
	
	
	@SuppressWarnings("unchecked")
	public void sendGeneratedReports(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String reportIds = request.getParameter("reportIds");
		String sendReportPartyId = request.getParameter("sendReportPartyId");
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		
		logger.info("reportIds IDS----************---"+reportIds);
		logger.info("partyId---************---"+sendReportPartyId);
		int attachment1DocumentID=0;
		int attachment2DocumentID=0;
		int attachment3DocumentID=0;
				
		String delims = "[,]+";
		String[] tokens = reportIds.split(delims);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		for (int i = 0; i < tokens.length; i++){
			logger.info(tokens[i]);
			
			int documentId=Integer.parseInt(tokens[i]);
			
			logger.info("DocumentId===="+documentId);
			if(tokens.length==1){
				attachment1DocumentID=Integer.parseInt(tokens[0]);
				logger.info("1"+attachment1DocumentID);
								
			}else if(tokens.length==2){
				attachment1DocumentID=Integer.parseInt(tokens[0]);
				attachment2DocumentID=Integer.parseInt(tokens[1]);
				logger.info("1---"+attachment1DocumentID);
				logger.info("2---"+attachment2DocumentID);
				
					
			}else{
				attachment1DocumentID=Integer.parseInt(tokens[0]);
				attachment2DocumentID=Integer.parseInt(tokens[1]);
				attachment3DocumentID=Integer.parseInt(tokens[2]);
				logger.info("1--------\n"+attachment1DocumentID+"\n 2---\n"+attachment2DocumentID+"\n 333---\n"+attachment3DocumentID);
					
			}	
			
		}
		
		Notification notification=null;	
		notification=new Notification();
		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(Integer.parseInt(sendReportPartyId));
		notification.setNotifyUserID(userSession.getUserId());
		notification.setAttachment1DocumentID(attachment1DocumentID);
		notification.setAttachment2DocumentID(attachment2DocumentID);
		notification.setAttachment3DocumentID(attachment3DocumentID);
		notification.setNotifyEventID(FiinfraConstants.SEND_GENERATED_REPORT);
		notification.setBuId(buId);		
		notification.setSessionID(request.getSession().getId());
		FrameworkUtil.notify(notification);
//		System.out.println("out---------notify"+out);
		objectMapper.writeValue(out, FiinfraConstants.SUCCESS);
	}
	
	public void getReloadNotesList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
//		int partyId=userSession.getPartyId();
		int partyId; 		
		partyId=Integer.parseInt(request.getParameter("partyId"));
		int buId=userSession.getBuId();		
	
		System.out.println("party---Rolod Notes"+partyId);
		url=URL_GET_NOTE_LIST + userSession.getUserName() + "/1234";
		logger.info("URL------------>"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//uriCB.queryParam("buId",buId);
		uriCB.queryParam("partyId",partyId);
		uriCB.queryParam("buId",buId);		
		
		BaseResponse<NotesData> br = new BaseResponse<NotesData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<NotesData> notesData=new ArrayList<>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			notesData=br.getResponseListObject();			
		}
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, notesData);
	}

	public void getReloadDocumentsList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
//		int partyId=userSession.getPartyId();
		int partyId; 		
		partyId=Integer.parseInt(request.getParameter("partyId"));
		int buId=userSession.getBuId();		
	
		System.out.println("party---getReloadDocumentsList "+partyId);
		url=URL_GET_DOCUMENT_LIST + userSession.getUserName() + "/1234";
		logger.info("URL------------>"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//uriCB.queryParam("buId",buId);
		uriCB.queryParam("partyId",partyId);
		uriCB.queryParam("buId",buId);		
		
		BaseResponse<DocumentData> br = new BaseResponse<DocumentData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<DocumentData> documentDatas=new ArrayList<>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			documentDatas=br.getResponseListObject();			
		}
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, documentDatas);
	}

	
	
	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
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

	public RestTemplate getRestTemplate() {
		return restTemplate;
	}
	
}
