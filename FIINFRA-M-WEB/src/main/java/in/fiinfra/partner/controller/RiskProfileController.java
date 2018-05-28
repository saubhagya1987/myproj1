package in.fiinfra.partner.controller;

import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.utility.QuestionDetails;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/riskProfile")
public class RiskProfileController {
	
	private static final Logger LOGGER = Logger.getLogger(PartnerProfileController.class);
	private static final String DC_XML = "DCInputFields.xml";
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Value("${FETCH_DC_INPUTDATA}")
	private String FETCH_DC_INPUTDATA;
	
	@Value("${GET_ANALYSIS_FOR_RISK_PROFILE}")
	private String GET_ANALYSIS_FOR_RISK_PROFILE;
	
	@Value("${GET_RECOMMENDATION_ASSET_URL}")
	private String GET_RECOMMENDATION_ASSET;
	
	 @Value("${UPDATE_FPACTIVITY_TRACKER}") 
	 private String UPDATE_FPACTIVITY_TRACKER;
	 
	@Autowired
	private CommonController commonController;

	@RequestMapping(value="/datacollection/risk-profile/{partyId}", method = RequestMethod.GET)
	public String getRiskProfileData(@PathVariable("partyId") String partyId,HttpServletRequest request,Model m)
	{
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 333);// risk profile links
			m.addAttribute("rbsLinks",rbsLinks);
			String userName=userSession.getUserName();
			String questionBankId = "30";
			String sectionTypeId = "39009";
			String buId = userSession.getBuId().toString();
			String token = "12345";
			int advisorPartyId=userSession.getPartyId();
			String xmlData = getXmlForSectionType(sectionTypeId, request);
						
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, buId, sectionTypeId, questionBankId);
			
			
			if(questionDetails.isEmpty()){
				m.addAttribute("flag",false);
			}
			else
			{
				m.addAttribute("flag",true);
			}
			
			//to set current stage id to partially activated activated
			  /*UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7007/"+partyId+"/342");
			  uri.queryParam("buId", userSession.getBuId());
			  BaseResponse<Boolean> br = new BaseResponse<Boolean>();
			  br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);*/
			
			BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
			baseResponse  =  restTemplate.getForObject(GET_ANALYSIS_FOR_RISK_PROFILE+"/"+userName+"/"+token+"/"+advisorPartyId+"/"+partyId+"?buId="+buId, BaseResponse.class);
			if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				try 
				{
					Integer analysisResult= objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), Integer.class);					
					
					if(analysisResult.equals(new Integer("40001"))){
						m.addAttribute("riskProfile","Conservative");
					}else if(analysisResult.equals(new Integer("40002"))){
						m.addAttribute("riskProfile","Balanced");
					}else if(analysisResult.equals(new Integer("40003"))){
						m.addAttribute("riskProfile","Aggressive");
					}
				}catch(NullPointerException nex){
					LOGGER.error("Risk profile not determined...",nex);
					m.addAttribute("riskProfile","To be determined");
				}catch(Exception ex){
					LOGGER.error("Error fetching risk profile data...",ex);
				}
			}else{
				m.addAttribute("riskProfile","To be determined");
			}
			
			m.addAttribute("sectionData", xmlData);		
			m.addAttribute("questionBankId", questionBankId);
			m.addAttribute("sectionTypeId", sectionTypeId);
			m.addAttribute("partyId", partyId);
			m.addAttribute("redirectUrl", "/riskProfile/datacollection/risk-profile/" + partyId);
