
package in.fiinfra.Analysis;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import in.fiinfra.common.diy.models.CashFlowData;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.utility.GoalData;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Path;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/analysis")
public class AnalysisController {
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
		
	@Value("${GET_ANALYSIS_FOR_GOALS_URL}")
	private String GET_ANALYSIS_FOR_GOALS;
	
	@Value("${GET_SUGGESTION_FOR_GOAL}")
	private String GET_SUGGESTION_FOR_GOAL;
	
	
	@Value("${GET_ANALYSIS_FOR_CASHFLOW_DATA}")
	private String GET_ANALYSIS_FOR_CASHFLOW_DATA;
	
	
	@RequestMapping (value="/emergencyReadiness",method=RequestMethod.GET)
	public String showAnalysisForEmergency (HttpServletRequest request) {
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		return "Analysis/EmergencyReadiness";
	}

	@RequestMapping (value="/successionReadiness")
	public String showAnalysisForSuccession (HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		return "Analysis/SuccessionReadiness";
		
				
	}
	
	@RequestMapping (value="/goal")
	public String showAnalysisForGoal (HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		return "Analysis/Goals";
		
				
	}
	
	@RequestMapping (value="/cashFlow")
	public String showAnalysisForCashFlow (HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		return "Analysis/CashFlow";
		
				
	}
	
	@RequestMapping (value="/riskCover")
	public String showAnalysisForRiskCover (HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		return "Analysis/RiskCover";
		
				
	}
	
	@RequestMapping (value="/loans")
	public String showAnalysisForLoans (HttpServletRequest request) {
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
			return "Analysis/Loans";
				
	}
	
	@RequestMapping (value="/retirement/{partyId}/{sectionId}",method=RequestMethod.GET)
	public String showAnalysisForRetirement(Model model,@PathVariable String partyId,@PathVariable String sectionId ,HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		else
		{
			String goalId = "0";
			GoalData goalData = getGoalData(partyId,goalId,sectionId,userSession);
			model = getGoalAnalysisModel(model,goalData);
			
			/*model.addAttribute("thumb","thumb_down");
			model.addAttribute("allocatedAssets","50");
			model.addAttribute("startYear","2014");
			model.addAttribute("endYear","2030");
			model.addAttribute("startAmount","1000000");
			model.addAttribute("endAmount","2500000");*/
			
			return "partner/datacollection/retirement-planning-analysis";
		}
	}
	
	// start goal analysis 
	
