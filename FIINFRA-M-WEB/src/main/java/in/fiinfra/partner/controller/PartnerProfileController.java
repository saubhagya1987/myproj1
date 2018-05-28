package in.fiinfra.partner.controller;

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.ChartData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.PartnerProfile;
import in.fiinfra.common.common.PartyAttributeData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.controller.AbstractController;
import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.Address;
import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.AdviserGoalChart;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.DcAnalysisHelper;
import in.fiinfra.common.diy.models.DcInputData;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.AutoPlanData;
import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.DateUtil;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.common.util.MD5Encryption;
import in.fiinfra.common.util.PartyDateComparator;
import in.fiinfra.common.util.PartyNameComparator;
import in.fiinfra.common.util.RandomPasswordGenerator;
import in.fiinfra.common.utility.CurrentFinancialStatusData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.partner.models.FpHolder;
import in.fiinfra.partner.models.ProductOffering;
import in.fiinfra.partner.models.Theme;
import in.fiinfra.partner.service.PartnerService;
import in.fiinfra.query.model.GetRequest;
import in.fiinfra.query.model.ProfileRequest;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;
//import in.fiinfra.forgotpassword.models.TaskListResponse;

@Controller
@RequestMapping("/partner")
public class PartnerProfileController extends AbstractController {
	private static final Logger LOGGER = Logger.getLogger(PartnerProfileController.class);

	private static final String DC_XML = "DCInputFields.xml";
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private CommonController commonController;
	
	@Autowired 
	Md5PasswordEncoder passwordEncoder;

	@Value("${SUCCESSFULL_LOGIN}")
	private String SUCCESSFULL_LOGIN;

	@Value("${GET_PARTY_PROFILE}")
	private String GET_PARTY_PROFILE;
	
	@Value("${CONTACTS_URL}")
	private String CONTACTS_URL;
	
	@Value("${DC_INPUT_DATA_URL}")
	private String DC_INPUT_DATA_URL;
	
	@Value("${SAVE_DC_INPUT}")
	private String SAVE_DC_INPUT;
	
	@Value("${UPDATE_DC_INPUT_DATA_URL}")
	private String UPDATE_DC_INPUT_DATA_URL;
	
	@Value("${ADD_PARTY_INFO}")
	private String ADD_PARTY_INFO;
	
	@Value("${UPDATE_PARTY_INFO}")
	private String UPDATE_PARTY_INFO;	
	
	@Value("${GET_TASKLIST_URL}")
	private String GET_TASKLIST_URL;
	
	@Value("${GET_PICKLIST_VALUELIST}")
	private String GET_PICKLIST_VALUELIST;
	
	@Value("${GET_ASSIGNEDTO_VALUES}")
	private String GET_ASSIGNEDTO_VALUES;
	
	@Value("${URL_GET_PICKLIST_VALUE_LIST}")
	private String URL_GET_PICKLIST_VALUE_LIST;
	
	@Value("${CONTACTS_FOR_SEARCH_CRITERIA}")
	private String CONTACTS_FOR_SEARCH_CRITERIA;
	
	@Value("${DELETE_CONTACTS}")
	private String DELETE_CONTACTS;
	
	@Value("${FETCH_DC_INPUTDATA}")
	private String FETCH_DC_INPUTDATA;
	
	@Value("${GET_PARTNER_GOALS_URL}")
	private String GET_PARTNER_GOALS_URL;
	
	@Value("${GET_NUMBER_OF_GOALS_FOR_PARTYID}")
	private String GET_NUMBER_OF_GOALS_FOR_PARTYID;
	
	@Value("${GET_ANALYSIS_DATA_FOR_DC}")
	private String GET_ANALYSIS_DATA;
	
	@Value("${GET_REALTIONSHIP_FOR_PARTY}")
	private String GET_REALTIONSHIPID_FOR_PARTY;
	
	@Value("${GET_SUGGESTION_DATA}")
	private String GET_SUGGESTION_DATA;
	
	@Value("${SAVE_SUGGESTION_DATA}")
	private String SAVE_SUGGESTION_DATA;
	
	@Value("${UPDATE_PARTY_INFO_FOR_CONTACT}")
	private String UPDATE_PARTY_INFO_FOR_CONTACT;
	
	@Value("${GET_ASSUMPTIONS}")
	private String GET_ASSUMPTIONS;	

	@Value("${GET_PLANID_FOR_PARTYID}")
	private String GET_PLANID_FOR_PARTYID;
	
	@Value("${SAVE_ASSUMPTIONS_FOR_CONTACTS}")
	private String SAVE_ASSUMPTIONS_FOR_CONTACTS;
	
	@Value("${ACTIVATE_DCT}")
	private String ACTIVATE_DCT;
	
	@Value("${GET_CHART_DATA_LIST}")
	private String GET_CHART_DATA_LIST;
	
	@Value("${GET_GOAL_BUCKET_ALLOCATION}")
	private String GET_GOAL_BUCKET_ALLOCATION;
	
	@Value("${URL_INSERT_DC_ACTIVATION_RECORD}") 
	private String URL_INSERT_DC_ACTIVATION_RECORD;
	

	@Value("${UPDATE_FPACTIVITY_TRACKER}") 
	private String UPDATE_FPACTIVITY_TRACKER;
	

	@Value("${SAVE_USER_ACCESS_LOG}") 
	private String SAVE_USER_ACCESS_LOG;
	
	@Value("${GET_PARTNER_GOAL_CHART_URL}") 
	private String GET_PARTNER_GOAL_CHART_URL;
	
	@Value("${SAVE_ASSET_ALLOCATION_FOR_RETIREMENT}") 
	private String SAVE_ASSET_ALLOCATION_FOR_RETIREMENT;
	
	@Value("${GET_NUMBER_OF_ALERTS_FOR_PARTYID}")
	private String GET_NUMBER_OF_ALERTS_FOR_PARTYID;
	
	@Value("${app.image.path}")
	private String APP_IMAGE_PATH;
	
	@Value("${GET_VALID_PAN_NUMBER}")
	private String GET_VALID_PAN_NUMBER;
	
	@Value("${GET_INTERESTED_FP_SECTION}")
	private String GET_INTERESTED_FP_SECTION;
	
	@Value("${SAVE_INTERESTED_FP_SECTION}")
	private String SAVE_INTERESTED_FP_SECTION;
	
	@Value("${URL_GET_CLIENT_AUTOPLAN_DETAILS}") 
	private  String URL_GET_CLIENT_AUTOPLAN_DETAILS; 
	
	@Value("${URL_SAVE_CLIENT_AUTOPLAN_DETAILS}") 
	private  String URL_SAVE_CLIENT_AUTOPLAN_DETAILS; 
	
	@Value("${GET_AUTOLPLAN_CLIENTS}") 
	private  String GET_AUTOLPLAN_CLIENTS; 
	
	@Value("${GET_PARTY_URL}")
	private String GET_PARTY;
	
	@Value("${GET_ROLE_BASED_SECURITY_IDS}")
	private String GET_ROLE_BASED_SECURITY_IDS;
	
	@Value("${URL_UPDATE_PARTNER_AUTO_PLAN_CONFIGURATION}") 
	private  String URL_UPDATE_PARTNER_AUTO_PLAN_CONFIGURATION;
	
	@Value("${DELETE_FAMILY_MEMBER}")
	private String DELETE_FAMILY_MEMBER;
	
	@Value("${URL_GET_HEIRARCHY_DATA_VP}")
	private String URL_GET_HEIRARCHY_DATA_VP;
	
	@Value("${GET_EXPENSE_LIST_DETAILS}")
	private String GET_EXPENSE_LIST_DETAILS;
	
	@Value("${GET_INCOME_LIST_DETAILS}")
	private String GET_INCOME_LIST_DETAILS;
	
	@Value("${GET_PLAN_TYPE}")
	private String GET_PLAN_TYPE;
	
	@Value("${SAVE_PLAN_TYPE}")
	private String SAVE_PLAN_TYPE;  
	
	@Value("${PP_DC_TOOL_LINK}")
	private String PP_DC_TOOL_LINK; 
	
	@Value("${REMOVE_LOGO_URL}")
	private String REMOVE_LOGO_URL;

	@Value("${XRAY_ACTIVATION}")
	private String XRAY_ACTIVATION;
	
	@Value("${GET_PARTNER_AUTOPLAN_CONFIGURATION}")
	private String GET_PARTNER_AUTOPLAN_CONFIGURATION;
	
	@Value("${URL_SAVE_QUICK_DC}")
	private String URL_SAVE_QUICK_DC;

	@Value("${SAVE_PARTY_ATTRIBUTE}")
	private String SAVE_PARTY_ATTRIBUTE;
	
	@Value("${GET_PARTY_ATTRIBUTE}")
	private String GET_PARTY_ATTRIBUTE;
	

	@Value("${MOVE_CONTACTS_TO_OTHER_PARTNER}")
	private String MOVE_CONTACTS_TO_OTHER_PARTNER;
	
	@Value("${SAVE_ANALYSIS_REPORTS_FOR_BATCH}")
	private String SAVE_ANALYSIS_REPORTS_FOR_BATCH;
	
	@Value("${GET_ALL_PRODUCTS_NAME}")
	private String GET_ALL_PRODUCTS_NAME;
	
	
	private final String DATE_FORMAT_DD_MM_YYYY = "dd-MM-yyyy";
	
	private static final String LOGIN_SOURCE="Login";
	private static final String CONTACT_SOURCE="Contact";
	private static final String DC_SOURCE="Data Collection";
	private static final String CFS_SOURCE="Current Financial Status";
	private static final String PARTNER_PROFILE_SOURCE="Partner profile";
	private static final String ASSUMPTION_SOURCE="Assumption profile";
	private static final String DC_ACTIVATE_SOURCE="Activate DC";
	

	
	@Autowired
	private ObjectMapper objectMapper;
	
	private final String PARTYLIST = "partyList";
	private final String TOTALCONTACTS = "totalContacts";
	
	private AdviceAssumption healthAssumtion;
	
	private Integer scale;

