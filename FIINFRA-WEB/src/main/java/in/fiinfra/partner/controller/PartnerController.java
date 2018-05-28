package in.fiinfra.partner.controller;

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.ChartData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.PartyEmailCommunicationData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.diy.models.ConfigurationProductsList;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.PartySetting;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.AutoPlanData;
import in.fiinfra.common.partner.BusinessValuationData;
import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.partner.LocationData;
import in.fiinfra.common.partner.NotificationDetails;
import in.fiinfra.common.partner.PerformanceMatrixData;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.RoleAccess;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.MD5Encryption;
import in.fiinfra.common.util.RandomPasswordGenerator;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class PartnerController extends MultiActionController {

	private  RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	private String sectionName;
	private static final Logger logger = Logger
			.getLogger(PartnerController.class);
	final String SOURCE_MODEULE = "Partner Profile";
	String url;
	@Value("${URL_GET_HEIRARCHY_DATA}")
	private String URL_GET_HEIRARCHY_DATA;
	@Value("${URL_GET_HEIRARCHY_DATA_VP}")
	private String URL_GET_HEIRARCHY_DATA_VP;	
	@Value("${URL_INSERT_PARTNER_LOCATION}")
	private String URL_INSERT_PARTNER_LOCATION;
	@Value("${URL_DELETE_PARTNER_LOCATION}")
	private String URL_DELETE_PARTNER_LOCATION;	
	@Value("${URL_GET_PARTNER_PROFILE_RECORD}")
	private String URL_GET_PARTNER_PROFILE_RECORD;
	@Value("${URL_UPDATE_PARTNER_PROFILE}")
	private String URL_UPDATE_PARTNER_PROFILE;
	@Value("${URL_GET_ChartData_List}")
	private String URL_GET_ChartData_List;
	@Value("${URL_UPDATE_CONVERT_CONTACT}")
	private String URL_UPDATE_CONVERT_CONTACT;
	@Value("${URL_GET_NOTIFICATION_List_PARTNER}")
	private String URL_GET_NOTIFICATION_List_PARTNER;
	@Value("${URL_ACTIVATE_SUBSCRIPTION}")
	private String URL_ACTIVATE_SUBSCRIPTION;
	@Value("${SAVE_USER_ACCESS_LOG}") 
	private  String SAVE_USER_ACCESS_LOG;
	@Value("${PHOTO_BASE_PATH}") 
	private  String PHOTO_BASE_PATH;
	@Value("${LOGO_BASE_PATH}") 
	private  String LOGO_BASE_PATH;
	@Value("${URL_SAVE_BUSINESS_VALUATION}") 
	private  String URL_SAVE_BUSINESS_VALUATION;
	@Value("${URL_GET_BUSINESS_VALUATION_RECORD}")
	private  String URL_GET_BUSINESS_VALUATION_RECORD;
	@Value("${URL_GET_CLIENT_AUTOPLAN_DETAILS}") 
	private  String URL_GET_CLIENT_AUTOPLAN_DETAILS;
	@Value("${URL_UPDATE_CLIENT_AUTOPLAN_DETAILS}") 
	private  String URL_UPDATE_CLIENT_AUTOPLAN_DETAILS;
	@Value("${URL_SAVE_QUICK_DC}") 
	private  String URL_SAVE_QUICK_DC;
	@Value("${URL_GET_FAMILYMEMBER_LIST}")
	private String URL_GET_FAMILYMEMBER_LIST;
	@Value("${URL_GET_PERFORMANCE_METRIX_DATA}") 
	private  String URL_GET_PERFORMANCE_METRIX_DATA;
	@Value("${URL_UPDATE_PARTNER_AUTO_PLAN_CONFIGURATION}") 
	private  String URL_UPDATE_PARTNER_AUTO_PLAN_CONFIGURATION;
	@Value("${URL_GET_PARTNER_LIST}") 
	private  String URL_GET_PARTNER_LIST;
	@Value("${URL_ADD_PARTNER}") 
	private  String URL_ADD_PARTNER;
	@Value("${URL_GET_PARTNER_DETAILS}") 
	private  String URL_GET_PARTNER_DETAILS;
	@Value("${URL_DELETE_PARTNER_DETAILS}") 
	private  String URL_DELETE_PARTNER_DETAILS;
	@Value("${URL_DELETE_LOGO_PHOTO}") 
	private  String URL_DELETE_LOGO_PHOTO;
	@Value("${SAVE_PARTY_ATTRIBUTE}")
	private String SAVE_PARTY_ATTRIBUTE;	
	@Value("${GET_PARTY_ATTRIBUTE}")
	private String GET_PARTY_ATTRIBUTE;
	@Value("${URL_UPDATE_CURRENT_NODEID_FORPARTYID}") 
	private  String URL_UPDATE_CURRENT_NODEID_FORPARTYID;
	@Value("${SAVE_RTA_FILE_PASSWORDS}") 
	private  String SAVE_RTA_FILE_PASSWORDS;	
	@Value("${GET_EMAIL_COMM_DETAILS}") 
	private  String GET_EMAIL_COMM_DETAILS;
	@Value("${MOVE_CONTACTS_TO_OTHER_PARTNER}") 
	private  String MOVE_CONTACTS_TO_OTHER_PARTNER;
	
	@Value("${URL_ALL_ROLE_ACCESS_LIST}")
	private String URL_ALL_ROLE_ACCESS_LIST;
	@Value("${URL_UPDATE_ROLE_ACCESS_LIST}")
	private String URL_UPDATE_ROLE_ACCESS_LIST;
	

	@Value("${URL_GET_OL_TRANSACTION_CONFIGURATION}")
	private String URL_GET_OL_TRANSACTION_CONFIGURATION;
	@Value("${GET_RTA_FILE_PASSWORDS}") 
	private String GET_RTA_FILE_PASSWORDS;
	
	private static Integer logoHeight;
	private static Integer logoWidth;
	@Autowired
	Md5PasswordEncoder passwordEncoder;

	@SuppressWarnings("unchecked")
	public void getPartnerProfileDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_PARTNER_PROFILE_RECORD + userSession.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<ProfileData> br = new BaseResponse<ProfileData>();
		logger.info("-----------Before Calling APP In Web(getPartnerProfileDetails)-----------");
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		logger.info("-----------After Calling APP In Web(getPartnerProfileDetails)-----------");
		ProfileData profileData = new ProfileData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			profileData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					ProfileData.class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, profileData);
	}

	
	public void getHeirarchyData(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			int buId=userSession.getBuId();
			int partyId=userSession.getPartyId();
			
			url=URL_GET_HEIRARCHY_DATA + userSession.getUserName() + "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("buId", buId);
			
			logger.info("URL .............");
			
			BaseResponse<HeirarchyData> br = new BaseResponse<HeirarchyData>();
			br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
			HeirarchyData heirarchyDatas=new HeirarchyData();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				heirarchyDatas=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), HeirarchyData.class);			
			}
			logger.info("heirarchyDatas Data----------"+heirarchyDatas);

			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, heirarchyDatas);		
	}
	
	
	public void getHeirarchyDataForVP(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");		
			int partyId=userSession.getPartyId();
			int currentNodeId=13;
			int level=4;
			url=URL_GET_HEIRARCHY_DATA_VP + userSession.getUserName() + "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("currentNodeId", currentNodeId);
			uriCB.queryParam("level", level);
			
			
			logger.info("URL .............");
			
			BaseResponse<HeirarchyData> br = new BaseResponse<HeirarchyData>();
			br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
			HeirarchyData heirarchyDatas=new HeirarchyData();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				heirarchyDatas=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), HeirarchyData.class);			
			}
			logger.info("heirarchyDatas Data----------"+heirarchyDatas);

			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, heirarchyDatas);		
	}
	
	
	@SuppressWarnings("unchecked")
	public void showPieChart(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_ChartData_List + userSession.getUserName()
				+ "/1234";
		logger.info("URL ---------------------> " + url);
		int buId = userSession.getBuId();
//		int partyId = userSession.getPartyId();
		int partyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		sectionName = request.getParameter("type");
		if(sectionName.equals("RecAllocationAssetclass") || sectionName.equals("RecAllocationProducttype") || sectionName.equals("RecAllocationCategory")
				||sectionName.equals("CurrentAllocationAsset")||sectionName.equals("CurrentAllocationProduct")
				||sectionName.equals("CurrentAllocationCategory"))
		{
			
			partyId = Integer.parseInt(request.getParameter("goalid"));
		}
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("chartType", sectionName);
		uriCB.queryParam("nodeId", nodeId);
		
		BaseResponse<ChartData> br = new BaseResponse<ChartData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<ChartData> chartData = new ArrayList<ChartData>();
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			chartData = br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, chartData);
	}
	
	
	@SuppressWarnings("unchecked")
	public void savePartnerProfileData(HttpServletRequest request,
			HttpServletResponse response, ProfileData profileData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_PARTNER_PROFILE + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		logger.info("XML========"+profileData.getHeirarchyXML());
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int lastModifiedBy = userSession.getUserId();
		profileData.setPartyId(partyId);
		profileData.setBuId(buId);
		profileData.setSectionName(sectionName);
		profileData.setLastModifiedBy(lastModifiedBy);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, profileData, BaseResponse.class);
		int recordCount = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		
		String eventTextXML="usp_cp_savePartnerProfileDetails("+partyId+","+sectionName+","+FiinfraUtility.getProfileDataXML(profileData, sectionName)+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.PARTNER_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, recordCount);
	}

	@SuppressWarnings("unchecked")
	public void savePartnerProfileAddressData(HttpServletRequest request,
			HttpServletResponse response, AddressData addressData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_PARTNER_PROFILE + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int lastModifiedBy = userSession.getUserId();
		ProfileData profileData = new ProfileData();
		profileData.setPartyId(partyId);
		profileData.setBuId(buId);
		profileData.setSectionName(sectionName);
		profileData.setLastModifiedBy(lastModifiedBy);
		List<AddressData> addressDatas = new ArrayList<>();
		addressDatas.add(addressData);
		profileData.setAddressDataList(addressDatas);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, profileData, BaseResponse.class);
		int recordCount = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		
		String eventTextXML="usp_cp_savePartnerProfileDetails("+partyId+","+sectionName+","+FiinfraUtility.getProfileDataXML(profileData, sectionName)+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.PARTNER_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, recordCount);
	}
	
	@SuppressWarnings("unchecked")
	public void savePartnerLocationData(HttpServletRequest request,
			HttpServletResponse response, LocationData locationData)
			throws Exception {
	
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_INSERT_PARTNER_LOCATION + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int userId = userSession.getUserId();
		int lastModifiedBy = userSession.getUserId();
		String locationName=request.getParameter("nodeLocation");
		String locationDescription=request.getParameter("nodeDescription");
		
		locationData.setLocationName(locationName);
		locationData.setLocationDescription(locationDescription);
		locationData.setPartyId(partyId);
		locationData.setCreatedBy(userId);
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, locationData, BaseResponse.class);
		int recordCount = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		
		String eventTextXML="usp_cp_saveLocation("+locationData.getLocationId()+","+locationName+","+locationDescription+","+partyId+","+locationData.getCreatedBy()+","+locationData.getParentNodeId()+","+locationData.getLevel()+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.PARTNER_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		
		 if(userSession.getHeadOfNode()==true){
				 partyId=userSession.getPartyId();
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
		objectMapper.writeValue(out, recordCount);
	}

	
	@SuppressWarnings("unchecked")
	public void deletePartnerLocationData(HttpServletRequest request,
			HttpServletResponse response, LocationData locationData)
			throws Exception {
	
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_DELETE_PARTNER_LOCATION + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int userId = userSession.getUserId();
		int lastModifiedBy = userSession.getUserId();
		String locationId=request.getParameter("locationId");
			
		
		locationData.setLocationName(locationId);
		locationData.setPartyId(partyId);
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, locationData, BaseResponse.class);
		int recordCount = 0;
		List<Integer> resultList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList=br.getResponseListObject();
