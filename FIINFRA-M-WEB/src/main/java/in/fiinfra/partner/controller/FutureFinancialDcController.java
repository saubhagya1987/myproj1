package in.fiinfra.partner.controller;

import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.framework.models.Audit;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Produces;

import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/futureFinancialDc")
public class FutureFinancialDcController {

	private static final Logger LOGGER = Logger.getLogger(FutureFinancialDcController.class);
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Autowired
	RestTemplate restTemplate;
	private static final String DC_XML = "DCInputFields.xml";
	
	@Value("${GET_FAMILY_MEMBERS}")
	private String GET_FAMILY_MEMBERS;
	@Value("${SAVE_FUTURE_GOALS_URL}")
	private String SAVE_FUTURE_GOALS;
	@Value("${GET_GOALS_FOR_PARTYID}")
	private String GET_GOALS_FOR_PARTYID;
	@Value("${GET_FUTURE_GOALS_FOR_GOAL_ID_FOR_URL}")
	private String GET_FUTURE_GOALS_FOR_GOAL_ID;
	@Value("${SAVE_ASSET_ALLOCATION_FOR_RETIREMENT}") 
	private String SAVE_ASSET_ALLOCATION_FOR_RETIREMENT;
	@Value("${UPDATE_FPACTIVITY_TRACKER}") 
	private String UPDATE_FPACTIVITY_TRACKER;
	
	@Value("${DELETE_GOAL}") 
	private String DELETE_GOAL;
	
	@Value("${GET_ROLE_BASED_SECURITY_IDS}") 
	private String GET_ROLE_BASED_SECURITY_IDS;
	
	@Value("${GET_NUMBER_OF_GOALS_FOR_GOALTYPE_ID}") 
	private String GET_NUMBER_OF_GOALS_FOR_GOALTYPE_ID;
	
	@Value("${SAVE_GOALS_PRIORITY_URL}")
	private String SAVE_GOALS_PRIORITY_URL;
	
	@Value("${GET_ASSUMPTIONS}")
	private String GET_ASSUMPTIONS;	
	
	@Autowired
	private CommonController commonController;
	
	private static final String FFE_SOURCE = "Future Financial Expectations";
	
    private AdviceAssumption healthAssumtion;
	private Integer scale;
	