	private String name;
		
	
	/**
	 * This method is responsible to show the dashboard screen after successful login
	 * @param request of type {@link javax.servlet.http.HttpServletRequest}
	 * @return result of type {@link java.lang.String}
	 */
	@RequestMapping(value = "/dashboard", method = {RequestMethod.GET,RequestMethod.POST})
	public String showDashboard(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes) 
	{
		Integer islogin =1;
		String flag = request.getParameter("flag");
		UserSession userSession =  (UserSession) request.getSession().getAttribute("userSession");
		if(userSession != null)
		{
		String partnerSetupLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 283);// Partner Setup links
		//model.addAttribute("partnerSetupLinks", partnerSetupLinks);
		request.getSession().setAttribute("partnerSetupLinks", partnerSetupLinks);
		String roleBaseLinks =commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 323);// Partner Dashboard links
		model.addAttribute("roleBaseLinks", roleBaseLinks);
		request.getSession().setAttribute("smallMenuLinks", roleBaseLinks);
		}
		if(flag != null)
		{
			islogin=Integer.parseInt(flag);
		}
		//To enable partner portal link
		model.addAttribute("flag",1);
		if(islogin==0)
		{
			request.getSession().removeAttribute("headerName");
			//return "partner/dashboard";	
		}
		// call stored proc for successful login
			try{
				String userName = (String) request.getSession().getAttribute("USER_NAME");
				
							
				String baseUrl = "";
				Integer userid=0;
				String password="";
				String ipaddress="";
				String sessionId="";
				String username="";
				
				
				if(userSession != null)
				{
					userid = userSession.getUserId();
					username =userSession.getUserName();
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
							
				
					String responceUrl = ""+request.getRequestURL();
					//log user for successfull login
					saveUserAccessLog(userid, password, responceUrl, sessionId, ipaddress, username);
					//add UserSession object  to session
					HttpSession session = request.getSession(false);
					if(session == null)
					{
						session = request.getSession(true);
					}
					//set number of alerts for partner
					request.getSession().removeAttribute("headerName");
					Integer alerts=0;
					Integer partyId ;//= Integer.parseInt(request.getSession().getAttribute("HPartyId").toString());
					partyId = userSession.getPartyId();
					//code for hierarchy 
					model.addAttribute("hierarchy", 1);
					String nodeId = request.getSession().getAttribute("nodeId").toString();
					String alertsUrl = GET_NUMBER_OF_ALERTS_FOR_PARTYID+userSession.getUserName()+"/"+partyId+"/"+nodeId+"/token";
					BaseResponse<Integer> baseResponse = new BaseResponse<>();
					baseResponse = restTemplate.getForObject(alertsUrl, BaseResponse.class);
					alerts = baseResponse.getResponseObject();
					request.getSession().setAttribute("alerts", alerts);
					session.setAttribute("userSession", userSession);
					LOGGER.debug(userSession.getUserName() + "is authenticated successfully");
					session.setAttribute("userSession", userSession);
					LOGGER.debug(userSession.getUserName() + "is authenticated successfully");
					int buId = userSession.getBuId();
					//int partyId = userSession.getPartyId();
					String chartType = "ZimmedariScore";
		 			Integer chartCount = getDataForChart(buId, partyId, chartType,userSession.getUserName(),nodeId);
		 		//	List<ChartData> calenderData = getCalenderData(buId, partyId, "Taskbydate", userSession.getUserName(), nodeId);
		 		//	model.addAttribute("calenderData", calenderData);
					model.addAttribute("ChartCount", chartCount);
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
							((UserSession) request.getSession().getAttribute("userSession")).setLogoHeight(FiinfraUtility.getLogoHeight());
							((UserSession) request.getSession().getAttribute("userSession")).setLogoWidth(FiinfraUtility.getLogoWidth());
						} else {
							((UserSession) request.getSession().getAttribute("userSession")).setLogoHeight(50);
							((UserSession) request.getSession().getAttribute("userSession")).setLogoWidth(150);
						}
					}
					catch(Exception e) {
						
					}
					return "partner/dashboard";
				
			}catch(Exception ex){
				LOGGER.error("Error in login", ex);
			}
		
		return null;
	}

	@RequestMapping(value="/loadhome.htm")
	public String loadHome(HttpServletRequest request,
			HttpServletResponse response) {
		String redirectUrl=null;
		Boolean isForceChangePassword=false;
		String contactRecordTypeId=null;
		String contactPartyId = null;
		String contactName = null;
		
		// call stored proc for successful login
		try{
			
			String userName = (String) request.getSession().getAttribute("USER_NAME");
			contactRecordTypeId =request.getParameter("RECORD_TYPE_ID");	
			contactPartyId = request.getParameter("CONTACT_PARTYID");
			contactName = request.getParameter("CONTACT_NAME");
			
			//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String url = SUCCESSFULL_LOGIN + userName + "/" + request.getRemoteAddr();
			UserSession userSession =  restTemplate.getForObject(url, UserSession.class);
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
				LOGGER.debug("heirarchyDatas Data----------"+heirarchyDatas);
				LOGGER.debug("lstLocationData Data----------"+heirarchyDatas.getLstLocationData());
				LOGGER.debug("lstPartnerHeirarchyData Data----------"+heirarchyDatas.getLstPartnerHeirarchyData());
				request.getSession().setAttribute("lstLocationData", objectMapper.writeValueAsString(heirarchyDatas.getLstLocationData()));
				request.getSession().setAttribute("lstPartnerHeirarchyData", objectMapper.writeValueAsString(heirarchyDatas.getLstPartnerHeirarchyData()));
				}else{
					request.getSession().setAttribute("lstLocationData", null);
					request.getSession().setAttribute("lstPartnerHeirarchyData", null);
					
				}
				//request.getSession().setAttribute("HPartyId", userSession.getPartyId());
				request.getSession().setAttribute("nodeId", 0);
				request.getSession().setAttribute("HPartyId", userSession.getPartyId());
				request.getSession().setAttribute("userSession", userSession);
				request.getSession().setAttribute("oldPartyID", userSession.getPartyId());	
			
			isForceChangePassword = userSession.getIsForceChangePasswordOnLogin();
		}catch(Exception ex){
			LOGGER.error("Error in login", ex);
		}
		if(contactPartyId != null && contactRecordTypeId!=null && contactName !=null )
		{
			redirectUrl="redirect:/partner/datacollection/"+contactPartyId+"/"+contactName+"/"+contactRecordTypeId;
		}
		else if(isForceChangePassword)
		{
			redirectUrl="redirect:/password/changePassword";
		}
		else
		{
			redirectUrl="redirect:/partner/dashboard";
		}
		return redirectUrl;
		
	}
	
	@RequestMapping(value = "/profiles", method = RequestMethod.GET)
	public String getAllProfiles(HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		return "profile";
	}
	
	@RequestMapping(value = "/contact/add", method = RequestMethod.GET)
	public String showAddContactProfiles(Model model, HttpServletRequest request) {
		try {
				UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					 return "redirect:/login";
				}
			
				//get values for dropdown lists
				String token = "234";
				Integer salutationId=81;
				
				Integer addContactLink = 297;
				
				CodeValueData defaultCodeValue = new CodeValueData();
				defaultCodeValue.setCodeValueId(0);
				defaultCodeValue.setCodeValue("-- Select --");
				List<CodeValueData> codeValueList = new ArrayList<CodeValueData>();
				List<CodeValueData> salutationList = new ArrayList<CodeValueData>();
				salutationList.add(defaultCodeValue);
				String codeTypeIds = salutationId + "";
				codeValueList = getListOfCodeValueData(codeTypeIds, userSession.getUserName(),userSession.getBuId(), token);
				if(codeValueList != null)
				{
					for (CodeValueData codeValueData : codeValueList) 
					{
						if(codeValueData.getCodeTypeId() == salutationId )
						{
							salutationList.add(codeValueData);
						}
						
					}
				}
				
				String addContact = "";
				addContact = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(), userSession.getUserName(), userSession.getBuId(), addContactLink);
				
				model.addAttribute("salutationList", salutationList);
				model.addAttribute("party", new Party());
				model.addAttribute("formAction","contact/create");
				model.addAttribute("roleBaseLinks",addContact);
				return "partner/contact/add";
			}
		catch (Exception exception) {
			LOGGER.error("Error in loading page");
			return "redirect:/partner/contacts";
		}
		
		
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/contact/create", method = RequestMethod.POST)
	public ModelAndView createContactProfiles(@ModelAttribute Party party, HttpServletRequest request, final RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = null;
		UserSession userSession = null;
		try {
			userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				modelAndView = new ModelAndView("redirect:/login");
			}
			//changes for Hierarchy  
			Integer ownerPartyId =  userSession.getPartyId();
			Integer buId = userSession.getBuId();
			Integer createdBy = userSession.getUserId();
			String token = "12345";
			
			party.setOwnerPartyId(ownerPartyId);
			
			party.setRecordTypeId(14005); // Set's record type as "opportunity"
			party.setPartyUserMapTypeId(41003); // Set's usermap type id as Party2Party
			party.setCurrentStageId(7006);//set's current stage ID to "OPEN"
			party.setCreatedBy(createdBy);
			party.setOppotunityStatusId(6002);
			
			Address address = new Address();
			address.setAddressTypeId(9001);
			List<Address> addressList = new ArrayList<Address>();
			addressList.add(address);
			party.setAddressList(addressList);
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(ADD_PARTY_INFO+ userSession.getUserName()+"/" + token);
			uriCB.queryParam("buId", buId);
			String eventXML = "SP_SAVE_PARTY("+party.getRecordTypeId()+","+party.getOwnerPartyId()+","+address.getAddressTypeId()+","+party.getLastName()+","+
					party.getFirstName()+","+party.getSalutationId()+","+party.getCompanyName()+","+party.getContactMobile1()+","+party.getContactMobile2()+","+party.getContactEmail1()+","+
					party.getWorkDesignation()+","+party.getWorkProfession()+","+party.getDob()+","+party.getGenderId()+","+party.getMaritalStatusID()+","+party.getCampaignName()+","+party.getContactSourceTypeID()+","+
					party.getContactReferalName()+","+party.getPanNumber()+","+address.getStreet1()+","+address.getStreet2()+","+address.getStreet3()+","+address.getPostalCode()+","+
					address.getCityId()+","+address.getStateId()+","+address.getCountryId()+","+party.getCurrentStageId()+","+createdBy+","+userSession.getUserId()+","+party.getBuPartyId()+","+party.getOppotunityStatusId()+")";
			BaseResponse<Party> br = new BaseResponse<Party>();
			br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), party, BaseResponse.class);
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				redirectAttributes.addFlashAttribute("success", "success.contact.create");
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_ADDED_OPPORTUNITY, CONTACT_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_ADD_CONTACT,eventXML);				
				modelAndView = new ModelAndView("redirect:/partner/contacts");							
			} else {
				redirectAttributes.addFlashAttribute("error", "error.contact.create");
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_ADD_OPPORTUNITY_FAILED, CONTACT_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_ADD_CONTACT,eventXML);
				modelAndView = new ModelAndView("partner/contact/add");
			}						
		} catch (Exception ex) {
			modelAndView = new ModelAndView("partner/contact/add");
			modelAndView.addObject("error", "Error creating Contact, please try again later.");
			LOGGER.error("Error creating contacts : ", ex);
			return modelAndView;
		}
		return modelAndView;
	}

	@RequestMapping(value = "/profile/{partyId}/{name}", method = RequestMethod.GET)
	public String showProfile(@PathVariable String partyId, @PathVariable("name") String headerName, Model model,HttpServletRequest request) {
		LOGGER.info("Loading Profile Information");

		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 332);// profile links
			model.addAttribute("rbsLinks",rbsLinks);
			Party party = new Party();			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PARTY_PROFILE + "/"+userSession.getUserName()+"/" + partyId + "/1");
			BaseResponse<Party> br = new BaseResponse<Party>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				party = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Party.class);
			}
			String offeringClass[] = {"retirement_planning","succession_planning","tax_planning","mutual_funds",
					"life_insurance","general_insurance","loans","other_value-added","other_investment"};
			String offeringNames[] = {"Retirement Planning","Succession Planning","Tax Planning","Mutual Funds",
					"Life Insurance","General Insurance","Loans","Other Value-Added Services","Other Investment Products"};
			model.addAttribute("offeringNames", offeringNames);
			model.addAttribute("partyId", partyId);
			model.addAttribute("party", party);
			model.addAttribute("offeringClass", offeringClass);
			Integer familyMembers = party.getAssociatedParties().size();
			if(familyMembers<3)
			{
				for(int i=familyMembers;i<3;++i)
				{
					Party familyMember = new Party();
					party.getAssociatedParties().add(familyMember);
				}
				model.addAttribute("familyDetailsSize", 3);
				

			}
			else
			{
				model.addAttribute("familyDetailsSize", familyMembers);
			}
			//get values for dropdown lists
			String token = "234";
			Integer salutationId=81;
			Integer maritalStatus=13;
			Integer contactSourceTypeId=4;
			Integer occupationId = 65;
			Integer countryId = 3;
			Integer nextActionId = 8;
			Integer OpportunityStatusID=6;
			
			CodeValueData defaultCodeValue = new CodeValueData();
			defaultCodeValue.setCodeValueId(0);
			defaultCodeValue.setCodeValue("---Select---");
			List<CodeValueData> codeValueList = new ArrayList<CodeValueData>();
			List<CodeValueData> salutationList = new ArrayList<CodeValueData>();
			salutationList.add(defaultCodeValue);
			List<CodeValueData> maritalStatusList = new ArrayList<CodeValueData>();
			maritalStatusList.add(defaultCodeValue);
			List<CodeValueData> contactSourceList = new ArrayList<CodeValueData>();
			contactSourceList.add(defaultCodeValue);
			List<CodeValueData> occupationList = new ArrayList<CodeValueData>();
			occupationList.add(defaultCodeValue);
			List<CodeValueData> countryList = new ArrayList<CodeValueData>();
			countryList.add(defaultCodeValue);
			List<CodeValueData> nextActionList = new ArrayList<CodeValueData>();
			nextActionList.add(defaultCodeValue);
			List<CodeValueData> OpportunityStatusList = new ArrayList<CodeValueData>();
			OpportunityStatusList.add(defaultCodeValue);
			String codeTypeIds = salutationId+","+maritalStatus+","+contactSourceTypeId+","+occupationId+","+countryId+","+nextActionId+","+OpportunityStatusID;
			codeValueList = getListOfCodeValueData(codeTypeIds, userSession.getUserName(),userSession.getBuId(), token);
			if(codeValueList != null)
			{
				for (CodeValueData codeValueData : codeValueList) 
				{
					if(codeValueData.getCodeTypeId() == salutationId )
					{
						salutationList.add(codeValueData);
					}
					else if(codeValueData.getCodeTypeId() == maritalStatus)
					{
						maritalStatusList.add(codeValueData);
					}
					else if(codeValueData.getCodeTypeId() == contactSourceTypeId)
					{
						contactSourceList.add(codeValueData);
					}
					else if(codeValueData.getCodeTypeId() == occupationId)
					{
						occupationList.add(codeValueData);
					}
					else if(codeValueData.getCodeTypeId() == countryId)
					{
						countryList.add(codeValueData);
					}
					
					else if(codeValueData.getCodeTypeId() == nextActionId)
					{
						nextActionList.add(codeValueData);
					}
					else if(codeValueData.getCodeTypeId() == OpportunityStatusID)
					{
						OpportunityStatusList.add(codeValueData);
					}
				}
			}
			model.addAttribute("salutationList", salutationList);
			model.addAttribute("maritalStatusList", maritalStatusList);
			model.addAttribute("contactSourceList", contactSourceList);
			model.addAttribute("occupationList", occupationList);
			model.addAttribute("countryList", countryList);
			model.addAttribute("nextActionList", nextActionList);
			model.addAttribute("OpportunityStatusList", OpportunityStatusList);
		
		}catch(Exception ex){
			LOGGER.error("Error occured while retrieving party details : ", ex);
		}
		return "partner/profile";
	}
	
	@RequestMapping(value = "/edit/{partyId}/{name}", method = RequestMethod.GET)
	public String editProfile(@PathVariable("partyId") String partyId,@PathVariable("name") String headerName , Model model,HttpServletRequest request) 
	{
	LOGGER.info("Loading Profile Information");

		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			
				
			Party party = new Party();			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PARTY_PROFILE+"/" +userSession.getUserName() + "/" + partyId + "/1");
			BaseResponse<Party> br = new BaseResponse<Party>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				party = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Party.class);
			}
			
			//to set headerUserName
			if (party.getRecordTypeId() != null) {
				if (party.getRecordTypeId() == 14006) {
					headerName = headerName + " (Client)";
				} else if (party.getRecordTypeId() == 14005) {
					headerName = headerName + " (Opportunity)";
				} else if (party.getRecordTypeId() == 14007) {
					headerName = headerName + " (Premium Client)";
				}
				request.getSession().setAttribute("headerName", headerName);
			}
			
			//get values for dropdown lists
			String token = "234";
			Integer salutationId=81;
			
			CodeValueData defaultCodeValue = new CodeValueData();
			defaultCodeValue.setCodeValueId(0);
			defaultCodeValue.setCodeValue("---Select---");
			List<CodeValueData> codeValueList = new ArrayList<CodeValueData>();
			List<CodeValueData> salutationList = new ArrayList<CodeValueData>();
			salutationList.add(defaultCodeValue);
			String codeTypeIds = salutationId + "";
			codeValueList = getListOfCodeValueData(codeTypeIds, userSession.getUserName(),userSession.getBuId(), token);
			if(codeValueList != null)
			{
				for (CodeValueData codeValueData : codeValueList) 
				{
					if(codeValueData.getCodeTypeId() == salutationId )
					{
						salutationList.add(codeValueData);
					}					
				}
			}
			
			Integer editContactLink = 298;
			String editContact = "";
			editContact = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(), userSession.getUserName(), userSession.getBuId(), editContactLink);
			
			model.addAttribute("salutationList", salutationList);
			model.addAttribute("partyId", partyId);
			model.addAttribute("party", party);			
			model.addAttribute("formAction","contact/update");
			model.addAttribute("cancel", request.getContextPath() + "/partner/contacts");
			model.addAttribute("roleBaseLinks",editContact);
			
 		}catch(Exception ex){
			LOGGER.error("Error occured while retrieving party details : ", ex);
		}
		return "edit/profile";
	}
	
	@RequestMapping(value = "/profile/update", method = RequestMethod.POST)
	public ModelAndView updatePartnerProfile(@ModelAttribute Party party,Model model, 
			final RedirectAttributes redirectAttributes, HttpServletRequest request) {
		
		ModelAndView modelAndView = null;
		String headerName = party.getFirstName() + " " + party.getLastName();
		if (party.getRecordTypeId() != null) {
			if (party.getRecordTypeId() == 14006) {
				headerName = headerName + " (Client)";
			} else if (party.getRecordTypeId() == 14005) {
				headerName = headerName + " (Opportunity)";
			} else if (party.getRecordTypeId() == 14007) {
				headerName = headerName + " (Premium Client)";
			}
			request.getSession().setAttribute("headerName", headerName);
		}

		if(request.getParameter("nextPageUrl")!="")
		{
		 modelAndView = new ModelAndView("redirect:"+request.getParameter("nextPageUrl"));
		}else
		{
		 modelAndView = new ModelAndView("redirect:/partner/profile/" + party.getId()+"/"+request.getSession().getAttribute("headerName"));
		}
		
		UserSession session = (UserSession) request.getSession().getAttribute("userSession");
		Integer createdId = session.getUserId();
		//to set current stage id to partially activated activated
		UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7007/"+party.getId()+"/342");
		uri.queryParam("buId", session.getBuId());
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);

		String activeTab = request.getParameter("refer"); 
		List<PartyAttribute> partyAttributes =  new ArrayList<PartyAttribute>();;
		
		for(int i=91007;i<=91015;i++){
			LOGGER.debug(i + " :: " + request.getParameter(i + "_value"));
			String attributeId = request.getParameter(i + "_value");
			if (attributeId !=null) {
				if (attributeId.equals(Integer.toString(1))) {
					PartyAttribute partyAttribute = new PartyAttribute();
					partyAttribute.setAttributeCodeID(i);
					partyAttribute.setAttributeValue(1);
					partyAttribute.setCreatedBy(createdId);
					partyAttribute.setPartyId(party.getId());
					partyAttribute.setValueDataTypeID(37002);//for Integer
					partyAttributes.add(partyAttribute);
				} else {
					PartyAttribute partyAttribute = new PartyAttribute();
					partyAttribute.setAttributeCodeID(i);
					partyAttribute.setAttributeValue(0);
					partyAttribute.setCreatedBy(createdId);
					partyAttribute.setPartyId(party.getId());
					partyAttribute.setValueDataTypeID(37002);//for Integer
					partyAttributes.add(partyAttribute);
				}
			}
		}
		party.setPartyAttributes(partyAttributes);
		
		try {
			party.setDob(DateUtil.getTimeStampForNewFormat(party.getDobAsString()));					
			
			
			List<Party> associatedParties = new ArrayList<Party>();
	//		Map<String, Object> models = model.asMap();
	//		Object familyDetailsSize = models.get("familyDetailsSize");
			Integer size =Integer.parseInt(request.getParameter("familyDetailsSize"));
			for (int i=0;i<size;i++) {
				if(request.getParameter("firstName"+i) == null){
					continue;
				}
				Party familyMember = new Party();
				LOGGER.debug("\n------------------------Family member" + (i+1) + "----------------------------");
				LOGGER.debug("Party Id : " + request.getParameter("partyId"+i));
				LOGGER.debug("RelatedPartyId Id : " + request.getParameter("relatedPartyId"+i));
				LOGGER.debug("firstName  : " + request.getParameter("firstName"+i));
				LOGGER.debug("lastName  : " + request.getParameter("lastName"+i));
				LOGGER.debug("dob  : " + request.getParameter("dob"+i));
				LOGGER.debug("relation  : " + request.getParameter("relation"+i));	
				
				if(request.getParameter("partyId"+i) == null){
					familyMember.setId(party.getId());
				}else{
					familyMember.setId(Integer.parseInt(request.getParameter("partyId"+i)));
				}
				
				if(request.getParameter("relatedPartyId"+i) !="" && request.getParameter("relatedPartyId"+i) != null)
				{
					familyMember.setRelatedPartyId(Integer.parseInt(request.getParameter("relatedPartyId"+i)));
				}
				familyMember.setFirstName(request.getParameter("firstName"+i));
				familyMember.setLastName(request.getParameter("lastName"+i));
				if(request.getParameter("dob"+i) != null)
				{
					familyMember.setDob(DateUtil.getTimeStampForNewFormat(request.getParameter("dob"+i)));
				}
				if(request.getParameter("panNo"+i) != null)
				{
					familyMember.setPanNumber(request.getParameter("panNo"+i));
				}
				if(request.getParameter("relation"+i) != null && !(request.getParameter("relation"+i).equals("")))
				{
					familyMember.setRelationshipId(Integer.parseInt(request.getParameter("relation"+i)));
				}
				if(request.getParameter("workProfession"+i) != null && !(request.getParameter("workProfession"+i).equals("")))
				{
					familyMember.setWorkProfession(request.getParameter("workProfession"+i));
				}
				familyMember.setRecordTypeId(14010);//Set record type as family
				associatedParties.add(familyMember);
			}
			party.setAssociatedParties(associatedParties);
			
			if(!CollectionUtils.isEmpty(party.getAddressList()))
			{
				for (Address address : party.getAddressList()) 
				{
					address.setAddressTypeId(9001); // Set residential address
				}
				
			}
			
			if(!CollectionUtils.isEmpty(party.getAssociatedParties()))								
			{
				for (Party familyMember : party.getAssociatedParties()) 
				{
					familyMember.setRecordTypeId(14010); // Set record type as Family
					familyMember.setPartyUserMapTypeId(41003); // Set party user type as Party2Party 
				}				
			}			
			
			String token = "153443";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(UPDATE_PARTY_INFO+session.getUserName() +"/"+ token);
			uriCB.queryParam("buId", session.getBuId());
			BaseResponse<Party> br = new BaseResponse<Party>();
			br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), party, BaseResponse.class);
			String eventXML = "usp_DIY_updatePartyDetails("+party.getId()+","+party.getLastName()+","+party.getMiddleName()+","+party.getFirstName()+","+
				party.getSalutationId()+","+party.getCompanyName()+","+party.getContactMobile1()+","+party.getContactMobile2()+","+party.getContactEmail1()+","+party.getWorkDesignation()+","+
				party.getWorkProfession()+","+ party.getWorkCompanyName()+","+party.getDob()+","+party.getGenderId()+","+party.getMaritalStatusID()+","+party.getCampaignName()+","+
				party.getContactSourceTypeID()+","+party.getContactReferalName()+","+party.getConvertProbablity()+","+party.getOppotunityRatingId()+","+
				party.getOppotunityStatusId()+","+party.getNextActionId()+","+session.getUserId()+","+party.getBuPartyId()+","+party.getPanNumber()+")";
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{				
				redirectAttributes.addFlashAttribute("success", "success.profile.update");
				audit(session.getPartyId(), session.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_UPDATED_PERSONAL_INFORMATION, DC_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_PERSONAL_INFORMATION,eventXML);
				redirectAttributes.addFlashAttribute("activeTab", activeTab);
			} else {
				redirectAttributes.addFlashAttribute("error", "error.profile.update");
				audit(session.getPartyId(), session.getUserId(), FiinfraConstants.DIY_PERSONAL_INFORMATION_UPDATE_FAILED, DC_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_PERSONAL_INFORMATION,eventXML);
			}						
		} catch (Exception ex) {
			redirectAttributes.addFlashAttribute("error", "error.profile.update");
			LOGGER.error("Error creating contacts : ", ex);
			return modelAndView;
		}
		return modelAndView;
	}

	@RequestMapping(value="/deleteFamilyMember", method=RequestMethod.POST)
	public @ResponseBody Integer deleteFamilyMember(HttpServletRequest request)
	{
		UserSession session = (UserSession) request.getSession().getAttribute("userSession");
		String partyId =request.getParameter("partyId");
		String familyPartyId =request.getParameter("familyPartyId");
		String token = "dfd23";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(DELETE_FAMILY_MEMBER+(String)request.getSession().getAttribute("USER_NAME") 
				+"/"+partyId+"/"+familyPartyId+"/"+ token);
		uriCB.queryParam("buId", session.getBuId());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		return br.getResponseObject();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/contact/update", method = RequestMethod.POST)
	public ModelAndView updatecontact(@ModelAttribute Party party, HttpServletRequest request, final RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/partner/contacts");
		
		UserSession session = (UserSession) request.getSession().getAttribute("userSession");
				
		try {
			party.setDob(DateUtil.getTimeStampForNewFormat(party.getDobAsString()));					
			if(!CollectionUtils.isEmpty(party.getAddressList()))
			{
				for (Address address : party.getAddressList()) 
				{
					address.setAddressTypeId(9001); // Set residential address
				}
				
			}
			
			String token = "153443";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(UPDATE_PARTY_INFO_FOR_CONTACT+session.getUserName()+"/" + token);
			uriCB.queryParam("buId", session.getBuId());
			BaseResponse<Party> br = new BaseResponse<Party>();
			br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), party, BaseResponse.class);
			String eventXML = "usp_DIY_updatePartyDetailsForContact("+party.getId()+","+party.getLastName()+","+party.getMiddleName()+","+party.getFirstName()+","+
					party.getSalutationId()+","+party.getCompanyName()+","+party.getContactMobile1()+","+party.getContactMobile2()+","+party.getContactEmail1()+","+party.getWorkDesignation()+","+
					party.getWorkProfession()+","+ party.getWorkCompanyName()+","+party.getDob()+","+party.getGenderId()+","+party.getMaritalStatusID()+","+party.getCampaignName()+","+
					party.getContactSourceTypeID()+","+party.getContactReferalName()+","+party.getConvertProbablity()+","+party.getOppotunityRatingId()+","+
					party.getNextActionId()+","+session.getUserId()+","+party.getBuPartyId()+","+party.getPanNumber()+")";
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{				
				redirectAttributes.addFlashAttribute("success", "success.contact.update");
				audit(session.getPartyId(), session.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_UPDATED_CONTACT, CONTACT_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_UPDATE_CONTACT,eventXML);
			
			} else {
				redirectAttributes.addFlashAttribute("error", "error.contact.update");
				audit(session.getPartyId(), session.getUserId(), FiinfraConstants.DIY_UPDATE_CONTACT_FAILED, CONTACT_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_UPDATE_CONTACT,eventXML);
			}						
		} catch (Exception ex) {
			redirectAttributes.addFlashAttribute("error", "error.contact.update");
			LOGGER.error("Error creating contacts : ", ex);
			return modelAndView;
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/profile/delete", method = RequestMethod.POST)
	public PartnerProfile deletePartnerProfile(@QueryParam("id") int profileId) {
		return null;
	}
	
	@RequestMapping(value = "/contact/delete", method = RequestMethod.POST )
	public @ResponseBody String deleteContactProfile(HttpServletRequest request,  RedirectAttributes redirectAttributes) 
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession"); 
		Integer buId = userSession.getBuId();
		String token = "1234";
		String ids = request.getParameter("checkedIds");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(DELETE_CONTACTS+userSession.getUserName() +"/"+ids+"/"+ token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), null, BaseResponse.class);
		String eventXML  = "usp_DIY_deletePartyForPartyId("+ids+")";
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_CONTACT_DELETED_SUCCESSFULLY, CONTACT_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_DELETE_CONTACT,eventXML);
			redirectAttributes.addFlashAttribute("success", "success.contact.delete");
		}
		else{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_CONTACT_DELETE_FAILED, CONTACT_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_DELETE_CONTACT,eventXML);
			redirectAttributes.addFlashAttribute("error", "error.contact.delete");
		}
		return "success";
	}	
	
	@RequestMapping("/activateDCT")
	public String activateDCT(HttpServletRequest request,HttpServletResponse response,final RedirectAttributes redirectAttributes)
	{
		String token = "23ds";
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		Integer numberOfcontacts = 0;
		/*String partyId= request.getParameter("partyId");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(ACTIVATE_DCT+userSession.getUserName() +"/"+partyId+"/"+ token);
		uriCB.queryParam("buId", userSession.getBuId());
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), null, BaseResponse.class);
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			redirectAttributes.addFlashAttribute("success", "DCT is activated successfully");
			return "redirect:/partner/contacts";
		}
		else
		{
			redirectAttributes.addFlashAttribute("success", "DCT is activated successfully");
			return "redirect:/partner/contacts";
		}*/
		try {
			UserData userData = new UserData();
			Integer createdBy = userSession.getUserId();
			Integer roleId=0;
			Integer buId=userSession.getBuId();
			userData.setCreatedBy(createdBy);
			userData.setBuID(buId);
			String url = FiinfraUtility.getRestDBURL();
			url = URL_INSERT_DC_ACTIVATION_RECORD + userSession.getUserName() + "/1234";
			ObjectMapper om = new CustomJacksonObjectMapper();
			String jsonString=om.writeValueAsString(userData);
			LOGGER.debug("jsonString:---"+jsonString);
			/*Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
					.currentThread().getStackTrace()[1].getMethodName());
*/
			String partyIds=request.getParameter("partyId");
			String userDataXML="<Root>";
			String[] partyIdArray=partyIds.split(",");
			numberOfcontacts = (partyIdArray.length-1);
			int noOfCAPSAlpha = 1;
			int noOfDigits = 1;
			int noOfSplChars = 1;
			int minLen = 8;
			int maxLen = 15;
			Map<Integer,String> passwordMap=new HashMap<>();
			for(String partyId:partyIdArray){
				String hexString = null;
				
				char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
						noOfCAPSAlpha, noOfDigits, noOfSplChars);
				hexString = new String(pswd);
				LOGGER.debug("hexString is-----" + hexString);
				MD5Encryption md5Encryption = new MD5Encryption();
				//String encryptrdPassword = md5Encryption.encrypt(hexString);
				String encryptrdPassword = passwordEncoder.encodePassword(hexString, null);
				userDataXML+="<User>";
				userDataXML+="<userPassword>"+encryptrdPassword+"</userPassword>";
				userDataXML+="<partyid>"+partyId+"</partyid>";
				userDataXML+="<RoleId>"+roleId+"</RoleId>";
				userDataXML+="</User>";
				passwordMap.put(Integer.valueOf(partyId), hexString);
			}
			userDataXML+="</Root>";
			userData.setUserDataXML(userDataXML);
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			LOGGER.debug("In WEb DC Activation......");
			br = restTemplate.postForObject(url, userData, BaseResponse.class);
			String eventXML = "usp_cp_BulkDCActivateOpportunities("+userData.getUserDataXML()+")";
			List<Integer> resultList=new ArrayList<>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_DC_ACIVATE_SUCCESSFUL,DC_ACTIVATE_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_DC_ACTIVATION,eventXML);
				resultList = br.getResponseListObject();
		}
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			if(objectMapper.readValue(
					objectMapper.writeValueAsString(resultList.get(0)),
					Integer.class)>0){
			Notification notification=null;
			for(Map.Entry<Integer,String> map:passwordMap.entrySet()){
				Map<String,String> payloadMap=new HashMap<String, String>();
				payloadMap.put("Password",map.getValue());
				notification=new Notification();
				notification.setSourceSystemID(FiinfraConstants.DIY);
				notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
				notification.setNotifyPartyID(map.getKey());
				notification.setNotifyEventID(FiinfraConstants.DC_ACTIVATION);
//			notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
				notification.setBuId(buId);
				notification.setPayloadMap(payloadMap);
				notification.setSessionID(request.getSession().getId());
				FrameworkUtil.notify(notification);
				}
			}
			//redirectAttributes.addFlashAttribute("success", "DCT is activated successfully for "+numberOfcontacts+" contact/s");
			redirectAttributes.addFlashAttribute("result", resultList);
			return "redirect:/partner/contacts";	
		} 
		catch (Exception exception) {
			LOGGER.debug("error while activating DCT "+exception);
			//audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_DC_ACIVATE_FAILED,DC_ACTIVATE_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_DC_ACTIVATION);
			redirectAttributes.addFlashAttribute("error", "error.activateDC");
			return "redirect:/partner/contacts";
		}

		
	}
	
	@RequestMapping("/contact/moveContacts")
	public  String moveContacts(HttpServletRequest request,final RedirectAttributes redirectAttributes){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String listOfPartyIds =  request.getParameter("checkedIds");
		String partnerPartyID = request.getParameter("partnerPartyId");
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
			redirectAttributes.addFlashAttribute("success",1);
			/*if ((br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) || (br.getStatus().equalsIgnoreCase(null)))
			{
				redirectAttributes.addFlashAttribute("success",1);
			}
			else{
				redirectAttributes.addFlashAttribute("success",0);
			}*/
		}
				
		return "redirect:/partner/contacts";
	}
	
	
	@RequestMapping("/XRayActivation")
	public String xrayActivation(HttpServletRequest request, final RedirectAttributes redirectAttributes){
		try {
			String token = "swe3";
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			String listOfPartyIDs = request.getParameter("partyIDs");
			UserData userData = new UserData();
			userData.setPartyId(userSession.getPartyId());
			userData.setPartyIds(listOfPartyIDs);
			userData.setCreatedBy(userSession.getUserId());
			userData.setBuID(userSession.getBuId());
			
			//created password for contacts
			
			String userDataXML="<Root>";
			String[] partyIdArray=listOfPartyIDs.split(",");
			int noOfCAPSAlpha = 1;
			int noOfDigits = 1;
			int noOfSplChars = 1;
			int minLen = 8;
			int maxLen = 15;
			Map<Integer,String> passwordMap=new HashMap<>();
			for(String partyId:partyIdArray){
				String hexString = null;
				
				char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
						noOfCAPSAlpha, noOfDigits, noOfSplChars);
				hexString = new String(pswd);
				MD5Encryption md5Encryption = new MD5Encryption();
				String encryptrdPassword = passwordEncoder.encodePassword(hexString, null);
				userDataXML+="<User>";
				userDataXML+="<userPassword>"+encryptrdPassword+"</userPassword>";
				userDataXML+="<partyid>"+partyId+"</partyid>";
				userDataXML+="<RoleId>"+userSession.getRoleId()+"</RoleId>";
				userDataXML+="</User>";
				passwordMap.put(Integer.valueOf(partyId), hexString);
			}
			userDataXML+="</Root>";
			userData.setUserDataXML(userDataXML);
			
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(XRAY_ACTIVATION+userSession.getUserName() +"/"+ token);
			BaseResponse<String> br = new BaseResponse<String>();
			br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), userData, BaseResponse.class);
			List<String> resultList = new ArrayList<>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				resultList = br.getResponseListObject();
				if(Integer.valueOf(resultList.get(0))>0){
					String alreadyActivatedPartyIds=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(2)),String.class);
					String [] listOfPartyId = listOfPartyIDs.split(",");
					for(Entry<Integer, String> map:passwordMap.entrySet()){
						Map<String,String> payloadMap=new HashMap<String, String>();
						int partyId=map.getKey();
						if(alreadyActivatedPartyIds.contains(String.valueOf(partyId))){
							payloadMap.put("Password","You can use your current password to login.");
						}else{
							payloadMap.put("Password",map.getValue());
						}
						Notification notification=null;
						notification=new Notification();
						notification.setSourceSystemID(FiinfraConstants.DIY);
						notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
						notification.setNotifyPartyID(partyId);
						notification.setNotifyEventID(FiinfraConstants.XRAY_ACTIVATION);
						notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
						notification.setBuId(userSession.getBuId());
						notification.setPayloadMap(payloadMap);
						notification.setSessionID(request.getSession().getId());
						FrameworkUtil.notify(notification);			
				
					}
					
					
				}
				redirectAttributes.addFlashAttribute("isActivated", resultList.get(0));
				redirectAttributes.addFlashAttribute("activateFor", resultList.get(1));
				String eventXML = "usp_cp_saveXRayActivationDetails("+listOfPartyIDs+","+userSession.getUserId()+")";
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_X_RAY_ACTIVATION, DC_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_PERSONAL_INFORMATION,eventXML);
			}
		}catch (Exception e) {
			LOGGER.debug("Error while activating Xray "+e.getMessage()); //e.printStackTrace();
		}
		return "redirect:/partner/contacts";
	}
	
	
	/*************** Code for Data Collection Screens *************/
	
	public String getXmlForSectionType(String sectionType, HttpServletRequest request){
		BufferedReader bufferedReader = null;
		StringBuilder strBuilder = new StringBuilder();
		try {
			ServletContext servletContext = request.getSession().getServletContext();			
			String absoluteDiskPath = servletContext.getRealPath(DC_XML);
			
			bufferedReader = new BufferedReader(new FileReader(absoluteDiskPath));
			String sCurrentLine;
			
			
			boolean isRequiredSectionFound = false;
			
			while ((sCurrentLine = bufferedReader.readLine()) != null) {
								
				if(!isRequiredSectionFound && sCurrentLine.indexOf("<Section")!=-1 && sCurrentLine.contains(sectionType)){
					isRequiredSectionFound = true;
				}
								
				if(isRequiredSectionFound){
					strBuilder.append(sCurrentLine);
					strBuilder.append("\n");
					
					if(sCurrentLine.indexOf("</Section>")!=-1){
						break;
					}
				}				
			}			
		} catch (FileNotFoundException fileNotFoundException) {
			LOGGER.error("File not present", fileNotFoundException);			
		} catch (IOException ioException) {
			LOGGER.error("Error occured while reading file", ioException);
		}			
		finally{
			if(bufferedReader != null)
				try {
					bufferedReader.close();
				} catch (IOException e) {
					LOGGER.error("Error occured while closing connection", e);
				}
		}
		LOGGER.debug("Xml for section type " + sectionType + " is " + strBuilder.toString());
		return strBuilder.toString();
	}
	
	@RequestMapping(value="/toolSelection",method=RequestMethod.GET)
	public String getToolSelection(Model model,HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String partyId = request.getParameter("partyId");
		String contactName = request.getParameter("name");
		String recordType = request.getParameter("recordType");
		Integer selectedDCTool=null;
		String token = "token";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PLAN_TYPE+ userSession.getUserName()+"/" + token);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", userSession.getBuId());
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			selectedDCTool = br.getResponseObject();
			
		}
		model.addAttribute("selectedDCTool", selectedDCTool);
		model.addAttribute("headerName", contactName);
		model.addAttribute("contactPartyId", partyId);
		model.addAttribute("recordTypeId", recordType);
		LOGGER.debug("selectedDC Tool: "+selectedDCTool);
		return "dcTool";
	}
	
	@RequestMapping(value="/updateDcTool", method=RequestMethod.GET)
	public ModelAndView updateDCTool(Model model,HttpServletRequest request){
		String redirectURL;
		try {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			String partyId = request.getParameter("partyId");
			String contactName = request.getParameter("name");
			String recordType = request.getParameter("recordType");
			String dcToolID = request.getParameter("selectedDCTool");
			String dcToolFeeder = request.getParameter("dcToolFeeder");
			redirectURL = "redirect:";
			//get inflation rate
			String inflationrate;
			List<AdviceAssumption> adviceAssumptions = getAssumptions((Integer)userSession.getBuId(), (Integer)userSession.getPartyId(),Integer.valueOf(partyId),"98047");
			inflationrate = (String) (adviceAssumptions.get(0)).getAssumptionValue();
			String token = "abc";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_PLAN_TYPE+ userSession.getUserName()+"/" + token);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("buId", userSession.getBuId());
			uriCB.queryParam("planTypeId", dcToolID);
			
			BaseResponse<Boolean> br = new BaseResponse<>();
			br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			String userName = (String) request.getSession().getAttribute("USER_NAME");
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				/*if(dcToolFeeder.equalsIgnoreCase("PP"))
				{
					//partner portal
					UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(PP_DC_TOOL_LINK);
					uri.queryParam("TOKEN", token);
					uri.queryParam("USER_NAME", userName);
					uri.queryParam("partyId", partyId);
					uri.queryParam("buId", userSession.getBuId());
					uri.queryParam("opportunityName", contactName);
					uri.queryParam("createdBy", userSession.getUserId());
					uri.queryParam("roleId", userSession.getRoleId());
					uri.queryParam("userName", userName);
					uri.queryParam("theme", userSession.getThemeName());
					uri.queryParam("inflationRate", inflationrate);
					uri.queryParam("partnerName", userSession.getName());
					redirectURL += FiinfraUtility.getURLWithParams(uri);
					request.getSession().invalidate();
				}*/
				if(dcToolFeeder.equalsIgnoreCase("QD")) {
					redirectURL += "/partner/quickDC/"+partyId+"/"+contactName+"/"+recordType;
				}
				else{
					redirectURL += "/partner/datacollection/"+partyId+"/"+contactName+"/"+recordType;
				}
				return new ModelAndView(redirectURL);
			}
		} catch (Exception e) {
			LOGGER.debug("Error "+e.getMessage());
		}
		return null;
	}
	
	
	@RequestMapping(value = "/datacollection/{partyId}/{name}/{recordType}", method = RequestMethod.GET)
	public String getDataCollection(@PathVariable("partyId") String partyId, @PathVariable("name") String headerName, 
			@PathVariable("recordType") Integer recordTypeID,Model model, HttpServletRequest request) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 331);// Data Collection links
		model.addAttribute("rbsLinks",rbsLinks);
		request.getSession().setAttribute("dcMenuLinks", rbsLinks);
		model.addAttribute("partyId", partyId);
		//to set current stage id to DCT activated
		UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7001/"+partyId+"/342");
		uri.queryParam("buId", userSession.getBuId());
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
		
		//to set headerUserName
		if (recordTypeID != null) {
			if (recordTypeID == 14006) {
				headerName = headerName + " (Client)";
			} else if (recordTypeID == 14005) {
				headerName = headerName + " (Opportunity)";
			} else if (recordTypeID == 14007) {
				headerName = headerName + " (Premium Client)";
			}
		}
		String token = "token";
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append(GET_NUMBER_OF_GOALS_FOR_PARTYID);
		strBuilder.append(partyId);
		strBuilder.append("/");
		strBuilder.append(userSession.getUserName());
		strBuilder.append("/");
		strBuilder.append(token);
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(strBuilder.toString());
		uriCB.queryParam("buId", userSession.getBuId());
		BaseResponse<String> baseResponse = new BaseResponse<String>();
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				
		String dcStatus = baseResponse.getResponseObject();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			model.addAttribute("numberOfGoals", dcStatus);
		}
		
		String [] dcStatusArr = dcStatus.split("_");
		
		if(dcStatusArr[1].equals("1")){
			model.addAttribute("retirement", 1);
		}
		if(dcStatusArr[2].equals("1") && dcStatusArr[3].equals("1") ){
			model.addAttribute("cashflow", 1);
		}
		if(dcStatusArr[4].equals("1")){
			model.addAttribute("emergency", 1);
		}
		if(dcStatusArr[5].equals("1")){
			model.addAttribute("risk", 1);
		}
		if(dcStatusArr[6].equals("1")){
			model.addAttribute("personalInfo", 1);
		}
		
		
		//add fpsection value to session
		//String fpSection = getFpSection(request, partyId);
		String fpSection = dcStatusArr[9];
		request.getSession().removeAttribute("fpSection");
		request.getSession().setAttribute("fpSection", fpSection);
		saveSectionIdToSession(request);
		
		/*token = "token";
		 strBuilder = new StringBuilder();
		strBuilder.append(GET_PLAN_TYPE);
		strBuilder.append(userSession.getUserName());
		strBuilder.append("/");
		strBuilder.append(token);
		strBuilder.append("?partyId=" + partyId);
		strBuilder.append("&buId=" + userSession.getBuId());		
		 uriCB = UriComponentsBuilder.fromHttpUrl(strBuilder.toString());
		
		BaseResponse<Integer> baseResponse1 = new BaseResponse<Integer>();
		baseResponse1 = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		*/		
		//Integer planType = baseResponse1.getResponseObject();
		Integer planType =Integer.valueOf(dcStatusArr[10]);
		/*if (baseResponse1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{*/
			((UserSession) request.getSession().getAttribute("userSession")).setPlanTypeId(planType);
		//}
				
		//add header name to session		
		request.getSession().setAttribute("headerName", headerName);				
		if(planType.equals(FiinfraConstants.DETAILED_PLAN))
			return "partner/datacollectionAdvanced";
		else return "partner/datacollection";
	}
	
	@RequestMapping(value = "/datacollection/cash-flow/{partyId}", method = RequestMethod.GET)
	public String getDCCashFlow(Model model, @PathVariable String partyId, HttpServletRequest request) {
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 334);// cash flow links
			model.addAttribute("rbsLinks",rbsLinks);
			String questionBankId = "29";
			String sectionTypeId = "39002";
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String headerName =(String) request.getSession().getAttribute("headerName");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.CASH_FLOW, partyId, headerName,userSession.getPlanTypeId());
			String backUrl = getBackUrl(sectionList, FiinfraConstants.CASH_FLOW, partyId, headerName);
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", partyId);
			model.addAttribute("redirectUrl", "/partner/datacollection/cash-flow/" + partyId);
			model.addAttribute("previousPageUrl", backUrl);
			model.addAttribute("nextPageUrl", nexturl);
			model.addAttribute("analysisPageUrl", "/partner/datacollection/cash-flow-analysis/" + partyId);			
			model.addAttribute("questionDetails", questionDetails);
			
			/*List <Long>cashFlowData = getCashFlowForAdvancedPlan(partyId, userSession);
			model.addAttribute("income", cashFlowData.get(0));
			model.addAttribute("expense", cashFlowData.get(1));*/
	
			String attributeCodeIds = "98002,98047";
			Integer clientPartyId = Integer.parseInt(partyId);
			Integer defaultAge = 0;
			List<AdviceAssumption> adviceAssumptions = getAssumptions( userSession.getBuId(), userSession.getPartyId(),
					clientPartyId, attributeCodeIds);
			model.addAttribute("adviceAssumptions", adviceAssumptions);
			int planTypeId = userSession.getPlanTypeId();
			if(planTypeId == FiinfraConstants.DETAILED_PLAN)
				model.addAttribute("planType", "ADVANCED");
			else
				model.addAttribute("planType", "BASIC");
			model.addAttribute("subcriptionType", planTypeId);
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}
		return "partner/datacollection/cash-flow";
	}
	
	@RequestMapping(value = "/datacollection/financial-readiness/{partyId}", method = RequestMethod.GET)
	public String getDCFinancialReadiness(Model model, @PathVariable String partyId, HttpServletRequest request) {
		String redirectUrl="";
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 260);// Goal readiness links
			model.addAttribute("rbsLinks",rbsLinks);
			String questionBankId = "29";
			String sectionTypeId = "39005";
			
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String headerName =(String) request.getSession().getAttribute("headerName");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.GOAL_READINESS, partyId, headerName,userSession.getPlanTypeId());
			String backUrl = getBackUrl(sectionList, FiinfraConstants.GOAL_READINESS, partyId, headerName);
			
			if(userSession.getPlanTypeId() == 522002)
			{
				redirectUrl = redirectUrl +"redirect:/assets/assetSummary/"+partyId;
				model.addAttribute("redirectUrl", redirectUrl);
			}else{
				redirectUrl = redirectUrl +"partner/datacollection/financial-readiness";
				model.addAttribute("redirectUrl", "/"+redirectUrl+"/"+partyId);
			}
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", partyId);
			model.addAttribute("previousPageUrl", backUrl);
			model.addAttribute("nextPageUrl", nexturl);			
			model.addAttribute("questionDetails", questionDetails);
	
			String attributeCodeIds = "98021";
			Integer clientPartyId = Integer.parseInt(partyId);
			List<AdviceAssumption> adviceAssumptions = getAssumptions( userSession.getBuId(), userSession.getPartyId(),
					clientPartyId, attributeCodeIds);
			model.addAttribute("adviceAssumptions", adviceAssumptions);
			int planTypeId = userSession.getPlanTypeId();
			if(planTypeId == FiinfraConstants.DETAILED_PLAN)
				model.addAttribute("planType", "ADVANCED");
			else
				model.addAttribute("planType", "BASIC");
			model.addAttribute("subcriptionType", planTypeId);
			
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}
		return redirectUrl;
	}
	
	@RequestMapping(value = "/datacollection/risk-cover/{partyId}", method = RequestMethod.GET)
	public String getDCRiskCover(Model model, @PathVariable String partyId, HttpServletRequest request) {
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 261);// risk cover links
			model.addAttribute("rbsLinks",rbsLinks);
			
			String questionBankId = "29";
			String sectionTypeId = "39003";
			
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String headerName =(String) request.getSession().getAttribute("headerName");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.RISK_COVER, partyId, headerName,null);
			String backUrl = getBackUrl(sectionList, FiinfraConstants.RISK_COVER, partyId, headerName);
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", partyId);
			model.addAttribute("redirectUrl", "/partner/datacollection/risk-cover/" + partyId);
			model.addAttribute("previousPageUrl", backUrl);
			model.addAttribute("nextPageUrl", nexturl);			
			model.addAttribute("questionDetails", questionDetails);	
			String token = "153443";
			UriComponentsBuilder uriCB;
			Integer buId = userSession.getBuId();
			
			KeyValue self = new KeyValue();
			self.setId(Integer.parseInt(partyId));
			self.setName("Self");
			
			List<KeyValue> relationshipIdsJson = new ArrayList<KeyValue>();
			
			try{
				uriCB = UriComponentsBuilder.fromHttpUrl(GET_REALTIONSHIPID_FOR_PARTY + "/" + partyId + "/" + token + "?buId=" + buId);

				List<KeyValue> relationshipIds = new ArrayList<KeyValue>();
				relationshipIds.add(self);
				BaseResponse<KeyValue> br = new BaseResponse<KeyValue>();
				br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{	
					relationshipIdsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), List.class);
					for(int i = 0; i<relationshipIdsJson.size(); i++){										
						KeyValue keyValue = null;
						keyValue = objectMapper.readValue(objectMapper.writeValueAsString(relationshipIdsJson.get(i)), KeyValue.class);
						relationshipIds.add(keyValue);
					}
					model.addAttribute("relationshipIds", relationshipIds);
				} else{
					LOGGER.error("Error occured while getting family details data from App layer" + br.getReasonCode());
				}
			} catch(Exception ex){
				LOGGER.error(ex);
			}
			
			String attributeCodeIds = "98021,98046,98019,98001";
			Integer clientPartyId = Integer.parseInt(partyId);
			List<AdviceAssumption> adviceAssumptions = getAssumptions( userSession.getBuId(), userSession.getPartyId(),
					clientPartyId, attributeCodeIds);
			model.addAttribute("adviceAssumptions", adviceAssumptions);
			model.addAttribute("healthInsuranceCoverAmnt",healthAssumtion);
			model.addAttribute("scale", scale);
		}
		catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}
		return "partner/datacollection/risk-cover";
	}
	
	@RequestMapping(value = "/datacollection/loan-status/{partyId}", method = RequestMethod.GET)
	public String getDCLoanStatus(Model model, @PathVariable String partyId, HttpServletRequest request) {
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 262);// loan status links
			model.addAttribute("rbsLinks",rbsLinks);
			String questionBankId = "29";
			String sectionTypeId = "39008";
			
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String headerName =(String) request.getSession().getAttribute("headerName");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.LOAN_STATUS,partyId, headerName,null);
			String backUrl = getBackUrl(sectionList, FiinfraConstants.LOAN_STATUS, partyId, headerName);
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", partyId);
			model.addAttribute("redirectUrl", "/partner/datacollection/loan-status/" + partyId);
			model.addAttribute("previousPageUrl", backUrl);
			model.addAttribute("nextPageUrl", nexturl);			
			model.addAttribute("questionDetails", questionDetails);
	
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}		
		return "partner/datacollection/loan-status";
	}
	
	@RequestMapping(value = "/datacollection/emergency-readiness/{partyId}", method = RequestMethod.GET)
	public String getDCEmergencyReadiness(Model model, @PathVariable String partyId, HttpServletRequest request) {
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 263);// emergency readiness links
			model.addAttribute("rbsLinks",rbsLinks);
			String questionBankId = "29";
			String sectionTypeId = "39001";
			String xmlData = getXmlForSectionType(sectionTypeId, request);
						
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String headerName =(String) request.getSession().getAttribute("headerName");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.EMERGENCY, partyId, headerName,null);
			String backUrl = getBackUrl(sectionList, FiinfraConstants.EMERGENCY, partyId, headerName);
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", partyId);
			model.addAttribute("redirectUrl", "/partner/datacollection/emergency-readiness/" + partyId);
			model.addAttribute("previousPageUrl", backUrl);
			model.addAttribute("nextPageUrl", nexturl);			
			model.addAttribute("questionDetails", questionDetails);
			
			String attributeCodeIds = "98021,98027";
			Integer clientPartyId = Integer.parseInt(partyId);
			List<AdviceAssumption> adviceAssumptions = getAssumptions( userSession.getBuId(), userSession.getPartyId(),
					clientPartyId, attributeCodeIds);
			model.addAttribute("adviceAssumptions", adviceAssumptions);
			
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}		
		return "partner/datacollection/emergency-readiness";
	}
			
	@RequestMapping(value = "/datacollection/retirement-planning/{partyId}", method = RequestMethod.GET)
	public String getDCRetirementPlanning(Model model, @PathVariable String partyId, HttpServletRequest request) {
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 264);// retirement planning links
			model.addAttribute("rbsLinks",rbsLinks);
			String questionBankId = "29";
			String sectionTypeId = "39006";
			
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String headerName =(String) request.getSession().getAttribute("headerName");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.RETIREMENT, partyId, headerName,null);
			String backUrl = getBackUrl(sectionList, FiinfraConstants.RETIREMENT, partyId, headerName);
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", partyId);
			model.addAttribute("redirectUrl", "/partner/datacollection/retirement-planning/" + partyId);
			model.addAttribute("previousPageUrl", backUrl);
			model.addAttribute("nextPageUrl", nexturl);			
			model.addAttribute("questionDetails", questionDetails);
	
			String attributeCodeIds = "98021,98022";
			Integer clientPartyId = Integer.parseInt(partyId);
			String defaultage = "";
			List<AdviceAssumption> adviceAssumptions = getAssumptions( userSession.getBuId(), userSession.getPartyId(),
					clientPartyId, attributeCodeIds);
			List<AdviceAssumption> assumptions = new ArrayList<AdviceAssumption>();
			for(int i = 0; i<adviceAssumptions.size(); i++){
				//get the actual party object from its LinkedHashMap representation
				AdviceAssumption assumption = objectMapper.readValue(objectMapper.writeValueAsString(adviceAssumptions.get(i)), AdviceAssumption.class);
				assumptions.add(assumption);
			}
			for(AdviceAssumption adviceAssumption:assumptions) {
				if(adviceAssumption.getAssumptionCodeId() == 98022) {
					defaultage = (String) adviceAssumption.getAssumptionValue();
				}
			}
			model.addAttribute("defaultage", defaultage);
			model.addAttribute("adviceAssumptions", adviceAssumptions);
			
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}
		return "partner/datacollection/retirement-planning";
	}

	@RequestMapping(value = "/datacollection/succession-readiness/{partyId}", method = RequestMethod.GET)
	public String getDCSuccessionReadiness(Model model, @PathVariable String partyId, HttpServletRequest request) {
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 265);// succession readiness links
			model.addAttribute("rbsLinks",rbsLinks);
			String questionBankId = "29";
			String sectionTypeId = "39007";
			String headerName = (String) request.getSession().getAttribute("headerName");
			
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.SUCCESSION_READINESS,partyId, headerName,null);
			String backUrl = getBackUrl(sectionList, FiinfraConstants.SUCCESSION_READINESS, partyId, headerName);
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", partyId);
			model.addAttribute("redirectUrl", "/partner/datacollection/succession-readiness/" + partyId);
			model.addAttribute("previousPageUrl", backUrl);			
			model.addAttribute("nextPageUrl", nexturl);			
			model.addAttribute("analysisPageUrl", "/partner/datacollection/succession-readiness-analysis/" + partyId);	
			model.addAttribute("questionDetails", questionDetails);
	
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}
		return "partner/datacollection/succession-readiness";
	}
	
	private List<QuestionDetails> getDcInputData(String userId, String partyId, String buId, 
			String sectionTypeId, String questionBankId){
		try{
			List<QuestionDetails> dcipList = new ArrayList<QuestionDetails>();
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(FETCH_DC_INPUTDATA + "/" + userId + "/" + "12345");
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("buId", buId);
			uriCB.queryParam("sectionTypeId", sectionTypeId);
			uriCB.queryParam("questionBankId", questionBankId);
			BaseResponse<QuestionDetails> br = new BaseResponse<QuestionDetails>();
			br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				dcipList = br.getResponseListObject();
			}
						
			return dcipList;
		}catch(Exception ex){
			LOGGER.error("Error fetching DC Input List...", ex);
			return null;
		}	
	}
	
	@SuppressWarnings("unchecked")
	@Deprecated
	@RequestMapping(value = "/datacollection/get-inputdata", method = RequestMethod.GET)
	public @ResponseBody List<DcInputData> getContactsForAdvisor(HttpServletRequest request,
			@RequestParam(value = "attributeCodeIds[]", required = false) String[] attributeCodeIds) {
		String partyId = request.getParameter("partyId");
		String token = "12345";
		
		try{
			List<DcInputData> dcipList = new ArrayList<DcInputData>();
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(DC_INPUT_DATA_URL + partyId);
			uriCB.queryParam("buId", "153");
			BaseResponse<DcInputData> br = new BaseResponse<DcInputData>();
			br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), attributeCodeIds, BaseResponse.class);
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				dcipList = br.getResponseListObject();
			}
			return dcipList;
		}catch(Exception ex){
			LOGGER.error("Error fetching DC Input List...", ex);
			return null;
		}
	}
	
	/**
	 * Code for saving data collection information
	 * @param request
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/datacollection/save", method = RequestMethod.POST)
	public String saveDataCollectionDetails(HttpServletRequest request, final RedirectAttributes redirectAttributes) {
		String partyId = request.getParameter("partyId").toString();
		String redirectUrl = request.getParameter("redirectUrl");
		UserSession userSession = null;
		String sourceScreen="";
		int eventId = 0;
		try{
			userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			String token = "12345";
			String userName = userSession.getUserName();
			Integer userId = userSession.getUserId();
			
			//to set current stage id to DCT activated
			UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7007/"+partyId+"/342");
			uri.queryParam("buId", userSession.getBuId());
			BaseResponse<Boolean> base = new BaseResponse<Boolean>();
			base = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
			
			String questionBankId = request.getParameter("questionBankId");
			String sectionTypeId = request.getParameter("sectionTypeId");
			String xMLString = request.getParameter("inputData");
			CurrentFinancialStatusData cData = new CurrentFinancialStatusData();
			cData.setBuId(27827);
			cData.setPartyId(Integer.parseInt(partyId));
			cData.setQuestionBankId(Integer.parseInt(questionBankId));
			cData.setSectionTypeId(Integer.parseInt(sectionTypeId));
			cData.setXMLString(xMLString);
			
			
			String dataFor = "";
			
			switch(sectionTypeId){				
				case "39001": 
					dataFor = "ER";
					eventId = FiinfraConstants.DIY_SAVE_EMERGENCY_READINESS_SUCCESSFUL;
					sourceScreen=FiinfraConstants.DIY_SOURCE_MODULE_EMERGENCY_READINESS;
					break;
				case "39003": 
					dataFor = "RC";
					eventId = FiinfraConstants.DIY_SAVE_RISK_COVER_SUCCESSFUL;
					sourceScreen=FiinfraConstants.DIY_SOURCE_MODULE_RISK_COVER;					
					break;
				case "39006": 
					dataFor = "RP";
					eventId = FiinfraConstants.DIY_SAVE_RETIREMENT_READINESS_SUCCESSFUL;
					sourceScreen=FiinfraConstants.DIY_SOURCE_MODULE_RETIREMENT_READINESS;					
					break;
				case "39007": 
					dataFor = "SR";
					eventId = FiinfraConstants.DIY_SAVE_SUCCESSION_READINESS_SUCCESSFUL;
					sourceScreen=FiinfraConstants.DIY_SOURCE_MODULE_SUCCESSION_READINESS;					
					break;
				case "39005": 
					dataFor = "FR";
					eventId = FiinfraConstants.DIY_SAVE_FINANCIAL_READINESS_SUCCESSFUL;
					sourceScreen=FiinfraConstants.DIY_SOURCE_MODULE_FINANCIAL_READINESS;					
					break;
				case "39002": 
					dataFor = "RC";
					eventId = FiinfraConstants.DIY_SAVE_CASH_FLOW_SUCCESSFUL;
					sourceScreen=FiinfraConstants.DIY_SOURCE_MODULE_CASH_FLOW;					
					break;
				case "39008": 
					dataFor = "LS";
					eventId = FiinfraConstants.DIY_SAVE_EMERGENCY_READINESS_SUCCESSFUL;
					sourceScreen=FiinfraConstants.DIY_SOURCE_MODULE_LOAN_STATUS;					
					break;				
				case "39009": 					
					eventId = FiinfraConstants.DIY_RISK_PROFILE_SAVED_SUCCESSFULLY;
					sourceScreen="Save Risk Profile";
					
					break;
				default: break;			
			}				
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_DC_INPUT + "/" + partyId + "/" + token);
			uriCB.queryParam("buId", userSession.getBuId());	
			BaseResponse<Party> br = new BaseResponse<Party>();
			br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), cData, BaseResponse.class);
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{   
				switch(sectionTypeId){				
					case "39001": if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", "success.cfs.emergencyReadiness");
					    }
						break;
					case "39003":if(request.getParameter("nextPageUrl")==""){ 
						redirectAttributes.addFlashAttribute("success", "success.cfs.riskCover");
						}
						break;
					case "39006": if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", "success.cfs.retirementReadiness");
						}
						break;
					case "39007":if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", "success.cfs.successionReadiness");
						}
						break;
					case "39005":if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", "success.cfs.financialReadiness");
						}
						break;
					case "39002":if(request.getParameter("nextPageUrl")==""){ 
						redirectAttributes.addFlashAttribute("success", "success.cfs.cashFlow");
						}
						break;
					case "39008":if(request.getParameter("nextPageUrl")==""){ 
						redirectAttributes.addFlashAttribute("success", "success.cfs.loans");
						}
						break;				
					case "39009":if(request.getParameter("nextPageUrl")==""){					
						redirectAttributes.addFlashAttribute("success", "success.cfs.riskProfile");
						}
						break;
					default: break;			
				}
				//redirectAttributes.addFlashAttribute("success", "Data Saved Successfully.");		

				if(dataFor !=""){
						uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_SUGGESTION_DATA + "/" + partyId + "/" + dataFor +"/" 
								+ userSession.getUserId() + "/" + token);
						uriCB.queryParam("buId", userSession.getBuId());
						
						br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
						String eventXML="";
						if(dataFor.equalsIgnoreCase("ER"))
						{
							eventXML += "usp_DIY_saveAnalysisForEmergency("+partyId+")";
						}
						else if(dataFor.equalsIgnoreCase("LS")){
							eventXML += "usp_DIY_saveAnalysisForLoanStatus("+partyId+")";
						}
						else if(dataFor.equalsIgnoreCase("RC")){
							eventXML += "usp_DIY_saveAnalysisForRiskCover("+partyId+")";
						}
						audit(userSession.getPartyId(), userSession.getUserId(), eventId, CFS_SOURCE, sourceScreen,eventXML);
						if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						{	
							if(sectionTypeId.equals("39006")){
								// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
								UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
								uriRetirement.queryParam("buId", userSession.getBuId());
								BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
								retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
								if (retirementBr.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
									if(request.getParameter("nextPageUrl")==""){
									redirectAttributes.addFlashAttribute("success", "success.cfs.retirementReadiness");
									}
								}else{
									if(request.getParameter("nextPageUrl")==""){
									redirectAttributes.addFlashAttribute("error", "error.cfs.retirementReadiness");
									}
								}
							}
							
						}
					}
						// end of  call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
				String eventXML = "usp_pp_DC_INP_saveCurrentFinancialStatus("+partyId+","+userId+","+questionBankId+","+sectionTypeId+","+xMLString+")";
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_RISK_PROFILE_SAVED_SUCCESSFULLY, DC_SOURCE, sourceScreen,eventXML);
				}else
					{
						switch(sectionTypeId){				
							case "39001":if(request.getParameter("nextPageUrl")==""){ 
								redirectAttributes.addFlashAttribute("error", "error.cfs.emergencyReadiness");
								}
								break;
							case "39003":if(request.getParameter("nextPageUrl")==""){ 
								redirectAttributes.addFlashAttribute("error", "error.cfs.riskCover");
								}
								break;
							case "39006":if(request.getParameter("nextPageUrl")==""){ 
								redirectAttributes.addFlashAttribute("error", "error.cfs.retirementReadiness");
								}
								break;
							case "39007":if(request.getParameter("nextPageUrl")==""){ 
								redirectAttributes.addFlashAttribute("error", "error.cfs.successionReadiness");
								}
								break;
							case "39005":if(request.getParameter("nextPageUrl")==""){ 
								redirectAttributes.addFlashAttribute("error", "error.cfs.financialReadiness");
								}	
								break;
							case "39002":if(request.getParameter("nextPageUrl")==""){ 
								redirectAttributes.addFlashAttribute("error", "error.cfs.cashFlow");
								}
								break;
							case "39008":if(request.getParameter("nextPageUrl")==""){
								redirectAttributes.addFlashAttribute("error", "error.cfs.loans");
								}
								break;				
							case "39009":if(request.getParameter("nextPageUrl")==""){ 					
								redirectAttributes.addFlashAttribute("error", "error.cfs.riskProfile");
								}
								break;
							default: break;			
						}
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("error", "Error while saving Financial status, please try again later.");
						}
						//audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_CFS_DATA_SAVE_FAILED, CFS_SOURCE, sourceScreen,eve);
			}
		}catch(Exception ex){
			//audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_CFS_DATA_SAVE_FAILED, CFS_SOURCE, sourceScreen.length()==0?"CFS":sourceScreen);			
		}
		String fromWhatIf = "no";
		
		if(request.getParameter("nextPageUrl")!="")
		{
			return "redirect:" + request.getParameter("nextPageUrl");
		}
		
		if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes"))
		{
			fromWhatIf = request.getParameter("fromWhatIf");
		}
		if(fromWhatIf.equals("yes"))
		{
			return "redirect:" + redirectUrl;
		}
		else{
			return "redirect:" + redirectUrl;
		}
	}
	
	@RequestMapping(value = "/datacollection/assumption/save", method = RequestMethod.POST)
	public @ResponseBody String saveAssumptionDetails(HttpServletRequest request, 
			@RequestParam(value = "updatedAssumptions") String updatedAssumptions,
			@RequestParam(value = "clientId") String clientId) {			
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "User Not logged In";
			}
			String token = "12345";									
						
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_ASSUMPTIONS_FOR_CONTACTS + "/" + userSession.getUserName() + "/" + token);
			uriCB.queryParam("buId", userSession.getBuId());
			uriCB.queryParam("clientId", clientId);
			uriCB.queryParam("partnerPartyId", userSession.getPartyId());

			List<AdviceAssumption> adviceAssumptionList = new ArrayList<AdviceAssumption>();
			
			String[] assumptions = updatedAssumptions.split(",");
			for (String assumption : assumptions) {			
				AdviceAssumption adviceAssumption = new AdviceAssumption();
				adviceAssumption.setAssumptionCodeId(Integer.parseInt(assumption.split(":")[0]));
				adviceAssumption.setAssumptionValue(assumption.split(":")[1]);
				adviceAssumption.setLastModifiedBy(userSession.getUserId());
				adviceAssumption.setCreatedBy(userSession.getUserId());
				adviceAssumptionList.add(adviceAssumption);
			}
			
			BaseResponse<Party> br = new BaseResponse<Party>();
			br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceAssumptionList, BaseResponse.class);
			String eventXML = "usp_DIY_insertOrUpdateAssumptionsForClient("+userSession.getBuId()+","+userSession.getPartyId() +","+clientId+","+FiinfraUtility.getAssumptionsXml(adviceAssumptionList)+")";
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_UPDATE_OPPORTUNITY_ASSUMPTION_DETAILS_SUCCESSFUL, ASSUMPTION_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_ASSUMPTION_DETAILS_SUCCESSFUL,eventXML);
				return "Data Saved Successfully.";
			} else {
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_UPDATE_OPPORTUNITY_ASSUMPTION_DETAILS_FAILED, ASSUMPTION_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_ASSUMPTION_DETAILS_SUCCESSFUL,eventXML);
				return "Error Saving Data";
			}
		}catch(Exception ex){
			LOGGER.error("Error Saving Assumption Data", ex);
			return "Error Saving Data";
		}		
	}
	
	@RequestMapping(value = "/datacollection/emergency-readiness-analysis/{partyId}", method = RequestMethod.GET)
	public String getDCEmergencyReadinessAnalysis(Model model, @PathVariable String partyId, HttpServletRequest request) {
		
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
									
			String dataFor = "ER";
			DcAnalysisHelper analysisDetails = getAnalysisData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), dataFor);
													
			model.addAttribute("partyId", partyId);
			model.addAttribute("analysisDetails", analysisDetails);
	
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}		
		return "partner/datacollection/emergency-readiness-analysis";
	}
		
	@RequestMapping(value = "/datacollection/risk-cover-analysis/{partyId}", method = RequestMethod.GET)
	public String getDCRiskCoverAnalysis(Model model, @PathVariable String partyId, HttpServletRequest request) {
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
									
			String dataFor = "RC";
			DcAnalysisHelper analysisDetails = getAnalysisData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), dataFor);
													
			model.addAttribute("partyId", partyId);
			
			model.addAttribute("analysisDetails", analysisDetails);
			
			model.addAttribute("error", analysisDetails.getErrorMsg());
	
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
			
		}		
		String returnUrl = request.getParameter("returnUrl");
		model.addAttribute("returnUrl", returnUrl);
		return "partner/datacollection/risk-cover-analysis";
	}
	
	@RequestMapping(value = "/datacollection/succession-readiness-analysis/{partyId}", method = RequestMethod.GET)
	public String getDCSuccessionReadinessAnalysis(Model model, @PathVariable String partyId, HttpServletRequest request) {
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
									
			String dataFor = "SR";
			DcAnalysisHelper analysisDetails = getAnalysisData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), dataFor);
			model.addAttribute("partyId", partyId);
			model.addAttribute("analysisDetails", analysisDetails);
	
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}
		return "partner/datacollection/succession-readiness-analysis";
	}
	
	@RequestMapping(value = "/datacollection/cash-flow-analysis/{partyId}", method = RequestMethod.GET)
	public String getDCCashFlowAnalysis(Model model, @PathVariable String partyId, HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		String dataFor = "CF";
		DcAnalysisHelper analysisDetails = getAnalysisData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), dataFor);
		model.addAttribute("partyId", partyId);
		model.addAttribute("analysisDetails", analysisDetails);
		return "partner/datacollection/cash-flow-analysis";
	}
	
	@RequestMapping(value = "/datacollection/loan-status-analysis/{partyId}", method = RequestMethod.GET)
	public String getDCLoanStatusAnalysis(Model model, @PathVariable String partyId, HttpServletRequest request) {
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
									
			String dataFor = "LS";
			DcAnalysisHelper analysisDetails = getAnalysisData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), dataFor);
			model.addAttribute("partyId", partyId);
			model.addAttribute("analysisDetails", analysisDetails);
	
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}
		return "partner/datacollection/loan-status-analysis";
	}
	
	private DcAnalysisHelper getAnalysisData(String userId, String partyId, String buId, String dataFor){
		try{
			DcAnalysisHelper dcAnalysisHelper = new DcAnalysisHelper();
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ANALYSIS_DATA + "/" + partyId + "/"+  dataFor 
					+ "/" + userId + "/" + "12345");			
			uriCB.queryParam("buId", buId);
			BaseResponse<DcAnalysisHelper> br = new BaseResponse<DcAnalysisHelper>();
					
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				dcAnalysisHelper = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), DcAnalysisHelper.class);
			}
						
			return dcAnalysisHelper;
		}catch(Exception ex){
			LOGGER.error("Error fetching DC Input List...", ex);
			return null;
		}
	}

	private Suggestion getSuggestionData(String userId, String partyId, String buId, String dataFor){
		try{
			Suggestion suggestion = new Suggestion();
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_SUGGESTION_DATA + "/" + partyId + "/"+  dataFor 
					+ "/" + userId + "/" + "12345");			
			uriCB.queryParam("buId", buId);
			BaseResponse<Suggestion> br = new BaseResponse<Suggestion>();
						
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				suggestion = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Suggestion.class);
			}
						
			return suggestion;
		}catch(Exception ex){
			LOGGER.error("Error fetching DC Input List...", ex);
			return null;
		}
	}

	@RequestMapping(value = "/datacollection/suggestion/{screen}/{partyId}", method = RequestMethod.GET)
	public String getDCSuggestions(Model model, HttpServletRequest request,
			@PathVariable String screen,
			@PathVariable String partyId,
			RedirectAttributes redirectAttributes) {	
		
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			model.addAttribute("partyId", partyId);	
			String dataFor = "";			
			switch(screen){
				case "emergency-readiness" : 
					dataFor = "ER";					
					break;
				case "risk-cover" : 
					dataFor = "RC";
					model.addAttribute("iconId",dataFor);
					break;
				case "retirement-planning" :
					dataFor = "RP";
					model.addAttribute("iconId","35015");
					break;
				case "succession-readiness" :
					dataFor = "SR";
					model.addAttribute("iconId",dataFor);
					break;
				case "financial-readiness" :
					dataFor = "FR";
					model.addAttribute("iconId",dataFor);
					break;
				case "cash-flow" :
					dataFor = "CF";
					model.addAttribute("iconId",dataFor);
					break;
				case "loan-status" :
					dataFor = "LS";
					model.addAttribute("iconId",dataFor);
					break;
				default :
					break;
			
			}

			if(!dataFor.equals("")){
				Suggestion suggestions = getSuggestionData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), dataFor);					
				model.addAttribute("suggestionDetails", suggestions);
				String monthlyIncome = suggestions.getMonthlyincome();
				if(dataFor.equals("ER") && (monthlyIncome == null || monthlyIncome.equals("0") || monthlyIncome.equals("0.00"))) {		
					model.addAttribute("error", "Please complete the Cashflow section to generate suggestion.");					
				}
				model.addAttribute("parentPageUrl", "/partner/datacollection/" + screen  + "/" + partyId);
			} else{
				return "redirect:/partner/contacts";
			}	
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}	
		String returnUrl = request.getParameter("returnUrl");
		model.addAttribute("returnUrl", returnUrl);
		
		return "partner/datacollection/suggestion";
	}
	
	/*************** End Code for Data Collection Screens *************/
	
	@RequestMapping(value = "/personalization", method = RequestMethod.GET)
	public String viewPersonalization(Model m, ProfileData profileData, HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 296);// personalization links
		m.addAttribute("rbsLinks",rbsLinks);
		return "partner/personalization";
	}
	
	@RequestMapping(value = "/contacts", method = RequestMethod.GET)
	public String showContacts(Model model,
			HttpServletRequest request) {		
		try{			
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			
			String userAgent=request.getHeader("user-agent");
			if(userAgent.contains("Mobi") || userAgent.contains("Android")){
				 model.addAttribute("isMobile","true");
			}
			if(userAgent.contains("Mac OS")){
			    model.addAttribute("isIpad", "true");
			}
			//role base security
			
			String partnerSetupLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 283);// Partner Setup links
			//model.addAttribute("partnerSetupLinks", partnerSetupLinks);
			request.getSession().setAttribute("partnerSetupLinks", partnerSetupLinks);
			
			String roleBaseLinks =commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 323);// Partner Dashboard links
			model.addAttribute("roleBaseLinks", roleBaseLinks);
			request.getSession().setAttribute("smallMenuLinks", roleBaseLinks);
			
			roleBaseLinks =commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 326);// DIY Contacts
			model.addAttribute("roleBaseLinks", roleBaseLinks); 
			request.getSession().removeAttribute("headerName");
			String token = "12345";
			PartySearchCriteria partySearchCriteria = new PartySearchCriteria();
			partySearchCriteria.setOwnerPartyId(userSession.getPartyId());
			//code for hierarchy 
			model.addAttribute("hierarchy", 1);
			String nodeId = request.getSession().getAttribute("nodeId").toString();
			
			List<PartySearchCriteria> partyList = getParty(userSession.getUserName(), userSession.getBuId(), partySearchCriteria,nodeId);
			int size = partyList.size();
						
			if(partyList.size() < 30){
				model.addAttribute("subList", partyList.subList(0, partyList.size()));
			}
			else{
				model.addAttribute("subList", partyList.subList(0, 30));
			}
			
			model.addAttribute(TOTALCONTACTS, size);
			model.addAttribute("sortOrder","ascending");
			request.getSession().setAttribute(PARTYLIST,partyList);
			request.getSession().setAttribute("noOfContacts", 30);
			
			//*****************add search drop down******************
			BaseResponse< CodeValueData> baseResponse2 = new BaseResponse<CodeValueData>();
			//code for populate search list
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PICKLIST_VALUELIST+"/"+userSession.getUserName()+"/"+token);
			String codeTypeIds = ""+6+","+4;//code type IDs for OpportunityStatusID and ContactSourceTypeID
			uriCB.queryParam("buId", userSession.getBuId());
			uriCB.queryParam("codeTypeIds", codeTypeIds);
			
			//call service to populate dropdown for search
			baseResponse2 = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
			if (baseResponse2.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				codeValueDataList = baseResponse2.getResponseListObject();
				List<CodeValueData> valueDatas = new ArrayList<CodeValueData>();
				//get the actual CodeValueData object from its LinkedHashMap representation
				size = codeValueDataList.size();
				for(int i = 0; i<size; i++){
					CodeValueData codeValueData = objectMapper.readValue(objectMapper.writeValueAsString(codeValueDataList.get(i)), CodeValueData.class);
					valueDatas.add(codeValueData);
				}
				
				CodeValueData defaultCodeValue;
				List<CodeValueData> opportunityStatusList = new ArrayList<CodeValueData>();
				defaultCodeValue = new CodeValueData();
				defaultCodeValue.setCodeValueId(0);
				defaultCodeValue.setCodeValue("Status");
				opportunityStatusList.add(defaultCodeValue);
				List<CodeValueData> contactSourceList = new ArrayList<CodeValueData>();
				defaultCodeValue = new CodeValueData();
				defaultCodeValue.setCodeValueId(0);
				defaultCodeValue.setCodeValue("Source");
				contactSourceList.add(defaultCodeValue);
				List<CodeValueData> recordTypeList = new ArrayList<CodeValueData>();
				defaultCodeValue = new CodeValueData();
				defaultCodeValue.setCodeValueId(0);
				defaultCodeValue.setCodeValue("Type");
				recordTypeList.add(defaultCodeValue);
				for (CodeValueData codeValueData : valueDatas) 
				{
					if(codeValueData.getCodeTypeId()==6)
					{
						opportunityStatusList.add(codeValueData);
					}
					else if(codeValueData.getCodeTypeId()==4)
					{
						contactSourceList.add(codeValueData);
					}
				}
				CodeValueData codeValueData = new CodeValueData();
				codeValueData.setCodeValueId(14005);
				codeValueData.setCodeValue("Opportunity");
				recordTypeList.add(codeValueData);
				codeValueData = new CodeValueData();
				codeValueData.setCodeValueId(14006);
				codeValueData.setCodeValue("Client");
				recordTypeList.add(codeValueData);
				/*codeValueData = new CodeValueData();
				codeValueData.setCodeValueId(14007);
				codeValueData.setCodeValue("Premium Client");*/
				recordTypeList.add(codeValueData);
				
				model.addAttribute("opportunity", opportunityStatusList);
				model.addAttribute("source", contactSourceList);
				model.addAttribute("type", recordTypeList);
				model.addAttribute("searchCriteria", new PartySearchCriteria());
				
			}
			
			
			return "partner/contacts";
			
		} catch (Exception exception){
			LOGGER.error("Error occured while retrieving contacts : ", exception);
			return "partner/contacts";
		}
	}
		
	//search contacts for search criteria
	@Produces("application/json")
	@RequestMapping(value = "/contacts/search", method = RequestMethod.GET)
	public @ResponseBody List<PartySearchCriteria> searchContacts(Model model,
			HttpServletRequest request) {		
		try{			
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return null;//
			}
			PartySearchCriteria searchCriteria = new PartySearchCriteria();
			searchCriteria.setOwnerPartyId(userSession.getPartyId());
			String genericSearch = request.getParameter("genericSearch");
			if(genericSearch.equals(""))
			{
				searchCriteria.setGenericSearch(null);
			}
			else
			{
				searchCriteria.setGenericSearch(genericSearch);
			}
			searchCriteria.setRecordTypeID(Integer.parseInt(request.getParameter("recordTypeID")));
			searchCriteria.setContactSourceTypeID(Integer.parseInt(request.getParameter("contactSourceTypeID")));
			searchCriteria.setOpportunityStatusID(Integer.parseInt(request.getParameter("opportunityStatusID")));
			//code for hierarchy 
			model.addAttribute("hierarchy", 1);
			String nodeid = request.getSession().getAttribute("nodeId").toString();

			
			List<PartySearchCriteria> partyList = getParty(userSession.getUserName(), userSession.getBuId(), searchCriteria,nodeid);
			int size = partyList.size();
			
			
			request.getSession().removeAttribute("contacts");
			request.getSession().setAttribute(PARTYLIST,partyList);
			request.getSession().setAttribute("noOfContacts", 30);
			request.getSession().setAttribute("contacts", size);
			
			if(partyList.size() < 30){
				return partyList.subList(0, partyList.size());
			}
			else{
				return partyList.subList(0, 30);
			}
			
			/*if(partyList.size() < 30){
				model.addAttribute("subList", partyList.subList(0, partyList.size()));
			}
			else{
				model.addAttribute("subList", partyList.subList(0, 30));
			}
			
			request.getSession().setAttribute(PARTYLIST,partyList);
			
			return partyList;*/
			
		} catch (Exception exception){
			LOGGER.error("Error occured while retrieving contacts : ", exception);
			return null;
		}
	}
	
	@Produces("application/json")
	@RequestMapping(value = "/autoPlanClients/search", method = RequestMethod.GET)
	public @ResponseBody List<PartySearchCriteria> searchautoPlanClients(Model model,
			HttpServletRequest request) {		
		try{			
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return null;//
			}
			PartySearchCriteria searchCriteria = new PartySearchCriteria();
			searchCriteria.setOwnerPartyId(userSession.getPartyId());
			String genericSearch = request.getParameter("genericSearch");
			if(genericSearch.equals(""))
			{
				searchCriteria.setGenericSearch(null);
			}
			else
			{
				searchCriteria.setGenericSearch(genericSearch);
			}
			searchCriteria.setRecordTypeID(Integer.parseInt(request.getParameter("recordTypeID")));
			searchCriteria.setContactSourceTypeID(Integer.parseInt(request.getParameter("contactSourceTypeID")));
			searchCriteria.setOpportunityStatusID(Integer.parseInt(request.getParameter("opportunityStatusID")));

			
			List<PartySearchCriteria> partyList = getAutoPlanClients(userSession.getUserName(), userSession.getBuId(), searchCriteria);
			int size = partyList.size();
			
			
			request.getSession().removeAttribute("contacts");
			request.getSession().setAttribute(PARTYLIST,partyList);
			request.getSession().setAttribute("noOfContacts", 30);
			request.getSession().setAttribute("contacts", size);
			
			if(partyList.size() < 30){
				return partyList.subList(0, partyList.size());
			}
			else{
				return partyList.subList(0, 30);
			}
			
			/*if(partyList.size() < 30){
				model.addAttribute("subList", partyList.subList(0, partyList.size()));
			}
			else{
				model.addAttribute("subList", partyList.subList(0, 30));
			}
			
			request.getSession().setAttribute(PARTYLIST,partyList);
			
			return partyList;*/
			
		} catch (Exception exception){
			LOGGER.error("Error occured while retrieving contacts : ", exception);
			return null;
		}
	}
	
	
	
	private List<PartySearchCriteria> getParty(String username,Integer buID, PartySearchCriteria searchCriteria,String nodeId )
	{
		
		String token = "12345";
		List<PartySearchCriteria> partyList = new ArrayList<PartySearchCriteria> ();
		try {
			List<PartySearchCriteria> partyListAsJson = new ArrayList<PartySearchCriteria> ();
			
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(CONTACTS_FOR_SEARCH_CRITERIA+"/"+username + "/" + token
							+ "?buId=" + buID);
			uriCB.queryParam("nodeId", nodeId);
			BaseResponse<PartySearchCriteria> baseResponse = new BaseResponse<PartySearchCriteria>();
			
			//call service for all parties associated 
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), searchCriteria, BaseResponse.class);				
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				partyListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
			}
			
			int size = partyListAsJson.size();
			for(int i = 0; i<size; i++){
				//get the actual party object from its LinkedHashMap representation
				PartySearchCriteria partySearchCriteria = objectMapper.readValue(objectMapper.writeValueAsString(partyListAsJson.get(i)), PartySearchCriteria.class);
				//partySearchCriteria.setCreationDate(DateUtil.getTimeStamp(partySearchCriteria.getCreationDate().toString()));
				Format format = new SimpleDateFormat(DATE_FORMAT_DD_MM_YYYY);
				String date = format.format((new Date(partySearchCriteria.getCreationDate().getTime())));
				partySearchCriteria.setCreationDate(DateUtil.getTimeStamp(date));
				partyList.add(partySearchCriteria);
			}
		}
		catch (Exception exception) 
		{
			LOGGER.debug("Exception while retriving contacts"+exception.getMessage());
		} 
		return partyList;	
	}
	
	private List<PartySearchCriteria> getAutoPlanClients(String username,Integer buID, PartySearchCriteria searchCriteria )
	{
		
		String token = "12345";
		List<PartySearchCriteria> partyList = new ArrayList<PartySearchCriteria> ();
		try {
			List<PartySearchCriteria> partyListAsJson = new ArrayList<PartySearchCriteria> ();
			
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_AUTOLPLAN_CLIENTS+"/"+username + "/" + token
							+ "?buId=" + buID);
			BaseResponse<PartySearchCriteria> baseResponse = new BaseResponse<PartySearchCriteria>();
			
			//call service for all parties associated 
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), searchCriteria, BaseResponse.class);				
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				partyListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
			}
			
			int size = partyListAsJson.size();
			for(int i = 0; i<size; i++){
				//get the actual party object from its LinkedHashMap representation
				PartySearchCriteria partySearchCriteria = objectMapper.readValue(objectMapper.writeValueAsString(partyListAsJson.get(i)), PartySearchCriteria.class);
				//partySearchCriteria.setCreationDate(DateUtil.getTimeStamp(partySearchCriteria.getCreationDate().toString()));
				Format format = new SimpleDateFormat(DATE_FORMAT_DD_MM_YYYY);
				String date = format.format((new Date(partySearchCriteria.getCreationDate().getTime())));
				partySearchCriteria.setCreationDate(DateUtil.getTimeStamp(date));
				partyList.add(partySearchCriteria);
			}
		}
		catch (Exception exception) 
		{
			LOGGER.debug("Exception while retriving contacts"+exception.getMessage());
		} 
		return partyList;	
	}
	
	
	@Produces("application/json")
	@RequestMapping(value = "/contacts/sort", method = RequestMethod.POST)
	public @ResponseBody List<PartySearchCriteria> sortContacts(Model model,HttpServletRequest request) {
	
		List<PartySearchCriteria> partyList = null;
		partyList =(List<PartySearchCriteria>) request.getSession().getAttribute(PARTYLIST);
		
		if(request.getParameter("dateSort").equalsIgnoreCase("false")){
		
			if((request.getParameter("sortOrder").equalsIgnoreCase("true"))){
			Collections.sort(partyList, new PartyNameComparator<PartySearchCriteria>(true));
			}else{
			Collections.sort(partyList, new PartyNameComparator<PartySearchCriteria>(false));
			}
		}else{
			if((request.getParameter("sortOrder").equalsIgnoreCase("true"))){
				Collections.sort(partyList, new PartyDateComparator<PartySearchCriteria>(true));
				}else{
				Collections.sort(partyList, new PartyDateComparator<PartySearchCriteria>(false));
				}
		}
		
		model.addAttribute(TOTALCONTACTS, partyList.size());
		request.getSession().setAttribute(PARTYLIST,partyList);
		request.getSession().setAttribute("noOfContacts", 30);
		
		if(partyList.size() < 30){
			return partyList.subList(0, partyList.size());
		}
		else{
			return partyList.subList(0, 30);
		}
	}
	
	@Produces("application/json")
	@RequestMapping(value = "/contacts/bringNewRows", method = RequestMethod.GET)
	public @ResponseBody List<PartySearchCriteria> bringNewRowsContacts(Model model,HttpServletRequest request) {

		List<PartySearchCriteria> partyList = null;
		partyList =(List<PartySearchCriteria>) request.getSession().getAttribute(PARTYLIST);

		
		/*Collections.sort(partyList, new PartyNameComparator<Party>() {
			public int compare(Party party1, Party party2) {
				String party1Name = party1.getFirstName()
						+ party1.getMiddleName() + party1.getLastName();
				String party2Name = party2.getFirstName()
						+ party2.getMiddleName() + party2.getLastName();

				return party2Name.compareTo(party1Name);
			}
		});*/
	//	model.addAttribute(PARTYLIST, partyList);
		//model.addAttribute("partyId",partyId);
		//model.addAttribute("buId",buId);
		Integer nextStartIndex = (Integer)request.getSession().getAttribute("noOfContacts");
		request.getSession().setAttribute("noOfContacts", nextStartIndex+10);
		
		if(nextStartIndex > partyList.size())
			return null;
		if(partyList.size() < (nextStartIndex+10)){
			return partyList.subList(nextStartIndex, partyList.size());
		}
		else{
			return partyList.subList(nextStartIndex, nextStartIndex+10);
		}
				
		// "success";//"partner";///contacts";
	}
	
	private List<PartySearchCriteria> getContacts(Integer partyId, String buId, HttpServletRequest request) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException{
		
		String userName = null;
		if(request !=null)
		{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				userName = "ramu";//
			}
			userName = userSession.getUserName();
		}
		
		String nodeid = request.getSession().getAttribute("nodeId").toString();
		String token = "1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(CONTACTS_URL + "/"+userName +"/"+ partyId + "/"+token+"?buId="+buId);
		BaseResponse<PartySearchCriteria> br = new BaseResponse<PartySearchCriteria>();
		
		//call service for all parties associated 
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		List<PartySearchCriteria> partyListAsJson = new ArrayList<PartySearchCriteria> ();
		List<PartySearchCriteria> partyList = new ArrayList<PartySearchCriteria> ();
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			partyListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
		}
		
		int size = partyListAsJson.size();
		for(int i = 0; i<size; i++){
			//get the actual party object from its LinkedHashMap representation
			PartySearchCriteria partySearchCriteria = objectMapper.readValue(objectMapper.writeValueAsString(partyListAsJson.get(i)), PartySearchCriteria.class);
			partyList.add(partySearchCriteria);
		}
		
		return partyList;
	}
		
	@RequestMapping(value = "/personal/info", method = RequestMethod.GET)
	public String profilePersonalInfo(Model model, ProfileRequest q, HttpServletRequest request) {
		
		if(!validSession(request)){
			return redirectToLogin();
		}

		PartnerService service = getRestService(PartnerService.class);
		// req.setPartyId(partyId);
		UserSession user = AbstractController.getSessionUser();
		
		if(q.getViewId() <=0){
			q.setViewId(1);
		}
		ProfileData bean = service.getProfile(new GetRequest().param("partyId",
				user.getPartyId()));
		bean.setPartyId(user.getPartyId());
		model.addAttribute("viewId", q.getViewId());

		final String redirect;
		if (q.getViewId() == 3) {
			String rbsLinks = commonController.getRoleBasedSecurityIDS(user.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), user.getBuId(), 285);// change profile links
			model.addAttribute("rbsLinks",rbsLinks);
			bean.setSectionName(FiinfraConstants.PROFILE_BANK_DETAILS);
			redirect = "profile/bankDetails";
		} else if (q.getViewId() == 6) {
			String rbsLinks = commonController.getRoleBasedSecurityIDS(user.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), user.getBuId(), 285);// change profile links
			model.addAttribute("rbsLinks",rbsLinks);
			bean.setSectionName(FiinfraConstants.PROFILE_PERSONAL_INFO_1);
			redirect = "profile/userAccount";
		} else if (q.getViewId() == 5) {
			String rbsLinks = commonController.getRoleBasedSecurityIDS(user.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), user.getBuId(), 285);// change profile links
			model.addAttribute("rbsLinks",rbsLinks);
			bean.setSectionName(FiinfraConstants.PROFILE_FINANCIAL_PRODUCTS);
			List<ProductOffering> offerings = retriveOffering(bean);
			FpHolder holder = new FpHolder();
			holder.setPartyId(bean.getPartyId());
			holder.setProducts(offerings.toArray(new ProductOffering[offerings.size()]));
			model.addAttribute("products", holder);
			redirect = "profile/financialProduct";
		} else if (q.getViewId() == 4) {
			String rbsLinks = commonController.getRoleBasedSecurityIDS(user.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), user.getBuId(), 285);// change profile links
			model.addAttribute("rbsLinks",rbsLinks);
			bean.setSectionName(FiinfraConstants.PROFILE_RECIDENCE_ADDRESS);
			redirect = "profile/service";
		} else if (q.getViewId() == 2) {
			String rbsLinks = commonController.getRoleBasedSecurityIDS(user.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), user.getBuId(), 285);// change profile links
			model.addAttribute("rbsLinks",rbsLinks);
			if (bean.getAddressDataList() == null) {
				bean.setAddressDataList(new ArrayList<AddressData>());
			}

			AddressData residenceAddress = null;
			AddressData officeAddress = null;
			for (AddressData ad : bean.getAddressDataList()) {
				
				if ("Home".equalsIgnoreCase(ad.getAddressType())) {
					residenceAddress = ad;
					
				}
				if ("Office".equalsIgnoreCase(ad.getAddressType())) {
					officeAddress = ad;
				}
			}
			if (officeAddress == null) {
				officeAddress = new AddressData();
				officeAddress
						.setAddressType(FiinfraConstants.PROFILE_OFFICE_ADDRESS);
			}
			if (residenceAddress == null) {
				residenceAddress = new AddressData();
				residenceAddress
						.setAddressType(FiinfraConstants.PROFILE_RECIDENCE_ADDRESS);
			}
			bean.getAddressDataList().clear();
			bean.getAddressDataList().add(residenceAddress);
			bean.getAddressDataList().add(officeAddress);
			bean.setSectionName(FiinfraConstants.PROFILE_RECIDENCE_ADDRESS);

			redirect = "profile/address";
		} else if (q.getViewId() == 7) {
			String rbsLinks = commonController.getRoleBasedSecurityIDS(user.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), user.getBuId(), 285);// change profile links
			model.addAttribute("rbsLinks",rbsLinks);
			redirect = "profile/myTeam";
		}
		else if(q.getViewId() == 8){
			String rbsLinks = commonController.getRoleBasedSecurityIDS(user.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), user.getBuId(), 296);// personalization links
			model.addAttribute("rbsLinks",rbsLinks);
			List<Theme> themes = new ArrayList<Theme>();
			List<CodeValueData> codeValues = service.getCodeValue("92");
			for(CodeValueData cv:codeValues){
				themes.add(new Theme(cv.getCodeValueId(),cv.getCodeValue(),"theme_"+cv.getCodeValue().toLowerCase()+"_big.jpg","theme_"+cv.getCodeValue().toLowerCase()+".jpg"));	
			}
			model.addAttribute("themes", themes);
			
			
			redirect = "profile/personalization";
		}

		else {
			String rbsLinks = commonController.getRoleBasedSecurityIDS(user.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), user.getBuId(), 285);// change profile links
			model.addAttribute("rbsLinks",rbsLinks);
			bean.setSectionName(FiinfraConstants.PROFILE_PERSONAL_INFO_1);
			redirect = "profile/personalInfo";
		}

		model.addAttribute("profileData", bean);
		populateProfileFormData(model, q, bean);

		return redirect;
	}

	@RequestMapping(value = "/profile/removeLogo", method = RequestMethod.GET)
	public String removeLogo(final RedirectAttributes redirectAttributes,HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String tab = request.getParameter("activeTab");
		//call API to delete logo from DB
		String token="abc";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(REMOVE_LOGO_URL+userSession.getUserName()+"/"+ token);
		uriCB.queryParam("buId", userSession.getBuId());
		uriCB.queryParam("partyId", userSession.getPartyId());
		uriCB.queryParam("attributeCodeId", "91036");//code ID for partner logo
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			if(userSession.getPartyId() == (Integer) request.getSession().getAttribute("oldPartyID"))
			{
				((UserSession) request.getSession().getAttribute("userSession")).setLogo("");
			}
		}
		redirectAttributes.addFlashAttribute("activeTab", tab);
		return "redirect:/partner/personal/info?viewId=8";
	}

	@RequestMapping(value = "/profile/save", method = RequestMethod.POST)
	public String myProfileSave(Model model,
			@ModelAttribute("profileData") ProfileData profileData,
			@ModelAttribute("products") FpHolder products,
			BindingResult result, HttpServletRequest request,
			final RedirectAttributes redirectAttributes,
			HttpServletResponse response) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(!validSession(request)){
			return redirectToLogin();
		}
		
		String activeTab = request.getParameter("refer");
		String errorMsg = "";
		String sucessMsg = "";

		long currentTime = Calendar.getInstance().getTimeInMillis();
		
		int view = Integer.parseInt(request.getParameter("viewId"));
		PartnerService service = getRestService(PartnerService.class);
		int sucsess = -1;
		int nextView = view < 8 && view >= 1 ? view + 1 : 1;
		profileData.setLastModifiedBy(userSession.getUserId());
		try {
		switch (view) {
		case 1: {
			
			MultipartFile image = profileData.getImage();
			if (image != null) {
				List<DocumentData> documentDatas = new ArrayList<DocumentData>();
				MultipartFile[] files = new MultipartFile[1];
				files[0] = image;
				documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(
						files, currentTime, profileData.getPartyId());
				if (documentDatas != null && documentDatas.size() > 0) {
//					DocumentService docService = getBean(DocumentService.class);
					String storagePathLocation= APP_IMAGE_PATH;// docService.getStoragePath(profileData.getPartyId(),1, 98083);
//					File storagePath= FiinfraUtility.saveImage(new File(request.getSession().getServletContext().getRealPath("/")+"/WEB-INF/resources/images"), 
//							"user-images/"+profileData.getPartyId(), image, 180,180);
					File storagePath= FiinfraUtility.saveImage(new File(storagePathLocation), 
							"user-images/"+profileData.getPartyId(), image,99 , 128);

					if(storagePath !=null){
					
					String imagePath = "/user-images/" + profileData.getPartyId()+"/" + storagePath.getName();
					documentDatas.get(0).setFileStoragePathURI(storagePath.getAbsolutePath());
					profileData.setAttachmentCount(1);
					profileData.setAttachment(true);
					documentDatas.get(0).setFileName(storagePath.getName());
					documentDatas.get(0).setFileStoragePathURI(imagePath);
					profileData.setDocumentData(documentDatas.get(0));
					profileData.setPhoto(imagePath);
					}
					else{
						documentDatas.clear();
					}

				}
			}
			
			profileData
						.setSectionName(FiinfraConstants.PROFILE_PERSONAL_INFO_1);
			sucsess = service.saveProfile(profileData);

			profileData
					.setSectionName(FiinfraConstants.PROFILE_PERSONAL_INFO_2);
			sucsess = service.saveProfile(profileData);
			String eventXMl = "usp_cp_savePartnerProfileDetails("+userSession.getPartyId()+","+ profileData.getSectionName()+","+FiinfraUtility.getProfileDataXML(profileData,profileData.getSectionName())+","+userSession.getUserId()+")"; 
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.UPDATE_PROFILE_PERSONAL_INFO_2,PARTNER_PROFILE_SOURCE,FiinfraConstants.PROFILE_PERSONAL_INFO_2,eventXMl);
			break;
		}
		case 2: {
			AddressData residenceAddress = profileData.getAddressDataList()
					.get(0);
			AddressData officeAddress = profileData.getAddressDataList().get(1);
			{
				profileData
						.setSectionName(FiinfraConstants.PROFILE_RECIDENCE_ADDRESS);
				residenceAddress
						.setAddressType(FiinfraConstants.PROFILE_RECIDENCE_ADDRESS);
				profileData.getAddressDataList().clear();
				profileData.getAddressDataList().add(residenceAddress);
				residenceAddress.setCity(""+residenceAddress.getCityId());
				sucsess = service.saveProfile(profileData);
			}
			{
				profileData
						.setSectionName(FiinfraConstants.PROFILE_OFFICE_ADDRESS);
				officeAddress
						.setAddressType(FiinfraConstants.PROFILE_OFFICE_ADDRESS);
				profileData.getAddressDataList().clear();
				profileData.getAddressDataList().add(officeAddress);
				officeAddress.setCity(""+officeAddress.getCityId());
				sucsess = service.saveProfile(profileData);
				String eventXMl = "usp_cp_savePartnerProfileDetails("+userSession.getPartyId()+","+ profileData.getSectionName()+","+FiinfraUtility.getProfileDataXML(profileData,profileData.getSectionName())+","+userSession.getUserId()+")";
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.UPDATE_PROFILE_RECIDENCE_ADDRESS,PARTNER_PROFILE_SOURCE,FiinfraConstants.PROFILE_RECIDENCE_ADDRESS,eventXMl);
			}

			break;
		}
		case 3: {
			profileData.setSectionName(FiinfraConstants.PROFILE_BANK_DETAILS);
			sucsess = service.saveProfile(profileData);
			String eventXMl = "usp_cp_savePartnerProfileDetails("+userSession.getPartyId()+","+ profileData.getSectionName()+","+FiinfraUtility.getProfileDataXML(profileData,profileData.getSectionName())+","+userSession.getUserId()+")";
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.UPDATE_PROFILE_BANK_DETAILS,PARTNER_PROFILE_SOURCE,FiinfraConstants.PROFILE_BANK_DETAILS,eventXMl);

			break;
		}
		case 4: {
//			profileData.setSectionName(FiinfraConstants.PROFILE_BANK_DETAILS);
//			sucsess = service.saveProfile(profileData);

			break;
		}

		case 5: {
			profileData = new ProfileData();
			profileData.setPartyId(products.getPartyId());
			attachProductOffering(profileData, products.getProducts());
			
			profileData.setSectionName(FiinfraConstants.PROFILE_FINANCIAL_PRODUCTS);
			profileData.setLastModifiedBy(userSession.getUserId());
			sucsess = service.saveProfile(profileData);
			String eventXMl = "usp_cp_savePartnerProfileDetails("+userSession.getPartyId()+","+ profileData.getSectionName()+","+FiinfraUtility.getProfileDataXML(profileData,profileData.getSectionName())+","+userSession.getUserId()+")";
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.UPDATE_PROFILE_FINANCIAL_PRODUCTS,PARTNER_PROFILE_SOURCE,FiinfraConstants.PROFILE_FINANCIAL_PRODUCTS,eventXMl);
			break;
		}
		case 6: {
//			ProfileData p = service.getProfile(new GetRequest().param("partyId", profileData.getPartyId()));
			profileData.setPassword("");
			profileData
					.setSectionName(FiinfraConstants.PROFILE_USER_ACCOUNT_DETAILS);
			sucsess = service.saveProfile(profileData);
			String eventXMl = "usp_cp_savePartnerProfileDetails("+userSession.getPartyId()+","+ profileData.getSectionName()+","+FiinfraUtility.getProfileDataXML(profileData,profileData.getSectionName())+","+userSession.getUserId()+")";
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.UPDATE_PROFILE_USER_ACCOUNT_DETAILS,PARTNER_PROFILE_SOURCE,FiinfraConstants.PROFILE_USER_ACCOUNT_DETAILS,eventXMl);
			break;
		}
		case 8:{
			
			MultipartFile image = profileData.getImage();
			UserSession user = (UserSession) request.getSession().getAttribute("userSession");
			String logo = null;
			if (image != null) {
				List<DocumentData> documentDatas = new ArrayList<DocumentData>();
				MultipartFile[] files = new MultipartFile[1];
				files[0] = image;
				documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(
						files, currentTime, profileData.getPartyId());
				if (documentDatas != null && documentDatas.size() > 0) {
//					DocumentService docService = getBean(DocumentService.class);
					String storagePathLocation= APP_IMAGE_PATH;//docService.getStoragePath(profileData.getPartyId(),1, 98083 );
//					File storagePath= FiinfraUtility.saveImage(new File(request.getSession().getServletContext().getRealPath("/")+"/WEB-INF/resources/images"), 
//							"logo-images/"+profileData.getPartyId(), image,150,150);
					File storagePath= FiinfraUtility.saveLogo(new File(storagePathLocation), 
							"logo-images/"+profileData.getPartyId(), image,150,50);

					saveLogoDimantions(userSession.getPartyId(), userSession.getBuId(),userSession.getUserName());
					((UserSession) request.getSession().getAttribute("userSession")).setLogoHeight(FiinfraUtility.getLogoHeight());
					((UserSession) request.getSession().getAttribute("userSession")).setLogoWidth(FiinfraUtility.getLogoWidth());

					if(storagePath !=null){
					profileData.setAttachmentCount(1);
					profileData.setAttachment(true);
					profileData.setDocumentData(documentDatas.get(0));
					logo = "/logo-images/" + profileData.getPartyId()+"/" + storagePath.getName();
					documentDatas.get(0).setFileStoragePathURI(logo);
					documentDatas.get(0).setFileName(storagePath.getName());
					profileData.setLogo(logo);
					}else{
						documentDatas.clear();
					}
				}
			}
			profileData.setImage(null);
			
			profileData
					.setSectionName(FiinfraConstants.PROFILE_EMAIL_OTHER_DETAILS);
			sucsess = service.saveProfile(profileData);
			
			profileData
			.setSectionName(FiinfraConstants.PROFILE_EMAIL_DETAILS);
			sucsess = service.saveProfile(profileData);

			profileData
			.setSectionName(FiinfraConstants.PROFILE_EMAIL_SIGNATURE);
			sucsess = service.saveProfile(profileData);

			if(user != null){
				if(logo != null){
					//changes for hierarchy
					if(user.getPartyId() == (Integer) request.getSession().getAttribute("oldPartyID")){
						user.setLogo(logo);	
					}
				}
				//changes for hierarchy
				if(user.getPartyId() == (Integer) request.getSession().getAttribute("oldPartyID")){
					user.setThemeId(profileData.getTheme());
				}
			}
			String eventXMl = "usp_cp_savePartnerProfileDetails("+userSession.getPartyId()+","+ profileData.getSectionName()+","+FiinfraUtility.getProfileDataXML(profileData,profileData.getSectionName())+","+userSession.getUserId()+")";
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.UPDATE_PROFILE_EMAIL_OTHER_DETAILS,PARTNER_PROFILE_SOURCE,FiinfraConstants.PROFILE_EMAIL_OTHER_DETAILS,eventXMl);
			redirectAttributes.addFlashAttribute("success", "success.profile.save");
			redirectAttributes.addFlashAttribute("activeTab", activeTab);
			return "redirect:/partner/personal/info?viewId=8" ;	
			
		}
		

		}
		redirectAttributes.addFlashAttribute("success", "success.profile.save");
		//changes for hierarchy
		if(userSession.getPartyId() == (Integer) request.getSession().getAttribute("oldPartyID") && view==1){
			((UserSession) request.getSession().getAttribute("userSession")).setName(profileData.getFirstName() + " " + profileData.getLastName());
		}
		else if(view==1){
			request.getSession().removeAttribute("selectedNode");
			request.getSession().setAttribute("selectedNode", profileData.getFirstName() + " " + profileData.getLastName());
		}
		redirectAttributes.addFlashAttribute("activeTab", activeTab);
		}
		catch (Exception exception) {
			model.addAttribute("errorMsg", "Error Fetching Data");
			redirectAttributes.addFlashAttribute("error", "error.profile.update");
			String eventXMl = "usp_cp_savePartnerProfileDetails("+userSession.getPartyId()+","+ profileData.getSectionName()+","+FiinfraUtility.getProfileDataXML(profileData,profileData.getSectionName())+","+userSession.getUserId()+")";
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_PARTNER_PROFILE_UPDATE_FAILED,PARTNER_PROFILE_SOURCE,FiinfraConstants.UPDATE_PARTNER_PROFILE_FAILED,eventXMl);
		}

		return "redirect:/partner/personal/info?viewId=" + nextView;
	}
		

	private void populateProfileFormData(Model model, ProfileRequest req,
			ProfileData profile) {

		PartnerService service = getBean(PartnerService.class);
		if (req.getViewId() == 2) {
			KeyValue defaultVal = new KeyValue(-1, "--Select--");			
			List<KeyValue> countries =  toKeyValue(service.getCodeValue("3"));
			countries.add(0, defaultVal);
			model.addAttribute("countries",countries);			
			List<KeyValue> states = toKeyValue(service.getCodeValue("2"));
			states.add(0, defaultVal);
			model.addAttribute("states1", states);
			model.addAttribute("states2", states);
			int selectedState1 = profile.getAddressDataList().get(0).getState();
			int selectedState2 = profile.getAddressDataList().get(1).getState();
			if (selectedState1 <= 0) {
				selectedState1 = states.get(0).getId();
			}
			if (selectedState2 <= 0) {
				selectedState2 = states.get(0).getId();
			}

			List<KeyValue> city1 =toKeyValue(service.getCityList(selectedState1));
			city1.add(0, defaultVal);
			model.addAttribute("cities1",city1);
					
			List<KeyValue> city2 =toKeyValue(service.getCityList(selectedState2));
			city2.add(0, defaultVal);
			model.addAttribute("cities2",city2);
		}
		if (req.getViewId() == 1) {
			
					List<KeyValue>salutations = toKeyValue(service.getCodeValue("81"));
					KeyValue defaultVal = new KeyValue(-1, "--Select--");
					salutations.add(0, defaultVal);
					model.addAttribute("salutations",salutations);
		}
		if(req.getViewId() == 6){
			List<KeyValue> lstKeyValue = toKeyValue(service.getCodeValue("52"));
			Collections.sort(lstKeyValue);
			KeyValue select = new KeyValue();
			select.setId(0);
			select.setName("--Select Question--");
			lstKeyValue.add(0,select);
			model.addAttribute("securityQuestions",lstKeyValue);
		}
		if(req.getViewId() == 5){
			List<CodeValueData> assetList = profile.getAssetClassList();
			List<PartyAttributeData> mfgList = profile.getManufacturerList();
			Map<Integer,List<KeyValue>> map  = new HashMap<Integer,List<KeyValue>>();
			for(CodeValueData asset:assetList){
				Integer assetId = asset.getCodeValueId();
				for(PartyAttributeData mfg:mfgList){
					if(!map.containsKey(assetId)){
						map.put(assetId,new ArrayList<KeyValue>());
					}
					if(mfg.getAttributeCodeId() == assetId){
						map.get(assetId).add(new KeyValue(mfg.getPartyId(),mfg.getAttributeValue()));
					}
				}
			}
			
			model.addAttribute("manufacturers", map);
		}
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("Saving", 68001);
		map.put("Current", 68002);
		model.addAttribute("map", map);

	}
	
	private void attachProductOffering (ProfileData data, ProductOffering[] offerings){
		StringBuilder sb = new StringBuilder();
		
		for(ProductOffering p:offerings){
			sb.append("<AssetClass>");
			sb.append("<DisplaySeqNo>").append(p.getSeq()).append("</DisplaySeqNo>");
			sb.append("<CodeValueId>").append(p.getAssetClass()).append("</CodeValueId>");
			
			sb.append("<IsServiceProvided>").append(p.isActive() ?"1":0).append("</IsServiceProvided>");
			if(p.isActive()){
				sb.append("<ServiceCode>").append(p.getServiceCode()).append("</ServiceCode>");
				if(p.getMfgParties()  != null ){
					sb.append("<Manufacturers>").append(StringUtils.join(p.getMfgParties(),",")).append("</Manufacturers>");
				}
			}
			sb.append("</AssetClass>");
		}
		
		data.setProductXml(sb.toString());
	}
	
	private List<ProductOffering> retriveOffering(ProfileData data){
		List<ProductOffering> lst = new ArrayList<ProductOffering>();
		List<PartyAttributeData> offeringList =  data.getProductOfferingList();
		
		
		for(CodeValueData asset:data.getAssetClassList()){
			ProductOffering offer = new ProductOffering();
			offer.setAssetClass(asset.getCodeValueId());
			offer.setSeq(asset.getDisplaySeqNo());
			offer.setAssetName(asset.getCodeValue());
			LOGGER.debug(asset.getCodeValue()+"  "+asset.getCodeValueId());
			for(Iterator<PartyAttributeData> iter = offeringList.iterator();iter.hasNext();){
				PartyAttributeData o = iter.next();
				if(o.getAttributeValue().equals(""+asset.getCodeValueId())){
					PartyAttributeData active = iter.next();
					PartyAttributeData serviceCode = iter.next();
					PartyAttributeData mfg = iter.next();
					offer.setActive(active.getAttributeValue().equalsIgnoreCase("1"));
					offer.setServiceCode(serviceCode.getAttributeValue());
					offer.setMfgParties(mfg.getAttributeValue().split(","));
					break;
				}
//				if(o.getAttributeValue())
			}
			lst.add(offer);
			
		}
		for(ProductOffering offer:lst){
			LOGGER.debug(offer);			
		}

		return lst;
	}
	
	/************* action plans ********/
	@RequestMapping(value = "/datacollection/car-goal-action-plan/{partyId}", method = RequestMethod.GET)
	public String viewCarGoal(Model m, ProfileRequest q, HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		m.addAttribute("q", q);
		return "partner/car-goal-action-plan";
	}
	
	@RequestMapping(value = "/datacollection/emergency-readiness-action-plan/{partyId}", method = RequestMethod.GET)
	public String viewEmergencyReadiness(Model m, ProfileRequest q, HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		m.addAttribute("q", q);
		return "partner/emergency-readiness-action-plan";
	}
	
	@RequestMapping(value = "/datacollection/risk-cover-action-plan/{partyId}", method = RequestMethod.GET)
	public String viewRiskCover(Model m, ProfileRequest q, HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		m.addAttribute("q", q);
		return "partner/risk-cover-action-plan";
	}
	
	@RequestMapping(value = "/goals")
	public String getGoals(HttpServletRequest request,Model m) {
		
		String userName="";
		int partyId=0;		
		String token = "12345";
		String nodeId="";
		UserSession userSession = null;
		try{
			userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			userName=userSession.getUserName();
			partyId = userSession.getPartyId();
			//code for hierarchy 
			m.addAttribute("hierarchy", 1);
			nodeId = request.getSession().getAttribute("nodeId").toString();
		}catch(Exception ex){
			LOGGER.error("Error occured while fetching user details in PartnerProfileController/getGoals : ", ex);
		}
		
		String partnerSetupLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 283);// Partner Setup links
		m.addAttribute("partnerSetupLinks", partnerSetupLinks);
		request.getSession().setAttribute("partnerSetupLinks", partnerSetupLinks);
		
		String roleBaseLinks =commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 323);// Partner Dashboard links
		m.addAttribute("roleBaseLinks", roleBaseLinks);
		request.getSession().setAttribute("smallMenuLinks", roleBaseLinks);
		
		Integer buId = userSession.getBuId();
		
		BaseResponse<AdviserGoals> baseResponse = new BaseResponse<AdviserGoals>();
		List<AdviserGoals> adviserGoalsList = new ArrayList<AdviserGoals>();
		List<AdviserGoals> adviserGoalsList1 = new ArrayList<AdviserGoals>();
		Map<Integer,List<AdviserGoals>> adviserGoalsMap=new HashMap<Integer,List<AdviserGoals>>();
		
		BaseResponse<AdviserGoalChart> baseResponse1 = new BaseResponse<AdviserGoalChart>();		
		List<AdviserGoalChart> adviserGoalChartList=new ArrayList<AdviserGoalChart>();
		List<AdviserGoalChart> adviserGoalChartList1=new ArrayList<AdviserGoalChart>();
		Map<Integer,List<AdviserGoalChart>> adviserGoalChartMap=new HashMap<Integer,List<AdviserGoalChart>>();
		
		int goalTypeId=0;
		double netGoalAmount=0.0;
		
		baseResponse  =  restTemplate.getForObject(GET_PARTNER_GOALS_URL+"/"+userName+"/"+partyId+"/"+token+"?buId="+buId+"&nodeId="+nodeId, BaseResponse.class);
		if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			try 
			{	//to extract password policy from responce object
				adviserGoalsList = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				for(int i=0;i<adviserGoalsList.size();++i)
				{
					AdviserGoals  adviserGoals= objectMapper.readValue(objectMapper.writeValueAsString(adviserGoalsList.get(i)), AdviserGoals.class);
					
					
					if((null!=adviserGoals) && (adviserGoals.getGoalTypeId()!=0)){														
						
						if(adviserGoalsMap.containsKey(adviserGoals.getGoalTypeId())){
							/*if(null!=adviserGoals.getAmount()){*/
								netGoalAmount=netGoalAmount + adviserGoals.getAmount();
							//}							
							adviserGoalsList1=adviserGoalsMap.get(adviserGoals.getGoalTypeId());
							adviserGoalsList1.add(adviserGoals);
							
							adviserGoalsMap.put(adviserGoals.getGoalTypeId(), adviserGoalsList1);
						}else{
							
							if(goalTypeId!=0){
								if(goalTypeId==35001){
									m.addAttribute("educationGoalAmount",netGoalAmount);
								}else if(goalTypeId==35003){
									m.addAttribute("propertyGoalAmount",netGoalAmount);
								}else if(goalTypeId==35004){
									m.addAttribute("weddingGoalAmount",netGoalAmount);
								}else if(goalTypeId==35005){
									m.addAttribute("travelGoalAmount",netGoalAmount);
								}else if(goalTypeId==35006){
									m.addAttribute("carsGoalAmount",netGoalAmount);
								}else if(goalTypeId==35008){
									m.addAttribute("specialGoalAmount",netGoalAmount);
								}else if(goalTypeId==35012){
									m.addAttribute("businessGoalAmount",netGoalAmount);
								}else if(goalTypeId==35013){
									m.addAttribute("otherGoalAmount",netGoalAmount);
								}else if(goalTypeId==35016){
									m.addAttribute("targetCorpusGoalAmount",netGoalAmount);
								}
							}							
							netGoalAmount=0.0;
							goalTypeId=adviserGoals.getGoalTypeId();
							//if(null!=adviserGoals.getAmount()){
								netGoalAmount=netGoalAmount + adviserGoals.getAmount();
							//}							
							adviserGoalsList1=new ArrayList<AdviserGoals>();
							adviserGoalsList1.add(adviserGoals);
							adviserGoalsMap.put(adviserGoals.getGoalTypeId(), adviserGoalsList1);
						}
						
					}//end of if
					
				}
				if(goalTypeId!=0){
					if(goalTypeId==35001){
						m.addAttribute("educationGoalAmount",netGoalAmount);
					}else if(goalTypeId==35003){
						m.addAttribute("propertyGoalAmount",netGoalAmount);
					}else if(goalTypeId==35004){
						m.addAttribute("weddingGoalAmount",netGoalAmount);
					}else if(goalTypeId==35005){
						m.addAttribute("travelGoalAmount",netGoalAmount);
					}else if(goalTypeId==35006){
						m.addAttribute("carsGoalAmount",netGoalAmount);
					}else if(goalTypeId==35008){
						m.addAttribute("specialGoalAmount",netGoalAmount);
					}else if(goalTypeId==35012){
						m.addAttribute("businessGoalAmount",netGoalAmount);
					}else if(goalTypeId==35013){
						m.addAttribute("otherGoalAmount",netGoalAmount);
					}else if(goalTypeId==35016){
						m.addAttribute("targetCorpusGoalAmount",netGoalAmount);
					}
				}
			}catch(Exception ex){
				LOGGER.error("Error occured while retrieving goals : ", ex);
			}
			
			baseResponse1=restTemplate.getForObject(GET_PARTNER_GOAL_CHART_URL+"/"+userName+"/"+partyId+"/"+token+"?buId="+buId, BaseResponse.class);
			if(baseResponse1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				try 
				{	//to extract password policy from responce object
					adviserGoalChartList = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse1.getResponseListObject()), List.class);
					for(int i=0;i<adviserGoalChartList.size();++i)
					{
						AdviserGoalChart  adviserGoalChart= objectMapper.readValue(objectMapper.writeValueAsString(adviserGoalChartList.get(i)), AdviserGoalChart.class);
						
						if((null!=adviserGoalChart) && (adviserGoalChart.getGoalTypeId()!=0)){														
							
							if(adviserGoalChartMap.containsKey(adviserGoalChart.getGoalTypeId())){
								adviserGoalChartList1=adviserGoalChartMap.get(adviserGoalChart.getGoalTypeId());
								adviserGoalChartList1.add(adviserGoalChart);
								adviserGoalChartMap.put(adviserGoalChart.getGoalTypeId(), adviserGoalChartList1);
							}else{
								adviserGoalChartList1=new ArrayList<AdviserGoalChart>();
								adviserGoalChartList1.add(adviserGoalChart);
								adviserGoalChartMap.put(adviserGoalChart.getGoalTypeId(), adviserGoalChartList1);
							}
							
						}//end of if
						
					}
				}catch(Exception ex){
					LOGGER.error("Error occured while retrieving goals : ", ex);
				}
			}
			//cars
			m.addAttribute("carGoalsList",adviserGoalsMap.get(new Integer("35006")));
			m.addAttribute("carGoalChartList",adviserGoalChartMap.get(new Integer("35006")));
			//property
			m.addAttribute("propertyGoalsList",adviserGoalsMap.get(new Integer("35003")));
			m.addAttribute("propertyGoalChartList",adviserGoalChartMap.get(new Integer("35003")));
			//special
			m.addAttribute("specialGoalsList",adviserGoalsMap.get(new Integer("35008")));
			m.addAttribute("specialGoalChartList",adviserGoalChartMap.get(new Integer("35008")));
			//other
			m.addAttribute("othersGoalsList",adviserGoalsMap.get(new Integer("35013")));
			m.addAttribute("othersGoalChartList",adviserGoalChartMap.get(new Integer("35013")));
			//business
			m.addAttribute("businessGoalsList",adviserGoalsMap.get(new Integer("35012")));
			m.addAttribute("businessGoalChartList",adviserGoalChartMap.get(new Integer("35012")));
			//education
			m.addAttribute("educationGoalsList",adviserGoalsMap.get(new Integer("35001")));
			m.addAttribute("educationGoalChartList",adviserGoalChartMap.get(new Integer("35001")));
			//wedding
			m.addAttribute("weddingGoalsList",adviserGoalsMap.get(new Integer("35004")));
			m.addAttribute("weddingGoalChartList",adviserGoalChartMap.get(new Integer("35004")));
			//travel
			m.addAttribute("travelGoalsList",adviserGoalsMap.get(new Integer("35005")));
			m.addAttribute("travelGoalChartList",adviserGoalChartMap.get(new Integer("35005")));
			//target corpus
			m.addAttribute("targetCorpusGoalsList",adviserGoalsMap.get(new Integer("35016")));
			m.addAttribute("targetCorpusChartList",adviserGoalChartMap.get(new Integer("35016")));
			
		}
		
		return "partner/goals";
	}
	
	public static String getThemePath(UserSession user){
		if(user ==null){
			return null;
		}
		int theme = user.getThemeId();
		switch(theme){
		case 92001 :{
			return null;
		}
		//Red
		case 92002:{
			return "theme_red/theme_red.css";
		}
		//Blue
		case 92003:{
			return "theme_blue/theme_blue.css";
		}
		//Red
		case 92004:{
			return "theme_green/theme_green.css";
		}
		default:{
			
			return null;
		}
		
		
		}
	}
	
	private List<CodeValueData> getListOfCodeValueData(String codeTypeIds,String username,Integer buId,String token)
	{
		try 
		{
			BaseResponse< CodeValueData> baseResponse = new BaseResponse<CodeValueData>();
			//code for populate search list
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PICKLIST_VALUELIST+"/"+username+"/"+token);
			uriCB.queryParam("buId", buId);
			uriCB.queryParam("codeTypeIds", codeTypeIds);
			
			//call service to populate dropdown for search
			baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
			List<CodeValueData> codeValueDatas = new ArrayList<CodeValueData>();
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				codeValueDataList = baseResponse.getResponseListObject();
				//get the actual CodeValueData object from its LinkedHashMap representation
				Integer size = codeValueDataList.size();
				for(int i = 0; i<size; i++){
					CodeValueData codeValueData = objectMapper.readValue(objectMapper.writeValueAsString(codeValueDataList.get(i)), CodeValueData.class);
					codeValueDatas.add(codeValueData);
				}
				return codeValueDatas;
			}
		} 
		catch (Exception exception)
		{
			LOGGER.debug("exception while getting List of code value data	 "+exception.getMessage());
		}
		return null;
	}
	
	private List<AdviceAssumption> getAssumptions(Integer buId, Integer partnerPartyId, Integer clientPartyId, String attributeCodeIds ) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException {
		List<AdviceAssumption> adviceAssumptionList = new ArrayList<AdviceAssumption>();
		List<AdviceAssumption> adviceAssumptionListJson = new ArrayList<AdviceAssumption>();
		try {
			String token = "153443";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSUMPTIONS + "/" + token + "?buId=" + buId);
			PartySettingInput partySettingInput = new PartySettingInput();
			partySettingInput.setPartnerPartyId(partnerPartyId);
			partySettingInput.setBuPartyId(buId);
			partySettingInput.setClientPartyId(clientPartyId);
			partySettingInput.setAssumptionCodeIds(attributeCodeIds);
			BaseResponse<AdviceAssumption> baseResponse = new BaseResponse<AdviceAssumption>();
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partySettingInput,
					BaseResponse.class);

			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				adviceAssumptionListJson = baseResponse.getResponseListObject();
			}
			
			AdviceAssumption temp;
			for(int i=0;i<adviceAssumptionListJson.size();i++) {
				temp = objectMapper.readValue(objectMapper.writeValueAsString(adviceAssumptionListJson.get(i)), AdviceAssumption.class);
				adviceAssumptionList.add(temp);
			}
			 healthAssumtion = null;
			for(AdviceAssumption assum:adviceAssumptionList) {
				if(assum.getAssumptionCodeId() == 98046) {
					healthAssumtion = assum;
				}
			}
			
			if(healthAssumtion != null) {
				 scale = 100000;
				Integer amount = Integer.parseInt((String)healthAssumtion.getAssumptionValue());
				amount = amount/1000;
				if(amount<100) {
					scale = 1000;
				}
				else {
					amount = amount/100;
					if(amount<100) {
						scale = 100000;
					} else {
						scale = 10000000;
					}
						
				}
				
				Integer startRange = Integer.parseInt(healthAssumtion.getValueStartRange())/scale;
				Integer endrange = Integer.parseInt(healthAssumtion.getValueEndRange())/scale;
				healthAssumtion.setValueStartRange(startRange.toString());
				healthAssumtion.setValueEndRange(endrange.toString());
				healthAssumtion.setAssumptionValue(Integer.parseInt((String)healthAssumtion.getAssumptionValue())/scale);
				
			}
		} catch (RestClientException e) {
			LOGGER.error("Error Geting Assumption Data", e);
		}
		
		return adviceAssumptionList;
	}
	
	@RequestMapping(value = "/addDocument", method = {RequestMethod.GET})
	public String getPlanId(HttpServletRequest request,final RedirectAttributes redirectAttributes) {
		String url="";
		try {
				UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					return "redirect:/login";
				}
				String partyId =request.getParameter("partyId");
				url =url + request.getParameter("url");
				String user = userSession.getUserName();
				String token = "153443";
				Integer buId = userSession.getBuId();
				Integer fpPlanId = null;
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PLANID_FOR_PARTYID +  user + "/" + partyId + "/" + token +"?buId="+buId);
				BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
				baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{
					fpPlanId = baseResponse.getResponseObject();
				}
				String addDocUrl = "/document/view?refId=" + fpPlanId + "&refTypeId=111012&partyId=" + partyId + "&returnUrl=" + url ;
				if(fpPlanId ==0)
				{
					redirectAttributes.addFlashAttribute("error", "error.document.add");
					return "redirect:"+url;
				}
				return "redirect:" + addDocUrl;
		}
		catch(Exception exception) {
			return "redirect:"+url;	
		}
			
	}
	
	@RequestMapping(value = "/getPlanIdForNotes", method = {RequestMethod.GET})
	public String getPlanForNotes(HttpServletRequest request,final RedirectAttributes redirectAttributes) {
		String url="";
		try {
				UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					return "redirect:/login";
				}
				String partyId =request.getParameter("partyId");
				url =url + request.getParameter("url");
				String user = userSession.getUserName();
				String token = "153443";
				Integer buId = userSession.getBuId();
				Integer fpPlanId = null;
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PLANID_FOR_PARTYID +  user + "/" + partyId + "/" + token +"?buId="+buId);
				BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
				baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{
					fpPlanId = baseResponse.getResponseObject();
				}
				String addDocUrl = "/notes/note?refId=" + fpPlanId + "&refTypeId=111012&partyId=" + partyId + "&returnUrl=" + url ;
				if(fpPlanId ==0)
				{
					redirectAttributes.addFlashAttribute("error", "error.document.add");
					return "redirect:"+url;
				}
				return "redirect:" + addDocUrl;
		}
		catch(Exception exception) {
			return "redirect:"+url;	
		}
			
	}
	
	@SuppressWarnings("unchecked")
	public Integer getDataForChart(int buId, int partyId, String chartType, String userName,String nodeId) throws IOException {
		String url = GET_CHART_DATA_LIST + userName + "/1234";
		LOGGER.info("URL ---------------------> " + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("chartType", chartType);
		uriCB.queryParam("nodeId", nodeId);
		BaseResponse<ChartData> br = new BaseResponse<ChartData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<ChartData> chartDataList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			chartDataList = br.getResponseListObject();
		int d= chartDataList.size();
		List<ChartData> charDataValues = new ArrayList<ChartData>();
		for(int i = 0; i<chartDataList.size(); i++){
			ChartData chartData = objectMapper.readValue(objectMapper.writeValueAsString(chartDataList.get(i)), ChartData.class);
			charDataValues.add(chartData);
		}
		if(!charDataValues.isEmpty()){
			ChartData data = charDataValues.get(0);
			return data.getCount();
		}else{
			return 0;
		}
		
		
	}
	
	@RequestMapping(value="/getCalenderData", method = RequestMethod.GET )
	public @ResponseBody List<ChartData> getCalenderData(HttpServletRequest request) throws IOException {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String url = GET_CHART_DATA_LIST + userSession.getName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", userSession.getBuId());
		uriCB.queryParam("partyId", userSession.getPartyId());
		uriCB.queryParam("chartType", "Taskbydate");
		uriCB.queryParam("nodeId", request.getSession().getAttribute("nodeId").toString());
		BaseResponse<ChartData> br = new BaseResponse<ChartData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<ChartData> chartDataList = new ArrayList<ChartData>();
		/*if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			chartDataList = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), List.class);
		int size= chartDataList.size();
		List<ChartData> chartDataValues = new ArrayList<ChartData>();
		for(int i = 0; i<size; i++){
			ChartData chartData = objectMapper.readValue(objectMapper.writeValueAsString(chartDataList.get(i)), ChartData.class);
			chartDataValues.add(chartData);
		}*/
		return br.getResponseListObject();
		
	}
	

	/*@RequestMapping(value = "/goal/view-bucket-allocation/{partyId}/{riskProfileId}", method = RequestMethod.GET)
	public String ViewGoalBucketAllocation(Model model, @PathVariable String partyId, 
			@PathVariable String riskProfileId, HttpServletRequest request) 
	{	
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			model.addAttribute("partyId", partyId);
			
			GoalPlanInput goalPlanInput = new GoalPlanInput();
			goalPlanInput.setSectionTypeId(39005);
			goalPlanInput.setClientPartyId(Integer.parseInt(partyId));
			goalPlanInput.setPartnerPartyId(userSession.getPartyId());
			goalPlanInput.setBuPartyId(userSession.getBuId());
			goalPlanInput.setAssetClassId("46001,46002,46003");
			goalPlanInput.setGoalYearRangeId(null);
			goalPlanInput.setRecommendationRecordTypeId(50001);
			goalPlanInput.setCategoryId(null);
			
			String equityReturns = "";
			String debtReturns = "";
			String goldReturns = "";
			
			if(Integer.parseInt(riskProfileId) != -1){
				goalPlanInput.setRiskProfileId(Integer.parseInt(riskProfileId));
				
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_GOAL_BUCKET_ALLOCATION 
						+ "/" + userSession.getUserName() + "/" + "12345");			
				uriCB.queryParam("buId", userSession.getBuId());
				BaseResponse<AdviceRecommendation> br = new BaseResponse<AdviceRecommendation>();
							
				br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalPlanInput, BaseResponse.class);
				
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
					List<AdviceRecommendation> recommendations = br.getResponseListObject();
					model.addAttribute("recommendations", recommendations);
				} else {
					model.addAttribute("recommendations", null);
				}
				
				String attributeCodeIds = "98028,98020,98045";
				Integer clientPartyId = -1;
				List<AdviceAssumption> assumptions = new ArrayList<AdviceAssumption>();
				List<AdviceAssumption> adviceAssumptions = getAssumptions( userSession.getBuId(), userSession.getPartyId(),
						clientPartyId, attributeCodeIds);
				for(int i = 0; i<adviceAssumptions.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					AdviceAssumption assumption = objectMapper.readValue(objectMapper.writeValueAsString(adviceAssumptions.get(i)), AdviceAssumption.class);
					assumptions.add(assumption);
				}
				for (AdviceAssumption adviceAssumption : assumptions) {
					if( adviceAssumption.getAssumptionCodeId() == 98045 ) {
						goldReturns = adviceAssumption.getAssumptionValue().toString();
					} else if( adviceAssumption.getAssumptionCodeId() == 98028 ) {
						equityReturns = adviceAssumption.getAssumptionValue().toString();
					} else {
						debtReturns = adviceAssumption.getAssumptionValue().toString();
					}
				}
				model.addAttribute("equityReturns", equityReturns);
				model.addAttribute("debtReturns", debtReturns);
				model.addAttribute("goldReturns", goldReturns);
				
			} else if(Integer.parseInt(riskProfileId) == -1){
				
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_GOAL_BUCKET_ALLOCATION 
						+ "/" + userSession.getUserName() + "/" + "12345");			
				uriCB.queryParam("buId", userSession.getBuId());
				BaseResponse<AdviceRecommendation> br = new BaseResponse<AdviceRecommendation>();

				// fetch for Conservative
				goalPlanInput.setRiskProfileId(40001);
											
				br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalPlanInput, BaseResponse.class);
				
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
					List<AdviceRecommendation> recommendations = br.getResponseListObject();
					model.addAttribute("recommendationsCONS", recommendations);
				} else {
					model.addAttribute("recommendationsCONS", null);
				}

				// fetch for Balanced
				goalPlanInput.setRiskProfileId(40002);
							
				br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalPlanInput, BaseResponse.class);
				
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
					List<AdviceRecommendation> recommendations = br.getResponseListObject();
					model.addAttribute("recommendationsBAL", recommendations);
				} else {
					model.addAttribute("recommendationsBAL", null);
				}
				
				// fetch for Aggressive
				goalPlanInput.setRiskProfileId(40003);
				br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalPlanInput, BaseResponse.class);				
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
					List<AdviceRecommendation> recommendations = br.getResponseListObject();
					model.addAttribute("recommendationsAggr", recommendations);
				} else {
					model.addAttribute("recommendationsAggr", null);
				}
			}
			
		}catch(Exception e){
			LOGGER.error("Error Fetching ");
		}
		return "partner/goal/view-bucket-allocation";	
	}	
	
*/	
	/**
	 * This method performs Audit 
	 * @param actionByPartyId of type int
	 * @param actionByUserId of type int
	 * @param eventId of type int
	 * @param sourceModule of type {@link java.lang.String}
	 * @param sourceScreen of type {@link java.lang.String}
	 */
	private void audit(int actionByPartyId, int actionByUserId, int eventId, String sourceModule, String sourceScreen,String eventTextXML){
		try{
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);				
			audit.setActionByUserID(actionByUserId);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_MOBILE_PORTAL);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
			audit.setEventTextXML(eventTextXML);
			FrameworkUtil.audit(audit);
		} catch(Exception exception){
			LOGGER.error("Error occured while doing Audit", exception);
		}		
	}
	
	private void saveUserAccessLog(Integer userId,String password,String url,String sessionId,String ipAddress,String username)
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
		accessLog.setSourceSystemId(FiinfraConstants.DIY);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_USER_ACCESS_LOG+ username+"/" + token);
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), accessLog, BaseResponse.class);
		
		
	}
	
	@RequestMapping(value = "/getInterstedFpSection", method = RequestMethod.GET)
	public String getInterstedFpSection(Model model,HttpServletRequest request)
	{
		String clientPartyId = (String) request.getParameter("clientPartyId");
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String fpSection = getFpSection(request, clientPartyId);
		model.addAttribute("sections", fpSection);
		if(clientPartyId != null && clientPartyId != "" )
		{
			model.addAttribute("clientPartyId", clientPartyId);
			String roleBaseLinks =commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 322);// DC Contact FPSection
			model.addAttribute("roleBaseLinks", roleBaseLinks);
		}
		else
		{
			String roleBaseLinks =commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 321);// DC Partner FPSection
			model.addAttribute("roleBaseLinks", roleBaseLinks);
		}
		
		return "profile/interested-fp";
	}
	
	@Produces("application/json")
	@RequestMapping(value = "/saveInterstedFpSection", method = RequestMethod.GET)
	public @ResponseBody String saveInterstedFpSection(Model model,HttpServletRequest request)
	{
		String sectionId =(String) request.getParameter("sectionId");
		String clientPartyId = request.getParameter("clientPartyId");
		String sectionName = "InterestFPSection";
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_INTERESTED_FP_SECTION + userSession.getUserName() + "/1234");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int lastModifiedBy = userSession.getUserId();
		uriCB.queryParam("buId", buId);
		//check for partner or client
		if(clientPartyId != null && clientPartyId != "")
		{
			uriCB.queryParam("partyId", clientPartyId);
		}
		else
		{
			uriCB.queryParam("partyId", partyId);
		}
		
		uriCB.queryParam("lastModifiedBy", lastModifiedBy);
		KeyValue keyValue = new KeyValue();
		keyValue.setId(91115);//set attribute section id
		keyValue.setName(sectionId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), keyValue, BaseResponse.class);
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.PARTNER_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_MOBILE_PORTAL);
		audit.setSourceModule("Partner Profile");
		String eventXML = "usp_DIY_insertOrUpdateFPSection("+partyId+","+keyValue.getId()+","+keyValue.getName()+","+lastModifiedBy+")";
		audit.setEventTextXML(eventXML);
		audit.setSourceScreen(sectionName);
		FrameworkUtil.audit(audit);
		
		return "success";
	}
	
	
	@RequestMapping(value="/getValidPanNo", method = RequestMethod.GET)
	public @ResponseBody String getValidPanNo( HttpServletRequest request )
	{
		String msg = "";
		Integer partyId = 0;
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
		
		partyId = userSession.getPartyId();
		String panNo = request.getParameter("panNo");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_VALID_PAN_NUMBER + "/" + userSession.getUserName() + "/" + panNo + "/" + partyId + "/" + "12345");			
		uriCB.queryParam("buId", userSession.getBuId());
		BaseResponse<String> br = new BaseResponse<String>();
		
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			msg = br.getResponseObject();
		}
		
		}catch( Exception e ){
			LOGGER.error("Error Fetching ");
		}
		
		return msg;
	}
	
	public String getFpSection(HttpServletRequest request,String clientPartyId)
	{
		try {
			
			String token ="432";
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			BaseResponse<KeyValue> baseResponce = new BaseResponse<KeyValue>();
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_INTERESTED_FP_SECTION+ userSession.getUserName()+"/" + token);
			uriCB.queryParam("buId", userSession.getBuId());
			uriCB.queryParam("partnerPartyId", userSession.getPartyId());
			uriCB.queryParam("clientPartyId", clientPartyId);
			BaseResponse<Party> br = new BaseResponse<Party>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<KeyValue> interestdFpJson = new ArrayList<>();
			List<KeyValue> interestdFp = new ArrayList<>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				interestdFpJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), List.class);
				for(int i = 0; i<interestdFpJson.size(); i++){										
					KeyValue keyValue = null;
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(interestdFpJson.get(i)), KeyValue.class);
					interestdFp.add(keyValue);
				}
				
			}
			LOGGER.debug(interestdFp.get(0).getName());
			
			return interestdFp.get(0).getName();
		}
		catch (Exception e) 
		{
			LOGGER.debug("error while parsing list "+e.getMessage());
		}
		
		
		return null;
		
	}
	
	private void saveSectionIdToSession(HttpServletRequest request)
	{
		String sectionId =(String) request.getSession().getAttribute("fpSection");
		List<Integer> sectionList = new ArrayList<Integer>();
		
		if(sectionId.contains("39002"))//cash flow
		{
			sectionList.add(39002);
		}
		if(sectionId.contains("39005"))//Goal Ready
		{
			sectionList.add(39005);
		}
		if(sectionId.contains("39003"))//Risk Cover
		{
			sectionList.add(39003);
		}
		if(sectionId.contains("39008"))//Loan Status
		{
			sectionList.add(39008);
		}
		if(sectionId.contains("39001"))// emergency 
		{
			sectionList.add(39001);
		}
		if(sectionId.contains("39006"))//Retirement
		{
			sectionList.add(39006);
		}
		if(sectionId.contains("39007"))//Succession
		{
			sectionList.add(39007);
		}
	
		request.getSession().setAttribute("sectionId", sectionList);
		
	}
	
	private String getNextUrl(List<Integer> sectionList ,Integer currentSectionId,String partyId,String headername,Integer fpPlanTypeID)
	{
		int index=0;
		String nexturl;
		for(int i=0;i<sectionList.size();++i)
		{
			if(sectionList.get(i).equals(currentSectionId))
			{
				index = i;
			}
		}
		
		if(index+1 >= sectionList.size())
		{
			nexturl = "/partner/datacollection/" + partyId+"/"+headername+"/1";
			return nexturl;
		}
		else
		{
			Integer section = sectionList.get(index+1);
			if(section ==39002)//cash flow
			{
				
				nexturl = "/partner/datacollection/cash-flow/"+partyId;
			
				return nexturl;
			}
			else if(section ==39005)//Goal Ready
			{
				if(fpPlanTypeID==522002)//advanced
				{
					nexturl = "/assets/assetSummary/"+partyId;
				}else{
				nexturl = "/partner/datacollection/financial-readiness/"+partyId;
				}
				return nexturl;
			}
			else if(section ==39003)//Risk Cover
			{
				if(fpPlanTypeID==522002)//advanced
				{
					nexturl = "/insurance/showInsuranceSummary/generalInsurance/"+partyId;
				}
				else{
					nexturl = "/partner/datacollection/risk-cover/"+partyId;
				}
				
				return nexturl;
			}
			else if(section ==39008)//Loan Status
			{
				nexturl = "/partner/datacollection/loan-status/"+partyId;
				return nexturl;
			}
			else if(section ==39001)// emergency 
			{
				nexturl = "/partner/datacollection/emergency-readiness/"+partyId;
				return nexturl;
			}
			else if(section ==39006)//Retirement
			{
				nexturl = "/partner/datacollection/retirement-planning/"+partyId;
				return nexturl;
			}
			else if(section ==39007)//Succession
			{
				nexturl = "/partner/datacollection/succession-readiness/"+partyId;
				return nexturl;
			}
			else
			{
				nexturl = "/partner/datacollection/" + partyId+"/"+headername+"/1";
				return nexturl;
			}
	
		}
		
	}
	
	private String getBackUrl(List<Integer> sectionList ,Integer currentSectionId,String partyId,String headername)
	{
		int index=0;
		String backUrl;
		for(int i=0;i<sectionList.size();++i)
		{
			if(sectionList.get(i).equals(currentSectionId))
			{
				index = i;
			}
		}
		
		if(index-1 < 0)
		{
			backUrl = "/partner/datacollection/" + partyId+"/"+headername+"/1";
			return backUrl;
		}
		else
		{
			Integer section = sectionList.get(index-1);
			if(section ==39002)//cash flow
			{
				backUrl = "/partner/datacollection/cash-flow/"+partyId;
				return backUrl;
			}
			else if(section ==39005)//Goal Ready
			{
				backUrl = "/partner/datacollection/financial-readiness/"+partyId;
				return backUrl;
			}
			else if(section ==39003)//Risk Cover
			{
				backUrl = "/partner/datacollection/risk-cover/"+partyId;
				return backUrl;
			}
			else if(section ==39008)//Loan Status
			{
				backUrl = "/partner/datacollection/loan-status/"+partyId;
				return backUrl;
			}
			else if(section ==39001)// emergency 
			{
				backUrl = "/partner/datacollection/emergency-readiness/"+partyId;
				return backUrl;
			}
			else if(section ==39006)//Retirement
			{
				backUrl = "/partner/datacollection/retirement-planning/"+partyId;
				return backUrl;
			}
			else if(section ==39007)//Succession
			{
				backUrl = "/partner/datacollection/succession-readiness/"+partyId;
				return backUrl;
			}
			else
			{
				backUrl = "/partner/datacollection/" + partyId+"/"+headername+"/1";
				return backUrl;
			}
	
		}
	
	}

	@RequestMapping(value = "/autoPlan/{partyId}/{name}", method = {RequestMethod.GET,RequestMethod.POST})
	@SuppressWarnings("unchecked")
	public String getClientAutoPlanDetails(Model model, @PathVariable String partyId,@PathVariable("name") String headerName, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String url = URL_GET_CLIENT_AUTOPLAN_DETAILS + userSession.getUserName()
				+ "/1234";
		String token="12345";
		LOGGER.info("URL --> " + url);
		int buId = userSession.getBuId();
		//int partyId = Integer.parseInt(request.getParameter("partyId"));
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
		autoPlanData.setPartyId(Integer.parseInt(partyId));
		String baseUrl="";
		if ( ( request.getServerPort() == 80 ) ||
		         ( request.getServerPort() == 443 ) ){
			baseUrl = request.getScheme() + "://" + request.getServerName() ;				
		}
		else{
			baseUrl = request.getScheme() + "://" +
			        request.getServerName() + ":" + request.getServerPort();				
		}
		
		UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7002/"+partyId+"/342");
		uri.queryParam("buId", userSession.getBuId());
		BaseResponse<Boolean> br1 = new BaseResponse<Boolean>();
		br1 = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
		uri = UriComponentsBuilder.fromHttpUrl(GET_PARTY + "/"+partyId +"/"+ userSession.getUserName() + "/"+token+"?buId="+buId);
		BaseResponse<Party> brp = new BaseResponse<Party>();
		
		//call service for all parties associated 
		brp = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uri), BaseResponse.class).getBody();
		
		Party party = new Party();
		
		if (brp.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				party = objectMapper.readValue(objectMapper.writeValueAsString(brp.getResponseObject()), Party.class);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		autoPlanData.setPartyId(Integer.parseInt(partyId));
		if(autoPlanData.getDob()!=null)
		{
			autoPlanData.setDob(autoPlanData.getDob().replace("/","-"));
		}
		model.addAttribute("autoPlanData", autoPlanData);
		model.addAttribute("partyId", Integer.parseInt(partyId));
		model.addAttribute("partnerPartyId", userSession.getPartyId());
		model.addAttribute("familyDetailsSize", autoPlanData.getFamilyMemberDatas().size());
		model.addAttribute("goalDataSize", autoPlanData.getGoalDatas().size());
		model.addAttribute("userName",(String)request.getSession().getAttribute("USER_NAME"));
		model.addAttribute("buId",userSession.getBuId());
		model.addAttribute("advisorName",userSession.getName());
		model.addAttribute("baseUrl",baseUrl);
		model.addAttribute("party",party);
		model.addAttribute("roleId", userSession.getRoleId());
		model.addAttribute("themeName", userSession.getThemeName());
		model.addAttribute("userId", userSession.getUserId());
		model.addAttribute("statusFlag", request.getParameter("statusFlag"));
		int autoplanLink = 299;
		String autoplan = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(), userSession.getUserName(), userSession.getBuId(), autoplanLink);
				model.addAttribute("roleBaseLinks",autoplan);
				
		headerName = headerName + " (Client)";
		request.getSession().setAttribute("headerName", headerName);
		
		
	return "partner/autoPlan";
}

	@RequestMapping(value = "/quickDC/{partyId}/{name}/{recordType}", method = {RequestMethod.GET,RequestMethod.POST})
	@SuppressWarnings("unchecked")
	public String getquickDC(Model model, @PathVariable String partyId,@PathVariable("name") String headerName, @PathVariable("recordType") Integer recordType,HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String url = URL_GET_CLIENT_AUTOPLAN_DETAILS + userSession.getUserName()
				+ "/1234";
		String token="12345";
		LOGGER.info("URL --> " + url);
		int buId = userSession.getBuId();
		//int partyId = Integer.parseInt(request.getParameter("partyId"));
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
		autoPlanData.setPartyId(Integer.parseInt(partyId));
		String baseUrl="";
		if ( ( request.getServerPort() == 80 ) ||
		         ( request.getServerPort() == 443 ) ){
			baseUrl = request.getScheme() + "://" + request.getServerName() ;				
		}
		else{
			baseUrl = request.getScheme() + "://" +
			        request.getServerName() + ":" + request.getServerPort();				
		}
		
		/*UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7002/"+partyId+"/342");
		uri.queryParam("buId", userSession.getBuId());
		BaseResponse<Boolean> br1 = new BaseResponse<Boolean>();
		br1 = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
		uri = UriComponentsBuilder.fromHttpUrl(GET_PARTY + "/"+partyId +"/"+ userSession.getUserName() + "/"+token+"?buId="+buId);
		BaseResponse<Party> brp = new BaseResponse<Party>();
		
		//call service for all parties associated 
		brp = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uri), BaseResponse.class).getBody();
		
		Party party = new Party();
		
		if (brp.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				party = objectMapper.readValue(objectMapper.writeValueAsString(brp.getResponseObject()), Party.class);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/
		autoPlanData.setPartyId(Integer.parseInt(partyId));
		if(autoPlanData.getDob()!=null)
		{
			autoPlanData.setDob(autoPlanData.getDob().replace("/","-"));
		}
		model.addAttribute("autoPlanData", autoPlanData);
		model.addAttribute("partyId", Integer.parseInt(partyId));
		model.addAttribute("partnerPartyId", userSession.getPartyId());
		model.addAttribute("familyDetailsSize", autoPlanData.getFamilyMemberDatas().size());
		model.addAttribute("goalDataSize", autoPlanData.getGoalDatas().size());
		model.addAttribute("userName",(String)request.getSession().getAttribute("USER_NAME"));
		model.addAttribute("buId",userSession.getBuId());
		model.addAttribute("advisorName",userSession.getName());
		model.addAttribute("baseUrl",baseUrl);
		//model.addAttribute("party",party);
		model.addAttribute("roleId", userSession.getRoleId());
		model.addAttribute("themeName", userSession.getThemeName());
		model.addAttribute("userId", userSession.getUserId());
		model.addAttribute("statusFlag", request.getParameter("statusFlag"));
		model.addAttribute("recordType", recordType);
		//headerName = headerName + " (Client)";
		if (recordType != null) {
			if (recordType == 14006) {
				headerName = headerName + " (Client)";
			} else if (recordType == 14005) {
				headerName = headerName + " (Opportunity)";
			} else if (recordType == 14007) {
				headerName = headerName + " (Premium Client)";
			}
			request.getSession().setAttribute("headerName", headerName);
		}
	return "partner/quickDC";
}


@RequestMapping(value = "/autoPlanList", method = RequestMethod.GET)
public String showautoPlanList(Model model,
		HttpServletRequest request) {		
	try{			
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		request.getSession().removeAttribute("headerName");
		String token = "12345";
		PartySearchCriteria partySearchCriteria = new PartySearchCriteria();
		partySearchCriteria.setOwnerPartyId(userSession.getPartyId());
		
		List<PartySearchCriteria> partyList = getAutoPlanClients(userSession.getUserName(), userSession.getBuId(), partySearchCriteria);
		int size = partyList.size();
					
		if(partyList.size() < 30){
			model.addAttribute("subList", partyList.subList(0, partyList.size()));
		}
		else{
			model.addAttribute("subList", partyList.subList(0, 30));
		}
		
		model.addAttribute(TOTALCONTACTS, size);
		model.addAttribute("sortOrder","ascending");
		request.getSession().setAttribute(PARTYLIST,partyList);
		request.getSession().setAttribute("noOfContacts", 30);
		
		//*****************add search drop down******************
		BaseResponse< CodeValueData> baseResponse2 = new BaseResponse<CodeValueData>();
		//code for populate search list
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PICKLIST_VALUELIST+"/"+userSession.getUserName()+"/"+token);
		String codeTypeIds = ""+6+","+4;//code type IDs for OpportunityStatusID and ContactSourceTypeID
		uriCB.queryParam("buId", userSession.getBuId());
		uriCB.queryParam("codeTypeIds", codeTypeIds);
		
		//call service to populate dropdown for search
		baseResponse2 = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
		if (baseResponse2.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			codeValueDataList = baseResponse2.getResponseListObject();
			List<CodeValueData> valueDatas = new ArrayList<CodeValueData>();
			//get the actual CodeValueData object from its LinkedHashMap representation
			size = codeValueDataList.size();
			for(int i = 0; i<size; i++){
				CodeValueData codeValueData = objectMapper.readValue(objectMapper.writeValueAsString(codeValueDataList.get(i)), CodeValueData.class);
				valueDatas.add(codeValueData);
			}
			
			CodeValueData defaultCodeValue;
			List<CodeValueData> opportunityStatusList = new ArrayList<CodeValueData>();
			defaultCodeValue = new CodeValueData();
			defaultCodeValue.setCodeValueId(0);
			defaultCodeValue.setCodeValue("Status");
			opportunityStatusList.add(defaultCodeValue);
			List<CodeValueData> contactSourceList = new ArrayList<CodeValueData>();
			defaultCodeValue = new CodeValueData();
			defaultCodeValue.setCodeValueId(0);
			defaultCodeValue.setCodeValue("Source");
			contactSourceList.add(defaultCodeValue);
			List<CodeValueData> recordTypeList = new ArrayList<CodeValueData>();
			defaultCodeValue = new CodeValueData();
			defaultCodeValue.setCodeValueId(0);
			defaultCodeValue.setCodeValue("Type");
			recordTypeList.add(defaultCodeValue);
			for (CodeValueData codeValueData : valueDatas) 
			{
				if(codeValueData.getCodeTypeId()==6)
				{
					opportunityStatusList.add(codeValueData);
				}
				else if(codeValueData.getCodeTypeId()==4)
				{
					contactSourceList.add(codeValueData);
				}
			}
			CodeValueData codeValueData = new CodeValueData();
			codeValueData.setCodeValueId(14005);
			codeValueData.setCodeValue("Opportunity");
			recordTypeList.add(codeValueData);
			codeValueData = new CodeValueData();
			codeValueData.setCodeValueId(14006);
			codeValueData.setCodeValue("Client");
			recordTypeList.add(codeValueData);
			codeValueData = new CodeValueData();
			codeValueData.setCodeValueId(14007);
			codeValueData.setCodeValue("Premium Client");
			recordTypeList.add(codeValueData);
			
			model.addAttribute("opportunity", opportunityStatusList);
			model.addAttribute("source", contactSourceList);
			model.addAttribute("type", recordTypeList);
			model.addAttribute("searchCriteria", new PartySearchCriteria());
			
			
			String uri;
			uri = GET_PARTNER_AUTOPLAN_CONFIGURATION + "/"+ token +"/" + userSession.getUserName() +"?partyId="+userSession.getPartyId();
			BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
			baseResponse = restTemplate.getForObject(uri,BaseResponse.class);
	
			int status=baseResponse.getResponseObject();
			model.addAttribute("isAutoPlanEnable",status);
			
		}
		
		
		return "partner/autoPlanList";
		
	} catch (Exception exception){
		LOGGER.error("Error occured while retrieving contacts : ", exception);
		return "partner/autoPlanList";
	}
}


	@SuppressWarnings("unchecked")
	@RequestMapping(value ="/saveAutoPlan", method = RequestMethod.POST)

	public String saveAutoPlanClinetDetailsRecord(RedirectAttributes model,HttpServletRequest request,
		HttpServletResponse response,AutoPlanData autoPlanData) throws IOException {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		try {
			String url = URL_SAVE_CLIENT_AUTOPLAN_DETAILS + userSession.getUserName() + "/1234";
			LOGGER.info("URL --> " + url);
			int buId = userSession.getBuId();
			int partyId = userSession.getPartyId();
			int lastModifiedBy = userSession.getUserId();
			autoPlanData.setLastModifiedBy(lastModifiedBy);
			autoPlanData.setDataXML(request.getParameter("dataXML"));
			autoPlanData.setGoalXML(request.getParameter("goalXML"));
			autoPlanData.setFamilyMemberDataXML(request.getParameter("familyMemberDataXML"));
			autoPlanData.setPartyAttributeDataXML(request.getParameter("partyAttributeDataXML"));
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.postForObject(url, autoPlanData, BaseResponse.class);
			int recordCount = 0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
				recordCount = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()),Integer.class);
				model.addFlashAttribute("success", "AutoPlan saved successfully.");
				return "redirect:autoPlanList";
			} else {
				model.addFlashAttribute("error", "Error while saving AutoPlan.");
				return "redirect:/autoPlan";
			}
		}
		catch(Exception e) {		
			model.addFlashAttribute("error", "Error while saving AutoPlan.");
			return "redirect:/autoPlan";
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value ="/saveQuickDC", method = RequestMethod.POST)
	public String saveQuickDC(RedirectAttributes model,HttpServletRequest request,
		HttpServletResponse response,AutoPlanData autoPlanData) throws IOException {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String name = request.getParameter("name");
		String recordType = request.getParameter("recordType");		
		try {
			String url = URL_SAVE_QUICK_DC + userSession.getUserName() + "/1234";
			LOGGER.info("URL --> " + url);
			int buId = userSession.getBuId();			
			int lastModifiedBy = userSession.getUserId();
			autoPlanData.setLastModifiedBy(lastModifiedBy);
			autoPlanData.setDataXML(request.getParameter("dataXML"));
			autoPlanData.setGoalXML(request.getParameter("goalXML"));
			autoPlanData.setFamilyMemberDataXML(request.getParameter("familyMemberDataXML"));
			autoPlanData.setPartyAttributeDataXML(request.getParameter("partyAttributeDataXML"));
			BaseResponse<Integer> br = new BaseResponse<Integer>();			
			br = restTemplate.postForObject(url, autoPlanData, BaseResponse.class);
			int recordCount = 0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
				recordCount = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()),Integer.class);
				model.addFlashAttribute("success", "Quick DC saved successfully.");
				return "redirect:/partner/quickDC/"+autoPlanData.getPartyId()+"/"+name+"/"+recordType;
			} else {
				model.addFlashAttribute("error", "Error while saving Quick DC.");
				return "redirect:/partner/quickDC/"+autoPlanData.getPartyId()+"/"+name+"/"+recordType;
			}
		}
		catch(Exception e) {		
			model.addFlashAttribute("error", "Error while saving Quick DC.");
			return "redirect:/partner/quickDC/"+autoPlanData.getPartyId()+"/"+name+"/"+recordType;
		}
	}
	
	public String getMappedInternalControlIds( HttpServletRequest request, Integer controlLinkId ) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException {
		
		String token = "12345";
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		String controlId = "";
		
		/*UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ROLE_BASED_SECURITY_IDS+ userSession.getUserName()+"/"+ userSession.getPartyId() +"/" + 31006  + "/" + controlLinkId  + "/"  + token);
		uriCB.queryParam("buId", userSession.getBuId());
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			controlId = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), String.class);
		}*/
		
		return controlId;
	}
	
	@RequestMapping(value ="/saveAutoPlanConfiguration", method = RequestMethod.POST)
	@SuppressWarnings("unchecked")
	public String saveAutoPlanConfiguration(HttpServletRequest request,
			HttpServletResponse response, ProfileData profileData, RedirectAttributes redirectAttributes)
			throws Exception {
		String sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		Integer isAutoPlanEnabled=Integer.parseInt(request.getParameter("isAutoPlanEnabled"));
		LOGGER.debug("isAutoPlanEnabled:------"+isAutoPlanEnabled);
		String url = URL_UPDATE_PARTNER_AUTO_PLAN_CONFIGURATION + userSession.getUserName() + "/1234";
		LOGGER.info("URL --> " + url);
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
		if(recordCount>0) {
			redirectAttributes.addFlashAttribute("success", "success.profile.save");
			//return "redirect:/partner/personal/info?viewId=5" ;// for products
			return "redirect:/partner/personal/info?viewId=6" ;
		}
		else {
			redirectAttributes.addFlashAttribute("error", "error.profile.update");
			return "redirect:/partner/personal/info?viewId=4" ;
		}
	}
	
	/*private List<Long> getCashFlowForAdvancedPlan(String partyId,
			UserSession userSession) {
		
		String token = "1234";
		String url = GET_INCOME_LIST_DETAILS + userSession.getUserName() +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId(); 
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<IncomeData> br = new BaseResponse<IncomeData>();
		
		
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		List<IncomeData> incomeListAsJson = new ArrayList<IncomeData> ();		
		List<ExpenseData> expenseListAsJson = new ArrayList<ExpenseData> ();		
		List<Long> cashFlowData = new ArrayList<Long>();
		try{
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				incomeListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
			}	
			
			int size = incomeListAsJson.size();
			cashFlowData.add(new Long(0));
			for(int i = 0; i<size; i++){	
				long amount=0;
				IncomeData incomeData = objectMapper.readValue(objectMapper.writeValueAsString(incomeListAsJson.get(i)), IncomeData.class);
				amount = incomeData.getIncomeAmount();
				if(incomeData.getIncomeFrequencyId() == 63003)
					amount=amount*12;				
				cashFlowData.set(0, cashFlowData.get(0)+amount);
			}	
			
		
			url = GET_EXPENSE_LIST_DETAILS + userSession.getUserName() +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId(); 
			UriComponentsBuilder uriCB1 = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<ExpenseData> br1 = new BaseResponse<ExpenseData>();
		
			br1 = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB1), BaseResponse.class).getBody();
		
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				expenseListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br1.getResponseListObject()), ArrayList.class);
			}
				
			size = expenseListAsJson.size();
			cashFlowData.add(new Long(0));
			for(int i = 0; i<size; i++){	
				long amount=0;				
				ExpenseData expenseData = objectMapper.readValue(objectMapper.writeValueAsString(expenseListAsJson.get(i)), ExpenseData.class);
				amount = expenseData.getExpenseAmount();
				if(expenseData.getExpenseFrequencyID() == 63006)
						amount = amount/12;				
				cashFlowData.set(1, cashFlowData.get(1)+amount);
			}
		}
		catch(Exception e) {
			LOGGER.error(e);
		}
		return cashFlowData;
	}
*/
	@SuppressWarnings("unchecked")
	@RequestMapping(value ="/saveAutoPlanAjax", method = RequestMethod.POST)

	public void saveAutoPlanAjax(RedirectAttributes model,HttpServletRequest request,
		HttpServletResponse response,AutoPlanData autoPlanData) throws IOException {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		Integer recordCount = 0;
		try {
			
			int buId = userSession.getBuId();
			int partyId = userSession.getPartyId();
			int lastModifiedBy = userSession.getUserId();
			String token = "12345";
			
			String url = URL_SAVE_CLIENT_AUTOPLAN_DETAILS + userSession.getUserName() + "/1234";
			LOGGER.info("URL --> " + url);
			autoPlanData.setLastModifiedBy(lastModifiedBy);
			autoPlanData.setDataXML(request.getParameter("dataXML"));
			autoPlanData.setGoalXML(request.getParameter("goalXML"));
			autoPlanData.setFamilyMemberDataXML(request.getParameter("familyMemberDataXML"));
			autoPlanData.setPartyAttributeDataXML(request.getParameter("partyAttributeDataXML"));
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.postForObject(url, autoPlanData, BaseResponse.class);			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
				recordCount = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()),Integer.class);
			}
			
			UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userSession.getUserId() + "/"+userSession.getUserName()+"/" + token);
			uriRetirement.queryParam("buId", userSession.getBuId());
			BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
	        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
			
		}
		catch(Exception e) {		
			LOGGER.error("Error while saving Autoplan");
		}
		try {
			String token = "abc";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_PLAN_TYPE+ userSession.getUserName()+"/" + token);
			uriCB.queryParam("partyId", autoPlanData.getPartyId());
			uriCB.queryParam("buId", userSession.getBuId());
			uriCB.queryParam("planTypeId", "522003");
			
			BaseResponse<Boolean> br = new BaseResponse<>();
			br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			String userName = (String) request.getSession().getAttribute("USER_NAME");
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				LOGGER.debug("Plan type updated to quick DC");
			}
		} 
	  catch(Exception e) {
		  LOGGER.debug(e);
	  }
		//return recordCount;
	}
