package in.fiinfra.insurance;

import in.fiinfra.common.common.InsuranceData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.cp.IncomeData;
import in.fiinfra.partner.controller.PartnerProfileController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Request;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;
import org.apache.log4j.Logger;

@Controller
@RequestMapping("/insurance")
public class InsuranceController {

	@Autowired
	private ObjectMapper objectMapper;
	
	@Autowired
	RestTemplate restTemplate;
	
	@Value("${GET_INSURANCE_SUMMARY}")
	private String GET_INSURANCE_SUMMARY;
	
	@Value("${GET_INSURANCE_LIST}")
	private String GET_INSURANCE_LIST;
	
	@Value("${GET_REALTIONSHIP_FOR_PARTY}")
	private String GET_REALTIONSHIPID_FOR_PARTY;
	
	@Value("${GET_INSURANCE_DETAILS}")
	private String GET_INSURANCE_DETAILS;
	
	@Value("${SAVE_INSURANCE_DETAILS}")
    private String SAVE_INSURANCE_DETAILS;
	
	@Value("${DELETE_INSURANCE_DETAILS}")
	private String DELETE_INSURANCE_DETAILS;
	
	@Value("${GET_FAMILY_MEMBERS}")
	private String GET_FAMILY_MEMBERS;
	
	@Value("${FETCH_DC_INPUTDATA}")
	private String FETCH_DC_INPUTDATA;
	
	private static final Logger LOGGER = Logger.getLogger(InsuranceController.class);
	
