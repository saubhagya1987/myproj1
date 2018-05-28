package in.fiinfra.common.recommendations;



import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.GoalPlanSession;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.partner.service.DropDownService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.LogFactory;
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
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;
 


@Lazy 
@Component  
@RequestMapping("/partner")

public class RecommendationController {  
  	
	  
	private static final Logger LOGGER = Logger.getLogger(RecommendationController.class); 
	  
	@Autowired  
	RestTemplate restTemplate;
	
	@Autowired 
	private ObjectMapper objectMapper; 

	public ObjectMapper getObjectMapper() {
		return objectMapper; 
	} 
 
    public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
     
    public RestTemplate getRestTemplate() {
    	return restTemplate;
    }

    public void setRestTemplate(RestTemplate restTemplate) {
    	this.restTemplate = restTemplate;
    }
    
    
    @Value("${GET_ADVICE_RECOMMENDATION}")
	private String GET_ADVICE_RECOMMENDATION;
	 
	@Value("${GET_RECOMMENDATIONS}")
	private String GET_RECOMMENDATIONS;
	
	@Value("${GET_PRODUCT_CATEGORY}")
	private String GET_PRODUCT_CATEGORY;
	
	@Value("${SAVE_ADVICE_RECOMMENDATION_URL}")
	private String SAVE_ADVICE_RECOMMENDATION;
	
	@Value("${GET_RECOMMENDATION_ASSET_URL}")
	private String GET_RECOMMENDATION_ASSET;
	
	@Value("${GET_RECOMMENDATION_PRODUCT_TYPE_URL}")
	private String GET_RECOMMENDATION_PRODUCT_TYPE;
	
	@Value("${GET_RECOMMENDATION_PRODUCT_CATEGORY_URL}")
	private String GET_RECOMMENDATION_PRODUCT_CATEGORY;
	
	@Value("${SAVE_GOAL_PLANNING_URL}")
	private String SAVE_GOAL_PLANNING;
	
	@Value("${SAVE_GOAL_PLANNING_ASSETTYPES_URL}")
	private String SAVE_GOAL_PLANNING_ASSETTYPES;
	
	@Value("${SAVE_GOAL_PLANNING_PRODUCT_CATEGORY_URL}")
	private String SAVE_GOAL_PLANNING_PRODUCT_CATEGORY_URL;
	
	@Value("${GET_RISK_COVER_URL}")
	private String GET_RISK_COVER;
		
	@Value("${SAVE_GOAL_PLANNING_PRODUCT_TYPE_URL}")
	private String SAVE_GOAL_PLANNING_PRODUCT_TYPE_URL;
	
	@Value("${RESET_GOAL_PLAN_DATA}")
	private String RESET_GOAL_PLAN_DATA;
	
	@Value("${SAVE_RECOMMENDATIONS_URL}")
	private String SAVE_RECOMMENDATIONS_URL;
	
	@Value("${goal_bucket_allocation_url}")
	private String goal_bucket_allocation_url;   
	
	@Value("${saveLifeRiskCover}") 
	private String saveLifeRiskCover;
	
	@Value("${saveGeneralRiskCover}")
	private String saveGeneralRiskCover;
	
	@Value("${get_edit_goal_bucket_allocation_url}")
	private String get_edit_goal_bucket_allocation_url;
	
	@Value("${insert_GoalPlanBucket}") 
	private String insert_GoalPlanBucket;
	 
	@Value("${set_default_GoalPlanBucket_Allocation}")
	private String set_default_GoalPlanBucket_Allocation;
	 
	@Value("${risk_cover_set_default}")  
	private String risk_cover_set_default;
	 
	@Value("${GET_ASSUMPTIONS}")
	private String GET_ASSUMPTIONS;	 
	
	@Value("${GET_GOAL_BUCKET_ALLOCATION}")
	private String GET_GOAL_BUCKET_ALLOCATION;
	  
	@Value("${GET_COMPANY_NAME}")
	private String GET_COMPANY_NAME;
	 
	@Value("${GET_PRODUCTS_NAME}")
	private String GET_PRODUCTS_NAME; 
	
	@Autowired
	private DropDownService dropDownService;   
	
	private static String RECOMMONDATION_SOURCE = "Recommondation";
	
	Integer bu_partyId  = null;  
    
    @RequestMapping(value = "recommendations/getProductRecommendations", method = RequestMethod.GET)
	public ModelAndView getProductRecommendations(HttpServletRequest request,HttpServletResponse response) throws IOException
	{ 
    	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
    	int recordTypeId = userSession.getRecordtypeId();
    	System.out.println(" recordTypeID................"+recordTypeId);
    	 
    	if (recordTypeId==14008 || recordTypeId==14012)//Service portal: 14008 User,14012 Service Team Member 
    	{
    		bu_partyId = Integer.parseInt(request.getParameter("partyId"));   
    	}  
    	 
		ModelAndView mav = new ModelAndView("recommendation/advicerecommendations");  
		return mav;  
	}     
           
       
    @RequestMapping(value = "/vacationPlanning", method = {RequestMethod.GET,RequestMethod.POST})
	public String loadVacationPlanning(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		} 
		