private void saveLogoDimantions(Integer partyId, Integer buId, String userName) {
		
		String token = "12345";									
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_PARTY_ATTRIBUTE + "/" + userName + "/" + token);
		uriCB.queryParam("buId", buId);		
		uriCB.queryParam("partyId", partyId);		

		List<PartyAttribute> partyAttributes = new ArrayList<PartyAttribute>();
		
		PartyAttribute attributeData = new PartyAttribute();
		attributeData.setAttributeCodeID(94514);
		attributeData.setAttributeSeqNo(1);
		attributeData.setAttributeValue(FiinfraUtility.getLogoHeight());
		attributeData.setPartyId(partyId);
		attributeData.setValueDataTypeID(37002);
		
		partyAttributes.add(attributeData);
		
		attributeData = new PartyAttribute();
		attributeData.setAttributeCodeID(94515);
		attributeData.setAttributeSeqNo(2);
		attributeData.setAttributeValue(FiinfraUtility.getLogoWidth());
		attributeData.setPartyId(partyId);
		attributeData.setValueDataTypeID(37002);
		
		partyAttributes.add(attributeData);		
		
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partyAttributes, BaseResponse.class);				
	}
@SuppressWarnings("unchecked")
@RequestMapping(value ="/saveQuickDCAjax", method = RequestMethod.POST)