	@RequestMapping(value = "/showInsuranceSummary/{insuranceType}/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
	 public String showIncome(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes,@PathVariable String insuranceType,@PathVariable String partyId) 
	 {
	  try {
	    String userName = null;
	    UserSession userSession = null;
	    if(request !=null)
	    {
	     userSession = (UserSession) request.getSession().getAttribute("userSession");
	     if(userSession == null) {
	      userName = "ramu";//
	     }
	     userName = userSession.getUserName();
	    }
	    
	    String token = "1234";
	        
	    String insuranceTypes = "73001,73002,73003,73004,73005,73006,73007,73008";
	    
	    InsuranceData insuranceData = new InsuranceData();
	    insuranceData.setPartyID(Integer.parseInt(partyId));
	    insuranceData.setInsuranceTypeIds(insuranceTypes);
	    
	    String url = GET_INSURANCE_SUMMARY + userName +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId(); 
	    UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	    BaseResponse<InsuranceData> br = new BaseResponse<InsuranceData>();
	      
	    br = restTemplate.postForObject(url, insuranceData, BaseResponse.class);
	   
	    List<InsuranceData> insuranceListAsJson = new ArrayList<InsuranceData> ();
	    List<InsuranceData> insurance = new ArrayList<InsuranceData> (8);
	    for(int i=0; i<8;i++) {
	     InsuranceData object = new InsuranceData();
	     object.setGoalCount(0);
	     object.setRequiredAmount(0.0);
	     object.setInsuranceCoverAmount(0.0);
	     object.setCurrentValue(0.0);
	     object.setAllocatedAmount(0.0);
	     insurance.add(object);
	    }
	   
	    if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
	     insuranceListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
	    }
	    else {
	     return "redirect:/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/2";
	    }
	   
	    int size = insuranceListAsJson.size();
	    for(int i = 0; i<size; i++){    
	     InsuranceData insuranceObject = objectMapper.readValue(objectMapper.writeValueAsString(insuranceListAsJson.get(i)), InsuranceData.class);	     
	    }
	    
	    String str73002="",str73003="",str73004="";
	    String ulipString="",endowmentString="",moneyBackString="";
	    int ulipGoalCount=0,endwGoalCount=0,moneyBackGoalCount=0; 
	    
	    for(int i = 0; i<size; i++){    
	     InsuranceData insuranceObject = objectMapper.readValue(objectMapper.writeValueAsString(insuranceListAsJson.get(i)), InsuranceData.class);
	     
	     if(insuranceObject.getInsuranceTypeID()==73005) {	      	     
	      insurance.get(0).setInsuranceCoverAmount(insurance.get(0).getInsuranceCoverAmount()+insuranceObject.getInsuranceCoverAmount());	      
	     } else if(insuranceObject.getInsuranceTypeID()==73006) {	      	    
	      insurance.get(1).setInsuranceCoverAmount(insurance.get(1).getInsuranceCoverAmount()+insuranceObject.getInsuranceCoverAmount());	      
	     } else if(insuranceObject.getInsuranceTypeID()==73007) {	      
	      insurance.get(2).setInsuranceCoverAmount(insurance.get(2).getInsuranceCoverAmount()+insuranceObject.getInsuranceCoverAmount());	      
	     }else if(insuranceObject.getInsuranceTypeID()==73008) {	      
	      insurance.get(3).setInsuranceCoverAmount(insurance.get(3).getInsuranceCoverAmount()+insuranceObject.getInsuranceCoverAmount());	      
	     } else if(insuranceObject.getInsuranceTypeID()==73001) {	      
	      insurance.get(4).setInsuranceCoverAmount(insurance.get(4).getInsuranceCoverAmount()+insuranceObject.getInsuranceCoverAmount());	      
	     } else if(insuranceObject.getInsuranceTypeID()==73002) {
	
		    if((!ulipString.contains(insuranceObject.getGoalCount().toString())) && insuranceObject.getGoalCount()!=0 ){	
			    	  ulipGoalCount++;
			    	  insurance.get(5).setGoalCount(ulipGoalCount);
			    	  ulipString +="_"+insuranceObject.getGoalCount().toString();
		      }
		      if(! str73002.contains(insuranceObject.getPartyInsuranceId().toString())){
		    	  insurance.get(5).setInsuranceCoverAmount(insurance.get(5).getInsuranceCoverAmount()+insuranceObject.getCurrentValue());
		    	  str73002 = insuranceObject.getPartyInsuranceId().toString();
		      }
		      insurance.get(5).setAllocatedAmount(insurance.get(5).getAllocatedAmount()+insuranceObject.getAllocatedAmount());
		   } else if(insuranceObject.getInsuranceTypeID()==73003) {
	    	
	    	 if( (! endowmentString.contains(insuranceObject.getGoalCount().toString())) && insuranceObject.getGoalCount()!=0){	
	    		  endwGoalCount++;
	    		  insurance.get(6).setGoalCount(endwGoalCount);
		    	  endowmentString +="_"+insuranceObject.getGoalCount().toString();
		      } 
		      if(! str73003.contains(insuranceObject.getPartyInsuranceId().toString())){
		    	  insurance.get(6).setInsuranceCoverAmount(insurance.get(6).getInsuranceCoverAmount()+insuranceObject.getCurrentValue());
		    	  str73003 = insuranceObject.getPartyInsuranceId().toString();
		      }
		      insurance.get(6).setAllocatedAmount(insurance.get(6).getAllocatedAmount()+insuranceObject.getAllocatedAmount());
		   } else if(insuranceObject.getInsuranceTypeID()==73004) {
	    	 if((! moneyBackString.contains(insuranceObject.getGoalCount().toString())) && insuranceObject.getGoalCount()!=0){	
	    		  moneyBackGoalCount++;
	    		  insurance.get(7).setGoalCount(moneyBackGoalCount);
	    		  moneyBackString +="_"+insuranceObject.getGoalCount().toString();
		      } 
	    	 
		      if(! str73004.contains(insuranceObject.getPartyInsuranceId().toString())){
		       insurance.get(7).setInsuranceCoverAmount(insurance.get(7).getInsuranceCoverAmount()+insuranceObject.getCurrentValue());
		       str73004 = insuranceObject.getPartyInsuranceId().toString();
		       }
		      insurance.get(7).setAllocatedAmount(insurance.get(7).getAllocatedAmount()+insuranceObject.getAllocatedAmount());
		  }
	    }
	    
	    String questionBankId = "29";
		String sectionTypeId = "39003";
		List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
		if(questionDetails!=null){
		for(int i=0;i<questionDetails.size();i++)
		{
			QuestionDetails details = questionDetails.get(i);
			
			if(details.getQuestionId().equals("94018"))
			{
				model.addAttribute("LifeInsuranceAmount",details.getAttributeRefferenceValue());
			}
			else if(details.getQuestionId().equals("94019"))
			{
				model.addAttribute("HealthInsuranceAmount",details.getAttributeRefferenceValue());
			}
			else if(details.getQuestionId().equals("94024"))
			{
				model.addAttribute("CriticalInsuranceAmount",details.getAttributeRefferenceValue());
			}
			else if(details.getQuestionId().equals("94107"))
			{
				model.addAttribute("AccidentalInsuranceAmount",details.getAttributeRefferenceValue());
			}
			else if(details.getQuestionId().equals("94226"))
			{
				model.addAttribute("AssetInsuranceAmount",details.getAttributeRefferenceValue());
			}
		}
		
		model.addAttribute("questionDetails",questionDetails); 
		}
	         
	    model.addAttribute("healthInsurance", insurance.get(0));
	    model.addAttribute("criticalInsurance", insurance.get(1));    
	    model.addAttribute("assetInsurance", insurance.get(2));
	    model.addAttribute("accidentsInsurance", insurance.get(3));
	    model.addAttribute("partyId", partyId);
	    
	    model.addAttribute("termInsurance", insurance.get(4));
	    model.addAttribute("ulipInsurance", insurance.get(5));
	    model.addAttribute("endownmentInsurance", insurance.get(6));
	    model.addAttribute("moneyBackInsurance", insurance.get(7));
	    model.addAttribute("insuranceType",insuranceType);
	  }
	    
	  catch(Exception e) {
	   return "redirect:/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/2";
	  }
	  return "insurance/insuranceSummary";
	 }
	
	
	/*
	 * 
	 *  48029(endowment)
		48032(ulip)
		48031(term)
		48030(moneyBack)
	 * 
	 */
	
	// life-insurance-details
	