//			recordCount = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()),Integer.class);
			recordCount=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)), Integer.class);	
			int isChildNodeExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)),Integer.class);
		
			logger.info("In Web Record Count location Deleted----"+recordCount+"----@isChildNodeExist----"+isChildNodeExist);
		
		String eventTextXML="usp_cp_deleteLocation("+locationData.getLocationId()+")";
		logger.info("eventTextXML========="+eventTextXML);
				
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.PARTNER_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, resultList);
	}
	
	
	@SuppressWarnings({ "unchecked", "unused" })
	public void savePartnerProfilePhoto(HttpServletRequest request,
			HttpServletResponse response, ProfileData profileData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_PARTNER_PROFILE + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		String result = FiinfraConstants.SUCCESS;
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int lastModifiedBy = userSession.getUserId();
		long currentTime = new Date().getTime();
		int recordCount = 0;
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		DocumentData documentData = new DocumentData();
		MultipartFile[] m = { profileData.getImage() };
		if (profileData.getImage() != null)
			documentDatas = getDocumentDatasForPng(
					m, currentTime, lastModifiedBy);
		if (documentDatas == null) {
			result = "Attachment size greater than "
					+ FiinfraConstants.MAX_FILE_SIZE + " kb is not allowed.";
		} else {

			if (documentDatas.size() > 0)
				documentData = documentDatas.get(0);
			profileData.setPartyId(partyId);
			profileData.setBuId(buId);
			profileData.setSectionName(sectionName);
			profileData.setLastModifiedBy(lastModifiedBy);
			profileData.setDocumentData(documentData);
			if (documentDatas.size() > 0)
				profileData.setAttachment(true);
			profileData.setAttachmentCount(documentDatas.size());
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.postForObject(url, profileData,
					BaseResponse.class);
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				recordCount = objectMapper
						.readValue(objectMapper.writeValueAsString(br
								.getResponseObject()), Integer.class);
		}
		String basePath = "";
		if (sectionName.equals(FiinfraConstants.PROFILE_PERSONAL_INFO_1))
			basePath = PHOTO_BASE_PATH + partyId;
		else
			basePath = LOGO_BASE_PATH + partyId;
		if (documentDatas.size() > 0) {
			File baseFolder = new File(basePath);
			if (baseFolder.exists()) {
				//FileUtils.deleteDirectory(baseFolder);
			}
			if (sectionName.equals(FiinfraConstants.PROFILE_PERSONAL_INFO_1)) {
				result = uploadAttachmentsFixedSize(m, basePath, currentTime);
			} else {
				result = uploadLogoFixedSize(m, basePath, currentTime);
				saveLogoDimantions(userSession.getPartyId(), userSession.getBuId(),userSession.getUserName(),userSession.getUserId());
				((UserSession) request.getSession().getAttribute("userSession")).setLogoHeight(logoHeight);
				((UserSession) request.getSession().getAttribute("userSession")).setLogoWidth(logoWidth);				
			}
			for (MultipartFile f : m) {
				if (f.getOriginalFilename() != null
						&& !f.getOriginalFilename().equals("")) {
					String fileName = null;
					String extension = null;
					fileName = f.getOriginalFilename().substring(0,
							f.getOriginalFilename().lastIndexOf("."));
					extension = ".png";
					logger.info("File name is :--" + fileName);
					logger.info("extension is:--" + extension);
					logger.info("filename to set:---" + fileName + "_"
							+ currentTime + extension);
					fileName = fileName + "_" + currentTime + extension;
					if (sectionName.equals(FiinfraConstants.PROFILE_PERSONAL_INFO_1)){
						String filePath = "/user-images/" + partyId+ "\\" + fileName.replace(" ","");
						userSession.setPhoto(filePath);
					}
					else{
						String filePath = "/logo-images/" + partyId+"\\" + fileName.replace(" ","");
						
						userSession.setLogo(filePath);
					}
					request.setAttribute("userSession", userSession);
				}
			}
		}
		List<String> responseList = new ArrayList<>();
		responseList.add(result);
		if (result.equals(FiinfraConstants.SUCCESS)) {
			if (documentDatas.size() > 0) {
				if (sectionName
						.equals(FiinfraConstants.PROFILE_PERSONAL_INFO_1))
					responseList.add("/user-images/" + partyId + "/"
							+ documentData.getFileName());
				else
					responseList.add("/logo-images/" + partyId + "/"
							+ documentData.getFileName());
			}
		}
		
		String eventTextXML="usp_cp_savePartnerProfileDetails("+partyId+","+sectionName+","+FiinfraUtility.getProfileDataXML(profileData, sectionName)+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.PARTNER_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		if(sectionName.equals("EmailOtherDetails")){
			userSession.setThemeName(request.getParameter("themeName"));
			userSession.setThemeId(Integer.parseInt(request.getParameter("theme")));
		}
		objectMapper.writeValue(out, responseList);
	}

	@SuppressWarnings("unchecked")
	public void savePartnerProfileFinancialProducts(HttpServletRequest request,
			HttpServletResponse response, ProfileData profileData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_PARTNER_PROFILE + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int lastModifiedBy = userSession.getUserId();
		profileData.setPartyId(partyId);
		profileData.setBuId(buId);
		profileData.setSectionName(sectionName);
		profileData.setLastModifiedBy(lastModifiedBy);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, profileData, BaseResponse.class);
		int recordCount = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		
		String eventTextXML="usp_cp_savePartnerProfileDetails("+partyId+","+sectionName+","+FiinfraUtility.getProfileDataXML(profileData, sectionName)+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
				
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.PARTNER_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, recordCount);
	}
	
	@SuppressWarnings("unchecked")
	public void saveAutoPlanConfiguration(HttpServletRequest request,
			HttpServletResponse response, ProfileData profileData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		Integer isAutoPlanEnabled=Integer.parseInt(request.getParameter("isAutoPlanEnabled"));
		logger.info("isAutoPlanEnabled:------"+isAutoPlanEnabled);
		url = URL_UPDATE_PARTNER_AUTO_PLAN_CONFIGURATION + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int partyId = userSession.getPartyId();
		int lastModifiedBy = userSession.getUserId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("isAutoPlanEnabled", isAutoPlanEnabled);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("lastModifiedBy", lastModifiedBy);
		
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		int recordCount = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		
		String eventTextXML="usp_pp_updatePartnerAutoPlanConfiguration("+partyId+","+lastModifiedBy+","+isAutoPlanEnabled+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.PARTNER_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, recordCount);
	}
	
	
	
	
	@SuppressWarnings("unchecked")
	public void convertContact(HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_CONVERT_CONTACT + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int lastModifiedBy = userSession.getUserId();
		int partyId=userSession.getPartyId();
		int recordCount=0;
		int contactPartyId=Integer.parseInt(request.getParameter("partyId"));
		int convertToContactType=Integer.parseInt(request.getParameter("convertToContactType"));
		String convertNote=request.getParameter("convertNote");
		sectionName=request.getParameter("sectionName");
		UserData userData=new UserData();
		userData.setCreatedBy(lastModifiedBy);
		userData.setBuID(buId);
		String userDataXML="<Root>";
		int noOfCAPSAlpha = 1;
		int noOfDigits = 1;
		int noOfSplChars = 1;
		int minLen = 8;
		int maxLen = 15;
//		Map<Integer,String> passwordMap=new HashMap<>();
		String hexString = null;
		char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
				noOfCAPSAlpha, noOfDigits, noOfSplChars);
		hexString = new String(pswd);
		logger.info("hexString is-----" + hexString);
		MD5Encryption md5Encryption = new MD5Encryption();
		//String encryptrdPassword = md5Encryption.encrypt(hexString);
		String encryptrdPassword = passwordEncoder.encodePassword(hexString, null);
		userDataXML+="<User>";
		userDataXML+="<userPassword>"+encryptrdPassword+"</userPassword>";
		userDataXML+="<partyid>"+contactPartyId+"</partyid>";
		userDataXML+="<ConvertToContactType>"+convertToContactType+"</ConvertToContactType>";
		userDataXML+="<ConvertNote>"+convertNote+"</ConvertNote>";
		userDataXML+="</User>";
