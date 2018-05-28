/**
 * 
 */
package in.fiinfra.common.recommendations;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.PartySetting;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.DataTypeEnum;
import in.fiinfra.common.util.DropDownJson;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.framework.models.Audit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

/**
 * @author Kunal
 *
 */
@Lazy 
@Component  
@RequestMapping("/partner")
public class AssumptionController {
	private static final Logger LOGGER = Logger.getLogger(AssumptionController.class);
	
	@Value("${GET_ASSUMPTIONS}")
	private String GET_ASSUMPTIONS;
	
	@Value("${SAVE_ASSUMPTIONS}")
	private String SAVE_ASSUMPTIONS;
	
	@Value("${GET_PRODUCT_CATEGORY}")
	private String GET_PRODUCT_CATEGORY;
	
	@Value("${GET_COMPANY_NAME}")
	private String GET_COMPANY_NAME;
	
	@Value("${GET_PRODUCTS_NAME}")
	private String GET_PRODUCTS_NAME;
	
	@Value("${SET_DEFAULT_ASSUMPIONS_URL}")
	private String SET_DEFAULT_ASSUMPIONS;
	
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	private static String ASSUMPTIONS_SOURCE = "Assumptions";
	
	@RequestMapping(value = "/recommendation", method = {RequestMethod.GET, RequestMethod.POST})
	public String loadRecommendations(Model model,HttpServletRequest request) {
		request.getSession().removeAttribute("goalPlanSession");
		return "recommendation/adviceRecommendations";
	}
	@RequestMapping(value = "/assumption", method = RequestMethod.GET)
	public String loadAssumptions(Model model,HttpServletRequest request) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		Integer partnerPartyId = userSession.getPartyId();  
		Integer buId = userSession.getBuId(); 
		//Integer buPartyId = 27827;
		String attributeCodeIds = "98021,98022,98032,98002,98047,98045,98028,98020,98055,98027,98046,98019,98001";
		
