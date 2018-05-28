package in.fiinfra.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.service.vo.MemberAllocation;
import in.fiinfra.common.service.vo.TeamMember;
import in.fiinfra.common.service.vo.TeamMemberAllocation;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.MD5Encryption;
import in.fiinfra.common.util.RandomPasswordGenerator;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Notification;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonParseException;

public class TeamMemberController extends MultiActionController {
	
	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(TeamMemberController.class);
	
	private RestTemplate restTemplate;

	private ObjectMapper objectMapper;

	String url;

	@Value("${URL_GET_TEAM_MEMBER_LIST}")
	private String URL_GET_TEAM_MEMBER_LIST;

	@Value("${URL_ADD_TEAM_MEMBER}")
	private String URL_ADD_TEAM_MEMBER;

	@Value("${URL_GET_UNIQUE_MEMBER}")
	private String URL_GET_UNIQUE_MEMBER;

	@Value("${URL_UPDATE_TEAM_MEMBER}")
	private String URL_UPDATE_TEAM_MEMBER;

	@Value("${URL_DELETE_TEAM_MEMBER}")
	private String URL_DELETE_TEAM_MEMBER;

	@Value("${URL_GET_ALLOCATION_LIST}")
	private String URL_GET_ALLOCATION_LIST;

	@Value("${URL_GET_TEAM_DEPARTMENT_SECTION}")
	private String URL_GET_TEAM_DEPARTMENT_SECTION;

	@Value("${URL_ADD_TEAM_ALLOCATION}")
	private String URL_ADD_TEAM_ALLOCATION;

	@Value("${URL_UPDATE_TEAM_ALLOCATION}")
	private String URL_UPDATE_TEAM_ALLOCATION;

	@Value("${URL_DELETE_ALLOCATION}")
	private String URL_DELETE_ALLOCATION;

	@Value("${URL_GET_AVAILABLE_BIZUNIT_DEPARTMENT}")
	private String URL_GET_AVAILABLE_BIZUNIT_DEPARTMENT;

	@Value("${URL_ADD_BULK_ALLOCATION}")
	private String URL_ADD_BULK_ALLOCATION;