//		passwordMap.put(Integer.valueOf(partyId), hexString);
		userDataXML+="</Root>";
		userData.setUserDataXML(userDataXML);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, userData, BaseResponse.class);
		List<Integer> resultList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList = br.getResponseListObject();
			int isExistUser=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)),Integer.class);
		
		String eventTextXML="usp_pp_convertContact("+userDataXML+","+userData.getCreatedBy()+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(userSession.getPartyId());
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.CONVERT_CONTACT);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(sectionName);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		Map<String,String> payloadMap=new HashMap<String, String>();
		payloadMap.put("ConvertDatetime",new Date().toString());
		payloadMap.put("ConvertUser",userSession.getName());
		payloadMap.put("ConvertNote",convertNote);
		Notification notification=null;
		if(sectionName.equals("Opportunity")){
			notification=new Notification();
			notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
			notification.setNotifyPartyID(contactPartyId);
			notification.setNotifyEventID(FiinfraConstants.OPPORTUNITY_CONVERSION_TO_CLIENT);
//			notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
			notification.setBuId(buId);
			notification.setPayloadMap(payloadMap);
			notification.setSessionID(request.getSession().getId());
			FrameworkUtil.notify(notification);
		}else{
			notification=new Notification();
			notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
			notification.setNotifyPartyID(contactPartyId);
			notification.setNotifyEventID(FiinfraConstants.CLIENT_CONVERSION_TO_PREMIUM_CLIENT);
//			notification.setDeliveryChannelID(FiinfraConstants.EMAIL);agg
			notification.setBuId(buId);
			notification.setPayloadMap(payloadMap);
			notification.setSessionID(request.getSession().getId());
			FrameworkUtil.notify(notification);
		}
		logger.info("result of 0-------"+resultList.get(0));
		logger.info("result of 1*******"+resultList.get(1));
		if(isExistUser!=1){
			payloadMap=new HashMap<String, String>();
			payloadMap.put("Password",hexString);
			notification=new Notification();
			notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
			notification.setNotifyPartyID(contactPartyId);
			notification.setNotifyEventID(FiinfraConstants.DC_ACTIVATION);
//			notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
			notification.setBuId(buId);
			notification.setPayloadMap(payloadMap);
			notification.setSessionID(request.getSession().getId());
			FrameworkUtil.notify(notification);
		}
		objectMapper.writeValue(out, resultList);
	}
	
	public void sendDCReminder(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int contactPartyId=Integer.parseInt(request.getParameter("partyId"));
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Notification notification=null;
		notification=new Notification();
		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(contactPartyId);
		notification.setNotifyEventID(FiinfraConstants.DC_REMINDER);
		notification.setBuId(buId);
		notification.setSessionID(request.getSession().getId());
		FrameworkUtil.notify(notification);
		objectMapper.writeValue(out, FiinfraConstants.SUCCESS);
	}
	
	public void getNotificationListForPartner(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_NOTIFICATION_List_PARTNER + userSession.getUserName()
				+ "/1234";
		logger.info("URL ---------------------> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		sectionName = request.getParameter("type");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<NotificationDetails> br = new BaseResponse<NotificationDetails>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<NotificationDetails> notificationDetailsList = new ArrayList<NotificationDetails>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			notificationDetailsList = br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, notificationDetailsList);
	}
	
	public String agree(HttpServletRequest request,HttpServletResponse response){
		try{
			String baseUrl = "";
			Integer userid=0;
			String password="";
			String ipaddress="";
			String sessionId="";
			String username="";
			UserSession userSession =  (UserSession) request.getSession().getAttribute("userSession");
			if(userSession != null)
			{
				userid = userSession.getUserId();
				username = userSession.getUserName();
//				password = request.getSession().getAttribute("password").toString();
//				password = new MD5Encryption().encrypt(password);
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
			logger.info("SAVE_USER_ACCESS_LOG:-----"+SAVE_USER_ACCESS_LOG);
			saveUserAccessLog(userid, password, portalURL, sessionId, ipaddress, username);
			activateSubscription(userSession, request, response);
			userSession.setSuccessfulLoginCount(1);
			request.getSession().setAttribute("userSession", userSession);
		}catch(Exception e){
			logger.error(e);
		}
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int lastModifiedBy = userSession.getUserId();
		int partyId=userSession.getPartyId();
		int buId = userSession.getBuId();
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.WELCOME_KIT_ACCEPTED);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(FiinfraConstants.SETUP_WIZARD_MODULE);
		audit.setSourceScreen(FiinfraConstants.SETUP_WIZARD_MODULE);
		FrameworkUtil.audit(audit);
		Timestamp t = new Timestamp(new java.util.Date().getTime());
		SimpleDateFormat sdf = new SimpleDateFormat(
				"dd/MM/yyyy HH:mm:ss");
		String strDate = sdf.format(t.getTime());
		Map<String,String> payloadMap=new HashMap<String, String>();
		payloadMap.put("logindatetime", strDate);
		Notification notification=null;
		notification=new Notification();
		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(partyId);
		notification.setPayloadMap(payloadMap);
		notification.setNotifyEventID(FiinfraConstants.WELCOME_KIT_ACCEPTED_NOTIFICATION);
//			notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
		notification.setBuId(buId);
		notification.setSessionID(request.getSession().getId());
		FrameworkUtil.notify(notification);
		
		return "redirect:/common/redirect.htm";
	}
	
	/*Activate Subscription on Partner's First Login*/
	private void activateSubscription(UserSession userSession,HttpServletRequest request,HttpServletResponse response) throws Exception{
		try{
		url = URL_ACTIVATE_SUBSCRIPTION + userSession.getUserName()
				+ "/1234";
		logger.info("URL ---------------------> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int userId = userSession.getUserId();
		
		sectionName = request.getParameter("type");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("userId", userId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		
		}catch(Exception ex){
			LogFactory.getLog(getClass()).error("Error while activating Subscription", ex);
		}
		/*Integer notificationDetailsList ;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			notificationDetailsList = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");*/
		
	}
	
	public String disagree(HttpServletRequest request,HttpServletResponse response){
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int lastModifiedBy = userSession.getUserId();
		int partyId=userSession.getPartyId();
		int buId = userSession.getBuId();
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.WELCOME_KIT_REJECTED);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(FiinfraConstants.SETUP_WIZARD_MODULE);
		audit.setSourceScreen(FiinfraConstants.SETUP_WIZARD_MODULE);
		FrameworkUtil.audit(audit);
		
		Notification notification=null;
		notification=new Notification();
		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(partyId);
		notification.setNotifyEventID(FiinfraConstants.WELCOME_KIT_REJECTED_NOTIFICATION);
//			notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
		notification.setBuId(buId);
		notification.setSessionID(request.getSession().getId());
		FrameworkUtil.notify(notification);
		
		return "redirect:/common/logout.htm";
	}
	
	
	
	public  void saveUserAccessLog(Integer userId,String password,String url,String sessionId,String ipAddress,String username)
	{
		String token = "23d";
		UserAccessLog accessLog = new UserAccessLog();
		accessLog.setUserId(userId);
		accessLog.setLoginAccessModeId(FiinfraConstants.LOGIN_ACCESS_MODE_TERMS_ACCEPTED);
		accessLog.setEnteredPassword(password);
		accessLog.setLoginSuccessful(1);
		accessLog.setRedirectUrl(url);
		accessLog.setSessionId(sessionId);
		accessLog.setSourceIPAddress(ipAddress);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_USER_ACCESS_LOG+ username+"/" + token);
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), accessLog, BaseResponse.class);
	}
	
	@SuppressWarnings("unchecked")
	public void saveBusinessValuationData(HttpServletRequest request,
			HttpServletResponse response, BusinessValuationData businessValuationData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_SAVE_BUSINESS_VALUATION + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int createddBy = userSession.getUserId();
		businessValuationData.setPartyId(partyId);
		businessValuationData.setCreatedBy(createddBy);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, businessValuationData, BaseResponse.class);
		int recordCount = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		/*Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(createddBy);
		audit.setEventID(FiinfraConstants.PARTNER_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		FrameworkUtil.audit(audit);*/
		objectMapper.writeValue(out, recordCount);
	}
	
	@SuppressWarnings("unchecked")
	public void getBusinessValuationDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_BUSINESS_VALUATION_RECORD + userSession.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<BusinessValuationData> br = new BaseResponse<BusinessValuationData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		BusinessValuationData businessValuationData = new BusinessValuationData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			businessValuationData  = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					BusinessValuationData .class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, businessValuationData);
	}
	
	@SuppressWarnings("unchecked")
	public void getClientAutoPlanDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_CLIENT_AUTOPLAN_DETAILS + userSession.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<AutoPlanData> br = new BaseResponse<>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		AutoPlanData autoPlanData = new AutoPlanData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			autoPlanData  = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					AutoPlanData .class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, autoPlanData);
	}
	@SuppressWarnings("unchecked")
	public void saveClientAutoPlanDetails(HttpServletRequest request,
			HttpServletResponse response, AutoPlanData autoPlanData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_CLIENT_AUTOPLAN_DETAILS + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int lastModifiedBy = userSession.getUserId();
//		autoPlanData.setPartyId(120364);
		autoPlanData.setLastModifiedBy(lastModifiedBy);
//		autoPlanData.setDataXML("<Root><FirstName>Nik1</FirstName><LastName>Auto Plan Nik1</LastName><DOB>02/09/1986</DOB><EmailId>nik@nik.com</EmailId><Income>1234567</Income><Expense>98765</Expense><RetirementAge>34</RetirementAge><EmergencyMonth>20</EmergencyMonth><RiskProfileId>40001</RiskProfileId></Root>");
//		autoPlanData.setGoalXML("<Root><Goal><GoalDescription><![CDATA[Buy Car1]]></GoalDescription><GoalEndYear><![CDATA[2016]]></GoalEndYear><GoalAmountPv><![CDATA[350000]]></GoalAmountPv><GoalTypeId><![CDATA[35006]]></GoalTypeId><GoalFamilyPartyID>120364</GoalFamilyPartyID><GoalStartYear>2016</GoalStartYear><IsLoan>0</IsLoan><LoanAmount>0</LoanAmount><LoanDownPayment>0</LoanDownPayment><LoanInterestPercentage>0</LoanInterestPercentage><LoanDurationYears>0</LoanDurationYears><GoalName><![CDATA[Buy Car1]]></GoalName></Goal></Root>");
//		autoPlanData.setFamilyMemberDataXML("<Root><FamilyMember><RelationshipId>26001</RelationshipId><Name>Family one2</Name><Age>20</Age><PartyId>120366</PartyId></FamilyMember><FamilyMember><RelationshipId>26002</RelationshipId><Name>Family two1</Name><Age>2</Age><PartyId></PartyId></FamilyMember></Root>");
//		autoPlanData.setPartyAttributeDataXML("<Root><Data><AttributeCodeId>94145</AttributeCodeId><AttributeValue>94029</AttributeValue><AttributeReferenceValue>300</AttributeReferenceValue></Data><Data><AttributeCodeId>94145</AttributeCodeId><AttributeValue>94032</AttributeValue><AttributeReferenceValue>7000</AttributeReferenceValue></Data><Data><AttributeCodeId>94018</AttributeCodeId><AttributeValue>350000</AttributeValue><AttributeReferenceValue>35000</AttributeReferenceValue></Data></Root>");
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, autoPlanData, BaseResponse.class);
		int recordCount = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		/*Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(createddBy);
		audit.setEventID(FiinfraConstants.PARTNER_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		FrameworkUtil.audit(audit);*/
		objectMapper.writeValue(out, recordCount);
	}
	
	@SuppressWarnings("unchecked")
	public void getQuickDcDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_CLIENT_AUTOPLAN_DETAILS + userSession.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<AutoPlanData> br = new BaseResponse<>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		AutoPlanData autoPlanData = new AutoPlanData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			autoPlanData  = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					AutoPlanData .class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, autoPlanData);
	}
	
	@SuppressWarnings("unchecked")
	public void saveQuickDcDetails(HttpServletRequest request,
			HttpServletResponse response, AutoPlanData autoPlanData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_SAVE_QUICK_DC + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = Integer.parseInt(request.getParameter("clientPartyId"));
		int lastModifiedBy = userSession.getUserId();
		autoPlanData.setPartyId(partyId);
		autoPlanData.setLastModifiedBy(lastModifiedBy);
		autoPlanData.setDataXML(request.getParameter("dataXML"));
		autoPlanData.setGoalXML(request.getParameter("goalXML"));
		autoPlanData.setPartyAttributeDataXML(request.getParameter("partyAttributeDataXML"));
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, autoPlanData, BaseResponse.class);
		int recordCount = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);
	}
	
	public void getFamilyMemberList(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		logger.info("URL --> " + url);
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_FAMILYMEMBER_LIST+userSession.getName()+"/1234";
		logger.info("in getFamilyMemberList");
		
		int partyId=Integer.parseInt(request.getParameter("partyId"));

		
		int buId=FiinfraConstants.AXISMFBUID;

		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		
		BaseResponse<UserData> br = new BaseResponse<UserData>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<UserData> userDatas=new ArrayList<>();
		
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			userDatas=br.getResponseListObject();
		logger.info("questionDatas========"+userDatas);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, userDatas);
	}
	
	@SuppressWarnings("unchecked")
	public void getPerformanceMatrixData(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_PERFORMANCE_METRIX_DATA + userSession.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		int dataTagId = Integer.parseInt(request.getParameter("dataTagId"));
		int benchMark = Integer.parseInt(request.getParameter("benchMark"));
		int banchMarkCategory = Integer.parseInt(request.getParameter("banchMarkCategory"));
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("dataTagId", dataTagId);
		uriCB.queryParam("benchMark", benchMark);
		uriCB.queryParam("banchMarkCategory", banchMarkCategory);
		
		BaseResponse<PerformanceMatrixData> br = new BaseResponse<>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<PerformanceMatrixData> performanceMatrixDatas = new ArrayList< PerformanceMatrixData>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			performanceMatrixDatas = br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out,performanceMatrixDatas);
	}
	
	List<DocumentData> getDocumentDatasForPng(MultipartFile[] m,long currentTime,int lastModifiedBy){
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		if(m!=null){
		for (MultipartFile f : m) {
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
				d.setCreatedBy(lastModifiedBy);
				fileName = f.getOriginalFilename().substring(0,
						f.getOriginalFilename().lastIndexOf("."));
				extension = ".png";
				logger.info("File name is :--" + fileName);
				logger.info("extension is:--" + extension);
				logger.info("filename to set:---" + fileName + "_"
						+ currentTime + extension);
				d.setFileName(fileName.replace(" ","") + "_" + currentTime + extension);
				d.setFileSize((int) f.getSize());
				d.setFileTypeId(11006);
				documentDatas.add(d);
				if(f.getSize()>FiinfraConstants.MAX_FILE_SIZE){
					documentDatas=null;
					break;
				}
			}
		}
		}
		return documentDatas;
	
	}
	
	public static String uploadLogoFixedSize(MultipartFile[] m,String basePath,long currentTime) throws IOException{
		String result="success";
		File baseFolder = new File(basePath);
		for (MultipartFile f : m) {
			if (f.getOriginalFilename() != null
					&& !f.getOriginalFilename().equals("")) {
				
				
				
				String fileName = null;
				String extension = null;
				fileName = f.getOriginalFilename().substring(0,
						f.getOriginalFilename().lastIndexOf("."));
				extension = ".png";
				logger.info("File name is :--" + fileName);
				logger.info("extension is:--" + extension);
				logger.info("filename to set:---" + fileName + "_"
						+ currentTime + extension);
				fileName = fileName.replace(" ","") + "_" + currentTime + extension;
				String filePath = basePath + "\\" + fileName;
				logger.info("filePath:-------"+filePath);
//				File fileToUpload = new File(filePath);
				if (baseFolder.exists()) {

//					FileUtils.deleteDirectory(baseFolder);
//					baseFolder = new File(basePath);
//					baseFolder.mkdirs();
				} else {
					baseFolder.mkdirs();// creates directory
				}
				File file = new File(filePath);
//				try{
//					BufferedImage image = ImageIO.read(f.getInputStream());
//					if(image ==null){
//						return null;
//					}
//					int type = image.getType() == 0? BufferedImage.TYPE_INT_ARGB : image.getType();
//					
//					BufferedImage resizedImage = new BufferedImage(150, 150, type);
//					Graphics2D g = resizedImage.createGraphics();
//					g.drawImage(image	, 0, 0, 150, 150, null);
//					g.dispose();
//					ImageIO.write(resizedImage, "png", file);
////					multiPartFile.transferTo(file);
//					
//				}catch(Exception ex){
//					return null;
//				}
				
				try{
					BufferedImage image = ImageIO.read(f.getInputStream());
					if(image ==null){
						return null;
					}
					int type = image.getType() == 0? BufferedImage.TYPE_INT_ARGB : image.getType();
					
					double orignalHeight =  image.getHeight();
					double orignalWidth =  image.getWidth();
					
					
					double ratio = Math.min( 150 / orignalWidth, 50/ orignalHeight );
					
					int newWidth = (int) (orignalWidth* ratio);    
					int newHeight = (int) (orignalHeight * ratio);
					
					logoHeight = newHeight;
					logoWidth = newWidth;
					/*BufferedImage resizedImage = new BufferedImage(newWidth, newHeight, type);
					Graphics2D g = resizedImage.createGraphics();
					g.drawImage(image	, 0, 0, newWidth, newHeight, null);
					g.dispose();*/
					ImageIO.write(image, "png", file);
//					multiPartFile.transferTo(file);
					
				}catch(Exception ex){
					LogFactory.getLog(FiinfraUtility.class).error("Fail to Save Image", ex);
					return null;
				}
			}
		}
		return result;
	}
	
	public static String uploadAttachmentsFixedSize(MultipartFile[] m,String basePath,long currentTime) throws IOException{
		String result="success";
		File baseFolder = new File(basePath);
		for (MultipartFile f : m) {
			if (f.getOriginalFilename() != null
					&& !f.getOriginalFilename().equals("")) {
				
				
				
				String fileName = null;
				String extension = null;
				fileName = f.getOriginalFilename().substring(0,
						f.getOriginalFilename().lastIndexOf("."));
				extension = ".png";
				logger.info("File name is :--" + fileName);
				logger.info("extension is:--" + extension);
				logger.info("filename to set:---" + fileName + "_"
						+ currentTime + extension);
				fileName = fileName.replace(" ","") + "_" + currentTime + extension;
				String filePath = basePath + "\\" + fileName;
				logger.info("filePath:-------"+filePath);
//				File fileToUpload = new File(filePath);
				if (baseFolder.exists()) {

//					FileUtils.deleteDirectory(baseFolder);
//					baseFolder = new File(basePath);
//					baseFolder.mkdirs();
				} else {
					baseFolder.mkdirs();// creates directory
				}
				File file = new File(filePath);
//				try{
//					BufferedImage image = ImageIO.read(f.getInputStream());
//					if(image ==null){
//						return null;
//					}
//					int type = image.getType() == 0? BufferedImage.TYPE_INT_ARGB : image.getType();
//					
//					BufferedImage resizedImage = new BufferedImage(150, 150, type);
//					Graphics2D g = resizedImage.createGraphics();
//					g.drawImage(image	, 0, 0, 150, 150, null);
//					g.dispose();
//					ImageIO.write(resizedImage, "png", file);
////					multiPartFile.transferTo(file);
//					
//				}catch(Exception ex){
//					return null;
//				}
				
				try{
					BufferedImage image = ImageIO.read(f.getInputStream());
					if(image ==null){
						return null;
					}
					int type = image.getType() == 0? BufferedImage.TYPE_INT_ARGB : image.getType();
					
					double orignalHeight =  image.getHeight();
					double orignalWidth =  image.getWidth();
					
					
					double ratio = Math.min( 150 / orignalWidth, 50/ orignalHeight );
					
					int newWidth = (int) (orignalWidth* ratio);    
					int newHeight = (int) (orignalHeight * ratio);
					
					
					BufferedImage resizedImage = new BufferedImage(newWidth, newHeight, type);
					Graphics2D g = resizedImage.createGraphics();
					g.drawImage(image	, 0, 0, newWidth, newHeight, null);
					g.dispose();
					ImageIO.write(resizedImage, "png", file);
//					multiPartFile.transferTo(file);
					
				}catch(Exception ex){
					LogFactory.getLog(FiinfraUtility.class).error("Fail to Save Image", ex);
					return null;
				}
			}
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public void getIFAListForUser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_PARTNER_LIST + userSession.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		Partner partnerVo = new Partner();
		partnerVo.setBuId(buId+"");
		//partnerVo.setUserId(userSession.getUserId()+""); //615
		partnerVo.setUserId(615+""); //615
		partnerVo.setSearchText("");
		
		br = restTemplate.postForObject(url, partnerVo, BaseResponse.class);
		//List<Partner> partnerList = new ArrayList<Partner>();
		Partner[] partnerList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			partnerList = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseListObject()),
					Partner[].class);

		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out,partnerList);
	}
	public void savePartnerData(HttpServletRequest request,
			HttpServletResponse response)throws IOException
	{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info(userSession.getUserName());
		try{
		Partner partner=new Partner();
		partner.setFirstName(request.getParameter("partner_firstName"));
		partner.setLastName(request.getParameter("partner_lastName"));
		partner.setCompanyName(request.getParameter("partner_companyName"));
		partner.setContactEmail(request.getParameter("partner_contactEmail"));
		//partner.setContactMobile(request.getParameter("contactMobile"));
		partner.setArn(request.getParameter("partner_ARN"));
		partner.setEuin(request.getParameter("partner_euin"));
		//partner.setState(request.getParameter("state"));
		//partner.setLocation(request.getParameter("location"));
		partner.setPstTeamMemberId(request.getParameter("pst"));
//		partner.setPktTeamMemberId(request.getParameter("pkt"));
//		partner.setPotTeamMemberId(request.getParameter("pot"));
//		partner.setRmTeamMemberId(request.getParameter("rm"));
//		partner.setRmHeadTeamMemberId(request.getParameter("rmHead"));
		partner.setLoginName(request.getParameter("partner_loginName"));
		partner.setBuId(userSession.getPartyId().toString());
		partner.setUserId(userSession.getUserId().toString());
		partner.setIsHeadNode(request.getParameter("isHeadNode"));
		partner.setCurrentNode(Integer.parseInt(request.getParameter("currentNode")));
		partner.setPartyID(Integer.parseInt(request.getParameter("partyId")));
		logger.info("PartyId in WEB========"+partner.getPartyID());
		logger.info("FirstName in WEB========"+partner.getFirstName());
		//partner.setCommunicationEmailId(request.getParameter("communicationEmailId"));
		
		url = URL_ADD_PARTNER + userSession.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
				
		@SuppressWarnings("unused")
		String userDataXML="<Root>";
		int noOfCAPSAlpha = 1;
		int noOfDigits = 1;
		int noOfSplChars = 1;
		int minLen = 8;
		int maxLen = 15;
		Map<Integer,String> passwordMap=new HashMap<>();
		PrintWriter out=null ;
		int iRetCode=0;
		int recordCount=0;
		String szResponse="";
		String [] szResponsez;
		String szResponsezz = "";
		String szResponsezx = "";
		final String ZERO ="0";
		final String ONE ="1";
		//for(String partyId:partyIdArray){
			String hexString = null;
			
		try {
				char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
						noOfCAPSAlpha, noOfDigits, noOfSplChars);
				hexString = new String(pswd);
				logger.info("hexString is-----" + hexString);
				MD5Encryption md5Encryption = new MD5Encryption();
				//String encryptrdPassword = md5Encryption.encrypt(hexString);
				String encryptrdPassword = passwordEncoder.encodePassword(hexString, null);
				userDataXML+="<User>";
				userDataXML+="<userPassword>"+encryptrdPassword+"</userPassword>";
				//userDataXML+="<partyid>"+partyId+"</partyid>";
				//userDataXML+="<RoleId>"+roleId+"</RoleId>";
				userDataXML+="</User>";
				
							
			//passwordMap.put(Integer.valueOf(partyId), hexString);
			//}
			userDataXML+="</Root>";
			partner.seteNCPassword(encryptrdPassword);
			
			
			//Logger.logEntry(this.getClass(), "URL --> " + url,logger.info, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<>();
			br = restTemplate.postForObject(url, partner, BaseResponse.class);
			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
							if(br.getResponseObject()!=null){recordCount = br.getResponseObject();}
			
			logger.info("Record Count- in WEB========"+recordCount);
			out = response.getWriter();
			response.setContentType("application/json");
			} catch (RestClientException e1) {
				logger.error(e1);
			}
		if(partner.getPartyID()==0){
		try {
			passwordMap.put(recordCount, hexString);
			Notification notification=null;
			for(Map.Entry<Integer,String> map:passwordMap.entrySet()){
				Map<String,String> payloadMap=new HashMap<String, String>();
				payloadMap.put("Password",map.getValue());
				notification=new Notification();
				notification.setSourceSystemID(31003); // need to add in finfra coinstants
				logger.info("SourceSystemID is-----" + notification.getSourceSystemID());
				notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
				logger.info("NotifyTypeId is-----" + notification.getNotifyTypeId());
				notification.setNotifyUserID(userSession.getUserId());
				logger.info("NotifyUserID is-----" + notification.getNotifyUserID());
				notification.setNotifyPartyID(map.getKey());
				logger.info("NotifyPartyID is-----" + notification.getNotifyPartyID());
			    notification.setNotifyEventID(507);   // need to add a param for new admin portal add partner
			    logger.info("NotifyEventID is-----" + notification.getNotifyEventID());
				//notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
				notification.setBuId(userSession.getBuId());
			    logger.info("BuId is-----" + notification.getBuId());
				notification.setPayloadMap(payloadMap);
				 logger.info("PayloadMap is-----" + notification.getPayloadMap());
				notification.setSessionID(request.getSession().getId());
				 logger.info("SessionID is-----" + notification.getSessionID());
				FrameworkUtil.notify(notification);
			
	 }
		   }catch (NumberFormatException e) {
			   logger.error(e);
		   }	
		
		}
			 objectMapper.writeValue(out, recordCount+"~0");
			 logger.info("szResponse.equals(ZERO)::::"+recordCount+"~0");
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
		 
	} catch (IOException e) {
		logger.error(e);
	}     	 
	}
	public void getPartnerDetails(HttpServletRequest request,
			HttpServletResponse response)throws IOException
	{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_PARTNER_DETAILS + userSession.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partnerId = userSession.getPartyId();
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		Partner partnerData = new Partner();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			partnerData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Partner.class);
		logger.info("Latname=="+partnerData.getLastName());
		logger.info("Username=="+partnerData.getUserName());
		logger.info("RecordType=="+partnerData.getRecordTypeID());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, partnerData);
	}
	public void deletePartner(HttpServletRequest request,
			HttpServletResponse response)throws IOException
	{
		int result=0;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_DELETE_PARTNER_DETAILS + userSession.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		//int partnerId = userSession.getPartyId();
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		
		Partner partnerData = new Partner();
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();

		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		

		logger.info("recordCount in WEB=="+result);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);
	}
	
	public void updateNodeUserInSession(HttpServletRequest request,
			HttpServletResponse response)throws IOException
	{
		int nodeId=Integer.parseInt(request.getParameter("nodeId"));
		int partyId=Integer.parseInt(request.getParameter("partyId"));
		String locationName=request.getParameter("locationName");
		String name=request.getParameter("name");
		logger.info("nodeId:---"+nodeId);
		logger.info("partyId:---"+partyId);
		logger.info("locationName:---"+locationName);
		logger.info("name:---"+name);
		
		request.getSession().setAttribute("nodeId", nodeId);
		request.getSession().setAttribute("partyId", partyId);
		request.getSession().setAttribute("locationName", locationName);
		request.getSession().setAttribute("name", name);
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		userSession.setPartyId(partyId);
		request.getSession().setAttribute("userSession", userSession);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, "success");
	}
	public void getPartyId(HttpServletRequest request,
			HttpServletResponse response)throws IOException
	{
//		int partyid;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");		
		int oldpartyId= Integer.parseInt(request.getSession().getAttribute("oldpartyId").toString());
		logger.info("oldpartyId:---"+oldpartyId);
		userSession.setPartyId(oldpartyId);
		
		
		request.getSession().setAttribute("userSession", userSession);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, "success");
	}
	
	public void deleteLogoOrPhoto(HttpServletRequest request,
			HttpServletResponse response)throws IOException
	{
		int result=0;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_DELETE_LOGO_PHOTO + userSession.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int attributeCodeId = Integer.parseInt(request.getParameter("attributeCodeId"));
		logger.info("attributeCodeId====="+attributeCodeId);
		logger.info("Logo====="+userSession.getLogo());
		logger.info("Photo====="+userSession.getPhoto());
		logger.info("Logo====="+userSession.getPartyLogo());
		
		//int partnerId = userSession.getPartyId();
		int partyId = userSession.getPartyId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("attributeCodeId", attributeCodeId);
		
		Partner partnerData = new Partner();
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();

		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		
		if(result>=1 && attributeCodeId==91036)
		{
			userSession.setLogo("");
		}
		else{
			userSession.setPhoto("");
		}
		logger.info("recordCount in WEB=="+result);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);
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
	
