package in.fiinfra.tool.ctrl;

import in.fiinfra.common.common.ChartData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.AdviserGoalChart;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.DcAnalysisHelper;
import in.fiinfra.common.diy.models.DcInputData;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.diy.models.WhatIfData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.DateUtil;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.PartyDateComparator;
import in.fiinfra.common.util.PartyNameComparator;
import in.fiinfra.common.utility.CurrentFinancialStatusData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.cp.common.ctrl.AbstractController;
import in.fiinfra.cp.common.util.AuthHandler;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Produces;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;
//import in.fiinfra.forgotpassword.models.TaskListResponse;

@Controller
@RequestMapping("/partner")
public class DcController extends AbstractController {
	private static final Logger LOGGER = Logger.getLogger(DcController.class);

	private static final String DC_XML = "DCInputFields.xml";
	
	@Autowired
	RestTemplate restTemplate;
	
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
	
	// for assetAllocation
	@Value("${GET_WHATIF_ANALYSIS_DATA}")
	private String GET_WHATIF_ANALYSIS_DATA;
	
	@Value("${SAVE_WHAT_IF_ANALYSIS}")
	private String SAVE_WHAT_IF_ANALYSIS; 
	
	// end asset allocation
	
	@Value("${GET_INTERESTED_FP_SECTION}")
	private String GET_INTERESTED_FP_SECTION;
	
	private final String DATE_FORMAT_DD_MM_YYYY = "dd-MM-yyyy";
	
	private static final String LOGIN_SOURCE="Login";
	private static final String CONTACT_SOURCE="Contact";
	private static final String DC_SOURCE="Data Collection";
	private static final String CFS_SOURCE="Current Financial Status";
	private static final String PARTNER_PROFILE_SOURCE="Partner profile";
	private static final String ASSUMPTION_SOURCE="Assumption profile";
	private static final String DC_ACTIVATE_SOURCE="Activate DC";
	
	List<WhatIfData> whatIfDataList = new ArrayList<WhatIfData>();

	
	@Autowired
	private ObjectMapper objectMapper;
	
	private final String PARTYLIST = "partyList";
	private final String TOTALCONTACTS = "totalContacts";
	
	/**
	 * This method is responsible to show the dashboard screen after successful login
	 * @param request of type {@link javax.servlet.http.HttpServletRequest}
	 * @return result of type {@link java.lang.String}
	 */
	

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
	
	@RequestMapping(value = "/datacollection", method = RequestMethod.GET)
	public String getDataCollection(Model model, HttpServletRequest request) {
		
		UserSession userSession = AuthHandler.getCurrentUser();
		model.addAttribute("partyId", userSession.getPartyId());
		//to set current stage id to DCT activated
		UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7001/"+userSession.getPartyId()+"/342");
		uri.queryParam("buId", userSession.getBuId());
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
		
		String token = "token";
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append(GET_NUMBER_OF_GOALS_FOR_PARTYID);
		strBuilder.append(userSession.getPartyId());
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
				
		// end of code for fp section

		return "partner/datacollection";
	}
	