/*			m.addAttribute("previousPageUrl", "/partner/datacollection/" + partyId+"/"+request.getSession().getAttribute("headerName")+"/1");
			m.addAttribute("nextPageUrl", "/partner/datacollection/risk-cover/" + partyId);*/
			m.addAttribute("questionDetailsList", questionDetails);
	
		}catch(Exception ex){
			LOGGER.error(ex);
			m.addAttribute("errorMsg", "Error Fetching Data");
		}
		return "riskProfile/dataCollection/risk-profile";
	}
	
	@RequestMapping(value="/riskProfileAnalysis/{contactPartyId}", method = RequestMethod.GET)
	public String getRiskProfileAnalysis(@PathVariable("contactPartyId") String contactPartyId,HttpServletRequest request,Model m)
	{
		String userName="";
		int advisorPartyId=0;
		Integer buId = 153; //userSession.getBuId();
		String token = "12345";
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			userName=userSession.getUserName();
			advisorPartyId=userSession.getPartyId();
		}catch(Exception ex){
			LOGGER.error("Error occured while fetching user details in PartnerProfileController/getGoals : ", ex);
		}
		
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse  =  restTemplate.getForObject(GET_ANALYSIS_FOR_RISK_PROFILE+"/"+userName+"/"+token+"/"+advisorPartyId+"/"+contactPartyId+"?buId="+buId, BaseResponse.class);
		if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			try 
			{
				Integer analysisResult= objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), Integer.class);
				Map<String, String> riskProfileMap=getRecommendationData(request,analysisResult);
				m.addAttribute("analysisResult",analysisResult);
				m.addAttribute("riskProfileMap",riskProfileMap);
				m.addAttribute("partyId",contactPartyId);
			}catch(Exception ex){
				LOGGER.error("Error fetching risk profile analysis data...",ex);
			}
		}
		return "riskProfile/riskProfileAnalysis";
		
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
	
	private Map<String, String> getRecommendationData(HttpServletRequest request, Integer riskProfileId){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String username = null;
		Integer partnerPartyId = null;
		Integer buPartyId = null;
		Integer buId = null;
		String token = null;
		
		if(userSession != null){
			username = userSession.getName();
			partnerPartyId = userSession.getPartyId();
			buPartyId = 27827;//userSession.getBuId();//27828 
			buId = userSession.getBuId();			
		}
		else{
			return null;
		}
		token = "153443";
		UriComponentsBuilder uriCB;
		Map<Integer, List<AdviceRecommendation>> recommendationMap = null;
		GoalPlanInput goalPlanInput = new GoalPlanInput();
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_RECOMMENDATION_ASSET+ "/" +username + "/" +token +"?buId="+buId);
		
		goalPlanInput.setBuPartyId(buPartyId);
		goalPlanInput.setPartnerPartyId(partnerPartyId);
		goalPlanInput.setSectionTypeId(39005); // 47010  - goal planning (need constant )
		String assetClassId = "46001,46002,46003"; //code valued id for Equity (93002), Debt (93001)  and Gold (93003)
		goalPlanInput.setAssetClassId(assetClassId);
		 
		goalPlanInput.setRiskProfileId(riskProfileId);
		Integer recordTypeId= 50001;
		goalPlanInput.setRecommendationRecordTypeId(recordTypeId);
		BaseResponse<Map<Integer, List<AdviceRecommendation>>> baseResponse = null;
		Map<String, String> goalDataMap = null;
		
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalPlanInput, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {				
				List<AdviceRecommendation> goalDataList =  new ArrayList<AdviceRecommendation>();
				List<AdviceRecommendation> goalJsonDataList = null;
				goalJsonDataList = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i=0;i<goalJsonDataList.size();i++){
					AdviceRecommendation adviceRecommendation = objectMapper.readValue(objectMapper.writeValueAsString(goalJsonDataList.get(i)), AdviceRecommendation.class);
					goalDataList.add(adviceRecommendation);
				}
				
				goalDataMap = buildYearWiseMap(goalDataList);
				
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
			
		return goalDataMap;
	}
	
	private Map<String, String> buildYearWiseMap(List<AdviceRecommendation> goalDataList) {
		Map<String, String> recommendationMap;
		String goalWiseRecommedation = null;
		recommendationMap = new LinkedHashMap<String, String>();
		StringBuilder assetWisePercentString=new StringBuilder();
		
		for(AdviceRecommendation recommendation : goalDataList){			
			   if(recommendationMap.containsKey(recommendation.getGoalYearRange())){
				    assetWisePercentString=new StringBuilder();
				    goalWiseRecommedation = recommendationMap.get(recommendation.getGoalYearRange());
				    assetWisePercentString.append(goalWiseRecommedation+recommendation.getAssetClassId()+"_"+recommendation.getAllocationPercent()+"/");
				    recommendationMap.put(recommendation.getGoalYearRange(), assetWisePercentString.toString());
				   }else{
				    assetWisePercentString=new StringBuilder();
				    assetWisePercentString.append(recommendation.getAssetClassId()+"_"+recommendation.getAllocationPercent()+"/");
				    recommendationMap.put(recommendation.getGoalYearRange(), assetWisePercentString.toString());
				   }
		}
		return recommendationMap;				
	}
	
}