private void saveLogoDimantions(Integer partyId, Integer buId, String userName,Integer userId) {
		
		String token = "12345";									
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_PARTY_ATTRIBUTE + "/" + userName + "/" + token);
		uriCB.queryParam("buId", buId);		
		uriCB.queryParam("partyId", partyId);		

		List<PartyAttribute> partyAttributes = new ArrayList<PartyAttribute>();
		
		PartyAttribute attributeData = new PartyAttribute();
		attributeData.setAttributeCodeID(94514);
		attributeData.setAttributeSeqNo(1);
		attributeData.setAttributeValue(logoHeight);
		attributeData.setPartyId(partyId);
		attributeData.setValueDataTypeID(37002);
		attributeData.setCreatedBy(userId);
		
		partyAttributes.add(attributeData);
		
		attributeData = new PartyAttribute();
		attributeData.setAttributeCodeID(94515);
		attributeData.setAttributeSeqNo(2);
		attributeData.setAttributeValue(logoWidth);
		attributeData.setPartyId(partyId);
		attributeData.setValueDataTypeID(37002);
		attributeData.setCreatedBy(userId);
		
		partyAttributes.add(attributeData);		
		
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partyAttributes, BaseResponse.class);				
}
//@RequestMapping(value = "/updateCurrentNodeIdForPartyId", method = RequestMethod.POST)
	@SuppressWarnings("unchecked")
	public void updateCurrentNodeIdForPartyId(HttpServletRequest request,
			HttpServletResponse response)throws IOException
	{
		Boolean result=true;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

//		int buId = userSession.getBuId();
		url = URL_UPDATE_CURRENT_NODEID_FORPARTYID + userSession.getUserName()
				+"/1234";
		logger.info("URL --> " + url);
		
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		int nodeId = Integer.parseInt(request.getParameter("nodeId"));
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("nodeId", nodeId);
		
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Boolean.class);

		logger.info("recordCount in WEB=="+result);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);
	//	objectMapper.writeValue(out, "success");
	}
	
	
	//@RequestMapping(value = "/saveRtaFilePasswords", method = RequestMethod.POST)
		@SuppressWarnings("unchecked")
		public void saveRtaFilePasswords(HttpServletRequest request,
				HttpServletResponse response)throws IOException
		{
			Boolean result=true;
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");

//			int buId = userSession.getBuId();
			
			logger.info("URL --> " + url);
			
			Integer partyId = userSession.getPartyId();			
			url = SAVE_RTA_FILE_PASSWORDS + userSession.getUserName()
					+"/1234?partyId="+partyId+"&userId="+userSession.getUserId();
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			/*uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("nodeId", nodeId);*/
			String CAMS = request.getParameter("CAMS");
			String Karvy = request.getParameter("Karvy");
			String Sundaram = request.getParameter("Sundaram");
			String contactEmail = request.getParameter("contactEmail");
			List<String> passwords = new ArrayList<String>();
			passwords.add(CAMS);
			passwords.add(Karvy);
			passwords.add(Sundaram);
			passwords.add(contactEmail);
			BaseResponse<Boolean> br = new BaseResponse<Boolean>();
			br= restTemplate.postForObject(url, passwords, BaseResponse.class);
			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				result = objectMapper.readValue(
						objectMapper.writeValueAsString(br.getResponseObject()),
						Boolean.class);

			logger.info("recordCount in WEB=="+result);
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, result);
			((UserSession) request.getSession().getAttribute("userSession")).setIsRTAFilePasswordSet(true);
		//	objectMapper.writeValue(out, "success");
	}
		
		@SuppressWarnings("unchecked")
		public  void getEmailCommunicationDetails(HttpServletRequest request,
				HttpServletResponse response)throws IOException
		{ 
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			url = GET_EMAIL_COMM_DETAILS + userSession.getUserName()
					+ "/1234";
			logger.info("URL --> " + url);
			int buId = userSession.getBuId();
			int partyId = userSession.getPartyId();
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("buId", buId);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<PartyEmailCommunicationData> br = new BaseResponse<PartyEmailCommunicationData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
					BaseResponse.class).getBody();
			PartyEmailCommunicationData partyEmailCommunicationData = new PartyEmailCommunicationData();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				partyEmailCommunicationData  = objectMapper.readValue(
						objectMapper.writeValueAsString(br.getResponseObject()),
						PartyEmailCommunicationData .class);
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, partyEmailCommunicationData);
		}

	@SuppressWarnings("unchecked")
	public void moveClientOrOpportunity(HttpServletRequest request,HttpServletResponse response)throws IOException
	{
		int result=1;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String listOfPartyIds =  request.getParameter("list");
		String partnerPartyID = request.getParameter("partyId");
		String nodeId =  request.getParameter("nodeId");
		String token = "23sd";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(MOVE_CONTACTS_TO_OTHER_PARTNER+userSession.getUserName() +"/"+ token);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		Partner partner;
		if (partnerPartyID != null && listOfPartyIds !=null ) {
			partner = new Partner();
			partner.setSearchText(listOfPartyIds);
			partner.setPartyID(Integer.valueOf(partnerPartyID));
			br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partner, BaseResponse.class);
			
			if ((br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) || (br.getStatus().equalsIgnoreCase(null)))
			{
			
				result= 1;
			}
			else{
				result= 0;
			}
		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);
	}
	
	
	@SuppressWarnings("unchecked")
	public ModelAndView roleAccessList(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		ModelAndView mav = new ModelAndView("role/role_access_list");

		int sourceId = 0;
		int partyId = 0;
		String searchTextVal = null;
		
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
		if(request.getParameter("memberName").trim()!=null){
			String memberName=request.getParameter("memberName").trim();
			request.setAttribute("memberName", memberName);
		}
		if ((request.getParameter("sourceId").trim() != null)
				&& !(request.getParameter("sourceId").trim().equals(""))) {
			if((request.getParameter("sourceId").trim().equals("31001"))) {
				sourceId = 31001;
				request.setAttribute("selectedSourceSystem", "31001");
			} else 	if((request.getParameter("sourceId").trim().equals("31006")))  {
				sourceId = 31006;
				request.setAttribute("selectedSourceSystem", "31006");
			}

		}
		partyId = Integer.parseInt(request.getParameter("partyId"));
		RoleAccess roleAccess = new RoleAccess();
		roleAccess.setSourceSystemId(sourceId);
		roleAccess.setPartyId(partyId);
		roleAccess.setSearchText(searchTextVal);
		
		
		try {
			BaseResponse<RoleAccess> br = new BaseResponse<RoleAccess>();
			
			url = URL_ALL_ROLE_ACCESS_LIST + userSession.getUserName()
					+ "/1234";
			br = restTemplate.postForObject(url, roleAccess, BaseResponse.class);
			
			List<RoleAccess> roleAccessList = new ArrayList<RoleAccess>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				roleAccessList = br.getResponseListObject();
			mav.addObject("roleAccessList", objectMapper.writeValueAsString(roleAccessList));
			mav.addObject("partyId", partyId);
			mav.addObject("sourceId", sourceId);
			@SuppressWarnings("unused")
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception e) {
				logger.error(""+e);
			}
		} catch (Exception e) {
			logger.error(""+e);
		}

		return mav;
	}
	@SuppressWarnings("unchecked")
	public void saveNewRoleAccessList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		if (request.getParameter("selectedlvalz") != null) {

			String list = request.getParameter("selectedlvalz");
			int partyId = Integer.parseInt(request.getParameter("partyId"));
			int sourceId = Integer.parseInt(request.getParameter("sourceId"));
			
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			
			int createdby = userSession.getUserId();

			url = URL_UPDATE_ROLE_ACCESS_LIST + userSession.getUserName()
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("Lists", list);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("createdby", createdby);
			uriCB.queryParam("sourceId", sourceId);

			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.getForEntity(
					FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class)
					.getBody();
			Integer result = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				result = br.getResponseObject();
			
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97171,
									FiinfraConstants.PARTNER_PORTAL,
									FiinfraConstants.PP_SOURCE_MODULE_ROLE,
									FiinfraConstants.PP_EDIT_ROLE_ACCESS_LIST);
			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, result);
		}
	}
	
	@SuppressWarnings("unchecked")
	public void getOLTransactionConfiguration(HttpServletRequest request,HttpServletResponse response)throws IOException
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String listOfAttrCodeId =  "146003,146004,146006,146005";
		Integer partnerPartyID = userSession.getPartyId();
		Integer attrCodeId =  98101;//MF Online URL
		String token = "abc";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(URL_GET_OL_TRANSACTION_CONFIGURATION+userSession.getUserName() +"/"+ token);
		uriCB.queryParam("partyId", partnerPartyID);
		uriCB.queryParam("attrCodeId", attrCodeId);
		uriCB.queryParam("attrCodeList", listOfAttrCodeId);
		uriCB.queryParam("buId", userSession.getBuId());
		BaseResponse<ConfigurationProductsList> br = new BaseResponse<ConfigurationProductsList>();
		ConfigurationProductsList configurationProductsList=null;
		List<PartySetting> partySettings = new ArrayList<>();
		if (partnerPartyID != null && listOfAttrCodeId !=null ) {
			br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB),BaseResponse.class);
			if ((br.getStatus().equalsIgnoreCase(FiinfraConstants.success)))
			{
				 configurationProductsList = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), ConfigurationProductsList.class); 
			}
			
		}
		Collections.sort(configurationProductsList.getPartySettings(), new Comparator<PartySetting>() {

			@Override
			public int compare(PartySetting o1, PartySetting o2) {
				return o1.getPartyId().compareTo(o2.getPartyId());
			}
		});

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out,configurationProductsList);
		}
	
	@SuppressWarnings("unchecked")
	public void saveOLTransactionConfiguration(HttpServletRequest request,HttpServletResponse response)throws IOException
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String purchaseMFList = request.getParameter("purchase");
		String redemptionMFList = request.getParameter("redemption");
		String switchMFList = request.getParameter("switch");
		String SIPRegistrationList = request.getParameter("SIPRegistration");
		List<PartyAttribute> partyAttributes = new ArrayList<>();
				
		PartyAttribute attributeData = new PartyAttribute();
		attributeData.setAttributeCodeID(146003);//MF Purchase
		attributeData.setAttributeSeqNo(1);
		attributeData.setAttributeValue(purchaseMFList);
		attributeData.setPartyId(userSession.getPartyId());
		attributeData.setValueDataTypeID(37001);//String
		attributeData.setCreatedBy(userSession.getUserId());
		partyAttributes.add(attributeData);
	
		/*if(redemptionMFList != ""){
			PartyAttribute attributeData = new PartyAttribute();
			attributeData.setAttributeCodeID(146004);//MF Redemption
			attributeData.setAttributeSeqNo(1);
			attributeData.setAttributeValue(redemptionMFList);
			attributeData.setPartyId(userSession.getPartyId());
			attributeData.setValueDataTypeID(37001);//String
			attributeData.setCreatedBy(userSession.getUserId());
			partyAttributes.add(attributeData);
		}
		if(switchMFList != ""){
			PartyAttribute attributeData = new PartyAttribute();
			attributeData.setAttributeCodeID(146005);//MF Switch
			attributeData.setAttributeSeqNo(1);
			attributeData.setAttributeValue(switchMFList);
			attributeData.setPartyId(userSession.getPartyId());
			attributeData.setValueDataTypeID(37001);//String
			attributeData.setCreatedBy(userSession.getUserId());
			partyAttributes.add(attributeData);
		}
		if(SIPRegistrationList != ""){
			PartyAttribute attributeData = new PartyAttribute();
			attributeData.setAttributeCodeID(146006);//MF SIP Registration
			attributeData.setAttributeSeqNo(1);
			attributeData.setAttributeValue(SIPRegistrationList);
			attributeData.setPartyId(userSession.getPartyId());
			attributeData.setValueDataTypeID(37001);//String
			attributeData.setCreatedBy(userSession.getUserId());
			partyAttributes.add(attributeData);
			}*/
		
		String token = "12345";									
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_PARTY_ATTRIBUTE + "/" + userSession.getUserName() + "/" + token);
		uriCB.queryParam("buId", userSession.getBuId());		
		uriCB.queryParam("partyId", userSession.getPartyId());
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partyAttributes, BaseResponse.class);
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out,br.getResponseObject());
		}
	}
	
	@SuppressWarnings("unchecked")
	public void getRTAPasswords(HttpServletRequest request,HttpServletResponse response)throws IOException {
	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
	url = GET_RTA_FILE_PASSWORDS + userSession.getUserName() + "/1234?partyId="+userSession.getPartyId()+"&buId="+userSession.getBuId()+"&sourceSystemId="+FiinfraConstants.PARTNER_PORTAL;
		BaseResponse<ProfileData> baseRes=new BaseResponse<ProfileData>();
		baseRes = restTemplate.getForEntity(url, BaseResponse.class).getBody();
		ProfileData profileData = null;
		PrintWriter out = null;
		if (baseRes.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			//profileData = baseRes.getResponseObject();			
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out,baseRes.getResponseObject());		
	}
}