		int recordTypeId = userSession.getRecordtypeId();
		Integer partyId  ;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId==14008 || recordTypeId==14012)//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}
    	else
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		
		Integer buId = userSession.getBuId();
		String token = "153443";
		Integer clientPartyId = -1;
		Integer buPartyId = userSession.getBuId();
		Integer fpSectionTypeId = 39014;
		Integer productTypeId = 47010;
		Integer assetClassId = 46005;
		Integer recommendationRecordTypeId = 50005;
		
		List<AdviceRecommendation> taxPlanningList = loadPlanning(fpSectionTypeId, clientPartyId, partyId, buPartyId, productTypeId, assetClassId, recommendationRecordTypeId, token, buId);
		
		model.addAttribute("productCategoryDropDownData",objectMapper.writeValueAsString(dropDownService.getProductCategoryList(request,productTypeId)));
		int i = 0;
		for(AdviceRecommendation adviceRecommendation : taxPlanningList){
			
		model.addAttribute("id"+i++,taxPlanningList.get(0).getId());
		}
		model.addAttribute("adviceRecommendationsList",taxPlanningList);
		if(taxPlanningList.isEmpty()){
			model.addAttribute("noOfDropDownsAtBeginning",0);
		}else{
			model.addAttribute("noOfDropDownsAtBeginning",taxPlanningList.size());
		}
		if((taxPlanningList==null) || (taxPlanningList.size()==0)){
			redirectAttributes.addFlashAttribute("error", "error.noDataFound");
			return "redirect:/partner/recommendation";
		}
		model.addAttribute("recordTypeId",taxPlanningList.get(0).getRecordTypeId());
		model.addAttribute("sectionTypeId",fpSectionTypeId);
		
		return "recommendation/vacationPlanning";  
	}
	@RequestMapping(value = "/saveVacationPlanings", method = RequestMethod.POST)
	public ModelAndView saveVacationPlannings(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return new ModelAndView("redirect:/login");
		}
		
		int recordTypeId = userSession.getRecordtypeId();
		Integer partyId;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId==14008 || recordTypeId==14012)//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}
    	else
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		
		
		//Integer partyId = userSession.getUserId(); 
		
		 
		Integer noOfRows=0;
		
		if(null!=request.getParameter("noOfDropDownRowsHidden")){
			noOfRows=Integer.parseInt(request.getParameter("noOfDropDownRowsHidden"));
		}
		 
			List<AdviceRecommendation> adviceRecommendationList = new ArrayList<AdviceRecommendation>();
			String productCategory="";
			String companyName="";
			String productName="";
			 
			for(int i = 1; i<=noOfRows; i++){
				AdviceRecommendation adviceRecommendation = new AdviceRecommendation();
				productCategory=request.getParameter("productCategory_"+i);
				companyName=request.getParameter("companyName_"+i); 
				productName=request.getParameter("productName_"+i);
				if((null!=productCategory) && (null!=companyName) && (null!=productName)
						&& (!productCategory.equals("-1")) && (!companyName.equals("-1")) && (!productName.equals("-1"))){
					adviceRecommendation.setCategoryId(Integer.parseInt(productCategory));
					adviceRecommendation.setSubCategoryId(Integer.parseInt(companyName));
					adviceRecommendation.setProductId(Integer.parseInt(productName));
					adviceRecommendation.setPartyId(partyId);
					adviceRecommendation.setSectionTypeId(39014);
					adviceRecommendation.setAssetClassId(46005);
					adviceRecommendation.setParentFPAdviseRecommendID(14002);
					adviceRecommendation.setRecommendationRecordTypeId(50005);
					adviceRecommendation.setProductTypeId(47010);
					adviceRecommendation.setSeqNo(i);
					if(request.getParameter("recordTypeId").equalsIgnoreCase("14002")){
						adviceRecommendation.setRecordTypeId(14003);
						adviceRecommendation.setId(null);
						}else{
							adviceRecommendation.setRecordTypeId(Integer.parseInt(request.getParameter("recordTypeId")));//TODO need to confirm --setRecordTypeId
							adviceRecommendation.setId(request.getParameter("id"+(i+1))!=null ? request.getParameter("id"+(i+1)): null);
						}
					adviceRecommendationList.add(adviceRecommendation);
				}
			}
			String token = "153443";
			Integer buId = userSession.getBuId();
			UriComponentsBuilder uriCB;
			uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_ADVICE_RECOMMENDATION+ "/" + token+"?buId="+buId);
			BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
			
			// post the object to service
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceRecommendationList, BaseResponse.class);
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_VACATION_PLANNING_SUCCESSFUL,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_VACATION_PLANNING_SOURCE);
				redirectAttributes.addFlashAttribute("success", "success.vacationPlanning.dataSave");				
			}else{
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_VACATION_PLANNING_FAILED,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_VACATION_PLANNING_SOURCE);
				redirectAttributes.addFlashAttribute("error", "error.vacationPlanning.dataSave");
			}
			modelAndView = new ModelAndView("redirect:/partner/vacationPlanning");
		return modelAndView;
	}
	 
	@RequestMapping(value = "/taxPlanning", method = {RequestMethod.GET,RequestMethod.POST})
	public String loadTaxPlanning(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		int recordTypeId = userSession.getRecordtypeId();
		Integer partyId;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId==14008 || recordTypeId==14012)//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}
    	else
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		
		Integer buId = userSession.getBuId();
		String token = "153443";
		Integer clientPartyId = -1;
		Integer buPartyId = userSession.getBuId();
		Integer fpSectionTypeId = 39019;
		Integer productTypeId = 47008;
		Integer assetClassId = 46005;
		Integer recommendationRecordTypeID = 50005;
		
		List<AdviceRecommendation> taxPlanningList = loadPlanning(fpSectionTypeId,clientPartyId,partyId,buPartyId,productTypeId,assetClassId,recommendationRecordTypeID,token,buId);
		model.addAttribute("productCategoryDropDownData",objectMapper.writeValueAsString(dropDownService.getProductCategoryList(request,productTypeId)));
		int i = 0;
		for(AdviceRecommendation adviceRecommendation : taxPlanningList){
			
		model.addAttribute("id"+i++,taxPlanningList.get(0).getId());
		}
		model.addAttribute("taxPlanningList",taxPlanningList);
		if(taxPlanningList.isEmpty()){   
			model.addAttribute("noOfDropDownsAtBeginning",0);
		}else{
			model.addAttribute("noOfDropDownsAtBeginning",taxPlanningList.size());
		}
		if((taxPlanningList==null) || (taxPlanningList.size()==0)){
			redirectAttributes.addFlashAttribute("error", "error.noDataFound");
			return "redirect:/partner/recommendation";
		}
		model.addAttribute("recordTypeId",taxPlanningList.get(0).getRecordTypeId());
		model.addAttribute("sectionTypeId",fpSectionTypeId);
		return "recommendation/taxPlanning";
	}
	
	@RequestMapping(value = "/saveTaxPlanings", method = RequestMethod.POST)
	public ModelAndView saveTaxPlannings(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return new ModelAndView("redirect:/login");
		}
		
		int recordTypeId = userSession.getRecordtypeId();
		Integer partyId;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId==14008 || recordTypeId==14012)//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}
    	else
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		
		
		
		Integer noOfRows=0;
		
		if(null!=request.getParameter("noOfDropDownRowsHidden")){
			noOfRows=Integer.parseInt(request.getParameter("noOfDropDownRowsHidden"));
		}
		
			List<AdviceRecommendation> adviceRecommendationList = new ArrayList<AdviceRecommendation>();
			String productCategory="";
			String companyName="";
			String productName="";
			
			for(int i = 1; i<=noOfRows; i++){
				AdviceRecommendation adviceRecommendation = new AdviceRecommendation();
				productCategory=request.getParameter("productCategory_"+i);
				companyName=request.getParameter("companyName_"+i);
				productName=request.getParameter("productName_"+i);
				if((null!=productCategory) && (null!=companyName) && (null!=productName)
						&& (!productCategory.equals("-1")) && (!companyName.equals("-1")) && (!productName.equals("-1"))){
					adviceRecommendation.setCategoryId(Integer.parseInt(productCategory));
					adviceRecommendation.setSubCategoryId(Integer.parseInt(companyName));
					adviceRecommendation.setProductId(Integer.parseInt(productName));
					adviceRecommendation.setPartyId(partyId);
					adviceRecommendation.setProductTypeId(47008);
					adviceRecommendation.setSectionTypeId(39019);
					adviceRecommendation.setAssetClassId(46005);
					adviceRecommendation.setParentFPAdviseRecommendID(14002);
					adviceRecommendation.setRecommendationRecordTypeId(50005);
					adviceRecommendation.setSeqNo(i);
					if(request.getParameter("recordTypeId").equalsIgnoreCase("14002")){
						adviceRecommendation.setRecordTypeId(14003);
						adviceRecommendation.setId(null);
						}else{
							adviceRecommendation.setRecordTypeId(Integer.parseInt(request.getParameter("recordTypeId")));//TODO need to confirm --setRecordTypeId
							adviceRecommendation.setId(request.getParameter("id"+(i+1))!=null ? request.getParameter("id"+(i+1)): null);
						}
					adviceRecommendationList.add(adviceRecommendation);
				}
			}
			String token = "153443";
			Integer buId = userSession.getBuId();
			UriComponentsBuilder uriCB;
			uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_ADVICE_RECOMMENDATION+ "/" + token+"?buId="+buId);
			BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
			
			// post the object to service
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceRecommendationList, BaseResponse.class);
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_TAX_PLANNING_SUCCESSFUL,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_TAX_PLANNING_SOURCE);
				redirectAttributes.addFlashAttribute("success", "success.taxPlanning.dataSave");				
			}else{
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_TAX_PLANNING_FAILED,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_TAX_PLANNING_SOURCE);
				redirectAttributes.addFlashAttribute("error", "error.taxPlanning.dataSave");
			}
			modelAndView = new ModelAndView("redirect:/partner/taxPlanning");
		return modelAndView; 
	}
	private List<AdviceRecommendation> loadPlanning(Integer fpSectionTypeId,Integer clientPartyId,Integer partyId,
			Integer buPartyId,Integer productTypeId,Integer assetClassId,Integer recommendationRecordTypeId,String token,Integer buId){
		
		
		UriComponentsBuilder uriCB;
		List<AdviceRecommendation> adviceRecommendationsListAsJson = new ArrayList<AdviceRecommendation>();
		List<AdviceRecommendation> adviceRecommendationsList = new ArrayList<AdviceRecommendation>();
		GoalPlanInput goalPlanInput=new GoalPlanInput();
		goalPlanInput.setSectionTypeId(fpSectionTypeId);
		goalPlanInput.setProductTypeId(productTypeId);
		goalPlanInput.setPartnerPartyId(bu_partyId);   
		goalPlanInput.setBuPartyId(buPartyId);
		goalPlanInput.setClientPartyId(clientPartyId);
		goalPlanInput.setAssetClassId(""+assetClassId);
		goalPlanInput.setRecommendationRecordTypeId(recommendationRecordTypeId);		
		
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_ADVICE_RECOMMENDATION+ "/" +token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		
		//call service for all parties associated 
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB),goalPlanInput, BaseResponse.class);
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				adviceRecommendationsListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<adviceRecommendationsListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					AdviceRecommendation adviceRecommendation = new AdviceRecommendation();
					adviceRecommendation = objectMapper.readValue(objectMapper.writeValueAsString(adviceRecommendationsListAsJson.get(i)), AdviceRecommendation.class);
					adviceRecommendationsList.add(adviceRecommendation);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			}
		}
		return adviceRecommendationsList;
	}
	
	@RequestMapping(value = "/successionPlanning", method = {RequestMethod.GET,RequestMethod.POST})
	public String loadSuccessionPlanning(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		int recordTypeId = userSession.getRecordtypeId();
		Integer partyId;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId==14008 || recordTypeId==14012)//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}
    	else
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		
		
		Integer buId = userSession.getBuId();
		String token = "153443";
		Integer clientPartyId = -1;
		Integer buPartyId = userSession.getBuId();
		Integer fpSectionTypeId = 39007;
		Integer productTypeId = 47009;
		Integer assetClassId = 46005;
		Integer recommendationRecordTypeId = 50005;
		
		List<AdviceRecommendation> taxPlanningList = loadPlanning(fpSectionTypeId, clientPartyId, partyId, buPartyId, productTypeId, assetClassId, recommendationRecordTypeId, token, buId);
		//Integer vacationId = 47007;
		model.addAttribute("productCategoryDropDownData",objectMapper.writeValueAsString(dropDownService.getProductCategoryList(request,productTypeId)));
		int i = 0; 
		for(AdviceRecommendation adviceRecommendation : taxPlanningList){
			
		model.addAttribute("id"+i++,taxPlanningList.get(0).getId());
		}
		model.addAttribute("taxPlanningList",taxPlanningList);
		if(taxPlanningList.isEmpty()){
			model.addAttribute("noOfDropDownsAtBeginning",0);
		}else{
			model.addAttribute("noOfDropDownsAtBeginning",taxPlanningList.size());
		}
		if((taxPlanningList==null) || (taxPlanningList.size()==0)){
			redirectAttributes.addFlashAttribute("error", "error.noDataFound");
			return "redirect:/partner/recommendation";
		}
		model.addAttribute("recordTypeId",taxPlanningList.get(0).getRecordTypeId());
		model.addAttribute("sectionTypeId",fpSectionTypeId);
		return "recommendation/successionPlanning";
	}
	 
	@RequestMapping(value = "/saveSuccessionPlanings", method = RequestMethod.POST)
	public ModelAndView saveSuccessionPlannings(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		if(userSession == null) {
			modelAndView = new ModelAndView("redirect:/login");
		}
		
		int recordTypeId = userSession.getRecordtypeId();
		Integer partyId;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId==14008 || recordTypeId==14012)//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}
    	else
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		
		
		
		Integer noOfRows=0;
		
		if(null!=request.getParameter("noOfDropDownRowsHidden")){
			noOfRows=Integer.parseInt(request.getParameter("noOfDropDownRowsHidden"));
		}  
		 
			List<AdviceRecommendation> adviceRecommendationList = new ArrayList<AdviceRecommendation>();
			String productCategory="";
			String companyName=""; 
			String productName="";
			
			for(int i = 1; i<=noOfRows; i++){
				AdviceRecommendation adviceRecommendation = new AdviceRecommendation();
				productCategory=request.getParameter("productCategory_"+i);
				companyName=request.getParameter("companyName_"+i);
				productName=request.getParameter("productName_"+i);
				if((null!=productCategory) && (null!=companyName) && (null!=productName)
						&& (!productCategory.equals("-1")) && (!companyName.equals("-1")) && (!productName.equals("-1"))){
					adviceRecommendation.setCategoryId(Integer.parseInt(productCategory));
					adviceRecommendation.setSubCategoryId(Integer.parseInt(companyName));
					adviceRecommendation.setProductId(Integer.parseInt(productName));
					adviceRecommendation.setPartyId(partyId);
					adviceRecommendation.setSectionTypeId(39007);
					adviceRecommendation.setAssetClassId(46005);
					adviceRecommendation.setParentFPAdviseRecommendID(14002);
					adviceRecommendation.setRecommendationRecordTypeId(50005);
					adviceRecommendation.setProductTypeId(47009);
					adviceRecommendation.setSeqNo(i);
					if(request.getParameter("recordTypeId").equalsIgnoreCase("14002")){
						adviceRecommendation.setRecordTypeId(14003);
						adviceRecommendation.setId(null);
						}else{
							adviceRecommendation.setRecordTypeId(Integer.parseInt(request.getParameter("recordTypeId")));//TODO need to confirm --setRecordTypeId
							adviceRecommendation.setId(request.getParameter("id"+(i+1))!=null ? request.getParameter("id"+(i+1)): null);
						}
					adviceRecommendationList.add(adviceRecommendation);
				}
			}
			String token = "153443";
			Integer buId = userSession.getBuId();
			UriComponentsBuilder uriCB;  
			uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_ADVICE_RECOMMENDATION+ "/" + token+"?buId="+buId);
			BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
			
			// post the object to service
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceRecommendationList, BaseResponse.class);
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_SUCCESSION_PLANNING_SUCCESSFUL,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_SUCCESSION_PLANNING_SOURCE);
				redirectAttributes.addFlashAttribute("success", "success.successionPlanning.dataSave");				
			}else{
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_SUCCESSION_PLANNING_FAILED,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_SUCCESSION_PLANNING_SOURCE);
				redirectAttributes.addFlashAttribute("error", "error.successionPlanning.dataSave");
			}
			modelAndView = new ModelAndView("redirect:/partner/successionPlanning");
		return modelAndView;
	}
	@RequestMapping(value = "/goalPlanning", method = {RequestMethod.GET,RequestMethod.POST})
	public String loadGoalPlanning(Model model,HttpServletRequest request,
			final RedirectAttributes redirectAttributes,@RequestParam(value="riskProfileId",required=true,defaultValue="") String riskProfileId) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		/*request.getSession().removeAttribute("goalPlanSession");
		//Conservative-40001,Balanced-40002,Aggressive-40003
		if(riskProfileId.isEmpty()){
			riskProfileId = "40001";
		}
		
		Integer sectionTypeId=39005;
		Map<String, List<AdviceRecommendation>> goalDataMap = null;
		goalDataMap = getRecommendationData(request,Integer.parseInt(riskProfileId),sectionTypeId);
		model.addAttribute("goalDataMap", goalDataMap);
		model.addAttribute("sectionTypeId",sectionTypeId);
		model.addAttribute("goalDataMapSize", goalDataMap==null?0:goalDataMap.size());
		model.addAttribute("riskProfileId", riskProfileId);
		if((null!=goalDataMap) && (!goalDataMap.isEmpty()) && (null!=goalDataMap.get("0-3 Years")) 
				&& (!goalDataMap.get("0-3 Years").isEmpty()) 
				&& (null!=goalDataMap.get("0-3 Years").get(0).getRecordTypeId())){
			model.addAttribute("recordTypeId", goalDataMap.get("0-3 Years").get(0).getRecordTypeId());
		}		
		if((goalDataMap==null) || (goalDataMap.size()==0)){
				redirectAttributes.addFlashAttribute("error", "error.noDataFound");
				return "redirect:/partner/recommendation";
		}
		return "goalPlanning";*/
		return "redirect:getProductRecommendationList/"+userSession.getPartyId()+"/40001/62009/46001,46002,46003";
		
	}
	
	@RequestMapping(value = "/saveGoalPlanning", method = RequestMethod.POST)
	public ModelAndView saveGoalPlanning(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return new ModelAndView("redirect:/login");
		}
		
		
    	
		
		String submittedValues = request.getParameter("finalData");
		String goalYearRangeId=request.getParameter("finalGoalRangeData");
		String adviceRecommendId=request.getParameter("finalAdviceRecommendId");
		String[] submittedValuesArray = submittedValues.split(",");
		String[] goalYearRangeIdArray=goalYearRangeId.split(",");
		String[] adviceRecommendIdArray=adviceRecommendId.split(",");
		//Conservative-40001,Balanced-40002,Aggressive-40003
		String riskProfileId = request.getParameter("riskProfileId");
		Integer insertFlag=0;
		Integer partyId = userSession.getPartyId();
		Integer buPartyId=userSession.getBuId();
		List<AdviceRecommendation> adviceRecommendationsList = new ArrayList<AdviceRecommendation>(); 
			
		
		String recordTypeId = request.getParameter("recordTypeId");
		Integer sectionTypeId=Integer.parseInt(request.getParameter("sectionTypeId"));
		if(recordTypeId.equals("14002")){
			insertFlag=1;
			recordTypeId="14003";
		}
		
		//int recordTypeId = userSession.getRecordtypeId();
    	System.out.println(" recordTypeId................"+recordTypeId);
    	
    	if (recordTypeId.equals("14008") || recordTypeId.equals("14012"))//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}
    	else
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		
		//adviceRecommendation.setRecordTypeId(Integer.parseInt(recordTypeId));//type
		//adviceRecommendation.setRecommendationRecordTypeId(50001);
		//adviceRecommendation.setRiskProfileId(Integer.parseInt(riskProfileId));		
		
		if(submittedValuesArray.length > 0){
			for(int i= 0; i< submittedValuesArray.length; i=i+3){
				AdviceRecommendation adviceRecommendationEquity = new AdviceRecommendation();
				AdviceRecommendation adviceRecommendationDebt = new AdviceRecommendation();
				AdviceRecommendation adviceRecommendationGold = new AdviceRecommendation();
				if((null!=submittedValuesArray[i]) && (!submittedValuesArray[i].isEmpty())){
					adviceRecommendationEquity.setAllocationPercent(Integer.parseInt(submittedValuesArray[i]));
				}else{
					adviceRecommendationEquity.setAllocationPercent(0);
				}
				
				
				adviceRecommendationEquity.setPartyId(partyId);
				adviceRecommendationEquity.setBuPartyId(buPartyId);
				adviceRecommendationEquity.setRiskProfileId(Integer.parseInt(riskProfileId));
				adviceRecommendationEquity.setRecommendationRecordTypeId(50001);
				adviceRecommendationEquity.setRecordTypeId(Integer.parseInt(recordTypeId));
				adviceRecommendationEquity.setAssetClassId(46001);
				adviceRecommendationEquity.setSectionTypeId(sectionTypeId);
				adviceRecommendationEquity.setSeqNo(1);
				adviceRecommendationEquity.setGoalYearRangeId(Integer.parseInt(goalYearRangeIdArray[i]));				
				adviceRecommendationEquity.setParentFPAdviseRecommendID(12);
				
				if((null!=submittedValuesArray[i+1]) && (!submittedValuesArray[i+1].isEmpty())){
					adviceRecommendationDebt.setAllocationPercent(Integer.parseInt(submittedValuesArray[i+1]));
				}else{
					adviceRecommendationDebt.setAllocationPercent(0);
				}  
				
				adviceRecommendationDebt.setPartyId(partyId);
				//System.out.println("userSession.getBuId()...."+userSession.getBuId());
				adviceRecommendationDebt.setBuPartyId(buPartyId);
				adviceRecommendationDebt.setRiskProfileId(Integer.parseInt(riskProfileId));
				adviceRecommendationDebt.setRecommendationRecordTypeId(50001);
				adviceRecommendationDebt.setRecordTypeId(Integer.parseInt(recordTypeId));
				adviceRecommendationDebt.setAssetClassId(46002);
				adviceRecommendationDebt.setSectionTypeId(sectionTypeId);
				adviceRecommendationDebt.setSeqNo(1);
				adviceRecommendationDebt.setGoalYearRangeId(Integer.parseInt(goalYearRangeIdArray[i]));				
				adviceRecommendationDebt.setParentFPAdviseRecommendID(12);
				
				if((null!=submittedValuesArray[i+2]) && (!submittedValuesArray[i+2].isEmpty())){
					adviceRecommendationGold.setAllocationPercent(Integer.parseInt(submittedValuesArray[i+2]));
				}else{
					adviceRecommendationGold.setAllocationPercent(0);
				}
				
				adviceRecommendationGold.setPartyId(partyId);
				adviceRecommendationGold.setBuPartyId(buPartyId);
				adviceRecommendationGold.setRiskProfileId(Integer.parseInt(riskProfileId));
				adviceRecommendationGold.setRecommendationRecordTypeId(50001);				
				adviceRecommendationGold.setRecordTypeId(Integer.parseInt(recordTypeId));
				adviceRecommendationGold.setAssetClassId(46003);
				adviceRecommendationGold.setSectionTypeId(sectionTypeId);
				adviceRecommendationGold.setGoalYearRangeId(Integer.parseInt(goalYearRangeIdArray[i]));				
				adviceRecommendationGold.setSeqNo(1);				
				adviceRecommendationGold.setParentFPAdviseRecommendID(12);
				
				if(insertFlag==0){
					adviceRecommendationEquity.setId(adviceRecommendIdArray[i]);
					adviceRecommendationDebt.setId(adviceRecommendIdArray[i+1]);
					adviceRecommendationGold.setId(adviceRecommendIdArray[i+2]);
				}

				adviceRecommendationsList.add(adviceRecommendationEquity);
				adviceRecommendationsList.add(adviceRecommendationDebt);
				adviceRecommendationsList.add(adviceRecommendationGold);
			
			}
			//adviceRecommendation.setAllocationPercent(121);
			//adviceRecommendation.setGoalYearRange("1212");//send id
			//adviceRecommendation.setAssetClassId(1222);//
			
			String token = "153443";
			String username = userSession.getUserName();
			Integer buId = userSession.getBuId();
			UriComponentsBuilder uriCB;
			uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_GOAL_PLANNING + "/" + username + "/" + token+"?buId="+buId);
			BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
			
			// post the object to service
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceRecommendationsList, BaseResponse.class);
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_GOAL_PLANNING_SUCESSFUL,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_GOAL_PLANNING);
				redirectAttributes.addFlashAttribute("success", "success.goalPlanning.dataSave");			
			}else{ 
				audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_GOAL_PLANNING_FAILED,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_GOAL_PLANNING);
				redirectAttributes.addFlashAttribute("error", "error.goalPlanning.dataSave");
			}
		}
 
		modelAndView = new ModelAndView("redirect:/partner/goalPlanning?riskProfileId="+riskProfileId);
		return modelAndView;
	}
	@RequestMapping(value = "/getRecommendationDataForRiskProfile", method = RequestMethod.GET)		
	public @ResponseBody Map<String, List<AdviceRecommendation>> getRecommendationDataForRiskProfile(HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		String riskProfileId = request.getParameter("riskProfileId");
		return getRecommendationData(request,Integer.parseInt(riskProfileId),39005);
	}

	private Map<String, List<AdviceRecommendation>> getRecommendationData(HttpServletRequest request, Integer riskProfileId, Integer sectionTypeId){
		
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
		goalPlanInput.setSectionTypeId(sectionTypeId); // 47010  - goal planning (need constant )
		String assetClassId = "46001,46002,46003"; //code valued id for Equity (93002), Debt (93001)  and Gold (93003)
		goalPlanInput.setAssetClassId(assetClassId);
		 
		goalPlanInput.setRiskProfileId(riskProfileId);
		Integer recordTypeId= 50001;
		goalPlanInput.setRecommendationRecordTypeId(recordTypeId);
		BaseResponse<Map<Integer, List<AdviceRecommendation>>> baseResponse = null;
		Map<String, List<AdviceRecommendation>> goalDataMap = null;
		
		//int recordTypeId = userSession.getRecordtypeId();
		Integer partyId  ;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId==14008 || recordTypeId==14012)//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}  
    	else 
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		
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
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			}
		}
			
		return goalDataMap;
	}
	
	private Map<String, List<AdviceRecommendation>> buildYearWiseMap(List<AdviceRecommendation> goalDataList) {
		Map<String, List<AdviceRecommendation>> recommendationMap;
		List<AdviceRecommendation> goalWiseRecommedation = null;
		recommendationMap = new LinkedHashMap<String, List<AdviceRecommendation>>();
		
		for(AdviceRecommendation recommendation : goalDataList){			
			if(recommendationMap.containsKey(recommendation.getGoalYearRange())){
				goalWiseRecommedation = recommendationMap.get(recommendation.getGoalYearRange());
				goalWiseRecommedation.add(recommendation);				
			}else{
				goalWiseRecommedation = new ArrayList<AdviceRecommendation>();
				goalWiseRecommedation.add(recommendation);
				recommendationMap.put(recommendation.getGoalYearRange(), goalWiseRecommedation);
			}
		}
		return recommendationMap;				
	}
	
	@RequestMapping(value = "/goalPlanAssetTypes", method = {RequestMethod.GET,RequestMethod.POST})
	public String loadGoalPlanAssetTypes(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		
		
		
		String assetClassId="";
		String riskProfileId="";
		String goalYearRangeId="";
		String allocationPercent="";
		Integer sectionTypeId=39005;
		GoalPlanSession goalPlanSession = (GoalPlanSession) request.getSession().getAttribute("goalPlanSession");
		if(null==goalPlanSession){				
			goalPlanSession=new GoalPlanSession();
			assetClassId = request.getParameter("assetClassId");
			goalPlanSession.setAssetClassIds(assetClassId);
			riskProfileId = request.getParameter("riskProfileId");//pass it from goal plan page
			goalPlanSession.setRiskProfileId(riskProfileId);
			goalYearRangeId = request.getParameter("goalYearRangeId");
			goalPlanSession.setGoalYearRangeId(goalYearRangeId);
			allocationPercent=request.getParameter("allocationPercent");
			goalPlanSession.setAllocationPercent(allocationPercent);
			goalPlanSession.setProductTypeId("");
			goalPlanSession.setInactiveLinks("");
			request.getSession().setAttribute("goalPlanSession", goalPlanSession);
		}else{
			assetClassId=goalPlanSession.getAssetClassIds();
			riskProfileId=goalPlanSession.getRiskProfileId();
			goalYearRangeId=goalPlanSession.getGoalYearRangeId();
			allocationPercent=goalPlanSession.getAllocationPercent();
			goalPlanSession.setProductTypeId("");
			goalPlanSession.setInactiveLinks("");
			request.getSession().setAttribute("goalPlanSession", goalPlanSession);
		}
		String username = userSession.getName();
		Integer partnerPartyId = userSession.getPartyId();
		Integer buPartyId = userSession.getBuId();//27828 
		Integer buId = 27827;//userSession.getBuId();
		String token = "153443";
		UriComponentsBuilder uriCB;
		GoalPlanInput goalPlanInput = new GoalPlanInput();
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_RECOMMENDATION_PRODUCT_TYPE+ "/" +username + "/" +token +"?buId="+buId);		
		
		goalPlanInput.setBuPartyId(buPartyId);
		goalPlanInput.setPartnerPartyId(partnerPartyId);
		goalPlanInput.setSectionTypeId(sectionTypeId); // 47010  - goal planning (need constant )			
		goalPlanInput.setAssetClassId(assetClassId);		
		if(riskProfileId.equals("40001")){
			model.addAttribute("riskType","Conservative");
		}else if(riskProfileId.equals("40002")){
			model.addAttribute("riskType","Balanced");
		}else if(riskProfileId.equals("40003")){
			model.addAttribute("riskType","Aggresive");
		}
		if(assetClassId.equals("46001")){
			model.addAttribute("assetType","Equity");
		}else if(assetClassId.equals("46002")){
			model.addAttribute("assetType","Debts");
		}else if(assetClassId.equals("46003")){
			model.addAttribute("assetType","Gold");
		}
		
		goalPlanInput.setRiskProfileId(Integer.parseInt(riskProfileId));//Integer.parseInt(riskProfileId));
		Integer recordTypeId= 50003;//make constant
		goalPlanInput.setRecommendationRecordTypeId(recordTypeId);				
		goalPlanInput.setGoalYearRangeId(Integer.parseInt(goalYearRangeId));
		BaseResponse<Map<Integer, List<AdviceRecommendation>>> baseResponse = null;
		
		Integer productTypeId=0;
		Integer productTypeCount=0;
		String productTypeIds="";
		String[] pieces;
		
		
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalPlanInput, BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {				
				List<AdviceRecommendation> goalEquityDataList =  new ArrayList<AdviceRecommendation>();
				List<AdviceRecommendation> goalMutualFundsDataList =  new ArrayList<AdviceRecommendation>();
				List<AdviceRecommendation> goalDebtDataList =  new ArrayList<AdviceRecommendation>();
				List<AdviceRecommendation> goalJsonDataList = null;
				
				Map<Integer,String> productCategoryMap=new HashMap<Integer, String>();
				//call service to get related data
				goalJsonDataList = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				//for dropdown population
				List<JsonData> equityProductCategoryList = new ArrayList<JsonData>();
				List<JsonData> mfProductCategoryList = new ArrayList<JsonData>();
				List<JsonData> debtProductCategoryList = new ArrayList<JsonData>();
				JsonData jsonDataDefault = new JsonData();
				jsonDataDefault.setValue(-1);
				jsonDataDefault.setText("---Select---");
				equityProductCategoryList.add(jsonDataDefault);
				mfProductCategoryList.add(jsonDataDefault);
				debtProductCategoryList.add(jsonDataDefault);
				AdviceRecommendation adviceRecommendation =new AdviceRecommendation();
				for(int i=0;i<goalJsonDataList.size();i++){
					//convert each json object
					adviceRecommendation = objectMapper.readValue(objectMapper.writeValueAsString(goalJsonDataList.get(i)), AdviceRecommendation.class);					
					goalEquityDataList.add(adviceRecommendation);					

					if(!productTypeId.equals(adviceRecommendation.getProductTypeId())){
						productTypeId=adviceRecommendation.getProductTypeId();						
						equityProductCategoryList=new ArrayList<JsonData>();
						equityProductCategoryList.add(jsonDataDefault);
						productTypeCount+=1;
						pieces=adviceRecommendation.getProductTypeName().split("_");
						productTypeIds=productTypeIds+ pieces[2] +"_"+productTypeId+",";//+adviceRecommendation.getId()+"_"
						for(KeyValue keyValue : adviceRecommendation.getCategoryIds()){
							JsonData jsondata = new JsonData();
							jsondata.setValue(keyValue.getId());
							jsondata.setText(keyValue.getName());
							equityProductCategoryList.add(jsondata);
						}
						productCategoryMap.put(productTypeCount, objectMapper.writeValueAsString(equityProductCategoryList));						
						//model.addAttribute("productCategoryList_"+productTypeCount,equityProductCategoryList);
					}					
					
				}
				
				model.addAttribute("productCategoryMap",productCategoryMap);
				model.addAttribute("productTypeCount",productTypeCount);
				model.addAttribute("productTypeIds",productTypeIds);
				model.addAttribute("assetClassId",assetClassId);
				model.addAttribute("allocationPercent",allocationPercent);
				model.addAttribute("goalDataList", goalEquityDataList);
				model.addAttribute("sectionTypeId",sectionTypeId);
				model.addAttribute("equityProductCategoryList",objectMapper.writeValueAsString(equityProductCategoryList));
				model.addAttribute("mfProductCategoryList",objectMapper.writeValueAsString(mfProductCategoryList));
				model.addAttribute("debtProductCategoryList",objectMapper.writeValueAsString(debtProductCategoryList));
				if((!goalEquityDataList.isEmpty()) && (null!=goalEquityDataList.get(0).getRecordTypeId())){
					model.addAttribute("recordTypeId", goalEquityDataList.get(0).getRecordTypeId());
					if(buPartyId.equals(goalEquityDataList.get(0).getPartyId())){
						model.addAttribute("deleteFlag",0);
					}
				}
				
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception----Recommendation Controller---------", e);
			}
		}
		model.addAttribute("goalYearRangeId", goalYearRangeId);
		if(goalYearRangeId.equals("62009")){
			model.addAttribute("goalYearRange","0-3 years");
		}else if(goalYearRangeId.equals("62010")){
			model.addAttribute("goalYearRange","3-5 years");
		}else if(goalYearRangeId.equals("62011")){
			model.addAttribute("goalYearRange","5-7 years");
		}else if(goalYearRangeId.equals("62012")){
			model.addAttribute("goalYearRange","7-9 years");
		}else if(goalYearRangeId.equals("62013")){
			model.addAttribute("goalYearRange","More than 9 years");
		}
		model.addAttribute("riskProfileId",riskProfileId);
		
		if(productTypeCount==0){
			redirectAttributes.addFlashAttribute("error", "error.noDataFound");
			return "redirect:/partner/recommendation";
		}
		
		return "goalPlanAssetTypes";
	}
	
	@RequestMapping(value = "/saveGoalPlanAssetTypes", method = RequestMethod.POST)
	public ModelAndView saveGoalPlanAssetTypes(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		modelAndView = new ModelAndView("redirect:/partner/goalPlanAssetTypes");
		if(userSession == null) {
			return new ModelAndView("redirect:/login");
		}
		
		
		
		
		String assetClassId="";
		String riskProfileId="";
		String goalYearRangeId="";
		Integer newCategoryFlag=0;
		Integer buPartyId=userSession.getBuId();
		GoalPlanSession goalPlanSession = (GoalPlanSession) request.getSession().getAttribute("goalPlanSession");
		if(null==goalPlanSession){				
			return new ModelAndView("redirect:/goalPlanAssetTypes");
		}else{
			assetClassId=goalPlanSession.getAssetClassIds();
			riskProfileId=goalPlanSession.getRiskProfileId();
			goalYearRangeId=goalPlanSession.getGoalYearRangeId();
		}
		String equityDropDownValues="";
		String equitySliderValues ="";
		String[] equityDropDownValuesArray=null;
		String[] equitySliderValuesArray=null;
		String recordTypeId = request.getParameter("recordTypeId");		
		String finalproductTypeIds=request.getParameter("finalproductTypeIds");
		String[] productTypeId=finalproductTypeIds.split(",");
		Integer productTypeCount=0;
		Integer createdBy=userSession.getPartyId();
		Integer sectionTypeId=Integer.parseInt(request.getParameter("sectionTypeId"));
		
		String category=request.getParameter("passCategory");
		String productTypeName="";
		
		if(null!=request.getParameter("productTypeCount")){
			productTypeCount=Integer.parseInt(request.getParameter("productTypeCount"));
		}
		
		//int recordTypeId = userSession.getRecordtypeId();
		Integer partyId  ;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId.equals("14008") || recordTypeId.equals("14012"))//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}  
    	else 
    	{
    		 partyId = userSession.getPartyId();
    	}
		//String adviceRecommendationId=request.getParameter("adviceRecommendationId");

		//Conservative-40001,Balanced-40002,Aggressive-40003
		int insertFlag = 1;		
		if(recordTypeId.equals("14003")){
			insertFlag=0;
		}
		recordTypeId="14003";
		//Integer partyId = userSession.getPartyId();
		List<AdviceRecommendation> adviceRecommendationsList = new ArrayList<AdviceRecommendation>(); 
		AdviceRecommendation adviceRecommendationEquity = new AdviceRecommendation();
		int categoryId=0;
		String[] pieces=null;
		String[] piecesId=null;
		for(int i=0;i<productTypeCount;i++){
			equityDropDownValues = request.getParameter("finalDataDropDown_"+(i+1));
			equitySliderValues= request.getParameter("finalDataSlidern_"+(i+1));
			equityDropDownValuesArray=equityDropDownValues.split(",");
			equitySliderValuesArray=equitySliderValues.split(",");
			productTypeName=request.getParameter("allocationPercentProductType_"+(i+1));
			
			for(int j=0;j<equityDropDownValuesArray.length;j++){	
				adviceRecommendationEquity=new AdviceRecommendation();
				if((null!=equityDropDownValuesArray[j]) && (j<equityDropDownValuesArray.length) && 
						(null!=equitySliderValuesArray[j]) && (j<equitySliderValuesArray.length) && 
						(null!=productTypeId[i]) && (i<productTypeId.length)){
					pieces=productTypeId[i].split("_");
					piecesId=equityDropDownValuesArray[j].split("_");
					if((insertFlag==0) && !(piecesId[1].equals("0"))){
						adviceRecommendationEquity.setId(piecesId[1]);
					}
					
					adviceRecommendationEquity.setProductTypeId(Integer.parseInt(pieces[1]));
					adviceRecommendationEquity.setGoalYearRangeId(Integer.parseInt(goalYearRangeId));
					categoryId=Integer.parseInt(piecesId[0]);
					adviceRecommendationEquity.setCategoryId(categoryId);
					adviceRecommendationEquity.setBuPartyId(buPartyId);
					adviceRecommendationEquity.setAllocationPercent(Integer.parseInt(equitySliderValuesArray[j]));
					adviceRecommendationEquity.setPartyId(partyId);
					adviceRecommendationEquity.setRiskProfileId(Integer.parseInt(riskProfileId));
					adviceRecommendationEquity.setRecommendationRecordTypeId(50003);
					adviceRecommendationEquity.setRecordTypeId(Integer.parseInt(recordTypeId));
					adviceRecommendationEquity.setAssetClassId(Integer.parseInt(assetClassId));
					adviceRecommendationEquity.setSectionTypeId(sectionTypeId);
					adviceRecommendationEquity.setSeqNo(1);
					adviceRecommendationEquity.setParentFPAdviseRecommendID(Integer.parseInt(pieces[0]));
					adviceRecommendationEquity.setCreatedBy(createdBy);
					if(null!=adviceRecommendationEquity.getId()){}
					else{
						newCategoryFlag=1;
					}
					adviceRecommendationsList.add(adviceRecommendationEquity);					
				}
			} 
			
		}
		
		String token = "153443";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_GOAL_PLANNING_ASSETTYPES + "/" + username + "/" + token+"?buId="+buId);
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		Integer recordId=0;
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceRecommendationsList, BaseResponse.class);
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){	
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_GOAL_PLANNING_ASSETTYPES_SUCESSFUL,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_GOAL_PLANNING_ASSETTYPES);
			redirectAttributes.addFlashAttribute("success", "success.goalPlanning.dataSave");
			recordId=objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), Integer.class);
			if(newCategoryFlag.equals(new Integer("1")) && (null!=recordId) && !(recordId.equals(new Integer("0")))){
				try{
					goalPlanSession.setRecordId(""+recordId);
					goalPlanSession.setProductTypeId(pieces[1]);
					goalPlanSession.setAllocationPercentProductType(productTypeName);
					goalPlanSession.setProductCategoryId(piecesId[0]);
					goalPlanSession.setProductCategory(category);
					goalPlanSession.setAllocationPercentCategory(equitySliderValuesArray[equitySliderValuesArray.length-1]);
					goalPlanSession.setInactiveLinks("inactiveLink");
					request.getSession().setAttribute("goalPlanSession", goalPlanSession);
					modelAndView=new ModelAndView("redirect:/partner/goalPlanAssociatedProducts");
				}catch(NullPointerException ne){
					LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", ne);
				}
			}
		}else{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_GOAL_PLANNING_ASSETTYPES_FAILED,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_GOAL_PLANNING_ASSETTYPES);
			redirectAttributes.addFlashAttribute("error", "error.goalPlanning.dataSave");
		}		
		return modelAndView;
	}
	
	@RequestMapping(value="/saveGoalPlanProductType",method=RequestMethod.POST)
	public ModelAndView saveGoalPlanProductType(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return new ModelAndView("redirect:/login");
		}
		String assetClassId="";
		String riskProfileId="";
		String goalYearRangeId="";
		Integer buPartyId=userSession.getBuId();
		GoalPlanSession goalPlanSession = (GoalPlanSession) request.getSession().getAttribute("goalPlanSession");
		if(null==goalPlanSession){				
			return new ModelAndView("redirect:/goalPlanAssetTypes");
		}else{
			assetClassId=goalPlanSession.getAssetClassIds();
			riskProfileId=goalPlanSession.getRiskProfileId();
			goalYearRangeId=goalPlanSession.getGoalYearRangeId();
		}
		String equitySliderValues ="";
		String[] equitySliderValuesArray;
		String recordTypeId = request.getParameter("recordTypeId");
		String finalproductTypeIds=request.getParameter("finalproductTypeIds");
		String[] productTypeId=finalproductTypeIds.split(",");
		Integer productTypeCount=0;
		Integer createdBy=userSession.getPartyId();
		Integer sectionTypeId=Integer.parseInt(request.getParameter("sectionTypeId"));
		int insertFlag = 1;
		//Integer partyId = userSession.getPartyId();
		List<AdviceRecommendation> adviceRecommendationsList = new ArrayList<AdviceRecommendation>(); 
		AdviceRecommendation adviceRecommendationEquity = new AdviceRecommendation();
		if(recordTypeId.equals("14003")){
			insertFlag=0;
		}
		recordTypeId="14003";
		
		Integer partyId  ;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId.equals("14008") || recordTypeId.equals("14012"))//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}  
    	else 
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		
		if(null!=request.getParameter("productTypeCount")){
			productTypeCount=Integer.parseInt(request.getParameter("productTypeCount"));
		}
		String[] pieces;
		for(int i=0;i<productTypeCount;i++){
			equitySliderValues= request.getParameter("finalDataSlidern_"+(i+1));
			equitySliderValuesArray=equitySliderValues.split(",");
			
			for(int j=0;j<equitySliderValuesArray.length;j++){	
				adviceRecommendationEquity=new AdviceRecommendation();
				if((null!=equitySliderValuesArray[j]) && (!equitySliderValuesArray[j].isEmpty()) && 
						(null!=productTypeId[i]) && (!productTypeId[i].isEmpty())){
					pieces=productTypeId[i].split("_");
					if((insertFlag==0) && !((pieces[0].equals("0")))){
						adviceRecommendationEquity.setId(pieces[0]);
					}
					adviceRecommendationEquity.setProductTypeId(Integer.parseInt(pieces[1]));
					adviceRecommendationEquity.setGoalYearRangeId(Integer.parseInt(goalYearRangeId));
					adviceRecommendationEquity.setAllocationPercent(Integer.parseInt(equitySliderValuesArray[j]));
					adviceRecommendationEquity.setPartyId(partyId);
					adviceRecommendationEquity.setBuPartyId(buPartyId);
					adviceRecommendationEquity.setRiskProfileId(Integer.parseInt(riskProfileId));
					adviceRecommendationEquity.setRecommendationRecordTypeId(50002);
					adviceRecommendationEquity.setRecordTypeId(Integer.parseInt(recordTypeId));
					adviceRecommendationEquity.setAssetClassId(Integer.parseInt(assetClassId));
					adviceRecommendationEquity.setSectionTypeId(sectionTypeId);
					adviceRecommendationEquity.setSeqNo(1);
					adviceRecommendationEquity.setParentFPAdviseRecommendID(12);
					adviceRecommendationEquity.setCreatedBy(createdBy);
					
					adviceRecommendationsList.add(adviceRecommendationEquity);					
				}
			}
			
		}
		
		String token = "153443";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_GOAL_PLANNING_PRODUCT_TYPE_URL + "/" + username + "/" + token+"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceRecommendationsList, BaseResponse.class);
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_GOAL_PLANNING_PRODUCT_TYPE_SUCESSFUL,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_GOAL_PLANNING_PRODUCT_TYPE);
			redirectAttributes.addFlashAttribute("success", "success.goalPlanning.dataSave");		
		}else{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_GOAL_PLANNING_PRODUCT_TYPE_FAILED,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_GOAL_PLANNING_PRODUCT_TYPE);
			redirectAttributes.addFlashAttribute("error", "error.goalPlanning.dataSave");
		}
		modelAndView=new ModelAndView("redirect:/partner/goalPlanAssetTypes");
		return modelAndView;
	}
	
	@RequestMapping(value = "/goalPlanAssociatedProducts", method = {RequestMethod.GET,RequestMethod.POST})
	public String loadGoalPlanAssociatedProducts(Model model,HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		
		
		
		String assetClassId="";
		String riskProfileId="";
		String goalYearRangeId="";
		String productTypeId="";
		String recordId="";
		String productType="";
		String passedCategoryId = "";
		String allocationPercentAsset="";
		String allocationPercentProductType="";
		String allocationPercentCategory="";
		String inactiveLinkFlag="";
		
		GoalPlanSession goalPlanSession = (GoalPlanSession) request.getSession().getAttribute("goalPlanSession");
		if(null==goalPlanSession){
			return "redirect:/partner/goalPlanAssetTypes";
		}else if((null==goalPlanSession.getProductTypeId()) || (goalPlanSession.getProductTypeId().isEmpty())){
			productTypeId=request.getParameter("productTypeId");
			goalPlanSession.setProductTypeId(productTypeId);
			productType=request.getParameter("passCategory");
			goalPlanSession.setProductCategory(productType);
			recordId=request.getParameter("recordId");
			goalPlanSession.setRecordId(recordId);
			passedCategoryId = request.getParameter("passCategoryId");
			goalPlanSession.setProductCategoryId(passedCategoryId);
			allocationPercentAsset=request.getParameter("allocationPercentAsset");
			goalPlanSession.setAllocationPercentAsset(allocationPercentAsset);
			allocationPercentProductType=request.getParameter("allocationPercentProductType");
			goalPlanSession.setAllocationPercentProductType(allocationPercentProductType);
			allocationPercentCategory=request.getParameter("allocationPercentCategory");
			goalPlanSession.setAllocationPercentCategory(allocationPercentCategory);
			request.getSession().setAttribute("goalPlanSession", goalPlanSession);
			assetClassId=goalPlanSession.getAssetClassIds();
			riskProfileId=goalPlanSession.getRiskProfileId();
			goalYearRangeId=goalPlanSession.getGoalYearRangeId();				
		}else{
			assetClassId=goalPlanSession.getAssetClassIds();
			riskProfileId=goalPlanSession.getRiskProfileId();
			goalYearRangeId=goalPlanSession.getGoalYearRangeId();
			productTypeId=goalPlanSession.getProductTypeId();
			recordId=goalPlanSession.getRecordId();
			productType=goalPlanSession.getProductCategory();
			passedCategoryId=goalPlanSession.getProductCategoryId();
			allocationPercentAsset=goalPlanSession.getAllocationPercentAsset();
			allocationPercentProductType=goalPlanSession.getAllocationPercentProductType();
			allocationPercentCategory=goalPlanSession.getAllocationPercentCategory();
			inactiveLinkFlag=goalPlanSession.getInactiveLinks();
		}
		String username = userSession.getName();
		
		int recordTypeId = userSession.getRecordtypeId();
		Integer partnerPartyId ;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId==14008 || recordTypeId==14012)//Service portal: 14008 User,14012 Service Team Member 
    	{
    		partnerPartyId = bu_partyId; 
    	}
    	else
    	{
    		 partnerPartyId = userSession.getPartyId();
    	}
		
		
		
		Integer buPartyId = userSession.getBuId();//27828 
		Integer buId = userSession.getBuId();
		String token = "153443";
		Integer sectionTypeId=39005;
		UriComponentsBuilder uriCB;
		
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_RECOMMENDATION_PRODUCT_CATEGORY+ "/" +username + "/" +token +"?buId="+buId);
		
		model.addAttribute("categoryId",passedCategoryId);
		model.addAttribute("companyNameDropDownData",objectMapper.writeValueAsString(dropDownService.getCompanynameList(request, Integer.parseInt(passedCategoryId))));
		
		
		model.addAttribute("sectionTypeId",sectionTypeId);
		model.addAttribute("productTypeId",productTypeId);
		model.addAttribute("recordId",recordId);
		model.addAttribute("productType",productType);			
		if(assetClassId.equals("46001")){
			model.addAttribute("assetType","Equity");
		}else if(assetClassId.equals("46002")){
			model.addAttribute("assetType","Debts");
		}else if(assetClassId.equals("46003")){
			model.addAttribute("assetType","Gold");
		}
		model.addAttribute("assetClassId",assetClassId);
		if(riskProfileId.equals("40001")){
			model.addAttribute("riskType","Conservative");
		}else if(riskProfileId.equals("40002")){
			model.addAttribute("riskType","Balanced");
		}else if(riskProfileId.equals("40003")){
			model.addAttribute("riskType","Aggresive");
		}
		model.addAttribute("riskProfileId",riskProfileId);
		if(goalYearRangeId.equals("62009")){
			model.addAttribute("goalYearRange","0-3 years");
		}else if(goalYearRangeId.equals("62010")){
			model.addAttribute("goalYearRange","3-5 years");
		}else if(goalYearRangeId.equals("62011")){
			model.addAttribute("goalYearRange","5-7 years");
		}else if(goalYearRangeId.equals("62012")){
			model.addAttribute("goalYearRange","7-9 years");
		}else if(goalYearRangeId.equals("62013")){
			model.addAttribute("goalYearRange","More than 9 years");
		}
		model.addAttribute("goalYearRangeId",goalYearRangeId);
		
		GoalPlanInput goalPlanInput = new GoalPlanInput();
		goalPlanInput.setBuPartyId(buPartyId);
		goalPlanInput.setPartnerPartyId(partnerPartyId);
		goalPlanInput.setSectionTypeId(sectionTypeId); // 47010  - goal planning (need constant )
		goalPlanInput.setAssetClassId(assetClassId);
		goalPlanInput.setRiskProfileId(Integer.parseInt(riskProfileId));//Integer.parseInt(riskProfileId));
		Integer recommendationRecordTypeId= 50005;//make constant
		goalPlanInput.setRecommendationRecordTypeId(recommendationRecordTypeId);
		goalPlanInput.setGoalYearRangeId(Integer.parseInt(goalYearRangeId));
		//category id selected in goalPlanAssetTypes.jsp
		goalPlanInput.setCategoryId(Integer.parseInt(passedCategoryId));
		goalPlanInput.setProductTypeId(Integer.parseInt(productTypeId));
		BaseResponse<Map<Integer, List<AdviceRecommendation>>> baseResponse = null;
		
		// post the object to service
				baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalPlanInput, BaseResponse.class);
				if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
					try {
						List<AdviceRecommendation> goalJsonDataList = new ArrayList<AdviceRecommendation>();
						List<AdviceRecommendation> goalJsonDataList1 = new ArrayList<AdviceRecommendation>();
						//call service to get related data
						goalJsonDataList = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
						
						for(int i=0;i<goalJsonDataList.size();i++){
							//convert each json object
							AdviceRecommendation adviceRecommendation = objectMapper.readValue(objectMapper.writeValueAsString(goalJsonDataList.get(i)), AdviceRecommendation.class);					
							goalJsonDataList1.add(adviceRecommendation);							
						}
						model.addAttribute("goalPlanAssociatedProductsList",goalJsonDataList1);
						if(goalJsonDataList1.isEmpty()){
							model.addAttribute("productCount",0);
						}else{
							model.addAttribute("productCount",(goalJsonDataList1.size()-1));
							model.addAttribute("recordTypeId",goalJsonDataList1.get(0).getRecordTypeId());
						}	
					} catch (JsonParseException e) {
						// TODO Auto-generated catch block
						LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
					} catch (JsonMappingException e) {
						// TODO Auto-generated catch block
						LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
					} catch (JsonGenerationException e) {
						// TODO Auto-generated catch block
						LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
					}
					
				}
				
				model.addAttribute("allocationPercentAsset",allocationPercentAsset);
				if(!inactiveLinkFlag.isEmpty()){
					model.addAttribute("inactiveLinkFlag",inactiveLinkFlag);
				}
				if(null!=allocationPercentProductType){
					String[] pieces=allocationPercentProductType.split("_");
					model.addAttribute("productTypeName",pieces[0]);
					model.addAttribute("allocationPercentProductType",pieces[1]);
				}				
				model.addAttribute("allocationPercentCategory", allocationPercentCategory);								
				
		return "goalPlanAssociatedProducts";
	}
	
	@RequestMapping(value = "/saveGoalPlanAssociatedProducts", method = RequestMethod.POST)
	public ModelAndView saveGoalPlanAssociatedProducts(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return new ModelAndView("redirect:/login");
		}
		GoalPlanSession goalPlanSession=(GoalPlanSession) request.getSession().getAttribute("goalPlanSession");
		goalPlanSession.setInactiveLinks("");
		request.getSession().setAttribute("goalPlanSession", goalPlanSession);
		
		String productDropDownValues="";
		String companyDropDownValues="";
		String[] productDropDownValuesArray;
		String[] companyDropDownValuesArray;
		Integer assetClassId=0;
		Integer goalYearRangeId=0;
		Integer buPartyId=userSession.getBuId();
		Integer sectionTypeId=Integer.parseInt(request.getParameter("sectionTypeId"));
		String recordTypeId =request.getParameter("recordTypeId");		
		String productTypeId=request.getParameter("productTypeId");
		String parentId=request.getParameter("recordId");
		String categoryId=request.getParameter("categoryId");
		/*String recordIds=request.getParameter("finalRecordIds");*/
		/*String[] recordIdPieces=recordIds.split(",");*/
		Integer createdBy=userSession.getPartyId();
		String[] productPieces;
		
		
		if(null!=request.getParameter("assetClassId")){
			assetClassId=Integer.parseInt(request.getParameter("assetClassId"));
		}
		if(null!=request.getParameter("goalYearRangeId")){
			goalYearRangeId=Integer.parseInt(request.getParameter("goalYearRangeId"));
		}
		int insertFlag = 1;
		if(recordTypeId.equals("14003")){
			insertFlag=0;
		}
		recordTypeId="14003";
		String riskProfileId = request.getParameter("riskProfileId");	
		
		//int recordTypeId = userSession.getRecordtypeId();
		Integer partyId;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId.equals("14008") || recordTypeId.equals("14012") )//Service portal: 14008 User,14012 Service Team Member 
    	{
    		partyId = bu_partyId; 
    	}
    	else
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		
		
		
		List<AdviceRecommendation> adviceRecommendationsList=new ArrayList<AdviceRecommendation>();
		AdviceRecommendation adviceRecommendation=new AdviceRecommendation();
		productDropDownValues = request.getParameter("finalProductData");
		companyDropDownValues = request.getParameter("finalCompanyData");
		productDropDownValuesArray=productDropDownValues.split(",");
		companyDropDownValuesArray=companyDropDownValues.split(",");
			
		for(int j=0;j<productDropDownValuesArray.length;j++){	
			adviceRecommendation=new AdviceRecommendation();
			productPieces=productDropDownValuesArray[j].split("_");
			if((null!=productDropDownValuesArray[j]) && (!productDropDownValuesArray[j].isEmpty()) && 
					(null!=companyDropDownValuesArray[j]) && (!companyDropDownValuesArray[j].isEmpty())){
				if((0<(productPieces.length)) && (null!=productPieces[0]) && (insertFlag==0) && !(productPieces[0].equals("0"))){
					adviceRecommendation.setId(productPieces[0]);
				}
				
				if(productPieces.length>=2 && productPieces[1]!=null && !productPieces[1].equals("null")){
					adviceRecommendation.setProductId(Integer.parseInt(productPieces[1]));
				}else{
					adviceRecommendation.setProductId(0);
				}				
				adviceRecommendation.setManufacturerId(Integer.parseInt(companyDropDownValuesArray[j]));
				adviceRecommendation.setProductTypeId(Integer.parseInt(productTypeId));
				adviceRecommendation.setGoalYearRangeId(goalYearRangeId);
				adviceRecommendation.setCategoryId(Integer.parseInt(categoryId));
				adviceRecommendation.setPartyId(partyId);
				//System.out.println("userSession.getBuId()...."+userSession.getBuId());
				adviceRecommendation.setBuPartyId(buPartyId);
				adviceRecommendation.setRiskProfileId(Integer.parseInt(riskProfileId));
				adviceRecommendation.setRecommendationRecordTypeId(50005);
				adviceRecommendation.setRecordTypeId(Integer.parseInt(recordTypeId));
				adviceRecommendation.setAssetClassId(assetClassId);
				adviceRecommendation.setSectionTypeId(sectionTypeId);
				adviceRecommendation.setSeqNo(1);
				adviceRecommendation.setParentFPAdviseRecommendID(Integer.parseInt(parentId));
				if(productPieces.length>=3){
					adviceRecommendation.setIspreferredProduct(Integer.parseInt(productPieces[2]));
				}else{
					adviceRecommendation.setIspreferredProduct(0);
				}
				adviceRecommendation.setCreatedBy(createdBy);
				adviceRecommendationsList.add(adviceRecommendation);
				}
			}
			
		
		String token = "153443";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_GOAL_PLANNING_PRODUCT_CATEGORY_URL + "/" + username + "/" + token+"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceRecommendationsList, BaseResponse.class);
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_GOAL_PLANNING_PRODUCT_SUCESSFUL,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_GOAL_PLANNING_PRODUCT);
			redirectAttributes.addFlashAttribute("success", "success.goalPlanning.dataSave");		
		}else{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_GOAL_PLANNING_PRODUCT_FAILED,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_GOAL_PLANNING_PRODUCT);
			redirectAttributes.addFlashAttribute("error", "error.goalPlanning.dataSave");
		}
		modelAndView = new ModelAndView("redirect:/partner/goalPlanAssociatedProducts");
		return modelAndView;
	}	  
	 
	@RequestMapping(value = "/recommendation/{recommendationType}", method = {RequestMethod.GET,RequestMethod.POST})
	public String loadEmergencyPlanning(@PathVariable("recommendationType") String recommendationType,
			@RequestParam(value="productTypeId",defaultValue="",required=true) String productTypeId,
			@RequestParam(value="categoryId",defaultValue="",required=true) String categoryId,
			Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		 
		
    	
    	
    	//Integer partyId = userSession.getPartyId();
		Integer buId = userSession.getBuId();
		String userName=userSession.getUserName();
		String token = "153443";
		Integer clientPartyId = -1;
		Integer buPartyId = userSession.getBuId();
		UriComponentsBuilder uriCB;
		Integer fpSectionTypeId = 0;
		Integer assetClassId = 0;
		Integer recordTypeId=0;
		String url="recommendation/emergencyPlanning";
		
		
		recordTypeId = userSession.getRecordtypeId();
		Integer partyId  ;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId==14008 || recordTypeId==14012)//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}
    	else
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		GoalPlanInput goalPlanInput=new GoalPlanInput();		
		goalPlanInput.setClientPartyId(clientPartyId);
		goalPlanInput.setBuPartyId(buPartyId);
		goalPlanInput.setPartnerPartyId(partyId);		
		
		if(recommendationType.equals("emergencyPlanning") || recommendationType.equals("Emergency Planning")){
			fpSectionTypeId = 39001;
			assetClassId = 46002;
			model.addAttribute("assetHeader","Emergency Planning");
		}else if(recommendationType.equals("riskCover") || recommendationType.equals("Risk Cover")){
			fpSectionTypeId = 39003;
			assetClassId = 46004;			
			if(null!=productTypeId && !productTypeId.isEmpty()){
				goalPlanInput.setProductTypeId(Integer.parseInt(productTypeId));
			}else{
				goalPlanInput.setProductTypeId(new Integer("47007"));
			}
			if(null!=categoryId && !categoryId.isEmpty() && !categoryId.equals("0")){
				goalPlanInput.setCategoryId(Integer.parseInt(categoryId));
			}			
			model.addAttribute("assetHeader","Risk Cover");
		}else if(recommendationType.equals("loans") || recommendationType.equals("Loans")){
			fpSectionTypeId = 39008;
			assetClassId = 46006;
			model.addAttribute("assetHeader","Loans");
		}				
		
		goalPlanInput.setAssetClassId(""+assetClassId);
		goalPlanInput.setSectionTypeId(fpSectionTypeId);
		
		AdviceRecommendation adviceRecommendation = new AdviceRecommendation();
		List<AdviceRecommendation> adviceRecommendationsListAsJson = new ArrayList<AdviceRecommendation>();
		List<AdviceRecommendation> adviceRecommendationsList = new ArrayList<AdviceRecommendation>();
		List<JsonData> productCategoryList=new ArrayList<JsonData>();
		
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_RECOMMENDATIONS + "/" + userName +"/" +token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		int productTypeCount=0;
		Map<String, List<AdviceRecommendation>> adviceRecommendationMap=new LinkedHashMap<String, List<AdviceRecommendation>>();
		String key="";
		String recordId="";
		String productTypeIds="";
		Integer catId=0;
		//call service for all parties associated 
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalPlanInput ,BaseResponse.class);
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				adviceRecommendationsListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);							
				
				for(int i = 0; i<adviceRecommendationsListAsJson.size(); i++){
					adviceRecommendation = new AdviceRecommendation();
					adviceRecommendation = objectMapper.readValue(objectMapper.writeValueAsString(adviceRecommendationsListAsJson.get(i)), AdviceRecommendation.class);
					recordId=adviceRecommendation.getParentFPAdviseRecommendID()+"_"+adviceRecommendation.getId();
					adviceRecommendation.setId(recordId);
					if(adviceRecommendation.getProductTypeId().equals(new Integer("47006"))){
						if(adviceRecommendation.getCategoryId().equals(new Integer("48026"))){
							key=adviceRecommendation.getProductTypeId()+"_"+adviceRecommendation.getProductTypeName()+"- Health_"+adviceRecommendation.getAllocationPercentProductType();
							catId=48026;
						}else if(adviceRecommendation.getCategoryId().equals(new Integer("48027"))){
							key=adviceRecommendation.getProductTypeId()+"_"+adviceRecommendation.getProductTypeName()+"- Critical_"+adviceRecommendation.getAllocationPercentProductType();
							catId=48027;
						}else if(adviceRecommendation.getCategoryId().equals(new Integer("48025"))){
							key=adviceRecommendation.getProductTypeId()+"_"+adviceRecommendation.getProductTypeName()+"- Accidental_"+adviceRecommendation.getAllocationPercentProductType();
							catId=48025;
						}else if(adviceRecommendation.getCategoryId().equals(new Integer("48024"))){
							key=adviceRecommendation.getProductTypeId()+"_"+adviceRecommendation.getProductTypeName()+"- Property_"+adviceRecommendation.getAllocationPercentProductType();
							catId=48024;
						}
						url="recommendation/riskCoverGeneral";
						model.addAttribute("companyNameList", objectMapper.writeValueAsString(dropDownService.getCompanynameList(request, catId)));						
					}else if(adviceRecommendation.getProductTypeId().equals(new Integer("47007"))){
						key=adviceRecommendation.getProductTypeId()+"_"+adviceRecommendation.getProductTypeName()+"_"+adviceRecommendation.getAllocationPercentProductType();
						url="recommendation/riskCover";
					}else{
						key=adviceRecommendation.getProductTypeId()+"_"+adviceRecommendation.getProductTypeName()+"_"+adviceRecommendation.getAllocationPercentProductType();
					}
					
					if(adviceRecommendationMap.containsKey(key)){
						adviceRecommendationsList=adviceRecommendationMap.get(key);
						adviceRecommendationsList.add(adviceRecommendation);
						adviceRecommendationMap.put(key, adviceRecommendationsList);
					}else{
						if(i==0){
							recordTypeId=adviceRecommendation.getRecordTypeId();
							productTypeIds=adviceRecommendation.getProductTypeId()+",";
						}else{
							productTypeIds=productTypeIds+adviceRecommendation.getProductTypeId();
						}
						
						productCategoryList=dropDownService.getProductCategoryList(adviceRecommendation.getProductTypeId());
						adviceRecommendation.setProductCategoryList(objectMapper.writeValueAsString(productCategoryList));
						adviceRecommendationsList = new ArrayList<AdviceRecommendation>();
						adviceRecommendationsList.add(adviceRecommendation);
						productTypeCount=productTypeCount+1;
						adviceRecommendationMap.put(key, adviceRecommendationsList);
						/*if((i==0) && (recommendationType.equals("riskCover") || recommendationType.equals("Risk Cover"))){
							model.addAttribute("adviceRecommendationMap",adviceRecommendationMap);
						}*/
					}
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
			}
		}
		
		model.addAttribute("productCategoryDropDownData",objectMapper.writeValueAsString(dropDownService.getProductCategoryList(request,fpSectionTypeId)));						
		model.addAttribute("adviceRecommendationMap",adviceRecommendationMap);
		model.addAttribute("productTypeCount",productTypeCount);
		model.addAttribute("productTypeIds",productTypeIds);
		model.addAttribute("sectionTypeId",fpSectionTypeId);
		model.addAttribute("assetClassId",assetClassId);
		model.addAttribute("recordTypeId",recordTypeId);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("productTypeId",productTypeId);
		
		if(productTypeCount==0){
			redirectAttributes.addFlashAttribute("error", "error.loans.noDataFound");
			return "redirect:/partner/recommendation";
		}
		return url;
	}
	
	@RequestMapping(value = "/saveEmergencyPlanning", method = RequestMethod.POST)
	public ModelAndView saveEmergencyPlanning(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return new ModelAndView("redirect:/login");
		}
		
		String assetClassId=request.getParameter("assetClassId");
		String sectionTypeId=request.getParameter("sectionTypeId");
		String recordTypeId = request.getParameter("recordTypeId");		
		String assetheader=request.getParameter("assetHeader");
		String finalproductTypeIds=request.getParameter("finalProductTypeIds");				
		
		Integer buPartyId=userSession.getBuId();
		String productCategoryDropDownValues="";
		String allocationPercentValues ="";
		String productDropDownValues="";
		String[] productCategoryDropDownValuesArray;
		String[] allocationPercentValuesArray;
		String[] productDropDownValuesArray;
		String[] productTypeId=finalproductTypeIds.split(",");
		/*String[] assetLevelPieces=assetheader.split("_");*/
		/*String[] assetTypeLevelPieces;*/
		String[] productCategoryPieces;
		String[] productPieces; 
		Integer productTypeCount=0;
		Integer createdBy=userSession.getPartyId();
		
		String token = "153443";
		String username = userSession.getUserName();
		Integer buId = userSession.getBuId();
		
		String optionalParams="";
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_RECOMMENDATIONS_URL + "/" + username + "/" + token+"?buId="+buId);;
		
		if(null!=request.getParameter("productTypeCount")){
			productTypeCount=Integer.parseInt(request.getParameter("productTypeCount"));
		}
		
		
		int insertFlag = 1;
		if(recordTypeId.equals("14003")){
			insertFlag=0;
		}
		recordTypeId="14003";
		
		//recordTypeId = userSession.getRecordtypeId();
		Integer partyId  ;
    	System.out.println(" recordTypeID................"+recordTypeId);
    	
    	if (recordTypeId.equals("14008") ||recordTypeId.equals("14012") )//Service portal: 14008 User,14012 Service Team Member 
    	{
    		 partyId = bu_partyId; 
    	}
    	else
    	{
    		 partyId = userSession.getPartyId();
    	}
		
		
		
		//Integer partyId = userSession.getPartyId();
		List<AdviceRecommendation> adviceRecommendationsList = new ArrayList<AdviceRecommendation>(); 
		AdviceRecommendation adviceRecommendationEquity = new AdviceRecommendation();
		int categoryId=0;			
		//String productTypeId="";
		String productTypeAllocationPercent="";
		
		for(int i=0;i<productTypeCount;i++){
			productCategoryDropDownValues = request.getParameter("finalProductCategory_"+(i+1));
			allocationPercentValues= request.getParameter("finalAllocationPercent_"+(i+1));
			productDropDownValues = request.getParameter("finalProductIds_"+(i+1));
			productCategoryDropDownValuesArray=productCategoryDropDownValues.split(",");
			allocationPercentValuesArray=allocationPercentValues.split(",");
			productDropDownValuesArray=productDropDownValues.split(",");
			productTypeAllocationPercent=request.getParameter("allocationPercent_"+productTypeId[i]);
			
			for(int j=0;j<productCategoryDropDownValuesArray.length;j++){	
				if((null!=productCategoryDropDownValuesArray[j]) && (!productCategoryDropDownValuesArray[j].isEmpty()) && 
						(!productCategoryDropDownValuesArray[j].equals("-1"))){
					productCategoryPieces=productCategoryDropDownValuesArray[j].split("_");
					productPieces=productDropDownValuesArray[j].split("_");
					
					//category level
					adviceRecommendationEquity=new AdviceRecommendation();
					if(insertFlag==0 && (productCategoryPieces.length>=2)){
						adviceRecommendationEquity.setId(productCategoryPieces[1]);
					}		
					adviceRecommendationEquity.setProductTypeId(Integer.parseInt(productTypeId[i]));
					if(null!=productTypeAllocationPercent){
						adviceRecommendationEquity.setAllocationPercentProductType(Double.parseDouble(productTypeAllocationPercent));
					}					
					
					if(productTypeId[i].equals("47007")){
						uriCB = UriComponentsBuilder.fromHttpUrl(saveLifeRiskCover + "/" + username + "/" + token+"?buId="+buId);
						if(j==0){
							optionalParams="?productTypeId="+productTypeId[i];
						}						
					}else if(productTypeId[i].equals("47006")){
						uriCB = UriComponentsBuilder.fromHttpUrl(saveGeneralRiskCover + "/" + username + "/" + token+"?buId="+buId);
						if(j==0){
							optionalParams="?productTypeId="+productTypeId[i]+"&categoryId="+productCategoryPieces[0];
						}
					}else{
						uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_RECOMMENDATIONS_URL + "/" + username + "/" + token+"?buId="+buId);
					}
					
					if(null!=productCategoryPieces[0] && !productCategoryPieces[0].equals("null")){
						categoryId=Integer.parseInt(productCategoryPieces[0]);
					}else{
						categoryId=0;
					}					
					adviceRecommendationEquity.setCategoryId(categoryId);
					adviceRecommendationEquity.setBuPartyId(buPartyId);
					if(j<allocationPercentValuesArray.length && null!=allocationPercentValuesArray[j] && !allocationPercentValuesArray[j].isEmpty()){
						adviceRecommendationEquity.setAllocationPercent(Integer.parseInt(allocationPercentValuesArray[j]));
					}					
					adviceRecommendationEquity.setPartyId(partyId);
					adviceRecommendationEquity.setRecordTypeId(Integer.parseInt(recordTypeId));
					adviceRecommendationEquity.setAssetClassId(Integer.parseInt(assetClassId));
					adviceRecommendationEquity.setSectionTypeId(Integer.parseInt(sectionTypeId));
					adviceRecommendationEquity.setSeqNo(j+1);
					adviceRecommendationEquity.setParentFPAdviseRecommendID(12);
					adviceRecommendationEquity.setCreatedBy(createdBy);
					adviceRecommendationEquity.setRecommendationRecordTypeId(50003);
					
					adviceRecommendationsList.add(adviceRecommendationEquity);					
					
					//product level
					adviceRecommendationEquity=new AdviceRecommendation();
					if(insertFlag==0 && (productCategoryPieces.length==3)){
						adviceRecommendationEquity.setId(productCategoryPieces[2]);
					}		
					adviceRecommendationEquity.setProductTypeId(Integer.parseInt(productTypeId[i]));
					if(null!=productTypeAllocationPercent){
						adviceRecommendationEquity.setAllocationPercentProductType(Double.parseDouble(productTypeAllocationPercent));
					}
					//categoryId=Integer.parseInt(productCategoryPieces[0]);
					adviceRecommendationEquity.setCategoryId(categoryId);
					adviceRecommendationEquity.setBuPartyId(buPartyId);
					if(j<allocationPercentValuesArray.length && null!=allocationPercentValuesArray[j] && !allocationPercentValuesArray[j].isEmpty()){
						adviceRecommendationEquity.setAllocationPercent(Integer.parseInt(allocationPercentValuesArray[j]));
					}					
					adviceRecommendationEquity.setPartyId(partyId);
					if(productPieces.length>=1){
						adviceRecommendationEquity.setProductId(Integer.parseInt(productPieces[0]));
					}else{
						adviceRecommendationEquity.setProductId(-1);
					}
					if(productPieces.length==2){
						adviceRecommendationEquity.setIspreferredProduct(Integer.parseInt(productPieces[1]));
					}else{
						adviceRecommendationEquity.setIspreferredProduct(0);
					}
					adviceRecommendationEquity.setRecordTypeId(Integer.parseInt(recordTypeId));
					adviceRecommendationEquity.setAssetClassId(Integer.parseInt(assetClassId));
					adviceRecommendationEquity.setSectionTypeId(Integer.parseInt(sectionTypeId));
					adviceRecommendationEquity.setSeqNo(j+1);
					adviceRecommendationEquity.setParentFPAdviseRecommendID(12);
					adviceRecommendationEquity.setCreatedBy(createdBy);
					adviceRecommendationEquity.setRecommendationRecordTypeId(50005);
					
					adviceRecommendationsList.add(adviceRecommendationEquity);
				}
			}
			
		}

		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceRecommendationsList, BaseResponse.class);
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_EMERGENCY_PLANNING_SUCCESSFUL,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_EMERGENCY_PLANNING_SOURCE);
			if(null!=assetheader && assetheader.equals("Emergency Planning")){
				redirectAttributes.addFlashAttribute("success", "success.emergencyPlanning.dataSave");
			}else if(null!=assetheader && assetheader.equals("Risk Cover")){
				redirectAttributes.addFlashAttribute("success", "success.riskCover.dataSave");
			}else if(null!=assetheader && assetheader.equals("Loans")){
				redirectAttributes.addFlashAttribute("success", "success.loans.dataSave");
			}
		}else{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_SAVE_EMERGENCY_PLANNING_FAILED,RECOMMONDATION_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_EMERGENCY_PLANNING_SOURCE);
			if(null!=assetheader && assetheader.equals("Emergency Planning")){
				redirectAttributes.addFlashAttribute("error", "error.emergencyPlanning.dataSave");
			}else if(null!=assetheader && assetheader.equals("Risk Cover")){
				redirectAttributes.addFlashAttribute("error", "error.riskCover.dataSave");
			}else if(null!=assetheader && assetheader.equals("Loans")){
				redirectAttributes.addFlashAttribute("error", "error.loans.dataSave");
			}
		}
		
		if(assetheader.equals("Emergency Planning")){
			modelAndView = new ModelAndView("redirect:/partner/recommendation/emergencyPlanning");
		}else if(assetheader.equals("Risk Cover")){
			if(!optionalParams.isEmpty()){
				modelAndView = new ModelAndView("redirect:/partner/recommendation/riskCover"+optionalParams);
			}else{
				modelAndView = new ModelAndView("redirect:/partner/recommendation/riskCover");
			}
			
		}else if(assetheader.equals("Loans")){
			modelAndView = new ModelAndView("redirect:/partner/recommendation/loans");
		}
			
		return modelAndView;
	}  
	
	@RequestMapping(value = "/getRiskCoverProductCategoryDropDownvalues", method = RequestMethod.GET)		
	public @ResponseBody List<JsonData> getRiskCoverProductCategoryDropDownvalues(HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		String username = userSession.getUserName();
		String ProductTypeId = request.getParameter("ProductTypeId");
		return dropDownService.getProductCategoryListForRiskCover(request, Integer.parseInt(ProductTypeId), username);
	}
	
	@RequestMapping(value = "/getRiskCoverCompanyDropDownvalues", method = RequestMethod.GET)		
	public @ResponseBody List<JsonData> getRiskCoverCompanyDropDownvalues(HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		String username = userSession.getUserName();
		String categoryId = request.getParameter("categoryId");
		return dropDownService.getCompanynameListForRiskCover(request, Integer.parseInt(categoryId), username);
	}
	

	@RequestMapping(value = "/getRiskCoverProductDropDownvalues", method = RequestMethod.GET)		
	public @ResponseBody List<JsonData> getRiskCoverProductDropDownvalues(HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		String username = userSession.getUserName();
		return dropDownService.getProductNamesListForRiskCover(request, username);
	}
	
	@RequestMapping(value = "/getProductDropDownvalues", method = RequestMethod.GET)		
	public synchronized @ResponseBody List<JsonData> getProductDropDownvalues(HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		String username = userSession.getUserName();
		return dropDownService.getProductNamesList(request);
	}
		
	@RequestMapping(value = "/getCommissionvalues", method = RequestMethod.GET)		
	public @ResponseBody String getCommissionvalues(HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		String username = userSession.getUserName();
		return dropDownService.getCommisssionValues(request,username);
	}
	
	@RequestMapping(value="/emergencyPlanning")
	public String emergencyPlanning(HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		return "/emergencyPlanning";
	}
	
	@RequestMapping(value = "/deleteRecommendationForProductCategory", method = RequestMethod.GET)		
	public @ResponseBody String deleteRecommendationForProductCategory(HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		String username = userSession.getUserName();
		return dropDownService.deleteRecommendationForProductCategory(request,username);
	}		
	
	@RequestMapping(value = "/loadCompanyNameList", method = RequestMethod.GET)		
	public synchronized @ResponseBody List<JsonData> loadCompanyNameList(HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		String username = userSession.getUserName();
		if(null!=request.getParameter("categoryId")){
			Integer categoryId=Integer.parseInt(request.getParameter("categoryId"));
			return dropDownService.getCompanynameList(request, categoryId);		
		}else{
			return null;
		}

	}
	
	@RequestMapping(value="/goalPlanSetDefault/{url}", method=RequestMethod.GET)
	public String goalPlanSetDefault(HttpServletRequest request,@PathVariable("url") String url,
			@RequestParam(value="optionalURL",defaultValue="",required=true) String optionalURL,
			@RequestParam("sectionTypeId") Integer sectionTypeId,
			final RedirectAttributes redirectAttributes){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:login";
		}
		String token="12345";
		Integer buId = 153;
		UriComponentsBuilder uriCB;
		String username=userSession.getUserName();
		Integer partyId=userSession.getPartyId();
		uriCB = UriComponentsBuilder.fromHttpUrl(RESET_GOAL_PLAN_DATA+ "/" + partyId + "/" + sectionTypeId + "/" + username +"/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		String result="failure";
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			if(url.equals("recommendation")){
				if(null!=optionalURL && optionalURL.equals("Emergency Planning")){
					redirectAttributes.addFlashAttribute("success", "success.emergencyPlanning.setDefault");
				}else if(null!=optionalURL && optionalURL.equals("Risk Cover")){
					redirectAttributes.addFlashAttribute("success", "success.riskCover.setDefault");
				}else if(null!=optionalURL && optionalURL.equals("Loans")){
					redirectAttributes.addFlashAttribute("success", "success.loans.setDefault");
				}else{
					redirectAttributes.addFlashAttribute("success", "success.goalPlanning.setDefault");
				}
			}else if(url.equals("taxPlanning")){
				redirectAttributes.addFlashAttribute("success", "success.taxPlanning.setDefault");
			}else if(url.equals("vacationPlanning")){
				redirectAttributes.addFlashAttribute("success", "success.vacationPlanning.setDefault");
			}else if(url.equals("successionPlanning")){
				redirectAttributes.addFlashAttribute("success", "success.successionPlanning.setDefault");
			}			
		}else{
			if(url.equals("recommendation")){
				if(null!=optionalURL && optionalURL.equals("Emergency Planning")){
					redirectAttributes.addFlashAttribute("error", "error.emergencyPlanning.setDefault");
				}else if(null!=optionalURL && optionalURL.equals("Risk Cover")){
					redirectAttributes.addFlashAttribute("error", "error.riskCoverPlanning.setDefault");
				}else if(null!=optionalURL && optionalURL.equals("Loans")){
					redirectAttributes.addFlashAttribute("error", "error.loans.setDefault");
				}else{
					redirectAttributes.addFlashAttribute("error", "error.goalPlanning.setDefault");
				}
			}else if(url.equals("taxPlanning")){
				redirectAttributes.addFlashAttribute("error", "error.taxPlanning.setDefault");
			}else if(url.equals("vacationPlanning")){
				redirectAttributes.addFlashAttribute("error", "error.vacationPlanning.setDefault");
			}else if(url.equals("successionPlanning")){
				redirectAttributes.addFlashAttribute("error", "error.successionPlanning.setDefault");
			}
		}
		if(optionalURL.isEmpty()){
			return "redirect:/partner/"+url;
			//return "redirect:/partner/goalPlanning";
		}else{
			return "redirect:/partner/"+url+"/"+optionalURL;
		}
		
	}		
	
	@RequestMapping(value = "getProductRecommendationList/{partyId}/{riskProfileId}/{goalYearRangeId}/{assetClassId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String getProductRecommendationList(Model model, @PathVariable String partyId, 
			@PathVariable String riskProfileId, @PathVariable String goalYearRangeId, @PathVariable String assetClassId, 
			HttpServletRequest request) 
	{	
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			
			Integer recordTypeId = userSession.getRecordtypeId();
			
	    	System.out.println(" recordTypeID................"+recordTypeId);
	    	
	    	if (recordTypeId.equals("14008") ||recordTypeId.equals("14012") )//Service portal: 14008 User,14012 Service Team Member 
	    	{
	    		 
	    		 model.addAttribute("partyId", bu_partyId);
	    	}
	    	else
	    	{
	    		
	    		 model.addAttribute("partyId", partyId);
	    	}
			
			UriComponentsBuilder uriCB;
			
			String token="12345";
			int buId=123;  
			
			//model.addAttribute("partyId", partyId);
			model.addAttribute("sliderSelectBx","products");
			if(assetClassId.equals("undefined")){
				assetClassId="46001";
			}
			model.addAttribute("assetClassId",assetClassId);
			model.addAttribute("goalYearRangeId",goalYearRangeId);
			model.addAttribute("riskProfileId",riskProfileId);
			if(riskProfileId.equals("-1")){
				riskProfileId="40001";//,40002,40003
			}
			
			GoalPlanInput goalPlanInput = new GoalPlanInput();
			goalPlanInput.setSectionTypeId(39005);
			goalPlanInput.setClientPartyId(null);
			goalPlanInput.setPartnerPartyId(userSession.getPartyId());
			goalPlanInput.setBuPartyId(userSession.getBuId());
			goalPlanInput.setAssetClassId(assetClassId);
			goalPlanInput.setGoalYearRangeId(Integer.parseInt(goalYearRangeId));
			goalPlanInput.setRecommendationRecordTypeId(50001);
			goalPlanInput.setRiskProfileIds(riskProfileId);
			goalPlanInput.setCategoryId(null);  
			
			uriCB = UriComponentsBuilder.fromHttpUrl(goal_bucket_allocation_url+ "/" + userSession.getUserName() +"/"+ token +"?buId="+buId);
			BaseResponse<AdviceRecommendation> baseResponse = new BaseResponse<AdviceRecommendation>();
			
			List<AdviceRecommendation> adviceRecommendationsListAsJson=new ArrayList<AdviceRecommendation>();
			List<AdviceRecommendation> adviceRecommendationsList=new ArrayList<AdviceRecommendation>();
			AdviceRecommendation adviceRecommendation=new AdviceRecommendation();			
			
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalPlanInput ,BaseResponse.class);
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				try {
					adviceRecommendationsListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);							
					
					for(int i = 0; i<adviceRecommendationsListAsJson.size(); i++){
						adviceRecommendation = new AdviceRecommendation();
						adviceRecommendation = objectMapper.readValue(objectMapper.writeValueAsString(adviceRecommendationsListAsJson.get(i)), AdviceRecommendation.class);
						adviceRecommendationsList.add(adviceRecommendation);
					}
				} catch (JsonParseException e) {
					// TODO Auto-generated catch block
					LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
				} catch (JsonGenerationException e) {
					// TODO Auto-generated catch block
					LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
				}
			}
			
			model.addAttribute("adviceRecommendationsList",adviceRecommendationsList);
			
		}catch(Exception ex){
			LOGGER.error("Error Fetching data in getProductRecommendationList method");
		}
		return "recommendation/goal_plan_bucket_allocation";	
	}  
	
