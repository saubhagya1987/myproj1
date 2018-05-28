package in.fiinfra.partner.controller;

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.ChartData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.InsuranceData;
import in.fiinfra.common.common.PartnerProfile;
import in.fiinfra.common.common.PartyAttributeData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.controller.AbstractController;
import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.Address;
import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.AdviserGoalChart;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.DcAnalysisHelper;
import in.fiinfra.common.diy.models.DcInputData;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.AutoPlanData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.DateUtil;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.MD5Encryption;
import in.fiinfra.common.util.PartyDateComparator;
import in.fiinfra.common.util.PartyNameComparator;
import in.fiinfra.common.util.RandomPasswordGenerator;
import in.fiinfra.common.utility.CurrentFinancialStatusData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.Assumption;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.ExpenseData;
import in.fiinfra.cp.IncomeData;
import in.fiinfra.cp.LoanData;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.partner.models.FpHolder;
import in.fiinfra.partner.models.ProductOffering;
import in.fiinfra.partner.models.Theme;
import in.fiinfra.partner.service.PartnerService;
import in.fiinfra.query.model.GetRequest;
import in.fiinfra.query.model.ProfileRequest;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import org.apache.commons.lang.StringUtils;
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
import org.springframework.util.CollectionUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;
//import in.fiinfra.forgotpassword.models.TaskListResponse;

@Controller
@RequestMapping("/incomeExpense")
public class IncomeExpenseController extends AbstractController {
	
	@Value("${GET_INCOME_LIST_DETAILS}")
	private String GET_INCOME_LIST_DETAILS;
	
	@Value("${DELETE_INCOME}")
	private String DELETE_INCOME; 
	
	@Value("${SAVE_INCOME}")
	private String SAVE_INCOME;
		
	@Value("${GET_EXPENSE_LIST_DETAILS}")
	private String GET_EXPENSE_LIST_DETAILS;
	
	@Value("${DELETE_EXPENSE}")
	private String DELETE_EXPENSE; 
	
	@Value("${SAVE_EXPENSE}")
	private String SAVE_EXPENSE; 
	
	@Value("${GET_ASSUMPTION_FOR_EXPENSE}")
	private String GET_ASSUMPTION_FOR_EXPENSE;
	
	@Value("${GET_LOANS_LIST_DETAILS}")
	private String GET_LOANS_LIST_DETAILS;
	
	@Value("${DELETE_LOAN}")
	private String DELETE_LOAN;
	
	@Value("${SAVE_LOAN}")
	private String SAVE_LOAN;
	
	@Value("${FETCH_DC_INPUTDATA}")
	private String FETCH_DC_INPUTDATA;
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	
	private static final Logger LOGGER = Logger.getLogger(PartnerProfileController.class);
	
	@RequestMapping(value = "/showIncome/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String showIncome(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes,@PathVariable String partyId) 
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
		String url = GET_INCOME_LIST_DETAILS + userName +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId(); 
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<IncomeData> br = new BaseResponse<IncomeData>();
		
		
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		List<IncomeData> incomeListAsJson = new ArrayList<IncomeData> ();
		List<IncomeData> incomeList = new ArrayList<IncomeData> ();
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			incomeListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
		}
		
		else {
			return "partner/datacollection/cash-flow/"+partyId;
		}
		
		int size = incomeListAsJson.size();
		long dcIncome = 0;
		for(int i = 0; i<size; i++){
			//get the actual party object from its LinkedHashMap representation
			IncomeData incomeData = objectMapper.readValue(objectMapper.writeValueAsString(incomeListAsJson.get(i)), IncomeData.class);
			incomeList.add(incomeData);
			if(incomeData.getIncomeFrequencyId() == 63003)				
				dcIncome = dcIncome + incomeData.getIncomeAmount()*12;
			else 
				dcIncome = dcIncome + incomeData.getIncomeAmount();
		}
		model.addAttribute("incomeDataList", incomeList);
		model.addAttribute("partyId", partyId);
		model.addAttribute("incomeListSize", incomeList.size());
		model.addAttribute("dcIncome", dcIncome);
		
