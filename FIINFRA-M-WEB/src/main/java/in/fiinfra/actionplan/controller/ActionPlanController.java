package in.fiinfra.actionplan.controller;

import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.ActionPlan;
import in.fiinfra.common.diy.models.ActionPlanRisk;
import in.fiinfra.common.diy.models.AssetPlanData;
import in.fiinfra.common.diy.models.ProductData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.ActionPlanData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.partner.controller.PartnerProfileController;
//import in.fiinfra.partner.service.DropDownServices;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/actionplan")
public class ActionPlanController {
	
	private static final Logger LOGGER = Logger.getLogger(PartnerProfileController.class);
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Autowired
	private CommonController commonController;
	
	@Autowired
	//private DropDownServices dropDownService;
	
	@Value("${GET_ACTION_PLAN}")
	private String GET_ACTION_PLAN;
	
	@Value("${GET_RISK_COVER_ACTION_PLAN}")
	private String GET_RISK_COVER_ACTION_PLAN;
	
	@Value("${GET_PRODUCT_PREMIUM_AMOUNT_FOR_RISK_COVER}")
	private String GET_PRODUCT_PREMIUM_AMOUNT_FOR_RISK_COVER;
	
	@Value("${SAVE_RISK_COVER_ACTION_PLAN}")
	private String SAVE_RISK_COVER_ACTION_PLAN;
	
	@Value("${SAVE_ACTION_PLAN}")
	private String SAVE_ACTION_PLAN;
	
	public ActionPlan getActionPlan()
	{
		ActionPlan actionPlan = new ActionPlan();
		
		Map<AssetPlanData, List<ProductData>> allocationData = new LinkedHashMap<AssetPlanData,List<ProductData>>();
		
		actionPlan.setTargetAmount("6");
		actionPlan.setLumpSum("25000");
		actionPlan.setSip("25000");
		
		List<ProductData> jsonDatas1 = new ArrayList<ProductData>();
		AssetPlanData assetPlanData1 = new AssetPlanData();
		assetPlanData1.setName("Equity");
		assetPlanData1.setAllocationPercent(60.00f);
		
		ProductData jsonData = new ProductData();
		jsonData.setProductAmount(25000d);
		jsonData.setProductName("Axis Income Fund");
		
		ProductData jsonData1 = new ProductData();
		jsonData1.setProductAmount(25000d);
		jsonData1.setProductName("Birla Income Fund");
		
		ProductData jsonData2 = new ProductData();
		jsonData2.setProductAmount(25000d);
		jsonData2.setProductName("HDFC Income Fund");
		
		jsonDatas1.add(jsonData);
		jsonDatas1.add(jsonData1);
		jsonDatas1.add(jsonData2);
		
		allocationData.put(assetPlanData1, jsonDatas1);
		
		AssetPlanData assetPlanData2 = new AssetPlanData();
		assetPlanData2.setName("Debt");
		assetPlanData2.setAllocationPercent(60f);
		List<ProductData> jsonDatas2 = new ArrayList<ProductData>();
		
		ProductData jsonData3 = new ProductData();
		jsonData3.setProductAmount(25000d);
		jsonData3.setProductName("Axis Income Fund");
		
		ProductData jsonData4 = new ProductData();
		jsonData4.setProductAmount(25000d);
		jsonData4.setProductName("Birla Income Fund");
		
		ProductData jsonData5 = new ProductData();
		jsonData5.setProductAmount(25000d);
		jsonData5.setProductName("HDFC Income Fund");
		
		jsonDatas2.add(jsonData3);
		jsonDatas2.add(jsonData4);
		jsonDatas2.add(jsonData5);
		
		allocationData.put(assetPlanData2, jsonDatas2);
		
		AssetPlanData assetPlanData3 = new AssetPlanData();
		assetPlanData3.setName("Gold");
		assetPlanData3.setAllocationPercent(60f);
		List<ProductData> jsonDatas3 = new ArrayList<ProductData>();
		
		ProductData jsonData6 = new ProductData();
		jsonData6.setProductAmount(25000d);
		jsonData6.setProductName("Axis Income Fund");
		
		ProductData jsonData7 = new ProductData();
		jsonData7.setProductAmount(25000d);
		jsonData7.setProductName("Birla Income Fund");
		
		ProductData jsonData8 = new ProductData();
		jsonData8.setProductAmount(25000d);
		jsonData8.setProductName("HDFC Income Fund");
		
		jsonDatas3.add(jsonData6);
		jsonDatas3.add(jsonData7);
		jsonDatas3.add(jsonData8);
		
		allocationData.put(assetPlanData3, jsonDatas3);
		
		//actionPlan.setAllocationData(allocationData);
		
		return actionPlan;
	}

