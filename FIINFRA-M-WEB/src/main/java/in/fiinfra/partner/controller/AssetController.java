/**
 * 
 */
package in.fiinfra.partner.controller;

import in.fiinfra.common.diy.models.AssetData;
import in.fiinfra.common.diy.models.AssetSummary;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.PartyGoals;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.AssetAllocatedToGoal;
import in.fiinfra.common.partner.AssetAvailableValue;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.partner.service.DropDownService;
//import in.fiinfra.partner.service.DropDownServices;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.QueryParam;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException; 
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;
//import org.w3c.tidy.ParserImpl.ParseBlock;
 
/**
 * @author Kunal
 *
 */
@Controller
@RequestMapping("/assets")
public class AssetController {

	private static final Logger LOGGER = Logger.getLogger(AssetController.class);
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Autowired
	private DropDownService dropDownService;
	 
	@Value("${GET_ASSETSUMMARY_URL}")
	private String GET_ASSETS;
	
	@Value("${GET_ASSETDETAILS_URL}")
	private String GET_ASSETDETAILS;
	
	@Value("${SAVE_ASSET_ALLOCATION_TO_GOAL_URL}")
	private String SAVE_ASSET_ALLOCATION_TO_GOAL_URL;
	
	@Value("${GET_ASSET_ALLOCATION_TO_GOAL_URL}")
	private String GET_ASSET_ALLOCATION_TO_GOAL_URL;
	
	@Value("${GET_ASSET_ALLOCATION_TO_GOALS_URL}")
	private String GET_ASSET_ALLOCATION_TO_GOALS_URL;
	
	@Value("${SAVE_ASSET_URL}")
	private String SAVE_ASSET;
	
	@Value("${GET_PRODUCTS_FOR_ASSET}")
	private String GET_PRODUCTS_FOR_ASSET;
	
	@Value("${GET_FREQUENCY_URL}")
	private String GET_FREQUENCY;
	
	@Value("${GET_MANUFACTURER_FOR_ASSET}")
	private String GET_MANUFACTURER_FOR_ASSET;
	
	@Value("${GET_TOTAL_ASSET_ALLOCATION}")
	private String GET_TOTAL_ASSET_ALLOCATION;
	
	@Value("${GET_GOLAS_ALLOCATED_TO_ASSET}")
	private String GET_GOLAS_ALLOCATED_TO_ASSET;
	
	@Value("${DELETE_ASSET_DETAIL}")
	private String DELETE_ASSET_DETAIL;
	
	@Value("${GET_GOALS_FOR_ASSETS}")
	private String GET_GOALS_FOR_ASSETS;
	
	@Value("${GET_PIE_CHART_FOR_GOALS}")
	private String GET_PIE_CHART_FOR_GOALS;
	
	@Value("${FETCH_DC_INPUTDATA}")
	private String FETCH_DC_INPUTDATA;
	
	private final static Integer BANK_DEPOSIT_FD = 48011;
	private final static Integer BANK_DEPOSIT_RD = 48053;
	private final static Integer BANK_DEPOSIT_SAVING = 48052;
	private final static int RETIREMENT_FUND_EPF = 48012;
	private final static int RETIREMENT_FUND_PPF = 48008;
	private final static int MUTUAL_FUND = 48001;
	  
	private final static int GOLD = 48022;
	private final static int PROPERTY = 48047;
	private final static int STOCK= 48006;
	  
