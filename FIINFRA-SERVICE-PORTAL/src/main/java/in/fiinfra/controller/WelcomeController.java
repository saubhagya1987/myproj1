/**
 * Welcome Controller - Viraj commit
 * Welcome Controller - Sourabh commit
 * 
 * @author : 
 */
package in.fiinfra.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import in.fiinfra.common.authentication.UserDetailsImpl;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class WelcomeController extends MultiActionController

{
	private static final Logger logger = Logger
			.getLogger(WelcomeController.class);
	String url;
	@Value("${SUCCESSFULL_LOGIN}")
	private String SUCCESSFULL_LOGIN;
	@Value("${SAVE_USER_ACCESS_LOG}") 
	private  String SAVE_USER_ACCESS_LOG;
	
	@Value("${URL_GET_NON_ACCESSIBLE_CONTROLIDS}") 
	private  String URL_GET_NON_ACCESSIBLE_CONTROLIDS;
	
	@Value("${URL_GET_USER_SESSION}") 
	private  String URL_GET_USER_SESSION;
	
	
	@Value("${URL_GET_HEIRARCHY_DATA_SP_TREE}") 
	private  String URL_GET_HEIRARCHY_DATA_SP_TREE;
	
	
	
	
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	
	
	/*@RequestMapping(value = "/loadHome", method = RequestMethod.GET)
	public ModelAndView loadHome(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("\nHELLO loadhome WelcomeController ");

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String url = SUCCESSFULL_LOGIN + authentication.getName() + "/" + request.getRemoteAddr();
		UserSession userSession =  restTemplate.getForObject(url, UserSession.class);
		Object principal = authentication.getPrincipal();
		String password=null;
        if (principal instanceof UserDetailsImpl) {
        	password = ((UserDetailsImpl) (principal)).getPassword();
            
        }
		userSession.setUserName(authentication.getName());
		HttpSession session = request.getSession(false);
		if(session == null)
		{
			session = request.getSession(true);
		}
		session.setAttribute("userSession", userSession);
		session.setAttribute("password", password);
		return new ModelAndView("/home/home");
	}*/
	
	//@RequestMapping(value = "/loadHome", method = RequestMethod.GET)
	public String loadHome(HttpServletRequest request,
			HttpServletResponse response) {
		//System.out.println("in------Service Portal buildSession()");
		String redirectUrl=null;
		// call stored proc for successful login
		try{
			
			String userName = (String) request.getSession().getAttribute("USER_NAME");
			
			//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String url = SUCCESSFULL_LOGIN + userName + "/" + request.getRemoteAddr();
			UserSession userSession =  restTemplate.getForObject(url, UserSession.class);
			request.getSession().setAttribute("userSession", userSession);
			
			
			//for role based security 
			
			url = URL_GET_NON_ACCESSIBLE_CONTROLIDS + userName + "/1234?partyId="+userSession.getPartyId()+"&buId="+userSession.getBuId()+"&sourceSystemId="+FiinfraConstants.SERVICE_PORTAL;
			
			BaseResponse<String> br=new BaseResponse<>();
			br = restTemplate.getForEntity(url, BaseResponse.class).getBody();
			List<String> idList=new ArrayList<>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				idList = br.getResponseListObject();
			request.getSession().setAttribute("idList", idList);
			//System.out.println("idList:-------"+idList);
			
			
		}catch(Exception ex){
			logger.error("Error in login", ex);
		}
		redirectUrl="redirect:/welcome/redirect.htm";
		return redirectUrl;
		
	}
	
	public ModelAndView redirect(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		System.out.println("in------Service Portal redirect");
		String redirectUrl=null;
		String password=null;
		// call stored proc for successful login
		try{
			
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			/*if(userSession.getSuccessfulLoginCount()<1 && userSession.getRoleId()==FiinfraConstants.PARTNER_ROLE){
				redirectUrl="redirect:/setup.htm";
				}*/
			if(userSession.getIsForceChangePasswordOnLogin()==true && userSession.getSuccessfulLoginCount()>0){
				redirectUrl="redirect:/common/changePassword.htm";
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
						password = request.getSession().getAttribute("password").toString();
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
					e.printStackTrace();
				}
				//redirectUrl="redirect:/home/home.htm";
			}
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
	
	public ModelAndView changebuid (HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		System.out.println("callling 1.1");
		//String redirectUrl=null;
		String buid =  request.getParameter("buid");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		userSession.setBuId(Integer.parseInt(buid));
		
		getUserSession(request,response);
		
		//redirectUrl="redirect:/welcome/redirect.htm";
		return new ModelAndView("home/home");
		
		
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
	
		
		System.out.println(userSession.getHeadOfNode()+"headOfNode");
	//	System.out.println(userSession.getCurrentNodeId()+"partner.getCurrentNode()");
		
		
		
		
		Partner partner = new Partner();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			partner = objectMapper
					.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Partner.class);
       
boolean headOfNode;
if(partner.getHeadNode()==1)
{
	headOfNode=true;
	
	userSession.setHeadOfNode(headOfNode);
	userSession.setCurrentNodeId(partner.getCurrentNode());

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
	}
else
{
	headOfNode=false;
	request.getSession().setAttribute("lstLocationData", null);
	request.getSession().setAttribute("lstPartnerHeirarchyData", null);

}
		
userSession.setHeadOfNode(headOfNode);
userSession.setCurrentNodeId(partner.getCurrentNode());
		
	//	System.out.println(headOfNode+"headOfNode");
		//System.out.println(partner.getCurrentNode()+"partner.getCurrentNode()");
		
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
	
	
	
	  
	  /*
	  
		public SettingService getSettingServices() {
		return settingServices;
	}

	public void setSettingServices(SettingService settingServices) {
		this.settingServices = settingServices;
	}

		public AssumptionService getAssumptionService() {
		return assumptionService;
	}

	public void setAssumptionService(AssumptionService assumptionService) {
		this.assumptionService = assumptionService;
	}

		public PartnerService getPartnerService() {
		return partnerService;
	}

	public void setPartnerService(PartnerService partnerService) {
		this.partnerService = partnerService;
	}

	public TeamMemberServices getTeamMemberServices() {
		return teamMemberServices;
	}

	public void setTeamMemberServices(TeamMemberServices teamMemberServices) {
		this.teamMemberServices = teamMemberServices;
	}

	public DepartmentListService getDepartmentListService() {
		return DepartmentListService;
	}

	public void setDepartmentListService(
			DepartmentListService departmentListService) {
		DepartmentListService = departmentListService;
	}

	public BizUnitService getBizunitServices() {
		return bizunitServices;
	}

	public void setBizunitServices(BizUnitService bizunitServices) {
		this.bizunitServices = bizunitServices;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public AddFaqService getService() {
		return service;
	}

	public void setService(AddFaqService service) {
		this.service = service;
	}

	@Autowired
	CodeTypeServices codeTypeServices;

	public CodeTypeServices getCodeTypeServices() {
		return codeTypeServices;
	}

	public void setCodeTypeServices(CodeTypeServices codeTypeServices) {
		this.codeTypeServices = codeTypeServices;
	}

	@Autowired
	DownloadServices downloadServices;

	public DownloadServices getDownloadServices() {
		return downloadServices;
	}

	public void setDownloadServices(DownloadServices downloadServices) {
		this.downloadServices = downloadServices;
	}

	@Autowired
	RoleServices roleServices;

	public RoleServices getRoleServices() {
		return roleServices;
	}

	public void setRoleService(RoleServices roleServices) {
		this.roleServices = roleServices;
	}

	@Autowired
	LoginServices loginServices;

	public LoginServices getLoginServices() {
		return loginServices;
	}

	public void setLoginServices(LoginServices loginServices) {
		this.loginServices = loginServices;
	}



	@RequestMapping(value = "/loadbroadcast", method = RequestMethod.GET)
	public ModelAndView loadBroadCast() {

		logger.info("\nHELLO broadcast WelcomeController ");

		return new ModelAndView("/broadcast/broadcast");
	}

	@RequestMapping(value = "/loaduser", method = RequestMethod.GET)
	public ModelAndView loadUser() {

		logger.info("\nHELLO loaduser  WelcomeController ");

		List<User> user = getUserList();

		ModelAndView mav = new ModelAndView("user/UserList");
		mav.addObject("userData", user);
		return mav;

	}

	@RequestMapping(value = "/loadprofile_setting", method = RequestMethod.GET)
	public ModelAndView loadProfileSetting(HttpServletRequest request,HttpServletResponse response) throws NullPointerException
	{

		logger.info("\nHELLO ViewProfile_Setting  WelcomeController ");
		Integer partyId=Integer.parseInt(request.getParameter("partyId"));
		request.setAttribute("partyId", request.getParameter("partyId"));
   
   logger.info(partyId);
   logger.info("hi re");
   	List<Setting>list=settingServices.getSettingList(partyId);
logger.info(list);
		


logger.info(partyId+"balaji");
List<Setting>getAssumptionList=settingServices.getSettingList(partyId);
logger.info(getAssumptionList);
ModelAndView mav = new ModelAndView("bizunit/ViewProfile_Setting");	
mav.addObject("SettingList", getAssumptionList);
// logger.info(faqlist);
return mav;


		ModelAndView mav = new ModelAndView("bizunit/ViewProfile_Setting");
		mav.addObject("SettingList", list);
		return mav;
		

	}

	@RequestMapping(value = "/loadwhitelabel", method = RequestMethod.GET)
	public ModelAndView whiteLabel(HttpServletRequest request,
			HttpServletResponse response) {
		// HttpSession hes=request.getSession();
		request.setAttribute("partyId", request.getParameter("partyId"));
		logger.info("\nHELLO White_Label  WelcomeController ");
		Integer abc = Integer.parseInt(request.getParameter("partyId"));
		logger.info("babaji");
		logger.info(abc + "bg");
		// List<User> user = getUserList();
		request.setAttribute("partIds", abc);
		ModelAndView mav = new ModelAndView("bizunit/White_Label");

		return mav;
		
		logger.info("\nHELLO loaduser  WelcomeController ");
		request.setAttribute("partyId", request.getParameter("partyId"));
		logger.info("\nHELLO White_Label  WelcomeController ");
		Integer abc = Integer.parseInt(request.getParameter("partyId"));
		List<BizUnit> detail = bizunitServices.getWhiteLableDetail(abc);

		ModelAndView mav = new ModelAndView("bizunit/White_Label");
		mav.addObject("userData", detail);
		return mav;
		//bizunitServices
		
		
		
		for (BizUnit bizunit : detail) {
			request.setAttribute("disclaimer", bizunit.getDisclaimer());
			request.setAttribute("dndTemplate", bizunit.getTemplate());
			request.setAttribute("emailsign", bizunit.getEmailsign());

		}

		// List<User> user = getUserList();
		ModelAndView mav = new ModelAndView("bizunit/White_Label");
		//mav.addObject("bizUnitList", list);
		return mav;
		

	}

	@RequestMapping(value = "/loadassumtion", method = RequestMethod.GET)
	public ModelAndView assumtions(HttpServletRequest request,HttpServletResponse response) {

		int partyId=Integer.parseInt(request.getParameter("partyId"));
		request.setAttribute("partyId",request.getParameter("partyId"));
		
		int AssumptionValue=Integer.parseInt(request.getParameter("AssumptionValue"));
		request.setAttribute("AssumptionValue",request.getParameter("AssumptionValue"));
		
		String dataType=request.getParameter("dataType");
		String DefaultValue=request.getParameter("DefaultValue");
		
		
		
		
        

  
		logger.info(partyId+"balaji");
		List<Assumption>getAssumptionList=assumptionService.getAssumptionList(partyId);
		logger.info(getAssumptionList);
		ModelAndView mav = new ModelAndView("bizunit/ViewAssumptions");	
		mav.addObject("List", getAssumptionList);
		// logger.info(faqlist);
		return mav;

	}

	@RequestMapping(value = "/loadviewprofile", method = RequestMethod.GET)
	public ModelAndView loadviewprofile(HttpServletRequest request,
			HttpServletResponse response) {

		logger.info("\nHELLO ViewUnitProfile  WelcomeController ");

		int partyId = Integer.parseInt(request.getParameter("partyId"));
		request.setAttribute("partyId", request.getParameter("partyId"));
		logger.info(partyId);
		List<BizUnit> list = bizunitServices.getBizUnitDeatil(partyId);
		logger.info(list);
		for (BizUnit bizunit : list) {
			request.setAttribute("disBizName", bizunit.getLastName());
			request.setAttribute("disShortName", bizunit.getShortName());
			request.setAttribute("disCompanyName", bizunit.getCompanyName());
			request.setAttribute("disAdd1", bizunit.getStreet());
			request.setAttribute("disAdd2", bizunit.getStreet2());
			request.setAttribute("disAdd3", bizunit.getStreet3());
			request.setAttribute("disCountry", bizunit.getCountry());
			request.setAttribute("disState", bizunit.getState());
			request.setAttribute("disCity", bizunit.getCity());
			request.setAttribute("disCountryId", bizunit.getCountryId());
			request.setAttribute("disStateId", bizunit.getStateId());
			request.setAttribute("disCityId", bizunit.getCityId());
			request.setAttribute("disZip", bizunit.getZipCode());
			request.setAttribute("disPartyId", bizunit.getPartyId());

		}

		// List<User> user = getUserList();
		ModelAndView mav = new ModelAndView("bizunit/ViewUnitProfile");
		mav.addObject("bizUnitList", list);
		return mav;
		
		 * int partyId=Integer.parseInt(request.getParameter("partyId"));
		 * logger.info(partyId); List<BizUnit>
		 * list=bizunitServices.getBizUnitDeatil(partyId); PrintWriter out=null
		 * ; out = response.getWriter(); logger.info(list);
		 * response.setContentType("application/json"); objectMapper.writeValue(
		 * out,list);
		 

	}

	@RequestMapping(value = "/loadroleaccesslist", method = RequestMethod.GET)
	public ModelAndView loadRoleAccessList(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("\nHELLO loadroleaccesslist  WelcomeController ");
		List<RoleAccessListData> accessList = null;
		logger.info("in loadroleaccesslist roleName:"
				+ request.getParameter("roleName"));
		request.setAttribute("roleNmAttrib", request.getParameter("roleName"));
		logger.info("in loadroleaccesslist roleId:::"
				+ request.getParameter("roleId"));

		if (request.getParameter("roleId") != null
				&& request.getParameter("roleName") != null) {
			int roleId = Integer.parseInt(request.getParameter("roleId"));
			accessList = roleServices.getRoleAccessListForRoleId(roleId);
		}
		 * else{ accessList= roleServices.getRoleAccessList(); }
		 

		ModelAndView mav = new ModelAndView("/role/role_access_list");
		// logger.info(accessList);
		mav.addObject("roleAccessList", accessList);
		return mav;
	}

	@RequestMapping(value = "/loadloginhist", method = RequestMethod.GET)
	public ModelAndView loadLoginHist() {

		logger.info("\nHELLO loadloginhist WelcomeController ");

		List<Login> loginhist = getLoginHistory();
		logger.info(loginhist);
		ModelAndView mav = new ModelAndView("login/loginhistory");
		mav.addObject("loginHist", loginhist);
		return mav;

	}

	public List<Login> getLoginHistory() {

		return loginServices.showLoginHistory();
	}

	@RequestMapping(value = "/loadaudithist", method = RequestMethod.GET)
	public ModelAndView loadAuditHist() {

		logger.info("\nHELLO loadaudithist WelcomeController ");

		return new ModelAndView("/login/audithistory");
	}

	@RequestMapping(value = "/loadcodetypedata", method = RequestMethod.GET)
	public ModelAndView loadCodeTypeData() {
		logger.info("\nHELLO loadcodetypedata WelcomeController ");
		List<CodeTypeData> codeTypeList = getCodetypeList();
		logger.info(codeTypeList);
		ModelAndView mav = new ModelAndView("codetype/CodetypeList");
		mav.addObject("codeTypedata", codeTypeList);
		return mav;
	}

	@RequestMapping(value = "/loadfaqlist", method = RequestMethod.GET)
	public ModelAndView loadFaqList() {
		logger.info("\nHELLO loadFaqList WelcomeController ");
		List<FaqList> faqlist = getList();
		ModelAndView mav = new ModelAndView("faq/FaqList");

		mav.addObject("listfaq", faqlist);
		// logger.info(faqlist);
		return mav;

	}

	public List<FaqList> getList() {
		return service.allSearchFaq();
	}

	@RequestMapping(value = "/loaddownloadlist", method = RequestMethod.GET)
	public ModelAndView loadDownloadList(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("\nHELLO loaddownloadlist WelcomeController ");
		if (request.getParameter("isToClose") != null
				&& request.getParameter("isToClose").equals("0")) {
			request.setAttribute("hiddenIsToClosee", "0");

		} else {

			request.setAttribute("hiddenIsToClosee", "");
		}

		if (request.getParameter("isToClose") != null
				&& request.getParameter("isToClose").equals("1")) {
			request.setAttribute("hiddenIsToClosee", "1");

		}

		if (request.getParameter("isToClosee") != null
				&& request.getParameter("isToClosee").equals("1")) {
			request.setAttribute("hiddenEditIsToClosee", "1");

		}

		List<Download> download = getDownloadedList();
		logger.info(download);
		ModelAndView mav = new ModelAndView("download/DownloadList");
		mav.addObject("downloadList", download);
		return mav;
	}

	public List<Download> getDownloadedList() {

		return downloadServices.showDownloadedList();
	}

	@RequestMapping(value = "/loadcodevalue", method = RequestMethod.GET)
	public ModelAndView loadCodeValue() {

		logger.info("\nHELLO loadcodevalue WelcomeController ");
		List<CodeValueData> codeValueList = getCodeValueList();
		logger.info(codeValueList);
		ModelAndView mav = new ModelAndView("codevalue/CodevaluesList");
		mav.addObject("codeValuedata", codeValueList);
		return mav;
	}

	public List<CodeTypeData> getCodetypeList() {
		return codeTypeServices.getCodetypeList();
	}

	public List<CodeValueData> getCodeValueList() {
		return codeTypeServices.getAllCodeValueDetails();
	}

	@RequestMapping(value = "/loadrole", method = RequestMethod.GET)
	public ModelAndView loadRole() {
		logger.info("\n HELLO loadrole WelcomeController ");

		List<Role> roleDataList = getRoleData();
		logger.info(roleDataList);

		ModelAndView mav = new ModelAndView("role/role_list");
		mav.addObject("roleDataList", roleDataList);
		return mav;
	}

	public List<Role> getRoleData() {
		return roleServices.getRoleData();
	}

	public List<RoleAccessListData> getRoleAccessListForRoleId(int roleId) {
		List<RoleAccessListData> accessList = roleServices
				.getRoleAccessListForRoleId(roleId);
		return accessList;
	}

	public List<User> getUserList() {
		return userService.getAllUser();
	}

	@RequestMapping(value = "/loadbizunit", method = RequestMethod.GET)
	public ModelAndView loadbizunit(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("\nHELLO loadbizunit WelcomeController ");

		int sessionbuId = Integer.parseInt(request.getParameter("buId"));
		logger.info(sessionbuId);

		List<BizUnit> bizunit = bizunitServices.getBizUnitList();
		ModelAndView mav = new ModelAndView("bizunit/BizUnitList");

		mav.addObject("UnitBiz", bizunit);
		// logger.info(faqlist);
		return mav;

	}

	// start CreatedBy : Suvarna
	@RequestMapping(value = "/landing", method = RequestMethod.GET)
	public ModelAndView loaddepartment(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("\nHELLO loadDepartmentList WelcomeController ");

		int sessionbuId = Integer.parseInt(request.getParameter("buId"));
		logger.info(sessionbuId);

		List<DepartmentListData> departmentListData = getDepartmentList(sessionbuId);

		logger.info("buIdd:" + request.getParameter("buId"));

		for (DepartmentListData d : departmentListData) {
			logger.info("DepartmentId:::" + d.getDepartmentId());

		}

		ModelAndView mav = new ModelAndView("/department/department_list");
		mav.addObject("departmentList", departmentListData);
		return mav;

	}

	public List<DepartmentListData> getDepartmentList(int sessionbuId) {
		// return null;
		return DepartmentListService.getAllDepartmentList(sessionbuId);

	}

	// end CreatedBy : Suvarna

	@RequestMapping(value = "/loadteammember", method = RequestMethod.GET)
	public ModelAndView loadteammember() {
		logger.info("\nHELLO loadbizunit WelcomeController ");

		List<TeamMember> memberList = teamMemberServices.getAllTeamMember();
		ModelAndView mav = new ModelAndView("teammember/TeamMember");

		mav.addObject("ListMember", memberList);

		return mav;

	}

	@RequestMapping(value = "/loadpartner", method = RequestMethod.GET)
	public ModelAndView loadPartner(HttpServletRequest request,HttpServletResponse response) {

		logger.info("\nHELLO loadpartner  WelcomeController ");
		logger.info("buId:"+request.getParameter("buId"));
		logger.info("userId:"+request.getParameter("userId"));
		
		request.setAttribute("buId",request.getParameter("buId"));
		request.setAttribute("userId",request.getParameter("userId"));
		List<Partner> partner = getPartnerList();

		ModelAndView mav = new ModelAndView("partner/PartnerList");
		mav.addObject("partnerData", partner);
		return mav;

	}

	private List<Partner> getPartnerList() {
		return partnerService.showPartnerList();
	}
	
	
	//Method for Department Allocation
	
	@RequestMapping(value = "/loadallocationlist", method = RequestMethod.GET)
	public ModelAndView loadallocationlist(HttpServletRequest request,HttpServletResponse response) 
	{
		logger.info("\nHELLO loadallocationlist  WelcomeController ");
		List<TeamMemberAllocation> allocationList = null;
		
		logger.info("in loadallocationlist userName:"+ request.getParameter("userName"));
		request.setAttribute("userNameAttribute", request.getParameter("userName"));
		
		logger.info("in loadallocationlist partyID:::"+ request.getParameter("partyID"));

		if (request.getParameter("partyID") != null && request.getParameter("userName") != null)
		{
			int partyID = Integer.parseInt(request.getParameter("partyID"));
			allocationList = teamMemberServices.getDepartmentAllocationListForPartyId(partyID);
		}

		ModelAndView mav = new ModelAndView("/teammember/AllocationList");
		// logger.info(accessList);
		
		
		mav.addObject("allocationList", allocationList);
		return mav;
	}
	
	public List<TeamMemberAllocation> getDepartmentAllocationListForPartyId(int partyID) 
	{
		System.out.println("partyID="+partyID);
		List<TeamMemberAllocation> allocationList = teamMemberServices.getDepartmentAllocationListForPartyId(partyID);
		return allocationList;
	}*/


}