		String token = "153443";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSUMPTIONS + "/" + token +"?buId="+buId);
		List<PartySetting> partySettingListAsJson = new ArrayList<PartySetting>();
		BaseResponse<PartySetting> baseResponse = new BaseResponse<PartySetting>();
		
		List<AdviceAssumption> adviceAssumptionList = new ArrayList<AdviceAssumption>();
		PartySettingInput partySettingInput = new PartySettingInput();
		
		//partySettingInput.setClientPartyId(null);
		partySettingInput.setPartnerPartyId(partnerPartyId);
		partySettingInput.setBuPartyId(buId);
		partySettingInput.setAssumptionCodeIds(attributeCodeIds);
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partySettingInput, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				partySettingListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			}
		} 
		
		for(int i = 0; i<partySettingListAsJson.size(); i++){
			try {
			//get the actual party object from its LinkedHashMap representation				
				AdviceAssumption adviceAssumption = new AdviceAssumption();
				adviceAssumption = objectMapper.readValue(objectMapper.writeValueAsString(partySettingListAsJson.get(i)), AdviceAssumption.class);
				adviceAssumptionList.add(adviceAssumption);
				switch(adviceAssumption.getAssumptionCodeId()) {
				case 98021:
					//dont store the id for bu data
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("estmtLifeExpectancyId",adviceAssumption.getId());
					}
					model.addAttribute("estmtLifeExpectancy", adviceAssumption);
					break;
				case  98022 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("dfltRetirementAgeId",adviceAssumption.getId());
					}
					model.addAttribute("dfltRetirementAge",adviceAssumption);
					break;
				case  98032 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("expctdRtrnOnAllExstInvstmentId",adviceAssumption.getId());
					}
					model.addAttribute("expctdRtrnOnAllExstInvstment",adviceAssumption);
					break;
				case  98002 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("annualearninggrowthRateId",adviceAssumption.getId());
					}
					model.addAttribute("annualearninggrowthRate",adviceAssumption);
					break;
				case  98047 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("inflationRateId",adviceAssumption.getId());
					}
					model.addAttribute("inflationRate",adviceAssumption);
					break;
				case  98045 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("goldInvstmntReturnId",adviceAssumption.getId());
					}
					model.addAttribute("goldInvstmntReturn",adviceAssumption);
					break;
				case  98028 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("equityInvstmntReturnId",adviceAssumption.getId());
					}
					model.addAttribute("equityInvstmntReturn",adviceAssumption);
					break;
				case  98020 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("fixedIncomereturnId",adviceAssumption.getId());
					}
					model.addAttribute("fixedIncomereturn",adviceAssumption);
					break;
				case  98055 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("realEstateGrowthrateId",adviceAssumption.getId());
					}
					model.addAttribute("realEstateGrowthrate",adviceAssumption);
					break;
				case  98027 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("emergencyFundrequiredId",adviceAssumption.getId());
					}
					model.addAttribute("emergencyFundrequired",adviceAssumption);
					break;
				case  98046 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("healthInsuranceCoverAmntId",adviceAssumption.getId());
					}
				Integer startRange = Integer.parseInt(adviceAssumption.getValueStartRange())/100000;
				Integer endrange = Integer.parseInt(adviceAssumption.getValueEndRange())/100000;
				adviceAssumption.setValueStartRange(startRange.toString());
				adviceAssumption.setValueEndRange(endrange.toString());
				adviceAssumption.setAssumptionValue(Integer.parseInt((String)adviceAssumption.getAssumptionValue())/100000);
					model.addAttribute("healthInsuranceCoverAmnt",adviceAssumption);
					break;
				case  98019 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("criticalIllnessCoverAmntId",adviceAssumption.getId());
					}
					model.addAttribute("criticalIllnessCoverAmnt",adviceAssumption);
					break;
				case  98001 : 
					if(adviceAssumption.getRecordTypeId()!=14002){
						model.addAttribute("accdntInsuranceCoverAmntId",adviceAssumption.getId());
					}
					model.addAttribute("accdntInsuranceCoverAmnt",adviceAssumption);
					break;
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			}
		}
		
		// new code
		String defaultValString = "";
		partySettingInput.setAssumptionCodeIds(attributeCodeIds);
		List<PartySetting> defaultValueList = new ArrayList<PartySetting>(); 
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), partySettingInput, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				defaultValueList = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
			} catch (Exception e) {
				LOGGER.error(e);
			} 
		}
		
		for(int i = 0; i<partySettingListAsJson.size(); i++){
			try {			
				AdviceAssumption adviceAssumption = new AdviceAssumption();
				adviceAssumption = objectMapper.readValue(objectMapper.writeValueAsString(defaultValueList.get(i)), AdviceAssumption.class);
				switch(adviceAssumption.getAssumptionCodeId()) {
				case 98021:					
					model.addAttribute("defaultEstmtLifeExpectancy", adviceAssumption.getAssumptionValue());
					break;
				case  98022 : 					
					model.addAttribute("defaultDfltRetirementAge",adviceAssumption.getAssumptionValue());
					break;
				case  98032 : 
					model.addAttribute("defaultExpctdRtrnOnAllExstInvstment",adviceAssumption.getAssumptionValue());
					break;
				case  98002 : 
					model.addAttribute("defaultAnnualearninggrowthRate",adviceAssumption.getAssumptionValue());
					break;
				case  98047 : 
					model.addAttribute("defaultInflationRate",adviceAssumption.getAssumptionValue());
					break;
				case  98045 : 
					model.addAttribute("defaultGoldInvstmntReturn",adviceAssumption.getAssumptionValue());
					break;
				case  98028 : 
					model.addAttribute("defaultEquityInvstmntReturn",adviceAssumption.getAssumptionValue());
					break;
				case  98020 : 
					model.addAttribute("defaultFixedIncomereturn",adviceAssumption.getAssumptionValue());
					break;
				case  98055 : 
					model.addAttribute("defaultRealEstateGrowthrate",adviceAssumption.getAssumptionValue());
					break;
				case  98027 : 
					model.addAttribute("defaultEmergencyFundrequired",adviceAssumption.getAssumptionValue());
					break;
				case  98046 : 
				Integer scale = 100000;
				Integer amount = Integer.parseInt((String)adviceAssumption.getAssumptionValue());
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
				adviceAssumption.setAssumptionValue(Integer.parseInt((String)adviceAssumption.getAssumptionValue())/scale);
					model.addAttribute("defaultHealthInsuranceCoverAmnt",adviceAssumption.getAssumptionValue());					
					break;
				case  98019 : 
					model.addAttribute("defaultCriticalIllnessCoverAmnt",adviceAssumption.getAssumptionValue());
					break;
				case  98001 : 
					model.addAttribute("defaultAccdntInsuranceCoverAmnt",adviceAssumption.getAssumptionValue());
					break;
				/*case 98099 :
					model.addAttribute("defaultLifeInsuranceMethodAmnt",adviceAssumption.getAssumptionValue());
					break;*/
				}
			} catch(Exception e) {
					LOGGER.error(e);
			}
		}
		// new code end
		model.addAttribute("recordTypeId",adviceAssumptionList.get(0).getRecordTypeId());
		model.addAttribute("id",adviceAssumptionList.get(0).getId());
		return "assumption";
	}
	
	@RequestMapping(value = "/saveAssumptions", method = RequestMethod.POST)
	public ModelAndView saveAssumptions(Model model,HttpServletRequest request) {
		
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			modelAndView = new ModelAndView("redirect:/login");
		}
		Integer partyId = userSession.getPartyId();
		Integer buId = userSession.getBuId();
		//String id = request.getParameter("id");
		String modifiedData = request.getParameter("finalData");
		String initialData = request.getParameter("initialData");
		if(initialData.equalsIgnoreCase(modifiedData)){
			modelAndView = new ModelAndView("redirect:/partner/dashboard");
		}else{
		String[] modifiedDataArray = request.getParameter("finalData").split(",");
		List<AdviceAssumption> adviceAssumptionList = new ArrayList<AdviceAssumption>();
		for(int i = 0;i<modifiedDataArray.length;i++){
			AdviceAssumption adviceAssumption = new AdviceAssumption();
			adviceAssumption.setAssumptionValue(modifiedDataArray[i]);
			adviceAssumption.setPartyId(partyId);
			if(request.getParameter("recordTypeId").equalsIgnoreCase("14002")){
			adviceAssumption.setRecordTypeId(14003);//TODO need to confirm --setRecordTypeId
			adviceAssumption.setId(null);
			}else{
				adviceAssumption.setRecordTypeId(Integer.parseInt(request.getParameter("recordTypeId")));//TODO need to confirm --setRecordTypeId
				//adviceAssumption.setId(Integer.parseInt(request.getParameter("id")));estmtLifeExpectancyId
			}
			switch(i) {
			case 0 : adviceAssumption.setAssumptionCodeId(98021);
					 adviceAssumption.setId(request.getParameter("estmtLifeExpectancyId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("estmtLifeExpectancyId")));
					 adviceAssumption.setValueDataTypeId(DataTypeEnum.INTEGER.getCodeValueId());
					 adviceAssumption.setDisplayLabel("Estimated Life Expectancy");
					 break;
			case 1 : adviceAssumption.setAssumptionCodeId(98022);//TODO change it
					 adviceAssumption.setId(request.getParameter("dfltRetirementAgeId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("dfltRetirementAgeId")));
					 adviceAssumption.setValueDataTypeId(DataTypeEnum.INTEGER.getCodeValueId());
					 adviceAssumption.setDisplayLabel("Set your default retirement age");
			 		 break;
			case 2 : adviceAssumption.setAssumptionCodeId(98032);
					 adviceAssumption.setId(request.getParameter("expctdRtrnOnAllExstInvstmentId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("expctdRtrnOnAllExstInvstmentId")));
					 adviceAssumption.setValueDataTypeId(DataTypeEnum.PERCENTAGE.getCodeValueId());
					 adviceAssumption.setDisplayLabel("Expected Returns on all existing Investment(%)");
	 		 		 break;
			case 3 : adviceAssumption.setAssumptionCodeId(98002);
					 adviceAssumption.setId(request.getParameter("annualearninggrowthRateId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("annualearninggrowthRateId")));
					 adviceAssumption.setValueDataTypeId(DataTypeEnum.PERCENTAGE.getCodeValueId());
					 adviceAssumption.setDisplayLabel("Annual Earning Growth Rate(%)");
	 		 		 break;
			case 4 : adviceAssumption.setAssumptionCodeId(98047);
					 adviceAssumption.setId(request.getParameter("inflationRateId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("inflationRateId")));
					 adviceAssumption.setValueDataTypeId(DataTypeEnum.PERCENTAGE.getCodeValueId());
					 adviceAssumption.setDisplayLabel("Inflation Rate(%)");
					 break;
			case 5 : adviceAssumption.setAssumptionCodeId(98045);
					 adviceAssumption.setId(request.getParameter("goldInvstmntReturnId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("goldInvstmntReturnId")));
					 adviceAssumption.setValueDataTypeId(DataTypeEnum.PERCENTAGE.getCodeValueId());
					 adviceAssumption.setDisplayLabel("Gold investments returns (%) CAGR expected");
			 		 break;
			case 6 : adviceAssumption.setAssumptionCodeId(98028);
					 adviceAssumption.setId(request.getParameter("equityInvstmntReturnId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("equityInvstmntReturnId")));
					 adviceAssumption.setValueDataTypeId(DataTypeEnum.PERCENTAGE.getCodeValueId());
					 adviceAssumption.setDisplayLabel("Equity investments returns (%) CAGR expected");
	 		 		 break;
			case 7 : adviceAssumption.setAssumptionCodeId(98020);
					 adviceAssumption.setId(request.getParameter("fixedIncomereturnId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("fixedIncomereturnId")));
					 adviceAssumption.setValueDataTypeId(DataTypeEnum.PERCENTAGE.getCodeValueId());
					 adviceAssumption.setDisplayLabel("Fixed income returns (%)");
	 		 		 break; 
			case 8 : adviceAssumption.setAssumptionCodeId(98055);
					 adviceAssumption.setId(request.getParameter("realEstateGrowthrateId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("realEstateGrowthrateId")));
					 adviceAssumption.setValueDataTypeId(DataTypeEnum.PERCENTAGE.getCodeValueId());
					 adviceAssumption.setDisplayLabel("Estimated Life ExpectancyReal Estate investments growth rate (%) CAGR expected");
	 		 		 break;
			case 9 : adviceAssumption.setAssumptionCodeId(98027);
					adviceAssumption.setId(request.getParameter("emergencyFundrequiredId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("emergencyFundrequiredId")));
					 adviceAssumption.setValueDataTypeId(DataTypeEnum.INTEGER.getCodeValueId());
					 adviceAssumption.setDisplayLabel("Emergency Funds Required - XX times monthly expense");
	 		 		 break;
		    case 10 : adviceAssumption.setAssumptionCodeId(98046);
		    		adviceAssumption.setId(request.getParameter("healthInsuranceCoverAmntId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("healthInsuranceCoverAmntId")));
		    		  adviceAssumption.setValueDataTypeId(DataTypeEnum.AMOUNT.getCodeValueId());
		    		  String covertedVal = (String)adviceAssumption.getAssumptionValue();
		    		  adviceAssumption.setAssumptionValue(Integer.parseInt(covertedVal)*100000);
		    		  adviceAssumption.setDisplayLabel("Health Insurance cover amount");
	 		 		  break;
		    case 11 : adviceAssumption.setAssumptionCodeId(98019);
		    		adviceAssumption.setId(request.getParameter("criticalIllnessCoverAmntId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("criticalIllnessCoverAmntId")));
		    		  adviceAssumption.setValueDataTypeId(DataTypeEnum.INTEGER.getCodeValueId());
		    		  adviceAssumption.setDisplayLabel("Critical Illness Insurance cover amount (XX times monthly income)");
	 		  		  break;
		    case 12 : adviceAssumption.setAssumptionCodeId(98001);
		    		adviceAssumption.setId(request.getParameter("accdntInsuranceCoverAmntId").equalsIgnoreCase("")?null:Integer.parseInt(request.getParameter("accdntInsuranceCoverAmntId")));
		    		  adviceAssumption.setValueDataTypeId(DataTypeEnum.INTEGER.getCodeValueId());
		    		  adviceAssumption.setDisplayLabel("Accident Disability Insurance cover amount (XX times monthly income)");
	 		 		  break;
			}
			adviceAssumptionList.add(adviceAssumption);
		}
		
		String token = "153443";
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_ASSUMPTIONS+ "/" + token+"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceAssumptionList, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		modelAndView = new ModelAndView("redirect:/partner/dashboard");
		audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_ASSUMPTIONS_SUCCESSFUL,ASSUMPTIONS_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_ASSUMPTIONS);
		}
		else {
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_ASSUMPTIONS_FAILED,ASSUMPTIONS_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_ASSUMPTIONS);
		}
		}
		return modelAndView;
	} 
	
	@RequestMapping(value = "/setDefault", method = RequestMethod.POST)
	public void setDefault(HttpServletRequest request,HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		Integer partyId = null;
		Integer buId = userSession.getBuId();
		
		Integer clientPartyId=-1;
		String clientParty = request.getParameter("partyId");
		if(clientParty != null ) {
			if(!clientParty.equals(""))
				clientPartyId = Integer.parseInt(clientParty);
		}
		
		if(clientPartyId == -1) {
			partyId = userSession.getPartyId();
		}
		else {
			partyId = clientPartyId;
		}
		
		String token = "153443";
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SET_DEFAULT_ASSUMPIONS + "/"+ partyId +"/" + token+"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		
		// call service to delete the created record for party id
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		//baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceAssumptionList, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			
		}else{
		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, FiinfraConstants.SUCCESS);
	}
	@RequestMapping(value = "/vacationPlanning1", method = RequestMethod.GET)
	public String loadVacationPlanning(Model model,HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			modelAndView = new ModelAndView("redirect:/login");
		}
		Integer partyId = userSession.getPartyId();
		Integer buId = userSession.getBuId();
		DropDownJson dropDownJson = new DropDownJson();
		
		String token = "153443";
		UriComponentsBuilder uriCB;
		Integer vacationId = 47009;
		
		List<JsonData> jsonDataList = new ArrayList<JsonData>();
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_PRODUCT_CATEGORY+ "/" + vacationId+ "/"+ token +"?buId="+buId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		List<KeyValue> prodCategoryAsJson = new ArrayList<KeyValue>();
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				prodCategoryAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<prodCategoryAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(prodCategoryAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					jsonDataList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			}
		}
		model.addAttribute("dropDownData",objectMapper.writeValueAsString(jsonDataList));
		return "vacationPlanning";
	}
	@RequestMapping(value = "/getComapnyNames", method = RequestMethod.GET)
	public @ResponseBody List<JsonData> getCompanyname(HttpServletRequest request){
		return getCompanynameList(request);
	} 
	
	public List<JsonData> getCompanynameList(HttpServletRequest request){
		String token = "153443";
		UriComponentsBuilder uriCB;
		String categoryId = request.getParameter("categoryId");//48016;
		Integer buId = 153;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_COMPANY_NAME+ "/" + categoryId+ "/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		List<KeyValue> comapanynamesListAsJson = new ArrayList<KeyValue>();
		List<JsonData> comapanynamesList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---select---");
		comapanynamesList.add(jsonDataDefault);
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				comapanynamesListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<comapanynamesListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(comapanynamesListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					comapanynamesList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			}
		}
		return comapanynamesList;  
	}
	
	@RequestMapping(value = "/getProductNames", method = RequestMethod.GET)
	public @ResponseBody List<JsonData> getProductNames(HttpServletRequest request){
		return getProductNamesList(request);
	}
	
	public List<JsonData> getProductNamesList(HttpServletRequest request){ 
		String token = "153443";
		UriComponentsBuilder uriCB;
		String manufactureId = request.getParameter("manufactureId");
		String categoryId = request.getParameter("categoryId");
		if(StringUtils.isEmpty(manufactureId) || StringUtils.isEmpty(categoryId)){
			return new ArrayList<JsonData>();
		}
		Integer buId = 153;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_PRODUCTS_NAME+ "/" +manufactureId + "/"+ categoryId+ "/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		List<KeyValue> productnamesListAsJson = new ArrayList<KeyValue>();
		List<JsonData> productnamesList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---select---");
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
				LOGGER.error(e);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			}
		}
		return productnamesList;
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
}
