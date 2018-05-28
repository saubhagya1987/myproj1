package in.fiinfra.whatIf;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalAttribute;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartySetting;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.diy.models.WhatIfData;
import in.fiinfra.common.partner.AssetAllocatedToGoal;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.WhatIfOutPutData;
import in.fiinfra.common.utility.CurrentFinancialStatusData;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.framework.models.Audit;
//import in.fiinfra.partner.controller.AssumptionController;
import in.fiinfra.partner.controller.FutureFinancialDcController;
import in.fiinfra.partner.controller.PartnerProfileController;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.ibm.icu.text.DecimalFormat;

@Controller
@RequestMapping("/whatIf")
public class WhatIfController {
	
	@Value("${SAVE_FUTURE_GOALS_URL}")
	private String SAVE_FUTURE_GOALS;
	
	@Value("${GET_GOALS_FOR_PARTYID}")
	private String GET_GOALS_FOR_PARTYID;
	
	@Value("${GET_FUTURE_GOALS_FOR_GOAL_ID_FOR_URL}")
	private String GET_FUTURE_GOALS_FOR_GOAL_ID;
	
	@Value("${GET_SUB_CAT_ID_FOR_CAR_IN_WHATIF}")
	private String GET_SUB_CAT_ID_FOR_CAR_IN_WHATIF;
	
	@Value("${GET_WHATIF_ANALYSIS_DATA}")
	private String GET_WHATIF_ANALYSIS_DATA;
	
	@Value("${SAVE_WHAT_IF_ANALYSIS}")
	private String SAVE_WHAT_IF_ANALYSIS; 
	
	@Value("${GET_SUGGESTION_DATA}")
	private String GET_SUGGESTION_DATA;
	
	@Value("${GET_ASSUMPTIONS}")
	private String GET_ASSUMPTIONS;
	
	@Value("${SAVE_ASSET_ALLOCATION_FOR_RETIREMENT}") 
	private String SAVE_ASSET_ALLOCATION_FOR_RETIREMENT;
	
	@Value("${FETCH_DC_INPUTDATA}")
	private String FETCH_DC_INPUTDATA;
	
	@Value("${UPDATE_FPACTIVITY_TRACKER}") 
	private String UPDATE_FPACTIVITY_TRACKER;
	
	@Value("${SAVE_DC_INPUT}")
	private String SAVE_DC_INPUT;
	
	@Value("${SAVE_SUGGESTION_DATA}")
	private String SAVE_SUGGESTION_DATA;
	
	@Value("${GET_ANALYSIS_FOR_GOALS_URL}")
	private String GET_ANALYSIS_FOR_GOALS_URL;
	
	@Value("${GET_NUMBER_OF_GOALS_FOR_GOALTYPE_ID}") 
	private String GET_NUMBER_OF_GOALS_FOR_GOALTYPE_ID;
	
	@Value("${GET_ASSETSUMMARY_URL}")
	private String GET_ASSETS;
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Autowired
	private CommonController commonController;
	
	String partyId = null;
	private static final String DC_XML = "DCInputFields.xml";
	private static final String CFS_SOURCE="Current Financial Status";
	private static final String DC_SOURCE="Data Collection";
	private AdviceAssumption healthAssumtion;
	private Integer scale;
	
	List<WhatIfData> whatIfDataList = new ArrayList<WhatIfData>();
	List<WhatIfOutPutData> whatIfOutPutDataList = null;
	
	Double equityValue = 0.0;
	Double debtValue = 0.0;
	Double goldValue = 0.0;
	Double inflationRate = 0.0;
	
	private static final Logger LOGGER = Logger.getLogger(WhatIfController.class);
	
	@RequestMapping(value = "/graph/{partyId}")
	private String displayGraph(@PathVariable String partyId,Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes)
	{
		this.partyId = partyId;
			
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String token = "4321";
		List<WhatIfData> whatIfDataListJsonData = new ArrayList<WhatIfData>();
		List<WhatIfData> whatIfDataList =  new ArrayList<WhatIfData>();
		BaseResponse<WhatIfData> baseResponse = new BaseResponse<WhatIfData>();
		Integer buId = userSession.getBuId();
		String user = userSession.getUserName();
		Integer lifeExpectancy = 55; 
		String headerName =(String) request.getSession().getAttribute("headerName");
		
		// getting  percentage
	     
	     Integer partnerPartyId = userSession.getPartyId();
	     String attributeCodeIds = "98021,98028,98020,98045,98047";
			
			Integer clientPartyId=Integer.parseInt(partyId);
			//String clientParty = partyId;
			
			model.addAttribute("clientPartyId", clientPartyId);
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSUMPTIONS + "/" + token +"?buId="+buId);
			List<AdviceAssumption> assumptionList = new ArrayList<AdviceAssumption>();
			
			List<PartySetting> partySettingListAsJson = new ArrayList<PartySetting>();
			BaseResponse<PartySetting> baseResponseParty = new BaseResponse<PartySetting>();
			
			//List<AdviceAssumption> adviceAssumptionList = new ArrayList<AdviceAssumption>();
			PartySettingInput partySettingInput = new PartySettingInput();
			