	@RequestMapping (value="/car/{partyId}/{goalId}",method=RequestMethod.GET)
	public String showAnalysisForCar(Model model,@PathVariable String partyId,@PathVariable String goalId,HttpServletRequest request) {

		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		else
		{
			String sectionId = "0";
			GoalData goalData = getGoalData(partyId,goalId,sectionId,userSession);
			model.addAttribute("partyId",partyId);
			model.addAttribute("cancel",request.getContextPath()+"/futureFinancialDc/edit-car-goal/"+goalId+"/"+partyId);
			model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/car/"+partyId+"/"+goalId);
			model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/car/"+partyId+"/"+goalId);	
			model = getGoalAnalysisModel(model,goalData);
			return "partner/datacollection/car-goal-analysis";
		}
	}
	@RequestMapping (value="/education/{partyId}/{goalId}",method=RequestMethod.GET)
	public String showAnalysisForEducation(Model model,@PathVariable String partyId,@PathVariable String goalId,HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		else
		{
			String sectionId = "0";
			GoalData goalData = getGoalData(partyId,goalId,sectionId,userSession);
			model.addAttribute("partyId",partyId);
			model.addAttribute("cancel",request.getContextPath()+"/futureFinancialDc/edit-educational-goal/"+goalId+"/"+partyId);
			model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/education/"+partyId+"/"+goalId);
			model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/educational/"+partyId+"/"+goalId);	
			model = getGoalAnalysisModel(model,goalData);
			return "partner/datacollection/education-goal-analysis";
		}
	}
	@RequestMapping (value="/travel/{partyId}/{goalId}",method=RequestMethod.GET)
	public String showAnalysisForTravel(Model model,@PathVariable String partyId,@PathVariable String goalId,HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		else
		{
			String sectionId = "0";
			GoalData goalData = getGoalData(partyId,goalId,sectionId,userSession);
			model.addAttribute("partyId",partyId);
			model.addAttribute("cancel",request.getContextPath()+"/futureFinancialDc/edit-travel-vacation-goal/"+goalId+"/"+partyId);
			model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/travel/"+partyId+"/"+goalId);
			model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/travel-vacation/"+partyId+"/"+goalId);	
			model = getGoalAnalysisModel(model,goalData);
			return "partner/datacollection/travel-goal-analysis";
		}
	}
	@RequestMapping (value="/wedding/{partyId}/{goalId}",method=RequestMethod.GET)
	public String showAnalysisForWedding(Model model,@PathVariable String partyId,@PathVariable String goalId,HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		else
		{
			String sectionId = "0";
			GoalData goalData = getGoalData(partyId,goalId,sectionId,userSession);
			model.addAttribute("partyId",partyId);
			model.addAttribute("cancel",request.getContextPath()+"/futureFinancialDc/edit-wedding-goal/"+goalId+"/"+partyId);
			model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/wedding/"+partyId+"/"+goalId);
			model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/wedding/"+partyId+"/"+goalId);	
			model = getGoalAnalysisModel(model,goalData);
			return "partner/datacollection/wedding-goal-analysis";
		}
	}
	@RequestMapping (value="/business/{partyId}/{goalId}",method=RequestMethod.GET)
	public String showAnalysisForBusiness(Model model,@PathVariable String partyId,@PathVariable String goalId,HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		else
		{
			String sectionId = "0";
			GoalData goalData = getGoalData(partyId,goalId,sectionId,userSession);
			model.addAttribute("partyId",partyId);
			model.addAttribute("cancel",request.getContextPath()+"/futureFinancialDc/edit-business-goal/"+goalId+"/"+partyId);
			model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/business/"+partyId+"/"+goalId);
			model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/business/"+partyId+"/"+goalId);	
			model = getGoalAnalysisModel(model,goalData);
			return "partner/datacollection/business-goal-analysis";
		}
	}
	@RequestMapping (value="/property/{partyId}/{goalId}",method=RequestMethod.GET)
	public String showAnalysisForProperty(Model model,@PathVariable String partyId,@PathVariable String goalId,HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		else
		{
			String sectionId = "0";
			GoalData goalData = getGoalData(partyId,goalId,sectionId,userSession);
			model.addAttribute("partyId",partyId);
			model.addAttribute("cancel",request.getContextPath()+"/futureFinancialDc/edit-property-goal/"+goalId+"/"+partyId);
			model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/property/"+partyId+"/"+goalId);
			model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/property/"+partyId+"/"+goalId);	
			model = getGoalAnalysisModel(model,goalData);
			return "partner/datacollection/property-goal-analysis";
		}
	}	
	@RequestMapping (value="/special/{partyId}/{goalId}",method=RequestMethod.GET)
	public String showAnalysisForSpecial(Model model,@PathVariable String partyId,@PathVariable String goalId,HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		else
		{
			String sectionId = "0";
			GoalData goalData = getGoalData(partyId,goalId,sectionId,userSession);
			model.addAttribute("partyId",partyId);
			model.addAttribute("cancel",request.getContextPath()+"/futureFinancialDc/edit-special-goal/"+goalId+"/"+partyId);
			model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/special/"+partyId+"/"+goalId);
			model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/special/"+partyId+"/"+goalId);	
			model = getGoalAnalysisModel(model,goalData);
			return "partner/datacollection/special-goal-analysis";
		}
	}
	@RequestMapping (value="/target-corpus/{partyId}/{goalId}",method=RequestMethod.GET)
	public String showAnalysisForTargetCorpus(Model model,@PathVariable String partyId,@PathVariable String goalId,HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		else
		{
			String sectionId = "0";
			GoalData goalData = getGoalData(partyId,goalId,sectionId,userSession);
			model.addAttribute("partyId",partyId);
			model.addAttribute("cancel",request.getContextPath()+"/futureFinancialDc/edit-target-corpus-goal/"+goalId+"/"+partyId);
			model = getGoalAnalysisModel(model,goalData);
			return "partner/datacollection/target-corpus-goal-analysis";
		}
	}
	@RequestMapping (value="/other/{partyId}/{goalId}",method=RequestMethod.GET)
	public String showAnalysisForOther(Model model,@PathVariable String partyId,@PathVariable String goalId,HttpServletRequest request) {
		
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		else
		{
			String sectionId = "0";
			GoalData goalData = getGoalData(partyId,goalId,sectionId,userSession);
			model.addAttribute("partyId",partyId);
			model.addAttribute("cancel",request.getContextPath()+"/futureFinancialDc/edit-other-goal/"+goalId+"/"+partyId);
			model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/other/"+partyId+"/"+goalId);
			model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/other/"+partyId+"/"+goalId);	
			model = getGoalAnalysisModel(model,goalData);
			return "partner/datacollection/other-goal-analysis";
		}
	}
	@RequestMapping (value="suggestion/{screen}/{partyId}/{goalId}",method=RequestMethod.GET)
	public String suggestion(Model model,@PathVariable String screen,@PathVariable String partyId,@PathVariable String goalId,HttpServletRequest request)
	{
		String url=null;
		Suggestion suggestion = null;
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) 
		{
			return "redirect:/login";
		}
		else
		{
			switch(screen){
			
			case "education" : 
				suggestion = getSuggestionData(partyId, goalId, userSession);
				model = getSuggestionData(model,suggestion);
				model.addAttribute("goalType","Education");
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/education/"+partyId+"/"+goalId);
				model.addAttribute("cancelLink",request.getContextPath()+"/futureFinancialDc/edit-educational-goal/"+goalId+"/"+partyId);
				model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/educational/"+partyId+"/"+goalId);
				url="analysis/suggestion/goalSuggestion";
				model.addAttribute("iconId","35001");
				break;
			case "business" : 
				suggestion = getSuggestionData(partyId, goalId, userSession);
				model = getSuggestionData(model,suggestion);
				model.addAttribute("goalType","Business");
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/business/"+partyId+"/"+goalId);
				model.addAttribute("cancelLink",request.getContextPath()+"/futureFinancialDc/edit-business-goal/"+goalId+"/"+partyId);
				model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/business/"+partyId+"/"+goalId);
				url="analysis/suggestion/goalSuggestion";
				model.addAttribute("iconId","35012");
				break;
			case "car" : 
				suggestion = getSuggestionData(partyId, goalId, userSession);
				model = getSuggestionData(model,suggestion);
				model.addAttribute("goalType","Car");
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/car/"+partyId+"/"+goalId);
				model.addAttribute("cancelLink",request.getContextPath()+"/futureFinancialDc/edit-car-goal/"+goalId+"/"+partyId);
				model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/car/"+partyId+"/"+goalId);
				url="analysis/suggestion/goalSuggestion";
				model.addAttribute("iconId","35006");
				break;
			case "other" : 
				suggestion = getSuggestionData(partyId, goalId, userSession);
				model = getSuggestionData(model,suggestion);
				model.addAttribute("goalType","Other");
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/other/"+partyId+"/"+goalId);
				model.addAttribute("cancelLink",request.getContextPath()+"/futureFinancialDc/edit-other-goal/"+goalId+"/"+partyId);
				model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/other/"+partyId+"/"+goalId);	
				url="analysis/suggestion/goalSuggestion";
				model.addAttribute("iconId","35013");
				break;	
			case "property" : 
				suggestion = getSuggestionData(partyId, goalId, userSession);
				model = getSuggestionData(model,suggestion);
				model.addAttribute("goalType","Property");
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/property/"+partyId+"/"+goalId);
				model.addAttribute("cancelLink",request.getContextPath()+"/futureFinancialDc/edit-property-goal/"+goalId+"/"+partyId);
				model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/property/"+partyId+"/"+goalId);
				url="analysis/suggestion/goalSuggestion";
				model.addAttribute("iconId","35003");
				break;	
			case "special" : 
				suggestion = getSuggestionData(partyId, goalId, userSession);
				model = getSuggestionData(model,suggestion);
				model.addAttribute("goalType","Special");
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/special/"+partyId+"/"+goalId);
				model.addAttribute("cancelLink",request.getContextPath()+"/futureFinancialDc/edit-special-goal/"+goalId+"/"+partyId);
				model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/special/"+partyId+"/"+goalId);
				url="analysis/suggestion/goalSuggestion";
				model.addAttribute("iconId","35008");
				break;
			case "wedding" : 
				suggestion = getSuggestionData(partyId, goalId, userSession);
				model = getSuggestionData(model,suggestion);
				model.addAttribute("goalType","Wedding");
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/wedding/"+partyId+"/"+goalId);
				model.addAttribute("cancelLink",request.getContextPath()+"/futureFinancialDc/edit-wedding-goal/"+goalId+"/"+partyId);
				model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/wedding/"+partyId+"/"+goalId);
				url="analysis/suggestion/goalSuggestion";
				model.addAttribute("iconId","35004");
				break;	
			case "travel" : 
				suggestion = getSuggestionData(partyId, goalId, userSession);
				model = getSuggestionData(model,suggestion);
				model.addAttribute("goalType","Travel");
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/travel/"+partyId+"/"+goalId);
				model.addAttribute("cancelLink",request.getContextPath()+"/futureFinancialDc/edit-travel-vacation-goal/"+goalId+"/"+partyId);
				model.addAttribute("actionPlanLink",request.getContextPath()+"/actionplan/goal/travel-vacation/"+partyId+"/"+goalId);
				url="analysis/suggestion/goalSuggestion";
				model.addAttribute("iconId","35005");
				break;	
				
			case "target-corpus" :
				suggestion = getSuggestionData(partyId, goalId, userSession);
				model = getSuggestionData(model,suggestion);
				model.addAttribute("goalType","Target Corpus");
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/target-corpus/"+partyId+"/"+goalId);
				model.addAttribute("cancelLink",request.getContextPath()+"/futureFinancialDc/edit-target-corpus-goal/"+goalId+"/"+partyId);
				url="analysis/suggestion/goalSuggestion";
				model.addAttribute("iconId","35016");				
				break;
			default :
				break;	
			
			}
			return url;
		}
	}

	public Model getGoalAnalysisModel(Model model,GoalData goalData)
	{
		model.addAttribute("allocatedAssets",goalData.getResult().intValue());
		model.addAttribute("startYear",goalData.getCurrentYear());
		model.addAttribute("endYear",goalData.getGoalStartYear());
		model.addAttribute("startAmount",goalData.getGoalAmountPv());
		model.addAttribute("endAmount",goalData.getGoalAmountFv());
		model.addAttribute("description", goalData.getDescription());
		model.addAttribute("amountNeeded", goalData.getShortfall());
		
		if(goalData.getResult() == 100)
		{
			model.addAttribute("thumb", "thumb_up");
			
		}
		else if(goalData.getResult() > 80 && goalData.getResult() <= 99)
		{
			model.addAttribute("thumb", "thumb_horizontal");
					}
		else if(goalData.getResult() <= 80)
		{
			model.addAttribute("thumb","thumb_down");
		}
		
	   	 return model;
	
	}
	
	public GoalData getGoalData(String partyId,String goalId,String sectionId,UserSession userSession)
	{
		
		GoalData goalData = new GoalData();
		String token = "4321";
		Integer buId = userSession.getBuId();
		
		UriComponentsBuilder componentsBuilder = UriComponentsBuilder.fromHttpUrl(GET_ANALYSIS_FOR_GOALS+"/"+partyId+"/"+goalId+"/"+sectionId+"/"+userSession.getName()+"/"+token);
		componentsBuilder.queryParam("buId", buId);
		BaseResponse<GoalData> baseResponse = new BaseResponse<GoalData>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(componentsBuilder), BaseResponse.class).getBody();
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			try {
					goalData = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), GoalData.class);
				} catch (Exception e) 
				{
					e.printStackTrace();
				}
		}
		
		return goalData;
	}
	
	public Model getSuggestionData(Model model,Suggestion suggestion)
	{
		
		model.addAttribute("goalName", suggestion.getGoalName());
		model.addAttribute("investAmount", suggestion.getInvestAmount());
		model.addAttribute("goalLumpSumAmount", suggestion.getGoalLumpSumAmount());
		model.addAttribute("goalachievement",Double.parseDouble(suggestion.getGoalachievement()));
		model.addAttribute("goalYear",suggestion.getGoalYear());
		model.addAttribute("description", suggestion.getDescription());
		
		return model;
		
	}
	public Suggestion getSuggestionData(String partyId,String goalId,UserSession userSession)
	{
		Suggestion suggestion = new Suggestion();
		String token = "4321";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder componentsBuilder = UriComponentsBuilder.fromHttpUrl(GET_SUGGESTION_FOR_GOAL+"/"+partyId+"/"+goalId+"/"+userSession.getName()+"/"+token);
		componentsBuilder.queryParam("buId", buId);
		BaseResponse<Suggestion> baseResponse = new BaseResponse<Suggestion>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(componentsBuilder), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			try {
				suggestion = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), Suggestion.class);
				} catch (Exception e) 
				{
					e.printStackTrace();
				}
		}
		return suggestion;
	}
	
	@RequestMapping(value = "/datacollection/cash-flow-analysis/{partyId}", method = RequestMethod.GET)
	public String getAnalysisForCashFlowData(Model model,@PathVariable String partyId,HttpServletRequest request)
	{
		UserSession userSession =(UserSession) request.getSession().getAttribute("userSession");
		CashFlowData cashflowdata=new CashFlowData();
		String token = "4321";
		UriComponentsBuilder componentsBuilder = UriComponentsBuilder.fromHttpUrl(GET_ANALYSIS_FOR_CASHFLOW_DATA+"/"+partyId+"/"+userSession.getName()+"/"+token);
		BaseResponse<CashFlowData> baseResponse = new BaseResponse<CashFlowData>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(componentsBuilder), BaseResponse.class).getBody();
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			try {
				cashflowdata = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), CashFlowData.class);
				} catch (Exception e) 
				{
					e.printStackTrace();
				}
		}
		model.addAttribute("cashflowdata",cashflowdata);
		return "partner/datacollection/cash-flow-analysis";
	}
	
	
}
