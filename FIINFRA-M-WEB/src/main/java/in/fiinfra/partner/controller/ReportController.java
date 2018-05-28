package in.fiinfra.partner.controller;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.AssetSummary;
import in.fiinfra.common.diy.models.ClientActionPlan;
import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.GoalwiseProductMap;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductwiseGoalMap;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.RiskPlanningMap;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.framework.models.Notification;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.QueryParam;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.PrettyXmlSerializer;
import org.htmlcleaner.TagNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.pdfcrowd.Client;
import com.pdfcrowd.PdfcrowdError;

@Controller
@RequestMapping("/partner/report")
public class ReportController {
	
	private static final Logger LOGGER = Logger.getLogger(ReportController.class);
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private CommonController commonController;
	
	@Value("${UPDATE_FPACTIVITY_TRACKER}") 
	private String UPDATE_FPACTIVITY_TRACKER;
	
	@Value("${GET_PARTY_URL}")
	private String GET_PARTY;
	
	@Value("${GET_DOCUMENT_RECORD_URL}")
	private String GET_DOCUMENT_RECORD;
	
	@Value("${GET_ANALYSIS_DATA}")
	private String GET_ANALYSIS_DATA;
	
	@Value("${GET_GOALS_FOR_PARTY}")
	private String GET_GOALS_FOR_PARTY;
	
	@Value("${GET_PLANNING_FOR_PARTY_ID}")
    private String GET_PLANNING_FOR_PARTY_ID;
	
	@Value("${SAVE_DOCUMENT_URL}")
    private String SAVE_DOCUMENT;
    
	@Value("${GET_NUMBER_OF_GOALS_FOR_PARTYID}")
	private String GET_NUMBER_OF_GOALS_FOR_PARTYID;
	
	@Value("${GET_ANALYSISREPORT_FOR_PARTY_ID_URL}")
	private String GET_ANALYSISREPORT_FOR_PARTY_ID;
	
	@Value("${GET_GOAL_DETAILS_URL}")
	private String GET_GOAL_DETAILS;
	
	@Value("${GET_RECOMMENDATION_ASSET_URL}")
	private String GET_RECOMMENDATION_ASSET;
	
	@Value("${GET_INTERESTED_FP_SECTION}")
	private String GET_INTERESTED_FP_SECTION;
	
	@Value("${URL_GET_LI_ALL_METHOD}")
	private String URL_GET_LI_ALL_METHOD;
	
	@Value("${URL_SAVE_LI_METHOD}")
	private String URL_SAVE_LI_METHOD;
	
	@Value("${SAVE_ASSET_ALLOCATION_FOR_RETIREMENT}") 
	private String SAVE_ASSET_ALLOCATION_FOR_RETIREMENT;
	
	@Value("${SAVE_ANALYSIS_REPORTS_FOR_BATCH}")
	private String SAVE_ANALYSIS_REPORTS_FOR_BATCH;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@RequestMapping(value = "/generate-report/{partyId}", method = RequestMethod.GET)
	public String getGenerateReport(Model model, HttpServletRequest request,
			@PathVariable String partyId, final RedirectAttributes redirectAttributes) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		//to set current stage id to DCT Submitted