	@Value("${URL_GET_UNIQUE_ALLOCATION}")
	private String URL_GET_UNIQUE_ALLOCATION;

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

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadteammember", method = RequestMethod.GET)
	public ModelAndView loadteammember(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		Integer buid = userSession.getBuId();
		TeamMember teamMember = new TeamMember();
		teamMember.setBuId(buid);

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		ModelAndView mav = new ModelAndView("teammember/TeamMember");

		String searchTextVal = null;
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}

		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		try {

			teamMember.setSearchTextVal(searchTextVal);

			url = URL_GET_TEAM_MEMBER_LIST + userToken + "/1234";
			BaseResponse<TeamMember> br = new BaseResponse<TeamMember>();
			br = restTemplate
					.postForObject(url, teamMember, BaseResponse.class);
			List<TeamMember> teamMemberList = new ArrayList<TeamMember>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				teamMemberList = br.getResponseListObject();
			//mav.addObject("ListMember", teamMemberList);
			mav.addObject("teamMemberList", objectMapper.writeValueAsString(teamMemberList));
			mav.addObject("size", pagesize);
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception e) {
				logger.error(""+e);
			}
		} catch (Exception e) {
			//e.printStackTrace();
		}
		return mav;
	}

	@SuppressWarnings("unchecked")
	public void addNewTeamMember(HttpServletRequest request,
			HttpServletResponse response, TeamMember teamMemberData)
			throws JsonGenerationException, JsonMappingException, IOException {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		teamMemberData.setBuId(userSession.getBuId());
		teamMemberData.setCreatedBy(userSession.getUserId());

		String userDataXML = "<Root>";
		int noOfCAPSAlpha = 1;
		int noOfDigits = 1;
		int noOfSplChars = 1;
		int minLen = 8;
		int maxLen = 15;
		String hexString = null;
		Map<Integer, String> passwordMap = new HashMap<>();
		char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
				noOfCAPSAlpha, noOfDigits, noOfSplChars);
		hexString = new String(pswd);
		
		MD5Encryption md5Encryption = new MD5Encryption();
		String encryptrdPassword = md5Encryption.encrypt(hexString);
	
		//String encryptrdPassword = MD5Encryption.encrypt(hexString);
		
		
		userDataXML += "<User>";
		userDataXML += "<userPassword>" + encryptrdPassword + "</userPassword>";
		userDataXML += "</User>";

		userDataXML += "</Root>";

		teamMemberData.setPasswordId(encryptrdPassword);

		
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		url = URL_ADD_TEAM_MEMBER + userToken + "/1234";

		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate
				.postForObject(url, teamMemberData, BaseResponse.class);

		int newpartyid = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))

		{
			newpartyid = br.getResponseObject();
			//insert code for audit functionality
			String Object="FirstName:"+ teamMemberData.getFirstName()+",UserName:"+
					teamMemberData.getUserName()+",Mobile"+
					teamMemberData.getContactMobile();
					
			
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97172,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_SERVICE_TEAM,FiinfraConstants.SP_ADDTEAMMEMBER,
									FiinfraConstants.SRP_ADD_SERVICE_TEAM,Object);

		}

		int userid = userSession.getUserId();
		int buid = userSession.getBuId();

		passwordMap.put(newpartyid, hexString);

		Notification notification = null;
		for (Map.Entry<Integer, String> map : passwordMap.entrySet()) {
			Map<String, String> payloadMap = new HashMap<String, String>();
			payloadMap.put("Password", map.getValue());
			notification = new Notification();
			notification.setSourceSystemID(31003); 
													
			notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
			notification.setNotifyUserID(userid);
			notification.setNotifyPartyID(map.getKey());
			notification.setNotifyEventID(169); 

			notification.setBuId(buid);
			notification.setPayloadMap(payloadMap);
			notification.setSessionID(request.getSession().getId());
			FrameworkUtil.notify(notification);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, newpartyid);
	}

	@SuppressWarnings("unchecked")
	public void getUniqueMember(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		String userName = request.getParameter("userName");


		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		TeamMember teamMemberData = new TeamMember();
		teamMemberData.setBuId(userSession.getBuId());
		teamMemberData.setCreatedBy(userSession.getUserId());
		teamMemberData.setUserName(userName);

		url = URL_GET_UNIQUE_MEMBER + userToken + "/1234";

		BaseResponse<Integer> br = new BaseResponse<Integer>();
		
		br = restTemplate
				.postForObject(url, teamMemberData, BaseResponse.class);
		Integer codeValueDataList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList = br.getResponseObject();
		Integer status = codeValueDataList;

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, status);

	}

	@SuppressWarnings("unchecked")
	public void updateTeamMember(HttpServletRequest request,
			HttpServletResponse response, TeamMember teamMemberData)
			throws JsonGenerationException, JsonMappingException, IOException {

		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		teamMemberData.setBuId(userSession.getBuId());
		teamMemberData.setCreatedBy(userSession.getUserId());

		url = URL_UPDATE_TEAM_MEMBER + userToken + "/1234";

		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate
				.postForObject(url, teamMemberData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97173,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_SERVICE_TEAM,
									FiinfraConstants.SRP_EDIT_SERVICE_TEAM);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
	}

	@SuppressWarnings("unchecked")
	public void deleteTeamMemberList(HttpServletRequest request,
			HttpServletResponse response, TeamMember teamMemberData)
			throws IOException {

		if (request.getParameter("selectedlvalz") != null) {
			String result = FiinfraConstants.FAIL;
			String list = request.getParameter("selectedlvalz");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");

			String userToken = null;
			if (userSession.getUserName() != null) {
				userToken = userSession.getUserName();
			} else {
				userToken = "abc";
			}

			teamMemberData.setBuId(userSession.getBuId());
			teamMemberData.setCreatedBy(userSession.getUserId());
			teamMemberData.setDeleteList(list);

			url = URL_DELETE_TEAM_MEMBER + userToken + "/1234";
			

			BaseResponse<Integer> br = new BaseResponse<Integer>();
			
			br = restTemplate.postForObject(url, teamMemberData,
					BaseResponse.class);
			
		//	Integer codeValueDataList=null;
			
			Integer count = null;
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				count= br.getResponseObject();
			
			
			
		//	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			//	result = FiinfraConstants.SUCCESS;
				//insert code for audit functionality
				FiinfraUtility.doAudit(userSession.getPartyId(),
										userSession.getUserId(), 97174,
										FiinfraConstants.SERVICE_PORTAL,
										FiinfraConstants.SRP_SOURCE_MODULE_SERVICE_TEAM,
										FiinfraConstants.SRP_DELETE_SERVICE_TEAM);
			//}

			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, count);

		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/allocationList", method = RequestMethod.GET)
	public ModelAndView allocationList(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");		
		
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		
		ModelAndView mav = new ModelAndView("teammember/AllocationList");

		if (request.getParameter("partyID") != null && request.getParameter("userName") != null) 
		{
			int partyID = Integer.parseInt(request.getParameter("partyID"));
			String userName = request.getParameter("userName");

			try {

				url = URL_GET_ALLOCATION_LIST + userToken + "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder
						.fromHttpUrl(url);
				uriCB.queryParam("partyID", partyID);
				BaseResponse<TeamMemberAllocation> br = new BaseResponse<TeamMemberAllocation>();
				br = restTemplate.getForObject(
						FiinfraUtility.getURLWithParams(uriCB),
						BaseResponse.class);
				List<TeamMemberAllocation> allocationList = new ArrayList<TeamMemberAllocation>();
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					allocationList = br.getResponseListObject();
				//mav.addObject("allocationList", allocationList);
				mav.addObject("allocationList", objectMapper.writeValueAsString(allocationList));
				mav.addObject("userName", userName);
				mav.addObject("partyID", partyID);
				mav.addObject("size", pagesize);
				PrintWriter out = null;
				try {
					out = response.getWriter();
				} catch (Exception e) {
					logger.error(""+e);
				}
			} catch (Exception e) {
				logger.error(""+e);
			}
		}
		return mav;
	}

	@SuppressWarnings("unchecked")
	public void getDepartmentSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buid;
		try
		{
			 buid = Integer.parseInt(request.getParameter("bizunit"));
		}
		catch(Exception e)
		{
			 buid = userSession.getBuId();
		}
		


		url = URL_GET_TEAM_DEPARTMENT_SECTION + userSession.getUserName()
				+ "/1234";

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buid", buid);
		BaseResponse<MemberAllocation> br = new BaseResponse<MemberAllocation>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<MemberAllocation> departmentType = new ArrayList<MemberAllocation>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			departmentType = br.getResponseListObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, departmentType);
	}

	@SuppressWarnings("unchecked")
	public void getUniqAllocation(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		int partyID = Integer.parseInt(request.getParameter("partyID"));
		int buid = Integer.parseInt(request.getParameter("buid"));
		int departmentId = Integer.parseInt(request
				.getParameter("departmentId"));

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		url = URL_GET_UNIQUE_ALLOCATION + userToken + "/1234";

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyID", partyID);
		uriCB.queryParam("buid", buid);
		uriCB.queryParam("departmentId", departmentId);

		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();

		Integer codeValueDataList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList = br.getResponseObject();
		Integer status = codeValueDataList;

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, status);

		

	}

	@SuppressWarnings("unchecked")
	public void addMemberAllocation(HttpServletRequest request,
			HttpServletResponse response,
			TeamMemberAllocation teamMemberAllocatioData)
			throws JsonGenerationException, JsonMappingException, IOException {

		int buid = Integer.parseInt(request.getParameter("buid"));
		teamMemberAllocatioData.setBuId(buid);

		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		url = URL_ADD_TEAM_ALLOCATION + userToken + "/1234";

		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, teamMemberAllocatioData,
				BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97176,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_SERVICE_TEAM,
									FiinfraConstants.SRP_ADD_SERVICE_TEAM_MEMBER_ALLOCATION);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
	}

	@SuppressWarnings("unchecked")
	public void updateMemberAllocation(HttpServletRequest request,
			HttpServletResponse response,
			TeamMemberAllocation teamMemberAllocatioData)
			throws JsonGenerationException, JsonMappingException, IOException {

		int buid = Integer.parseInt(request.getParameter("buid"));
		teamMemberAllocatioData.setBuId(buid);

		int teammemberId = Integer.parseInt(request
				.getParameter("teammemberId"));
		teamMemberAllocatioData.setTeammemberId(teammemberId);

		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		url = URL_UPDATE_TEAM_ALLOCATION + userToken + "/1234";

		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, teamMemberAllocatioData,
				BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97189,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_SERVICE_TEAM,
									FiinfraConstants.SRP_EDIT_SERVICE_TEAM_MEMBER_ALLOCATION);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
	}

	@SuppressWarnings("unchecked")
	public void deleteAllocationList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		if (request.getParameter("selectedlvalz") != null) {

			
			UserSession userSession = (UserSession) request.getSession() .getAttribute("userSession");
			String list = request.getParameter("selectedlvalz");
			int lastmodifyBy=userSession.getUserId();

			String userToken = null;
			if (userSession.getUserName() != null) {
				userToken = userSession.getUserName();
			} else {
				userToken = "abc";
			}


			url = URL_DELETE_ALLOCATION + userToken + "/1234";
			
			TeamMemberAllocation teamMemberAllocation = new TeamMemberAllocation();
			teamMemberAllocation.setDeleteList(list);
			teamMemberAllocation.setLastmodifyBy(lastmodifyBy);

			BaseResponse<Integer> br = new BaseResponse<Integer>();
			
			br = restTemplate.postForObject(url, teamMemberAllocation,
					BaseResponse.class);
			Integer result = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				result = br.getResponseObject();
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97190,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_SERVICE_TEAM,
									FiinfraConstants.SRP_DELETE_SERVICE_TEAM_MEMBER_ALLOCATION);

			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, result);

		}
	}

	@SuppressWarnings("unchecked")
	public void loadAvailableBizUnitDepartment(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		url = URL_GET_AVAILABLE_BIZUNIT_DEPARTMENT + userSession.getUserName()
				+ "/1234";

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		BaseResponse<MemberAllocation> br = new BaseResponse<MemberAllocation>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<MemberAllocation> bizUnitDeptList = new ArrayList<MemberAllocation>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			bizUnitDeptList = br.getResponseListObject();


		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, bizUnitDeptList);
	}

	@SuppressWarnings("unchecked")
	public void addBulkAllocation(HttpServletRequest request,
			HttpServletResponse response, TeamMember teamMemberData)
			throws JsonGenerationException, JsonMappingException, IOException {

		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		
		url = URL_ADD_BULK_ALLOCATION + userToken + "/1234";

		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate
				.postForObject(url, teamMemberData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97175,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_SERVICE_TEAM,
									FiinfraConstants.SRP_BULK_ALLOCATE_SERVICE_TEAM);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
		

	}

	// TeamMember teamMemberData

	@SuppressWarnings("unchecked")
	public void teammemberCSV(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("In export in Teammember excel");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		try {

			if (userSession == null) {
				response.sendRedirect("/login");
				return;
			}
			TeamMember teamMember = new TeamMember();

			// TODO change hard coding
			Integer advisorPartyId = userSession.getPartyId(); // 6326
			Integer buId = userSession.getBuId();
			String token = "153443";
			url = URL_GET_TEAM_MEMBER_LIST + "ramu" + "/1234";
			teamMember.setBuId(buId);
			teamMember.setSearchTextVal("");
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<TeamMember> baseResponse = new BaseResponse<TeamMember>();

			
			baseResponse = restTemplate.postForObject(
					FiinfraUtility.getURLWithParams(uriCB), teamMember,
					BaseResponse.class);
			

			List<TeamMember> teamMemberAsJson = new ArrayList<TeamMember>();
			List<TeamMember> teamMemberList = new ArrayList<TeamMember>();

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					teamMemberAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < teamMemberAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						TeamMember teamMemberList2;
						teamMemberList2 = objectMapper.readValue(objectMapper
								.writeValueAsString(teamMemberAsJson.get(i)),
								TeamMember.class);

						teamMemberList.add(teamMemberList2);
					}

				} catch (JsonParseException e) {
					logger.error(""+e);
				} catch (JsonMappingException e) {
					logger.error(""+e);
				} catch (JsonGenerationException e) {
					logger.error(""+e);
				} catch (IOException e) {
					logger.error(""+e);
				}
			}

			response.addHeader("Content-Disposition",
					"attachment;filename=TeamMemberList.csv");

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Team Member Name"));
			writer.print(",");
			writer.print(CommonUtils.escape("User Name"));
			writer.print(",");
			writer.print(CommonUtils.escape("Login Account"));
			writer.print(",");
			writer.print(CommonUtils.escape("Allocated BU & Departments"));

			

			writer.println();
			for (TeamMember list : teamMemberList) {

				writer.print(CommonUtils.escape(list.getUserName()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getLastName()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getContactemail()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getAlloBU()));
				writer.println();
				
			}

		} catch (IOException e) {
			logger.error(""+e);
		}
	}

	@SuppressWarnings("unchecked")
	public void teammemberExecl(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("In export in Teammember excel");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		try {

			if (userSession == null) {
				response.sendRedirect("/login");
				return;
			}
			TeamMember teamMember = new TeamMember();
			// TODO change hard coding
			Integer advisorPartyId = userSession.getPartyId(); // 6326
			Integer buId = userSession.getBuId();
			String token = "abc";

			teamMember.setBuId(buId);
			teamMember.setSearchTextVal("");

			url = URL_GET_TEAM_MEMBER_LIST + "ramu" + "/1234";
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<TeamMember> baseResponse = new BaseResponse<TeamMember>();

			// call service for all parties associated
			baseResponse = restTemplate.postForObject(
					FiinfraUtility.getURLWithParams(uriCB), teamMember,
					BaseResponse.class);
			

			List<TeamMember> teamMemberAsJson = new ArrayList<TeamMember>();
			List<TeamMember> teamMemberList = new ArrayList<TeamMember>();

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					teamMemberAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < teamMemberAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						TeamMember teamMemberList2;
						teamMemberList2 = objectMapper.readValue(objectMapper
								.writeValueAsString(teamMemberAsJson.get(i)),
								TeamMember.class);

						teamMemberList.add(teamMemberList2);
					}

				} catch (JsonParseException e) {
					logger.error(""+e);
				} catch (JsonMappingException e) {
					logger.error(""+e);
				} catch (JsonGenerationException e) {
					logger.error(""+e);
				} catch (IOException e) {
					logger.error(""+e);
				}
			}

			response.addHeader("Content-Disposition",
					"attachment;filename=TeamMemberList.xls");

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Team Member Name"));
			writer.print("\t");
			writer.print(CommonUtils.escape("User Name"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Login Account"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Allocated BU & Departments"));

			

			writer.println();
			for (TeamMember list : teamMemberList) {

				writer.print(CommonUtils.escape(list.getUserName()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getLastName()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getContactemail()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getAlloBU()));
				writer.println();
				
			}

		} catch (IOException e) {
			logger.error(""+e);
		}
	}

	
	
	@SuppressWarnings("unchecked")
	public void allocationListExport(HttpServletRequest request,
			HttpServletResponse response) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		if (request.getParameter("partyID") != null
				&& request.getParameter("userName") != null) {
			int partyID = Integer.parseInt(request.getParameter("partyID"));
			String userName = request.getParameter("userName");
			
		try {

			url = URL_GET_ALLOCATION_LIST + userToken + "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder
					.fromHttpUrl(url);
			uriCB.queryParam("partyID", partyID);
			BaseResponse<TeamMemberAllocation> baseResponse = new BaseResponse<TeamMemberAllocation>();
			baseResponse = restTemplate.getForObject(
					FiinfraUtility.getURLWithParams(uriCB),
					BaseResponse.class);
			List<TeamMemberAllocation> allocationList = new ArrayList<TeamMemberAllocation>();
			
			List<TeamMemberAllocation> premAsJson = new ArrayList<TeamMemberAllocation>();
			List<TeamMemberAllocation> premumList = new ArrayList<TeamMemberAllocation>();

			

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					premAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < premAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						TeamMemberAllocation list2;
						list2 = objectMapper.readValue(objectMapper
								.writeValueAsString(premAsJson.get(i)),
								TeamMemberAllocation.class);

						premumList.add(list2);
					}

				} catch (JsonParseException e) {
					logger.error(""+e);
				} catch (JsonMappingException e) {
					logger.error(""+e);
				} catch (JsonGenerationException e) {
					logger.error(""+e);
				} catch (IOException e) {
					logger.error(""+e);
				}
			}

			String type = request.getParameter("type");
			String seperator = ",";
			if (type.equals("CSV")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=allocationList.csv");
				seperator = ",";
			}
			if (type.equals("excel")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=allocationList.xls");
				seperator = "\t";
			}

			

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("BizUnit"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Department"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Start Date"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("End Date"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Status"));

			
			writer.println();
			for (TeamMemberAllocation list : premumList) {

				writer.print(CommonUtils.escape("" + list.getBizunit()));
				writer.print(seperator);

				writer.print(CommonUtils.escape("" + list.getDepartmentName()));
				writer.print(seperator);

				if (list.getStartDate() != null) {
					writer.print(CommonUtils.escape("" + list.getStartDate()));
				} else {
					writer.print("NA");
				}
				writer.print(seperator);

				if (list.getEndDate() != null) {
					writer.print(CommonUtils.escape("" + list.getEndDate()));
				} else {
					writer.print("NA");
				}
				writer.print(seperator);
				
				if (list.getStatus()) {
					writer.print(CommonUtils.escape("Active"));
				} else {
					writer.print(CommonUtils.escape("InActive"));
				}
				writer.print(seperator);
				writer.println();
			}

		} catch (Exception e) {
			logger.error(""+e);
		}
		}
	}
}