			partySettingInput.setClientPartyId(clientPartyId);
			partySettingInput.setPartnerPartyId(partnerPartyId);
			partySettingInput.setBuPartyId(buId);
			partySettingInput.setAssumptionCodeIds(attributeCodeIds);
			baseResponseParty = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partySettingInput, BaseResponse.class);
			if (baseResponseParty.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				try {
					partySettingListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponseParty.getResponseListObject()), List.class);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			}
			
			for(int i = 0; i<partySettingListAsJson.size(); i++)
			{
				try{
					AdviceAssumption adviceAssumption = new AdviceAssumption();
					adviceAssumption = objectMapper.readValue(objectMapper.writeValueAsString(partySettingListAsJson.get(i)), AdviceAssumption.class);	
					
					if(adviceAssumption.getAssumptionCodeId() == 98028 )
					{
						equityValue =  Double.parseDouble(adviceAssumption.getAssumptionValue().toString());
						equityValue = equityValue/100.00;
						
					}else if(adviceAssumption.getAssumptionCodeId() == 98020 )
					{
						debtValue = Double.parseDouble(adviceAssumption.getAssumptionValue().toString());
						debtValue = debtValue/100.00;
						
					}else if(adviceAssumption.getAssumptionCodeId()==98045)
					{
						goldValue = Double.parseDouble(adviceAssumption.getAssumptionValue().toString());
						goldValue = goldValue/100.00;
					}
					else if(adviceAssumption.getAssumptionCodeId()==98047)
					{
						inflationRate = Double.parseDouble(adviceAssumption.getAssumptionValue().toString());
						inflationRate = inflationRate/100.00;
					}
					// for Life Expectancy
					else if(adviceAssumption.getAssumptionCodeId()==98021)
					{
						lifeExpectancy = Integer.parseInt(adviceAssumption.getAssumptionValue().toString());
					}

					
					//LOGGER.debug("############============Data=================>"+adviceAssumption);
					//LOGGER.debug("############============Value=================>"+adviceAssumption.getAssumptionValue());
					
				   }catch(Exception e){ e.printStackTrace();}
				 
							
			} 
		
		
		// end of percentage
			
		// getting what if data	
		
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_WHATIF_ANALYSIS_DATA+"/"+partyId+"/"+user+"/"+token);
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
		 Double totalCurrentAsset=0.0;
		 
		 Double totalCurrentAssetIR=0.0;
		 Double toatalMonthlyInvestmentIR = 0.0;
		 
		 try{
		 for(int i=0;i<this.whatIfDataList.size();i++)
		 {
			 WhatIfData data = this.whatIfDataList.get(i);
			 if(data.getMonthlyInvest()!=null)
			 {
				 toatalMonthlyInvestment = toatalMonthlyInvestment + Double.parseDouble(data.getMonthlyInvest());
			 }
			 if(data.getCurrentValue()!=null)
			 {
				 toatalInitialAsset = toatalInitialAsset + (Double.parseDouble(data.getCurrentValue())*Double.parseDouble(data.getAvailableToGoals()))/100;
			 }
			 //LOGGER.debug("#+++++++++++++++++++++++++==Innitial assert value==========>"+toatalInitialAsset);
			 if(data.getCurrentValue()!=null)
			 {
				 totalCurrentAsset = totalCurrentAsset + Double.parseDouble(data.getCurrentValue()); 
			 }
			 if(data.getAssetClassName().equals("Equity"))
			 {
				 if(data.getCurrentValue()!=null)
				 {
					 totalCurrentAssetIR = totalCurrentAssetIR + (Double.parseDouble(data.getCurrentValue()))*equityValue;
				 }
				 if(data.getMonthlyInvest()!=null)
				 {
					 toatalMonthlyInvestmentIR = toatalMonthlyInvestmentIR + (Double.parseDouble(data.getMonthlyInvest()))*equityValue;
				 }
			 }
			 else if(data.getAssetClassName().equals("Debt"))
			 {
				 if(data.getCurrentValue()!=null)
				 {
					 totalCurrentAssetIR = totalCurrentAssetIR + (Double.parseDouble(data.getCurrentValue()))*debtValue;
				 }
				 if(data.getMonthlyInvest()!=null)
				 {
					 toatalMonthlyInvestmentIR = toatalMonthlyInvestmentIR + (Double.parseDouble(data.getMonthlyInvest()))*debtValue;
				 }
			 }
			 else if(data.getAssetClassName().equals("Gold"))
			 {
				 if(data.getCurrentValue()!=null)
				 {
					 totalCurrentAssetIR = totalCurrentAssetIR + (Double.parseDouble(data.getCurrentValue()))*goldValue;
				 }
				 if(data.getMonthlyInvest()!=null)
				 {
					 toatalMonthlyInvestmentIR = toatalMonthlyInvestmentIR + (Double.parseDouble(data.getMonthlyInvest()))*goldValue;
				 }
			 }
			 //LOGGER.debug("###########=================What if Data =======>"+data.getAssetClassName());
			 
		 }
		 }catch(Exception e){ e.printStackTrace();}
		 
		 // for advance pfplan
		 if(userSession.getPlanTypeId() == 522002)
		 {
			 
			 token = "153443";
			 UriComponentsBuilder uriCBForAsset = UriComponentsBuilder.fromHttpUrl(GET_ASSETS +  "/" + userSession.getUserName() + "/" + partyId + "/" + token);
			 uriCBForAsset.queryParam("buId", userSession.getBuId());
				
			 List<AssetAllocatedToGoal> assetDataListAsJson = new ArrayList<AssetAllocatedToGoal>();
			 AssetAllocatedToGoal assetSummary = new AssetAllocatedToGoal();
			 
			 BaseResponse<AssetAllocatedToGoal> baseResponseForAsset = new BaseResponse<AssetAllocatedToGoal>();
			 baseResponseForAsset = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCBForAsset), BaseResponse.class);
			 
			 double mfCurrentAssetValue = 0.0;
				double mfAssetAllocatedValue = 0.0;
				Integer mfNoOfGoals = 0;
				String mfPrv = "0";
				String mfAssetId ="";
				
				double depositsCurrentAssetValue = 0.0;
				double depositsAssetAllocatedValue = 0.0;
				Integer depositsNoOfGoals = 0;
				String dpPrv = "0";
				String dpAssetId ="";
				
				double sharesCurrentAssetValue = 0.0;
				double sharesAssetAllocatedValue = 0.0;
				Integer sharesNoOfGoals = 0;
				String sharePrv = "0";
				String shareAssetId ="";
				
				double retirementCurrentAssetValue = 0.0;
				double retirementAssetAllocatedValue = 0.0;
				Integer retirementNoOfGoals = 0;
				String rePrv = "0";
				String reAssetId ="";
				
				double goldCurrentAssetValue = 0.0;
				double goldAssetAllocatedValue = 0.0;
				Integer goldNoOfGoals = 0;
				String goldPrv = "0";
				String goldAssetId ="";
				
				double propertyCurrentAssetValue = 0.0;
				double propertyAssetAllocatedValue = 0.0;
				Integer propertyNoOfGoals = 0;
				String proPrv = "0";
				String proAssetId ="";
				
				double insuranceCurrentAssetValue = 0.0;
				double insuranceAssetAllocatedValue = 0.0;
				Integer insuranceNoOfGoals = 0;
				String insPrv = "0";
				String insAssetId ="";
				
				double otherCurrentAssetValue = 0.0;
				double otherAssetAllocatedValue = 0.0;
				Integer otherNoOfGoals = 0;
				String otherPrv = "0";
				String otherAssetId ="";
			 
			    double totalAssetValue = 0.0;
			 
			 if (baseResponseForAsset.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
					try {
						assetDataListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponseForAsset.getResponseListObject()), List.class);
						for(int i = 0; i<assetDataListAsJson.size(); i++){										
							assetSummary = new AssetAllocatedToGoal();
							assetSummary = objectMapper.readValue(objectMapper.writeValueAsString(assetDataListAsJson.get(i)), AssetAllocatedToGoal.class);
							
							if(assetSummary.getAssetTypeId().equals("48052") || assetSummary.getAssetTypeId().equals("48053") || assetSummary.getAssetTypeId().equals("48011")){
								//bankDeposits
								//assetTypeId = 72003;
								if(!dpAssetId.contains(assetSummary.getPartyAssetId())){
									dpAssetId +="_"+assetSummary.getPartyAssetId().toString(); 
									depositsCurrentAssetValue = depositsCurrentAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
									totalAssetValue = totalAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
								}
								
								if(!assetSummary.getGoalId().equals("0") && !assetSummary.getGoalId().equals(dpPrv) ){
									dpPrv = assetSummary.getGoalId();
									depositsNoOfGoals = depositsNoOfGoals + 1;
								}
								
								depositsAssetAllocatedValue = depositsAssetAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
							//	totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
							}else if(assetSummary.getAssetTypeId().equals("48008")||assetSummary.getAssetTypeId().equals("48012")){
								//retirement
								//assetTypeId = ;
								if(!reAssetId.contains(assetSummary.getPartyAssetId())){
									reAssetId +="_"+assetSummary.getPartyAssetId().toString();
									retirementCurrentAssetValue = retirementCurrentAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
									totalAssetValue = totalAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
								}
								
								if(!assetSummary.getGoalId().equals("0") && !assetSummary.getGoalId().equals(rePrv) ){
									rePrv = assetSummary.getGoalId();
									retirementNoOfGoals = retirementNoOfGoals + 1;
								}
								
								retirementAssetAllocatedValue = retirementAssetAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
								//totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
							}else if(assetSummary.getAssetTypeId().equals("48001") || assetSummary.getAssetTypeId().equals("48002") || assetSummary.getAssetTypeId().equals("48003") || assetSummary.getAssetTypeId().equals("48004")
									 || assetSummary.getAssetTypeId().equals("48017") || assetSummary.getAssetTypeId().equals("48018") || assetSummary.getAssetTypeId().equals("48019")
									 || assetSummary.getAssetTypeId().equals("48020") || assetSummary.getAssetTypeId().equals("48021") || assetSummary.getAssetTypeId().equals("48023") || assetSummary.getAssetTypeId().equals("48051")
									 || assetSummary.getAssetTypeId().equals("48057") || assetSummary.getAssetTypeId().equals("47001") || assetSummary.getAssetTypeId().equals("47004") || assetSummary.getAssetTypeId().equals("47005")){
								//mutual funds
								//assetTypeId = 72004;
								if(!mfAssetId.contains(assetSummary.getPartyAssetId())){
									mfAssetId +="_"+assetSummary.getPartyAssetId().toString();
									mfCurrentAssetValue = mfCurrentAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
									totalAssetValue = totalAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
								}
								
								if(!assetSummary.getGoalId().equals("0") && !assetSummary.getGoalId().equals(mfPrv) ){
									mfPrv = assetSummary.getGoalId();
									mfNoOfGoals = mfNoOfGoals + 1;
								}
								
								mfAssetAllocatedValue = mfAssetAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
								//totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
							}else if(assetSummary.getAssetTypeId().equals("48022")){
								//gold
								//assetTypeId = 72006;
								if(!goldAssetId.contains(assetSummary.getPartyAssetId())){
									goldAssetId +="_"+assetSummary.getPartyAssetId().toString();
									goldCurrentAssetValue = goldCurrentAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
									totalAssetValue = totalAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
								}
								
								if(!assetSummary.getGoalId().equals("0") && !assetSummary.getGoalId().equals(goldPrv)){
									goldPrv = assetSummary.getGoalId();
									goldNoOfGoals = goldNoOfGoals + 1;
								}
								
								goldAssetAllocatedValue = goldAssetAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
								//totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
							}else if(assetSummary.getAssetTypeId().equals("48047") || assetSummary.getAssetTypeId().equals("48039") || assetSummary.getAssetTypeId().equals("48040")){
								//property
								//assetTypeId = 72002;
								if(!proAssetId.contains(assetSummary.getPartyAssetId())){
									proAssetId +="_"+assetSummary.getPartyAssetId().toString();
									propertyCurrentAssetValue = propertyCurrentAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
									totalAssetValue = totalAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
								}
								
								if(!assetSummary.getGoalId().equals("0") && !assetSummary.getGoalId().equals(proPrv)){
									proPrv = assetSummary.getGoalId();
									propertyNoOfGoals = propertyNoOfGoals + 1;
								}
								
								propertyAssetAllocatedValue = propertyAssetAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
								//totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
							}else if(assetSummary.getAssetTypeId().equals("48006") || assetSummary.getAssetTypeId().equals("48005") || assetSummary.getAssetTypeId().equals("48007")){
								//stock
								//assetTypeId = 72001;
								if(!shareAssetId.contains(assetSummary.getPartyAssetId())){
									shareAssetId +="_"+assetSummary.getPartyAssetId().toString();
									sharesCurrentAssetValue = sharesCurrentAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
									totalAssetValue = totalAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
								}
								
								if(!assetSummary.getGoalId().equals("0") && !assetSummary.getGoalId().equals(sharePrv)){
									sharePrv = assetSummary.getGoalId();
									sharesNoOfGoals = sharesNoOfGoals + 1;
								}
								
								sharesAssetAllocatedValue = sharesAssetAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
								//totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
							}else if(assetSummary.getAssetTypeId().equals("48048") || assetSummary.getAssetTypeId().equals("48049") || assetSummary.getAssetTypeId().equals("48059") || assetSummary.getAssetTypeId().equals("48060")){
								// other
								//assetTypeId = 72007
								if(!otherAssetId.contains(assetSummary.getPartyAssetId())){
									otherAssetId +="_"+assetSummary.getPartyAssetId().toString();
									otherCurrentAssetValue = otherCurrentAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
									totalAssetValue = totalAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
								}
								
								if(!assetSummary.getGoalId().equals("0") && !assetSummary.getGoalId().equals(otherPrv)){
									otherPrv = assetSummary.getGoalId();
									otherNoOfGoals = otherNoOfGoals + 1;
								}
								
								otherAssetAllocatedValue = otherAssetAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
								//totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
							}else if(assetSummary.getAssetTypeId().equals("48029") || assetSummary.getAssetTypeId().equals("48030") || assetSummary.getAssetTypeId().equals("48032")){
								
								//insurance
								if(!insAssetId.contains(assetSummary.getPartyAssetId())){
									insAssetId +="_"+assetSummary.getPartyAssetId().toString();
									insuranceCurrentAssetValue = insuranceCurrentAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
									totalAssetValue = totalAssetValue + Double.parseDouble(assetSummary.getCurrentValue());
								}
								
								if(!assetSummary.getGoalId().equals("0") && !assetSummary.getGoalId().equals(insPrv)){
									insPrv = assetSummary.getGoalId();
									insuranceNoOfGoals = insuranceNoOfGoals + 1;
								}
								
								insuranceAssetAllocatedValue = insuranceAssetAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
								//totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
							}
												
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
			 
			 
			 String questionBankId = "29";
				String sectionTypeId = "39005";
				Double totalValueOfBasic = 0.0; 
				String basicValueContains = ""; 
				List<QuestionDetails> questionDetails = getDcInputDataNew(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
				if(questionDetails!=null){
				for(int i=0;i<questionDetails.size();i++)
				{
					QuestionDetails details = questionDetails.get(i);
					
					if(details.getAttributeValue().equals("94027"))
					{
						if(!basicValueContains.contains(details.getAttributeValue()) && sharesCurrentAssetValue<=0.0){
						totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
						basicValueContains = basicValueContains+"_"+details.getAttributeValue();
						}
						model.addAttribute("SharesAmount",details.getAttributeRefferenceValue());
					}
					else if(details.getAttributeValue().equals("94028"))
					{
						if(!basicValueContains.contains(details.getAttributeValue())&& propertyCurrentAssetValue<=0.0){
							totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
							basicValueContains = basicValueContains+"_"+details.getAttributeValue();
							}
						model.addAttribute("PropertyAmount",details.getAttributeRefferenceValue());
					}
					else if(details.getAttributeValue().equals("94029"))
					{
						if(!basicValueContains.contains(details.getAttributeValue()) && depositsCurrentAssetValue<=0.0){
							totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
							basicValueContains = basicValueContains+"_"+details.getAttributeValue();
						}
						model.addAttribute("DepositsAmount",details.getAttributeRefferenceValue());
					}
					else if(details.getAttributeValue().equals("94030"))
					{
						if(!basicValueContains.contains(details.getAttributeValue()) && mfCurrentAssetValue<=0.0){
							totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
							basicValueContains = basicValueContains+"_"+details.getAttributeValue();
						}
						model.addAttribute("MFAmount",details.getAttributeRefferenceValue());
					}
					else if(details.getAttributeValue().equals("94031"))
					{
						//totalValueOfBasic += Double.parseDouble(details.getAttributeRefferenceValue());
						model.addAttribute("BondsAmount",details.getAttributeRefferenceValue());
					}
					else if(details.getAttributeValue().equals("94032"))
					{
						if(!basicValueContains.contains(details.getAttributeValue()) && goldCurrentAssetValue<=0.0){
							totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
							basicValueContains = basicValueContains+"_"+details.getAttributeValue();
						}
						model.addAttribute("GoldAmount",details.getAttributeRefferenceValue());
					}
					else if(details.getAttributeValue().equals("94033"))
					{
						if(!basicValueContains.contains(details.getAttributeValue()) && otherCurrentAssetValue<=0.0){
							totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
							basicValueContains = basicValueContains+"_"+details.getAttributeValue();
						}
						model.addAttribute("OtherAmount",details.getAttributeRefferenceValue());
					}
				 }
				}
				questionBankId = "29";
				sectionTypeId = "39006";
				questionDetails = getDcInputDataNew(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
				if(questionDetails!=null){
				for(int i=0;i<questionDetails.size();i++)
				{
					QuestionDetails details = questionDetails.get(i);
					
					if(details.getAttributeValue().equals("94051"))
					{
						if(!basicValueContains.contains(details.getAttributeValue()) && retirementCurrentAssetValue<=0.0){
							totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
							basicValueContains = basicValueContains+"_"+details.getAttributeValue();
						}
						model.addAttribute("RetirementAmount",details.getAttributeRefferenceValue());
					}
				 }
				}
				questionBankId = "29";
				sectionTypeId = "39003";
				questionDetails = getDcInputDataNew(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
				if(questionDetails!=null){
				for(int i=0;i<questionDetails.size();i++)
				{
					QuestionDetails details = questionDetails.get(i);
					
					if(details.getQuestionId().equals("94018"))
					{
						if(!basicValueContains.contains(details.getQuestionId()) && insuranceCurrentAssetValue<=0.0){
							totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
							basicValueContains = basicValueContains+"_"+details.getQuestionId();
						}
						model.addAttribute("LifeInsuranceAmount",details.getAttributeRefferenceValue());
					}
					
				 }	
				}
				model.addAttribute("totalValueOfBasic",totalValueOfBasic);
				
			 
			 
			 if(totalAssetValue>0.0)
			 {
			 toatalInitialAsset = totalAssetValue+totalValueOfBasic;
			 
			 DecimalFormat df = new DecimalFormat("#.##"); 
			 toatalMonthlyInvestment = Double.valueOf(df.format(totalAssetValue/12));
			 
			 }
		 }
		 // end of Advance pfplan
		 model.addAttribute("toatalMonthlyInvestment",toatalMonthlyInvestment);
		 model.addAttribute("toatalInitialAsset",toatalInitialAsset);
		 
		 model.addAttribute("lumpsumPerc", totalCurrentAssetIR/totalCurrentAsset);  // percentage for Current asset value
		 model.addAttribute("ongoingPerc", toatalMonthlyInvestmentIR/toatalMonthlyInvestment); // percentage for monthly investment
		 model.addAttribute("retirementPerc",debtValue); // percentage for retirement
		 
		 model.addAttribute("inflationRate",inflationRate); // inflationRate
		 
		 // It give current year
		 Date date = new Date();
		 Calendar calendar = Calendar.getInstance();
		 calendar.setTime(date);
		 int year = calendar.get(Calendar.YEAR);
		 model.addAttribute("startYear",year);
		 // end 
	
		 // called api to get retirment data
		 
	     try{
				Suggestion suggestion = new Suggestion();
				uriCB = UriComponentsBuilder.fromHttpUrl(GET_SUGGESTION_DATA + "/" + partyId + "/"+"RP"+"/" + user + "/" + "12345");			
				uriCB.queryParam("buId", buId);
				BaseResponse<Suggestion> br = new BaseResponse<Suggestion>();
							
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{
					suggestion = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Suggestion.class);
					
					//model.addAttribute("retirementYear",suggestion.getGoalYear());
					
					double  corpusNeeded = Math.round((Double.parseDouble(suggestion.getCorpusNeeded()) / 100000.00)*100);
					corpusNeeded = corpusNeeded/100; 
					//model.addAttribute("retirementAmountNeeded",corpusNeeded);
					
					double corpusAccumulated = Math.round((Double.parseDouble(suggestion.getCorpusAccumulated()))*100);
					corpusAccumulated = corpusAccumulated/100;
					model.addAttribute("retirementAmountAvailable",corpusAccumulated);
					
				}
				
				//LOGGER.debug("############============Suggesstion=================>"+suggestion);	
				
	     }catch(Exception e){}	
	     try
			{
				
				GoalData goalData = new GoalData();
				uriCB = UriComponentsBuilder.fromHttpUrl(GET_ANALYSIS_FOR_GOALS_URL+"/"+partyId+"/"+0+"/"+35015+"/"+user+"/1234");
				uriCB.queryParam("buId", buId);
				BaseResponse<GoalData> brForGoalData = new BaseResponse<GoalData>();
				brForGoalData = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				if (brForGoalData.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{
					
					goalData = objectMapper.readValue(objectMapper.writeValueAsString(brForGoalData.getResponseObject()), GoalData.class);
					model.addAttribute("retirementYear",goalData.getGoalStartYear());
					model.addAttribute("retirementAmountNeeded",goalData.getGoalAmountPv());
					model.addAttribute("retirementFV",goalData.getGoalAmountFv());
				}
				
				
				LOGGER.debug("############============Goal Data=================>"+goalData.getGoalInflationRate());	
				
				
			}catch(Exception exc){}
			
	     
	     
		 // end of get retirement data
	     
	     /*if(toatalInitialAsset<=0 || toatalMonthlyInvestment<=0 )
	     {
	    	 redirectAttributes.addFlashAttribute("error", "error.whatIf.emptyData");
	    	 return "redirect:/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/2"; 
	     } 
	     else
	     {
	    	 return "whatIf/graph";
	     }*/
	     
	     // model for Life Expectancy
	     model.addAttribute("lifeExpectancy", lifeExpectancy);
	     model.addAttribute("headerName",headerName);
	     model.addAttribute("fromRetirement",1);
	     
	     model.addAttribute("whatIfOutPutDataList",getMyGoals(userSession));
	
	     return "whatIf/graph";
	     
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
	
	@RequestMapping(value = "/processGraph/{codeValueId}/{partyId}")
	public String processGraph(@PathVariable String codeValueId, @PathVariable String partyId, Model model,HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String url=null;
		String goalAmount = "0";
		String goalId = request.getParameter("goalId");
		String goalYear = request.getParameter("goalYear");
		
		try{
		// It give current year
				 Date date = new Date();
				 Calendar calendar = Calendar.getInstance();
				 calendar.setTime(date);
				 int startYear = calendar.get(Calendar.YEAR);
		
			
			int n = Integer.parseInt(goalYear)-startYear;
			Double fv = Double.parseDouble(request.getParameter("goalAmount"));
			Double pv = fv / Math.pow((1+inflationRate),n);
			pv = Double.parseDouble(new DecimalFormat("##.#").format(pv));
		    goalAmount = pv.toString();
			
		}catch(Exception e){ }
		//String goalAmount = request.getParameter("goalAmount");
		String goalSubType = request.getParameter("goalSubTypeId");
		
		//Integer goalAmountInt = (int) Math.round(Double.parseDouble(goalAmount));
		
		Map<String, String> goalMap=null;
		if(goalId.equals(""))
		{
		goalMap = new HashMap<String, String>();
		GoalData goalData = new GoalData();
		
		goalMap.put("100050", goalYear);
		
		goalMap.put("100052", goalAmount);
		
		goalMap.put("100026", "0");
		goalMap.put("100016", "1");
		goalMap.put("100027", "0");
		goalMap.put("100029", "0");
		goalMap.put("100032", "0");
		goalMap.put("100057", "0");
		goalMap.put("100056", "0");
		goalMap.put("100058", "0");
		goalMap.put("100059", "0");
		goalMap.put("100051", "0");
		goalMap.put("100053", "6.7");
		
		
		
		/*goalMap.put("100014", goalSubType); // sub cat for property
		
		goalMap.put("100005", goalSubType); // sub cat for education
		 
		if(goalSubType.equals("132005"))
		{
			goalMap.put("100028", "132004"); // sub cat for travel
		}else
		{
			goalMap.put("100028", goalSubType); 
		}
		 
		// for car
		model.addAttribute("subCategory", goalSubType);
		*/ 
		
		model.addAttribute("goalMap", goalMap);
		}
		else
		{
			String token = "12354";
			String username = userSession.getName();
			Integer buId = userSession.getBuId();
			GoalData goalDataJson = new GoalData();
			GoalData goalData = new GoalData();
			goalMap = new HashMap<String,String>();
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
			goalData.setGoalStartYear(Integer.parseInt(goalYear));
			goalData.setGoalAmountPv(goalAmount);
			goalMap = FiinfraUtility.createGoalMap( goalData );
			model.addAttribute("goalMap", goalMap);
			model.addAttribute("partyId", partyId);
			model.addAttribute("goalId", goalId);
			model.addAttribute("goalName", goalData.getGoalName());
			model.addAttribute("isAllocateAsset",goalData.getIsAllocateAsset());
			
			model.addAttribute("subCategory",2333); // if goalId is not null then it help to handle condition
		}
		
		try
		{
		List<AdviceAssumption> adviceAssumptions = getAssumptions((Integer)userSession.getBuId(), (Integer)userSession.getPartyId(),Integer.valueOf(partyId),"98047");
		String inflationrate = (String) (adviceAssumptions.get(0)).getAssumptionValue();
		model.addAttribute("inflationrate",inflationrate);
		}catch(Exception e){}
		// for education
		if(codeValueId.equals("35001"))
		{
		    if(userSession == null) 
		    {
				 return "redirect:/login";
			}else{
			String xmlData = getXmlForSectionType("35001",request);
			model.addAttribute("sectionData", xmlData);					
			model.addAttribute("partyId", partyId);
			model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.EDUCATION_GOAL,userSession.getPartyId()));
			url="whatIf/educational-goal";
			}
		}
		// for property
		if(codeValueId.equals("35003"))
		{
		    if(userSession == null) 
		    {
				 return "redirect:/login";
			}else{
		    String xmlData = getXmlForSectionType("35003",request);
			model.addAttribute("sectionData", xmlData);			
			model.addAttribute("partyId", partyId);
			model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.PROPERTY_OR_HOUSE_GOAL,userSession.getPartyId()));
			url = "whatIf/property-goal";
			}
		}
		// for wedding
		if(codeValueId.equals("35004"))
		{
		   if(userSession == null) 
		    {
				 return "redirect:/login";
			}else{
		    String xmlData = getXmlForSectionType("35004",request);
			model.addAttribute("sectionData", xmlData);			
			model.addAttribute("partyId", partyId);
			model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.MARRIAGE_GOAL,userSession.getPartyId()));
			url = "whatIf/wedding-goal";
			}
		}
		// for travel
		if(codeValueId.equals("35005"))
		{
		  if(userSession == null) 
		   {
			 return "redirect:/login";
			}else{
		    String xmlData = getXmlForSectionType("35005",request);
		    model.addAttribute("sectionData", xmlData);			
			model.addAttribute("partyId", partyId);
			model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.TRAVEL_AND_VACATION_GOAL,userSession.getPartyId()));
			url = "whatIf/travel-vacation-goal";
			}
		}
		// for car
		if(codeValueId.equals("35006"))
		{
		  if(userSession == null) 
		   {
			 return "redirect:/login";
			}else{
		    String xmlData = getXmlForSectionType("35006",request);
		    model.addAttribute("sectionData", xmlData);			
			model.addAttribute("partyId", partyId);
			model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.CAR_GOAL,userSession.getPartyId()));
			url = "whatIf/car-goal";
			}
		}
		// for special
				if(codeValueId.equals("35008"))
				{
				  if(userSession == null) 
				   {
					 return "redirect:/login";
					}else{
				    String xmlData = getXmlForSectionType("35008",request);
				    model.addAttribute("sectionData", xmlData);			
					model.addAttribute("partyId", partyId);
					model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.SPECIAL_GOAL,userSession.getPartyId()));
					url = "whatIf/special-goal";
					}
				}
				// for target corpus
				if(codeValueId.equals("35016"))
				{
				  if(userSession == null) 
				   {
					 return "redirect:/login";
					}else{
				    String xmlData = getXmlForSectionType("35016",request);
				    model.addAttribute("sectionData", xmlData);			
					model.addAttribute("partyId", partyId);
					model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.TARGET_CORPUS_GOAL,userSession.getPartyId()));
					url = "whatIf/target-corpus-goal";
					}
				}
		// for business
		if(codeValueId.equals("35012"))
		{
		  if(userSession == null) 
		   {
			 return "redirect:/login";
			}else{
		    String xmlData = getXmlForSectionType("35012",request);
		    model.addAttribute("sectionData", xmlData);			
			model.addAttribute("partyId", partyId);
			model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.BUISNESS_GOAL,userSession.getPartyId()));
			url = "whatIf/business-goal";
			}
		}
		// for other
		if(codeValueId.equals("35013"))
		{
			
		   if(userSession == null) 
			{
			 return "redirect:/login";
			}else{
			    String xmlData = getXmlForSectionType("35013",request);
			    model.addAttribute("sectionData", xmlData);			
				model.addAttribute("partyId", partyId);
				model.addAttribute("goalsByOther", getNumberOfGoalsForGoaltypeID(userSession.getUserName(), userSession.getBuId(), FiinfraConstants.OTHER_GOAL,userSession.getPartyId()));
				url = "whatIf/other-goal";
			}
			
		}
		// for retirement
		if(codeValueId.equals("99001"))
		{
			
		   if(userSession == null) 
			{
			 return "redirect:/login";
			}else{
				
			try{
				String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
						(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 264);// retirement planning links
				model.addAttribute("rbsLinks",rbsLinks);
				String questionBankId = "29";
				String sectionTypeId = "39006";
				
				String xmlData = getXmlForSectionType(sectionTypeId, request);
				List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
				
				List<Integer> sectionList =(List<Integer>) request.getSession().getAttribute("sectionId");
				String headerName =(String) request.getSession().getAttribute("headerName");
				//String nexturl = getNextUrl(sectionList, FiinfraConstants.RETIREMENT, partyId, headerName);
				//String backUrl = getBackUrl(sectionList, FiinfraConstants.RETIREMENT, partyId, headerName);
				
				model.addAttribute("sectionData", xmlData);		
				model.addAttribute("questionBankId", questionBankId);
				model.addAttribute("sectionTypeId", sectionTypeId);
				model.addAttribute("partyId", partyId);
				model.addAttribute("redirectUrl", "/whatIf/graph/"+partyId);
				//model.addAttribute("previousPageUrl", backUrl);
				//model.addAttribute("nextPageUrl", nexturl);			
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
		  }
		   url="whatIf/retirement-goal";
		}
		if(codeValueId.equals("35012"))
		{
			model.addAttribute("goalTypeString","Business Goal");
		}
		else if(codeValueId.equals("35006"))
		{
			model.addAttribute("goalTypeString","Car Goal");
		}
		else if(codeValueId.equals("35005"))
		{
			model.addAttribute("goalTypeString","Travel or Vacation");
		}
		else if(codeValueId.equals("35004"))
		{
			model.addAttribute("goalTypeString", "Wedding Goal");
		}
		else if(codeValueId.equals("35003"))
		{
			model.addAttribute("goalTypeString", "Property Goal");
		}
		else if(codeValueId.equals("35001"))
		{
			model.addAttribute("goalTypeString","Education Goal");
		}
		
		model.addAttribute("goalTypeId",codeValueId);
		return url;
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
		Integer userId = userSession.getUserId();
		LOGGER.debug("ValueIds is: " + otherGoalValueIDs);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
			String userName = userSession.getUserName();
			UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
			uriRetirement.queryParam("buId", userSession.getBuId());
			
			redirectAttributes.addFlashAttribute("success", "success.otherGoal.dataSave");
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "error.otherGoal.dataSave");
		}
	    //model.addAttribute("whatIfOutPutDataList",getMyGoals(userSession));
		return "redirect:"+"graph/"+this.partyId;
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
		Integer userId = userSession.getUserId();
		goalData.setGoalDescription("Special Goal");
		goalData.setId(goalId);
		LOGGER.debug("ValueIds is: " + specialGoalValueIds);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
			String userName = userSession.getUserName();
			UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
			uriRetirement.queryParam("buId", userSession.getBuId());
	
			redirectAttributes.addFlashAttribute("success", "success.specialGoal.dataSave");
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "error.specialGoal.dataSave");
		}
		//model.addAttribute("whatIfOutPutDataList",getMyGoals(userSession));
		return "redirect:"+"graph/"+this.partyId;
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
		Integer goalId = null;
		if(goalIdString != null && !goalIdString.equalsIgnoreCase("null") && !goalIdString.equalsIgnoreCase(""))
		{
			goalId = Integer.parseInt(goalIdString);
		}
		GoalData goalData = FiinfraUtility.createGoalData(targetCorpusGoalValueIds);
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(35016);
		String goalName = request.getParameter("hiddenGoalName");
		if(goalName == null || goalName.equals("")) {
	    	goalData.setGoalName("Target Corpus Goal");
	    }
	    else {
	    	goalData.setGoalName(goalName);
	    }
		Integer isAllocateAsset =Integer.parseInt(request.getParameter("isAllocateAsset").toString());
		goalData.setIsAllocateAsset(isAllocateAsset);
		Integer userId = userSession.getUserId();
		goalData.setGoalDescription("Target Corpus Goal");
		goalData.setId(goalId);
		LOGGER.debug("ValueIds is: " + targetCorpusGoalValueIds);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
			String userName = userSession.getUserName();
			UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
			uriRetirement.queryParam("buId", userSession.getBuId());
	
			redirectAttributes.addFlashAttribute("success", "success.targetCorpusGoal.dataSave");
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "error.targetCorpusGoal.dataSave");
		}
		//model.addAttribute("whatIfOutPutDataList",getMyGoals(userSession));
		return "redirect:"+"graph/"+this.partyId;
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
		Integer userId = userSession.getUserId();
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
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
			String userName = userSession.getUserName();
			UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
			uriRetirement.queryParam("buId", userSession.getBuId());
	
			redirectAttributes.addFlashAttribute("success", "success.businessGoal.dataSave");
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "error.businessGoal.dataSave");
		}
		// model.addAttribute("whatIfOutPutDataList",getMyGoals(userSession));
		return "redirect:"+"graph/"+this.partyId;
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
		Integer userId = userSession.getUserId();
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
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
			String userName = userSession.getUserName();
			UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
			uriRetirement.queryParam("buId", userSession.getBuId());
	
			redirectAttributes.addFlashAttribute("success", "success.carGoal.dataSave");
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "error.carGoal.dataSave");
		}
		//model.addAttribute("whatIfOutPutDataList",getMyGoals(userSession));
		return "redirect:"+"graph/"+this.partyId;
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
		Integer userId = userSession.getUserId();
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
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
			String userName = userSession.getUserName();
			UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
			uriRetirement.queryParam("buId", userSession.getBuId());
	
			redirectAttributes.addFlashAttribute("success", "success.travelGoal.dataSave");
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "error.travelGoal.dataSave");
		}
	    //model.addAttribute("whatIfOutPutDataList",getMyGoals(userSession));
		return "redirect:"+"graph/"+this.partyId;
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
		Integer userId = userSession.getUserId();
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
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
			String userName = userSession.getUserName();
			UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
			uriRetirement.queryParam("buId", userSession.getBuId());
	
			redirectAttributes.addFlashAttribute("success", "success.weddingGoal.dataSave");
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "error.weddingGoal.dataSave");
		}
    	//model.addAttribute("whatIfOutPutDataList",getMyGoals(userSession));
		return "redirect:"+"graph/"+this.partyId;
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
		if(goalIdString != null && !goalIdString.equalsIgnoreCase("null") && !goalIdString.equalsIgnoreCase(""))
		{
			goalId = Integer.parseInt(goalIdString);
		}
		GoalData goalData = FiinfraUtility.createGoalData(propertyGoalValueIds);
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(35003);//Id for goal Type
		goalData.setId(goalId);
		String goalName = request.getParameter("hiddenGoalName");
		if(goalName == null || goalName.equals("")) {
	    	goalData.setGoalName("Property");
	    }
	    else {
	    	goalData.setGoalName(goalName);
	    }
		Integer userId = userSession.getUserId();
		goalData.setGoalDescription("Property");
		LOGGER.debug("ValueIds is: " + propertyGoalValueIds);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
			String userName = userSession.getUserName();
			UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
			uriRetirement.queryParam("buId", userSession.getBuId());
	
			redirectAttributes.addFlashAttribute("success", "success.propertyGoal.dataSave");
			
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "error.proertyGoal.dataSave");
		}
		//model.addAttribute("whatIfOutPutDataList",getMyGoals(userSession));
		return "redirect:"+"graph/"+this.partyId;
	}
	
	@RequestMapping(value = "/saveEductionGoal", method = RequestMethod.POST)	
	public String saveEductionGoal(HttpServletRequest request,Model model ,final RedirectAttributes redirectAttributes) {
		LOGGER.debug("saveEductionGoal() of FutureFinancialDcController class called");
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
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
	    Integer userId = userSession.getUserId();
	    goalData.setGoalDescription("Education For");
		goalData.setPartyId(Integer.parseInt(partyId));
		goalData.setGoalTypeId(35001);
		
		goalData.setId(goalId);
		LOGGER.debug("ValueIds is: " + goalValueIds);
		LOGGER.debug("Dropdown data is " + request.getParameter("brand_1"));
		String user  = userSession.getUserName();
		String token = "15468";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_FUTURE_GOALS+"/"+ user+"/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalData, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
			String userName = userSession.getUserName();
			UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
			uriRetirement.queryParam("buId", userSession.getBuId());
	
			redirectAttributes.addFlashAttribute("success", "success.educationGoal.dataSave");
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "error.educationGoal.dataSave");
		}
	    //model.addAttribute("whatIfOutPutDataList",getMyGoals(userSession));
		return "redirect:"+"graph/"+this.partyId;
	}
	
	@RequestMapping(value = "/saveRetirementGoal", method = RequestMethod.POST)	
	public String saveRetirementGoal(HttpServletRequest request,Model model ,final RedirectAttributes redirectAttributes) {
		LOGGER.debug("saveRetirementGoal() CFS");
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
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
				String dataFor = "RP";
				String sourceScreen=FiinfraConstants.DIY_SOURCE_MODULE_RETIREMENT_READINESS;
				int eventId = FiinfraConstants.DIY_SAVE_RETIREMENT_READINESS_SUCCESSFUL;
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_DC_INPUT + "/" + partyId + "/" + token);
				uriCB.queryParam("buId", userSession.getBuId());	
				BaseResponse<Party> br = new BaseResponse<Party>();
				br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), cData, BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{
					redirectAttributes.addFlashAttribute("success", "success.cfs.retirementReadiness");
					uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_SUGGESTION_DATA + "/" + partyId + "/" + dataFor +"/" 
							+ userSession.getUserId() + "/" + token);
					uriCB.queryParam("buId", userSession.getBuId());
					
					br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
					audit(userSession.getPartyId(), userSession.getUserId(), eventId, CFS_SOURCE, sourceScreen);
					if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					{
						if(sectionTypeId.equals("39006")){
							// call for SAVE_ASSET_ALLOCATION_FOR_RETIREMENT
							UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userId + "/"+userName+"/" + token);
							uriRetirement.queryParam("buId", userSession.getBuId());
							BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
							retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
							if (retirementBr.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
								redirectAttributes.addFlashAttribute("success", "success.cfs.retirementReadiness");
							}else{
								redirectAttributes.addFlashAttribute("error", "error.cfs.retirementReadiness");
							}
						}
					}
					audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_RISK_PROFILE_SAVED_SUCCESSFULLY, DC_SOURCE, sourceScreen);
				}
				else
				{
					redirectAttributes.addFlashAttribute("error", "error.cfs.retirementReadiness");
					redirectAttributes.addFlashAttribute("error", "Error while saving Financial status, please try again later.");
					audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_CFS_DATA_SAVE_FAILED, CFS_SOURCE, sourceScreen);
				}
				
				
			
		}catch(Exception exception){}
		
		return "redirect:"+"graph/"+this.partyId;
	}
	
	public List<WhatIfOutPutData> getMyGoals(UserSession userSession)
	{
		List<WhatIfOutPutData> whatIfOutPutDataList = new ArrayList<WhatIfOutPutData>();
		try {
		List<GoalData> myGoalListJson = new ArrayList<GoalData>();
		List<GoalData> goalList = new ArrayList<>();
		String token = "234";
		Integer buId = userSession.getBuId();
		UriComponentsBuilder componentsBuilder = UriComponentsBuilder.fromHttpUrl(GET_GOALS_FOR_PARTYID+partyId+"/"+userSession.getUserName()+"/"+token);
		componentsBuilder.queryParam("buId", buId);
		BaseResponse<GoalData> baseResponse = new BaseResponse<>();
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(componentsBuilder), BaseResponse.class);
		if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			myGoalListJson = baseResponse.getResponseListObject();
		}
		GoalData goalData = new GoalData();
		
		List<GoalAttribute> goalAtriList =  null;
		
		for(int i=0;i<myGoalListJson.size();++i)
		{
			goalData = objectMapper.readValue(objectMapper.writeValueAsString(myGoalListJson.get(i)), GoalData.class);
			goalList.add(goalData);
		}
		// ***********to get what if goals list ************//
		 for(int i=0; i< goalList.size();i++)
		 {
		  GoalData  data  = goalList.get(i);
		  WhatIfOutPutData outPutData = new WhatIfOutPutData();
		  
		  outPutData.setGoalId(data.getId());
		  outPutData.setGoalTypeId(data.getGoalTypeId());
		  outPutData.setGoalName(data.getGoalName());
		  outPutData.setGoalYear(data.getGoalStartYear().toString());
		  outPutData.setGoalAmount(data.getGoalAmountPv());
		  
		  if(data.getGoalTypeId().equals(35013))// for other
		  {
			  outPutData.setGoalSubType("14");
		  }
		  else if(data.getGoalTypeId().equals(35012))// for business
		  {
			  outPutData.setGoalSubType("12");
		  }
		  else if(data.getGoalTypeId().equals(35004))// for wedding
		  {
			  outPutData.setGoalSubType("10");
		  }
		  else if(data.getGoalTypeId().equals(35008))//for special
		  {
			  outPutData.setGoalSubType("13");
		  }
		  else if(data.getGoalTypeId().equals(35003))// for property
		  {
			  outPutData.setGoalSubType("106002");
		  }
		  else if(data.getGoalTypeId().equals(35006))// for car
		  {
			  outPutData.setGoalSubType("23");
		  }
		  else if(data.getGoalTypeId().equals(35005))// for travel
		  {
			  outPutData.setGoalSubType("132001");
		  }
		  else if(data.getGoalTypeId().equals(35001))// for education
		  {
			  outPutData.setGoalSubType("132004");
		  }
		  else if(data.getGoalTypeId().equals(35016))// for target corpus
		  {
			  outPutData.setGoalSubType("132011");
		  }
		  
		  // ********** goal attribute *************** // 
		  
		  /*goalAtriList =  data.getGoalAttributeList();
		  for(int j=0;j<goalAtriList.size();j++)
		  {
			  GoalAttribute goalAttribute = goalAtriList.get(j);
			  if(data.getGoalTypeId().equals(35003))// for property
			  {
				  if(goalAttribute.getAttributeName().equals("100014"))
				  {
					  if(goalAttribute.getAttributeValue().equals("106022"))
					  {
					   outPutData.setGoalSubType("106022");
					  }
					  else if(goalAttribute.getAttributeValue().equals("106025"))
					  {
					   outPutData.setGoalSubType("106025");
					  }
					  else if(goalAttribute.getAttributeValue().equals("106002"))
					  {
					   outPutData.setGoalSubType("106002");
					  }
					  else if(goalAttribute.getAttributeValue().equals("106003"))
					  {
					   outPutData.setGoalSubType("106003");
					  }
					  else if(goalAttribute.getAttributeValue().equals("106004"))
					  {
					   outPutData.setGoalSubType("106004");
					  }
					  else if(goalAttribute.getAttributeValue().equals("106010"))
					  {
					   outPutData.setGoalSubType("106010");
					  }
				  }
			  }
			  else if(data.getGoalTypeId().equals(35006))// for car
			  {
				  if(goalAttribute.getAttributeName().equals("100031"))
				  {
					  //if(goalAttribute.getAttributeValue().equals("106010"))
					  //{
					   outPutData.setGoalSubType("23");
					  //}
					  
				  }
			  }
			  else if(data.getGoalTypeId().equals(35005))// for travel
			  {
				  if(goalAttribute.getAttributeName().equals("100028"))
				  {
					  if(goalAttribute.getAttributeValue().equals("132004"))
					  {
						  outPutData.setGoalSubType("132005");
					  }
					  else
					  {
						  outPutData.setGoalSubType("132001");
					  }
				  }
			  }
			  else if(data.getGoalTypeId().equals(35001))// for education
			  {
				  LOGGER.debug("#########################+=====Goal Name vvalue=====================>"+goalAttribute.getAttributeValue());
				  if(goalAttribute.getAttributeName().equals("100005"))
				  {
					  if(goalAttribute.getAttributeValue().equals("132004"))
					  {
						  outPutData.setGoalSubType("132004");
					  }
					  else
					  {
						  outPutData.setGoalSubType("132003");
					  }
				  }
			  }
		  }*/
		  whatIfOutPutDataList.add(outPutData);
		 }
		 // ************* end what if goal list ************* //
		}catch (Exception exception) 
		{
			LOGGER.debug("error while parsing the list of goal data"+exception.getMessage());
		}
		return whatIfOutPutDataList;
	}
	
	//building hash map of goals 
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
				else if(key == 35016){
					strKey=FiinfraConstants.TARGET_CORPUS;
				}
				finalGoals.put(strKey, goals);
			}
			return finalGoals;
			
		}
	
	@RequestMapping(value = "/getSubCategoryId", method = RequestMethod.GET)	
	public @ResponseBody String getsubCategoryId( HttpServletRequest request)
	{
		String CodeValue = request.getParameter("subCategory");
		Integer ParentCodeValueID = Integer.parseInt(request.getParameter("ParentCodeValueID"));
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String token = "4321";
		Integer CodeValueID=0;
		Integer buId = userSession.getBuId();
		UriComponentsBuilder componentsBuilder = UriComponentsBuilder.fromHttpUrl(GET_SUB_CAT_ID_FOR_CAR_IN_WHATIF+"/"+ParentCodeValueID+"/"+CodeValue+"/"+token);
		componentsBuilder.queryParam("buId", buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(componentsBuilder), BaseResponse.class).getBody();
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			try {
				CodeValueID = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), Integer.class);
				} catch (Exception e) 
				{
					e.printStackTrace();
				}
		}
	   return CodeValueID.toString();
	}
	
	@RequestMapping(value = "/whatIfAnalysis/{jspType}", method = {RequestMethod.GET,RequestMethod.POST})
	public String whatIfAnalysis(Model model,HttpServletRequest request,
			@PathVariable("jspType") String jspType) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException
	{
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		String token = "4321";
	
		List<WhatIfData> whatIfDataListJsonData = new ArrayList<WhatIfData>();
		List<WhatIfData> whatIfDataList =  new ArrayList<WhatIfData>();
		BaseResponse<WhatIfData> baseResponse = new BaseResponse<WhatIfData>();
		
		model.addAttribute("jspType",jspType);
		model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
		
		String redirectUrl=request.getParameter("redirectUrl");
		model.addAttribute("redirectUrl",redirectUrl);
		if(null!=redirectUrl && !redirectUrl.isEmpty() && null!=request.getParameter("partyId")){
			partyId=request.getParameter("partyId");
		}
		
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
		
		 Integer assetSaveLink;
		if( jspType.equals("fr") ){
			assetSaveLink = 318;
		}else{
			assetSaveLink = 316;
		}
		String assetSave = "";
		
	   assetSave = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(), userSession.getUserName(), userSession.getBuId(), assetSaveLink);
		 
	   model.addAttribute("assetSave",assetSave);
	   model.addAttribute("toatalMonthlyInvestment",toatalMonthlyInvestment);
	   model.addAttribute("toatalInitialAsset",toatalInitialAsset);
	   model.addAttribute("whatIfDataList",whatIfDataList);
	   model.addAttribute("partyId",partyId);
	   return "whatIf/whatIfAnalysis";
	}
	
	@RequestMapping(value = "/saveAnalysis", method = RequestMethod.POST)
	public String saveAnalysis(HttpServletRequest request,Model model,final RedirectAttributes redirectAttributes)
	{
		for(int i=0;i<this.whatIfDataList.size();i++)
		{
			WhatIfData data = whatIfDataList.get(i);
			data.setAvailableToGoals(request.getParameter(data.getId().toString()));
		}
		String redirectURL=request.getParameter("redirectURL");
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
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
			   return "redirect:"+"graph/"+this.partyId;
			  }
	
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
	private Integer getNumberOfGoalsForGoaltypeID(String username,Integer buId, Integer goaltypeId,Integer partyId )
	{
		UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(GET_NUMBER_OF_GOALS_FOR_GOALTYPE_ID+username+"/"+goaltypeId+"/342");
		uri.queryParam("buId", buId);
		uri.queryParam("partyId", partyId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
		return br.getResponseObject();
	}
	
	public List<QuestionDetails> getDcInputDataNew(String userId, String partyId, String buId, 
			String sectionTypeId, String questionBankId){
		try{
			List<QuestionDetails> jsomDcipList = new ArrayList<QuestionDetails>();
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
				jsomDcipList = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), List.class);
				for(int i=0;i<jsomDcipList.size();i++)
				{
					QuestionDetails details = new QuestionDetails();
					details = objectMapper.readValue(objectMapper.writeValueAsString(jsomDcipList.get(i)), QuestionDetails.class);
					dcipList.add(details);
				}
			}
						
			return dcipList;
		}catch(Exception ex){
			LOGGER.error("Error fetching DC Input List...", ex);
			return null;
		}	
	}
	
}
