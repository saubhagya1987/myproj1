package in.fiinfra.controller;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.partner.LocationData;
import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.framework.models.Audit;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class HeirarchyController extends MultiActionController
{

	private RestTemplate restTemplate;
	

	private ObjectMapper objectMapper;
	
	private int loginType=FiinfraConstants.LOGIN_ACCESS_MODE_STANDARD;	
	@Value("${URL_GET_HEIRARCHY_DATA}")
	private String URL_GET_HEIRARCHY_DATA;
	
	@Value("${URL_GET_HEIRARCHY_DATA_SP_TREE}")
	private String URL_GET_HEIRARCHY_DATA_SP_TREE;

	@Value("${URL_INSERT_PARTNER_LOCATION}")
	private String URL_INSERT_PARTNER_LOCATION;
	

	@Value("${SAVE_USER_ACCESS_LOG}") 
	private  String SAVE_USER_ACCESS_LOG;
	
	@Value("${URL_DELETE_PARTNER_LOCATION}")
	private String URL_DELETE_PARTNER_LOCATION;
	
	
	@Value("${SUCCESSFULL_LOGIN}")
	private String SUCCESSFULL_LOGIN;
	
	@Value("${URL_GET_NON_ACCESSIBLE_CONTROLIDS}")
	private String URL_GET_NON_ACCESSIBLE_CONTROLIDS;
	
	
	@Value("${GET_PARTY_ATTRIBUTE}")
	private String GET_PARTY_ATTRIBUTE;
	
	@Value("${GET_RTA_FILE_PASSWORDS}")
	private String GET_RTA_FILE_PASSWORDS;
	
	@Value("${URL_GET_PARTNER_DETAILS}")
	private String URL_GET_PARTNER_DETAILS;
	
	@Value("${URL_DELETE_PARTNER_DETAILS}")
	private String URL_DELETE_PARTNER_DETAILS;
	
	
	@Value("${URL_UPDATE_CURRENT_NODEID_FORPARTYID}")
	private String URL_UPDATE_CURRENT_NODEID_FORPARTYID;
	
	
	
	@Value("${URL_GET_HEIRARCHY_DATA_SP}")
	private String URL_GET_HEIRARCHY_DATA_SP;
	
	@Value("${URL_GET_HEIRARCHY_USER_LIST}")
	private String URL_GET_HEIRARCHY_USER_LIST;
	
	@Value("${URL_ADD_HEIRARCHY_USER}")
	private String URL_ADD_HEIRARCHY_USER;
	
	
	@Value("${URL_GET_USER_SESSION}")
	private String URL_GET_USER_SESSION;
	
	
	
	
	
	private String sectionName;
	
	
	final String SOURCE_MODEULE = "SP Heirarchy";
	
	String url;
	
	public void getHeirarchyData(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			int buId=userSession.getBuId();
			int partyId=userSession.getBuId();
			
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
	
	
	@SuppressWarnings("unchecked")
	public void savePartnerLocationData(HttpServletRequest request,
			HttpServletResponse response, LocationData locationData)
			throws Exception {
	
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_INSERT_PARTNER_LOCATION + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getBuId();
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
		
		//String OBJECT_STRING="locationName="+locationName+",locationDescription="+locationDescription+",buPartyID="+bupartyId;

		
		
		
		String OBJECT_STRING="usp_cp_saveLocation("+locationData.getLocationId()+","+locationName+","+locationDescription+","+partyId+","+locationData.getCreatedBy()+","+locationData.getParentNodeId()+","+locationData.getLevel()+")";
		FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_LOCATION_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_HEIRARCHY,FiinfraConstants.SP_UPDATE_CURRENT_NODEID_FORPARTYID,"SP="+FiinfraConstants.SP_UPDATE_CURRENT_NODEID_FORPARTYID,OBJECT_STRING);

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		
		/*logger.info("eventTextXML========="+eventTextXML);
		
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
		*/
		 if(userSession.getHeadOfNode()==true)
		 {
				 partyId=userSession.getPartyId();
				int currentNodeId=userSession.getCurrentNodeId();
				int level=userSession.getLevel();
				url=URL_GET_HEIRARCHY_DATA_SP_TREE + userSession.getUserName() + "/1234";
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

	
	public void getcreateTree(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		

	int	 partyId=userSession.getPartyId();
		int currentNodeId=userSession.getCurrentNodeId();
		int level=userSession.getLevel();
		url=URL_GET_HEIRARCHY_DATA_SP_TREE + userSession.getUserName() + "/1234";
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
		
		
		
			logger.info("heirarchyDatas Data----------"+heirarchyDatas);

			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, heirarchyDatas);		
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
	
	
	
	public String buildSession(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		String redirectUrl=null;
		// call stored proc for successful login
		try{
			
			String userName = (String) request.getSession().getAttribute("USER_NAME");
			
			//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String url = SUCCESSFULL_LOGIN + userName + "/" + request.getRemoteAddr();
			UserSession userSession =  restTemplate.getForObject(url, UserSession.class);
			request.getSession().setAttribute("userSession", userSession);
			userSession.setUserName(userName); 
			if(request.getParameterMap().containsKey("LOB")){
				userSession.setUserId(Integer.parseInt((String) request.getParameter("PST")));
				userSession.setRoleId(Integer.parseInt((String) request.getParameter("pstroleId")));
				logger.info("PST ROLE ID TEST"+userSession.getRoleId());
				loginType=FiinfraConstants.LOGIN_ACCESS_MODE_LOB;
			}
			url = URL_GET_NON_ACCESSIBLE_CONTROLIDS + userName + "/1234?partyId="+userSession.getPartyId()+"&buId="+userSession.getBuId()+"&sourceSystemId="+FiinfraConstants.SERVICE_PORTAL;
			BaseResponse<String> br=new BaseResponse<>();
			br = restTemplate.getForEntity(url, BaseResponse.class).getBody(); 
			List<String> idList=new ArrayList<>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				idList = br.getResponseListObject();   
			request.getSession().setAttribute("idList", idList);
			logger.info("idList:-------"+idList);
			logger.info("isHeadOfNode="+userSession.getHeadOfNode());
			logger.info("Cureent Node Id="+userSession.getCurrentNodeId());
			
			
			
			getUserSession(request,response);
			
			if(userSession.getHeadOfNode()==true)
			{
			int partyId=userSession.getPartyId();
			int currentNodeId=userSession.getCurrentNodeId();
			int level=userSession.getLevel();
			url=URL_GET_HEIRARCHY_DATA_SP_TREE + userSession.getUserName() + "/1234";
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
					((UserSession) request.getSession().getAttribute("userSession")).setLogoHeight(60);
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
			
			redirectUrl="redirect:/heirarchy/redirect.htm?&GOTO="+request.getParameter("GOTO");
		}else 
			redirectUrl="redirect:/heirarchy/redirect.htm";
		return redirectUrl;
	}	
	
	public ModelAndView redirect(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
	//	System.out.println("in------Service Portal redirect");
		String redirectUrl=null;
		String password=null;
		// call stored proc for successful login
		try{
			
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			/*if(userSession.getSuccessfulLoginCount()<1 && userSession.getRoleId()==FiinfraConstants.PARTNER_ROLE){
				redirectUrl="redirect:/setup.htm";
				}*/
		/*	if(userSession.getIsForceChangePasswordOnLogin()==true && userSession.getSuccessfulLoginCount()>0){
				redirectUrl="redirect:/common/changePassword.htm";
			}else{*/
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
						if(request.getSession().getAttribute("password")!=null){
							password = request.getSession().getAttribute("password").toString();
						}else{
							password="";
						}
				
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
					String portalURL = baseUrl+"/FIINFRA-Service/index.htm" ;
					response.setHeader("token", userSession.getUserName());
					//log user for successfull login
					saveUserAccessLog(userid, password, portalURL, sessionId, ipaddress, username);
					userSession.setSuccessfulLoginCount(1);
					request.getSession().setAttribute("userSession", userSession);
				}catch(Exception e){
					e.printStackTrace();
				}
				//redirectUrl="redirect:/home/home.htm";
			/*}*/
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error("Error in login", ex);
		}
		return new ModelAndView("home/home");
	}
	public  void saveUserAccessLog(Integer userId,String password,String url,String sessionId,String ipAddress,String username)
	{
		String token = "23d";
		UserAccessLog accessLog = new UserAccessLog();
		accessLog.setUserId(userId);
		accessLog.setLoginAccessModeId(FiinfraConstants.LOGIN_ACCESS_MODE_STANDARD);
		accessLog.setEnteredPassword(password);
		accessLog.setLoginSuccessful(1);
		accessLog.setRedirectUrl(url);
		accessLog.setSessionId(sessionId);
		accessLog.setSourceIPAddress(ipAddress);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_USER_ACCESS_LOG+ username+"/" + token);
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), accessLog, BaseResponse.class);
		
		
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
		int bupartyId =userSession.getBuId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("nodeId", nodeId);
		uriCB.queryParam("buPartyID", bupartyId);
		//System.out.println(bupartyId+"in heirarchy");
		
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Boolean.class);
String OBJECT_STRING="partyId="+partyId+",nodeId="+nodeId+",buPartyID="+bupartyId;

		FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_CHANGE_PARENT_NODEID_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_HEIRARCHY,FiinfraConstants.SP_UPDATE_CURRENT_NODEID_FORPARTYID,"SP="+FiinfraConstants.SP_UPDATE_CURRENT_NODEID_FORPARTYID,OBJECT_STRING);
		
		logger.info("recordCount in WEB=="+result);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);
	//	objectMapper.writeValue(out, "success");
	}
	

	public void updateNodeUserInSession(HttpServletRequest request,
			HttpServletResponse response)throws IOException
	{
		int nodeId=Integer.parseInt(request.getParameter("nodeId"));
		int partyId=Integer.parseInt(request.getParameter("partyId"));
		///System.out.println(partyId+"Party Id");
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
		userSession.setCurrentNodeId(nodeId);
		//userSession.setCurrentNodeId(nodeId);
		
		//userSession.set
		request.getSession().setAttribute("userSession", userSession);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, "success");
	}
	
	
	 
	public void getHeirarchyDataSP(HttpServletRequest request,
			HttpServletResponse response) throws IOException {


		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
			
		   int rootID=Integer.parseInt(request.getParameter("rootID"));
			int partyId=userSession.getPartyId();
			int currentNodeId=userSession.getCurrentNodeId();
			int level=userSession.getLevel();
			url=URL_GET_HEIRARCHY_DATA_SP + userSession.getUserName() + "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("currentNodeId", currentNodeId);
			uriCB.queryParam("level", level);
			uriCB.queryParam("rootID", rootID);
			
			
			
			BaseResponse<HeirarchyData> br1= new BaseResponse<HeirarchyData>();
			br1= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
			HeirarchyData heirarchyDatas=new HeirarchyData();
			if(br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				heirarchyDatas=objectMapper.readValue(objectMapper.writeValueAsString(br1.getResponseObject()), HeirarchyData.class);
			}
			/*	
				HttpSession hes1 = request.getSession();
				hes1.setAttribute("lstLocationData11", objectMapper.writeValueAsString(heirarchyDatas.getLstLocationData()));
				hes1.setAttribute("lstPartnerHeirarchyData11", objectMapper.writeValueAsString(heirarchyDatas.getLstPartnerHeirarchyData()));
				
			//	request.getSession().setAttribute("lstLocationData11", objectMapper.writeValueAsString(heirarchyDatas.getLstLocationData()));
				//request.getSession().setAttribute("lstPartnerHeirarchyData11", objectMapper.writeValueAsString(heirarchyDatas.getLstPartnerHeirarchyData()));
				
			}
			else
			{
				request.getSession().setAttribute("lstLocationData11", null);
				
				request.getSession().setAttribute("lstPartnerHeirarchyData11", null);
				
			}*/
			logger.info("heirarchyDatas Data----88------"+heirarchyDatas);
			logger.info("heirarchyDatas Data----88---Location---"+heirarchyDatas.getLstLocationData());
			logger.info("heirarchyDatas Data----88---Partner---"+heirarchyDatas.getLstPartnerHeirarchyData());
		//	request.getSession().setAttribute("lstLocationData11", "");
		//	request.getSession().setAttribute("lstPartnerHeirarchyData11","");
			
			
			
			
		//	request.setAttribute("nodeNames", objectMapper.writeValueAsString(heirarchyDatas.getLstLocationData()));
			//request.setAttribute("childNames",objectMapper.writeValueAsString(heirarchyDatas.getLstPartnerHeirarchyData()));
			String codeValueDataList="success";
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, heirarchyDatas);
		

	}
	
	//getUserName
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value ="/getPicklistValues", method = RequestMethod.GET)
	public void getHeirarchyUserName(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("In get code value from code type");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
		
		
		url = URL_GET_HEIRARCHY_USER_LIST+"xyz/1234";
		int currentNodeid=Integer.parseInt(request.getParameter("currentNodeId"));

		
		Partner p=new Partner();

		p.setCurrentNode(currentNodeid);
		p.setBuPartyId(userSession.getBuId());
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		br = restTemplate.postForObject(url, p, BaseResponse.class);
		List<Partner> codeValueDataList = new ArrayList<Partner>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList= br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);
		

	}

	
	@SuppressWarnings("unchecked")
	//@RequestMapping(value ="/getPicklistValues", method = RequestMethod.GET)
	public void getUserSession(HttpServletRequest request,HttpServletResponse response) throws Exception 
	{
		//logger.info("In add faq");
		
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int partyID = userSession.getPartyId();
		int buid=userSession.getBuId();
		
	
		
	
	Partner p =new Partner();
	p.setPartyID(partyID);
	p.setBuPartyId(buid); 

		url = URL_GET_USER_SESSION + userSession.getUserName()+ "/1234";
	
		//Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Partner> br = new BaseResponse<>();
		br = restTemplate.postForObject(url, p, BaseResponse.class);
		
		//Partner codeValueDataList=new Partner();

       
		
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		//	recordCount = br.getResponseListObject();
	
		
		//System.out.println(userSession.getHeadOfNode()+"headOfNode");
		//System.out.println(userSession.getCurrentNodeId()+"partner.getCurrentNode()");
		
		//ger.info("heirarchyDatas Data----88------"+heirarchyDatas);
		logger.info("userSession.getHeadOfNode()"+userSession.getHeadOfNode());
		logger.info("userSession.getCurrentNodeId()"+userSession.getCurrentNodeId());
		
		
		Partner partner = new Partner();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			partner = objectMapper
					.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Partner.class);
       