	@RequestMapping(value = "/datacollection/cash-flow", method = RequestMethod.GET)
	public String getDCCashFlow(Model model, HttpServletRequest request) {
		    UserSession userSession = AuthHandler.getCurrentUser();
		    model.addAttribute("partyId", userSession.getPartyId()); 
			String questionBankId = "29";
			String sectionTypeId = "39002";
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), userSession.getPartyId(), userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", userSession.getPartyId());
			model.addAttribute("redirectUrl", "/partner/datacollection/cash-flow" );
			
			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.CASH_FLOW, userSession.getPartyId().toString());
			String backUrl = getBackUrl(sectionList, FiinfraConstants.CASH_FLOW, userSession.getPartyId().toString());
			model.addAttribute("previousPageUrl",backUrl);
			model.addAttribute("nextPageUrl",nexturl);
			
			model.addAttribute("analysisPageUrl", "/partner/datacollection/cash-flow-analysis"  );			
			model.addAttribute("questionDetails", questionDetails);
	
			String attributeCodeIds = "98002,98047";
			Integer clientPartyId = userSession.getPartyId();
			Integer defaultAge = 0;
			List<AdviceAssumption> adviceAssumptions = getAssumptions( userSession.getBuId(), userSession.getPartyId(),
					clientPartyId, attributeCodeIds);
			model.addAttribute("adviceAssumptions", adviceAssumptions);
		
		return "partner/datacollection/cash-flow";
	}
	
	@RequestMapping(value = "/datacollection/financial-readiness", method = RequestMethod.GET)
	public String getDCFinancialReadiness(Model model, HttpServletRequest request) {
		 UserSession userSession = AuthHandler.getCurrentUser();
		    model.addAttribute("partyId", userSession.getPartyId()); 
			String questionBankId = "29";
			String sectionTypeId = "39005";
			
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), userSession.getPartyId(), userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", userSession.getPartyId());
			model.addAttribute("redirectUrl", "/partner/datacollection/financial-readiness");

			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.GOAL_READINESS, userSession.getPartyId().toString());
			String backUrl = getBackUrl(sectionList, FiinfraConstants.GOAL_READINESS, userSession.getPartyId().toString());
			model.addAttribute("previousPageUrl",backUrl);
			model.addAttribute("nextPageUrl",nexturl);
			
			model.addAttribute("questionDetails", questionDetails);
	
			String attributeCodeIds = "98021";
			Integer clientPartyId = userSession.getPartyId();
			List<AdviceAssumption> adviceAssumptions = getAssumptions( userSession.getBuId(), userSession.getPartyId(),
					clientPartyId, attributeCodeIds);
			model.addAttribute("adviceAssumptions", adviceAssumptions);
			
		
		return "partner/datacollection/financial-readiness";
	}
	
	@RequestMapping(value = "/datacollection/risk-cover", method = RequestMethod.GET)
	public String getDCRiskCover(Model model, HttpServletRequest request) {
	        UserSession userSession = AuthHandler.getCurrentUser();
	        model.addAttribute("partyId", userSession.getPartyId());
			
			String questionBankId = "29";
			String sectionTypeId = "39003";
			
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), userSession.getPartyId(), userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId",userSession.getPartyId());
			model.addAttribute("redirectUrl", "/partner/datacollection/risk-cover" );

			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.RISK_COVER, userSession.getPartyId().toString());
			String backUrl = getBackUrl(sectionList, FiinfraConstants.RISK_COVER, userSession.getPartyId().toString());
			model.addAttribute("previousPageUrl",backUrl);
			model.addAttribute("nextPageUrl",nexturl);
			
			model.addAttribute("questionDetails", questionDetails);	
			String token = "153443";
			UriComponentsBuilder uriCB;
			Integer buId = userSession.getBuId();
			
			KeyValue self = new KeyValue();
			self.setId(userSession.getPartyId());
			self.setName("Self");
			
			List<KeyValue> relationshipIdsJson = new ArrayList<KeyValue>();
			
			try{
				uriCB = UriComponentsBuilder.fromHttpUrl(GET_REALTIONSHIPID_FOR_PARTY + "/" + userSession.getPartyId() + "/" + token + "?buId=" + buId);

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
			Integer clientPartyId = userSession.getPartyId();
			List<AdviceAssumption> adviceAssumptions = getAssumptions( userSession.getBuId(), userSession.getPartyId(),
					clientPartyId, attributeCodeIds);
			model.addAttribute("adviceAssumptions", adviceAssumptions);
		return "partner/datacollection/risk-cover";
	}
	
	@RequestMapping(value = "/datacollection/loan-status", method = RequestMethod.GET)
	public String getDCLoanStatus(Model model, HttpServletRequest request) {
		
		    UserSession userSession = AuthHandler.getCurrentUser();
             model.addAttribute("partyId", userSession.getPartyId());
			
			String questionBankId = "29";
			String sectionTypeId = "39008";
			
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), userSession.getPartyId(), userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", userSession.getPartyId());
			model.addAttribute("redirectUrl", "/partner/datacollection/loan-status");

			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.LOAN_STATUS, userSession.getPartyId().toString());
			String backUrl = getBackUrl(sectionList, FiinfraConstants.LOAN_STATUS, userSession.getPartyId().toString());
			model.addAttribute("previousPageUrl",backUrl);
			model.addAttribute("nextPageUrl",nexturl);
			
			model.addAttribute("questionDetails", questionDetails);
	
			
		return "partner/datacollection/loan-status";
	}
	
	@RequestMapping(value = "/datacollection/emergency-readiness", method = RequestMethod.GET)
	public String getDCEmergencyReadiness(Model model,HttpServletRequest request) {
		
			UserSession userSession = AuthHandler.getCurrentUser();
			model.addAttribute("partyId", userSession.getPartyId());
			String questionBankId = "29";
			String sectionTypeId = "39001";
			String xmlData = getXmlForSectionType(sectionTypeId, request);
						
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), userSession.getPartyId(), userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", userSession.getPartyId());
			model.addAttribute("redirectUrl", "/partner/datacollection/emergency-readiness" );

			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.EMERGENCY, userSession.getPartyId().toString());
			String backUrl = getBackUrl(sectionList, FiinfraConstants.EMERGENCY, userSession.getPartyId().toString());
			model.addAttribute("previousPageUrl",backUrl);
			model.addAttribute("nextPageUrl",nexturl);
			
			model.addAttribute("questionDetails", questionDetails);
			
			String attributeCodeIds = "98021,98027";
			Integer clientPartyId = userSession.getPartyId();
			List<AdviceAssumption> adviceAssumptions = getAssumptions( userSession.getBuId(), userSession.getPartyId(),
					clientPartyId, attributeCodeIds);
			model.addAttribute("adviceAssumptions", adviceAssumptions);
			
			
		return "partner/datacollection/emergency-readiness";
	}
			
	@RequestMapping(value = "/datacollection/retirement-planning", method = RequestMethod.GET)
	public String getDCRetirementPlanning(Model model,  HttpServletRequest request) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException {
	        UserSession userSession= AuthHandler.getCurrentUser();
	        model.addAttribute("partyId", userSession.getPartyId());
			String questionBankId = "29";
			String sectionTypeId = "39006";
			
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), userSession.getPartyId(), userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", userSession.getPartyId());
			model.addAttribute("redirectUrl", "/partner/datacollection/retirement-planning" );

			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.RETIREMENT, userSession.getPartyId().toString());
			String backUrl = getBackUrl(sectionList, FiinfraConstants.RETIREMENT, userSession.getPartyId().toString());
			model.addAttribute("previousPageUrl",backUrl);
			model.addAttribute("nextPageUrl",nexturl);
			
			model.addAttribute("questionDetails", questionDetails);
	
			String attributeCodeIds = "98021,98022";
			Integer clientPartyId = userSession.getPartyId();
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
			return "partner/datacollection/retirement-planning";
	}

	@RequestMapping(value = "/datacollection/succession-readiness", method = RequestMethod.GET)
	public String getDCSuccessionReadiness(Model model, HttpServletRequest request) {
		
			UserSession userSession= AuthHandler.getCurrentUser();
			model.addAttribute("partyId", userSession.getPartyId());
			String questionBankId = "29";
			String sectionTypeId = "39007";
//			String headerName = (String) request.getSession().getAttribute("headerName");
			
			String xmlData = getXmlForSectionType(sectionTypeId, request);
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), userSession.getPartyId(), userSession.getBuId().toString(), sectionTypeId, questionBankId);
			
			model.addAttribute("sectionData", xmlData);		
			model.addAttribute("questionBankId", questionBankId);
			model.addAttribute("sectionTypeId", sectionTypeId);
			model.addAttribute("partyId", userSession.getPartyId());
			model.addAttribute("redirectUrl", "/partner/datacollection/succession-readiness");

			List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
			String nexturl = getNextUrl(sectionList, FiinfraConstants.SUCCESSION_READINESS, userSession.getPartyId().toString());
			String backUrl = getBackUrl(sectionList, FiinfraConstants.SUCCESSION_READINESS, userSession.getPartyId().toString());
			model.addAttribute("previousPageUrl",backUrl);
			model.addAttribute("nextPageUrl",nexturl);
			
			model.addAttribute("analysisPageUrl", "/partner/datacollection/succession-readiness-analysis" );	
			model.addAttribute("questionDetails", questionDetails);
	
		
		return "partner/datacollection/succession-readiness";
	}
	
	private List<QuestionDetails> getDcInputData(String userId, Integer integer, String buId, 
			String sectionTypeId, String questionBankId){
		try{
			List<QuestionDetails> dcipList = new ArrayList<QuestionDetails>();
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(FETCH_DC_INPUTDATA + "/" + userId + "/" + "12345");
			uriCB.queryParam("partyId", integer);
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
	
	@Deprecated
	@RequestMapping(value = "/datacollection/get-inputdata", method = RequestMethod.GET)
	public @ResponseBody List<DcInputData> getContactsForAdvisor(HttpServletRequest request,
			@RequestParam(value = "attributeCodeIds[]", required = false) String[] attributeCodeIds) {
		UserSession userSession = AuthHandler.getCurrentUser();
		String partyId = userSession.getPartyId().toString();;
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
		UserSession userSession = AuthHandler.getCurrentUser();
		String partyId = userSession.getPartyId().toString();
		String redirectUrl = request.getParameter("redirectUrl");
		
		String sourceScreen="";
		int eventId = 0;
		try{
		
			String token = "12345";
			String userName = userSession.getUserName();
			
			//to set current stage id to DCT activated
			UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7007/"+partyId+"/342");
			uri.queryParam("buId", userSession.getBuId());
			BaseResponse<Boolean> base = new BaseResponse<Boolean>();
			base = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
			
			String questionBankId = request.getParameter("questionBankId");
			String sectionTypeId = request.getParameter("sectionTypeId");
			String xMLString = request.getParameter("inputData");
			CurrentFinancialStatusData cData = new CurrentFinancialStatusData();
			cData.setBuId(userSession.getBuId());
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
					dataFor = "CF";
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
					case "39001": 
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", getMessage("success.cfs.emergencyReadiness"));
						}
						break;
					case "39003":
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", getMessage("success.cfs.riskCover"));
						}
						break;
					case "39006":
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", getMessage("success.cfs.retirementReadiness"));
						}
						break;
					case "39007":
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", getMessage("success.cfs.successionReadiness"));
						}
						break;
					case "39005":
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", getMessage("success.cfs.financialReadiness"));
						}
						break;
					case "39002": 
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", getMessage("success.cfs.cashFlow"));
						}
						break;
					case "39008":
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", getMessage("success.cfs.loans"));
						}
						break;				
					case "39009":
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("success", getMessage("success.cfs.riskProfile"));
						}
						break;
					default: break;			
				}
				//redirectAttributes.addFlashAttribute("success", "Data Saved Successfully!!!");		

				if(dataFor !=""){
					uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_SUGGESTION_DATA + "/" + partyId + "/" + dataFor +"/" 
							+ userSession.getUserId() + "/" + token);
					uriCB.queryParam("buId", userSession.getBuId());
					
					br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
					audit(userSession.getPartyId(), userSession.getUserId(), eventId, CFS_SOURCE, sourceScreen);
					if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					{	
						switch(sectionTypeId){				
						case "39001": 
							if(request.getParameter("nextPageUrl")==""){
							redirectAttributes.addFlashAttribute("success", getMessage( "success.cfs.emergencyReadiness"));
							}
							break;
						case "39003":
							if(request.getParameter("nextPageUrl")==""){
							redirectAttributes.addFlashAttribute("success", getMessage("success.cfs.riskCover"));
							}
							break;
						case "39006":
							if(request.getParameter("nextPageUrl")==""){
							redirectAttributes.addFlashAttribute("success",getMessage( "success.cfs.retirementReadiness"));
							}
							break;
						case "39007":
							if(request.getParameter("nextPageUrl")==""){
							redirectAttributes.addFlashAttribute("success", getMessage("success.cfs.successionReadiness"));
							}
							break;
						case "39005":
							if(request.getParameter("nextPageUrl")==""){
							redirectAttributes.addFlashAttribute("success",getMessage( "success.cfs.financialReadiness"));
							}
							break;
						case "39002":
							if(request.getParameter("nextPageUrl")==""){
							redirectAttributes.addFlashAttribute("success", getMessage("success.cfs.cashFlow"));
							}
							break;
						case "39008": 
							if(request.getParameter("nextPageUrl")==""){
							redirectAttributes.addFlashAttribute("success",getMessage( "success.cfs.loans"));
							}
							break;				
						case "39009":
							if(request.getParameter("nextPageUrl")==""){
							redirectAttributes.addFlashAttribute("success",getMessage( "success.cfs.riskProfile"));
							}
							break;
						default: break;			
					}
						/*// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
						UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId + "/"+userName+"/" + token);
						uriRetirement.queryParam("buId", userSession.getBuId());
						BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
						retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
						if (retirementBr.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
							
							//redirectAttributes.addFlashAttribute("success", "Data Saved Successfully!!!");	
						}else{
							switch(sectionTypeId){				
								case "39001": 
									if(request.getParameter("nextPageUrl")==""){
									redirectAttributes.addFlashAttribute("error", "error.cfs.emergencyReadiness");
									}
									break;
								case "39003":
									if(request.getParameter("nextPageUrl")==""){
									redirectAttributes.addFlashAttribute("error", "error.cfs.riskCover");
									}
									break;
								case "39006":
									if(request.getParameter("nextPageUrl")==""){
									redirectAttributes.addFlashAttribute("error", "error.cfs.retirementReadiness");
									}
									break;
								case "39007":
									if(request.getParameter("nextPageUrl")==""){
									redirectAttributes.addFlashAttribute("error", "error.cfs.successionReadiness");
									}
									break;
								case "39005": 
									if(request.getParameter("nextPageUrl")==""){
									redirectAttributes.addFlashAttribute("error", "error.cfs.financialReadiness");
									}
									break;
								case "39002": 
									if(request.getParameter("nextPageUrl")==""){
									redirectAttributes.addFlashAttribute("error", "error.cfs.cashFlow");
									}
									break;
								case "39008": 
									if(request.getParameter("nextPageUrl")==""){
									redirectAttributes.addFlashAttribute("error", "error.cfs.loans");
									}
									break;				
								case "39009":
									if(request.getParameter("nextPageUrl")==""){
									redirectAttributes.addFlashAttribute("error", "error.cfs.riskProfile");
									}
									break;
								default: break;			
							}
							if(request.getParameter("nextPageUrl")==""){
							redirectAttributes.addFlashAttribute("error", "Error while saving Financial status, please try again later!!!");
							}
							audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_CFS_DATA_SAVE_FAILED, CFS_SOURCE, sourceScreen);
						}*/
						// end of  call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
					}else
					{
						switch(sectionTypeId){				
							case "39001":
								if(request.getParameter("nextPageUrl")==""){
								redirectAttributes.addFlashAttribute("error", "error.cfs.emergencyReadiness");
								}
								break;
							case "39003":
								if(request.getParameter("nextPageUrl")==""){
								redirectAttributes.addFlashAttribute("error", "error.cfs.riskCover");
								}
								break;
							case "39006":
								if(request.getParameter("nextPageUrl")==""){
								redirectAttributes.addFlashAttribute("error", "error.cfs.retirementReadiness");
								}
								break;
							case "39007": 
								if(request.getParameter("nextPageUrl")==""){
								redirectAttributes.addFlashAttribute("error", "error.cfs.successionReadiness");
								}
								break;
							case "39005": 
								if(request.getParameter("nextPageUrl")==""){
								redirectAttributes.addFlashAttribute("error", "error.cfs.financialReadiness");
								}
								break;
							case "39002":
								if(request.getParameter("nextPageUrl")==""){
								redirectAttributes.addFlashAttribute("error", "error.cfs.cashFlow");
								}
								break;
							case "39008":
								if(request.getParameter("nextPageUrl")==""){
								redirectAttributes.addFlashAttribute("error", "error.cfs.loans");
								}
								break;				
							case "39009":
								if(request.getParameter("nextPageUrl")==""){
								redirectAttributes.addFlashAttribute("error", "error.cfs.riskProfile");
								}
								break;
							default: break;			
						}
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("error", "Error while saving Financial status, please try again later!!!");
						}
						audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_CFS_DATA_SAVE_FAILED, CFS_SOURCE, sourceScreen);
					}
				} else{
					audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_RISK_PROFILE_SAVED_SUCCESSFULLY, DC_SOURCE, sourceScreen);
				}
			} else {
				switch(sectionTypeId){				
					case "39001":
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("error", "error.cfs.emergencyReadiness");
						}
						break;
					case "39003":
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("error", "error.cfs.riskCover");
						}
						break;
					case "39006":
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("error", "error.cfs.retirementReadiness");
						}
						break;
					case "39007": 
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("error", "error.cfs.successionReadiness");
						}
						break;
					case "39005":
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("error", "error.cfs.financialReadiness");
						}
						break;
					case "39002": 
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("error", "error.cfs.cashFlow");
						}
						break;
					case "39008": 
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("error", "error.cfs.loans");
						}
						break;				
					case "39009": 
						if(request.getParameter("nextPageUrl")==""){
						redirectAttributes.addFlashAttribute("error", "error.cfs.riskProfile");
						}
						break;
					default: break;			
				}				
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_CFS_DATA_SAVE_FAILED, CFS_SOURCE, sourceScreen);
			}
		}catch(Exception ex){
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_CFS_DATA_SAVE_FAILED, CFS_SOURCE, sourceScreen.length()==0?"CFS":sourceScreen);			
		}
		if(request.getParameter("nextPageUrl")!="")
		{
			return "redirect:" + request.getParameter("nextPageUrl");
		}else{
			return "redirect:" + redirectUrl;
		}
	}
	
	@RequestMapping(value = "/datacollection/assumption/save", method = RequestMethod.POST)
	public @ResponseBody String saveAssumptionDetails(HttpServletRequest request, 
			@RequestParam(value = "updatedAssumptions") String updatedAssumptions,
			@RequestParam(value = "clientId") String clientId) {			
		try{
			UserSession userSession = AuthHandler.getCurrentUser();
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
				adviceAssumptionList.add(adviceAssumption);
			}
			
			BaseResponse<Party> br = new BaseResponse<Party>();
			br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceAssumptionList, BaseResponse.class);
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_UPDATE_OPPORTUNITY_ASSUMPTION_DETAILS_SUCCESSFUL, ASSUMPTION_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_ASSUMPTION_DETAILS_SUCCESSFUL);
				return "Data Saved Successfully!!!";
			} else {
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_UPDATE_OPPORTUNITY_ASSUMPTION_DETAILS_FAILED, ASSUMPTION_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_ASSUMPTION_DETAILS_SUCCESSFUL);
				return "Error Saving Data";
			}
		}catch(Exception ex){
			LOGGER.error("Error Saving Assumption Data", ex);
			return "Error Saving Data";
		}		
	}
	
	@RequestMapping(value = "/datacollection/emergency-readiness-analysis", method = RequestMethod.GET)
	public String getDCEmergencyReadinessAnalysis(Model model, HttpServletRequest request) {
		
		try{
			UserSession userSession = AuthHandler.getCurrentUser();
									
			String dataFor = "ER";
			DcAnalysisHelper analysisDetails = getAnalysisData(userSession.getUserId().toString(), ""+userSession.getPartyId(), userSession.getBuId().toString(), dataFor);
													
			model.addAttribute("partyId", userSession.getPartyId());
			model.addAttribute("analysisDetails", analysisDetails);
	
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}		
		return "partner/datacollection/emergency-readiness-analysis";
	}
		
	@RequestMapping(value = "/datacollection/risk-cover-analysis", method = RequestMethod.GET)
	public String getDCRiskCoverAnalysis(Model model,  HttpServletRequest request) {
		try{
			UserSession userSession = AuthHandler.getCurrentUser();
			String partyId = ""+userSession.getPartyId();
									
			String dataFor = "RC";
			DcAnalysisHelper analysisDetails = getAnalysisData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), dataFor);
													
			model.addAttribute("partyId", partyId);
			
			model.addAttribute("analysisDetails", analysisDetails);
			
			model.addAttribute("error", analysisDetails.getErrorMsg());
	
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
			
		}		
		return "partner/datacollection/risk-cover-analysis";
	}
	
	@RequestMapping(value = "/datacollection/succession-readiness-analysis", method = RequestMethod.GET)
	public String getDCSuccessionReadinessAnalysis(Model model,  HttpServletRequest request) {
		try{
			UserSession userSession = AuthHandler.getCurrentUser();
			String partyId = ""+userSession.getPartyId();									
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
	
	@RequestMapping(value = "/datacollection/cash-flow-analysis", method = RequestMethod.GET)
	public String getDCCashFlowAnalysis(Model model,  HttpServletRequest request) {
		UserSession userSession = AuthHandler.getCurrentUser();
		String partyId = ""+userSession.getPartyId();
		String dataFor = "CF";
		DcAnalysisHelper analysisDetails = getAnalysisData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), dataFor);
		model.addAttribute("partyId", partyId);
		model.addAttribute("analysisDetails", analysisDetails);
		return "partner/datacollection/cash-flow-analysis";
	}
	
	@RequestMapping(value = "/datacollection/loan-status-analysis", method = RequestMethod.GET)
	public String getDCLoanStatusAnalysis(Model model,  HttpServletRequest request) {
		try{
			UserSession userSession = AuthHandler.getCurrentUser();
			String partyId = ""+userSession.getPartyId();
									
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

	@RequestMapping(value = "/datacollection/suggestion/{screen}", method = RequestMethod.GET)
	public String getDCSuggestions(Model model, HttpServletRequest request,
			@PathVariable String screen,
			
			RedirectAttributes redirectAttributes) {	
		
		try{
			UserSession userSession = AuthHandler.getCurrentUser();
			String partyId = ""+userSession.getPartyId();
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
				model.addAttribute("parentPageUrl", "/partner/datacollection/" + screen   );
			} else{
				return "redirect:/partner/contacts";
			}	
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}		
		return "partner/datacollection/suggestion";
	}
	
	/*************** End Code for Data Collection Screens *************/
	
	
	@RequestMapping(value = "/contacts", method = RequestMethod.GET)
	public String showContacts(Model model,
			HttpServletRequest request) {		
		try{			
			UserSession userSession = AuthHandler.getCurrentUser();
			//request.getSession().removeAttribute("headerName");
			String token = "12345";
			PartySearchCriteria partySearchCriteria = new PartySearchCriteria();
			partySearchCriteria.setOwnerPartyId(userSession.getPartyId());
			
			List<PartySearchCriteria> partyList = getParty(userSession.getUserName(), userSession.getBuId(), partySearchCriteria);
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
			UserSession userSession = AuthHandler.getCurrentUser();
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

			
			List<PartySearchCriteria> partyList = getParty(userSession.getUserName(), userSession.getBuId(), searchCriteria);
			int size = partyList.size();
			
			if(partyList.size() < 30){
				model.addAttribute("subList", partyList.subList(0, partyList.size()));
			}
			else{
				model.addAttribute("subList", partyList.subList(0, 30));
			}

			request.getSession().setAttribute(PARTYLIST,partyList);
			
			return partyList;
			
		} catch (Exception exception){
			LOGGER.error("Error occured while retrieving contacts : ", exception);
			return null;
		}
	}
	
	private List<PartySearchCriteria> getParty(String username,Integer buID, PartySearchCriteria searchCriteria )
	{
		
		String token = "12345";
		List<PartySearchCriteria> partyList = new ArrayList<PartySearchCriteria> ();
		try {
			List<PartySearchCriteria> partyListAsJson = new ArrayList<PartySearchCriteria> ();
			
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(CONTACTS_FOR_SEARCH_CRITERIA+"/"+username + "/" + token
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
			UserSession userSession = AuthHandler.getCurrentUser();
			userName = userSession.getUserName();
		}
		
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
		
	
		
	
	/************* action plans ********/
	@RequestMapping(value = "/datacollection/car-goal-action-plan/{partyId}", method = RequestMethod.GET)
	public String viewCarGoal(Model m,  HttpServletRequest request) {
		UserSession userSession = AuthHandler.getCurrentUser();
		if(userSession == null) {
			 return "redirect:/login";
		}
		m.addAttribute("request", request);
		return "partner/car-goal-action-plan";
	}
	
	@RequestMapping(value = "/datacollection/emergency-readiness-action-plan/{partyId}", method = RequestMethod.GET)
	public String viewEmergencyReadiness(Model m,HttpServletRequest request) {
		UserSession userSession = AuthHandler.getCurrentUser();
		m.addAttribute("request", request);
		return "partner/emergency-readiness-action-plan";
	}
	
	@RequestMapping(value = "/datacollection/risk-cover-action-plan/{partyId}", method = RequestMethod.GET)
	public String viewRiskCover(Model m,  HttpServletRequest request) {
		UserSession userSession = AuthHandler.getCurrentUser();
		m.addAttribute("request", request);
		return "partner/risk-cover-action-plan";
	}
	
	@RequestMapping(value = "/goals")
	public String getGoals(HttpServletRequest request,Model m) {
		
		String userName="";
		int partyId=0;		
		String token = "12345";
		UserSession userSession = null;
		try{
			userSession = AuthHandler.getCurrentUser();
			userName=userSession.getUserName();
			partyId=userSession.getPartyId();
		}catch(Exception ex){
			LOGGER.error("Error occured while fetching user details in PartnerProfileController/getGoals : ", ex);
		}
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
		
		baseResponse  =  restTemplate.getForObject(GET_PARTNER_GOALS_URL+"/"+userName+"/"+partyId+"/"+token+"?buId="+buId, BaseResponse.class);
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
		//Orange
		case 92003:{
			return "theme_blue/theme_blue.css";
		}
		//Blue
		case 92004:{
			return null;
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
	
	private List<AdviceAssumption> getAssumptions(Integer buId, Integer partnerPartyId, Integer clientPartyId, String attributeCodeIds ) {
		List<AdviceAssumption> adviceAssumptionList = new ArrayList<AdviceAssumption>();
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
				adviceAssumptionList = baseResponse.getResponseListObject();
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
				UserSession userSession = AuthHandler.getCurrentUser();
				String partyId =userSession.getPartyId().toString();;
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
	
/*	@RequestMapping(value = "/submit", method = {RequestMethod.GET})
	public String submitDC(HttpServletRequest request,final RedirectAttributes redirectAttributes) {
		UserSession userSession = AuthHandler.getCurrentUser();
		
		UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7007/"+userSession.getPartyId()+"/342");
		uri.queryParam("buId", userSession.getBuId());
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);

        {Notification notification=null;
        notification=new Notification();
        notification.setSourceSystemID(userSession.getSourceSystemId());
        notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
        notification.setNotifyPartyID(userSession.getPartyId());
        notification.setNotifyEventID(FiinfraConstants.EVENT_CP_DC_SUBMIT);
        notification.setBuId(userSession.getBuId());
        notification.setSessionID(request.getSession().getId());
        FrameworkUtil.notify(notification);
        }
        
        { Notification notificationClient=new Notification();
        notificationClient.setSourceSystemID(userSession.getSourceSystemId());
        notificationClient.setNotifyTypeId(FiinfraConstants.SYSTEM);
        notificationClient.setNotifyPartyID(userSession.getPartyId());
        notificationClient.setNotifyEventID(FiinfraConstants.EVENT_CP_DC_SUBMIT_CLIENT_INTIMATION);
        notificationClient.setBuId(userSession.getBuId());
        notificationClient.setSessionID(request.getSession().getId());
        FrameworkUtil.notify(notificationClient);
        }
		redirectAttributes.addFlashAttribute("success", getMessage("success.financial.dataSave"));
		
		return "redirect:/partner/datacollection";
		
			
	}*/
	
	@RequestMapping(value = "/submit", method = {RequestMethod.GET})
	public String submitDC(HttpServletRequest request,final RedirectAttributes redirectAttributes) {
		UserSession userSession = AuthHandler.getCurrentUser();
		String token="12345";
		int buId=123;
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append(GET_NUMBER_OF_GOALS_FOR_PARTYID);
		strBuilder.append(userSession.getPartyId());
		strBuilder.append("/");
		strBuilder.append(userSession.getUserName());
		strBuilder.append("/");
		strBuilder.append(token);
		String msg = "";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(strBuilder.toString());
		uriCB.queryParam("buId", userSession.getBuId());
		BaseResponse<String> baseResponse = new BaseResponse<String>();
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				
		String noOfGoals[]={"0","0"};
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			 noOfGoals = baseResponse.getResponseObject().split("_");
		}
		Integer flag = 0;
		if((noOfGoals[1]).equals("0") || (noOfGoals[2]).equals("0") || (noOfGoals[3]).equals("0") || (noOfGoals[5]).equals("0") || (noOfGoals[6]).equals("0") || ((noOfGoals[7]).equals("1") && (noOfGoals[4]).equals("0")) ) {
			
			msg = "Please Fill Your ";
			if((noOfGoals[1]).equals("0")){
				flag = 1;
				msg = msg + "Retirement Age(Retirement Readiness) ";
			}
			if((noOfGoals[2]).equals("0")){
				if( flag == 1 ){
					msg = msg + ", Annual Income(Cashflow) ";
				}else{
					flag = 1;
					msg = msg + "Annual Income(Cashflow) ";
				}
			}
			if((noOfGoals[3]).equals("0")){
				if( flag == 1 ){
					msg = msg + ", Monthly Expenditure(Cashflow) ";
				}else{
					flag = 1;
					msg = msg + "Monthly Expenditure(Cashflow) ";
				}
			}
			if((noOfGoals[5]).equals("0")){
				if( flag == 1 ){
					msg = msg + ", Risk Profile(Risk Profile) ";
				}else{
					flag = 1;
					msg = msg + "Risk Profile(Risk Profile) ";
				}
			}
			if((noOfGoals[6]).equals("0")){
				if( flag == 1 ){
					msg = msg + ", Date Of Birth(Personal Information)";
				}else{
					flag = 1;
					msg = msg + "Date Of Birth(Personal Information)";
				}
			}
			if((noOfGoals[7]).equals("1")){
				if((noOfGoals[4]).equals("0")){
					if( flag == 1 ){
						msg = msg + ", Number Of Months(Emergency Planning)";
					}else{
						flag = 1;
						msg = msg + "Number Of Months(Emergency Planning)";
					}
				}
			}
			msg = msg + ".";
			
			redirectAttributes.addFlashAttribute("error", msg);
			return "redirect:/partner/datacollection";
		}
		else
		{
		
		UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7007/"+userSession.getPartyId()+"/342");
		uri.queryParam("buId", userSession.getBuId());
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);

        {Notification notification=null;
        notification=new Notification();
        notification.setSourceSystemID(userSession.getSourceSystemId());
        notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
        notification.setNotifyPartyID(userSession.getPartyId());
        notification.setNotifyEventID(FiinfraConstants.EVENT_CP_DC_SUBMIT);
        notification.setBuId(userSession.getBuId());
        notification.setSessionID(request.getSession().getId());
        FrameworkUtil.notify(notification);
        }
        
        { Notification notificationClient=new Notification();
        notificationClient.setSourceSystemID(userSession.getSourceSystemId());
        notificationClient.setNotifyTypeId(FiinfraConstants.SYSTEM);
        notificationClient.setNotifyPartyID(userSession.getPartyId());
        notificationClient.setNotifyEventID(FiinfraConstants.EVENT_CP_DC_SUBMIT_CLIENT_INTIMATION);
        notificationClient.setBuId(userSession.getBuId());
        notificationClient.setSessionID(request.getSession().getId());
        FrameworkUtil.notify(notificationClient);
        }
        
		redirectAttributes.addFlashAttribute("success", getMessage("success.financial.dataSave"));
		
		return "redirect:/partner/datacollection";
		}
	}


	@RequestMapping(value = "/ThankYou", method = {RequestMethod.GET})
	public String submitDCThanks(Model m, HttpServletRequest request) {
		if(m.asMap().get("submit") ==null){
			return "redirect:/profile/dashboard";	
		}
		return "dc/thankyou"; 
			
	}

	@SuppressWarnings("unchecked")
	public Integer getDataForChart(int buId, int partyId, String chartType, String userName) throws IOException {
		String url = GET_CHART_DATA_LIST + userName + "/1234";
		LOGGER.info("URL ---------------------> " + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("chartType", chartType);
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
		ChartData data = charDataValues.get(0);
		return data.getCount();
		
	}

	@RequestMapping(value = "/goal/view-bucket-allocation/{partyId}/{riskProfileId}", method = RequestMethod.GET)
	public String ViewGoalBucketAllocation(Model model, @PathVariable String partyId, 
			@PathVariable String riskProfileId, HttpServletRequest request) 
	{	
		try{
			UserSession userSession = AuthHandler.getCurrentUser();
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
	
	
	/**
	 * This method performs Audit 
	 * @param actionByPartyId of type int
	 * @param actionByUserId of type int
	 * @param eventId of type int
	 * @param sourceModule of type {@link java.lang.String}
	 * @param sourceScreen of type {@link java.lang.String}
	 */
	private void audit(int actionByPartyId, int actionByUserId, int eventId, String sourceModule, String sourceScreen){
		try{
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);				
			audit.setActionByUserID(actionByUserId);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_MOBILE_PORTAL);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
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
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_USER_ACCESS_LOG+ username+"/" + token);
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), accessLog, BaseResponse.class);
	}
	
	// Asset allocation
	@RequestMapping(value = "/assetAllocation/{jspType}", method = {RequestMethod.GET,RequestMethod.POST})
	public String assetAllocation(Model model,HttpServletRequest request,@PathVariable("jspType") String jspType)
	{
		UserSession userSession = AuthHandler.getCurrentUser();
		Integer partyId = userSession.getPartyId();
		
		String token = "4321";
	
		List<WhatIfData> whatIfDataListJsonData = new ArrayList<WhatIfData>();
		List<WhatIfData> whatIfDataList =  new ArrayList<WhatIfData>();
		BaseResponse<WhatIfData> baseResponse = new BaseResponse<WhatIfData>();
		
		model.addAttribute("jspType",jspType);
		
		String redirectUrl=request.getParameter("redirectUrl");
		model.addAttribute("redirectUrl",redirectUrl);
		
		Integer buId = userSession.getBuId();
		String user = userSession.getUserName();
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_WHATIF_ANALYSIS_DATA+"/"+partyId+"/"+user+"/"+token);
		
		uriCB.queryParam("buId", buId);
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				whatIfDataListJsonData = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i=0;i<whatIfDataListJsonData.size();i++){
					WhatIfData whatIfData = objectMapper.readValue(objectMapper.writeValueAsString(whatIfDataListJsonData.get(i)), WhatIfData.class);
					whatIfDataList.add(whatIfData);
				}
			}catch(Exception e){ e.printStackTrace(); } 	
		}
		
		 this.whatIfDataList = whatIfDataList;
		 
		 Double toatalInitialAsset = 0.0;
		 Double toatalMonthlyInvestment = 0.0;
		 try{
		 for(int i=0;i<this.whatIfDataList.size();i++)
		 {
			 WhatIfData data = this.whatIfDataList.get(i);
			 if(data.getMonthlyInvest()!=null)
			 {
			 toatalMonthlyInvestment = toatalMonthlyInvestment + Double.parseDouble(data.getMonthlyInvest());
			 }
			 toatalInitialAsset = toatalInitialAsset + (Double.parseDouble(data.getCurrentValue())*Double.parseDouble(data.getAvailableToGoals()))/100;
		 }
		 }catch(Exception e){ e.printStackTrace();}
		 
		 model.addAttribute("toatalMonthlyInvestment",toatalMonthlyInvestment);
		 model.addAttribute("toatalInitialAsset",toatalInitialAsset);
		 model.addAttribute("whatIfDataList",whatIfDataList);
		 model.addAttribute("partyId",partyId);
		 model.addAttribute("jspType","fr");

		 return "partner/assetAllocation";
	}
	
	@RequestMapping(value = "/saveAssetAllocation", method = RequestMethod.POST)
	public String saveAssetAllocation(HttpServletRequest request,Model model,final RedirectAttributes redirectAttributes)
	{
		UserSession userSession = AuthHandler.getCurrentUser();
	    Integer partyId =  userSession.getPartyId();
	    
		for(int i=0;i<this.whatIfDataList.size();i++)
		{
			WhatIfData data = whatIfDataList.get(i);
			data.setAvailableToGoals(request.getParameter(data.getId().toString()));
		}
		String redirectURL=request.getParameter("redirectURL");
		String token = "4321";
		Integer buId = userSession.getBuId();
		String user = userSession.getUserName();
		try{
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_WHAT_IF_ANALYSIS+"/"+user+"/"+token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), this.whatIfDataList, BaseResponse.class);
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			redirectAttributes.addFlashAttribute("success", "Data Saved Successfully.");				
		}else{
			redirectAttributes.addFlashAttribute("error", "Error in saving data, please try again later.");
		}
		}catch(Exception e){ e.printStackTrace();}
		
		if(null!=redirectURL && !redirectURL.isEmpty()){
			   return "redirect:"+redirectURL;
			  }else{
			   return "redirect:"+"datacollection/financial-readiness";
			  }
	
	}
	
	public String getFpSection(HttpServletRequest request,String clientPartyId)
	{
		try {
			
			String token ="432";
			UserSession userSession = AuthHandler.getCurrentUser();
			BaseResponse<KeyValue> baseResponce = new BaseResponse<KeyValue>();
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_INTERESTED_FP_SECTION+ userSession.getUserName()+"/" + token);
			uriCB.queryParam("buId", userSession.getBuId());
			uriCB.queryParam("partnerPartyId", userSession.getOwnerId());
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
			System.out.println(interestdFp.get(0).getName());
			
			return interestdFp.get(0).getName();
		}
		catch (Exception e) 
		{
			LOGGER.debug("error while parsing list "+e.getMessage());
		}
		
		
		return null;
		
	}

	private String getBackUrl(List<Integer> sectionList ,Integer currentSectionId,String partyId)
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
			backUrl = "/partner/datacollection";
			return backUrl;
		}
		else
		{
			Integer section = sectionList.get(index-1);
			if(section ==39002)//cash flow
			{
				backUrl = "/partner/datacollection/cash-flow";
				return backUrl;
			}
			else if(section ==39005)//Goal Ready
			{
				backUrl = "/partner/datacollection/financial-readiness";
				return backUrl;
			}
			else if(section ==39003)//Risk Cover
			{
				backUrl = "/partner/datacollection/risk-cover";
				return backUrl;
			}
			else if(section ==39008)//Loan Status
			{
				backUrl = "/partner/datacollection/loan-status";
				return backUrl;
			}
			else if(section ==39001)// emergency 
			{
				backUrl = "/partner/datacollection/emergency-readiness";
				return backUrl;
			}
			else if(section ==39006)//Retirement
			{
				backUrl = "/partner/datacollection/retirement-planning";
				return backUrl;
			}
			else if(section ==39007)//Succession
			{
				backUrl = "/partner/datacollection/succession-readiness";
				return backUrl;
			}
			else
			{
				backUrl = "/partner/datacollection";
				return backUrl;
			}
	
		}
	
	}
	
	private String getNextUrl(List<Integer> sectionList ,Integer currentSectionId,String partyId)
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
			nexturl = "/partner/datacollection";
			return nexturl;
		}
		else
		{
			Integer section = sectionList.get(index+1);
			if(section ==39002)//cash flow
			{
				
				nexturl = "/partner/datacollection/cash-flow";
			
				return nexturl;
			}
			else if(section ==39005)//Goal Ready
			{
				
				nexturl = "/partner/datacollection/financial-readiness";
				return nexturl;
			}
			else if(section ==39003)//Risk Cover
			{
				nexturl = "/partner/datacollection/risk-cover";
				return nexturl;
			}
			else if(section ==39008)//Loan Status
			{
				nexturl = "/partner/datacollection/loan-status";
				return nexturl;
			}
			else if(section ==39001)// emergency 
			{
				nexturl = "/partner/datacollection/emergency-readiness";
				return nexturl;
			}
			else if(section ==39006)//Retirement
			{
				nexturl = "/partner/datacollection/retirement-planning";
				return nexturl;
			}
			else if(section ==39007)//Succession
			{
				nexturl = "/partner/datacollection/succession-readiness";
				return nexturl;
			}
			else
			{
				nexturl = "/partner/datacollection";
				return nexturl;
			}
	
		}
		
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
	
	
	
}