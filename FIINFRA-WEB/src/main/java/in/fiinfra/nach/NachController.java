package in.fiinfra.nach;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.PartyData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.pg.NachData;
import in.fiinfra.pg.SubscriptionData;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.derby.impl.tools.sysinfo.Main;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.codehaus.jackson.node.ObjectNode;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class NachController extends MultiActionController {

	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	private static final Logger logger = Logger.getLogger(NachController.class);
	String url;

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

	@Value("${URL_GET_PICKLIST_VALUE_LIST}")
	private String URL_GET_PICKLIST_VALUE_LIST;

	@Value("${URL_GET_PARTNER_PROFILE_RECORD}")
	private String URL_GET_PARTNER_PROFILE_RECORD;

	@Value("${URL_GET_NACH_DETAILS}")
	private String URL_GET_NACH_DETAILS;

	@Value("${URL_SAVE_NACH_DATA}")
	private String URL_SAVE_NACH_DATA;

	@Value("${ADD_TASK_URL}")
	private String ADD_TASK_URL;
	
	@Value("${GET_ASSIGNEDTO_VALUES}")
	private String 	GET_ASSIGNEDTO_VALUES;


	
	@Value("${getCurrent_Subx}")
	private String getCurrent_Subx;

	@Value("${URL_GET_NACH_BY_PARTYID}")
	private String URL_GET_NACH_BY_PARTYID;

	@RequestMapping(value = "/list", method = { RequestMethod.GET })
	public ModelAndView nachList(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("partner/nachList");
		return mav;
	}

	@SuppressWarnings("unchecked")
	public void showNACHDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		NachData nachData = getNachDetails(userSession);
		if (nachData != null) {

			ObjectMapper mapper = new ObjectMapper();
			ObjectNode map = mapper.createObjectNode();

			addValue(mapper, map, "nachId",
					nachData.getNachId() != null ? nachData.getNachId() : 0);
			addValue(mapper, map, "partyName", nachData.getPartyName());
			addValue(mapper, map, "branch", nachData.getBranch());
			addValue(mapper, map, "bankName", nachData.getBankName());
			addValue(mapper, map, "accountNo", nachData.getAccountNumber());
			addValue(mapper, map, "email", nachData.getEmail());
			addValue(
					mapper,
					map,
					"mobile",
					!CommonUtils.emptyIfNull(nachData.getMobile()).equals(
							"null") ? nachData.getMobile() : "");
			addValue(mapper, map, "ifsc", nachData.getIfsc());
			addValue(mapper, map, "partyName", nachData.getPartyName());
			addValue(mapper, map, "micr", nachData.getMicr());
			// addValue(mapper, map, "umrn", nach.getUMRN());
			addValue(mapper, map, "status", nachData.getStatus());
			addValue(mapper, map, "reference1", nachData.getReferece1());
			addValue(mapper, map, "reference2", nachData.getRefernce2());
			addValue(mapper, map, "startDate",
					CommonUtils.formatDate(nachData.getStartDate()));
			addValue(mapper, map, "endDate",
					CommonUtils.formatDate(nachData.getEndDate()));
			addValue(mapper, map, "registrationDate", 
					CommonUtils.formatDate(nachData.getRegistrationDate()));
			addValue(
					mapper,
					map,
					"limitAmount",
					nachData.getLimitAmount() != null ? nachData
							.getLimitAmount() : 0);
			addValue(mapper, map, "reference1", nachData.getReferece1());
			addValue(mapper, map, "reference2", nachData.getRefernce2());
			addValue(mapper, map, "remark", nachData.getRemark());
			addValue(mapper, map, "registrationDate", CommonUtils.format(
					nachData.getRegistrationDate(), "dd/MM/yyyy"));
			addValue(mapper, map, "statusId", nachData.getStatusId());
			addValue(mapper, map, "feqId", nachData.getFrequencyId());
			addValue(mapper, map, "accountTypeId", nachData.getAccountId());
			addValue(mapper, map, "errorDetail", nachData.getErrorDetail());
			
			ArrayNode freq = mapper.createArrayNode();
			for (CodeValueData c : getCodeValueData(userSession, 63)) {
				if (c.getCodeValueId() == 63005 || c.getCodeValueId() == 63003
						|| c.getCodeValueId() == 63006) {
					ObjectNode node = mapper.createObjectNode();
					addValue(mapper, node, "id", c.getCodeValueId());
					addValue(mapper, node, "value", c.getCodeValue());
					freq.add(node);
				}
			}
			addValue(mapper, map, "frequencies", freq);
			ArrayNode status = mapper.createArrayNode();
			for (CodeValueData c : getCodeValueData(userSession, 155)) {

				ObjectNode node = mapper.createObjectNode();
				addValue(mapper, node, "id", c.getCodeValueId());
				addValue(mapper, node, "value", c.getCodeValue());
				status.add(node);

			}
			addValue(mapper, map, "status", status);
			ArrayNode accountType = mapper.createArrayNode();
			for (CodeValueData c : getCodeValueData(userSession, 68)) {

				ObjectNode node = mapper.createObjectNode();
				addValue(mapper, node, "id", c.getCodeValueId());
				addValue(mapper, node, "value", c.getCodeValue());
				accountType.add(node);

			}
			addValue(mapper, map, "accountType", accountType);

			// addValue(mapper, map, "registrationDate",);

			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");

			objectMapper.writeValue(out, map);
		}
		/************/
	}

	private NachData getNachDetails(UserSession userSession) throws IOException {

		url = URL_GET_NACH_BY_PARTYID + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("userId", userSession.getUserId());
		uriCB.queryParam("partyId", partyId);
		BaseResponse<NachData> br = new BaseResponse<NachData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		NachData nachData = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			nachData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					NachData.class);
		}

		return nachData;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				new SimpleDateFormat("dd/MM/yyyy"), true));
	}

	private CodeValueData[] getCodeValueData(UserSession userSession,
			int codeTypeId) throws IOException {
		url = URL_GET_PICKLIST_VALUE_LIST + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);

		int partyId = userSession.getPartyId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("userId", userSession.getUserId());
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", userSession.getBuId());
		uriCB.queryParam("codeTypeIds", codeTypeId);

		BaseResponse<NachData> br = new BaseResponse<NachData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		CodeValueData[] freq = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			freq = objectMapper
					.readValue(objectMapper.writeValueAsString(br
							.getResponseListObject()), CodeValueData[].class);
		}
		return freq;
	}

	@SuppressWarnings("unchecked")
	public void saveNACH(HttpServletRequest request,
			HttpServletResponse response, NachData nachData) throws IOException {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_SAVE_NACH_DATA + userSession.getUserName() + "/1234";
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("userId", userSession.getUserId());
		// uriCB.queryParam("partyId", partyId);
		if (nachData.getStatusId() != null && nachData.getStatusId() == 155001) {
			nachData.setStatusId(155002);
		} else {
			nachData.setStatusId(155001);
		}
		nachData.setPartyID(partyId);
		nachData.setUserId(userSession.getUserId());
		BaseResponse<NachData> br = new BaseResponse<NachData>();

		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB),
				nachData, BaseResponse.class);
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode map = mapper.createObjectNode();
		Integer nachId = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			nachId = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);

			addValue(mapper, map, "response", "success");
		}
		request.setAttribute("nachData", nachData);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, map);
	}

	@SuppressWarnings("unchecked")
	public String initiateNACH(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

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
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		ProfileData profileData = new ProfileData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			profileData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					ProfileData.class);
		SubscriptionData s = getCurrentSubxData(userSession);
		NachData nachData = new NachData();
		nachData.setUserId(userSession.getUserId());
		nachData.setPartyName(profileData.getFirstName() + " "
				+ profileData.getLastName());
		nachData.setEmail(profileData.getContactEmail());
		nachData.setMobile(profileData.getContactMobile());
		nachData.setBankName(profileData.getBankName());
		nachData.setBranch(profileData.getBranchname());
		nachData.setAccountNumber(profileData.getAccountNo());
		nachData.setIfsc(profileData.getIfscCode());
		nachData.setPartyID(partyId);
		nachData.setFrequencyId(s.getPaymentFrequencyId());
		nachData.setStatusId(155001);
		//nachData.setLimitAmount((double) s.getSubscriptionCostAmount());
		BaseResponse<NachData> br1 = new BaseResponse<NachData>();

		String url1;
		url1 = URL_SAVE_NACH_DATA + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB2 = UriComponentsBuilder.fromHttpUrl(url1);
		br1 = restTemplate.postForObject(
				FiinfraUtility.getURLWithParams(uriCB2), nachData,
				BaseResponse.class);
		Integer nachId = 0;
		if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			nachId = objectMapper.readValue(
					objectMapper.writeValueAsString(br1.getResponseObject()),
					Integer.class);
		}

		saveNotification(request);
		saveTask(request,userSession);
		return "redirect:/partnerprofile.htm";

	}

	private void saveNotification(HttpServletRequest servletRequest) {
		UserSession user = (UserSession) servletRequest.getSession()
				.getAttribute("userSession");
		Notification notification = new Notification();
		Map<String, String> payloadMap = new HashMap<String, String>();
		payloadMap.put("user", user.getName());
		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(user.getPartyId());
		notification.setNotifyEventID(430);
		notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
		notification.setBuId(user.getBuId());
		notification.setPayloadMap(payloadMap);
		// notification.setAttachment1DocumentID(doc.getDocumentId());
		notification.setSessionID(servletRequest.getSession().getId());
		FrameworkUtil.notify(notification);
	}

	private void saveTask(HttpServletRequest request,UserSession user) throws IOException{
		Calendar cal=Calendar.getInstance();
		cal.add(Calendar.DAY_OF_YEAR, 3);
		Task task=new Task();
		PartyData party=getParty(user);
		
		task.setOriginatedPartyId(user.getPartyId());
		task.setOwnerPartyId(party.getRmPartyId());
		task.setTargetPartyId(user.getPartyId());
		task.setDueDateTime(new Timestamp(cal.getTimeInMillis()));
		task.setDueDateTimeString(CommonUtils.format(cal.getTime(),	"dd-MM-yy"));
		task.setStatusId(19001);
		task.setCategoryId(17003);
		task.setPriorityId(18003);
		task.setTargetContactTypeId(user.getPartyTypeId());
		task.setSubject(user.getName()+ " has initiated request for goal");
		task.setDescription(user.getName()
				+ " has initiated the request for Auto Payment");
				
//		task.setCompletionDateTimeString("");
		task.setCreatedBy(user.getUserId()); 
		
		url = ADD_TASK_URL + user.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
		int buId = user.getBuId();
		int partyId = user.getPartyId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		
		br = restTemplate.postForObject(
				FiinfraUtility.getURLWithParams(uriCB), task,
				BaseResponse.class);
		
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			
		}
	}
	
	private SubscriptionData getCurrentSubxData(UserSession userSession)
			throws Exception {

		url = getCurrent_Subx + userSession.getUserName() + "/1234";
		logger.info("URL ---------------------> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<SubscriptionData> br = new BaseResponse<SubscriptionData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		ObjectMapper mapper = new ObjectMapper();

		SubscriptionData s = new SubscriptionData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			s = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					SubscriptionData.class);
		}
		return s;
	}
	private  PartyData getParty(UserSession userSession) throws IOException{
		
		url = GET_ASSIGNEDTO_VALUES +"/"+ userSession.getUserName() + "/1234";
		logger.info("URL ---------------------> " + url);
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<PartyData> br = new BaseResponse<PartyData>();
		PartyData p = new PartyData();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			p = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					PartyData.class);
		}
		return p;
	}
	
	

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			String value) {
		map.put(key, value);
	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			ArrayNode value) {
		map.put(key, value);
	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			double value) {
		map.put(key, value);
	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			int value) {
		map.put(key, value);
	}

}