		String questionBankId = "29";
		String sectionTypeId = "39002";
		List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
		for(int i=0;i<questionDetails.size();i++)
		{
			QuestionDetails details = questionDetails.get(i);
			
			if(details.getQuestionId().equals("94067"))
			{
				model.addAttribute("IncomeAmount",details.getAttributeRefferenceValue());
			}
			
		}
		
		
		return "incomeExpense/income";
		}
		catch(Exception e) {
			return "redirect:/partner/datacollection/cash-flow/"+partyId;
		}
		
	}
	
	@RequestMapping(value = "/showExpense/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String showExpence(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes, @PathVariable String partyId) 
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
			String url = GET_EXPENSE_LIST_DETAILS + userName +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId(); 
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<IncomeData> br = new BaseResponse<IncomeData>();
			
			
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			
			List<ExpenseData> expenseListAsJson = new ArrayList<ExpenseData> ();
			List<ExpenseData> expenseList = new ArrayList<ExpenseData> ();
			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				expenseListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
			}
			
			else {
				return "partner/datacollection/cash-flow/"+partyId;
			}
			long dcExpense = 0;
			int size = expenseListAsJson.size();
			for(int i = 0; i<size; i++){
				//get the actual party object from its LinkedHashMap representation
				ExpenseData incomeData = objectMapper.readValue(objectMapper.writeValueAsString(expenseListAsJson.get(i)), ExpenseData.class);
				expenseList.add(incomeData);
				if(incomeData.getExpenseFrequencyID() == 63006) 
					dcExpense = dcExpense + incomeData.getExpenseAmount()/12;
				else
					dcExpense = dcExpense + incomeData.getExpenseAmount();
			}
			model.addAttribute("expenseDataList", expenseList);
			model.addAttribute("partyId", partyId);
			model.addAttribute("expenseListSize", expenseList.size());
			model.addAttribute("dcExpense", dcExpense);
			
			
			
			BaseResponse<Assumption> br2 = new BaseResponse<Assumption>();
			String url2 = GET_ASSUMPTION_FOR_EXPENSE + userName +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId() +"&assumptionId=98047"; 
			UriComponentsBuilder uriCB2 = UriComponentsBuilder.fromHttpUrl(url2);
			br2 = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB2), BaseResponse.class).getBody();
			Assumption inflation = new Assumption();
			if (br2.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				inflation = objectMapper.readValue(objectMapper.writeValueAsString(br2.getResponseObject()), Assumption.class);
				
			}
			
			if (inflation == null) {
				inflation = new Assumption();
				inflation.setValue("7");
			}
			if (StringUtils.isEmpty(inflation.getStartRange())) {
				inflation.setStartRange("-10");
			}
			if (StringUtils.isEmpty(inflation.getEndRange())) {
				inflation.setEndRange("10");
			}
			
			model.addAttribute("inflationRate", inflation.getValue());
			model.addAttribute("inflationStartRange", inflation.getStartRange());
			model.addAttribute("inflationEndRange", inflation.getEndRange());
			
			String questionBankId = "29";
			String sectionTypeId = "39002";
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
			for(int i=0;i<questionDetails.size();i++)
			{
				QuestionDetails details = questionDetails.get(i);
				
				if(details.getQuestionId().equals("94074"))
				{
					model.addAttribute("ExpenceAmount",details.getAttributeRefferenceValue());
				}
				
			}
			
			return "incomeExpense/expense";

			}
			catch(Exception e) {
				return "redirect:/partner/datacollection/cash-flow/"+partyId;
			}
			
		
			}
	
	@RequestMapping(value = "/addIncome", method = {RequestMethod.GET,RequestMethod.POST})
	public String addIncome(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes) 
	{
		String partyId = null;
		try {
			String userName = null;
			UserSession userSession = null;
			partyId = request.getParameter("partyId");
			if(request !=null)
			{
				userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					userName = "ramu";//
				}
				userName = userSession.getUserName();
			}
			
			String resultData = request.getParameter("resultData");
			String incomeDetails[] = resultData.split(",");
			IncomeData incomeData = new IncomeData();
			incomeData.setPartyId(Integer.parseInt(partyId));
			incomeData.setPartyIncomeId(Integer.parseInt(incomeDetails[0]));
			incomeData.setIncomeTypeId(Integer.parseInt(incomeDetails[2]));
			incomeData.setIncomeName(incomeDetails[3]);
			incomeData.setIncomeAmount(Long.parseLong(incomeDetails[4]));
			incomeData.setIncomeFrequencyId(Integer.parseInt(incomeDetails[5]));
			incomeData.setAnnualIncomeAmount(Long.parseLong(incomeDetails[6]));
			incomeData.setAnnualGrowth(Double.parseDouble(incomeDetails[7]));
			incomeData.setCurrencyDenominationId(Integer.parseInt(incomeDetails[8]));
			incomeData.setLastModifiedBy(userSession.getUserId());
			incomeData.setCreatedBy(userSession.getUserId());
			String token = "1234";
			String url = SAVE_INCOME + userName +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId(); 
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<Integer> br = new BaseResponse<Integer>();						
			br = restTemplate.postForObject(url, incomeData, BaseResponse.class);
			Integer result = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				result = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), Integer.class);
				redirectAttributes.addFlashAttribute("success", "Record saved successfully.");
				return "redirect:/incomeExpense/showIncome/"+partyId;
			}
			
			else {
				redirectAttributes.addFlashAttribute("error", "Error while saving record.");
				return "redirect:/incomeExpense/showIncome/"+partyId;
			}			
		}
		catch(Exception e){
			redirectAttributes.addFlashAttribute("error", "Errro while saving record.");
			return "redirect:/incomeExpense/showIncome/"+partyId;
		}
				

	}
	
	@RequestMapping(value = "/addExpense", method = {RequestMethod.GET,RequestMethod.POST})
	public String addExpence(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes) 
	{
		String partyId = null;
		try {
			String userName = null;
			UserSession userSession = null;
			partyId = request.getParameter("partyId");
			if(request !=null)
			{
				userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					userName = "ramu";//
				}
				userName = userSession.getUserName();
			}
			
			String resultData = request.getParameter("resultData");
			String expenseDetails[] = resultData.split(",");
			ExpenseData expenseData = new ExpenseData();
			expenseData.setPartyID(Integer.parseInt(partyId));
			expenseData.setPartyExpenseID(Integer.parseInt(expenseDetails[0]));
			expenseData.setExpenseTypeID(Integer.parseInt(expenseDetails[2]));
			expenseData.setExpenseName(expenseDetails[3]);
			expenseData.setExpenseAmount(Long.parseLong(expenseDetails[4]));
			expenseData.setExpenseFrequencyID(Integer.parseInt(expenseDetails[5]));
			expenseData.setAnnualExpenseAmount(Long.parseLong(expenseDetails[6]));
			expenseData.setCurrencyDenominationId(Integer.parseInt(expenseDetails[7]));
			expenseData.setLastModifiedBy(userSession.getUserId());
			expenseData.setCreatedBy(userSession.getUserId());
			String token = "1234";
			String url = SAVE_EXPENSE + userName +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId(); 
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<Integer> br = new BaseResponse<Integer>();						
			br = restTemplate.postForObject(url, expenseData, BaseResponse.class);
			Integer result = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				result = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), Integer.class);
				redirectAttributes.addFlashAttribute("success", "Record saved successfully.");
				return "redirect:/incomeExpense/showExpense/"+partyId;
			}
			
			else {
				redirectAttributes.addFlashAttribute("error", "Errro while saving record.");
				return "redirect:/incomeExpense/showExpense/"+partyId;
			}			
		}
		catch(Exception e){
			redirectAttributes.addFlashAttribute("error", "Errro while saving record.");
			return "redirect:/incomeExpense/showExpense/"+partyId;
		}
				

	}
	
	@RequestMapping(value = "/deleteIncome", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteIncome(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes) 
	{
		String partyId = null;
		try {
			String userName = null;
			UserSession userSession = null;
			partyId = request.getParameter("partyId");
			if(request !=null)
			{
				userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					userName = "ramu";//
				}
				userName = userSession.getUserName();
			}
			int incomeId = Integer.parseInt(request.getParameter("incomeId"));
			String token = "1234";
			String url = DELETE_INCOME + userName +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId()+"&incomeId="+incomeId; 
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<String> br = new BaseResponse<String>();
			
			
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			String result = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				result = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), String.class);
				redirectAttributes.addFlashAttribute("success", "Record deleted successfully.");
				return "redirect:/incomeExpense/showIncome/"+partyId;
			}
			
			else {
				redirectAttributes.addFlashAttribute("error", "Errro while deleting record.");
				return "redirect:/incomeExpense/showIncome/"+partyId;
			}			
		}
		catch(Exception e){
			redirectAttributes.addFlashAttribute("error", "Errro while deleting record.");
			return "redirect:/incomeExpense/showIncome/"+partyId;
		}
				
	}
	
	@RequestMapping(value = "/deleteExpense", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteExpence(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes) 
	{

		String partyId = null;
		try {
			String userName = null;
			UserSession userSession = null;
			partyId = request.getParameter("partyId");
			if(request !=null)
			{
				userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					userName = "ramu";//
				}
				userName = userSession.getUserName();
			}
			int expenseId = Integer.parseInt(request.getParameter("expenseId"));
			String token = "1234";
			String url = DELETE_EXPENSE + userName +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId()+"&expenseId="+expenseId; 
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<String> br = new BaseResponse<String>();
			
			
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			String result = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				result = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), String.class);
				redirectAttributes.addFlashAttribute("success", "Record deleted successfully.");
				return "redirect:/incomeExpense/showExpense/"+partyId;
			}
			
			else {
				redirectAttributes.addFlashAttribute("error", "Errro while deleting record.");
				return "redirect:/incomeExpense/showExpense/"+partyId;
			}			
		}
		catch(Exception e){
			redirectAttributes.addFlashAttribute("error", "Errro while deleting record.");
			return "redirect:/incomeExpense/showExpense/"+partyId;
		}
	}
	
	@RequestMapping(value = "/showLoan/{partyId}", method = {RequestMethod.GET,RequestMethod.POST})
	public String showLoan(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes,@PathVariable String partyId) 
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
			String url = GET_LOANS_LIST_DETAILS + userName +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId(); 
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<LoanData> br = new BaseResponse<LoanData>();
			
			
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			
			List<LoanData> loanListAsJson = new ArrayList<LoanData> ();
			List<LoanData> loanList = new ArrayList<LoanData> ();
			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				loanListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
			}
			
			else {
				return "partner/datacollection/cash-flow/"+partyId;
			}
			
			int size = loanListAsJson.size();
			long dcEmi = 0;
			for(int i = 0; i<size; i++){
				//get the actual party object from its LinkedHashMap representation
				LoanData loanData = objectMapper.readValue(objectMapper.writeValueAsString(loanListAsJson.get(i)), LoanData.class);
				loanList.add(loanData);
					dcEmi = dcEmi + loanData.getLoanAmount();
			}
			model.addAttribute("loanDataList", loanList);
			model.addAttribute("partyId", partyId);
			model.addAttribute("loanListSize", loanList.size());
			model.addAttribute("dcEmi", dcEmi);
			
			String questionBankId = "29";
			String sectionTypeId = "39002";
			List<QuestionDetails> questionDetails = getDcInputData(userSession.getUserId().toString(), partyId, userSession.getBuId().toString(), sectionTypeId, questionBankId);
			for(int i=0;i<questionDetails.size();i++)
			{
				QuestionDetails details = questionDetails.get(i);
				
				if(details.getQuestionId().equals("94080"))
				{
					model.addAttribute("LoanAmount",details.getAttributeRefferenceValue());
				}
				
			}
			
			return "incomeExpense/loans";
			}
			catch(Exception e) {
				return "redirect:/partner/datacollection/cash-flow/"+partyId;
			}
			
	}
	
	@RequestMapping(value = "/saveLoan/{partyId}", method=RequestMethod.GET)
	 public String saveLoan(@ModelAttribute("loanData") LoanData loanData, Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes,@PathVariable("partyId") Integer partyId) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException 
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
		    if(loanData.getPartyLoanId() == 0) {
		    	loanData.setCreatedBy(userSession.getUserId());
		    }
		    loanData.setLastModifiedBy(userSession.getUserId());
			String token = "1234";
			String url = SAVE_LOAN + userName +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId(); 
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<Integer> br = new BaseResponse<Integer>();						
			br = restTemplate.postForObject(url, loanData, BaseResponse.class);
			Integer result = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				result = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), Integer.class);
				redirectAttributes.addFlashAttribute("success", "Record saved successfully.");
				return "redirect:/incomeExpense/showLoan/"+partyId;
			}
			
			else {
				redirectAttributes.addFlashAttribute("error", "Errro while saving record.");
				return "redirect:/incomeExpense/showLoan/"+partyId;
			}			
		}
		catch(Exception e){
			redirectAttributes.addFlashAttribute("error", "Errro while saving record.");
			return "redirect:/incomeExpense/showLoan/"+partyId;
		}

	 }
	
	@RequestMapping(value = "/deleteLoan", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteLoan(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes) 
	{

		String partyId = null;
		try {
			String userName = null;
			UserSession userSession = null;
			partyId = request.getParameter("partyId");
			if(request !=null)
			{
				userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					userName = "ramu";//
				}
				userName = userSession.getUserName();
			}
			int loanId = Integer.parseInt(request.getParameter("loanId"));
			String token = "1234";
			String url = DELETE_LOAN + userName +"/"+token+"?partyId="+partyId +"&buId="+userSession.getBuId()+"&loanId="+loanId; 
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<String> br = new BaseResponse<String>();
			
			
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			String result = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				result = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), String.class);
				redirectAttributes.addFlashAttribute("success", "Record deleted successfully.");
				return "redirect:/incomeExpense/showLoan/"+partyId;
			}
			
			else {
				redirectAttributes.addFlashAttribute("error", "Errro while deleting record.");
				return "redirect:/incomeExpense/showLoan/"+partyId;
			}			
		}
		catch(Exception e){
			redirectAttributes.addFlashAttribute("error", "Errro while deleting record.");
			return "redirect:/incomeExpense/showLoan/"+partyId;
		}
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
 