public void saveQuickDCAjax(RedirectAttributes model,HttpServletRequest request,
	HttpServletResponse response,AutoPlanData autoPlanData) throws IOException {
	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
	Integer recordCount = 0;
	try {
		
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int lastModifiedBy = userSession.getUserId();
		String token = "12345";
		
		String url = URL_SAVE_QUICK_DC + userSession.getUserName() + "/1234";
		LOGGER.info("URL --> " + url);
		autoPlanData.setLastModifiedBy(lastModifiedBy);
		autoPlanData.setDataXML(request.getParameter("dataXML"));
		autoPlanData.setGoalXML(request.getParameter("goalXML"));
		autoPlanData.setFamilyMemberDataXML(request.getParameter("familyMemberDataXML"));
		autoPlanData.setPartyAttributeDataXML(request.getParameter("partyAttributeDataXML"));
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, autoPlanData, BaseResponse.class);			
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			recordCount = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()),Integer.class);
		}
		
		UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userSession.getUserId() + "/"+userSession.getUserName()+"/" + token);
		uriRetirement.queryParam("buId", userSession.getBuId());
		BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
		
	}
	catch(Exception e) {		
		LOGGER.error("Error while saving QuickDC");
	}		
	
}


	@RequestMapping(value = "/saveAnalysisReportsForBatch", method = RequestMethod.POST)
	public @ResponseBody
	String saveAnalysisReportsForBatch(HttpServletRequest request) {

		int partyId;
		Integer isAnalysisGeneration;
		Integer isActionPlanGeneration;
		Integer analysiReportType;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		Integer buId = userSession.getBuId();
		int createdBy = userSession.getUserId();
		partyId = Integer.valueOf(request.getParameter("partyId"));
		isAnalysisGeneration = Integer.valueOf(request
				.getParameter("isAnalysisGeneration"));
		isActionPlanGeneration = Integer.valueOf(request
				.getParameter("isActionPlanGeneration"));
		analysiReportType = Integer.valueOf(request
				.getParameter("analysisReportType"));
		LOGGER.debug("partyId===" + partyId);
		String url = "";
		url = SAVE_ANALYSIS_REPORTS_FOR_BATCH + userSession.getUserName()
				+ "/1234";
		// String xmlString=request.getParameter("xmlString");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("isAnalysisGeneration", isAnalysisGeneration);
		uriCB.queryParam("isActionPlanGeneration", isActionPlanGeneration);
		uriCB.queryParam("analysiReportType", analysiReportType);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("lastModifiedBy", createdBy);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		Integer recordCount = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			return "success";
		} else {
			return "failure";
		}
	}
	
	@RequestMapping(value = "/getProductList", method = RequestMethod.GET)		
	public synchronized @ResponseBody List<JsonData> getProductList(HttpServletRequest request){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		
		if(null!=request.getParameter("productData") && !request.getParameter("productData").isEmpty()){
			String productData=request.getParameter("productData");
			String categoryId=request.getParameter("categoryId");
			String assetClassId=request.getParameter("assetClassId");
			String productTypeId=request.getParameter("productTypeId");
			String userName=userSession.getUserName();
			return getAllProductNamesList(request, productData, assetClassId, productTypeId, categoryId,userName);		
		}else{
			return null;
		}

	}
	
	public synchronized List<JsonData> getAllProductNamesList(HttpServletRequest request,String productData,String assetClassId,
			String productTypeId,String categoryId,String userName) {
		
		UriComponentsBuilder uriCB;
		/*String manufactureId = request.getParameter("manufactureId");
		String categoryId = request.getParameter("categoryId");*/
		
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_ALL_PRODUCTS_NAME+"/" + productData + "/" + assetClassId + "/" + productTypeId + "/"+ categoryId+ "/" + userName + "/12345?buId=27827");
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		List<KeyValue> productnamesListAsJson = new ArrayList<KeyValue>();
		List<JsonData> productnamesList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		/*jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");*/
		productnamesList.add(jsonDataDefault);
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				productnamesListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<productnamesListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(productnamesListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					productnamesList.add(jsonData);
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
		return productnamesList;
	}

}