	@RequestMapping(value = "/assetSummary/{partyId}", method = {RequestMethod.GET})
	public String loadAssetSummary(Model model,HttpServletRequest request, @PathVariable String partyId) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		//Integer partyId = userSession.getPartyId();
		//Integer buId = userSession.getBuId();
		//String userName = userSession.getUserName();
		String token = "153443";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSETS +  "/" + userSession.getUserName() + "/" + partyId + "/" + token);
		uriCB.queryParam("buId", userSession.getBuId());
		
		List<AssetAllocatedToGoal> assetDataListAsJson = new ArrayList<AssetAllocatedToGoal>();
		AssetAllocatedToGoal assetSummary = new AssetAllocatedToGoal();
		
		BaseResponse<AssetAllocatedToGoal> baseResponse = new BaseResponse<AssetAllocatedToGoal>();
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		
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
		double totalAllocatedValue = 0.0;
		
				//restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partySettingInput, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				assetDataListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
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
						totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
					}else if(assetSummary.getAssetTypeId().equals("48008")||assetSummary.getAssetTypeId().equals("48012")||assetSummary.getAssetTypeId().equals("48061")||assetSummary.getAssetTypeId().equals("48062")||assetSummary.getAssetTypeId().equals("48063")){
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
						totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
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
						totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
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
						totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
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
						totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
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
						totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
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
						totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
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
						totalAllocatedValue = totalAllocatedValue + Double.parseDouble(assetSummary.getAllocatedAmount());
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
		
		model.addAttribute("mutualFunds", (mfCurrentAssetValue) +"_"+ (mfAssetAllocatedValue) +"_"+ mfNoOfGoals +"_72004");
		model.addAttribute("shares", (sharesCurrentAssetValue) +"_"+ (sharesAssetAllocatedValue) +"_"+ sharesNoOfGoals +"_72001");
		model.addAttribute("deposits", (depositsCurrentAssetValue) +"_"+ (depositsAssetAllocatedValue) +"_"+ depositsNoOfGoals +"_72003");
		model.addAttribute("retirement", (retirementCurrentAssetValue) +"_"+ (retirementAssetAllocatedValue) +"_"+ retirementNoOfGoals +"_");
		model.addAttribute("gold", (goldCurrentAssetValue) +"_"+ (goldAssetAllocatedValue) +"_"+ goldNoOfGoals +"_72006");
		model.addAttribute("property", (propertyCurrentAssetValue) +"_"+ (propertyAssetAllocatedValue) +"_"+ propertyNoOfGoals +"_72002");
		model.addAttribute("insurance", (insuranceCurrentAssetValue) +"_"+ (insuranceAssetAllocatedValue) +"_"+ insuranceNoOfGoals +"_");
		model.addAttribute("other", (otherCurrentAssetValue) +"_"+ (otherAssetAllocatedValue) +"_"+ otherNoOfGoals +"_");
		model.addAttribute("totalAssetValue",totalAssetValue);
		model.addAttribute("totalAllocatedValue", totalAllocatedValue);
		model.addAttribute("partyId", partyId);
		
		
		String questionBankId = "29";
		String sectionTypeId = "39005";
		Double totalValueOfBasic = 0.0; 
		String basicValueContains = ""; 
		List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
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
		questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
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
		questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
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
		
		return "assetSummary";
	}
	
	@RequestMapping(value = "/assetDetails/{partyId}/{assetId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String loadAssetDetails(Model model,HttpServletRequest request, @PathVariable String partyId, @PathVariable Integer assetId, final RedirectAttributes redirectAttributes, @RequestParam(value="assetPage",required=true,defaultValue="") String assetPage) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		/*48012 - EPF
		48009 - PF*/
		String token = "153443";
		String assetType = request.getParameter("assetType");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSETDETAILS +  "/" + userSession.getUserName() + "/" + partyId + "/" + assetId + "/" + token);
		//uriCB.queryParam("partyId", 115040);//userSession.getPartyId());
		uriCB.queryParam("buId", userSession.getBuId());
		List<AssetSummary> assetDataListAsJson = new ArrayList<AssetSummary>();
		List<AssetSummary> assetDataList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetBankDepositsList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetRetirementFundsList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetEPFList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetPPList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetNPSList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetRetirementOthersList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetMutualFundsList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetMutualFundsLumpSumList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetGoldsList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetPropertyList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetStocksList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetFixedDepositsList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetRecurringDepositsList = new ArrayList<AssetSummary>();
		List<AssetSummary> assetOthersList = new ArrayList<AssetSummary>();
		BaseResponse<AssetSummary> baseResponse = new BaseResponse<AssetSummary>();
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				//restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partySettingInput, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				assetDataListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				for(int i = 0; i<assetDataListAsJson.size(); i++){										
					AssetSummary assetSummary = null;
					assetSummary = objectMapper.readValue(objectMapper.writeValueAsString(assetDataListAsJson.get(i)), AssetSummary.class);
					assetDataList.add(assetSummary);
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
		assetDataList = findDuplicates(assetDataList);
		for (int i = 0; i < assetDataList.size(); i++) {
			AssetSummary assetSummary = null;
			assetSummary = assetDataList.get(i);
			if(assetSummary.getAssetTypeId().equals(48052)){
				assetBankDepositsList.add(assetSummary);
			}else if(assetSummary.getAssetTypeId().equals(48053)){
				assetRecurringDepositsList.add(assetSummary);
			}else if(assetSummary.getAssetTypeId().equals(48011)){
				assetFixedDepositsList.add(assetSummary);
			}else if(assetSummary.getAssetTypeId().equals(48008)){
				assetRetirementFundsList.add(assetSummary);
			}else if(assetSummary.getAssetTypeId().equals(48012)){
				assetEPFList.add(assetSummary);
			}else if(assetSummary.getAssetTypeId().equals(48061)){
				assetPPList.add(assetSummary);
			}else if(assetSummary.getAssetTypeId().equals(48062)){
				assetNPSList.add(assetSummary);
			}else if(assetSummary.getAssetTypeId().equals(48063)){
				assetRetirementOthersList.add(assetSummary);
			}else if(assetSummary.getAssetTypeId().equals(48001) || assetSummary.getAssetTypeId().equals(48002) || assetSummary.getAssetTypeId().equals(48003) || assetSummary.getAssetTypeId().equals(48004)
					 || assetSummary.getAssetTypeId().equals(48017) || assetSummary.getAssetTypeId().equals(48018) || assetSummary.getAssetTypeId().equals(48019)
					 || assetSummary.getAssetTypeId().equals(48020) || assetSummary.getAssetTypeId().equals(48021) || assetSummary.getAssetTypeId().equals(48023) || assetSummary.getAssetTypeId().equals(48051)
					 || assetSummary.getAssetTypeId().equals(48057) || assetSummary.getAssetTypeId().equals(47001) || assetSummary.getAssetTypeId().equals(47004) || assetSummary.getAssetTypeId().equals(47005)){
				if( assetSummary.getFrequency() > 0 ){
					assetMutualFundsList.add(assetSummary);
				}else {
					assetMutualFundsLumpSumList.add(assetSummary);
				}
			}else if(assetSummary.getAssetTypeId().equals(48022)){
				assetGoldsList.add(assetSummary);
			}else if(assetSummary.getAssetTypeId().equals(48047) || assetSummary.getAssetTypeId().equals(48039) || assetSummary.getAssetTypeId().equals(48040)){
				assetPropertyList.add(assetSummary);
			}else if(assetSummary.getAssetTypeId().equals(48006) || assetSummary.getAssetTypeId().equals(48005) || assetSummary.getAssetTypeId().equals(48007)){
				assetStocksList.add(assetSummary);
			}else if(assetSummary.getAssetTypeId().equals(48048) || assetSummary.getAssetTypeId().equals(48049) || assetSummary.getAssetTypeId().equals(48059) || assetSummary.getAssetTypeId().equals(48060)){
				assetOthersList.add(assetSummary);
			}
		}
		model.addAttribute("assetFixedDepositsList", assetFixedDepositsList);
		model.addAttribute("assetRecurringDepositsList", assetRecurringDepositsList);
		model.addAttribute("assetEPFList", assetEPFList);
		model.addAttribute("assetPPList", assetPPList);
		model.addAttribute("assetNPSList", assetNPSList);
		model.addAttribute("assetBankDepositsList", assetBankDepositsList);
		model.addAttribute("assetRetirementFundsList", assetRetirementFundsList);
		model.addAttribute("assetRetirementOthersList", assetRetirementOthersList);
		model.addAttribute("assetMutualFundsList", assetMutualFundsList);
		model.addAttribute("assetMutualFundsLumpSumList", assetMutualFundsLumpSumList);
		model.addAttribute("assetGoldsList", assetGoldsList);
		model.addAttribute("assetPropertyList", assetPropertyList);
		model.addAttribute("assetStocksList", assetStocksList);
		model.addAttribute("assetOthersList",assetOthersList);
		model.addAttribute("partyId", partyId);
		model.addAttribute("partyAssetId", assetId);
		model.addAttribute("assetPage", assetPage);
		
		
		String questionBankId = "29";
		String sectionTypeId = "39005";
		Double totalValueOfBasic = 0.0; 
		String basicValueContains = ""; 
		List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
		if(questionDetails!=null){
		for(int i=0;i<questionDetails.size();i++)
		{
			QuestionDetails details = questionDetails.get(i);
			
			if(details.getAttributeValue().equals("94027"))
			{
				if(!basicValueContains.contains(details.getAttributeValue())){
					totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
				basicValueContains = basicValueContains+"_"+details.getAttributeValue();
				}
				model.addAttribute("SharesAmount",details.getAttributeRefferenceValue());
			}
			else if(details.getAttributeValue().equals("94028"))
			{
				if(!basicValueContains.contains(details.getAttributeValue())){
					totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
					basicValueContains = basicValueContains+"_"+details.getAttributeValue();
					}
				model.addAttribute("PropertyAmount",details.getAttributeRefferenceValue());
			}
			else if(details.getAttributeValue().equals("94029"))
			{
				if(!basicValueContains.contains(details.getAttributeValue())){
					totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
					basicValueContains = basicValueContains+"_"+details.getAttributeValue();
				}
				model.addAttribute("DepositsAmount",details.getAttributeRefferenceValue());
			}
			else if(details.getAttributeValue().equals("94030"))
			{
				if(!basicValueContains.contains(details.getAttributeValue())){
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
				if(!basicValueContains.contains(details.getAttributeValue())){
					totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
					basicValueContains = basicValueContains+"_"+details.getAttributeValue();
				}
				model.addAttribute("GoldAmount",details.getAttributeRefferenceValue());
			}
			else if(details.getAttributeValue().equals("94033"))
			{
				if(!basicValueContains.contains(details.getAttributeValue())){
					totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
					basicValueContains = basicValueContains+"_"+details.getAttributeValue();
				}
				model.addAttribute("OtherAmount",details.getAttributeRefferenceValue());
			}
		}
		}
		questionBankId = "29";
		sectionTypeId = "39006";
		questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
		if(questionDetails!=null){
		for(int i=0;i<questionDetails.size();i++)
		{
			QuestionDetails details = questionDetails.get(i);
			
			if(details.getAttributeValue().equals("94051"))
			{
				if(!basicValueContains.contains(details.getAttributeValue())){
					totalValueOfBasic += (details.getAttributeRefferenceValue()=="" || details.getAttributeRefferenceValue()==null)?0:Double.parseDouble(details.getAttributeRefferenceValue());
					basicValueContains = basicValueContains+"_"+details.getAttributeValue();
				}
				model.addAttribute("RetirementAmount",details.getAttributeRefferenceValue());
			}
		 }
		}
		model.addAttribute("totalValueOfBasic",totalValueOfBasic);
		
		
		
		return "assetDetails";
	}
	
	private List<JsonData> getFamilyMembersList(Model model,String partyId){
		Map<String,Object> modelMap = model.asMap();
		//String partyId = (request.getParameter("partyId") == null ? (String)modelMap.get("partyId") : request.getParameter("partyId") );
		 return dropDownService.getFamilyMembersList(partyId, "userName");
	}
	
	public List<JsonData> getfrequency( Model model, HttpServletRequest request, Integer codeTypeId ){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		String token = "153443";
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_FREQUENCY +  "/" + codeTypeId + "/" + userSession.getUserName() + "/" + token);
		//uriCB.queryParam("partyId", 115040);//userSession.getPartyId());
		uriCB.queryParam("buId", userSession.getBuId());
		List<JsonData> keyValueListAsJson = new ArrayList<JsonData>();
		List<JsonData> keyValueList = new ArrayList<JsonData>(); 
		BaseResponse<JsonData> baseResponse = new BaseResponse<JsonData>();
		JsonData jsonData = new JsonData();
		/*jsonData.setValue(-1);
		jsonData.setText("---Select---");
		keyValueList.add(jsonData);*/
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				//restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partySettingInput, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				keyValueListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				for(int i = 0; i<keyValueListAsJson.size(); i++){										
					JsonData keyValue = null;
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(keyValueListAsJson.get(i)), JsonData.class);
					keyValueList.add(keyValue);
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
		return keyValueList;
	}
	
	@RequestMapping(value = "/addBankDeposits/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String addBankDeposits(Model model,HttpServletRequest request, @QueryParam("saveAddFlag") String saveAddFlag, @PathVariable String partyId) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		Map<String,Object> modelMap = model.asMap();
		//String partyId = (request.getParameter("partyId") == null ? (String)modelMap.get("partyId") : request.getParameter("partyId") );
		
		String token = "153443";
		List<JsonData> familyMembersList = getFamilyMembersList(model,partyId);
		try {
			model.addAttribute("familyMembersList", objectMapper.writeValueAsString(familyMembersList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("partyId", partyId);
		model.addAttribute("saveAddFlag", saveAddFlag);
		model.addAttribute("title", "Add Assets : Deposits");
		return "addBankDeposits";
	}
	
	@RequestMapping(value = "/saveAssets", method = {RequestMethod.POST})
	public String saveAssets(@ModelAttribute("AssetData")AssetData asset, Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		String result = "";
		result = saveAssetService(request,userSession,asset);
		String saveAddFlag = request.getParameter("saveAddFlag");
		if (result.equalsIgnoreCase(FiinfraConstants.success)){
			redirectAttributes.addFlashAttribute("success", "success.asset.save");
		}else{
			redirectAttributes.addFlashAttribute("error", "error.asset.save");
		}
		
		redirectAttributes.addFlashAttribute("partyId", request.getParameter("partyId"));
		if (asset.getAssetTypeId().equals(48001) || asset.getAssetTypeId().equals(48002) || asset.getAssetTypeId().equals(48003) || asset.getAssetTypeId().equals(48004)
				 || asset.getAssetTypeId().equals(48017) || asset.getAssetTypeId().equals(48018) || asset.getAssetTypeId().equals(48019)
				 || asset.getAssetTypeId().equals(48020) || asset.getAssetTypeId().equals(48021) || asset.getAssetTypeId().equals(48023) || asset.getAssetTypeId().equals(48051)
				 || asset.getAssetTypeId().equals(48057) || asset.getAssetTypeId().equals(47001) || asset.getAssetTypeId().equals(47004) || asset.getAssetTypeId().equals(47005)) {
			return "redirect:/assets/addMutualFunds/"+request.getParameter("partyId")+"?saveAddFlag="+saveAddFlag;
		}
		if (asset.getAssetTypeId().equals(48006) || asset.getAssetTypeId().equals(48005) || asset.getAssetTypeId().equals(48007)) {
			return "redirect:/assets/addStocks/"+request.getParameter("partyId");
		}
		if( asset.getAssetTypeId().equals(48052) || asset.getAssetTypeId().equals(48011) || asset.getAssetTypeId().equals(48053)){
			return "redirect:/assets/addBankDeposits/"+request.getParameter("partyId")+"?saveAddFlag="+saveAddFlag;
		}


		if (asset.getAssetTypeId().equals(48047) || asset.getAssetTypeId().equals(48039) || asset.getAssetTypeId().equals(48040)) {
			return "redirect:/assets/addProperties/"+request.getParameter("partyId");
		}

		if (asset.getAssetTypeId().equals(48022)) {
			return "redirect:/assets/addGolds/"+request.getParameter("partyId");
		}

		if(asset.getAssetTypeId().equals(48008) || asset.getAssetTypeId().equals(48012) || asset.getAssetTypeId().equals(48061) || asset.getAssetTypeId().equals(48062) || asset.getAssetTypeId().equals(48063) ){
			return "redirect:/assets/addRetirementFunds/"+request.getParameter("partyId")+"?saveAddFlag="+saveAddFlag;
		}
		
		if(asset.getAssetTypeId().equals(48048) || asset.getAssetTypeId().equals(48049) || asset.getAssetTypeId().equals(48059) || asset.getAssetTypeId().equals(48060)){
			return "redirect:/assets/addOther/"+request.getParameter("partyId");
		}

		return "assetDetails";
	}
	@RequestMapping(value = "/saveAndCloseAssets", method = {RequestMethod.POST})
	public String saveAndCloseAssets(@ModelAttribute("AssetData")AssetData asset, Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		/*if(saveAssetService(request,userSession,asset).equalsIgnoreCase("success")){
			return "assetDetails";
		}*/
		
		String result = "";
		result = saveAssetService(request,userSession,asset);
		
		if (result.equalsIgnoreCase(FiinfraConstants.success)){
			redirectAttributes.addFlashAttribute("success", "success.asset.save");
		}else{
			redirectAttributes.addFlashAttribute("error", "error.asset.save");
		}
		
		return "redirect:/assets/assetDetails/"+request.getParameter("partyId")+"/0"+"?assetPage="+request.getParameter("assetPage");
		
	}
	private String saveAssetService(HttpServletRequest request,UserSession userSession,AssetData asset){
		String token = "153443";
		asset.setCreatedBy(userSession.getUserId());
		asset.setLastModifiedBy(userSession.getUserId());
        asset.setPartyId(Integer.parseInt(request.getParameter("partyId")));
        
        UriComponentsBuilder uriCB;
	    uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET+ "/"+"UserName"+"/" + token+"&buId="+userSession.getBuId());
			 
		BaseResponse<AssetData> baseResponse = new BaseResponse<AssetData>();
		
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), asset, BaseResponse.class);
		return baseResponse.getStatus();
	}
	@RequestMapping(value = "/addRetirementFunds/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String addRetirementFunds(Model model,HttpServletRequest request, @QueryParam("saveAddFlag") String saveAddFlag, @PathVariable String partyId) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		Map<String,Object> modelMap = model.asMap();
		//String partyId = (request.getParameter("partyId") == null ? (String)modelMap.get("partyId") : request.getParameter("partyId") );
		
		String token = "153443";
		List<JsonData> familyMembersList = getFamilyMembersList(model,partyId);
		try {
			model.addAttribute("familyMembersList", objectMapper.writeValueAsString(familyMembersList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("partyId", partyId);
		model.addAttribute("saveAddFlag", saveAddFlag);
		model.addAttribute("title", "Add Assets : Retirement Funds");
		return "addRetirementFunds";
	}
	
	@RequestMapping(value = "/addOther/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String addOther(Model model,HttpServletRequest request,@PathVariable String partyId) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		Map<String,Object> modelMap = model.asMap();
		//String partyId = (request.getParameter("partyId") == null ? (String)modelMap.get("partyId") : request.getParameter("partyId") );
		
		String token = "153443";
		List<JsonData> familyMembersList = getFamilyMembersList(model,partyId);
		try {
			model.addAttribute("familyMembersList", objectMapper.writeValueAsString(familyMembersList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<JsonData> frequencyList = getfrequency(model, request, 72007);
		try {
			model.addAttribute("frequencyList", objectMapper.writeValueAsString(frequencyList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("partyId", partyId);
		model.addAttribute("title", "Add Assets : Other");
		return "addOther";
	}
	
	@RequestMapping(value = "/addMutualFunds/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String addMutualFunds(Model model,HttpServletRequest request, @QueryParam("saveAddFlag") String saveAddFlag,@PathVariable String partyId) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		Map<String,Object> modelMap = model.asMap();
		//String partyId = (request.getParameter("partyId") == null ? (String)modelMap.get("partyId") : request.getParameter("partyId") );
		
		String token = "153443";
		List<JsonData> familyMembersList = getFamilyMembersList(model,partyId);
		try {
			model.addAttribute("familyMembersList", objectMapper.writeValueAsString(familyMembersList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<JsonData> frequencyList = getfrequency(model, request, 63);
		try {
			model.addAttribute("frequencyList", objectMapper.writeValueAsString(frequencyList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("partyId", partyId);
		model.addAttribute("saveAddFlag", saveAddFlag);
		model.addAttribute("title", "Add Assets : Mutual Fund");
		return "addMutualFunds";
	}
	
	@RequestMapping(value = "/addGolds/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String addGolds(Model model,HttpServletRequest request,@PathVariable String partyId) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		Map<String,Object> modelMap = model.asMap();
		//String partyId = (request.getParameter("partyId") == null ? (String)modelMap.get("partyId") : request.getParameter("partyId") );
		
		String token = "153443";
		List<JsonData> familyMembersList = getFamilyMembersList(model,partyId);
		try {
			model.addAttribute("familyMembersList", objectMapper.writeValueAsString(familyMembersList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("partyId", partyId);
		model.addAttribute("title", "Add Assets : Gold");
		return "addGolds";
	}
	
	/*@RequestMapping(value= "/editGolds/{partyId}/{assetId}", method= {RequestMethod.GET,RequestMethod.POST})
	public String editGolds(Model model, HttpServletRequest request, @PathVariable String partyId, @PathVariable Integer assetId) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException{
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		String token = "153443";
		
		List<AssetSummary> assetDataListAsJson = new ArrayList<AssetSummary>();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSETDETAILS +  "/" + userSession.getUserName() + "/" + partyId + "/" + assetId + "/" + token);
		//uriCB.queryParam("partyId", 115040);//userSession.getPartyId());
		uriCB.queryParam("buId", userSession.getBuId());
		BaseResponse<AssetSummary> baseResponse = new BaseResponse<AssetSummary>();
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		
		assetDataListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
		AssetSummary assetGold = null;
		assetGold = objectMapper.readValue(objectMapper.writeValueAsString(assetDataListAsJson.get(0)), AssetSummary.class);
		
		model.addAttribute("partyId", partyId);
		model.addAttribute("partyAssetId", assetId);
		List<JsonData> familyMembersList = getFamilyMembersList(model,request);
		try {
			model.addAttribute("familyMembersList", objectMapper.writeValueAsString(familyMembersList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("assetGold", assetGold);
		return "addGolds";
	}*/
	
	@RequestMapping(value = "/addProperties/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String addProperties(Model model,HttpServletRequest request,@PathVariable String partyId) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		Map<String,Object> modelMap = model.asMap();
		//String partyId = (request.getParameter("partyId") == null ? (String)modelMap.get("partyId") : request.getParameter("partyId") );
		
		String token = "153443";
		List<JsonData> familyMembersList = getFamilyMembersList(model,partyId);
		try {
			model.addAttribute("familyMembersList", objectMapper.writeValueAsString(familyMembersList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("partyId", partyId);
		model.addAttribute("title", "Add Assets : Property");
		return "addProperties";
	}
	
	@RequestMapping(value = "/addStocks/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String addStocks(Model model,HttpServletRequest request,@PathVariable String partyId) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		Map<String,Object> modelMap = model.asMap();
		//String partyId = (request.getParameter("partyId") == null ? (String)modelMap.get("partyId") : request.getParameter("partyId") );
		
		String token = "153443";
		List<JsonData> familyMembersList = getFamilyMembersList(model,partyId);
		try {
			model.addAttribute("familyMembersList", objectMapper.writeValueAsString(familyMembersList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("partyId", partyId);
		model.addAttribute("title", "Add Assets : Shares");
		return "addStocks";
	}
	
	@RequestMapping(value = "/assetAllocatedToGoal/{partyId}", method = {RequestMethod.GET})
	public String loadAssetAllocatedToGoal(Model model,HttpServletRequest request,@PathVariable String partyId) throws JsonGenerationException, JsonMappingException, IOException {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}				
		
		String userName = userSession.getUserName();
		Integer token = 123;
		Integer buId = userSession.getBuId();
		
		String contactRecordTypeId=null;
		String contactName = null;
		
		model.addAttribute("partyId",partyId);
		
		contactRecordTypeId = "2";//request.getParameter("RECORD_TYPE_ID");
		contactName = userSession.getName();//request.getParameter("CONTACT_NAME");
		
		model.addAttribute("contactRecordTypeId", contactRecordTypeId);
		model.addAttribute("contactName", request.getSession().getAttribute("headerName"));
		
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSET_ALLOCATION_TO_GOALS_URL + "/" + partyId + "/" + userName + "/"+ token +"?buId="+buId);
		BaseResponse<PartyGoals> baseResponse = new BaseResponse<PartyGoals>();
		
		List<PartyGoals> assetAllocatedToGoalsListAsJson = new ArrayList<PartyGoals>();
		List<PartyGoals> assetAllocatedToGoalsList = new ArrayList<PartyGoals>();
		PartyGoals partyGoals = new PartyGoals();
		
		List<AssetSummary> pieChartGoalsListAsJson = new ArrayList<AssetSummary>();
		List<AssetSummary> pieChartGoalsList = new ArrayList<AssetSummary>();
		AssetSummary assetSummary = new AssetSummary();
		
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				assetAllocatedToGoalsListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<assetAllocatedToGoalsListAsJson.size(); i++){
					partyGoals = new PartyGoals();
					partyGoals = objectMapper.readValue(objectMapper.writeValueAsString(assetAllocatedToGoalsListAsJson.get(i)), PartyGoals.class);
					assetAllocatedToGoalsList.add(partyGoals);
				}
				
				UriComponentsBuilder uri;
				uri = UriComponentsBuilder.fromHttpUrl(GET_PIE_CHART_FOR_GOALS + "/" + partyId + "/" + userName + "/" + token +"?buId="+buId);
				BaseResponse<AssetSummary> basePieChart = new BaseResponse<AssetSummary>();
				
				basePieChart = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uri), BaseResponse.class).getBody();
				if (basePieChart.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
					pieChartGoalsListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(basePieChart.getResponseListObject()), List.class);
					if( !(pieChartGoalsListAsJson.size() == 0) ){
						for(int i = 0; i<pieChartGoalsListAsJson.size(); i++){
							assetSummary = new AssetSummary();
							assetSummary = objectMapper.readValue(objectMapper.writeValueAsString(pieChartGoalsListAsJson.get(i)), AssetSummary.class);
							pieChartGoalsList.add(assetSummary);
						}
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
		model.addAttribute("listSize", assetAllocatedToGoalsList.size());
		model.addAttribute("assetAllocatedToGoalsList",assetAllocatedToGoalsList);
		model.addAttribute("pieChartGoalsList",objectMapper.writeValueAsString(pieChartGoalsList));
		
		return "assets/assetAllocatedToGoal";
	}
	
	@RequestMapping(value = "/editAssetAllocatedToGoal", method = {RequestMethod.POST})
	public String editAssetAllocatedToGoal(Model model,HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}				
		
		String userName = userSession.getUserName();
		Integer token = 123;
		Integer buId = userSession.getBuId();
		
		String partyId = request.getParameter("partyId");
		String goalId = request.getParameter("goalId");
		String goalDesc = request.getParameter("goalDesc");
		String currentValue = request.getParameter("currentValue");
		String futureValue = request.getParameter("futureValue");
		String goalDescription = request.getParameter("goalDescription");
		
		model.addAttribute("partyId",partyId);
		model.addAttribute("goalId",goalId);
		model.addAttribute("goalDesc", goalDesc);
		model.addAttribute("currentValue",currentValue);
		model.addAttribute("futureValue",futureValue);
		model.addAttribute("goalDescription", goalDescription);
		
		try { 
			model.addAttribute("assetTypeList",objectMapper.writeValueAsString(dropDownService.getAssetTypeList(userName)));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSET_ALLOCATION_TO_GOAL_URL + "/" + partyId + "/" + goalId + "/" + userName + "/"+ token +"?buId="+buId);
		BaseResponse<AssetAllocatedToGoal> baseResponse = new BaseResponse<AssetAllocatedToGoal>();
		
		List<AssetAllocatedToGoal> assetAllocatedToGoalListAsJson = new ArrayList<AssetAllocatedToGoal>();
		List<AssetAllocatedToGoal> assetAllocatedToGoalList = new ArrayList<AssetAllocatedToGoal>();
		AssetAllocatedToGoal assetAllocatedToGoal = new AssetAllocatedToGoal();
		
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				assetAllocatedToGoalListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<assetAllocatedToGoalListAsJson.size(); i++){
					assetAllocatedToGoal = new AssetAllocatedToGoal();
					assetAllocatedToGoal = objectMapper.readValue(objectMapper.writeValueAsString(assetAllocatedToGoalListAsJson.get(i)), AssetAllocatedToGoal.class);
					assetAllocatedToGoalList.add(assetAllocatedToGoal);
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
		
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_TOTAL_ASSET_ALLOCATION + "/" + partyId + "/" + userName + "/"+ token +"?buId="+buId);
		BaseResponse<AssetSummary> br = new BaseResponse<AssetSummary>();
		
		List<AssetSummary> assetSummaryListAsJson = new ArrayList<AssetSummary>();
		List<AssetSummary> assetSummaryList = new ArrayList<AssetSummary>();
		AssetSummary assetSummary = new AssetSummary();
		
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				assetSummaryListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), List.class);
				
				for(int i = 0; i<assetSummaryListAsJson.size(); i++){
					assetSummary = new AssetSummary();
					assetSummary = objectMapper.readValue(objectMapper.writeValueAsString(assetSummaryListAsJson.get(i)), AssetSummary.class);
					assetSummaryList.add(assetSummary);
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
		
		model.addAttribute("assetAllocatedToGoalList",assetAllocatedToGoalList);
		model.addAttribute("assetSummaryList",assetSummaryList);
		
		return "assets/editAssetAllocatedToGoal";	
	}
	
	@RequestMapping(value = "/getAssetNameList", method = RequestMethod.GET)		
	public synchronized @ResponseBody List<JsonData> getAssetNameList(HttpServletRequest request){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		
		if(null!=request.getParameter("partyId") && null!=request.getParameter("assetTypeId") && null!=request.getParameter("goalId") ){
			Integer partyId=Integer.parseInt(request.getParameter("partyId"));
			Integer assetTypeId=Integer.parseInt(request.getParameter("assetTypeId"));
			Integer goalId = Integer.parseInt(request.getParameter("goalId"));
			String userName=userSession.getUserName();
			return dropDownService.getAssetNameList(userName, assetTypeId, partyId, goalId);
		}else{
			return null;
		}

	}
	
	@RequestMapping(value = "/getAssetAvailableValue", method = RequestMethod.GET)		
	public synchronized @ResponseBody AssetAvailableValue getAssetAvailableValue(HttpServletRequest request){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		
		if(null!=request.getParameter("partyAssetId")){
			Integer partyAssetId=Integer.parseInt(request.getParameter("partyAssetId"));
			Integer goalId = Integer.parseInt(request.getParameter("goalId"));
			Integer partyId = Integer.parseInt(request.getParameter("partyId"));
			String userName=userSession.getUserName();
			AssetAvailableValue assetAvailableValue = new AssetAvailableValue();
			assetAvailableValue = dropDownService.getAssetAvailableValue(userName, partyAssetId, goalId, partyId); 
			return assetAvailableValue;
		}else{
			return null;
		}

	}
	
	@RequestMapping(value = "/saveAssetsAllocatedToGoal", method = {RequestMethod.POST})
	public String saveAssetsAllocatedToGoal(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		String userName = userSession.getUserName();
		Integer userId = userSession.getUserId();
		Integer token = 123;
		Integer buId = userSession.getBuId();
		String partyId = request.getParameter("partyId");
		String goalId = request.getParameter("goalId");
		String fpPlanId = request.getParameter("fpPlanId");
		String finalAssetTypes = request.getParameter("finalAssetTypes");
		String finalAssetNames = request.getParameter("finalAssetNames");
		String finalAllocatedAmount = request.getParameter("finalAllocatedAmount");
		String finalAssetAllocatedPercent = request.getParameter("finalAssetAllocatedPercent");
		String finalAssetAvailableValue = request.getParameter("finalAssetAvailableValue");
		
		String[] assetTypePieces = finalAssetTypes.split(",");
		String[] assetIdPieces = finalAssetNames.split(",");
		String[] amountPieces = finalAllocatedAmount.split(",");
		String[] allocatedPercentPieces = finalAssetAllocatedPercent.split(",");
		String[] availableValuePieces = finalAssetAvailableValue.split(",");
		
		AssetAllocatedToGoal allocatedToGoal = new AssetAllocatedToGoal();
		List<AssetAllocatedToGoal> allocatedToGoalList = new ArrayList<AssetAllocatedToGoal>();
			
		for(int i=0;i<assetIdPieces.length;i++){
			
			allocatedToGoal = new AssetAllocatedToGoal();
			
			if(i<amountPieces.length){
				allocatedToGoal.setPartyId(partyId);
				allocatedToGoal.setGoalId(goalId);
				allocatedToGoal.setUserId(""+userId);
				allocatedToGoal.setAssetTypeId(assetTypePieces[i]==""?"0":assetTypePieces[i]);
				allocatedToGoal.setPartyAssetId(assetIdPieces[i]==""?"0":assetIdPieces[i]);
				allocatedToGoal.setAllocatedAmount(amountPieces[i]==""?"0":amountPieces[i]);
				allocatedToGoal.setAllocatedPercent(allocatedPercentPieces[i]==""?"0":allocatedPercentPieces[i]);
				allocatedToGoal.setAvailableValue(availableValuePieces[i]==""?"0":availableValuePieces[i]);
			}
			
			allocatedToGoalList.add(allocatedToGoal);
			
		 }
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_TO_GOAL_URL + "/" + userName + "/" + token+"?buId="+buId);;
		
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), allocatedToGoalList, BaseResponse.class);
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			redirectAttributes.addFlashAttribute("success", "success.assetAllocation.save");
		}else{
			redirectAttributes.addFlashAttribute("error", "error.assetAllocation.save");
		}
		
		return "redirect:/assets/assetAllocatedToGoal/"+partyId;
		
		
	}
	
	@RequestMapping(value= "/editAssets/{partyId}/{assetId}", method= {RequestMethod.GET,RequestMethod.POST})
	public String editAssets(Model model, HttpServletRequest request, @PathVariable String partyId, @PathVariable Integer assetId, @RequestParam("assetType") String assetType) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException{
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		String token = "153443";
		List<AssetSummary> assetDataListAsJson = new ArrayList<AssetSummary>();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSETDETAILS +  "/" + userSession.getUserName() + "/" + partyId + "/" + assetId + "/" + token);
		//uriCB.queryParam("partyId", 115040);//userSession.getPartyId());
		uriCB.queryParam("buId", userSession.getBuId());
		BaseResponse<AssetSummary> baseResponse = new BaseResponse<AssetSummary>();
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		
		assetDataListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
		AssetSummary addAsset = null;
		addAsset = objectMapper.readValue(objectMapper.writeValueAsString(assetDataListAsJson.get(0)), AssetSummary.class);
		
		model.addAttribute("partyId", partyId);
		model.addAttribute("partyAssetId", assetId);
		List<JsonData> familyMembersList = getFamilyMembersList(model,partyId);
		try {
			model.addAttribute("familyMembersList", objectMapper.writeValueAsString(familyMembersList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if( assetType.equals("MF") ){
			if( addAsset.getFrequency() > 0 ){
				model.addAttribute("addSip", addAsset);
			}else {
				model.addAttribute("addLumpSum", addAsset);
			}
			List<PartyGoals> linkedGoals = getGoalsForAsset(model, request, partyId, 72004);
			model.addAttribute("linkedGoals", linkedGoals);
			List<JsonData> frequencyList = getfrequency(model, request, 63);
			try {
				model.addAttribute("frequencyList", objectMapper.writeValueAsString(frequencyList));
				model.addAttribute("title", "Edit Assets : Mutual Fund");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "addMutualFunds";
		}else if( assetType.equals("BD") ){
			if(addAsset.getAssetTypeId().equals(new Integer("48011"))){
				model.addAttribute("assetFixedDeposit", addAsset);
			}else if(addAsset.getAssetTypeId().equals(new Integer("48053"))){
				model.addAttribute("assetRecurringDeposit",addAsset);
			}else if(addAsset.getAssetTypeId().equals(new Integer("48052"))){
				model.addAttribute("assetSavingDeposit",addAsset);
			}
			List<PartyGoals> linkedGoals = getGoalsForAsset(model, request, partyId, 72003);
			model.addAttribute("linkedGoals", linkedGoals);
			model.addAttribute("title", "Edit Assets : Deposits");
			return "addBankDeposits";
		}else if( assetType.equals("RE") ){
			if( addAsset.getAssetTypeId().equals(new Integer("48008"))){
				model.addAttribute("addPPF", addAsset);
			}else if( addAsset.getAssetTypeId().equals(new Integer("48012"))){
				model.addAttribute("addEPF", addAsset);
			}else if( addAsset.getAssetTypeId().equals(new Integer("48061"))){
				model.addAttribute("addPP", addAsset);
			}else if( addAsset.getAssetTypeId().equals(new Integer("48062"))){
				model.addAttribute("addNPS", addAsset);
			}else if( addAsset.getAssetTypeId().equals(new Integer("48063"))){
				model.addAttribute("addOthers", addAsset);
			}
			List<PartyGoals> linkedGoals = getGoalsForAsset(model, request, partyId, 72008);
			model.addAttribute("linkedGoals", linkedGoals);
			model.addAttribute("title", "Edit Assets : Retirement Funds");
			return "addRetirementFunds";
		}else if( assetType.equals("Pro") ){
			model.addAttribute("assetProperty", addAsset);
			model.addAttribute("title", "Edit Assets : PROPERTY");
			List<PartyGoals> linkedGoals = getGoalsForAsset(model, request, partyId, 72002);
			model.addAttribute("linkedGoals", linkedGoals);
			return "addProperties";
		}else if( assetType.equals("Stock") ){
			model.addAttribute("assetStock", addAsset);
			model.addAttribute("title", "Edit Assets : Shares");
			List<PartyGoals> linkedGoals = getGoalsForAsset(model, request, partyId, 72001);
			model.addAttribute("linkedGoals", linkedGoals);
			return "addStocks";
		}else if( assetType.equals("Gold") ){
			model.addAttribute("assetGold", addAsset);
			model.addAttribute("title", "Edit Assets : Gold");
			List<PartyGoals> linkedGoals = getGoalsForAsset(model, request, partyId, 72006);
			model.addAttribute("linkedGoals", linkedGoals);
			return "addGolds";
		}else {
			model.addAttribute("assetOther", addAsset);
			List<PartyGoals> linkedGoals = getGoalsForAsset(model, request, partyId, 72007);
			model.addAttribute("linkedGoals", linkedGoals);
			List<JsonData> frequencyList = getfrequency(model, request, 72007);
			try {
				model.addAttribute("frequencyList", objectMapper.writeValueAsString(frequencyList));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("title", "Edit Assets : Other");
			return "addOther";
		}
	}
	
	public static List<AssetSummary> findDuplicates(List<AssetSummary> listContainingDuplicates) {
		
		Set<AssetSummary> set = new TreeSet<AssetSummary>(new Comparator<AssetSummary>() {

			@Override
			public int compare(AssetSummary o1, AssetSummary o2) {
				if( o1.getPartyAssetId().equals(o2.getPartyAssetId()) ){
					return 0;
				}
				return 1;
			}
		});
		set.addAll(listContainingDuplicates);
		List<AssetSummary> assetList = new ArrayList<AssetSummary>(set);
		return assetList;
	}
	
	@RequestMapping(value = "/getAssetProductList", method = RequestMethod.GET)		
	public synchronized @ResponseBody List<JsonData> getAssetProductList(HttpServletRequest request){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		
		if(null!=request.getParameter("productData") && !request.getParameter("productData").isEmpty()){
			String productData=request.getParameter("productData");
			Integer assetTypeId=Integer.parseInt(request.getParameter("assetTypeId"));
			String userName=userSession.getUserName();
			return getProductNamesList(request, productData, assetTypeId, userName);		
		}else{
			return null;
		}

	}
	
	public synchronized List<JsonData> getProductNamesList(HttpServletRequest request,String productData,Integer assetTypeId,String userName) {
		
		UriComponentsBuilder uriCB;
		/*String manufactureId = request.getParameter("manufactureId");
		String categoryId = request.getParameter("categoryId");*/
		String token = "12345";
		String buId = "153";
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_PRODUCTS_FOR_ASSET+"/" + productData + "/" + assetTypeId + "/" + userName + "/"+ token +"?buId="+buId);
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
	
	@RequestMapping(value="/getManufacturer", method=RequestMethod.GET)
	@ResponseBody
	public String getManufacturer(HttpServletRequest request){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		String productId = request.getParameter("productId");
		String token = "12345";
		Integer buId = userSession.getBuId(); 
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_MANUFACTURER_FOR_ASSET+"/" + productId + "/" + userSession.getUserName() + "/"+ token +"?buId="+buId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		KeyValue keyValue = new KeyValue();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				keyValue = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), KeyValue.class);
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
		
		if( null != keyValue && null != keyValue.getName() ){
			return keyValue.getName(); 
		}else {
			return null;
		}
		
	}
	
	@RequestMapping(value="/getGoalsAllocatedToAsset", method=RequestMethod.GET)
	@ResponseBody
	public synchronized List<PartyGoals> getGoalsAllocatedToAsset( HttpServletRequest request ){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		
		String assetTypeId = request.getParameter("assetTypeId");
		String partyId = request.getParameter("partyId");
		String token = "12345";
		Integer buId = userSession.getBuId(); 
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_GOLAS_ALLOCATED_TO_ASSET+"/" + assetTypeId + "/" + partyId + "/" + userSession.getUserName() + "/"+ token +"?buId="+buId);
		
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		List<PartyGoals> partyGoalAsJsonList = new ArrayList<PartyGoals>();
		PartyGoals partyGoals = null;
		List<PartyGoals> partyGoalList = new ArrayList<PartyGoals>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				partyGoalAsJsonList = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<partyGoalAsJsonList.size(); i++){
					partyGoals = new PartyGoals();
					partyGoals = objectMapper.readValue(objectMapper.writeValueAsString(partyGoalAsJsonList.get(i)), PartyGoals.class);
					partyGoalList.add(partyGoals);
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
		
		if( null != partyGoalList ){
			return partyGoalList; 
		}else {
			return null;
		}
	}
	
	@RequestMapping(value = "/deleteAssetDetail/{partyAssetId}/{partyId}/{assetPage}", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteAssetDetail(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes,@PathVariable("partyAssetId") Integer partyAssetId,@PathVariable("partyId") String partyId, @PathVariable("assetPage") Integer assetPage) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException 
	{
	   UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
	   if(userSession == null) {
	     return "redirect:/login";
	   }
	   	Integer buId = userSession.getBuId();
		String token = "12354";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(DELETE_ASSET_DETAIL+ "/"+partyAssetId+"/"+partyId+"/"+userSession.getUserName()+"/"+token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){	
			Boolean flag = baseResponse.getResponseObject();
			if(flag==true)
			{
				redirectAttributes.addFlashAttribute("success", "Record deleted successfully");
			}
			else
			{
				redirectAttributes.addFlashAttribute("error", "Error while deleteing record");
			}
				
		}		
	
	    return "redirect:/assets/assetDetails"+"/"+partyId+"/"+0+"?assetPage="+assetPage;
	}
	
	public List<PartyGoals> getGoalsForAsset( Model model, HttpServletRequest request, String partyId, Integer assetTypeId ){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		String token = "153443";
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_GOALS_FOR_ASSETS +  "/" + partyId + "/" + assetTypeId + "/" + userSession.getUserName() + "/" + token);
		//uriCB.queryParam("partyId", 115040);//userSession.getPartyId());
		uriCB.queryParam("buId", userSession.getBuId());
		List<PartyGoals> keyValueListAsJson = new ArrayList<PartyGoals>();
		List<PartyGoals> keyValueList = new ArrayList<PartyGoals>(); 
		BaseResponse<PartyGoals> baseResponse = new BaseResponse<PartyGoals>();
		/*jsonData.setValue(-1);
		jsonData.setText("---Select---");
		keyValueList.add(jsonData);*/
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				//restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partySettingInput, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				keyValueListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				for(int i = 0; i<keyValueListAsJson.size(); i++){										
					PartyGoals keyValue = null;
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(keyValueListAsJson.get(i)), PartyGoals.class);
					keyValueList.add(keyValue);
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
		return keyValueList;
	}
	
	public List<QuestionDetails> getDcInputData(String userId, String partyId, String buId, 
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