	@RequestMapping(value = "/educational-goal/{partyId}", method = RequestMethod.GET)
	public String getEducationalGoal(Model model, @PathVariable String partyId,HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.EDUCATION_GOAL,userSession.getPartyId()));
		updateFPActivityTracker(partyId,userSession.getBuId());
		String xmlData = getXmlForSectionType("35001",request);
		model.addAttribute("sectionData", xmlData);					
		model.addAttribute("partyId", partyId);
		
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,267));
		addExistingGoal(model, 35001,request,"Education Goal",partyId);
		try
		{
		List<AdviceAssumption> adviceAssumptions = getAssumptions((Integer)userSession.getBuId(), (Integer)userSession.getPartyId(),Integer.valueOf(partyId),"98047");
		String inflationrate = (String) (adviceAssumptions.get(0)).getAssumptionValue();
		model.addAttribute("inflationrate",inflationrate);
		}catch(Exception e){}
		
		return "partner/datacollection/educational-goal";
	}
	
	@RequestMapping(value = "/saveEductionGoal", method = RequestMethod.POST)	
	public String saveEductionGoal(HttpServletRequest request,Model model ,final RedirectAttributes redirectAttributes) {
		LOGGER.debug("saveEductionGoal() of FutureFinancialDcController class called");
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		Integer userId = userSession.getUserId();
		String partyId = request.getParameter("partyId");
		String redirectUrl = request.getParameter("redirectUrl");	
		String goalValueIds = request.getParameter("inputData");
		String goalIdString =request.getParameter("goalId");
		Integer goalId = null;
		if(goalIdString != null && !goalIdString.equalsIgnoreCase("null") && !goalIdString.equalsIgnoreCase(""))
		{
			goalId = Integer.parseInt(goalIdString);
		}
		GoalData goalData = FiinfraUtility.createGoalData(goalValueIds);
		String goalName = request.getParameter("hiddenGoalName");
	    if(goalName == null || goalName.equals("")) {
	    	goalData.setGoalName("Education For");
	    }
	    else {
	    	goalData.setGoalName(goalName);
	    }
	    
	    goalData.setGoalDescription("Education For");
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(FiinfraConstants.EDUCATION_GOAL);
		
		goalData.setId(goalId);
		LOGGER.debug("ValueIds is: " + goalValueIds);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		
		String xmlGoalData=FiinfraUtility.getGoalDataXML(goalData);
		String xmlAttributeXML=FiinfraUtility.getAttributeDataXML(goalData.getGoalAttributeList());
		int attributeCount = goalData.getGoalAttributeList().size();
		
		String eventTextXML="usp_DIY_saveFutureGoals("+partyId+","+xmlGoalData+","+xmlAttributeXML+","+attributeCount+")";
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_ADDED_EDUCATION_GOAL, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_EDUCATION_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("success", "success.educationGoal.dataSave");
			Integer id = baseResponse.getResponseObject();
			if(id != null)
			{
				// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
				String userName = userSession.getUserName();
				UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
				uriRetirement.queryParam("buId", userSession.getBuId());
				BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
		        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
				
				model.addAttribute("next", "/futureFinancialDc/property-goal/"+partyId);
				model.addAttribute("back", "/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/2");
				return "redirect:/futureFinancialDc/edit-educational-goal/"+id+"/"+partyId;
			}
			else if(goalId != null)
			{
				return "redirect:/futureFinancialDc/edit-educational-goal/"+goalId+"/"+partyId;
			}
				
			
		}
		else
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_ADD_EDUCATION_GOAL_FAILED, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_EDUCATION_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("error", "error.educationGoal.dataSave");
		}
		return "redirect:/futureFinancialDc/educational-goal/"+partyId;
	}	
	
	@Produces("application/json")
	@RequestMapping(value = "/getFamilyMembers", method = RequestMethod.GET)
	public @ResponseBody List<JsonData> getFamilyMembers(HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String partyId = request.getParameter("partyId");		
		String token = "153443";
		UriComponentsBuilder uriCB;		
		Integer buId = userSession.getBuId();
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append(GET_FAMILY_MEMBERS);
		strBuilder.append(userSession.getUserName());
		strBuilder.append("/");
		strBuilder.append(token);
		strBuilder.append("/");
		strBuilder.append(partyId);
		strBuilder.append("/14010?buId="); 
		strBuilder.append(buId);
		LOGGER.debug("Url formed is " + strBuilder.toString());		
		uriCB = UriComponentsBuilder.fromHttpUrl(strBuilder.toString());
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		List<JsonData> familyMembersListAsJson = new ArrayList<JsonData>();
		List<JsonData> familyMemberList = new ArrayList<JsonData>();
		JsonData self = new JsonData();
		self.setValue(Integer.parseInt(partyId));
		self.setText("Self");
		familyMemberList.add(self);

		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				familyMembersListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<familyMembersListAsJson.size(); i++){										
					JsonData jsonData = null;
					jsonData = objectMapper.readValue(objectMapper.writeValueAsString(familyMembersListAsJson.get(i)), JsonData.class);
					familyMemberList.add(jsonData);
				}
			} catch (JsonParseException e) {
				LOGGER.error("Error occured while getting family details data from App layer", e);
			} catch (JsonMappingException e) {
				LOGGER.error("Error occured while getting family details data from App layer", e);
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				LOGGER.error("Error occured while getting family details data from App layer", e);
				e.printStackTrace();
			} catch (IOException e) {
				LOGGER.error("Error occured while getting family details data from App layer", e);				
			}
		}	
				return familyMemberList;		
	}
		
	@RequestMapping(value = "/property-goal/{partyId}", method = RequestMethod.GET)
	public String getPropertyGoal(Model model, @PathVariable String partyId,HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.PROPERTY_OR_HOUSE_GOAL,userSession.getPartyId()));
		updateFPActivityTracker(partyId,userSession.getBuId());
		String xmlData = getXmlForSectionType("35003",request);
		model.addAttribute("sectionData", xmlData);			
		model.addAttribute("partyId", partyId);
		model.addAttribute("redirectUrl", "/futureFinancialDc/property-goal/" + partyId);
		model.addAttribute("backPageUrl", "/futureFinancialDc/educational-goal/" + partyId);
		model.addAttribute("nextPageUrl", "/partner/datacollection/risk-cover/" + partyId);	
		
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,268));
		addExistingGoal(model, 35003,request,"Property Goal",partyId);
		try
		{
		List<AdviceAssumption> adviceAssumptions = getAssumptions((Integer)userSession.getBuId(), (Integer)userSession.getPartyId(),Integer.valueOf(partyId),"98047");
		String inflationrate = (String) (adviceAssumptions.get(0)).getAssumptionValue();
		model.addAttribute("inflationrate",inflationrate);
		}catch(Exception e){}
		return "partner/datacollection/property-goal";
	}	
	
	@RequestMapping(value="/savePropertyGoal", method=RequestMethod.POST)
	public String savePropertyGoal(HttpServletRequest request,Model model,final RedirectAttributes redirectAttributes)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		String partyId = request.getParameter("partyId");
		List<GoalData> goalDataList = new ArrayList<GoalData>();
		String propertyGoalValueIds = request.getParameter("inputData");
		String goalIdString =request.getParameter("goalId");
		Integer goalId = null;
		Integer userId = userSession.getUserId();
		if(goalIdString != null && !goalIdString.equalsIgnoreCase("null") && !goalIdString.equalsIgnoreCase(""))
		{
			goalId = Integer.parseInt(goalIdString);
		}
		GoalData goalData = FiinfraUtility.createGoalData(propertyGoalValueIds);
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(FiinfraConstants.PROPERTY_OR_HOUSE_GOAL);//Id for goal Type
		goalData.setId(goalId);
		String goalName = request.getParameter("hiddenGoalName");
		if(goalName == null || goalName.equals("")) {
	    	goalData.setGoalName("Property");
	    }
	    else {
	    	goalData.setGoalName(goalName);
	    }
		
		goalData.setGoalDescription("Property");
		LOGGER.debug("ValueIds is: " + propertyGoalValueIds);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		
		String xmlGoalData=FiinfraUtility.getGoalDataXML(goalData);
		String xmlAttributeXML=FiinfraUtility.getAttributeDataXML(goalData.getGoalAttributeList());
		int attributeCount = goalData.getGoalAttributeList().size();
		
		String eventTextXML="usp_DIY_saveFutureGoals("+partyId+","+xmlGoalData+","+xmlAttributeXML+","+attributeCount+")";
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			redirectAttributes.addFlashAttribute("success", "success.propertyGoal.dataSave");
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_ADDED_PROPERTY_GOAL, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_PROPERTY_GOAL,eventTextXML);
			Integer id = baseResponse.getResponseObject();
			if(id != null)
			{
				// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
				String userName = userSession.getUserName();
				UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
				uriRetirement.queryParam("buId", userSession.getBuId());
				BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
		        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
				
				model.addAttribute("next", "/futureFinancialDc/wedding-goal/"+partyId);
				model.addAttribute("back", "/futureFinancialDc/educational-goal/"+partyId);
				return "redirect:/futureFinancialDc/edit-property-goal/"+id+"/"+partyId;
			}
			else if(goalId != null)
			{				
				return "redirect:/futureFinancialDc/edit-property-goal/"+goalId+"/"+partyId;
			}
			
		}
		else
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_ADD_PROPERTY_GOAL_FAILED, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_PROPERTY_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("error", "error.propertyGoal.dataSave");
		}
		return "redirect:/futureFinancialDc/property-goal/"+partyId;
	}
	
	@RequestMapping(value = "/wedding-goal/{partyId}", method = RequestMethod.GET)
	public String getWeddingGoal(Model model, @PathVariable String partyId,HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.MARRIAGE_GOAL,userSession.getPartyId()));
		updateFPActivityTracker(partyId,userSession.getBuId());
		String xmlData =getXmlForSectionType("35004",request);		
		model.addAttribute("sectionData", xmlData);					
		model.addAttribute("partyId", partyId);	
		
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,269));
		addExistingGoal(model, 35004,request,"Wedding Goal",partyId);
		try
		{
		List<AdviceAssumption> adviceAssumptions = getAssumptions((Integer)userSession.getBuId(), (Integer)userSession.getPartyId(),Integer.valueOf(partyId),"98047");
		String inflationrate = (String) (adviceAssumptions.get(0)).getAssumptionValue();
		model.addAttribute("inflationrate",inflationrate);
		}catch(Exception e){}
		return "partner/datacollection/wedding-goal";
	}	
	
	@RequestMapping(value="/saveWeddingGoal", method=RequestMethod.POST)
	public String saveWeddingGoal(HttpServletRequest request,Model model, final RedirectAttributes redirectAttributes)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		String partyId = request.getParameter("partyId");
		String weddingGoalValueIds = request.getParameter("inputData");
		String goalIdString =request.getParameter("goalId");
		Integer goalId = null;
		Integer userId = userSession.getUserId();
		if(goalIdString != null && !goalIdString.equalsIgnoreCase("null") && !goalIdString.equalsIgnoreCase(""))
		{
			goalId = Integer.parseInt(goalIdString);
		}
		GoalData goalData = FiinfraUtility.createGoalData(weddingGoalValueIds);
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(35004);
		String goalName = request.getParameter("hiddenGoalName");
		if(goalName == null || goalName.equals("")) {
	    	goalData.setGoalName("Wedding");
	    }
	    else {
	    	goalData.setGoalName(goalName);
	    }
		
		goalData.setGoalDescription("Wedding");
		goalData.setId(goalId);
		LOGGER.debug("ValueIds is: " + weddingGoalValueIds);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		
		String xmlGoalData=FiinfraUtility.getGoalDataXML(goalData);
		String xmlAttributeXML=FiinfraUtility.getAttributeDataXML(goalData.getGoalAttributeList());
		int attributeCount = goalData.getGoalAttributeList().size();
		
		String eventTextXML="usp_DIY_saveFutureGoals("+partyId+","+xmlGoalData+","+xmlAttributeXML+","+attributeCount+")";
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_ADDED_WEDDING_GOAL, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_WEDDING_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("success", "success.weddingGoal.dataSave");
			Integer id = baseResponse.getResponseObject();
			if(id != null)
			{
				// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
				String userName = userSession.getUserName();
				UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
				uriRetirement.queryParam("buId", userSession.getBuId());
				BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
		        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
				
				model.addAttribute("next", "/futureFinancialDc/car-goal/"+partyId);
				model.addAttribute("back", "/futureFinancialDc/property-goal/"+partyId);
				return "redirect:/futureFinancialDc/edit-wedding-goal/"+id+"/"+partyId;
			}
			else if(goalId != null)
			{
				return "redirect:/futureFinancialDc/edit-wedding-goal/"+goalId+"/"+partyId;
			}
		}
		else
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_ADD_WEDDING_GOAL_FAILED, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_WEDDING_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("error", "error.weddingGoal.dataSave");
		}
		return "redirect:/futureFinancialDc/wedding-goal/"+partyId;
	}	
	
	@RequestMapping(value = "/travel-vacation-goal/{partyId}", method = RequestMethod.GET)
	public String getDCTravelGoal(Model model, @PathVariable String partyId,HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.TRAVEL_AND_VACATION_GOAL,userSession.getPartyId()));
		updateFPActivityTracker(partyId,userSession.getBuId());
		String xmlData = getXmlForSectionType("35005",request);		
		model.addAttribute("sectionData", xmlData);					
		model.addAttribute("partyId", partyId);
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,271));
		addExistingGoal(model, 35005,request,"Travel and Vacation Goal",partyId);
		try
		{
		List<AdviceAssumption> adviceAssumptions = getAssumptions((Integer)userSession.getBuId(), (Integer)userSession.getPartyId(),Integer.valueOf(partyId),"98047");
		String inflationrate = (String) (adviceAssumptions.get(0)).getAssumptionValue();
		model.addAttribute("inflationrate",inflationrate);
		}catch(Exception e){}
		return "partner/datacollection/travel-vacation-goal";
		
	}
	
	@RequestMapping(value="/save-travel-vacation-goal", method=RequestMethod.POST)
	public String saveTravelGoal( HttpServletRequest request, Model model,final RedirectAttributes redirectAttributes )
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		String partyId = request.getParameter("partyId");
		String travelGoalValueIDs = request.getParameter("inputData");
		String goalIdString =request.getParameter("goalId");
		Integer goalId = null;
		Integer userId = userSession.getUserId();
		if(goalIdString != null && !goalIdString.equalsIgnoreCase("null") && !goalIdString.equalsIgnoreCase(""))
		{
			goalId = Integer.parseInt(goalIdString);
		}
		GoalData goalData = FiinfraUtility.createGoalData(travelGoalValueIDs);
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(35005);
		String goalName = request.getParameter("hiddenGoalName");
		if(goalName == null || goalName.equals("")) {
	    	goalData.setGoalName("Travel-Vacation");
	    }
	    else {
	    	goalData.setGoalName(goalName);
	    }
		
		goalData.setGoalDescription("Travel-Vacation");
		goalData.setId(goalId);
		LOGGER.debug("ValueIds is: " + travelGoalValueIDs);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		
		String xmlGoalData=FiinfraUtility.getGoalDataXML(goalData);
		String xmlAttributeXML=FiinfraUtility.getAttributeDataXML(goalData.getGoalAttributeList());
		int attributeCount = goalData.getGoalAttributeList().size();
		
		String eventTextXML="usp_DIY_saveFutureGoals("+partyId+","+xmlGoalData+","+xmlAttributeXML+","+attributeCount+")";
		
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_ADDED_TRAVEL_GOAL, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_TRAVEL_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("success", "success.travelGoal.dataSave");
			Integer id = baseResponse.getResponseObject();
			if(id != null)
			{
				// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
				String userName = userSession.getUserName();
				UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
				uriRetirement.queryParam("buId", userSession.getBuId());
				BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
		        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
				
				model.addAttribute("next", "/futureFinancialDc/business-goal/"+partyId);
				model.addAttribute("back", "/futureFinancialDc/car-goal/"+partyId);
				return "redirect:/futureFinancialDc/edit-travel-vacation-goal/"+id+"/"+partyId;
			}
			else if(goalId != null)
			{
				return "redirect:/futureFinancialDc/edit-travel-vacation-goal/"+goalId+"/"+partyId;
			}
		}
		else
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_ADD_TRAVEL_GOAL_FAILED, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_TRAVEL_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("error", "error.travelGoal.dataSave");
		}
		return "redirect:/futureFinancialDc/travel-vacation-goal/"+partyId;
	}
	
	@RequestMapping(value = "/car-goal/{partyId}", method = RequestMethod.GET)
	public String getCarGoal(Model model, @PathVariable String partyId,HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.CAR_GOAL,userSession.getPartyId()));
		updateFPActivityTracker(partyId,userSession.getBuId());
		String xmlData = getXmlForSectionType("35006",request);		
		model.addAttribute("sectionData", xmlData);					
		model.addAttribute("partyId", partyId);	
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,270));
		addExistingGoal(model, 35006,request,"Car Goal",partyId);
		try
		{
		List<AdviceAssumption> adviceAssumptions = getAssumptions((Integer)userSession.getBuId(), (Integer)userSession.getPartyId(),Integer.valueOf(partyId),"98047");
		String inflationrate = (String) (adviceAssumptions.get(0)).getAssumptionValue();
		model.addAttribute("inflationrate",inflationrate);
		}catch(Exception e){}
		return "partner/datacollection/car-goal";
	}	
	
	@RequestMapping(value="/saveCarGoal", method=RequestMethod.POST)
	public String saveCarGoal(HttpServletRequest request,Model model,RedirectAttributes redirectAttributes)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		String partyId = request.getParameter("partyId");
		String carGoalValueIds = request.getParameter("inputData");
		String goalIdString =request.getParameter("goalId");
		Integer goalId = null;
		Integer userId = userSession.getUserId();
		if(goalIdString != null && !goalIdString.equalsIgnoreCase("null") && !goalIdString.equalsIgnoreCase(""))
		{
			goalId = Integer.parseInt(goalIdString);
		}
		GoalData goalData = FiinfraUtility.createGoalData(carGoalValueIds);
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(35006);
		String goalName = request.getParameter("hiddenGoalName");
		if(goalName == null || goalName.equals("")) {
	    	goalData.setGoalName("Purchase Car");
	    }
	    else {
	    	goalData.setGoalName(goalName);
	    }
		
		goalData.setGoalDescription("Purchase Car");
		goalData.setId(goalId);
		LOGGER.debug("ValueIds is: " + carGoalValueIds);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		
		String xmlGoalData=FiinfraUtility.getGoalDataXML(goalData);
		String xmlAttributeXML=FiinfraUtility.getAttributeDataXML(goalData.getGoalAttributeList());
		int attributeCount = goalData.getGoalAttributeList().size();
		
		String eventTextXML="usp_DIY_saveFutureGoals("+partyId+","+xmlGoalData+","+xmlAttributeXML+","+attributeCount+")";
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_ADDED_CAR_GOAL, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_CAR_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("success", "success.carGoal.dataSave");
			Integer id = baseResponse.getResponseObject();
			if(id != null)
			{
				// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
				String userName = userSession.getUserName();
				UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
				uriRetirement.queryParam("buId", userSession.getBuId());
				BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
		        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
				
				model.addAttribute("next", "/futureFinancialDc/travel-vacation-goal/"+partyId);
				model.addAttribute("back", "/futureFinancialDc/wedding-goal/"+partyId);
				return "redirect:/futureFinancialDc/edit-car-goal/"+id+"/"+partyId;
			}
			else if(goalId != null)
			{				
				return "redirect:/futureFinancialDc/edit-car-goal/"+goalId+"/"+partyId;
			}
		}
		else
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_ADD_CAR_GOAL_FAILED, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_CAR_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("error", "error.carGoal.dataSave");
		}
		return "redirect:/futureFinancialDc/car-goal/"+partyId;
	}	

	@RequestMapping(value = "/special-goal/{partyId}", method = RequestMethod.GET)
	public String getDCSpecialGoal(Model model, @PathVariable String partyId,HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.SPECIAL_GOAL,userSession.getPartyId()));
		updateFPActivityTracker(partyId,userSession.getBuId());
		model.addAttribute("partyId", partyId);
		model.addAttribute("partyId", partyId);
		String xmlData =getXmlForSectionType("35008",request);
		model.addAttribute("sectionData", xmlData);	
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,273));
		addExistingGoal(model, 35008,request,"Parental Goal",partyId);
		try
		{
		List<AdviceAssumption> adviceAssumptions = getAssumptions((Integer)userSession.getBuId(), (Integer)userSession.getPartyId(),Integer.valueOf(partyId),"98047");
		String inflationrate = (String) (adviceAssumptions.get(0)).getAssumptionValue();
		model.addAttribute("inflationrate",inflationrate);
		}catch(Exception e){}
		return "partner/datacollection/special-goal";
	}
	
	
	@RequestMapping(value="/saveSpecialGoal", method=RequestMethod.POST)
	public String saveSpecialGoal(HttpServletRequest request,Model model,RedirectAttributes redirectAttributes)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		String partyId = request.getParameter("partyId");
		String specialGoalValueIds = request.getParameter("inputData");
		String goalIdString =request.getParameter("goalId");
		Integer goalId = null;
		Integer userId = userSession.getUserId();
		if(goalIdString != null && !goalIdString.equalsIgnoreCase("null") && !goalIdString.equalsIgnoreCase(""))
		{
			goalId = Integer.parseInt(goalIdString);
		}
		GoalData goalData = FiinfraUtility.createGoalData(specialGoalValueIds);
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(35008);
		String goalName = request.getParameter("hiddenGoalName");
		if(goalName == null || goalName.equals("")) {
	    	goalData.setGoalName("Special Goal");
	    }
	    else {
	    	goalData.setGoalName(goalName);
	    }
		
		goalData.setGoalDescription("Special Goal");
		goalData.setId(goalId);
		LOGGER.debug("ValueIds is: " + specialGoalValueIds);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  =userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		
		String xmlGoalData=FiinfraUtility.getGoalDataXML(goalData);
		String xmlAttributeXML=FiinfraUtility.getAttributeDataXML(goalData.getGoalAttributeList());
		int attributeCount = goalData.getGoalAttributeList().size();
		
		String eventTextXML="usp_DIY_saveFutureGoals("+partyId+","+xmlGoalData+","+xmlAttributeXML+","+attributeCount+")";
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			redirectAttributes.addFlashAttribute("success", "success.specialGoal.dataSave");
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_ADDED_SPECIAL_GOAL, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_SPECIAL_GOAL,eventTextXML);
			Integer id = baseResponse.getResponseObject();
			if(id != null)
			{
				// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
				String userName = userSession.getUserName();
				UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
				uriRetirement.queryParam("buId", userSession.getBuId());
				BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
		        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
				
				model.addAttribute("next", "/futureFinancialDc/other-goal/"+partyId);
				model.addAttribute("back", "/futureFinancialDc/business-goal/"+partyId);
				return "redirect:/futureFinancialDc/edit-special-goal/"+id+"/"+partyId;
			}
			else if(goalId != null)
			{
				return "redirect:/futureFinancialDc/edit-special-goal/"+goalId+"/"+partyId;
			}
		}
		else
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_ADD_SPECIAL_GOAL_FAILED, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_SPECIAL_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("error", "error.specialGoal.dataSave");
		}
		return "redirect:/futureFinancialDc/edit-special-goal/"+partyId;
	}
	
	
	@RequestMapping(value = "/target-corpus-goal/{partyId}", method = RequestMethod.GET)
	public String getDCTargetCorpusGoal(Model model, @PathVariable String partyId,HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.TARGET_CORPUS_GOAL,userSession.getPartyId()));
		updateFPActivityTracker(partyId,userSession.getBuId());
		model.addAttribute("partyId", partyId);
		String xmlData =getXmlForSectionType("35016",request);
		model.addAttribute("sectionData", xmlData);	
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,273));
		addExistingGoal(model, 35016,request,"TargetCorpus Goal",partyId);
		try
		{
		List<AdviceAssumption> adviceAssumptions = getAssumptions((Integer)userSession.getBuId(), (Integer)userSession.getPartyId(),Integer.valueOf(partyId),"98047");
		String inflationrate = (String) (adviceAssumptions.get(0)).getAssumptionValue();
		model.addAttribute("inflationrate",inflationrate);
		}catch(Exception e){}
		return "partner/datacollection/target-corpus-goal";
	}

	@RequestMapping(value = "/business-goal/{partyId}", method = RequestMethod.GET)
	public String getDCBusinessGoal(Model model, @PathVariable String partyId,HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.BUISNESS_GOAL,userSession.getPartyId()));
		updateFPActivityTracker(partyId,userSession.getBuId());
		model.addAttribute("partyId", partyId);
		String xmlData = getXmlForSectionType("35012",request);
		model.addAttribute("sectionData", xmlData);					
		model.addAttribute("partyId", partyId);
		model.addAttribute("redirectUrl", "/futureFinancialDc/business-goal/" + partyId);
		model.addAttribute("backPageUrl", "/futureFinancialDc/travel-vacation-goal/" + partyId);
		model.addAttribute("nextPageUrl", "/futureFinancialDc/risk-cover/" + partyId);	//link to car
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,272));
		addExistingGoal(model, 35012,request,"Business Goal",partyId);
		try
		{
		List<AdviceAssumption> adviceAssumptions = getAssumptions((Integer)userSession.getBuId(), (Integer)userSession.getPartyId(),Integer.valueOf(partyId),"98047");
		String inflationrate = (String) (adviceAssumptions.get(0)).getAssumptionValue();
		model.addAttribute("inflationrate",inflationrate);
		}catch(Exception e){}
		return "partner/datacollection/business-goal";//redirect to car
	}
	
	@RequestMapping(value="/saveTargetCorpusGoal", method=RequestMethod.POST)
	public String saveTargetCorpusGoal(HttpServletRequest request,Model model,RedirectAttributes redirectAttributes)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		String partyId = request.getParameter("partyId");
		String targetCorpusGoalValueIds = request.getParameter("inputData");
		String goalIdString =request.getParameter("goalId");
		Integer isAllocateAsset =Integer.parseInt(request.getParameter("isAllocateAsset").toString());
		
		Integer goalId = null;
		Integer userId = userSession.getUserId();
		if(goalIdString != null && !goalIdString.equalsIgnoreCase("null") && !goalIdString.equalsIgnoreCase(""))
		{
			goalId = Integer.parseInt(goalIdString);
		}
		GoalData goalData = FiinfraUtility.createGoalData(targetCorpusGoalValueIds);
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(35016);
		goalData.setIsAllocateAsset(isAllocateAsset);
		String goalName = request.getParameter("hiddenGoalName");
		if(goalName == null || goalName.equals("")) {
	    	goalData.setGoalName("Target Corpus Goal");
	    }
	    else {
	    	goalData.setGoalName(goalName);
	    }
		
		goalData.setGoalDescription("Target Corpus Goal");
		goalData.setId(goalId);
		LOGGER.debug("ValueIds is: " + targetCorpusGoalValueIds);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  =userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		
		String xmlGoalData=FiinfraUtility.getGoalDataXML(goalData);
		String xmlAttributeXML=FiinfraUtility.getAttributeDataXML(goalData.getGoalAttributeList());
		int attributeCount = goalData.getGoalAttributeList().size();
		
		String eventTextXML="usp_DIY_saveFutureGoals("+partyId+","+xmlGoalData+","+xmlAttributeXML+","+attributeCount+")";
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			redirectAttributes.addFlashAttribute("success", "success.targetCorpusGoal.dataSave");
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_ADDED_TARGET_CORPUS_GOAL, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_SPECIAL_GOAL,eventTextXML);
			Integer id = baseResponse.getResponseObject();
			if(id != null)
			{
				// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
				String userName = userSession.getUserName();
				UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
				uriRetirement.queryParam("buId", userSession.getBuId());
				BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
		        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
				
				model.addAttribute("next", "/futureFinancialDc/other-goal/"+partyId);
				model.addAttribute("back", "/futureFinancialDc/business-goal/"+partyId);
				return "redirect:/futureFinancialDc/edit-target-corpus-goal/"+id+"/"+partyId;
			}
			else if(goalId != null)
			{
				return "redirect:/futureFinancialDc/edit-target-corpus-goal/"+goalId+"/"+partyId;
			}
		}
		else
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_ADD_TARGET_CORPUS_GOAL_FAILED, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_SPECIAL_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("error", "error.targetCorpusGoal.dataSave");
		}
		return "redirect:/futureFinancialDc/edit-target-corpus-goal/"+partyId;
	} 
	
	@RequestMapping(value="/save-business-goal", method=RequestMethod.POST)
	public String saveBuisnessGoal(HttpServletRequest request, Model model,final RedirectAttributes redirectAttributes)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		String partyId = request.getParameter("partyId");
		String businessGoalValueIDs = request.getParameter("inputData");
		String goalIdString =request.getParameter("goalId");
		Integer goalId = null;
		Integer userId = userSession.getUserId();
		if(goalIdString != null && !(goalIdString.equalsIgnoreCase("null")) && !goalIdString.equalsIgnoreCase(""))
		{
			goalId = Integer.parseInt(goalIdString);
		}
		GoalData goalData = FiinfraUtility.createGoalData(businessGoalValueIDs);
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(35012);
		String goalName = request.getParameter("hiddenGoalName");
		if(goalName == null || goalName.equals("")) {
	    	goalData.setGoalName("Business");
	    }
	    else {
	    	goalData.setGoalName(goalName);
	    }
		
		goalData.setGoalDescription("Business");
		goalData.setId(goalId);
		
		LOGGER.debug("ValueIds is: " + businessGoalValueIDs);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		
		String xmlGoalData=FiinfraUtility.getGoalDataXML(goalData);
		String xmlAttributeXML=FiinfraUtility.getAttributeDataXML(goalData.getGoalAttributeList());
		int attributeCount = goalData.getGoalAttributeList().size();
		
		String eventTextXML="usp_DIY_saveFutureGoals("+partyId+","+xmlGoalData+","+xmlAttributeXML+","+attributeCount+")";
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_ADDED_BUSINESS_GOAL, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_BUSINESS_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("success", "success.businessGoal.dataSave");
			Integer id = baseResponse.getResponseObject();
			if(id != null)
			{
				// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
				String userName = userSession.getUserName();
				UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
				uriRetirement.queryParam("buId", userSession.getBuId());
				BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
		        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
				
				model.addAttribute("next", "/futureFinancialDc/special-goal/"+partyId);
				model.addAttribute("back", "/futureFinancialDc/travel-vacation-goal"+partyId);
				return "redirect:/futureFinancialDc/edit-business-goal/"+id+"/"+partyId;
			}
			else if(goalId != null)
			{
				return "redirect:/futureFinancialDc/edit-business-goal/"+goalId+"/"+partyId;
			}
		}
		else
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_ADD_BUSINESS_GOAL_FAILED, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_BUSINESS_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("error", "error.businessGoal.dataSave");
		}
		return "redirect:/futureFinancialDc/business-goal/"+partyId;
	}
	
	@RequestMapping(value = "/other-goal/{partyId}", method = RequestMethod.GET)
	public String getDCOtherGoal(Model model, @PathVariable String partyId,HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.OTHER_GOAL,userSession.getPartyId()));
		updateFPActivityTracker(partyId,userSession.getBuId());
		model.addAttribute("partyId", partyId);
		String xmlData = getXmlForSectionType("35013",request);
		model.addAttribute("sectionData", xmlData);					
		model.addAttribute("partyId", partyId);
		model.addAttribute("redirectUrl", "/futureFinancialDc/other-goal/" + partyId);
		model.addAttribute("backPageUrl", "/futureFinancialDc/travel-vacation-goal/" + partyId);
		model.addAttribute("nextPageUrl", "/futureFinancialDc/risk-cover/" + partyId);	//link to car
		
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,274));
		addExistingGoal(model, 35013,request,"Other Goal",partyId);
		try
		{
		List<AdviceAssumption> adviceAssumptions = getAssumptions((Integer)userSession.getBuId(), (Integer)userSession.getPartyId(),Integer.valueOf(partyId),"98047");
		String inflationrate = (String) (adviceAssumptions.get(0)).getAssumptionValue();
		model.addAttribute("inflationrate",inflationrate);
		}catch(Exception e){}
		return "partner/datacollection/other-goal";
	}
	
	@RequestMapping(value="/saveOtherGoal", method=RequestMethod.POST)
	public String saveOtherGoal(HttpServletRequest request,Model model,final RedirectAttributes redirectAttributes)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		String partyId = request.getParameter("partyId");
		String otherGoalValueIDs = request.getParameter("inputData");
		String headerName = (String) request.getSession().getAttribute("headerName");
		String goalIdString =request.getParameter("goalId");
		
		Integer goalId = null;
		Integer userId = userSession.getUserId();
		if(goalIdString != null && !goalIdString.equalsIgnoreCase("null") && !goalIdString.equalsIgnoreCase(""))
		{
			goalId = Integer.parseInt(goalIdString);
		}
		GoalData goalData = FiinfraUtility.createGoalData(otherGoalValueIDs);
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(35013);
		String goalName = request.getParameter("hiddenGoalName");
		if(goalName == null || goalName.equals("")) {
	    	goalData.setGoalName("Other Goal");
	    }
	    else {
	    	goalData.setGoalName(goalName);
	    }
		
		goalData.setGoalDescription("Other Goal");
		goalData.setId(goalId);
		
		LOGGER.debug("ValueIds is: " + otherGoalValueIDs);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		
		String xmlGoalData=FiinfraUtility.getGoalDataXML(goalData);
		String xmlAttributeXML=FiinfraUtility.getAttributeDataXML(goalData.getGoalAttributeList());
		int attributeCount = goalData.getGoalAttributeList().size();
		
		String eventTextXML="usp_DIY_saveFutureGoals("+partyId+","+xmlGoalData+","+xmlAttributeXML+","+attributeCount+")";
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SUCCESSFULLY_ADDED_OTHER_GOAL, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_OTHER_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("success", "success.otherGoal.dataSave");
			Integer id = baseResponse.getResponseObject();
			if(id != null)
			{
				// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
				String userName = userSession.getUserName();
				UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
				uriRetirement.queryParam("buId", userSession.getBuId());
				BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
		        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
				
				model.addAttribute("next", "/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/2");
				model.addAttribute("back", "/futureFinancialDc/special-goal/"+partyId);
				return "redirect:/futureFinancialDc/edit-other-goal/"+id+"/"+partyId;
			}
			else if(goalId != null)
			{
				return "redirect:/futureFinancialDc/edit-other-goal/"+goalId+"/"+partyId;
			}
		}
		else
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_ADD_OTHER_GOAL_FAILED, FFE_SOURCE, FiinfraConstants.DIY_SM_ADD_OTHER_GOAL,eventTextXML);
			redirectAttributes.addFlashAttribute("error", "error.otherGoal.dataSave");
		}
		return "redirect:/futureFinancialDc/other-goal/"+partyId;
	}
	
	//get list of goals for user
	@RequestMapping(value="/getMyGoals/{partyid}")
	public ModelAndView getMyGoals(@PathVariable("partyid") Integer partyid,HttpServletRequest request, RedirectAttributes redirectAttributes, Model model)
	{
		
		ModelAndView modelAndView = new ModelAndView();
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 modelAndView.setViewName("redirect:/login");
			 return modelAndView;
		}
		try {
			List<GoalData> myGoalListJson = new ArrayList<GoalData>();
			List<GoalData> goalList = new ArrayList<>();
			String token = "234";
			Integer buId = userSession.getBuId();
			UriComponentsBuilder componentsBuilder = UriComponentsBuilder.fromHttpUrl(GET_GOALS_FOR_PARTYID+partyid+"/"+userSession.getUserName()+"/"+token);
			componentsBuilder.queryParam("buId", buId);
			BaseResponse<GoalData> baseResponse = new BaseResponse<>();
			baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(componentsBuilder), BaseResponse.class);
			if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				myGoalListJson = baseResponse.getResponseListObject();
			}
			GoalData goalData = new GoalData();
			for(int i=0;i<myGoalListJson.size();++i)
			{
				goalData = objectMapper.readValue(objectMapper.writeValueAsString(myGoalListJson.get(i)), GoalData.class);
				goalList.add(goalData);
			}
			if(goalList.size() > 0) {
				Map<String, List<GoalData>> goals = buildGoalByType(goalList);
				modelAndView.addObject("goalList", goals);
				modelAndView.setViewName("my-goals");
				modelAndView.addObject("partyId", partyid);
				
				modelAndView.addObject("goalListNew", goalList);
			}
			else {
				redirectAttributes.addFlashAttribute("error", "No Goals Found");				
				modelAndView.setViewName("redirect:/partner/datacollection/"+partyid+"/"+request.getSession().getAttribute("headerName")+"/2");				
			}
			
		}
		catch (Exception exception) 
		{
			LOGGER.debug("error while parsing the list of goal data"+exception.getMessage());
			modelAndView.setViewName("redirect:/login");
		}
		return modelAndView;
	}
	//building hashmap of goals 
	private Map<String, List<GoalData>> buildGoalByType(List<GoalData> goalList) {
		Map<Integer, List<GoalData>> tempGoals = new HashMap<Integer, List<GoalData>>();
		Map<String, List<GoalData>> finalGoals = new HashMap<String, List<GoalData>>();
		for(GoalData goal : goalList){
			if(tempGoals.containsKey(goal.getGoalTypeId())){
				List<GoalData> goals = tempGoals.get(goal.getGoalTypeId());
				goals.add(goal);
			} 
			else{
				List<GoalData> goals = new ArrayList<GoalData>();
				goals.add(goal);
				tempGoals.put(goal.getGoalTypeId(), goals);
			}
		}
		for (Integer key : tempGoals.keySet()) {
			List<GoalData> goals = tempGoals.get(key);
			String strKey ="";
			if(key == 35001 ){
				strKey=FiinfraConstants.EDUCATION;
			}
			else if(key == 35003){
				strKey=FiinfraConstants.PROPERTY_OR_HOUSE;
			}
			else if(key == 35004){
				strKey=FiinfraConstants.MARRIAGE;
			}
			else if(key == 35005){
				strKey=FiinfraConstants.TRAVEL_AND_VACATION;
			}
			else if(key == 35006){
				strKey=FiinfraConstants.CAR;
			}
			else if(key == 35008){
				strKey=FiinfraConstants.SPECIAL;
			}
			else if(key == 35012){
				strKey=FiinfraConstants.BUISNESS;
			}
			else if(key == 35013){
				strKey=FiinfraConstants.OTHER;
			}
			finalGoals.put(strKey, goals);
		}
		return finalGoals;
		
	}
	
	//edit futures goals
	@RequestMapping(value = "/edit-educational-goal/{goalId}/{partyId}", method = RequestMethod.GET)
	public String editEducationalGoal(@PathVariable("goalId") String goalId,@PathVariable("partyId") String partyId,Model model,HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.EDUCATION_GOAL,userSession.getPartyId()));
		String xmlData = getXmlForSectionType("35001",request);
		String token = "12354";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		GoalData goalDataJson = new GoalData();
		GoalData goalData = new GoalData();
		Map<String, String> goalMap = new HashMap<String,String>();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_FUTURE_GOALS_FOR_GOAL_ID+ "/" + goalId + "/" + username + "/" + token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){			
			try {
				goalDataJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), GoalData.class);
				goalData = objectMapper.readValue(objectMapper.writeValueAsString(goalDataJson), GoalData.class);
				} 
			catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		goalMap = FiinfraUtility.createGoalMap( goalData );
		model.addAttribute("goalMap", goalMap);
		model.addAttribute("partyId", partyId);
		model.addAttribute("goalId", goalId);
		model.addAttribute("sectionData", xmlData);
		model.addAttribute("next", "/futureFinancialDc/property-goal/"+partyId);
		model.addAttribute("back", "/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/2");
		model.addAttribute("cancel", request.getContextPath()+"/futureFinancialDc/getMyGoals/"+partyId);
		model.addAttribute("goalName", goalData.getGoalName());
		model.addAttribute("goalTypeString", "Education Goal");
		model.addAttribute("goalTypeId",35001);
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,username,buId,275));
		
		return "edit/educational-goal";
	}
	
	@RequestMapping(value = "/edit-property-goal/{goalId}/{partyId}", method = RequestMethod.GET)
	public String editPropertyGoal(@PathVariable("goalId") String goalId,@PathVariable("partyId") String partyId,Model model,HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.PROPERTY_OR_HOUSE_GOAL,userSession.getPartyId()));
		String xmlData =getXmlForSectionType("35003",request);
		String token = "12354";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		GoalData goalDataJson = new GoalData();
		GoalData goalData = new GoalData();
		Map<String, String> goalMap = new HashMap<String,String>();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_FUTURE_GOALS_FOR_GOAL_ID+ "/" + goalId + "/" + username + "/" + token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){			
		try {
			goalDataJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), GoalData.class);
			goalData = objectMapper.readValue(objectMapper.writeValueAsString(goalDataJson), GoalData.class);
			}
		catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		goalMap = FiinfraUtility.createGoalMap( goalData );
		model.addAttribute("partyId", partyId);
		model.addAttribute("goalMap", goalMap);
		model.addAttribute("sectionData", xmlData);
		model.addAttribute("goalId", goalId);
		model.addAttribute("next", "/futureFinancialDc/wedding-goal/"+partyId);
		model.addAttribute("back", "/futureFinancialDc/educational-goal/"+partyId);
		model.addAttribute("cancel", request.getContextPath()+"/futureFinancialDc/getMyGoals/"+partyId);
		model.addAttribute("goalName", goalData.getGoalName());
		model.addAttribute("goalTypeId",35003);
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,username,buId,276));
		model.addAttribute("goalTypeString", "Property Goal");
		return "edit/property-goal";
	}
	
	@RequestMapping(value = "/edit-wedding-goal/{goalId}/{partyId}", method = RequestMethod.GET)
	public String editweddingGoal(@PathVariable("goalId") String goalId,@PathVariable("partyId") String partyId,Model model,HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.MARRIAGE_GOAL,userSession.getPartyId()));
		String xmlData = getXmlForSectionType("35004",request);
		String token = "12354";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		GoalData goalDataJson = new GoalData();
		GoalData goalData = new GoalData();
		Map<String, String> goalMap = new HashMap<String,String>();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_FUTURE_GOALS_FOR_GOAL_ID+ "/" + goalId + "/" + username + "/" + token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){			
			try {
				goalDataJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), GoalData.class);
				goalData = objectMapper.readValue(objectMapper.writeValueAsString(goalDataJson), GoalData.class);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		goalMap = FiinfraUtility.createGoalMap( goalData );
		model.addAttribute("goalMap", goalMap);
		model.addAttribute("goalId", goalId);
		model.addAttribute("sectionData", xmlData);		
		model.addAttribute("next", "/futureFinancialDc/car-goal/"+partyId);
		model.addAttribute("back", "/futureFinancialDc/property-goal/"+partyId);
		model.addAttribute("cancel", request.getContextPath()+"/futureFinancialDc/getMyGoals/"+partyId);
		model.addAttribute("goalName", goalData.getGoalName());
		model.addAttribute("goalTypeId",35004);
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,username,buId,277));
		model.addAttribute("goalTypeString", "Wedding Goal");
		return "edit/wedding-goal";
	}
	
	@RequestMapping(value = "/edit-travel-vacation-goal/{goalId}/{partyId}", method = RequestMethod.GET)
	public String editTravelVacationGoal(@PathVariable("goalId") String goalId,@PathVariable("partyId") String partyId,Model model,HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.TRAVEL_AND_VACATION_GOAL,userSession.getPartyId()));
		String xmlData = getXmlForSectionType("35005",request);
		String token = "12354";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		GoalData goalDataJson = new GoalData();
		GoalData goalData = new GoalData();
		Map<String, String> goalMap = new HashMap<String,String>();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_FUTURE_GOALS_FOR_GOAL_ID+ "/" + goalId + "/" + username + "/" + token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){			
			try {
				goalDataJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), GoalData.class);
				goalData = objectMapper.readValue(objectMapper.writeValueAsString(goalDataJson), GoalData.class);
			}
			catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		goalMap = FiinfraUtility.createGoalMap( goalData );
		model.addAttribute("partyId", partyId);
		model.addAttribute("goalMap", goalMap);
		model.addAttribute("goalId", goalId);
		model.addAttribute("sectionData", xmlData);			
		model.addAttribute("next", "/futureFinancialDc/business-goal/"+partyId);
		model.addAttribute("back", "/futureFinancialDc/car-goal/"+partyId);
		model.addAttribute("cancel", request.getContextPath()+"/futureFinancialDc/getMyGoals/"+partyId);
		model.addAttribute("goalName", goalData.getGoalName());
		model.addAttribute("goalTypeId",35005);
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,username,buId,279));
		model.addAttribute("goalTypeString", "Travel and Vacation Goal");
		return "edit/travel-vacation-goal";
	}
	
	@RequestMapping(value = "/edit-car-goal/{goalId}/{partyId}", method = RequestMethod.GET)
	public String editCarGoal(@PathVariable("goalId") String goalId,@PathVariable("partyId") String partyId,Model model,HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.CAR_GOAL,userSession.getPartyId()));
		String xmlData = getXmlForSectionType("35006",request);
		String token = "12354";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		GoalData goalDataJson = new GoalData();
		GoalData goalData = new GoalData();
		Map<String, String> goalMap = new HashMap<String,String>();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_FUTURE_GOALS_FOR_GOAL_ID+ "/" + goalId + "/" + username + "/" + token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){			
			try {
				goalDataJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), GoalData.class);
				goalData = objectMapper.readValue(objectMapper.writeValueAsString(goalDataJson), GoalData.class);
			} catch (Exception exception) {
				LOGGER.debug("exception while mapping the object"+exception.getMessage());
			}
		}
		goalMap = FiinfraUtility.createGoalMap( goalData );
		model.addAttribute("partyId", partyId);
		model.addAttribute("goalMap", goalMap);
		model.addAttribute("goalId", goalId);
		model.addAttribute("sectionData", xmlData);
		model.addAttribute("next", "/futureFinancialDc/travel-vacation-goal/"+partyId);
		model.addAttribute("back", "/futureFinancialDc/wedding-goal/"+partyId);
		model.addAttribute("cancel", request.getContextPath()+"/futureFinancialDc/getMyGoals/"+partyId);
		model.addAttribute("goalName", goalData.getGoalName());
		model.addAttribute("goalTypeId",35006);
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,username,buId,278));
		model.addAttribute("goalTypeString", "Car Goal");
		return "edit/car-goal";
	}
	
	@RequestMapping(value = "/edit-special-goal/{goalId}/{partyId}", method = RequestMethod.GET)
	public String editSpecialGoal(@PathVariable("goalId") String goalId,@PathVariable("partyId") String partyId,Model model,HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.SPECIAL_GOAL,userSession.getPartyId()));
		String xmlData = getXmlForSectionType("35008",request);
		String token = "12354";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		GoalData goalDataJson = new GoalData();
		GoalData goalData = new GoalData();
		Map<String, String> goalMap = new HashMap<String,String>();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_FUTURE_GOALS_FOR_GOAL_ID+ "/" + goalId + "/" + username + "/" + token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){			
			try {
				goalDataJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), GoalData.class);
				goalData = objectMapper.readValue(objectMapper.writeValueAsString(goalDataJson), GoalData.class);
			} 
			catch (Exception exception) {
				LOGGER.debug("exception while mapping the object"+exception.getMessage());
			}
		}
		goalMap = FiinfraUtility.createGoalMap( goalData );
		model.addAttribute("partyId", partyId);
		model.addAttribute("goalMap", goalMap);
		model.addAttribute("goalId", goalId);
		model.addAttribute("sectionData", xmlData);
		model.addAttribute("next", "/futureFinancialDc/target-corpus-goal/"+partyId);
		model.addAttribute("back", "/futureFinancialDc/business-goal/"+partyId);
		model.addAttribute("cancel", request.getContextPath()+"/futureFinancialDc/getMyGoals/"+partyId);
		model.addAttribute("goalName", goalData.getGoalName());
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,username,buId,281));
		model.addAttribute("goalTypeString", "Parental Goal");
		return "edit/special-goal";
	}
	
	@RequestMapping(value = "/edit-target-corpus-goal/{goalId}/{partyId}", method = RequestMethod.GET)
	public String editTargetCorpusGoal(@PathVariable("goalId") String goalId,@PathVariable("partyId") String partyId,Model model,HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.TARGET_CORPUS_GOAL,userSession.getPartyId()));
		String xmlData = getXmlForSectionType("35016",request);
		String token = "12354";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		GoalData goalDataJson = new GoalData();
		GoalData goalData = new GoalData();
		Map<String, String> goalMap = new HashMap<String,String>();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_FUTURE_GOALS_FOR_GOAL_ID+ "/" + goalId + "/" + username + "/" + token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){			
			try {
				goalDataJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), GoalData.class);
				goalData = objectMapper.readValue(objectMapper.writeValueAsString(goalDataJson), GoalData.class);
			} 
			catch (Exception exception) {
				LOGGER.debug("exception while mapping the object"+exception.getMessage());
			}
		}
		goalMap = FiinfraUtility.createGoalMap( goalData );
		model.addAttribute("partyId", partyId);
		model.addAttribute("goalMap", goalMap);
		model.addAttribute("goalId", goalId);
		model.addAttribute("sectionData", xmlData);
		model.addAttribute("next", "/futureFinancialDc/other-goal/"+partyId);
		model.addAttribute("back", "/futureFinancialDc/special-goal/"+partyId);
		model.addAttribute("cancel", request.getContextPath()+"/futureFinancialDc/getMyGoals/"+partyId);
		model.addAttribute("goalName", goalData.getGoalName());
		model.addAttribute("isAllocateAsset",goalData.getIsAllocateAsset());
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,username,buId,281));
		model.addAttribute("goalTypeString", "TargetCorpus Goal");
		return "edit/target-corpus-goal";
	}
	
	
	@RequestMapping(value = "/edit-business-goal/{goalId}/{partyId}", method = RequestMethod.GET)
	public String editBusinessGoal(@PathVariable("goalId") String goalId,@PathVariable("partyId") String partyId,Model model,HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.BUISNESS_GOAL,userSession.getPartyId()));
		String xmlData = getXmlForSectionType("35012",request);
		String token = "12354";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		GoalData goalDataJson = new GoalData();
		GoalData goalData = new GoalData();
		Map<String, String> goalMap = new HashMap<String,String>();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_FUTURE_GOALS_FOR_GOAL_ID+ "/" + goalId + "/" + username + "/" + token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){			
			try {
				goalDataJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), GoalData.class);
				goalData = objectMapper.readValue(objectMapper.writeValueAsString(goalDataJson), GoalData.class);
			} catch (Exception exception) 
			{
				LOGGER.debug("exception while mapping the object"+exception.getMessage());
			}
		}
		goalMap = FiinfraUtility.createGoalMap( goalData );
		model.addAttribute("partyId", partyId);
		model.addAttribute("goalMap", goalMap);
		model.addAttribute("goalId", goalId);
		model.addAttribute("sectionData", xmlData);			
		model.addAttribute("next", "/futureFinancialDc/special-goal/"+partyId);
		model.addAttribute("back", "/futureFinancialDc/travel-vacation-goal"+partyId);
		model.addAttribute("cancel", request.getContextPath()+"/futureFinancialDc/getMyGoals/"+partyId);
		
		model.addAttribute("goalName", goalData.getGoalName());
		model.addAttribute("goalTypeId",35012);
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,username,buId,280));
		model.addAttribute("goalTypeString", "Business Goal");
		return "edit/business-goal";
	}
	
	@RequestMapping(value = "/edit-other-goal/{goalId}/{partyId}", method = RequestMethod.GET)
	public String editOtherGoal(@PathVariable("goalId") String goalId,@PathVariable("partyId") String partyId,Model model,HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.OTHER_GOAL,userSession.getPartyId()));
		String xmlData = getXmlForSectionType("35013",request);
		String token = "12354";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		GoalData goalDataJson = new GoalData();
		GoalData goalData = new GoalData();
		Map<String, String> goalMap = new HashMap<String,String>();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_FUTURE_GOALS_FOR_GOAL_ID+ "/" + goalId + "/" + username + "/" + token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){			
			try {
				goalDataJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), GoalData.class);
				goalData = objectMapper.readValue(objectMapper.writeValueAsString(goalDataJson), GoalData.class);
				
			} catch (Exception exception) {
				LOGGER.debug("exception while mapping the object"+exception.getMessage());
			}
		}

		goalMap = FiinfraUtility.createGoalMap( goalData );
		model.addAttribute("partyId", partyId);
		model.addAttribute("goalMap", goalMap);
		model.addAttribute("goalId", goalId);
		model.addAttribute("sectionData", xmlData);	
		model.addAttribute("next", "/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/2");
		model.addAttribute("back", "/futureFinancialDc/special-goal/"+partyId);
		model.addAttribute("cancel", request.getContextPath()+"/futureFinancialDc/getMyGoals/"+partyId);
		model.addAttribute("goalName", goalData.getGoalName());
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,username,buId,282));
		model.addAttribute("goalTypeString", "Other Goal");
		return "edit/other-goal";
	}

	 
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


	@RequestMapping(value="/getGoalYear", method = RequestMethod.GET)
	public @ResponseBody List<JsonData> getGoalYear()
	{
		DateTime dateTime = new DateTime(System.currentTimeMillis());
		Integer year =  dateTime.getYear();
		List<JsonData> yearList = new ArrayList<JsonData>();
		for(int i=0;i<100;++i)
		{
			JsonData data = new JsonData();
			//year = year;
			data.setValue(year);
			data.setText(String.valueOf(year));
			yearList.add(data);
			year = year+1;
		}
		return yearList;
	}
	
	@RequestMapping(value="/getGoalMonth", method = RequestMethod.GET)
	public @ResponseBody List<JsonData> getGoalMonth()
	{
		List<JsonData> monthList = new ArrayList<JsonData>();
		String[] month = {"January",      
				   "February",
				   "March",        
				   "April",        
				   "May",          
				   "June",         
				   "July",         
				   "August",       
				   "September",    
				   "October",      
				   "November",     
				   "December"};
		for(int i=1;i<=12;++i)
		{
			JsonData data = new JsonData();
			data.setValue(i);
			data.setText(String.valueOf(month[i-1]));
			monthList.add(data);
		}
		return monthList;
	}
	
	@RequestMapping(value="/deleteGoal/{goalId}/{partyId}", method = RequestMethod.GET)
	public String deleteGoal(@PathVariable("goalId") String goalId,@PathVariable("partyId") String partyId,HttpServletRequest request,final RedirectAttributes redirectAttributes)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		else
		{
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		Integer lastModifiedBy = userSession.getUserId();
		String token = "12354";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(DELETE_GOAL+ "/"+username+"/"+partyId+"/"+goalId+"/"+token);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("lastModifiedBy", lastModifiedBy);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){	
			Boolean flag = baseResponse.getResponseObject();
			if(flag==true)
			{
			redirectAttributes.addFlashAttribute("success", "success.Goal.dataDelete");
			}
			else
			{
				redirectAttributes.addFlashAttribute("error", "error.Goal.dataDelete");
			}
				
		}		
	
		return "redirect:/futureFinancialDc/getMyGoals/"+partyId;
		}
	}
	
	@RequestMapping(value="/saveGoalsPriority/{partyId}", method = RequestMethod.POST)
	public String saveGoalsPriority(@PathVariable("partyId") String partyId,HttpServletRequest request,final RedirectAttributes redirectAttributes)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		else
		{
			String inputDataString = request.getParameter("inputDataString");
			String[] inputDataStringArray = inputDataString.split(",");
			ArrayList<GoalData> goalDataList = new ArrayList<GoalData>();
			for(int i=0;i<inputDataStringArray.length;i++)
			{
				String[] dataArray = inputDataStringArray[i].split(":");
				GoalData goalData = new GoalData();
				goalData.setId(Integer.parseInt(dataArray[0]));
				goalData.setPriority(Integer.parseInt(dataArray[1]));
				goalDataList.add(goalData);
			}
			String user  = userSession.getUserName();
			String token = "15468";
			Integer buId = userSession.getBuId();
			Integer userId = userSession.getUserId();
			UriComponentsBuilder uriCB;
			uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_GOALS_PRIORITY_URL+"/"+ user+"/" + token+"?buId="+buId+"&userId="+userId+"&partyId="+partyId);
			BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalDataList, BaseResponse.class);
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				Boolean flag = baseResponse.getResponseObject();
				if(flag==true)
				{
					redirectAttributes.addFlashAttribute("success", "success.Goal.prority");
				}
				else
				{
					redirectAttributes.addFlashAttribute("error", "error.Goal.prority");
				}
			}
			else
			{
				redirectAttributes.addFlashAttribute("error", "error.Goal.prority");
			}
		
	     return "redirect:/futureFinancialDc/getMyGoals/"+partyId;
		}
	}
	
	private void updateFPActivityTracker(String partyId,Integer buId)
	{
		//to set current stage id to DCT activated
		UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7007/"+partyId+"/342");
		uri.queryParam("buId", buId);
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
	}
	
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
	
	private Integer getNumberOfGoalsForGoaltypeID(String username,Integer buId, Integer goaltypeId,Integer partyId )
	{
		UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(GET_NUMBER_OF_GOALS_FOR_GOALTYPE_ID+username+"/"+goaltypeId+"/342");
		uri.queryParam("buId", buId);
		uri.queryParam("partyId", partyId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
		return br.getResponseObject();
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
	
	private void addExistingGoal(Model model, int goalType, HttpServletRequest request, String goalTypeString, String partyId){
		List<GoalData> myGoalListJson = new ArrayList<GoalData>();
		List<GoalData> goalList = new ArrayList<>();
		String token = "234";
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		Integer buId = userSession.getBuId();		
		UriComponentsBuilder componentsBuilder = UriComponentsBuilder.fromHttpUrl(GET_GOALS_FOR_PARTYID+partyId+"/"+userSession.getUserName()+"/"+token);
		componentsBuilder.queryParam("buId", buId);
		BaseResponse<GoalData> baseResponse = new BaseResponse<>();
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(componentsBuilder), BaseResponse.class);
		if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			myGoalListJson = baseResponse.getResponseListObject();
		}
		GoalData goalData = null;
		String redirectUrl = null;
		for(int i=0;i<myGoalListJson.size();++i)
		{
			try {
				goalData = objectMapper.readValue(objectMapper.writeValueAsString(myGoalListJson.get(i)), GoalData.class);
				if(goalData.getGoalTypeId() != null && goalData.getGoalTypeId().intValue()== goalType  ){
					goalList.add(goalData);	
				}
			}catch(Exception ex){
				LogFactory.getLog(getClass()).error("Error converting json response",ex);
			}
			
		}		
		model.addAttribute("foundGoal", goalList.size());
		model.addAttribute("goalTypeString", goalTypeString);
		model.addAttribute("goalTypeId",goalType);
	}
		
}