/*	@RequestMapping(value = "/goal/view-bucket-allocation/{partyId}/{riskProfileId}", method = RequestMethod.GET)
	public String ViewGoalBucketAllocation(Model model, @PathVariable String partyId, 
			@PathVariable String riskProfileId, HttpServletRequest request) 
	{	
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			model.addAttribute("partyId", partyId);
			
			GoalPlanInput goalPlanInput = new GoalPlanInput();
			goalPlanInput.setSectionTypeId(39005);
			goalPlanInput.setClientPartyId(Integer.parseInt(partyId));
			
			Integer recordTypeId = userSession.getRecordtypeId();
			
	    	System.out.println(" recordTypeID................"+recordTypeId);
	    	
	    	if (recordTypeId.equals("14008") ||recordTypeId.equals("14012") )//Service portal: 14008 User,14012 Service Team Member 
	    	{
	    		 
	    		goalPlanInput.setPartnerPartyId(bu_partyId);
	    	}
	    	else
	    	{
	    		
	    		goalPlanInput.setPartnerPartyId(userSession.getPartyId()); 
	    	}
			
			
			//goalPlanInput.setPartnerPartyId(userSession.getPartyId());
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
		return "recommendation/goal_plan_bucket_allocation";	
	}*/	
	
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
	
	/*@RequestMapping(value = "/editGoalBucketAllocation/{goalYearRangeId}/{riskProfileId}", method = RequestMethod.GET)
	public String editGoalBucketAllocation(HttpServletRequest request,@PathVariable("riskProfileId") String riskProfileId,
			@PathVariable("goalYearRangeId") String goalYearRangeId,Model model) 
	{	 
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			
			
			   
			UriComponentsBuilder uriCB;
			
			String token="12345";
			int buId=123;
			
			Integer tempCategoryId = 0;
			
			GoalPlanInput goalPlanInput = new GoalPlanInput();
			goalPlanInput.setSectionTypeId(39005);
			goalPlanInput.setClientPartyId(null);
			Integer recordTypeId = userSession.getRecordtypeId();
			
	    	System.out.println(" recordTypeID................"+recordTypeId);
	    	
	    	if (recordTypeId.equals("14008") ||recordTypeId.equals("14012") )//Service portal: 14008 User,14012 Service Team Member 
	    	{
	    		 goalPlanInput.setPartnerPartyId(bu_partyId);
	    	}
	    	else 
	    	{
	    		goalPlanInput.setPartnerPartyId(userSession.getPartyId());
	    	} 
			
			//goalPlanInput.setPartnerPartyId(userSession.getPartyId());
			goalPlanInput.setBuPartyId(userSession.getBuId());
			goalPlanInput.setGoalYearRangeId(Integer.parseInt(goalYearRangeId));
			goalPlanInput.setRiskProfileIds(riskProfileId);
			goalPlanInput.setCategoryId(null);
			
			uriCB = UriComponentsBuilder.fromHttpUrl(get_edit_goal_bucket_allocation_url+ "/" + userSession.getUserName() +"/"+ token +"?buId="+buId);
			BaseResponse<AdviceRecommendation> baseResponse = new BaseResponse<AdviceRecommendation>();
			
			List<AdviceRecommendation> adviceRecommendationsListAsJson=new ArrayList<AdviceRecommendation>();
			List<AdviceRecommendation> adviceRecommendationsList=new ArrayList<AdviceRecommendation>();
			Map<Integer,List<AdviceRecommendation>> recommendationMap = new LinkedHashMap<Integer,List<AdviceRecommendation>>();
			AdviceRecommendation adviceRecommendation=new AdviceRecommendation();			
			
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalPlanInput ,BaseResponse.class);
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				try {
					adviceRecommendationsListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);							
					
					for(int i = 0; i<adviceRecommendationsListAsJson.size(); i++){
						adviceRecommendation = new AdviceRecommendation();
						adviceRecommendation = objectMapper.readValue(objectMapper.writeValueAsString(adviceRecommendationsListAsJson.get(i)), AdviceRecommendation.class);
						if(!(adviceRecommendation.getCategoryId().equals(tempCategoryId))){
							tempCategoryId = adviceRecommendation.getCategoryId();
							model.addAttribute("productList_"+tempCategoryId,objectMapper.writeValueAsString(dropDownService.getProductNamesList(request, assetClassId, productTypeId, categoryId)));
						}
						if(i==0){
							model.addAttribute("recordTypeId",adviceRecommendation.getRecordTypeId());
						}
						//adviceRecommendationsList.add(adviceRecommendation);
						if(recommendationMap.containsKey(adviceRecommendation.getAssetClassId())){
							if(!adviceRecommendation.getProductId().equals(new Integer("0"))){
								adviceRecommendationsList = recommendationMap.get(adviceRecommendation.getAssetClassId());
								adviceRecommendationsList.add(adviceRecommendation);
							}										
						}else{
							adviceRecommendationsList = new ArrayList<AdviceRecommendation>();
							adviceRecommendationsList.add(adviceRecommendation);
							recommendationMap.put(adviceRecommendation.getAssetClassId(), adviceRecommendationsList);
						}
					}
				} catch (JsonParseException e) {
					// TODO Auto-generated catch block
					LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
				} catch (JsonGenerationException e) {
					// TODO Auto-generated catch block
					LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", e);
				}
			}
			
			model.addAttribute("riskProfileId",riskProfileId);
			model.addAttribute("goalYearRangeId",goalYearRangeId);
			model.addAttribute("adviceRecommendationsList",adviceRecommendationsList);
			model.addAttribute("recommendationMap", recommendationMap);
			
		}catch(Exception ex){
			LOGGER.error("Error Fetching data in getProductRecommendationList method");
		}
		return "recommendation/edit_goal_plan_bucket_allocation";	
	}*/
	
	 
	@RequestMapping(value = "/editGoalBucketAllocation/{goalYearRangeId}/{riskProfileId}", method = RequestMethod.GET)
	public String editGoalBucketAllocation(HttpServletRequest request,@PathVariable("riskProfileId") String riskProfileId,
			@PathVariable("goalYearRangeId") String goalYearRangeId,Model model) 
	{	
		try{
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			
			UriComponentsBuilder uriCB;
			 
			String token="12345";
			int buId=123;
			
			//Integer tempCategoryId = 0;
			
			GoalPlanInput goalPlanInput = new GoalPlanInput();
			goalPlanInput.setSectionTypeId(39005);
			goalPlanInput.setClientPartyId(null);
			//goalPlanInput.setPartnerPartyId(userSession.getBuId());
			Integer recordTypeId = userSession.getRecordtypeId();
			
	    	System.out.println(" recordTypeID................"+recordTypeId);
	    	
	    	if (recordTypeId.equals("14008") ||recordTypeId.equals("14012") )//Service portal: 14008 User,14012 Service Team Member 
	    	{
	    		goalPlanInput.setPartnerPartyId(bu_partyId);
	    	}
	    	else 
	    	{
	    		goalPlanInput.setPartnerPartyId(userSession.getPartyId());
	    	} 
			
		
			goalPlanInput.setBuPartyId(userSession.getBuId());
			goalPlanInput.setGoalYearRangeId(Integer.parseInt(goalYearRangeId));
			goalPlanInput.setRiskProfileIds(riskProfileId);
			goalPlanInput.setCategoryId(null);
			
			uriCB = UriComponentsBuilder.fromHttpUrl(get_edit_goal_bucket_allocation_url+ "/" + userSession.getUserName() +"/"+ token +"?buId="+buId);
			BaseResponse<AdviceRecommendation> baseResponse = new BaseResponse<AdviceRecommendation>();
			
			List<AdviceRecommendation> adviceRecommendationsListAsJson=new ArrayList<AdviceRecommendation>();
			List<AdviceRecommendation> adviceRecommendationsList=new ArrayList<AdviceRecommendation>();
			Map<Integer,List<AdviceRecommendation>> recommendationMap = new LinkedHashMap<Integer,List<AdviceRecommendation>>();
			AdviceRecommendation adviceRecommendation=new AdviceRecommendation();			
			
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), goalPlanInput ,BaseResponse.class);
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				try {
					adviceRecommendationsListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);							
					
					for(int i = 0; i<adviceRecommendationsListAsJson.size(); i++){
						adviceRecommendation = new AdviceRecommendation();
						adviceRecommendation = objectMapper.readValue(objectMapper.writeValueAsString(adviceRecommendationsListAsJson.get(i)), AdviceRecommendation.class);
						/*if(!(adviceRecommendation.getCategoryId().equals(tempCategoryId))){
							tempCategoryId = adviceRecommendation.getCategoryId();
							model.addAttribute("productList_"+tempCategoryId,objectMapper.writeValueAsString(dropDownService.getProductNamesList(request, assetClassId, productTypeId, categoryId)));
						}*/ 
						if(i==0){  
							model.addAttribute("recordTypeId",adviceRecommendation.getRecordTypeId());
						}
						//adviceRecommendationsList.add(adviceRecommendation);
						if(recommendationMap.containsKey(adviceRecommendation.getAssetClassId())){
							if(!adviceRecommendation.getProductId().equals(new Integer("0"))){
								adviceRecommendationsList = recommendationMap.get(adviceRecommendation.getAssetClassId());
								adviceRecommendationsList.add(adviceRecommendation);
							}		 								
						}else{
							adviceRecommendationsList = new ArrayList<AdviceRecommendation>();
							adviceRecommendationsList.add(adviceRecommendation);
							recommendationMap.put(adviceRecommendation.getAssetClassId(), adviceRecommendationsList);
						}
					}  
				} catch (JsonParseException e) {
					// TODO Auto-generated catch block
					LOGGER.error("Exception Recommendation Controller---");
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					LOGGER.error("Exception Recommendation Controller---");
				} catch (JsonGenerationException e) {
					// TODO Auto-generated catch block
					LOGGER.error("Exception Recommendation Controller---");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					LOGGER.error("Exception Recommendation Controller---");
				} 
			} 
			
			model.addAttribute("riskProfileId",riskProfileId);
			model.addAttribute("goalYearRangeId",goalYearRangeId);
			model.addAttribute("adviceRecommendationsList",adviceRecommendationsList);
			model.addAttribute("recommendationMap", recommendationMap);
			
		}catch(Exception ex){
			LOGGER.error("Error Fetching data in getProductRecommendationList method");
		}
		return "recommendation/edit_goal_plan_bucket_allocation";	
	}
	
	@RequestMapping(value = "/saveGoalPlanBucket", method = RequestMethod.POST)
	public String saveGoalPlanBucket(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes) throws JsonGenerationException, JsonMappingException, IOException {

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		  
		String username = userSession.getUserName();
		Integer partyId = userSession.getPartyId();
		Integer buPartyId=userSession.getBuId();
		Integer buId=userSession.getBuId();
		String token="1234";
		List<AdviceRecommendation> adviceRecommendationsList = new ArrayList<AdviceRecommendation>();
		AdviceRecommendation adviceRecommendation=new AdviceRecommendation();
		
		String riskProfileId=request.getParameter("riskProfileId");
		String goalYearRangeId=request.getParameter("goalYearRangeId");
		
		try{
			if(null!=request.getParameter("finalData")){
				
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(insert_GoalPlanBucket + "/" + username + "/" + token+"?buId="+buId);;
				
				/*Integer productCount = Integer.parseInt(request.getParameter("productCount"));*/
				
				String finalData=request.getParameter("finalData");
				String finalDataArray[]=finalData.split(",");			
				
				/*String assetClassId="";
				String productTypeId="";
				String categoryId="";
				String productName="";
				
				String assetPercentage="";
				String productPercentage="";*/
				String[] subArray=null;
				
				for(int i=0;i<finalDataArray.length;i++){
					
					subArray=finalDataArray[i].split("_");
					
					adviceRecommendation=new AdviceRecommendation();				
					
					Integer recordTypeId = userSession.getRecordtypeId();
					
			    	System.out.println(" recordTypeID................"+recordTypeId);
			    	
			    	if (recordTypeId.equals("14008") ||recordTypeId.equals("14012") )//Service portal: 14008 User,14012 Service Team Member 
			    	{
			    		adviceRecommendation.setPartyId(bu_partyId);
			    	}
			    	else 
			    	{
			    		adviceRecommendation.setPartyId(partyId);
			    	} 
					
					//adviceRecommendation.setPartyId(partyId);
					//System.out.println("userSession.getBuId()...."+userSession.getBuId());
					adviceRecommendation.setBuPartyId(buPartyId);
					
					adviceRecommendation.setRiskProfileId(Integer.parseInt(riskProfileId));
					adviceRecommendation.setGoalYearRangeId(Integer.parseInt(goalYearRangeId));
					adviceRecommendation.setAssetClassId(Integer.parseInt(subArray[0]));
					adviceRecommendation.setAllocationPercentAssetClass(Double.parseDouble(subArray[1]));
					adviceRecommendation.setProductTypeId(Integer.parseInt(subArray[2]));
					adviceRecommendation.setCategoryId(Integer.parseInt(subArray[3]));
					
					/*productName=request.getParameter("productSearch_"+i);
					productPercentage=request.getParameter("productPercent_"+i);*/
					adviceRecommendation.setProductName(subArray[4]);
					adviceRecommendation.setAllocationPercentProductId(Double.parseDouble(subArray[5]));
					
					adviceRecommendationsList.add(adviceRecommendation);
				}  
				 
				/*for(int i=1;i<=productCount;i++){
					
					if(null!=request.getParameter("assetClassId_"+i)){
						assetClassId=request.getParameter("assetClassId_"+i);
						assetPercentage=request.getParameter("assetClassPercentage_"+i);
					}
					
					if(null!=request.getParameter("productTypeId_"+i)){
						productTypeId=request.getParameter("productTypeId_"+i);
					}
					
					if(null!=request.getParameter("categoryId_"+i)){
						categoryId=request.getParameter("categoryId_"+i);
					}
					
					if((null!=request.getParameter("productSearch_"+i)) && !(request.getParameter("productSearch_"+i).isEmpty())){
						adviceRecommendation=new AdviceRecommendation();				
						
						adviceRecommendation.setPartyId(partyId);
						adviceRecommendation.setBuPartyId(buPartyId);
						
						adviceRecommendation.setRiskProfileId(Integer.parseInt(riskProfileId));
						adviceRecommendation.setGoalYearRangeId(Integer.parseInt(goalYearRangeId));
						adviceRecommendation.setAssetClassId(Integer.parseInt(assetClassId));
						adviceRecommendation.setAllocationPercentAssetClass(Double.parseDouble(assetPercentage));
						adviceRecommendation.setProductTypeId(Integer.parseInt(productTypeId));
						adviceRecommendation.setCategoryId(Integer.parseInt(categoryId));
						
						productName=request.getParameter("productSearch_"+i);
						productPercentage=request.getParameter("productPercent_"+i);
						adviceRecommendation.setProductName(productName);
						adviceRecommendation.setAllocationPercentProductId(Double.parseDouble(productPercentage));
						
						adviceRecommendationsList.add(adviceRecommendation);
					}else{
						
					}
					
					
				}*/
				
				BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
				
				// post the object to service
				baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), adviceRecommendationsList, BaseResponse.class);
				
				if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
					redirectAttributes.addFlashAttribute("success", "success.goalPlanning.dataSave");
				}else{
					redirectAttributes.addFlashAttribute("error", "error.goalPlanning.dataSave");
				}
				
			}else{
				redirectAttributes.addFlashAttribute("error", "error.goalPlanning.dataSave");
			}
		}catch(Exception ex){
			LogFactory.getLog(getClass()).error("Exception Recommendation Controller---", ex);
			redirectAttributes.addFlashAttribute("error", "error.goalPlanning.dataSave");
		}		
		
		return "redirect:/partner/editGoalBucketAllocation/"+goalYearRangeId+"/"+riskProfileId;
	}
	
	@RequestMapping(value = "/getGoalPlanProductList", method = RequestMethod.GET)		
	public synchronized @ResponseBody List<JsonData> getGoalPlanProductList(HttpServletRequest request){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		
		if(null!=request.getParameter("productData") && !request.getParameter("productData").isEmpty()){
			String productData=request.getParameter("productData");
			String categoryId=request.getParameter("categoryId");
			String assetClassId=request.getParameter("assetClassId");
			String productTypeId=request.getParameter("productTypeId");
			String userName=userSession.getUserName();
			return dropDownService.getProductNamesList(request, productData, assetClassId, productTypeId, categoryId,userName);		
		}else{
			return null;
		}

	}
	
	@RequestMapping(value="/setDefaultGoalBucket", method = RequestMethod.POST)
	public String setDefaultGoalBucket(HttpServletRequest request,
			final RedirectAttributes redirectAttributes){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:login";
		}
		String token="12345";
		Integer buId = 153;
		UriComponentsBuilder uriCB;
		String username=userSession.getUserName();
		Integer partyId=userSession.getPartyId();
		
		String riskProfileId=request.getParameter("riskProfileId");
		String goalYearRangeId=request.getParameter("goalYearRangeId");
		
		uriCB = UriComponentsBuilder.fromHttpUrl(set_default_GoalPlanBucket_Allocation+ "/" + partyId + "/" + riskProfileId + "/" + goalYearRangeId + "/" + username +"/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		String result="failure";
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			redirectAttributes.addFlashAttribute("success", "success.goalPlanning.setDefault");
		}else{
			redirectAttributes.addFlashAttribute("error", "error.goalPlanning.setDefault");
		}
		
		return "redirect:/partner/editGoalBucketAllocation/"+goalYearRangeId+"/"+riskProfileId;
	}
	
	@RequestMapping(value="/setDefaultRiskCover/{sectionTypeId}/{productTypeIds}/{categoryId}",method=RequestMethod.GET)
	public String setDefaultRiskCover(HttpServletRequest request,
			@PathVariable(value="sectionTypeId") String sectionTypeId,@PathVariable(value="productTypeIds") String productTypeIds,
			@PathVariable(value="categoryId") String categoryId,
			final RedirectAttributes redirectAttributes){
		//
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:login";
		}
		String token="12345";
		Integer buId = 153;
		UriComponentsBuilder uriCB;
		String username=userSession.getUserName();
		Integer partyId=userSession.getPartyId();		
		String productTypeId[]=productTypeIds.split(",");
		
		if(categoryId.equals("null")){
			categoryId="0";
		}
		
		uriCB = UriComponentsBuilder.fromHttpUrl(risk_cover_set_default+ "/" + partyId + "/"+ sectionTypeId +"/" + productTypeId[0] + "/" + categoryId + "/" + username +"/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		String result="failure";
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			if(productTypeId[0].equals(new Integer("47006"))){
				redirectAttributes.addFlashAttribute("success", "success.riskCoverLife.setDefault");
			}else{
				if(categoryId.equals(new Integer("48026"))){
					redirectAttributes.addFlashAttribute("success", "success.riskCoverHealth.setDefault");
				}else if(categoryId.equals(new Integer("48027"))){
					redirectAttributes.addFlashAttribute("success", "success.riskCoverCritical.setDefault");
				}else if(categoryId.equals(new Integer("48025"))){
					redirectAttributes.addFlashAttribute("success", "success.riskCoverAccidental.setDefault");
				}else if(categoryId.equals(new Integer("48024"))){
					redirectAttributes.addFlashAttribute("success", "success.riskCoverProperty.setDefault");
				}
			}  
		}else{
			if(productTypeId[0].equals(new Integer("47006"))){
				redirectAttributes.addFlashAttribute("success", "error.riskCoverLife.setDefault");
			}else{
				if(categoryId.equals(new Integer("48026"))){
					redirectAttributes.addFlashAttribute("success", "error.riskCoverHealth.setDefault");
				}else if(categoryId.equals(new Integer("48027"))){
					redirectAttributes.addFlashAttribute("success", "error.riskCoverCritical.setDefault");
				}else if(categoryId.equals(new Integer("48025"))){
					redirectAttributes.addFlashAttribute("success", "error.riskCoverAccidental.setDefault");
				}else if(categoryId.equals(new Integer("48024"))){
					redirectAttributes.addFlashAttribute("success", "error.riskCoverProperty.setDefault");
				}
			}
		}
		return "redirect:/partner/recommendation/riskCover?productTypeId="+productTypeId[0]+"&categoryId="+categoryId;
	}
	
	/*@RequestMapping(value = "/getComapnyNames", method = RequestMethod.GET)
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
	}*/ 
	
	/*@RequestMapping(value = "/getProductNames", method = RequestMethod.GET)
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
	}*/
	
	
	
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