		String token="12345";
		int buId=userSession.getBuId();
		
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append(GET_NUMBER_OF_GOALS_FOR_PARTYID);
		strBuilder.append(partyId);
		strBuilder.append("/");
		strBuilder.append(userSession.getUserName());
		strBuilder.append("/");
		strBuilder.append(token);
		String msg = "";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(strBuilder.toString());
		uriCB.queryParam("buId", userSession.getBuId());
		BaseResponse<String> baseResponse = new BaseResponse<String>();
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				
		String noOfGoals[]={"0","0"};
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			 noOfGoals = baseResponse.getResponseObject().split("_");
		}
		
		Integer flag = 0;
		if((noOfGoals[1]).equals("0") || (noOfGoals[2]).equals("0") || (noOfGoals[3]).equals("0") || (noOfGoals[5]).equals("0") || (noOfGoals[6]).equals("0") || ((noOfGoals[7]).equals("1") && (noOfGoals[4]).equals("0")) ) {
			
			msg = "Please Fill Your ";
			if((noOfGoals[1]).equals("0")){
				flag = 1;
				msg = msg + "Retirement Age(Retirement Readiness) ";
			}
			if((noOfGoals[2]).equals("0")){
				if( flag == 1 ){
					msg = msg + ", Annual Income(Cashflow) ";
				}else{
					flag = 1;
					msg = msg + "Annual Income(Cashflow) ";
				}
			}
			if((noOfGoals[3]).equals("0")){
				if( flag == 1 ){
					msg = msg + ", Monthly Expenditure(Cashflow) ";
				}else{
					flag = 1;
					msg = msg + "Monthly Expenditure(Cashflow) ";
				}
			}
			if((noOfGoals[5]).equals("0")){
				if( flag == 1 ){
					msg = msg + ", Risk Profile(Risk Profile) ";
				}else{
					flag = 1;
					msg = msg + "Risk Profile(Risk Profile) ";
				}
			}
			if((noOfGoals[6]).equals("0")){
				if( flag == 1 ){
					msg = msg + ", Date Of Birth(Personal Information)";
				}else{
					flag = 1;
					msg = msg + "Date Of Birth(Personal Information)";
				}
			}
			if((noOfGoals[7]).equals("1")){
				if((noOfGoals[4]).equals("0")){
					if( flag == 1 ){
						msg = msg + ", Number Of Months(Emergency Planning)";
					}else{
						flag = 1;
						msg = msg + "Number Of Months(Emergency Planning)";
					}
				}
			}
			msg = msg + ".";
			
			redirectAttributes.addFlashAttribute("error", msg);
			/*model.addAttribute("error", msg);
			model.addAttribute("partyId", partyId);
			model.addAttribute("numberOfGoals", noOfGoals[0]);
			request.getSession().setAttribute("headerName", request.getSession().getAttribute("headerName"));*/
			return "redirect:/partner/datacollection/"+partyId+"/"+request.getSession().getAttribute("headerName")+"/"+"2";
		}
		else {
			UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7002/"+partyId+"/342");
			uri.queryParam("buId", userSession.getBuId());
			BaseResponse<Boolean> br = new BaseResponse<Boolean>();
			br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
			uri = UriComponentsBuilder.fromHttpUrl(GET_PARTY + "/"+partyId +"/"+ userSession.getUserName() + "/"+token+"?buId="+buId);
			BaseResponse<Party> brp = new BaseResponse<Party>();
			
			//call service for all parties associated 
			brp = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uri), BaseResponse.class).getBody();
			
			Party party = new Party();
			
			if (brp.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				try {
					party = objectMapper.readValue(objectMapper.writeValueAsString(brp.getResponseObject()), Party.class);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			String baseUrl="";
			if ( ( request.getServerPort() == 80 ) ||
			         ( request.getServerPort() == 443 ) ){
				baseUrl = request.getScheme() + "://" + request.getServerName() ;				
			}
			else{
				baseUrl = request.getScheme() + "://" +
				        request.getServerName() + ":" + request.getServerPort();				
			}
			
			String userAgent=request.getHeader("user-agent");
			if(userAgent.contains("Mobi") || userAgent.contains("Android")){
				 model.addAttribute("isMobile","true");
			}
			if(userAgent.contains("Mac OS")){
			    model.addAttribute("isIpad", "true");
			}
			
			Integer reportId = 303;
			String reportLink = "";
			//reportLink = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(), userSession.getUserName(), userSession.getBuId(), reportId);
			
			model.addAttribute("roleBaseLinks",reportLink);
			model.addAttribute("baseUrl",baseUrl);
			model.addAttribute("partyId", partyId);
			model.addAttribute("partnerPartyId",userSession.getPartyId());
			model.addAttribute("userName",userSession.getUserName());
			model.addAttribute("buId",userSession.getBuId());
			model.addAttribute("advisorName",userSession.getName());
			model.addAttribute("party",party);
			
			UriComponentsBuilder uriRetirement = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_FOR_RETIREMENT + "/" + partyId +"/" + userSession.getUserId() + "/"+userSession.getUserName()+"/" + token);
			uriRetirement.queryParam("buId", userSession.getBuId());
			BaseResponse<Boolean> retirementBr = new BaseResponse<Boolean>();
	        retirementBr = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriRetirement), BaseResponse.class).getBody();
			
			List<String> resultList = new ArrayList<String>();
			try {
				resultList = getLifeInsuranceForAllMethods(request,Integer.parseInt(partyId));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("resultList",resultList);
			
			return "partner/report/generate-report";
		}
	}
	
	@RequestMapping(value = "/generate-report-analysis/{partyId}/{partnerPartyId}/{userName}/{buId}/{reportFor}", method = RequestMethod.POST)
	public @ResponseBody String generateReportForAnalysisA(Model model, HttpServletRequest request,
			@PathVariable String partyId, @PathVariable String partnerPartyId, @PathVariable String userName, @PathVariable String buId, @PathVariable String reportFor) {
		try {
			
			//to set current stage id to DCT Submitted		
			String pdfFilePathA = "";
			Document documentA = new Document();
			documentA.setDocumentType(10001);
			if(reportFor.equals("A")){
				pdfFilePathA = "D://AnalysisReports/" + partyId + "_Analysis_A.pdf";
				documentA.setDocumentName(partyId + "_Analysis_A.pdf");
				documentA.setFileName(partyId + "_Analysis_A.pdf");
				documentA.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "_Analysis_A.pdf");
				documentA.setFlag("ReportA");
			}else if(reportFor.equals("B")){
				pdfFilePathA = "D://AnalysisReports/" + partyId + "_Analysis_B.pdf";
				documentA.setDocumentName(partyId + "_Analysis_B.pdf");
				documentA.setFileName(partyId + "_Analysis_B.pdf");
				documentA.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "_Analysis_B.pdf");
				documentA.setFlag("ReportB");
			}else{
				pdfFilePathA = "D://AnalysisReports/" + partyId + "_Analysis_C.pdf";
				documentA.setDocumentName(partyId + "_Analysis_C.pdf");
				documentA.setFileName(partyId + "_Analysis_C.pdf");
				documentA.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "_Analysis_C.pdf");
				documentA.setFlag("ReportC");
			}
			documentA.setDocumentStorageLocation(82001);
			documentA.setFileTypeId(11004);
			documentA.setPartyId(Integer.parseInt(partyId));
			//for server only will not work in local
			String baseUrl="";
			if ( ( request.getServerPort() == 80 ) ||
			         ( request.getServerPort() == 443 ) ){
				baseUrl = request.getScheme() + "://" + request.getServerName() ;				
			}
			else{
				baseUrl = request.getScheme() + "://" +
				        request.getServerName() + ":" + request.getServerPort();				
			}
			
			String reportFilePathA = baseUrl+"/FIINFRA-M-WEB/partner/report/view-report-analysis/"+ partnerPartyId + "/" + partyId + "/"+ reportFor +"/" + userName + "/" + buId + "?TOKEN=abc&USER_NAME=Baba";
			//for local only			
			//String reportFilePathA = "http://202.87.46.144:8081/FIINFRA-M-WEB/partner/report/view-report-analysis/"+ partnerPartyId +"/" + partyId + "/"+ reportFor +"/" + userName + "/" + buId + "?TOKEN=abc&USER_NAME=Baba";
			convertToPDF(reportFilePathA, pdfFilePathA);
						
			//save document
			List<Document> documentList = new ArrayList<Document>();
			documentList.add(documentA);
			String token = "42534";
			UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(SAVE_DOCUMENT + "/" + userName + "/" + token);
			uri.queryParam("buId", buId);
			 BaseResponse<Boolean> baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uri), documentList, BaseResponse.class);
			 
			 uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7003/"+partyId+"/342");
				uri.queryParam("buId", buId);
				 baseResponse = new BaseResponse<Boolean>();
				baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
			return "Success";
			
			

		} catch (Exception e) {
			LOGGER.error("Error Generating Report : ", e);
			return "Failuer";
		}		
	}
	
	@RequestMapping(value = "/generate-analysis-c-report/{dcInputPartyId}", method = RequestMethod.POST)
	public @ResponseBody String generateReportForAnalysisC(Model model, HttpServletRequest request,@PathVariable String dcInputPartyId) {
				
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		
		String pdfFilePath = "D://FFreedom-DI//Attachments//PathFinder//pdf//"+dcInputPartyId;
		String themeName = request.getParameter("themeName");
		String headerName = request.getParameter("headerName");
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		Integer userId = userSession.getUserId();
		Integer partnerPartyId = userSession.getPartyId();
		Integer roleId = userSession.getRoleId();
		
		String baseUrl="";
		if ( ( request.getServerPort() == 80 ) ||
		         ( request.getServerPort() == 443 ) ){
			baseUrl = request.getScheme() + "://" + request.getServerName() ;				
		}
		else{
			baseUrl = request.getScheme() + "://" +
			        request.getServerName() + ":" + request.getServerPort();				
		}
		
		String reportUrl = baseUrl+"/FIINFRA-WEB/dc/showAnalysisReportPDF1.htm?userName="+ userName +"&dcInputPartyId="+ dcInputPartyId +"&buId="+ buId +"&partyId="+ partnerPartyId +"&createdBy="+ userId +"&roleId="+ roleId +"&opportunityName="+ headerName +"&TOKEN=abc&USER_NAME=shubhchintak&theme="+ themeName;
		//for local only			
		//String reportUrl = "http://202.87.46.144:8081/FIINFRA-WEB/dc/showAnalysisReportPDF1.htm?userName="+ userName +"&dcInputPartyId="+ dcInputPartyId +"&buId="+ buId +"&partyId="+ partnerPartyId +"&createdBy="+ userId +"&roleId="+ roleId +"&opportunityName="+ headerName +"&TOKEN=abc&USER_NAME=shubhchintak&theme="+ themeName;
		
		File file = new File(pdfFilePath);
		if (!file.exists()) {
			if (file.mkdir()) {
				LOGGER.debug("Directory is created!");
			} else {
				LOGGER.debug("Failed to create directory!");
			}
		}
				
		pdfFilePath = pdfFilePath + "//"+ dcInputPartyId + ".pdf";
		
		try {
			convertToPDF(reportUrl, pdfFilePath);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "failure";
		}		
		return "Success";
	}
	
	@RequestMapping(value = "/generate-report-analysisClient/{partyId}/{partnerPartyId}/{userName}/{buId}/{reportFor}", method = RequestMethod.POST)
	public @ResponseBody String generateReportForAnalysisClient(Model model, HttpServletRequest request,
			@PathVariable String partyId,@PathVariable String partnerPartyId,@PathVariable String userName, @PathVariable Integer buId,  @PathVariable String reportFor) {
		try {
			/*UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}*/
			//to set current stage id to DCT Submitted		
			//String pdfFilePathA = "D://AnalysisReports/" + partyId + "_Analysis_A.pdf";
			String pdfFilePathB = "";
			String reportFilePathB = "";
			//String reportFilePath = "http://202.87.46.144:8081/FIINFRA-M-WEB/partner/report/generate-report-analysis/" + partyId + "/" + reportFor + "/" + userSession.getUserName() + "/" + userSession.getBuId();
			//for server only will not work in local
			//String partnerPartyId = userSession.getUserId().toString();
			Document documentB = new Document();
			documentB.setDocumentType(10001);			
			documentB.setFileTypeId(11004);
			documentB.setPartyId(Integer.parseInt(partyId));
			documentB.setDocumentStorageLocation(82001);
			if(reportFor.equalsIgnoreCase("client")){
				documentB.setFlag("client");
			}else{
				documentB.setFlag("advisor");
			}
			
			
			String baseUrl="";
			if ( ( request.getServerPort() == 80 ) ||
			         ( request.getServerPort() == 443 ) ){
				baseUrl = request.getScheme() + "://" + request.getServerName() ;				
			}
			else{
				baseUrl = request.getScheme() + "://" +
				        request.getServerName() + ":" + request.getServerPort();				
			}
			if(reportFor.equalsIgnoreCase("client")){
				 pdfFilePathB = "D://AnalysisReports/" + partyId + "__Action_Plan_Client.pdf";
				 reportFilePathB = baseUrl+"/FIINFRA-M-WEB/partner/report/detailedReport/" + partyId + "/" + partnerPartyId + "/" + reportFor + "/" + userName + "/" + buId + "?TOKEN=abc&USER_NAME=Baba";
				 //reportFilePathB = "http://202.87.46.144:8081/FIINFRA-M-WEB/partner/report/detailedReport/" + partyId + "/" + partnerPartyId + "/" + reportFor + "/" + userSession.getUserName() + "/" + userSession.getBuId() + "?TOKEN=abc&USER_NAME=Baba";
				 documentB.setDocumentName(partyId + "_Action_Plan_Client.pdf");
				 documentB.setFileName(partyId + "__Action_Plan_Client.pdf");
				 documentB.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "__Action_Plan_Client.pdf");
				}else{
					 pdfFilePathB = "D://AnalysisReports/" + partyId + "__Action_Plan_Advisor.pdf";
					 reportFilePathB = baseUrl+"/FIINFRA-M-WEB/partner/report/detailedReport/" + partyId + "/" + partnerPartyId + "/" + reportFor + "/" + userName+ "/" + buId + "?TOKEN=abc&USER_NAME=Baba";
					 //reportFilePathB = "http://202.87.46.144:8081/FIINFRA-M-WEB/partner/report/detailedReport/" + partyId + "/" + partnerPartyId + "/" + reportFor + "/" + userSession.getUserName() + "/" + userSession.getBuId() + "?TOKEN=abc&USER_NAME=Baba";
					 documentB.setDocumentName(partyId + "_Action_Plan_Advisor.pdf");
					 documentB.setFileName(partyId + "__Action_Plan_Advisor.pdf");
					 documentB.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "__Action_Plan_Advisor.pdf");
				}
			//String footerPath = baseUrl+"/FIINFRA-M-WEB/resources/pages/report/footer.html";
			//convertToPDFActionPlan(reportFilePathB, pdfFilePathB,footerPath);
			convertToPDF(reportFilePathB, pdfFilePathB);
			
			
			//save document
			List<Document> documentList = new ArrayList<Document>();
			documentList.add(documentB);
			//String userName = userSession.getUserName();
			//Integer buId = userSession.getBuId();
			String token = "42534";
			UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(SAVE_DOCUMENT + "/" + userName + "/" + token);
			uri.queryParam("buId", buId);
			 BaseResponse<Boolean> baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uri), documentList, BaseResponse.class);
			 
			 uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7003/"+partyId+"/342");
				uri.queryParam("buId", buId);
				 baseResponse = new BaseResponse<Boolean>();
				baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
			return "Success";
			
			

		} catch (Exception e) {
			LOGGER.error("Error Generating Report : ", e);
			return "Failuer";
		}		
	}
	
	@RequestMapping(value = "/view-report-analysis/{partnerPartyId}/{partyId}/{reportFor}/{userName}/{buId}", method = RequestMethod.GET)
	public String getReportForAnalysisA(Model model, HttpServletRequest request,
			@PathVariable String reportFor,
			@PathVariable String partnerPartyId,
			@PathVariable String partyId,
			@PathVariable String userName,
			@PathVariable String buId) {
		
		try{
			String token = "42534";
			UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(GET_ANALYSIS_DATA + "/" + partyId + 
					"/" + reportFor + "/" + userName + "/" + token);
			uri.queryParam("buId", buId);
			BaseResponse<AdviserGoals> br = new BaseResponse<AdviserGoals>();
			br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
			AdviserGoals adviserGoals=new AdviserGoals();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{				
				adviserGoals = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), AdviserGoals.class);
				model.addAttribute("adviserGoals", adviserGoals);
				
				uri = UriComponentsBuilder.fromHttpUrl(GET_GOALS_FOR_PARTY + "/" + partyId + "/" + userName + "/" + token);
				uri.queryParam("buId", buId);
				
				BaseResponse<GoalData> brGoals = new BaseResponse<GoalData>();
				brGoals = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
				if (brGoals.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{
					model.addAttribute("goalDetails", brGoals.getResponseListObject());
					
				}
				
			}
			
			Map<String, List<AdviceRecommendation>> riskProfileMap=getRecommendationData(request,adviserGoals.getRiskProfileId(),userName,partnerPartyId,buId);
			String fpSection = getFpSectionForReport(buId, partnerPartyId, partyId, userName);
			model.addAttribute("fpSection",fpSection);
			model.addAttribute("riskProfileMap",riskProfileMap);
			model.addAttribute("theme","94002");
			model.addAttribute("buPartyId", buId);
			
			if(reportFor.equalsIgnoreCase("A")){	
				return "partner/report/generate-report-analysis-a";
			} else if(reportFor.equalsIgnoreCase("B")) {				
				uri = UriComponentsBuilder.fromHttpUrl(GET_PLANNING_FOR_PARTY_ID + "/" + partyId + "/B/" + userName + "/" + token);
				uri.queryParam("buId", buId);
				
				BaseResponse<Suggestion> brGoals = new BaseResponse<Suggestion>();
				brGoals = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
				if (brGoals.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{
					model.addAttribute("suggestionData", brGoals.getResponseObject());
				}
				return "partner/report/generate-report-analysis-b";
			}else if(reportFor.equalsIgnoreCase("C")){
				uri = UriComponentsBuilder.fromHttpUrl(GET_PLANNING_FOR_PARTY_ID + "/" + partyId + "/C/" + userName + "/" + token);
				uri.queryParam("buId", buId);
				
				BaseResponse<Suggestion> brGoals = new BaseResponse<Suggestion>();
				brGoals = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
				if (brGoals.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{
					model.addAttribute("suggestionData", brGoals.getResponseObject());
				}
				return "partner/report/generate-report-analysis-c";
			}else if(reportFor.equalsIgnoreCase("CLIENT")){ 
				
			}
				
		} catch(Exception e){
			LOGGER.error("Error Generating Report : ", e);
		}		
		return "partner/report/generate-report-analysis";
	}
	
	private void convertToPDF(String htmlPath, String pdfFilePath) throws IOException{		
		FileOutputStream fileStream = null;
		try 
        {
            // create an API client instance
            Client client = new Client("fiinfra", "c9dfe99bda3c5ec77067fb1a4611b299","fiinfra.pdfcrowd.com");

            // convert a web page and save the PDF to a file
            fileStream = new FileOutputStream(pdfFilePath);
            client.convertURI(htmlPath, fileStream);            
        }
        catch(PdfcrowdError why) {
            System.err.println(why.getMessage());
            LOGGER.error("Error Generating PDF : ", why);
        }
        catch(IOException exc) {
        	LOGGER.error("Error Generating PDF : ", exc);
        } finally{
        	if(fileStream != null){
        		fileStream.close();
        	}
        }
	}
	
	private void convertToPDFActionPlan(String htmlPath, String pdfFilePath, String footerPath) throws IOException{		
		FileOutputStream fileStream = null;
		try 
        {
            // create an API client instance
            Client client = new Client("fiinfra", "c9dfe99bda3c5ec77067fb1a4611b299","fiinfra.pdfcrowd.com");

            // convert a web page and save the PDF to a file
            fileStream = new FileOutputStream(pdfFilePath);
            client.convertURI(htmlPath, fileStream);
            client.setFooterUrl(footerPath);
            
            /*String footerHtml = "<html><div style="+"height:20px; background:#c0c0c0;"+"><div></html>"; 
            client.setFooterHtml(footerHtml);
            client.enablePdfcrowdLogo(false);*/
        }
        catch(PdfcrowdError why) {
            System.err.println(why.getMessage());
            LOGGER.error("Error Generating PDF : ", why);
        }
        catch(IOException exc) {
        	LOGGER.error("Error Generating PDF : ", exc);
        } finally{
        	if(fileStream != null){
        		fileStream.close();
        	}
        }
	}

	
	//@Produces("application/octet-stream")
	@RequestMapping(value = "/generatePDFReport", method = RequestMethod.POST)
	//@ResponseBody
	public  void generatePDFReport(Model model, HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		String report = request.getParameter("reportFor");
		String partyId = request.getParameter("partyId");
		String token = "1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PARTY + "/"+partyId +"/"+ userName + "/"+token+"?buId="+buId);
		BaseResponse<Party> br = new BaseResponse<Party>();
		
		//call service for all parties associated 
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		Party party = new Party();
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			party = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Party.class);
		}
		DocumentData documentData = null;
		/*if(report.equalsIgnoreCase("analysisC")){
		if(party.getAnalysisReportId()!= 0){
		UriComponentsBuilder uriCBDoc = UriComponentsBuilder.fromHttpUrl(GET_DOCUMENT_RECORD+"/"+ userName + "/"+token+"?buId="+buId+"&docId="+party.getAnalysisReportId());
		BaseResponse<DocumentData> br2=new BaseResponse<DocumentData>();
		
		br2 = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCBDoc), BaseResponse.class).getBody();
		
		if (br2.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			documentData = objectMapper.readValue(objectMapper.writeValueAsString(br2.getResponseObject()), DocumentData.class);
		}
		
		// reads input file from an absolute path
        String filePath = documentData.getFileStoragePathURI();
        File downloadFile = new File(filePath);
        */
		File downloadFile = null;
		if(report.equalsIgnoreCase("analysisA")){
	         downloadFile = getFile(party.getReserved2DocumentID(),userSession);
	       
	        }else if(report.equalsIgnoreCase("analysisB")){
		         downloadFile = getFile(party.getReserved3DocumentID(),userSession);
		        
		        }else if(report.equalsIgnoreCase("analysisC")){
			         downloadFile = getFile(party.getReserved4DocumentID(),userSession);
			        
			        }else if(report.equalsIgnoreCase("analysisD")){
				         downloadFile = getFile(party.getAnalysisReportId(),userSession);
					        
					 }else if(report.equalsIgnoreCase("analysisClient")){
				         downloadFile = getFile(party.getClientActionPlanId(),userSession);
				        
				        }else if(report.equalsIgnoreCase("analysisAdvisor")){
					         downloadFile = getFile(party.getAdvisorActionPlanId(),userSession);
				        }
		if(downloadFile.exists()){
        FileInputStream inStream = new FileInputStream(downloadFile);
        
     // gets MIME type of the file
        String mimeType = "application/pdf";
        
     // forces download
        String headerKey = "Content-Disposition";
        String headerValue = String.format("inline; filename=\"" + downloadFile.getName());
        response.setHeader(headerKey, headerValue);
        response.setContentType(mimeType);
        FileCopyUtils.copy(new FileInputStream(downloadFile), response.getOutputStream());
        response.flushBuffer();
		}
		}
	
	@RequestMapping(value = "/generatePDFReport1", method = RequestMethod.POST)
	//@ResponseBody
	public void generatePDFReport1(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		String token = "1234";
		String report = request.getParameter("reportFor");
		String partyId = request.getParameter("partyId");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PARTY + "/"+partyId +"/"+ userName + "/"+token+"?buId="+buId);
		BaseResponse<Party> br = new BaseResponse<Party>();
		
		//call service for all parties associated 
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		Party party = new Party();
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			party = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Party.class);
		}
		DocumentData documentData = null;

		File downloadFile = null;
		if(report.equalsIgnoreCase("analysisA")){
	         downloadFile = getFile(party.getReserved2DocumentID(),userSession);
	       
	        }else if(report.equalsIgnoreCase("analysisB")){
		         downloadFile = getFile(party.getReserved3DocumentID(),userSession);
		        
		        }else if(report.equalsIgnoreCase("analysisC")){
			         downloadFile = getFile(party.getReserved4DocumentID(),userSession);
			        
			        }else if(report.equalsIgnoreCase("analysisD")){
				         downloadFile = getFile(party.getAnalysisReportId(),userSession);
					        
					 }else if(report.equalsIgnoreCase("analysisClient")){
				         downloadFile = getFile(party.getClientActionPlanId(),userSession);
				        
				        }else if(report.equalsIgnoreCase("analysisAdvisor")){
					         downloadFile = getFile(party.getAdvisorActionPlanId(),userSession);
				        }				
		
		if(downloadFile.exists()){
	     // gets MIME type of the file
	        String mimeType = "application/pdf";
	        
	     // forces download
	        //String headerKey = "Content-Disposition";
	        //String headerValue = String.format("inline; filename=\"" + downloadFile.getName());
	        //response.setHeader(headerKey, headerValue);
	        //response.setContentType(mimeType);
	        
	    //    response.setContentType("application/octet-stream");
	     //  response.setHeader("Content-Disposition","attachment; filename=\"" + downloadFile.getName() +"\"");
	    //    FileCopyUtils.copy(new FileInputStream(downloadFile), response.getOutputStream());
	        BufferedInputStream in = null;
            try {
                in = new BufferedInputStream(new FileInputStream(downloadFile));
            } catch (FileNotFoundException e) { 
                e.printStackTrace();
            }
            Integer length = (int) downloadFile.length();
            response.setBufferSize(length);
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition","attachment; filename=\"" + downloadFile.getName() +"\"");
            response.setContentLength(length);
            try {
                FileCopyUtils.copy(in, response.getOutputStream()); 
                in.close();
                response.getOutputStream().flush();
                response.getOutputStream().close();  
            } catch (IOException e) { 
                e.printStackTrace();
            }
            
		}else{
			response.setContentType("text/html");
		}
		 
	}
	
	@RequestMapping(value = "/checkReport/{report}/{partyId}", method = RequestMethod.GET)
	public @ResponseBody String checkReport(Model model, HttpServletRequest request, HttpServletResponse response, @PathVariable String report ,@PathVariable String partyId) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		/*String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		String token = "1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PARTY + "/"+partyId +"/"+ userName + "/"+token+"?buId="+buId);
		BaseResponse<Party> br = new BaseResponse<Party>();
		//call service for all parties associated 
				br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				
				Party party = new Party();
				
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
					party = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Party.class);
				}*/
				Party party = new Party();
				party = getDocumentId(request, partyId);
				DocumentData documentData = null;
				File downloadFile = null;
				if(report.equalsIgnoreCase("analysisA")){
			         downloadFile = getFile(party.getReserved2DocumentID(),userSession);
			       
			        }else if(report.equalsIgnoreCase("analysisB")){
				         downloadFile = getFile(party.getReserved3DocumentID(),userSession);
				        
				        }else if(report.equalsIgnoreCase("analysisC")){
					         downloadFile = getFile(party.getReserved4DocumentID(),userSession);
					        
					        }else if(report.equalsIgnoreCase("analysisD")){
						         downloadFile = getFile(party.getAnalysisReportId(),userSession);
							        
							 }else if(report.equalsIgnoreCase("analysisClient")){
						         downloadFile = getFile(party.getClientActionPlanId(),userSession);
						        
						        }else if(report.equalsIgnoreCase("analysisAdvisor")){
							         downloadFile = getFile(party.getAdvisorActionPlanId(),userSession);
						        }
							        if(downloadFile.exists()){
							        	return "file found";
							        }
		return "file not found";
	}
	private File getFile(int documentId,UserSession userSession) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException{
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		String token = "1234";
		File downloadFile = null;
		DocumentData documentData = null;
			if(documentId!= 0){
			UriComponentsBuilder uriCBDoc = UriComponentsBuilder.fromHttpUrl(GET_DOCUMENT_RECORD+"/"+ userName + "/"+token+"?buId="+buId+"&docId="+documentId);
			BaseResponse<DocumentData> br2=new BaseResponse<DocumentData>();
			
			br2 = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCBDoc), BaseResponse.class).getBody();
			
			if (br2.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				documentData = objectMapper.readValue(objectMapper.writeValueAsString(br2.getResponseObject()), DocumentData.class);
			}
			
			// reads input file from an absolute path
	        String filePath = documentData.getFileStoragePathURI();
	         downloadFile = new File(filePath);
	        	
	}
			return downloadFile;
	}
	
	//kunal
			@RequestMapping(value = "/detailedReport/{partyId}/{partnerPartyId}/{reportFor}/{userName}/{buId}", method = RequestMethod.GET)
			public String getDetailedReport(Model model, HttpServletRequest request,
					@PathVariable String partyId,
					@PathVariable String reportFor,
					@PathVariable String userName,
					@PathVariable String buId,
					@PathVariable String partnerPartyId) {
				/*UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
				if(userSession == null) {
					 return "redirect:/login";
				}*/
				
				
				/*String userName = userSession.getUserName();
				Integer buId = userSession.getBuId();*/
				String inflationRate="0.0", equityFund="0.0", debtFund="0.0", goldFund="0.0";
				
				String token = "1234";
				UriComponentsBuilder uriCBForGoalDetails = UriComponentsBuilder.fromHttpUrl(GET_GOAL_DETAILS + "/"+partyId +"/flag/"+ userName + "/"+token+"?buId="+buId);
				UriComponentsBuilder uriCBForAnalysisReport = UriComponentsBuilder.fromHttpUrl(GET_ANALYSISREPORT_FOR_PARTY_ID + "/"+partyId +"/"+ userName + "/"+token+"?buId="+buId);
				BaseResponse<AdviserGoals> baseResponse = new BaseResponse<AdviserGoals>();
				BaseResponse<ClientActionPlan> baseResponseForAnalysisReport = new BaseResponse<ClientActionPlan>();
				try{
				//call service for all parties associated 
					baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCBForGoalDetails), BaseResponse.class).getBody();
						
						AdviserGoals adviserGoals = new AdviserGoals();
						
						if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
							adviserGoals = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), AdviserGoals.class);
						}
						
						
						baseResponseForAnalysisReport = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCBForAnalysisReport), BaseResponse.class).getBody();
						List<ClientActionPlan> clientActionPlanListJson = null;
						//List<ClientActionPlan> clientActionPlanList = new ArrayList<ClientActionPlan>();
						List<ClientActionPlan> emergencyPlanningDataList = new ArrayList<ClientActionPlan>();
						Map<Integer,ProductwiseGoalMap>  mapOfProductwiseGoalMap = new HashMap<Integer,ProductwiseGoalMap>();
						Map<Integer,GoalwiseProductMap>  mapOfGoalwiseProductMap = new HashMap<Integer,GoalwiseProductMap>();
						Map<String,RiskPlanningMap>  mapOfRiskPlanningMap = new HashMap<String,RiskPlanningMap>();
						List<ClientActionPlan> successionPlanningDetails = new ArrayList<ClientActionPlan>();
						List<ClientActionPlan> goalNoteList = new ArrayList<ClientActionPlan>();
						List<ClientActionPlan> taxPlanningList = new ArrayList<ClientActionPlan>();
						List<ClientActionPlan> vacationPlanningList = new ArrayList<ClientActionPlan>();
						List<ClientActionPlan> loanRecommendationList = new ArrayList<ClientActionPlan>();
						ClientActionPlan clientActionPlan =null;
						if (baseResponseForAnalysisReport.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						{
							clientActionPlanListJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponseForAnalysisReport.getResponseListObject()), List.class);
							
							if(clientActionPlanListJson != null){
								
								//fpSectionTypeId - 390051 goal wise -  39005 product wise emergency - 39001 risk cover - 39003
								
							for(int i = 0; i<clientActionPlanListJson.size(); i++){
								//get the actual party object from its LinkedHashMap representation
								
								clientActionPlan = objectMapper.readValue(objectMapper.writeValueAsString(clientActionPlanListJson.get(i)), ClientActionPlan.class);
								//clientActionPlanList.add(clientActionPlan);
								
								if(i==0)
								{
									inflationRate = clientActionPlan.getInflationRate();
									inflationRate = clientActionPlan.getInflationRate();
									equityFund = clientActionPlan.getEquityFund();
									debtFund = clientActionPlan.getDebtFund();
									goldFund = clientActionPlan.getGoldFund();
								}
								
								if(clientActionPlan.getFpSectionTypeId() == 39005){
									
								if(mapOfProductwiseGoalMap.containsKey(clientActionPlan.getProductId())){
									ProductwiseGoalMap temp = mapOfProductwiseGoalMap.get(clientActionPlan.getProductId());
									temp.getClientActionPlanList().add(clientActionPlan);
									mapOfProductwiseGoalMap.put(clientActionPlan.getProductId(), temp);
								}else{
									ProductwiseGoalMap productWiseGoalMap = new ProductwiseGoalMap();
									productWiseGoalMap.setProductId(clientActionPlan.getProductId());
									productWiseGoalMap.setProductName(clientActionPlan.getProductName());
									productWiseGoalMap.setTotalLumpSumAmt(clientActionPlan.getTotalLumpSumAmt());
									productWiseGoalMap.setTotalSipAmt(clientActionPlan.getTotalSipAmt());
									List<ClientActionPlan> tempClientActionPlanList = new ArrayList<ClientActionPlan>();
									tempClientActionPlanList.add(clientActionPlan);
									productWiseGoalMap.setClientActionPlanList(tempClientActionPlanList);
									//tempClientActionPlanList.clear();
									mapOfProductwiseGoalMap.put(clientActionPlan.getProductId(), productWiseGoalMap);
									
								}
								}else if(clientActionPlan.getFpSectionTypeId() == 390051){
									
									if(mapOfGoalwiseProductMap.containsKey(clientActionPlan.getGoalId())){
										GoalwiseProductMap temp = mapOfGoalwiseProductMap.get(clientActionPlan.getGoalId());
										temp.getClientActionPlanList().add(clientActionPlan);
										mapOfGoalwiseProductMap.put(clientActionPlan.getGoalId(), temp);
									}else{
										GoalwiseProductMap goalwiseProductMap = new GoalwiseProductMap();
										goalwiseProductMap.setGoalId(clientActionPlan.getGoalId());
										List<ClientActionPlan> tempClientActionPlanList = new ArrayList<ClientActionPlan>();
										tempClientActionPlanList.add(clientActionPlan);
										goalwiseProductMap.setClientActionPlanList(tempClientActionPlanList);
										//tempClientActionPlanList.clear();
										mapOfGoalwiseProductMap.put(clientActionPlan.getGoalId(), goalwiseProductMap);
										
										goalNoteList.add(clientActionPlan);
								}
							
						}else if(clientActionPlan.getFpSectionTypeId() == 39001){
							emergencyPlanningDataList.add(clientActionPlan);
						}else if(clientActionPlan.getFpSectionTypeId() == 39003){
							if(mapOfRiskPlanningMap.containsKey(clientActionPlan.getGoalName())){
								RiskPlanningMap temp = mapOfRiskPlanningMap.get(clientActionPlan.getGoalName());
								temp.getClientActionPlanList().add(clientActionPlan);
								mapOfRiskPlanningMap.put(clientActionPlan.getGoalName(), temp);
							}else{
								RiskPlanningMap riskPlanningMap = new RiskPlanningMap();
								riskPlanningMap.setRequiredCover(clientActionPlan.getRequiredCover());
								riskPlanningMap.setExistingCover(clientActionPlan.getExistingCover());
								riskPlanningMap.setDecimalNumber(clientActionPlan.getDecimalNumber());
								riskPlanningMap.setMoneyFormatted(clientActionPlan.getMoneyFormatted());
								List<ClientActionPlan> tempClientActionPlanList = new ArrayList<ClientActionPlan>();
								tempClientActionPlanList.add(clientActionPlan);
								riskPlanningMap.setClientActionPlanList(tempClientActionPlanList);
								//tempClientActionPlanList.clear();
								mapOfRiskPlanningMap.put(clientActionPlan.getGoalName(), riskPlanningMap);
							}
						}else if(clientActionPlan.getFpSectionTypeId() == 39007)
						{
							successionPlanningDetails.add(clientActionPlan);
						}
						// for tax planning  
						else if(clientActionPlan.getFpSectionTypeId() == 39019)
						{
							taxPlanningList.add(clientActionPlan);
						}
						// for vacation planning
						else if(clientActionPlan.getFpSectionTypeId() == 39014)
						{
							vacationPlanningList.add(clientActionPlan);
						}
						// for 	loan Recommendation	
						else if(clientActionPlan.getFpSectionTypeId() == 39008)
						{
							loanRecommendationList.add(clientActionPlan);
						}
						}
							
						//String assumptionsMade = "<b>Assumptions Made :-</b> Inflation: "+inflationRate+ "%, Returns From Equity: "+equityFund+"%, Returns From Debt: "+debtFund+"%, Returns From Gold: "+goldFund+"%";
						String assumptionsMade = "<b>Assumptions Made :-</b> Returns From Equity: "+equityFund+"%, Returns From Debt: "+debtFund+"%, Returns From Gold: "+goldFund+"%";
						model.addAttribute("assumptionsMade",assumptionsMade);	
							
						String fpSection = getFpSectionForReport(buId, partnerPartyId, partyId, userName);
						model.addAttribute("fpSection",fpSection);
						model.addAttribute("ContactDetails", adviserGoals);
						model.addAttribute("productWiseGoalDetails", mapOfProductwiseGoalMap);
						model.addAttribute("GoalWiseProductDetails", mapOfGoalwiseProductMap);
						model.addAttribute("emergencyPlanningDataList", emergencyPlanningDataList);
						
						if(emergencyPlanningDataList.size()>0){
						model.addAttribute("emergencyPlanningOneTimeAmt", emergencyPlanningDataList.get(0).getTotalLumpSumAmt());
						model.addAttribute("emergencyPlanningSIPMonthlyAmt", emergencyPlanningDataList.get(0).getRequiredCover());
						}
						model.addAttribute("riskPlanningProductDetails", mapOfRiskPlanningMap);
						model.addAttribute("successionPlanningDetails",successionPlanningDetails);
						model.addAttribute("pageNumber",1);
						model.addAttribute("goalNoteList",goalNoteList);
						model.addAttribute("goalNoteTextFlag",1);
						
						model.addAttribute("taxPlanningList",taxPlanningList);
						model.addAttribute("vacationPlanningList",vacationPlanningList);
						model.addAttribute("loanRecommendationList",loanRecommendationList);
						
						model.addAttribute("goalNoteTextFlag",0);
						model.addAttribute("buPartyId", buId);
						for(int i=0;i<goalNoteList.size();i++)
						{
							ClientActionPlan actionPlan = goalNoteList.get(i);
							if(actionPlan.getGoalNoteText()!="")
							{
							  model.addAttribute("goalNoteTextFlag",1);
							  break;
							}
						}
						
						//LOGGER.debug("#==============================assumptionsMade============================"+assumptionsMade);
							
			 			  }
						}
			} catch(Exception e){
				LOGGER.error("Error Generating Report : ", e);
			}		
				//to set current stage id to DCT Submitted
			if(reportFor.equalsIgnoreCase("client")){
				model.addAttribute("reportFor","client");	
				return "partner/report/detailedReport/client";
			}else{
				model.addAttribute("reportFor", "advisor");
				return "partner/report/detailedReport/advisor";
			  }
		}
	
	@RequestMapping(value = "/generateNewReport/{partyId}/{userName}/{buId}", method = RequestMethod.POST)
	public @ResponseBody String generateNewReport(Model model, HttpServletRequest request,
			@PathVariable String partyId,
			@PathVariable String userName,
			@PathVariable String buId) {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			Client client = new Client("fiinfra", "c9dfe99bda3c5ec77067fb1a4611b299","fiinfra.pdfcrowd.com");
			String realPath ="D://AnalysisReports/";
			String content=request.getParameter("htmlString");
			String htmlString=request.getParameter("htmlString");
			String pdfFilePathA = "D://AnalysisReports/" + partyId + "_Analysis_A.pdf";
			FileOutputStream fileOutputStreamForWritingHtml = null;
			String messageBody = null;
			//LOGGER.debug(">>>>>>>>>>>>>>>>>>>>>>>" + content);
			content = "<head><style type=\"text/css\">" + content
					+ "</style></head>" + htmlString;
			//LOGGER.debug("CONTENT=============="+content);
			//realPath ="D:\\FFreedom-DI\\Attachments\\";
			File file;
			try {
				file = new File(realPath+"detailedReport_"+partyId);
				if (file.exists()) {
					FileUtils.deleteDirectory(file);
					file= new File(realPath+"detailedReport_"+partyId);
					file.mkdirs();
				} else {
					file.mkdirs();
				}
				
				file = new File(realPath+"detailedReport_"+partyId+".htm");
			//	file = new File(realPath+"\\PathFinder\\pdf\\"+dcInputPartyId+"\\"+"Output.htm");
				fileOutputStreamForWritingHtml = new FileOutputStream(file);
				byte[] contentInBytes = content.getBytes();
				fileOutputStreamForWritingHtml.write(contentInBytes);
				fileOutputStreamForWritingHtml.flush();
				fileOutputStreamForWritingHtml.close();				
			
		} catch (Exception e) {
			LOGGER.error("Error Generating Report : ", e);
			return "Failuer";
		}finally {
			try {
				if (fileOutputStreamForWritingHtml != null) {
					fileOutputStreamForWritingHtml.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
			
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			HtmlCleaner cleaner = new HtmlCleaner();
			CleanerProperties props = cleaner.getProperties();
			try {
			TagNode node = cleaner.clean(new FileInputStream(realPath+"detailedReport_"+partyId+".htm"));
			new PrettyXmlSerializer(props).writeToStream(node, out);
			LOGGER.debug("end of showPathFinderOutputPdfFromHtml......22222");
			
			
			fileOutputStreamForWritingHtml = new FileOutputStream(realPath+"detailedReport_"+partyId+".pdf");
		    client.convertFile(realPath+"detailedReport_"+partyId+".htm", fileOutputStreamForWritingHtml);
		    fileOutputStreamForWritingHtml.close();
			
		    fileOutputStreamForWritingHtml.close();
		    out.flush();
			out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "Success";
	}
	
	private Map<String, List<AdviceRecommendation>> getRecommendationData(HttpServletRequest request, Integer riskProfileId,String userName,String partyId,String buId){
		
		//UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		//String username = null;
		//Integer partnerPartyId = null;
		//Integer buPartyId = null;
		//Integer buId = null;
		String token = null;
		Integer sectionTypeId=39005;
		
		/*if(userSession != null){
			username = userSession.getName();
			partnerPartyId = userSession.getPartyId();
			buPartyId = userSession.getBuId();//27828 
			buId = userSession.getBuId();			
		}
		else{
			return null;
		}*/
		token = "153443";
		UriComponentsBuilder uriCB;
		Map<Integer, List<AdviceRecommendation>> recommendationMap = null;
		GoalPlanInput goalPlanInput = new GoalPlanInput();
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_RECOMMENDATION_ASSET+ "/" +userName + "/" +token +"?buId="+buId);
		
		goalPlanInput.setBuPartyId(Integer.parseInt(buId));
		goalPlanInput.setPartnerPartyId(Integer.parseInt(partyId));
		goalPlanInput.setSectionTypeId(sectionTypeId); // 47010  - goal planning (need constant )
		String assetClassId = "46001,46002,46003"; //code valued id for Equity (93002), Debt (93001)  and Gold (93003)
		goalPlanInput.setAssetClassId(assetClassId);
		 
		goalPlanInput.setRiskProfileId(riskProfileId);
		Integer recordTypeId= 50001;
		goalPlanInput.setRecommendationRecordTypeId(recordTypeId);
		BaseResponse<Map<Integer, List<AdviceRecommendation>>> baseResponse = null;
		Map<String, List<AdviceRecommendation>> goalDataMap = null;
		
		
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
	
	public String getFpSectionForReport(String buPartyId, String partnerPartyId, String clientPartyId, String userName)
	{
		try {
			
			String token ="432";
			BaseResponse<KeyValue> baseResponce = new BaseResponse<KeyValue>();
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_INTERESTED_FP_SECTION+ userName+"/" + token);
			uriCB.queryParam("buId", buPartyId);
			uriCB.queryParam("partnerPartyId", partnerPartyId);
			uriCB.queryParam("clientPartyId", clientPartyId);
			BaseResponse<Party> br = new BaseResponse<Party>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<KeyValue> interestdFpJson = new ArrayList<>();
			List<KeyValue> interestdFp = new ArrayList<>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				interestdFpJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), List.class);
				for(int i = 0; i<interestdFpJson.size(); i++){										
					KeyValue keyValue = null;
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(interestdFpJson.get(i)), KeyValue.class);
					interestdFp.add(keyValue);
				}
				
			}
			LOGGER.debug(interestdFp.get(0).getName());
			
			return interestdFp.get(0).getName();
		}
		catch (Exception e) 
		{
			LOGGER.debug("error while parsing list "+e.getMessage());
		}
		
		
		return null;
		
	}
	
	@RequestMapping(value = "/generate-report-analysisA-web/{partyId}/{reportFor}/{userName}/{buPartyId}/{partnerPartyId}", method = RequestMethod.POST)
	public @ResponseBody String generateReportForAnalysisAWeb(Model model, HttpServletRequest request,
			@PathVariable String partyId, @PathVariable String reportFor, @PathVariable String userName,
			@PathVariable String buPartyId, @PathVariable String partnerPartyId) {
		
		try {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			//to set current stage id to DCT Submitted		
			String pdfFilePathA = "D://AnalysisReports/" + partyId + "_Analysis_A.pdf";
			//String pdfFilePathB = "D://AnalysisReports/" + partyId + "_Analysis_B.pdf";
			//String reportFilePath = "http://202.87.46.144:8081/FIINFRA-M-WEB/partner/report/generate-report-analysis/" + partyId + "/" + reportFor + "/" + userSession.getUserName() + "/" + userSession.getBuId();
			//for server only will not work in local
			String baseUrl="";
			if ( ( request.getServerPort() == 80 ) ||
			         ( request.getServerPort() == 443 ) ){
				baseUrl = request.getScheme() + "://" + request.getServerName() ;				
			}
			else{
				baseUrl = request.getScheme() + "://" +
				        request.getServerName() + ":" + request.getServerPort();				
			}
			String reportFilePathA = baseUrl+"/FIINFRA-M-WEB/partner/report/generate-report-analysis/"+ partnerPartyId + "/" + partyId + "/A/" + userName + "/" + buPartyId + "?TOKEN=abc&USER_NAME=Baba";
			//for local only			
			//String reportFilePathA = "http://202.87.46.144:8081/FIINFRA-M-WEB/partner/report/generate-report-analysis/"+ partnerPartyId +"/" + partyId + "/A/" + userSession.getUserName() + "/" + userSession.getBuId() + "?TOKEN=abc&USER_NAME=Baba";
			convertToPDF(reportFilePathA, pdfFilePathA);
			
			Document documentA = new Document();
			documentA.setDocumentType(10001);
			documentA.setDocumentName(partyId + "_Analysis_A.pdf");
			documentA.setDocumentStorageLocation(82001);
			documentA.setFileName(partyId + "_Analysis_A.pdf");
			documentA.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "_Analysis_A.pdf");
			documentA.setFileTypeId(11004);
			documentA.setPartyId(Integer.parseInt(partyId));
			documentA.setFlag("ReportA");
			//save document
			List<Document> documentList = new ArrayList<Document>();
			documentList.add(documentA);
			String token = "42534";
			UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(SAVE_DOCUMENT + "/" + userName + "/" + token);
			uri.queryParam("buId", buPartyId);
			 BaseResponse<Boolean> baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uri), documentList, BaseResponse.class);
			 
			 uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7003/"+partyId+"/342");
				uri.queryParam("buId", buPartyId);
				 baseResponse = new BaseResponse<Boolean>();
				baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
			return "Success";
			
			

		} catch (Exception e) {
			LOGGER.error("Error Generating Report : ", e);
			return "Failuer";
		}
	}
	
	@RequestMapping(value = "/generate-report-analysisB-web/{partyId}/{reportFor}/{userName}/{buPartyId}/{partnerPartyId}", method = RequestMethod.POST)
	public @ResponseBody String generateReportForAnalysisBWeb(Model model, HttpServletRequest request,
			@PathVariable String partyId, @PathVariable String reportFor,
			@PathVariable String userName, @PathVariable String buPartyId, @PathVariable String PartnerPartyId) {
		try {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				 return "redirect:/login";
			}
			//to set current stage id to DCT Submitted		
			//String pdfFilePathA = "D://AnalysisReports/" + partyId + "_Analysis_A.pdf";
			String pdfFilePathB = "D://AnalysisReports/" + partyId + "_Analysis_B.pdf";
			//String reportFilePath = "http://202.87.46.144:8081/FIINFRA-M-WEB/partner/report/generate-report-analysis/" + partyId + "/" + reportFor + "/" + userSession.getUserName() + "/" + userSession.getBuId();
			//for server only will not work in local
			String baseUrl="";
			if ( ( request.getServerPort() == 80 ) ||
			         ( request.getServerPort() == 443 ) ){
				baseUrl = request.getScheme() + "://" + request.getServerName() ;				
			}
			else{
				baseUrl = request.getScheme() + "://" +
				        request.getServerName() + ":" + request.getServerPort();				
			}
			String reportFilePathB = baseUrl+"/FIINFRA-M-WEB/partner/report/generate-report-analysis/"+ PartnerPartyId + "/" + partyId + "/B/" + userName + "/" + buPartyId + "?TOKEN=abc&USER_NAME=Baba";
			//for local only			
			//String reportFilePathB = "http://202.87.46.144:8081/FIINFRA-M-WEB/partner/report/generate-report-analysis/"+ partnerPartyId + "/" + partyId + "/B/" + userSession.getUserName() + "/" + userSession.getBuId() + "?TOKEN=abc&USER_NAME=Baba";
			convertToPDF(reportFilePathB, pdfFilePathB);
			
			Document documentB = new Document();
			documentB.setDocumentType(10001);
			documentB.setDocumentName(partyId + "_Analysis_B.pdf");
			documentB.setDocumentStorageLocation(82001);
			documentB.setFileName(partyId + "_Analysis_B.pdf");
			documentB.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "_Analysis_B.pdf");
			documentB.setFileTypeId(11004);
			documentB.setPartyId(Integer.parseInt(partyId));
			documentB.setFlag("ReportB");
			//save document
			List<Document> documentList = new ArrayList<Document>();
			documentList.add(documentB);
			String token = "42534";
			UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(SAVE_DOCUMENT + "/" + userName + "/" + token);
			uri.queryParam("buId", buPartyId);
			 BaseResponse<Boolean> baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uri), documentList, BaseResponse.class);
			 
			 uri = UriComponentsBuilder.fromHttpUrl(UPDATE_FPACTIVITY_TRACKER+"7003/"+partyId+"/342");
				uri.queryParam("buId", buPartyId);
				 baseResponse = new BaseResponse<Boolean>();
				baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uri), BaseResponse.class);
			return "Success";
			
			

		} catch (Exception e) {
			LOGGER.error("Error Generating Report : ", e);
			return "Failuer";
		}		
	}
	
	public Party getDocumentId(HttpServletRequest request, String partyId) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
	
		String userName = userSession.getUserName();
		Integer buId = userSession.getBuId();
		String token = "1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PARTY + "/"+partyId +"/"+ userName + "/"+token+"?buId="+buId);
		BaseResponse<Party> br = new BaseResponse<Party>();
		//call service for all parties associated 
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		Party party = new Party();
		
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			party = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Party.class);
		}
		return party;
	}

	@RequestMapping(value = "/sendNotification/{partyId}", method = RequestMethod.POST)
	private @ResponseBody String sendNotification(HttpServletRequest request, @QueryParam("reportName") String reportName, @PathVariable String partyId)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			 return "redirect:/login";
		}
		
		Integer documentId;
		
		Party party = new Party();
		try {
			party = getDocumentId(request, partyId);
		
		Notification notification = null;
		Map<String,String> payloadMap=new HashMap<String, String>();
		
		String name = "";
		
		if( reportName.contains("Quick") ){
			name = "Quick Analysis Report";
			documentId = party.getReserved2DocumentID();
		}else if( reportName.contains("Summarized") ){
			name = "Summarized Analysis Report";
			documentId = party.getReserved3DocumentID();
		}else if( reportName.contains("Detailed") ){
			name = "Detailed Analysis Report";
			documentId = party.getAnalysisReportId();
		}else if( reportName.contains("Client") ){
			name = "Client Action Plan Report";
			documentId = party.getClientActionPlanId();
		}else{
			name = "Advisor Action Plan Report";
			documentId = party.getAdvisorActionPlanId();
		}
		
		payloadMap.put("ReportName",name);
		notification=new Notification();
		notification.setSourceSystemID(FiinfraConstants.DIY);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(Integer.parseInt(partyId));
		notification.setNotifyEventID(FiinfraConstants.SEND_ATTACHMENT_EMAIL);
		notification.setDeliveryChannelID(32001);
		notification.setNotifyUserID(userSession.getUserId());
		notification.setSessionID(request.getSession().getId());
		notification.setBuId(userSession.getBuId());
		notification.setAttachmentPresent(true);
		notification.setAttachmentCount(1);
		notification.setAttachment1DocumentID(documentId);
		notification.setPayloadMap(payloadMap);
		FrameworkUtil.notify(notification);
		
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	private List<String> getLifeInsuranceForAllMethods(HttpServletRequest request,Integer clientPartyId) throws IOException
	{
//		List sectionDataList<> = new ArrayList();
		//int partyId;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		Integer buId=userSession.getBuId();
		int createdBy=userSession.getUserId();

		//partyId=Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		 /*partyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());*/
		 LOGGER.debug("partyId==="+clientPartyId);
		 String url = "";
		 url = URL_GET_LI_ALL_METHOD+userSession.getUserName()+"/1234";
		//String xmlString=request.getParameter("xmlString");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", clientPartyId);
		uriCB.queryParam("buId", buId);
		
		BaseResponse<String> br = new BaseResponse<String>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<String> resultListAsJson=new ArrayList<>();
		List<String> resultList=new ArrayList<>();
		String result = "";
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			resultListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), List.class);
			for(int i = 0; i<resultListAsJson.size(); i++){													
				result = objectMapper.readValue(objectMapper.writeValueAsString(resultListAsJson.get(i)), String.class);
				resultList.add(result);
			}			
		}
			
		return resultList;
		
	}
	
	@RequestMapping(value="/saveLifeInsuranceMethod",method=RequestMethod.POST)
	public @ResponseBody String saveLifeInsuranceMethod(HttpServletRequest request) throws IOException
	{
//		List sectionDataList<> = new ArrayList();
		int partyId;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		Integer buId=userSession.getBuId();
		int createdBy=userSession.getUserId();
		 partyId=Integer.valueOf(request.getParameter("clientPartyId"));
		 LOGGER.debug("partyId==="+partyId);
		String url = "";
		 url = URL_SAVE_LI_METHOD+userSession.getUserName()+"/1234";
		//String xmlString=request.getParameter("xmlString");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("liMethodSelect", Integer.valueOf(request.getParameter("liMethod")));
		uriCB.queryParam("lastModifiedBy", createdBy);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		Integer recordCount=0;
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			return "success";
		}else{
			return "failure";
		}
			
	}
	
	@RequestMapping(value="/saveAnalysisReportsForBatch",method=RequestMethod.POST)
	public @ResponseBody String saveAnalysisReportsForBatch(HttpServletRequest request){
		
		int partyId;
		Integer isAnalysisGeneration;
		Integer isActionPlanGeneration;
		Integer analysiReportType;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		Integer buId=userSession.getBuId();
		int createdBy=userSession.getUserId();
		 partyId=Integer.valueOf(request.getParameter("partyId"));
		 isAnalysisGeneration=Integer.valueOf(request.getParameter("isAnalysisGeneration"));
		 isActionPlanGeneration=Integer.valueOf(request.getParameter("isActionPlanGeneration"));
		 analysiReportType=Integer.valueOf(request.getParameter("analysisReportType"));
		 LOGGER.debug("partyId==="+partyId);
		String url = "";
		 url = SAVE_ANALYSIS_REPORTS_FOR_BATCH+userSession.getUserName()+"/1234";
		//String xmlString=request.getParameter("xmlString");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("isAnalysisGeneration", isAnalysisGeneration);
		uriCB.queryParam("isActionPlanGeneration", isActionPlanGeneration);
		uriCB.queryParam("analysiReportType", analysiReportType);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("lastModifiedBy", createdBy);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		Integer recordCount=0;
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			return "success";
		}else{
			return "failure";
		}
	}
	
}