boolean headOfNode;
if(partner.getHeadNode()==1)
{
	headOfNode=true;
}
else
{
	headOfNode=false;
}
		
userSession.setHeadOfNode(headOfNode);
userSession.setCurrentNodeId(partner.getCurrentNode());
		
	//.out.println(headOfNode+"headOfNode");
	//	System.out.println(partner.getCurrentNode()+"partner.getCurrentNode()");
		
		//ger.info("heirarchyDatas Data----88------"+heirarchyDatas);
		logger.info("headOfNode"+headOfNode);
		logger.info("partner.getCurrentNode()"+partner.getCurrentNode());
		
	}
	
	
	@SuppressWarnings("unchecked")
	//@RequestMapping(value ="/getPicklistValues", method = RequestMethod.GET)
	public void addPartnerHeirarchy(HttpServletRequest request,HttpServletResponse response) throws Exception {
		//logger.info("In add faq");
		
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int partyID = Integer.parseInt(request.getParameter("partyid"));
		int nodeId=Integer.parseInt(request.getParameter("nodeid"));
		int isHeadNode=Integer.parseInt(request.getParameter("headNode"));
		
		/*System.out.println(partyID+"partyID");
		System.out.println(nodeId+"nodeId");
		System.out.println(isHeadNode+"isHeadNode");
		*/
	
	Partner p =new Partner();
	p.setPartyID(partyID);
	p.setNodeId(nodeId);
	p.setHeadNode(isHeadNode);
		url = URL_ADD_HEIRARCHY_USER + userSession.getUserName()+ "/1234";
	
		//Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<>();
		br = restTemplate.postForObject(url, p, BaseResponse.class);
		int recordCount=0;
		Integer codeValueDataList=null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		String OBJECT_STRING="PartyID="+partyID+",nodeId="+nodeId+",IsHeadNode="+isHeadNode;
		//logger.info("Result In add faq "+recordCount);
		
		FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_USER_HEIRARCHY_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_HEIRARCHY,FiinfraConstants.SP_ADD_HEIRARCHY_USER,"SP="+FiinfraConstants.SP_ADD_HEIRARCHY_USER,OBJECT_STRING);
		
		
		objectMapper.writeValue(out, recordCount);/*eDataList);*/
	}
	
	
	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(HeirarchyController.class);

	public RestTemplate getRestTemplate() {
		return restTemplate;
	}

	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}
	
	
	
	
}