			@RequestMapping(value = "/life-insurance-details/{lifeInsuranceType}/{partyId}", method = RequestMethod.GET)
			public String lifeInsuranceDetails(Model model,@PathVariable String lifeInsuranceType, @PathVariable String partyId,HttpServletRequest request) {
				UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					 return "redirect:/login";
				}
				InsuranceData insuranceData = new InsuranceData();
			    List<InsuranceData> insuranceListAsJson = new ArrayList<InsuranceData> ();
			    List<InsuranceData> insuranceList = new ArrayList<InsuranceData>();
				try{
				String url = GET_INSURANCE_LIST+"/"+userSession.getUserName()+"/4321";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				uriCB.queryParam("buId",userSession.getBuId());
				uriCB.queryParam("partyId",partyId);
				uriCB.queryParam("insuranceType","73001,73002,73003,73004");
			    BaseResponse<InsuranceData> br = new BaseResponse<InsuranceData>();
			    //br = restTemplate.postForObject(url, insuranceData, BaseResponse.class);
			    br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			    if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				     insuranceListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
				}
			    else{
				     return "redirect:/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/2";
				}
			    
			    for(int i = 0; i<insuranceListAsJson.size(); i++){    
			    	
				     InsuranceData insuranceObject = objectMapper.readValue(objectMapper.writeValueAsString(insuranceListAsJson.get(i)), InsuranceData.class);
				     insuranceList.add(insuranceObject);
			    }
				
			    
			    }catch(Exception e){  return "redirect:/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/2"; }
				
				ArrayList<InsuranceData> termList = new ArrayList<InsuranceData>();
				ArrayList<InsuranceData> endowmentList = new ArrayList<InsuranceData>();
				ArrayList<InsuranceData> moneyBackList = new ArrayList<InsuranceData>();
				ArrayList<InsuranceData> ulipList = new ArrayList<InsuranceData>();
				for(int i=0;i<insuranceList.size();i++)
				{
					InsuranceData data = insuranceList.get(i);
					ArrayList<JsonData> familyMembers = (ArrayList) getRelationshipIds(partyId,userSession);
					String associatedFamilyPartyIds = data.getAssociatedFamilyPartyId();
					String[] associatedFamilyPartyId = associatedFamilyPartyIds.split(",");
					String familyMembersName=null;
					for(int j=0;j<familyMembers.size();j++){
						for(int k=0;k<associatedFamilyPartyId.length;k++)
						{
							JsonData jsonData = familyMembers.get(j);
							if(associatedFamilyPartyId[k] != null && !(associatedFamilyPartyId[k].equals(""))) {
								if(jsonData.getValue().equals(Integer.parseInt(associatedFamilyPartyId[k])))
								{
									if(familyMembersName !=null)
									{
									familyMembersName = familyMembersName+","+jsonData.getText();
									}
									{
										familyMembersName = jsonData.getText();
									}
								}
							}
						}
					}
					data.setFamilyMembersName(familyMembersName);
					
					if(data.getInsuranceTypeID().equals(73001))
					{
						termList.add(data);
					}
					else if(data.getInsuranceTypeID().equals(73003))
					{
						endowmentList.add(data);
					}
					else if(data.getInsuranceTypeID().equals(73004))
					{
						moneyBackList.add(data);
					}
					else if(data.getInsuranceTypeID().equals(73002))
					{
						ulipList.add(data);
					}
				}
				model.addAttribute("termList",termList);
				model.addAttribute("endowmentList",endowmentList);
				model.addAttribute("moneyBackList",moneyBackList);
				model.addAttribute("ulipList",ulipList);
				
			    model.addAttribute("partyId",partyId);
				if(lifeInsuranceType.equals("term"))
		    	{
					model.addAttribute("lifeInsuranceType",0);
		    	}
		    	else if(lifeInsuranceType.equals("endowment"))
		        {
		    		model.addAttribute("lifeInsuranceType",1);
		    	}else if(lifeInsuranceType.equals("moneyBack"))
		        {
		    		model.addAttribute("lifeInsuranceType",2);
		        }else if(lifeInsuranceType.equals("ulip"))
		        {
		        	model.addAttribute("lifeInsuranceType",3);
		        }	
		    		
				
				String questionBankId = "29";
				String sectionTypeId = "39003";
				List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
				if(questionDetails!=null){
				for(int i=0;i<questionDetails.size();i++)
				{
					QuestionDetails details = questionDetails.get(i);
					
					if(details.getQuestionId().equals("94018"))
					{
						model.addAttribute("LifeInsuranceAmount",details.getAttributeRefferenceValue());
					}
					else if(details.getQuestionId().equals("94019"))
					{
						model.addAttribute("HealthInsuranceAmount",details.getAttributeRefferenceValue());
					}
					else if(details.getQuestionId().equals("94024"))
					{
						model.addAttribute("CriticalInsuranceAmount",details.getAttributeRefferenceValue());
					}
					else if(details.getQuestionId().equals("94107"))
					{
						model.addAttribute("AccidentalInsuranceAmount",details.getAttributeRefferenceValue());
					}
					else if(details.getQuestionId().equals("94226"))
					{
						model.addAttribute("AssetInsuranceAmount",details.getAttributeRefferenceValue());
					}
						
					
				}
				model.addAttribute("questionDetails",questionDetails); 
				}
				
				
				return "insurance/life-insurance-details";
			}
			
			// add term,endowment,money back, and ulip insurance details
			
			@RequestMapping(value = "/term-life-insurance-add/{partyId}", method = RequestMethod.GET)
			public String termLifeInsuranceAdd(Model model, @PathVariable String partyId,HttpServletRequest request) {
				UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					 return "redirect:/login";
				}
				model.addAttribute("pageHeader","ADD TERM INSURANCE DETAILS");
				model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
				model.addAttribute("categoryId",48031);
				model.addAttribute("lifeInsuranceType","term");
				model.addAttribute("partyId",partyId);
				model.addAttribute("partyInsuranceId",0);
				model.addAttribute("insuranceTypeId",73001);
				model.addAttribute("insuranceData", new InsuranceData());
				model.addAttribute("saveAndNew","insurance/term-life-insurance-add/"+partyId);
				model.addAttribute("saveAndClose","insurance/life-insurance-details/term/"+partyId);
				model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
				return "insurance/life-insurance-details-add";
			}
		
			
		@RequestMapping(value = "/endowment-life-insurance-add/{partyId}", method = RequestMethod.GET)
		public String endowmentLifeInsuranceAdd(Model model, @PathVariable String partyId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			model.addAttribute("pageHeader","ADD ENDOWMENT INSURANCE DETAILS");
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48029);
			model.addAttribute("partyId",partyId);
			model.addAttribute("partyInsuranceId",0);
			model.addAttribute("insuranceTypeId",73003);
			model.addAttribute("insuranceData", new InsuranceData());
			model.addAttribute("lifeInsuranceType","endowment");
			model.addAttribute("saveAndNew","insurance/endowment-life-insurance-add/"+partyId);
			model.addAttribute("saveAndClose","insurance/life-insurance-details/endowment/"+partyId);
			model.addAttribute("assetTypeId",48029);
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/life-insurance-details-add";
		}
		
		@RequestMapping(value = "/money-back-life-insurance-add/{partyId}", method = RequestMethod.GET)
		public String moneyBackLifeInsuranceAdd(Model model, @PathVariable String partyId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			model.addAttribute("pageHeader","ADD MONEY BACK INSURANCE DETAILS");
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48030);
			model.addAttribute("partyId",partyId);
			model.addAttribute("partyInsuranceId",0);
			model.addAttribute("insuranceTypeId",73004);
			model.addAttribute("insuranceData", new InsuranceData());
			model.addAttribute("lifeInsuranceType","moneyBack");
			model.addAttribute("saveAndNew","insurance/money-back-life-insurance-add/"+partyId);
			model.addAttribute("saveAndClose","insurance/life-insurance-details/moneyBack/"+partyId);
			model.addAttribute("assetTypeId",48030);
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/life-insurance-details-add";
		}
		
		@RequestMapping(value = "/ulip-life-insurance-add/{partyId}", method = RequestMethod.GET)
		public String ulipLifeInsuranceAdd(Model model, @PathVariable String partyId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			model.addAttribute("pageHeader","ADD ULIP INSURANCE DETAILS");
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48032);
			model.addAttribute("partyId",partyId);
			model.addAttribute("partyInsuranceId",0);
			model.addAttribute("insuranceTypeId",73002);
			model.addAttribute("insuranceData", new InsuranceData());
			model.addAttribute("lifeInsuranceType","ulip");
			model.addAttribute("saveAndNew","insurance/ulip-life-insurance-add/"+partyId);
			model.addAttribute("saveAndClose","insurance/life-insurance-details/ulip/"+partyId);
			model.addAttribute("assetTypeId",48032);
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/life-insurance-details-add";
		}
		
		
		// edit term,endowment,money back, and ulip insurance details
		
		@RequestMapping(value = "/term-life-insurance-edit/{partyId}/{partyInsuranceId}", method = RequestMethod.GET)
		public String termLifeInsuranceEdit(Model model, @PathVariable String partyId,@PathVariable("partyInsuranceId") Integer partyInsuranceId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			String token = "153443";
			UriComponentsBuilder uriCB;
			Integer buId = userSession.getBuId();
			InsuranceData insuranceData = new InsuranceData();
			try{
				uriCB = UriComponentsBuilder.fromHttpUrl(GET_INSURANCE_DETAILS + userSession.getUserName() + "/" + token + "?buId=" + buId + "&partyId=" + partyId + "&partyInsuranceId=" + partyInsuranceId);
				BaseResponse<InsuranceData> br = new BaseResponse<InsuranceData>();
				br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{	
					insuranceData = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), InsuranceData.class);
					model.addAttribute("insuranceData", insuranceData);
				} else{
					LOGGER.error("Error occured while getting family details data from App layer" + br.getReasonCode());
				}
			}catch(Exception exception){LOGGER.debug(exception);}
			model.addAttribute("pageHeader","EDIT TERM INSURANCE DETAILS");
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48031);
			model.addAttribute("partyId",partyId);
			model.addAttribute("partyInsuranceId",insuranceData.getPartyInsuranceId());
			model.addAttribute("insuranceTypeId",73001);
			model.addAttribute("lifeInsuranceType","term");
			model.addAttribute("saveAndNew","insurance/term-life-insurance-add/"+partyId);
			model.addAttribute("saveAndClose","insurance/life-insurance-details/term/"+partyId);
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/life-insurance-edit";
		}
		
		@RequestMapping(value = "/endowment-life-insurance-edit/{partyId}/{partyInsuranceId}", method = RequestMethod.GET)
		public String endowmentLifeInsuranceEdit(Model model, @PathVariable String partyId,@PathVariable("partyInsuranceId") Integer partyInsuranceId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			String token = "153443";
			UriComponentsBuilder uriCB;
			Integer buId = userSession.getBuId();
			InsuranceData insuranceData = new InsuranceData();
			try{
				uriCB = UriComponentsBuilder.fromHttpUrl(GET_INSURANCE_DETAILS + userSession.getUserName() + "/" + token + "?buId=" + buId + "&partyId=" + partyId + "&partyInsuranceId=" + partyInsuranceId);
				BaseResponse<InsuranceData> br = new BaseResponse<InsuranceData>();
				br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{	
					insuranceData = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), InsuranceData.class);
					model.addAttribute("insuranceData", insuranceData);
				} else{
					LOGGER.error("Error occured while getting family details data from App layer" + br.getReasonCode());
				}
			}catch(Exception exception){LOGGER.debug(exception);}
			model.addAttribute("pageHeader","EDIT ENDOWMENT INSURANCE DETAILS");
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48029);
			model.addAttribute("partyId",partyId);
			model.addAttribute("insuranceTypeId",73003);
			model.addAttribute("partyInsuranceId",insuranceData.getPartyInsuranceId());
			model.addAttribute("lifeInsuranceType","endowment");
			model.addAttribute("saveAndNew","insurance/endowment-life-insurance-add/"+partyId);
			model.addAttribute("saveAndClose","insurance/life-insurance-details/endowment/"+partyId);
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/life-insurance-edit";
		}
		
		@RequestMapping(value = "/money-back-life-insurance-edit/{partyId}/{partyInsuranceId}", method = RequestMethod.GET)
		public String moneyBackLifeInsuranceEdit(Model model, @PathVariable String partyId,@PathVariable("partyInsuranceId") Integer partyInsuranceId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			String token = "153443";
			UriComponentsBuilder uriCB;
			Integer buId = userSession.getBuId();
			InsuranceData insuranceData = new InsuranceData();
			try{
				uriCB = UriComponentsBuilder.fromHttpUrl(GET_INSURANCE_DETAILS + userSession.getUserName() + "/" + token + "?buId=" + buId + "&partyId=" + partyId + "&partyInsuranceId=" + partyInsuranceId);
				BaseResponse<InsuranceData> br = new BaseResponse<InsuranceData>();
				br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{	
					insuranceData = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), InsuranceData.class);
					model.addAttribute("insuranceData", insuranceData);
				} else{
					LOGGER.error("Error occured while getting family details data from App layer" + br.getReasonCode());
				}
			}catch(Exception exception){LOGGER.debug(exception);}
			model.addAttribute("pageHeader","EDIT MONEY BACK INSURANCE DETAILS");
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("insuranceTypeId",73004);
			model.addAttribute("categoryId",48030);
			model.addAttribute("partyId",partyId);
			model.addAttribute("partyInsuranceId",insuranceData.getPartyInsuranceId());
			model.addAttribute("lifeInsuranceType","moneyBack");
			model.addAttribute("saveAndNew","insurance/money-back-life-insurance-add/"+partyId);
			model.addAttribute("saveAndClose","insurance/life-insurance-details/moneyBack/"+partyId);
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/life-insurance-edit";
		}
		
		@RequestMapping(value = "/ulip-life-insurance-edit/{partyId}/{partyInsuranceId}", method = RequestMethod.GET)
		public String ulipLifeInsuranceEdit(Model model, @PathVariable String partyId,@PathVariable("partyInsuranceId") Integer partyInsuranceId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			String token = "153443";
			UriComponentsBuilder uriCB;
			Integer buId = userSession.getBuId();
			InsuranceData insuranceData = new InsuranceData();
			try{
				uriCB = UriComponentsBuilder.fromHttpUrl(GET_INSURANCE_DETAILS + userSession.getUserName() + "/" + token + "?buId=" + buId + "&partyId=" + partyId + "&partyInsuranceId=" + partyInsuranceId);
				BaseResponse<InsuranceData> br = new BaseResponse<InsuranceData>();
				br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{	
					insuranceData = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), InsuranceData.class);
					model.addAttribute("insuranceData", insuranceData);
				} else{
					LOGGER.error("Error occured while getting family details data from App layer" + br.getReasonCode());
				}
			}catch(Exception exception){LOGGER.debug(exception);}
			model.addAttribute("pageHeader","EDIT ULIP INSURANCE DETAILS");
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("insuranceTypeId",73002);
			model.addAttribute("categoryId",48032);
			model.addAttribute("partyId",partyId);
			model.addAttribute("partyInsuranceId",insuranceData.getPartyInsuranceId());
			model.addAttribute("lifeInsuranceType","ulip");
			model.addAttribute("saveAndNew","insurance/ulip-life-insurance-add/"+partyId);
			model.addAttribute("saveAndClose","insurance/life-insurance-details/ulip/"+partyId);
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/life-insurance-edit";
		}
		
		/*
		 * 	48025 (PA)
		 *	48026 (HI)
		 *	48027 (CI)
		*/
		
		// general-insurance-details
		
		@RequestMapping(value = "/general-insurance-details/{generalInsuranceType}/{partyId}", method = RequestMethod.GET)
		public String generalInsuranceDetails(Model model,@PathVariable String generalInsuranceType, @PathVariable String partyId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			
			InsuranceData insuranceData = new InsuranceData();
		    List<InsuranceData> insuranceListAsJson = new ArrayList<InsuranceData> ();
		    List<InsuranceData> insuranceList = new ArrayList<InsuranceData>();
			try{
			String url = GET_INSURANCE_LIST+"/"+userSession.getUserName()+"/4321";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("buId",userSession.getBuId());
			uriCB.queryParam("partyId",partyId);
			uriCB.queryParam("insuranceType","73005,73006,73007,73008");
		    BaseResponse<InsuranceData> br = new BaseResponse<InsuranceData>();
		    br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		    if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			     insuranceListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
			}
		    else{
			     return "redirect:/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/2";
			}
		    
		    for(int i = 0; i<insuranceListAsJson.size(); i++){    
		    	
			     InsuranceData insuranceObject = objectMapper.readValue(objectMapper.writeValueAsString(insuranceListAsJson.get(i)), InsuranceData.class);
			     insuranceList.add(insuranceObject);
		    }
		    }catch(Exception e){ return "redirect:/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/2"; }
			ArrayList<InsuranceData> criticalIllnessList = new ArrayList<InsuranceData>();
			ArrayList<InsuranceData> healthList = new ArrayList<InsuranceData>();
			ArrayList<InsuranceData> personalAccidentList = new ArrayList<InsuranceData>();
			ArrayList<InsuranceData> assetList = new ArrayList<InsuranceData>();
			for(int i=0;i<insuranceList.size();i++)
			{
				InsuranceData data = insuranceList.get(i);
				ArrayList<JsonData> familyMembers = (ArrayList) getRelationshipIds(partyId,userSession);
				String associatedFamilyPartyIds = data.getAssociatedFamilyPartyId();
				String[] associatedFamilyPartyId = associatedFamilyPartyIds.split(",");
				String familyMembersName=null;
				for(int j=0;j<familyMembers.size();j++){
					for(int k=0;k<associatedFamilyPartyId.length;k++)
					{
						JsonData jsonData = familyMembers.get(j);
						if(associatedFamilyPartyId[k] != null && !(associatedFamilyPartyId[k].equals(""))) {
							if(jsonData.getValue().equals(Integer.parseInt(associatedFamilyPartyId[k])))
							{
								if(familyMembersName !=null)
								{
								familyMembersName = familyMembersName+","+jsonData.getText();
								}else 
								{
									familyMembersName = jsonData.getText();
								}
							}
						}
					}
				}
				data.setFamilyMembersName(familyMembersName);
				
				if(data.getInsuranceTypeID().equals(73006))
				{
					criticalIllnessList.add(data);
				}
				else if(data.getInsuranceTypeID().equals(73005))
				{
					healthList.add(data);
				}
				else if(data.getInsuranceTypeID().equals(73008))
				{
					personalAccidentList.add(data);
				}
				else if(data.getInsuranceTypeID().equals(73007))
				{
					assetList.add(data);
				}
			}
			model.addAttribute("criticalIllnessList",criticalIllnessList);
			model.addAttribute("healthList",healthList);
			model.addAttribute("personalAccidentList",personalAccidentList);
			model.addAttribute("assetList",assetList);
			
			model.addAttribute("partyId",partyId);
			if(generalInsuranceType.equals("criticalIllness"))
	    	{
				model.addAttribute("generalInsuranceType",0);
	    	}
	    	else if(generalInsuranceType.equals("health"))
	        {
	    		model.addAttribute("generalInsuranceType",1);
	    	}else if(generalInsuranceType.equals("personalAccident"))
	        {
	    		model.addAttribute("generalInsuranceType",2);
	        }else if(generalInsuranceType.equals("asset"))
	        {
	        	model.addAttribute("generalInsuranceType",3);
	        }
			
			String questionBankId = "29";
			String sectionTypeId = "39003";
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
			if(questionDetails!=null){
			for(int i=0;i<questionDetails.size();i++)
			{
				QuestionDetails details = questionDetails.get(i);
				
				if(details.getQuestionId().equals("94018"))
				{
					model.addAttribute("LifeInsuranceAmount",details.getAttributeRefferenceValue());
				}
				else if(details.getQuestionId().equals("94019"))
				{
					model.addAttribute("HealthInsuranceAmount",details.getAttributeRefferenceValue());
				}
				else if(details.getQuestionId().equals("94024"))
				{
					model.addAttribute("CriticalInsuranceAmount",details.getAttributeRefferenceValue());
				}
				else if(details.getQuestionId().equals("94107"))
				{
					model.addAttribute("AccidentalInsuranceAmount",details.getAttributeRefferenceValue());
				}
				else if(details.getQuestionId().equals("94226"))
				{
					model.addAttribute("AssetInsuranceAmount",details.getAttributeRefferenceValue());
				}
					
				
			}
			
			model.addAttribute("questionDetails",questionDetails); 
			}
		     

			return "insurance/general-insurance-details";
		}
		
		// add Critical Illness, personal accident, asset and health insurance

		@RequestMapping(value = "/critical-illness-insurance-details-add/{partyId}", method = RequestMethod.GET)
		public String criticalIllnessInsuranceDetailsAdd(Model model, @PathVariable String partyId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48027);
			model.addAttribute("insuranceTypeId", 73006);
			model.addAttribute("partyId", partyId);
			model.addAttribute("insuranceData", new InsuranceData());
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/critical-illness-details-add";
			
		}
		
		@RequestMapping(value = "/personal-accident-insurance-details-add/{partyId}", method = RequestMethod.GET)
		public String personalAccidentInsuranceDetailsAdd(Model model, @PathVariable String partyId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48025);
			model.addAttribute("insuranceTypeId", 73008);
			model.addAttribute("partyId", partyId);
			model.addAttribute("insuranceData", new InsuranceData());
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/personal-accident-details-add";
		}
		
		@RequestMapping(value = "/asset-insurance-details-add/{partyId}", method = RequestMethod.GET)
		public String assetInsuranceDetailsAdd(Model model, @PathVariable String partyId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48024);
			model.addAttribute("insuranceTypeId", 73007);
			model.addAttribute("partyId", partyId);
			model.addAttribute("insuranceData", new InsuranceData());
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/asset-insurance-details-add";
		}
		
		@RequestMapping(value = "/health-insurance-details-add/{partyId}", method = RequestMethod.GET)
		public String healthInsuranceDetailsAdd(Model model, @PathVariable String partyId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48026);
			model.addAttribute("insuranceTypeId", 73005);
			model.addAttribute("partyId", partyId);
			model.addAttribute("insuranceData", new InsuranceData());
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/health-insurance-details-add";
		}
		
		
		// edit Critical Illness, personal accident, asset and health insurance 
		
		 @RequestMapping(value = "/critical-illness-insurance-details-edit/{partyId}/{partyInsuranceId}", method = RequestMethod.GET)
			public String criticalIllnessInsuranceDetailsEdit(Model model, @PathVariable String partyId, @PathVariable("partyInsuranceId") Integer partyInsuranceId, HttpServletRequest request) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException {
				UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					 return "redirect:/login";
				}
				String token = "153443";
				UriComponentsBuilder uriCB;
				Integer buId = userSession.getBuId();
				InsuranceData insuranceData = new InsuranceData();
				try{
					uriCB = UriComponentsBuilder.fromHttpUrl(GET_INSURANCE_DETAILS + userSession.getUserName() + "/" + token + "?buId=" + buId + "&partyId=" + partyId + "&partyInsuranceId=" + partyInsuranceId);
					BaseResponse<InsuranceData> br = new BaseResponse<InsuranceData>();
					br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
					if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					{	
						insuranceData = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), InsuranceData.class);
						model.addAttribute("insuranceData", insuranceData);
					} else{
						LOGGER.error("Error occured while getting family details data from App layer" + br.getReasonCode());
					}
				}catch(Exception exception){LOGGER.debug(exception);}
				model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
				model.addAttribute("categoryId",48027);
				model.addAttribute("insuranceTypeId", 73006);
				model.addAttribute("partyId", partyId);
				model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
				return "insurance/critical-illness-details-edit";
			}
		
		@RequestMapping(value = "/personal-accident-insurance-details-edit/{partyId}/{partyInsuranceId}", method = RequestMethod.GET)
		public String personalAccidentInsuranceDetailsEdit(Model model, @PathVariable String partyId,@PathVariable("partyInsuranceId") Integer partyInsuranceId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			String token = "153443";
			UriComponentsBuilder uriCB;
			Integer buId = userSession.getBuId();
			InsuranceData insuranceData = new InsuranceData();
			try{
				uriCB = UriComponentsBuilder.fromHttpUrl(GET_INSURANCE_DETAILS + userSession.getUserName() + "/" + token + "?buId=" + buId + "&partyId=" + partyId + "&partyInsuranceId=" + partyInsuranceId);
				BaseResponse<InsuranceData> br = new BaseResponse<InsuranceData>();
				br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{	
					insuranceData = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), InsuranceData.class);
					model.addAttribute("insuranceData", insuranceData);
				} else{
					LOGGER.error("Error occured while getting family details data from App layer" + br.getReasonCode());
				}
			}catch(Exception exception){LOGGER.debug(exception);}
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48025);
			model.addAttribute("insuranceTypeId", 73008);
			model.addAttribute("partyId", partyId);
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/personal-accident-details-edit";
		}
		
		@RequestMapping(value = "/asset-insurance-details-edit/{partyId}/{partyInsuranceId}", method = RequestMethod.GET)
		public String assetInsuranceDetailsEdit(Model model, @PathVariable String partyId,@PathVariable("partyInsuranceId") Integer partyInsuranceId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			String token = "153443";
			UriComponentsBuilder uriCB;
			Integer buId = userSession.getBuId();
			InsuranceData insuranceData = new InsuranceData();
			try{
				uriCB = UriComponentsBuilder.fromHttpUrl(GET_INSURANCE_DETAILS + userSession.getUserName() + "/" + token + "?buId=" + buId + "&partyId=" + partyId + "&partyInsuranceId=" + partyInsuranceId);
				BaseResponse<InsuranceData> br = new BaseResponse<InsuranceData>();
				br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{	
					insuranceData = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), InsuranceData.class);
					model.addAttribute("insuranceData", insuranceData);
				} else{
					LOGGER.error("Error occured while getting family details data from App layer" + br.getReasonCode());
				}
			}catch(Exception exception){LOGGER.debug(exception);}
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48024);
			model.addAttribute("insuranceTypeId", 73007);
			model.addAttribute("partyId", partyId);
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/asset-insurance-details-edit";
		}
		
		@RequestMapping(value = "/health-insurance-details-edit/{partyId}/{partyInsuranceId}", method = RequestMethod.GET)
		public String healthInsuranceDetailsEdit(Model model, @PathVariable String partyId,@PathVariable("partyInsuranceId") Integer partyInsuranceId,HttpServletRequest request) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			String token = "153443";
			UriComponentsBuilder uriCB;
			Integer buId = userSession.getBuId();
			InsuranceData insuranceData = new InsuranceData();
			try{
				uriCB = UriComponentsBuilder.fromHttpUrl(GET_INSURANCE_DETAILS + userSession.getUserName() + "/" + token + "?buId=" + buId + "&partyId=" + partyId + "&partyInsuranceId=" + partyInsuranceId);
				BaseResponse<InsuranceData> br = new BaseResponse<InsuranceData>();
				br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{	
					insuranceData = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), InsuranceData.class);
					model.addAttribute("insuranceData", insuranceData);
				} else{
					LOGGER.error("Error occured while getting family details data from App layer" + br.getReasonCode());
				}
			}catch(Exception exception){LOGGER.debug(exception);}
			model.addAttribute("relationshipIds", getRelationshipIds(partyId, userSession));
			model.addAttribute("categoryId",48026);
			model.addAttribute("insuranceTypeId", 73005);
			model.addAttribute("partyId", partyId);
			model.addAttribute("headerName",request.getSession().getAttribute("headerName"));
			return "insurance/health-insurance-details-edit";
		}
		
		public List getRelationshipIds(String partyId,UserSession userSession)
		{
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
		
		@RequestMapping(value = "/saveInsurance/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
		 public String saveInsurance(@ModelAttribute("insuranceData") InsuranceData insuranceData, Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes,@PathVariable("partyId") Integer partyId) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException 
		 {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			if(insuranceData.getInsurenceOwnerTypeId() == null) {
				insuranceData.setInsurenceOwnerTypeId(23018001);
			}
			insuranceData.setUserId(userSession.getUserId());
			insuranceData.setPartyID(partyId);	
			if(insuranceData.getInsuranceTypeID() == 73002)
				insuranceData.setInsuranceName("ULIP");
			else if(insuranceData.getInsuranceTypeID() == 73003)
				insuranceData.setInsuranceName("Endowment");
			else if(insuranceData.getInsuranceTypeID() == 73004)
				insuranceData.setInsuranceName("Moneyback");
			
			String returnUrl = request.getParameter("returnUrl");
			String token = "1234";
			String url = SAVE_INSURANCE_DETAILS + userSession.getUserName() +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId(); 
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<Integer> br = new BaseResponse<Integer>();						
			br = restTemplate.postForObject(url, insuranceData, BaseResponse.class);
			Integer result = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				result = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), Integer.class);
				redirectAttributes.addFlashAttribute("success", "Record saved successfully.");
				return "redirect:/"+returnUrl;
			}
			
			else {
				redirectAttributes.addFlashAttribute("error", "Errro while saving record.");
				return "redirect:/"+returnUrl;
			}			
			
		 }
	
		@RequestMapping(value = "/deleteInsuranceDetails/{insuranceType}/{insuranceSubType}/{partyId}/{partyInsuranceId}", method = {RequestMethod.GET,RequestMethod.POST})
		   public String deleteInsuranceDetails(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes,@PathVariable("partyInsuranceId") Integer partyInsuranceId,@PathVariable("partyId") Integer partyId, @PathVariable("insuranceType") String insuranceType, @PathVariable("insuranceSubType") String insuranceSubType) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException 
		   {
		   UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		   if(userSession == null) {
		     return "redirect:/login";
		   }
		   Integer buId = userSession.getBuId();
			String token = "12354";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(DELETE_INSURANCE_DETAILS+ "/"+userSession.getUserName()+"/"+partyId+"/"+partyInsuranceId+"/"+token);
			uriCB.queryParam("buId", buId);
			uriCB.queryParam("isAsset", 0);
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
					redirectAttributes.addFlashAttribute("error", "Errro while deleteing record");
				}
					
			}		
		
		    return "redirect:/insurance/"+insuranceType+"/"+insuranceSubType+"/"+partyId;
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