	private Map<AssetPlanData, List<ProductData>> getActionPlan(int buId, String partyId, String goalId,Integer goalTypeId, String userName,String investmentType){
		
		List<ActionPlan> actionPlanJsonList = new ArrayList<ActionPlan>();
		ActionPlan actionPlan = new ActionPlan();
		Map<AssetPlanData, List<ProductData>> actionPlanMap = new LinkedHashMap<AssetPlanData,List<ProductData>>();
		try{
			String token = "12356";
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ACTION_PLAN + "/" + partyId + "/" + goalId 
					+ "/" + goalTypeId + "/" + investmentType + "/" + userName + "/" + token + "?buId=" + buId);
			
			BaseResponse<ActionPlan> baseResponse = new BaseResponse<ActionPlan>();
			
			baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);

			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				try {
					actionPlanJsonList= objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
					for(int i = 0; i<actionPlanJsonList.size(); i++){
						//get the actual party object from its LinkedHashMap representation
						actionPlan = new ActionPlan();
						actionPlan = objectMapper.readValue(objectMapper.writeValueAsString(actionPlanJsonList.get(i)), ActionPlan.class);						
						//actionPlanList.add(actionPlan);
						AssetPlanData assetPlanData = new AssetPlanData();
						assetPlanData.setAssetClassId(actionPlan.getAssetClassId());
						assetPlanData.setProductTypeId(actionPlan.getProductTypeId());
						assetPlanData.setProductTypeName(actionPlan.getName());
						assetPlanData.setAllocationPercent(actionPlan.getAllocationPercent());
						assetPlanData.setRecommendPercent(actionPlan.getRecommendPercent());
						assetPlanData.setName(actionPlan.getName());
						assetPlanData.setTargetAmount(actionPlan.getTargetAmount());
						assetPlanData.setLumpSum(actionPlan.getLumpSum());
						assetPlanData.setSip(actionPlan.getSip());
						assetPlanData.setGoalId(actionPlan.getGoalId());
						assetPlanData.setGoalCompletion(actionPlan.getGoalCompletion());
						assetPlanData.setGoalYear(actionPlan.getGoalYear());
						assetPlanData.setGoalTypeName(actionPlan.getGoalTypeName());
						assetPlanData.setGoalName(actionPlan.getGoalName());
						assetPlanData.setGoalFrequencyName(actionPlan.getGoalFrequencyName());
						assetPlanData.setGoalTypeId(actionPlan.getGoalTypeId());
						assetPlanData.setInvestmentType(actionPlan.getInvestmentType());
						if(actionPlanMap.containsKey(assetPlanData)) {							
							List<ProductData> jsonDataList = actionPlanMap.get(assetPlanData);
							ProductData jsonData = new ProductData();
							jsonData.setFpAdviseId(actionPlan.getFpAdviseId());
							jsonData.setProductId(actionPlan.getProductId());
							jsonData.setCategoryId(actionPlan.getCategoryId());
							jsonData.setProductName(actionPlan.getProductName());
							jsonData.setProductAmount(actionPlan.getProductAmount());
							jsonData.setMinLumpSumAmount(actionPlan.getMinLumpSumAmount());
							jsonData.setMinSipAmount(actionPlan.getMinSipAmount());
							if(null!=actionPlan.getActionApprovalId()){
								jsonData.setClientApproval(actionPlan.getActionApprovalId());
								if(actionPlan.getActionApprovalId().equals(new Integer("95002"))){
									jsonData.setApporvalFlag(1);
								}else{
									jsonData.setApporvalFlag(0);
								}								
							}
							jsonDataList.add(jsonData);
							actionPlanMap.put(assetPlanData, jsonDataList);
						} else{
							List<ProductData> jsonDataList = new ArrayList<ProductData>();
							ProductData jsonData = new ProductData();
							jsonData.setFpAdviseId(actionPlan.getFpAdviseId());
							jsonData.setProductId(actionPlan.getProductId());
							jsonData.setCategoryId(actionPlan.getCategoryId());
							jsonData.setProductName(actionPlan.getProductName());
							jsonData.setProductAmount(actionPlan.getProductAmount());
							jsonData.setMinLumpSumAmount(actionPlan.getMinLumpSumAmount());
							jsonData.setMinSipAmount(actionPlan.getMinSipAmount());
							if(null!=actionPlan.getActionApprovalId()){
								jsonData.setClientApproval(actionPlan.getActionApprovalId());
								if(actionPlan.getActionApprovalId().equals(new Integer("95002"))){
									jsonData.setApporvalFlag(1);
								}else{
									jsonData.setApporvalFlag(0);
								}
							}
							jsonDataList.add(jsonData);
							actionPlanMap.put(assetPlanData, jsonDataList);		
						}						
					}					
				}catch (JsonParseException e) {
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
						
		}catch(Exception e){
			LOGGER.error("Error Fetching Action Plan from REST API : ", e);
		}
		return actionPlanMap;
	}
	
	@RequestMapping(value = "/emergency-readiness-action-plan/{partyId}", method = RequestMethod.GET)
	public String getDCEmergencyReadinessActionPlan(Model model, @PathVariable String partyId, HttpServletRequest request,
			final RedirectAttributes redirectAttributes) {
		
		String url="redirect:/partner/datacollection/emergency-readiness/"+partyId;
		
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
				
			Integer goalTypeId=35014;
			
			Map<AssetPlanData, List<ProductData>> actionPlanMap = getActionPlan(userSession.getBuId(), partyId, "0",goalTypeId, userSession.getUserName(),"96001");						
			model.addAttribute("partyId", partyId);
			model.addAttribute("actionPlanDataMap", actionPlanMap);
			AssetPlanData assetPlanData=new AssetPlanData();
			assetPlanData=(AssetPlanData) actionPlanMap.keySet().toArray()[0];
			model.addAttribute("headerData",assetPlanData);
			model.addAttribute("goalTypeId",goalTypeId);
			model.addAttribute("partyId",partyId);
			model.addAttribute("redirectURL","actionplan/emergency-readiness-action-plan");
			if((!assetPlanData.getTargetAmount().equals("") && !assetPlanData.getTargetAmount().equals("0.00"))){
				url="actionplan/emergency-readiness-action-plan";
				
				Integer saveEmergencyActionPlan = 304;
				String saveEmergencyPlan = "";
				saveEmergencyPlan = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(), userSession.getUserName(), userSession.getBuId(), saveEmergencyActionPlan);
				model.addAttribute("roleBaseLinks",saveEmergencyPlan);
			}else{
				redirectAttributes.addFlashAttribute("error","error.noDataFoundForActionPlan");
			}
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
			redirectAttributes.addFlashAttribute("error","error.noDataFound");
		}		
		return url;
	}
	
	private String getAmountWithUnits(String amount){
		//count two extra for fraction digits
		DecimalFormat df = new DecimalFormat("#.00");
		/*if(amount.length()>=11){
			amount=df.format((Double.parseDouble(amount)/10000000.00))+" crore";
		}else if(amount.length()>=9){*/
			amount=df.format((Double.parseDouble(amount)/100000.00))+" lakh";
			if( amount.equals(".00 lakh") ){
				amount = "0.00 lakh";
			}
		/*}*/
		return amount;
	}
	
	@RequestMapping(value = "/risk-cover-action-plan/{partyId}", method = RequestMethod.GET)
	public String getDCRiskCoverActionPlan(Model model, @PathVariable String partyId, 
			HttpServletRequest request) {
		
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			Integer sectionTypeId=39003;
			String userName=userSession.getUserName();
			String token="12345";
			Integer buId=123;
			String coverAmount="";
			int premiumAmtErrorFlag=0;
			List<ActionPlanRisk> actionPlanListAsJson = new ArrayList<ActionPlanRisk>();
			List<ActionPlanRisk> actionPlanList = new ArrayList<ActionPlanRisk>();
			BaseResponse<ActionPlanRisk> baseResponse = new BaseResponse<ActionPlanRisk>();
			//call service for all parties associated 
			baseResponse = restTemplate.getForObject(GET_RISK_COVER_ACTION_PLAN+ "/" +partyId + "/" +sectionTypeId+ "/" +userName  + "/" +token +"?buId="+buId,BaseResponse.class);
			
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				try {
					actionPlanListAsJson= objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
					for(int i = 0; i<actionPlanListAsJson.size(); i++){
						//get the actual party object from its LinkedHashMap representation
						ActionPlanRisk actionPlanRisk1 = new ActionPlanRisk();
						actionPlanRisk1 = objectMapper.readValue(objectMapper.writeValueAsString(actionPlanListAsJson.get(i)), ActionPlanRisk.class);
						coverAmount=getAmountWithUnits(actionPlanRisk1.getCoverRequired());
						actionPlanRisk1.setCoverRequired(coverAmount);
						coverAmount=getAmountWithUnits(actionPlanRisk1.getCoverAvailable());
						actionPlanRisk1.setCoverAvailable(coverAmount);
						if((actionPlanRisk1.getPremiumAmount().equals("0.0") || actionPlanRisk1.getPremiumAmount().equals("0")) && premiumAmtErrorFlag==0){
							model.addAttribute("error","error.actionPlan.riskCover.noPremiumAmount");
							premiumAmtErrorFlag=1;
						}
						if(null!=actionPlanRisk1 && null!=actionPlanRisk1.getActionApprovalId() && actionPlanRisk1.getActionApprovalId().equals(new Integer("95002"))){
							actionPlanRisk1.setActionFlag(1);
						}else{
							actionPlanRisk1.setActionFlag(0);
						}
						//actionPlanRisk1.setProductNameList(objectMapper.writeValueAsString(dropDownService.getProductNamesListForRiskCover(actionPlanRisk1.getRiskId(), 
							//	actionPlanRisk1.getRisk().substring(0, 2).toUpperCase(),userName)));
						actionPlanList.add(actionPlanRisk1);
					}
				}catch (JsonParseException e) {
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
			Integer saveRiskCOverActionPlan = 305;
			String saveRiskActionLink = "";
			saveRiskActionLink = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(), userSession.getUserName(), userSession.getBuId(), saveRiskCOverActionPlan);
			//ActionPlan actionPlan = getActionPlan(userSession.getBuId(), partyId, "", userSession.getUserName());						
			model.addAttribute("partyId", partyId);
			model.addAttribute("actionPlanData", actionPlanList);
			model.addAttribute("roleBaseLinks", saveRiskActionLink);
			
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}	
		String returnUrl = request.getParameter("returnUrl");
		model.addAttribute("returnUrl", returnUrl);
		return "actionplan/risk-cover-action-plan";
	}
	
	@RequestMapping(value = "/saveRiskCoverActionPlan", method = RequestMethod.POST)
	public String saveRiskCoverActionPlan(HttpServletRequest request,final RedirectAttributes redirectAttributes){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		Integer partyId=Integer.parseInt(request.getParameter("partyId"));
		String fpAdviseRecommendIds=request.getParameter("fpAdviseRecommendIds");
		String allocationPercent="";
		String[] fpAdviseRecommendIdArray=fpAdviseRecommendIds.split(",");
		String riskId="";
		String risk="";
		String coverAvailable="";
		String coverRequired="";
		String productId="";
		String productName="";
		String premiumAmt="";
		String clientApprovalId="";
		String approvalFlag="";
		List<ActionPlanRisk> actionPlanRiskList=new ArrayList<ActionPlanRisk>();
		ActionPlanRisk actionPlanRisk=new ActionPlanRisk();
		for(int i=((fpAdviseRecommendIdArray.length)-1);i>=0;i--){
			actionPlanRisk=new ActionPlanRisk();
			riskId=request.getParameter("riskId_"+fpAdviseRecommendIdArray[i]);
			risk=request.getParameter("risk_"+fpAdviseRecommendIdArray[i]);
			coverRequired=request.getParameter("coverRequired_"+fpAdviseRecommendIdArray[i]);
			coverAvailable=request.getParameter("coverAvailable_"+fpAdviseRecommendIdArray[i]);
			productId=request.getParameter("productId_"+fpAdviseRecommendIdArray[i]);
			allocationPercent=request.getParameter("allocationPercent_"+fpAdviseRecommendIdArray[i]);
			premiumAmt=request.getParameter("premiumAmount_"+fpAdviseRecommendIdArray[i]);
			clientApprovalId=request.getParameter("clientApprovalChkbx_"+fpAdviseRecommendIdArray[i]);			
			if((null!=risk) && (null!=productId) && (null!=fpAdviseRecommendIdArray[i]) && (!fpAdviseRecommendIdArray[i].equals(0))){
				actionPlanRisk.setFpAdviseRecommendId(Integer.parseInt(fpAdviseRecommendIdArray[i]));
				actionPlanRisk.setRiskId(Integer.parseInt(riskId));
				actionPlanRisk.setRisk(risk);
				actionPlanRisk.setPartyId(partyId);
				actionPlanRisk.setCoverRequired(coverRequired);
				actionPlanRisk.setCoverAvailable(coverAvailable);
				actionPlanRisk.setProductId(Integer.parseInt(productId));
				actionPlanRisk.setAllocationPercent(allocationPercent);
				actionPlanRisk.setPremiumAmount(premiumAmt);
				actionPlanRisk.setSumAssured("0.0");
				if(null!=clientApprovalId){
					actionPlanRisk.setActionApprovalId(Integer.parseInt(clientApprovalId));
				}else{
					actionPlanRisk.setActionApprovalId(new Integer("95001"));
				}
				actionPlanRiskList.add(actionPlanRisk);				
			}			
		}
		String token = "153443";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_RISK_COVER_ACTION_PLAN + "/" + username + "/" + token+"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), actionPlanRiskList, BaseResponse.class);
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			redirectAttributes.addFlashAttribute("success", "success.riskCoverActionPlan.dataSave");
			for(int i=((fpAdviseRecommendIdArray.length)-1);i>=0;i--){
				actionPlanRisk=new ActionPlanRisk();
				risk=request.getParameter("risk_"+fpAdviseRecommendIdArray[i]);
				premiumAmt=request.getParameter("premiumAmount_"+fpAdviseRecommendIdArray[i]);
				clientApprovalId=request.getParameter("clientApprovalChkbx_"+fpAdviseRecommendIdArray[i]);
				approvalFlag=request.getParameter("apporvalFlag_"+fpAdviseRecommendIdArray[i]);
				productName = request.getParameter("product_"+fpAdviseRecommendIdArray[i]);
				clientApprovalId=request.getParameter("clientApprovalChkbx_"+fpAdviseRecommendIdArray[i]);
				approvalFlag=request.getParameter("apporvalFlag_"+fpAdviseRecommendIdArray[i]);
				if( null == approvalFlag || approvalFlag.isEmpty()) {
					approvalFlag = "0";
				}
				if(null != clientApprovalId && clientApprovalId.equals("95002") && approvalFlag.equals("0")) {
					sendNotification(username, buId, "Risk Cover", risk, premiumAmt, "Monthly", productName, userSession.getPartyId(), partyId, request.getSession().getId());
				}
			}
			
		}else{
			redirectAttributes.addFlashAttribute("error", "error.riskCoverActionPlan.dataSave");
		}
		///user/153443?buId=153
		return "redirect:/actionplan/risk-cover-action-plan/"+partyId;
	}
	
	@RequestMapping(value = "/goal/{screen}/{partyId}/{goalId}", method = RequestMethod.GET)
	public String getDCActionPlanForGoal(Model model, HttpServletRequest request,
			@PathVariable String screen,
			@PathVariable String goalId,
			@PathVariable String partyId,
			@RequestParam(value="goalTypeId",required=true,defaultValue="") String goalTypeId,
			@RequestParam(value="investmentType",required=true,defaultValue="") String investmentType,			
			final RedirectAttributes redirectAttributes)  {	
		
		String url="";
		
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}

			Map<AssetPlanData, List<ProductData>> actionPlanMap=new HashMap<AssetPlanData, List<ProductData>>();
			if(!goalTypeId.isEmpty()){
				if(!investmentType.isEmpty()){
					actionPlanMap = getActionPlan(userSession.getBuId(), partyId, "0", Integer.parseInt(goalTypeId), userSession.getUserName(),investmentType);
					model.addAttribute("investmentType",investmentType);
				}else{
					actionPlanMap = getActionPlan(userSession.getBuId(), partyId, "0", Integer.parseInt(goalTypeId), userSession.getUserName(),"96001");
					model.addAttribute("investmentType","96001");
				}				
			}else{
				if(!investmentType.isEmpty()){
					actionPlanMap = getActionPlan(userSession.getBuId(), partyId, goalId, 0, userSession.getUserName(),investmentType);
					model.addAttribute("investmentType",investmentType);
				}else{
					actionPlanMap = getActionPlan(userSession.getBuId(), partyId, goalId, 0, userSession.getUserName(),"96001");
					model.addAttribute("investmentType","96001");
				}				
			}
			
			Integer goalActionPlanId = 0;
			String goalActionPlanLink = "";
			String token = "12345";
			String goalActionPlanControlId = "";
			
			switch( screen ){
			case "retirement-planning":
				goalActionPlanId = 306;
				goalActionPlanControlId = "saveRetirementReadinessActionPlan";
				model.addAttribute("suggestionLink","#");
				model.addAttribute("analysisLink","#");
				break;
			case "educational":
				goalActionPlanId = 307;
				goalActionPlanControlId = "saveEducationGoalActionPlanLink";
				model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/education/"+partyId+"/"+goalId);
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/education/"+partyId+"/"+goalId);
				break;
			case "travel-vacation":
				goalActionPlanId = 308;
				goalActionPlanControlId = "saveTravelGoalActionPlanLink";
				model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/travel/"+partyId+"/"+goalId);
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/travel/"+partyId+"/"+goalId);
				break;
			case "wedding":
				goalActionPlanId = 309;
				goalActionPlanControlId = "saveWeddingGoalActionPlanLink";
				model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/wedding/"+partyId+"/"+goalId);
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/wedding/"+partyId+"/"+goalId);
				break;
			case "car":
				goalActionPlanId = 310;
				goalActionPlanControlId = "saveCarGoalActionPlanLink";
				model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/car/"+partyId+"/"+goalId);
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/car/"+partyId+"/"+goalId);
				break;
			case "property":
				goalActionPlanId = 311;
				goalActionPlanControlId = "savePropertyGoalActionPlanLink";
				model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/property/"+partyId+"/"+goalId);
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/property/"+partyId+"/"+goalId);
				break;
			case "business":
				goalActionPlanId = 312;
				goalActionPlanControlId = "saveBusinessGoalActionPlanLink";
				model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/business/"+partyId+"/"+goalId);
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/business/"+partyId+"/"+goalId);
				break;
			case "special":
				goalActionPlanId = 313;
				goalActionPlanControlId = "saveSpecialGoalActionPlanLink";
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/special/"+partyId+"/"+goalId);
				model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/special/"+partyId+"/"+goalId);
				break;
			case "other":
				goalActionPlanId = 314;
				goalActionPlanControlId = "saveOtherGoalActionPlanLink";
				model.addAttribute("suggestionLink",request.getContextPath()+"/analysis/suggestion/other/"+partyId+"/"+goalId);
				model.addAttribute("analysisLink",request.getContextPath()+"/analysis/other/"+partyId+"/"+goalId);
				break;
				
			case "target-corpus" :
				goalActionPlanId = 315;
				goalActionPlanControlId = "saveTargetCorpusGoalActionPlanLink";
				break;
			}
			
			goalActionPlanLink = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(), userSession.getUserName(), userSession.getBuId(), goalActionPlanId);
			
			model.addAttribute("partyId", partyId);			
			model.addAttribute("roleBaseLinks",goalActionPlanLink);
			model.addAttribute("goalActionPlanControlId",goalActionPlanControlId);
			model.addAttribute("goalTypeId",goalTypeId);
			model.addAttribute("goalId",goalId);
			model.addAttribute("goalName",screen);
			model.addAttribute("actionPlanDataMap", actionPlanMap);
			AssetPlanData assetPlanData=new AssetPlanData();
			try{
			    assetPlanData=(AssetPlanData) actionPlanMap.keySet().toArray()[0];
			   }catch(ArrayIndexOutOfBoundsException aioubex){
			    aioubex.printStackTrace();
			   }
			model.addAttribute("headerData",assetPlanData);
			model.addAttribute("iconId",""+assetPlanData.getGoalTypeId());
			if(!goalTypeId.isEmpty()){
				url="redirect:/partner/datacollection/retirement-planning/"+partyId;
				model.addAttribute("parentPageUrl",url);
			}else{
				url="redirect:/futureFinancialDc/edit-" + screen + "-goal/" + goalId  + "/" + partyId;
				model.addAttribute("parentPageUrl", "/futureFinancialDc/edit-" + screen + "-goal/" + goalId  + "/" + partyId);
			}			
			model.addAttribute("redirectURL","actionplan/goal/"+screen);
			/*if((!assetPlanData.getSip().equals("") && !assetPlanData.getSip().equals("0.00")) || 
					(!assetPlanData.getLumpSum().equals("") && !assetPlanData.getLumpSum().equals("0.00"))){*/
			if(!(assetPlanData.getGoalCompletion().equals("100.00"))){
				url="actionplan/goal";
			}else{
				redirectAttributes.addFlashAttribute("error","error.actionPlan.noAction");
			}
		}catch(Exception ex){
			LOGGER.error(ex);
			model.addAttribute("errorMsg", "Error Fetching Data");
		}		
		
		return url;
	}
	
	@RequestMapping(value = "/saveActionPlan", method = RequestMethod.POST)
	public String saveActionPlan(HttpServletRequest request,final RedirectAttributes redirectAttributes){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		Integer partyId=Integer.parseInt(request.getParameter("partyId"));
		String assetClassIds=request.getParameter("assetClassIds");
		String[] assetClassIdArray=null;
		if(null!=assetClassIds){
			assetClassIdArray=assetClassIds.split(",");
		}		
		String productTypeIds=request.getParameter("productTypeIds");
		String[] productTypeIdArray=null;
		if(null!=productTypeIds){
			productTypeIdArray=productTypeIds.split(",");
		}
		String fpAdviseRecommendIds="";
		String allocationPercent="";
		String[] fpAdviseRecommendIdArray=null;
		String sip=request.getParameter("sip");
		String lumpSum=request.getParameter("lumpSum");
		String productId="";
		String productAmt="";
		String categoryId="";
		String productName="";
		String goalYear=request.getParameter("goalYear");
		String targetAmount=request.getParameter("targetAmount");
		String goalTypeId=request.getParameter("goalTypeId");
		String goalId=request.getParameter("goalId");		
		String redirectURL=request.getParameter("redirectURL");
		String clientApproval="";
		String goalType = request.getParameter("goalTypeName");
		String goalName = request.getParameter("goalName");
		String goalFrequencyName = request.getParameter("goalFrequencyName");
		String investmentType = request.getParameter("investmentType");
		//Integer apporvalFlag;
		List<ActionPlan> actionPlanRiskList=new ArrayList<ActionPlan>();
		ActionPlan actionPlan=new ActionPlan();
		
		for(int i=((productTypeIdArray.length)-1);i>=0;i--){
			if(null!=productTypeIdArray){
				allocationPercent=request.getParameter("allocationPercent_"+productTypeIdArray[i]);
			}else{
				allocationPercent=request.getParameter("allocationPercent_"+assetClassIdArray[i]);
			}
			fpAdviseRecommendIds=request.getParameter("fpAdviseIds_"+productTypeIdArray[i]);
			if(null!=fpAdviseRecommendIds){
				fpAdviseRecommendIdArray=fpAdviseRecommendIds.split(",");
				for(int j=((fpAdviseRecommendIdArray.length)-1);j>=0;j--){
					productId=request.getParameter("productId_"+fpAdviseRecommendIdArray[j]);
					productAmt=request.getParameter("investAmount_"+fpAdviseRecommendIdArray[j]);
					categoryId=request.getParameter("categoryId_"+fpAdviseRecommendIdArray[j]);
					clientApproval=request.getParameter("clientApprovalChkbx_"+fpAdviseRecommendIdArray[j]);
					actionPlan=new ActionPlan();
					actionPlan.setFpAdviseId(Integer.parseInt(fpAdviseRecommendIdArray[j]));
					if(null!=productTypeIdArray){
						actionPlan.setProductTypeId(Integer.parseInt(productTypeIdArray[i]));
					}				
					if((null!=assetClassIdArray) && (i<=assetClassIdArray.length)){
						actionPlan.setAssetClassId(Integer.parseInt(assetClassIdArray[i]));
					}				
					actionPlan.setPartyId(partyId);
					if(null!=sip && !sip.isEmpty()){
						actionPlan.setSip(sip);
					}else{
						actionPlan.setSip("0");
					}
					if(null!=lumpSum && !lumpSum.isEmpty()){
						actionPlan.setLumpSum(lumpSum);
					}else{
						actionPlan.setLumpSum("0");
					}
					
					if(null!=goalTypeId && !goalTypeId.isEmpty()){
						actionPlan.setGoalTypeId(Integer.parseInt(goalTypeId));
					}else if(null!=goalId){
						actionPlan.setGoalId(Integer.parseInt(goalId));
					}
					if(null!=clientApproval && clientApproval.equals("95002")){
						actionPlan.setActionApprovalId(Integer.parseInt(clientApproval));
					}else{
						actionPlan.setActionApprovalId(95001);
					}
					actionPlan.setGoalYear(Integer.parseInt(goalYear));
					actionPlan.setTargetAmount(targetAmount);
					actionPlan.setAllocationPercent(Float.parseFloat(allocationPercent));
					actionPlan.setProductId(Integer.parseInt(productId));
					actionPlan.setProductAmount(Double.parseDouble(productAmt));					
					if(null!=categoryId){
						actionPlan.setCategoryId(Integer.parseInt(categoryId));
					}				
					actionPlanRiskList.add(actionPlan);
				}
			}

		}

		String token = "153443";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_ACTION_PLAN + "/" + username + "/" + token+"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), actionPlanRiskList, BaseResponse.class);
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			if(null!=goalId){
				if(null!=goalTypeId && !goalTypeId.isEmpty()){
					redirectAttributes.addFlashAttribute("success", "success.retirementPlanningActionPlan.dataSave");
				}else{
					redirectAttributes.addFlashAttribute("success", "success.goalActionPlan.dataSave");
				}
				
			}else{
				redirectAttributes.addFlashAttribute("success", "success.emergencyReadinessActionPlan.dataSave");
			}					
			for(int i=((productTypeIdArray.length)-1);i>=0;i--){
				if(null!=productTypeIdArray){
					allocationPercent=request.getParameter("allocationPercent_"+productTypeIdArray[i]);
				}else{
					allocationPercent=request.getParameter("allocationPercent_"+assetClassIdArray[i]);
				}
				fpAdviseRecommendIds=request.getParameter("fpAdviseIds_"+productTypeIdArray[i]);
				if(null!=fpAdviseRecommendIds){
					fpAdviseRecommendIdArray=fpAdviseRecommendIds.split(",");
					for(int j=((fpAdviseRecommendIdArray.length)-1);j>=0;j--){
						productAmt=request.getParameter("investAmount_"+fpAdviseRecommendIdArray[j]);
						productName = request.getParameter("productName_"+fpAdviseRecommendIdArray[j]);
						clientApproval=request.getParameter("clientApprovalChkbx_"+fpAdviseRecommendIdArray[j]);
						String flag = request.getParameter("apporvalFlag_"+fpAdviseRecommendIdArray[j]);
						if( null == flag || flag.isEmpty()) {
							flag = "0";
						}
						if(null != clientApproval && clientApproval.equals("95002") && flag.equals("0")) {
							sendNotification(username, buId, goalType, goalName, productAmt, goalFrequencyName, productName, userSession.getUserId(), partyId, request.getSession().getId());
						}
					}
				}
			}
			
		}else{
			if(null!=goalId){
				if(null!=goalTypeId && !goalTypeId.isEmpty()){
					redirectAttributes.addFlashAttribute("error", "error.retirementPlanningActionPlan.dataSave");
				}else{
					redirectAttributes.addFlashAttribute("error", "error.goalActionPlan.dataSave");
				}
				
			}else{
				redirectAttributes.addFlashAttribute("error", "error.emergencyReadinessActionPlan.dataSave");
			}				
		}
		///user/153443?buId=153
		if(null!=goalId){
			if(null!=goalTypeId && !goalTypeId.isEmpty()){
				return "redirect:/"+redirectURL+"/"+partyId+"/null?goalTypeId="+goalTypeId;
			}else{
				return "redirect:/"+redirectURL+"/"+partyId+"/"+goalId+"?investmentType="+investmentType;
			}
			
		}else{
			return "redirect:/"+redirectURL+"/"+partyId;
		}		
	}
	
	private String sendNotification(String username,Integer buId,String goalType, String goalName,String sipAmount,String sipFrequency,String productName,Integer userId,Integer partyId,String sessionId)
	{
		Notification notification = null;
		Map<String,String> payloadMap=new HashMap<String, String>();
		payloadMap.put("goalTypeName",goalType);
		payloadMap.put("goalName",goalName);
		payloadMap.put("sipAmount",sipAmount);
		if( sipFrequency != null ) {
			payloadMap.put("sipFrequency",sipFrequency);
		}else {
			payloadMap.put("sipFrequency","");
		}
		payloadMap.put("productName",productName);
		notification=new Notification();
		notification.setSourceSystemID(FiinfraConstants.DIY);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(partyId);
		notification.setNotifyEventID(FiinfraConstants.EXECUTION_APPROVAL_TO_CLIENT);
		//notification.setDeliveryChannelID(32001);
		notification.setNotifyUserID(userId);
		notification.setSessionID(sessionId);
		notification.setBuId(buId);
		notification.setPayloadMap(payloadMap);
		FrameworkUtil.notify(notification);
		return null;
	}
}
