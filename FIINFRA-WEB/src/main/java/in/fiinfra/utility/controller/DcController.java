package in.fiinfra.utility.controller;

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.partner.APDetails;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.utility.CurrentFinancialStatusData;
import in.fiinfra.common.utility.DCOutputData;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.common.utility.SectionData;
import in.fiinfra.common.utility.XrayData;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.question.QuestionData;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

























import com.pdfcrowd.Client;
import com.pdfcrowd.PdfcrowdError;

import sun.misc.BASE64Decoder;

public class DcController extends MultiActionController implements ServletConfigAware{

	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	private int partyId;
	private String sectionName;
	final String SOURCE_MODEULE = "Dc Input";
	String url;
	private static final Logger logger = Logger.getLogger(DcController.class);
	@Value("${URL_INSERT_DC_FINANCIALSTATUS_RECORD}")
	private String URL_INSERT_DC_FINANCIALSTATUS_RECORD;
	@Value("${URL_GET_DC_PERSONALINFORMATION_RECORD}")
	private String URL_GET_DC_PERSONALINFORMATION_RECORD;
	@Value("${URL_GET_DC_FUTURE_FINANCIALEXPECTATIONS_LIST}")
	private String URL_GET_DC_FUTURE_FINANCIALEXPECTATIONS_LIST;
	@Value("${URL_UPDATE_DC_PERSONALINFORMATION_RECORD}")
	private String URL_UPDATE_DC_PERSONALINFORMATION_RECORD;
	@Value("${URL_GET_DC_FINANCIALSTATUS_LIST}")
	private String URL_GET_DC_FINANCIALSTATUS_LIST;
	@Value("${URL_UPDATE_DC_FUTURE_FINANCIALEXPECTATIONS_LIST}")
	private String URL_UPDATE_DC_FUTURE_FINANCIALEXPECTATIONS_LIST;
	@Value("${URL_GET_FAMILYMEMBER_LIST}")
	private String URL_GET_FAMILYMEMBER_LIST;
	@Value("${URL_SUBMIT_DCINPUT}")
	private String URL_SUBMIT_DCINPUT;
	@Value("${businessUnitId_Shubhachintak}")
	private String businessUnitId_Shubhachintak;
	@Value("${businessUnitId_Fiinfra}")
	private String businessUnitId_Fiinfra;
	@Value("${URL_GET_CASHFLOWBAR}")
	private String URL_GET_CASHFLOWBAR;
	@Value("${URL_UPLOAD_GRAPHIMAGE}")
	private String URL_UPLOAD_GRAPHIMAGE;
	@Value("${URL_VIEW_OUTPUT_AS_PDF}")
	private String URL_VIEW_OUTPUT_AS_PDF;
	@Value("${URL_SHOW_ANALYSISREPORTPDF}")
	private String URL_SHOW_ANALYSISREPORTPDF;
	@Value("${URL_GET_ACTIONPLAN_DETAILS}")
	private String URL_GET_ACTIONPLAN_DETAILS;
	@Value("${URL_CHECK_MINIMUM_DATA_FOR_ANALYSISREPORT}")
	private String URL_CHECK_MINIMUM_DATA_FOR_ANALYSISREPORT;
	@Value("${businessUnitId_Spa}")
	private String businessUnitId_Spa;
	@Value("${businessUnitId_DFDA}")
	private String businessUnitId_DFDA;
	@Value("${URL_GET_LI_ALL_METHOD}")
	private String URL_GET_LI_ALL_METHOD;
	@Value("${URL_SAVE_LI_METHOD}")
	private String URL_SAVE_LI_METHOD;
	@Value("${URL_GET_SECTIONS_TO_SHOW_IN_DC}")
	private String URL_GET_SECTIONS_TO_SHOW_IN_DC;
	@Value("${URL_XRAY_TOOL}")
	private String URL_XRAY_TOOL;
	@Value("${URL_INSERT_XRAY_RECORDS}")
	private String URL_INSERT_XRAY_RECORDS;
	private ServletConfig config;

    public void setServletConfig(ServletConfig servletConfig) {
        this.config = servletConfig;
    }
	public void insertDcFinancialStatusRecord(HttpServletRequest request,
			HttpServletResponse response,CurrentFinancialStatusData currentFinancialStatusData) throws Exception {
		try{
		int recordCount=0;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info("xmlstring in saveleadFinancialStstu===="+request.getParameter("XMlString"));
		String XMlString = request.getParameter("XMlString");
		int questionBankId = Integer.parseInt(request.getParameter("questionBankId"));
		int sectionTypeId = Integer.parseInt(request.getParameter("sectionTypeId"));
		sectionName = request.getParameter("sectionName");
		logger.info("URL --> " + url);
		url = URL_INSERT_DC_FINANCIALSTATUS_RECORD+userSession.getUserName()+"/1234";
		int buId=userSession.getBuId();
		int partyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());
		int lastModifiedBy = userSession.getUserId();
		currentFinancialStatusData.setBuId(buId);
		currentFinancialStatusData.setPartyId(partyId);
		currentFinancialStatusData.setXMLString(XMlString);
		currentFinancialStatusData.setSectionTypeId(sectionTypeId);
		currentFinancialStatusData.setQuestionBankId(questionBankId);
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		logger.info("-----------Before Calling APP In Web(insertDcFinancialStatusRecord)-----------");
		br = restTemplate.postForObject(url, currentFinancialStatusData, BaseResponse.class);
		logger.info("-----------After Calling APP In Web(insertDcFinancialStatusRecord)-----------");
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Integer.class);
		
		logger.info("RECORDCOUNT IN WEB========"+recordCount);
		
		String eventTextXML="usp_pp_DC_INP_saveCurrentFinancialStatus("+partyId+","+userSession.getUserId()+","+questionBankId+","+sectionTypeId+","+XMlString+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.DC_INSERT_FINANCIAL_STATUS_RECORD);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		
		objectMapper.writeValue(out, recordCount);
		}
		catch(Exception e)
		{
			logger.error(e);
		}
	}
	
	public void getDCPersonalInfoDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info("URL --> " + url);
	
		url = URL_GET_DC_PERSONALINFORMATION_RECORD+userSession.getName()+"/1234";
		int partyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());
		int buId=Integer.parseInt(request.getSession().getAttribute("dcInputBuId").toString());

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId",buId);
		uriCB.queryParam("partyId",partyId);
		BaseResponse<OpportunityData> br = new BaseResponse<OpportunityData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		OpportunityData opportunityData=new OpportunityData();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			opportunityData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), OpportunityData.class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, opportunityData);
	}
	
	public void getDCFutureFinancialExpectationsDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		logger.info("URL --> " + url);
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_DC_FUTURE_FINANCIALEXPECTATIONS_LIST+userSession.getName()+"/1234";

		
		int partyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());

		
		int buId=Integer.parseInt(request.getSession().getAttribute("dcInputBuId").toString());

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId",buId);
		uriCB.queryParam("partyId",partyId);
		BaseResponse<GoalData> br = new BaseResponse<GoalData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<GoalData> goalDataList=new ArrayList<>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			goalDataList=br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, goalDataList);
	}
	
	@SuppressWarnings("unchecked")
	public void saveDCPersonalInfoDetails(HttpServletRequest request,
			HttpServletResponse response,OpportunityData opportunityData) throws IOException{
		logger.info("URL --> " + url);
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_UPDATE_DC_PERSONALINFORMATION_RECORD+userSession.getName()+"/1234";
		sectionName = "Dc Personal Information";
		List<Integer> resultList=new ArrayList<>();
		int isPanExist=0;
		int isFamilyMemberPresent=0;
		int partyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());
		int buId=Integer.parseInt(request.getSession().getAttribute("dcInputBuId").toString());

		int lastModifiedBy = userSession.getUserId();
		String result="success";
		long currentTime = new Date().getTime();
		int recordCount=0;
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		DocumentData documentData=new DocumentData();
		MultipartFile[] m={opportunityData.getContactPhoto()};
		if(opportunityData.getContactPhoto()!=null)
		documentDatas=FiinfraUtility.getDocumentDatasFromMultiPartFiles(m,currentTime,lastModifiedBy);
		logger.info("documentDatas is:--"+documentDatas);
		if(documentDatas==null){
			result="Attachment size greater than "+FiinfraConstants.MAX_FILE_SIZE+" kb is not allowed.";
		}else{
		
		if(documentDatas.size()>0)
		documentData=documentDatas.get(0);
		opportunityData.setPartyId(partyId);
		opportunityData.setBuId(buId);
		opportunityData.setLastModifiedBy(lastModifiedBy);
		opportunityData.setDocumentData(documentData);
		if(documentDatas.size()>0)
			opportunityData.setAttachment(true);
		opportunityData.setAttachmentCount(documentDatas.size());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		opportunityData.setContactPhoto(null);
		br = restTemplate.postForObject(url, opportunityData, BaseResponse.class);
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList=br.getResponseListObject();
		recordCount=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)), Integer.class);	
		isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)),Integer.class);
		isFamilyMemberPresent = objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(2)),Integer.class);
		}
		String basePath="";
		basePath=request.getSession().getServletContext().getRealPath("/")+"/images/user-images/"+partyId;
		if (documentDatas.size()>0) {
			result=FiinfraUtility.uploadAttachments(m,basePath,currentTime);
		}
		List<String> responseList=new ArrayList<>();
		responseList.add(result);
		if(result.equals("success")){
			if(documentDatas.size()>0){
				responseList.add("images/user-images/"+partyId+"/"+documentData.getFileName());
			}
		}
		logger.info("isFamilyMemberPresent in WEB====="+isFamilyMemberPresent);
		responseList.add(String.valueOf(isPanExist));
		responseList.add(String.valueOf(isFamilyMemberPresent));
		
		String eventTextXML="usp_pp_DC_INP_savePersonalInformation("+partyId+","+FiinfraUtility.getOpportunityDataXML(opportunityData)+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.DC_PERSONAL_INFO_DETAILS);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		
		objectMapper.writeValue(out, responseList);
	}
	

	public void getFinancialStatusList(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info("URL --> " + url);
		int questionBankId;
		int sectionTypeId ;
		sectionTypeId = Integer.parseInt(request.getParameter("sectionTypeId"));
		questionBankId = Integer.parseInt(request.getParameter("questionBankId"));
		
		url = URL_GET_DC_FINANCIALSTATUS_LIST+userSession.getName()+"/1234";

		int buId=userSession.getBuId();
		int partyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("sectionTypeId", sectionTypeId);
		uriCB.queryParam("questionBankId", questionBankId);
		
		BaseResponse<QuestionDetails> br = new BaseResponse<QuestionDetails>();
		logger.info("-----------Before Calling APP In Web(getFinancialStatusList)-----------");
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		logger.info("-----------After Calling APP In Web(getFinancialStatusList)-----------");
		List<QuestionDetails> questionDatas=new ArrayList<>();
		
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			questionDatas=br.getResponseListObject();
		logger.info("questionDatas========"+questionDatas);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, questionDatas);
	}
	

	
	@SuppressWarnings("unchecked")
	public void saveDCFutureFinancialExpectations(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		logger.info("URL --> " + url);
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_UPDATE_DC_FUTURE_FINANCIALEXPECTATIONS_LIST+userSession.getName()+"/1234";
		sectionName = "Future Financial Expectation";
		
		int partyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());
		
		
		int buId=Integer.parseInt(request.getSession().getAttribute("dcInputBuId").toString());

		int lastModifiedBy = userSession.getUserId();
		String result="success";
		String goalDataXml=request.getParameter("goalDataXml");
		logger.info("goalDataXml:----"+goalDataXml);
		GoalData goalData=new GoalData();
		goalData.setGoalDataXml(goalDataXml);
		goalData.setPartyId(partyId);
		goalData.setBuId(buId);
		goalData.setLastModifiedBy(lastModifiedBy);
		logger.info("Json String:--"+objectMapper.writeValueAsString(goalData));
		BaseResponse<Integer> br = new BaseResponse<Integer>();
//		opportunityData.setContactPhoto(null);
		br = restTemplate.postForObject(url, goalData, BaseResponse.class);
		int recordCount=0;
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Integer.class);
		
		String eventTextXML="usp_pp_DC_INP_saveFutureFinancialExpectation("+partyId+","+goalDataXml+","+userSession.getUserId()+")";
		logger.info("eventTextXML========="+eventTextXML);
				
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.DC_FUTURE_FINANCIALEXPECTATIONS);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, recordCount);
	}
	
	
	public void getFamilyMemberList(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		logger.info("URL --> " + url);
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_FAMILYMEMBER_LIST+userSession.getName()+"/1234";
		logger.info("in getFamilyMemberList");
		
		int partyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());
		int buId=Integer.parseInt(request.getSession().getAttribute("dcInputBuId").toString());
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		
		BaseResponse<UserData> br = new BaseResponse<UserData>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<UserData> userDatas=new ArrayList<>();
		
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			userDatas=br.getResponseListObject();
		logger.info("questionDatas========"+userDatas);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, userDatas);
	}
	
@SuppressWarnings("unchecked")	
public void submitDcInput(HttpServletRequest request,
		HttpServletResponse response) throws IOException{
	int recordCount=0;
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	url = URL_SUBMIT_DCINPUT+userSession.getName()+"/1234";
	sectionName = "Submiting Dc Input";
	int buId=userSession.getBuId();
	partyId=userSession.getPartyId();
	int dcInputPartyId=0;
	int dcInputBuId=0;
	boolean isAnalysisReportGenration=false;
	boolean isActionPlanGeneration=false;
	int analysisReportType=0;
	try{
		dcInputPartyId=Integer.parseInt(request.getParameter("dcInputPartyId").toString());
		dcInputBuId=Integer.parseInt(request.getParameter("dcInputBuId").toString());
		try{
			isAnalysisReportGenration=Boolean.parseBoolean(request.getParameter("isAnalysisReportGenration"));
			isActionPlanGeneration=Boolean.parseBoolean(request.getParameter("isActionPlanGeneration"));
			analysisReportType =Integer.parseInt(request.getParameter("analysisReportType"));
		}catch(Exception e){
			
		}
		
		
		if(dcInputPartyId==0){
			dcInputPartyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());
			dcInputBuId=Integer.parseInt(request.getSession().getAttribute("dcInputBuId").toString());
		}
	}catch(Exception e){
		dcInputPartyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());
		dcInputBuId=Integer.parseInt(request.getSession().getAttribute("dcInputBuId").toString());
		isAnalysisReportGenration=Boolean.parseBoolean(request.getParameter("isAnalysisReportGenration"));
		isActionPlanGeneration=Boolean.parseBoolean(request.getParameter("isActionPlanGeneration"));
		analysisReportType =Integer.parseInt(request.getParameter("analysisReportType"));
		
		logger.info("isAnalysisReportGenration==="+isAnalysisReportGenration);
		logger.info("isActionPlanGeneration==="+isActionPlanGeneration);
		logger.info("analysisReportType==="+analysisReportType);
	}
	request.getSession().setAttribute("dcInputPartyId",dcInputPartyId);
	request.getSession().setAttribute("dcInputBuId",dcInputBuId);
	int createdBy = userSession.getUserId();
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", dcInputPartyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("createdBy", createdBy);
	uriCB.queryParam("isAnalysisReportGenration", isAnalysisReportGenration);
	uriCB.queryParam("isActionPlanGeneration", isActionPlanGeneration);
	uriCB.queryParam("analysisReportType", analysisReportType);
	BaseResponse<Integer> br = new BaseResponse<Integer>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	logger.info("status============"+br.getStatus());
	
	String eventTextXML="usp_pp_DC_SubmitDCTool("+partyId+","+createdBy+","+buId+","+isAnalysisReportGenration+","+isActionPlanGeneration+")";
	logger.info("eventTextXML========="+eventTextXML);
	
	
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	
	Audit audit = new Audit();
	audit.setActionByPartyId(partyId);
	audit.setActionByUserID(createdBy);
	audit.setEventID(FiinfraConstants.DC_SUBMIT_DC_INPUT);
	audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
	audit.setSourceModule(SOURCE_MODEULE);
	audit.setSourceScreen(sectionName);
	audit.setEventTextXML(eventTextXML);
	FrameworkUtil.audit(audit);
	if(isAnalysisReportGenration==true)
	{
		request.getSession().setAttribute("dcInputDocId_AnalysisReport","12345");
	}
	if(isActionPlanGeneration==true)
	{
//		commented as new Report generation is logic is building
//		generateBiasedActionPlan(dcInputPartyId,buId,userSession.getName(),request.getSession().getServletContext()
//				.getRealPath("/"),userSession.getThemeName());	
	}
	
	Notification notification=null;
	notification=new Notification();
	notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
	notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
	notification.setNotifyPartyID(dcInputPartyId);
	notification.setNotifyEventID(FiinfraConstants.ANALYSIS_REPORT_GENERATION);
//	notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
	notification.setBuId(buId);
	notification.setSessionID(request.getSession().getId());
	FrameworkUtil.notify(notification);
	
	objectMapper.writeValue(out, recordCount);
}

public void submitDcInput1(HttpServletRequest request,
		HttpServletResponse response) throws IOException{
	int recordCount=0;
	boolean isAnalysisReportGenration=false;
	boolean isActionPlanGeneration=false;
	String userName=request.getParameter("userName");
	int dcInputPartyId=Integer.parseInt(request.getParameter("dcInputPartyId"));
	int buId=Integer.parseInt(request.getParameter("buId"));
	partyId=Integer.parseInt(request.getParameter("partyId"));
	int createdBy = Integer.parseInt(request.getParameter("createdBy"));
	int roleId= Integer.parseInt(request.getParameter("roleId"));
	String leadName=request.getParameter("opportunityName");
	String theme="Magento";
	try{
		theme=request.getParameter("theme");
	}catch(Exception e){
		theme="Magento";
	}
	
	UserSession userSession=new UserSession();
	HttpSession httpSession=request.getSession(true);
	userSession.setUserName(userName);
	userSession.setBuId(buId);
	userSession.setPartyId(partyId);
	userSession.setRoleId(roleId);
	userSession.setId(createdBy);
	userSession.setUserId(createdBy);
	userSession.setIsForceChangePasswordOnLogin(false);
	userSession.setSuccessfulLoginCount(1);
	userSession.setThemeName(theme);
	httpSession.setAttribute("userSession", userSession);
	httpSession.setAttribute("dcInputPartyId", dcInputPartyId);
	httpSession.setAttribute("dcInputBuId", buId);
	httpSession.setAttribute("leadName", leadName);
	url = URL_SUBMIT_DCINPUT+userName+"/1234";
	sectionName = "Submiting Dc Input";
	try
	{
		isAnalysisReportGenration=Boolean.parseBoolean(request.getParameter("isAnalysisReportGenration"));
		isActionPlanGeneration=Boolean.parseBoolean(request.getParameter("isActionPlanGeneration"));
		logger.info("isAnalysisReportGenration==="+isAnalysisReportGenration);
		logger.info("isActionPlanGeneration==="+isActionPlanGeneration);
	}
	catch(Exception e)
	{
		
	}
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", dcInputPartyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("createdBy", createdBy);
	uriCB.queryParam("isAnalysisReportGenration", isAnalysisReportGenration);
	uriCB.queryParam("isActionPlanGeneration", isActionPlanGeneration);
	BaseResponse<Integer> br = new BaseResponse<Integer>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	logger.info("status============"+br.getStatus());

	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	
	Audit audit = new Audit();
	audit.setActionByPartyId(partyId);
	audit.setActionByUserID(createdBy);
	audit.setEventID(FiinfraConstants.DC_SUBMIT_DC_INPUT);
	audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
	audit.setSourceModule(SOURCE_MODEULE);
	audit.setSourceScreen(sectionName);
	FrameworkUtil.audit(audit);
	if(isAnalysisReportGenration==true)
	{
		request.getSession().setAttribute("dcInputDocId_AnalysisReport","12345");
	}
	try{
		if(isActionPlanGeneration==true)
		{
//	generateActionPlan(dcInputPartyId,buId,false,userName,request.getSession(true).getServletContext()
//			.getRealPath("/"),userSession.getThemeName());
	generateBiasedActionPlan(dcInputPartyId,buId,userName,request.getSession(true).getServletContext()
			.getRealPath("/"),userSession.getThemeName());
		}
	}catch(Exception e){
		logger.error(e);
	}
	objectMapper.writeValue(out, "success");
	
	request.getSession().invalidate();
	
}

public void generateActionPlan(int partyId,int buId,boolean isBiased,String username,String contextPath,String theme) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException{
	url = URL_GET_ACTIONPLAN_DETAILS+username+"/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", partyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("isBiased", isBiased);
	BaseResponse<Object> br = new BaseResponse<Object>();
	List<Object> allDataList=new ArrayList<>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		allDataList=br.getResponseListObject();
	
	List<APDetails> apDetailsList=new ArrayList<>();
	List<APDetails> goalList=new ArrayList<>();
	List<APDetails> investmentsList=new ArrayList<>();
	List<APDetails> riskPlanningList=new ArrayList<>();
	
	for(HashMap<String,Object> apDetails:(List<HashMap<String,Object>>)objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(0)), List.class)){
		apDetailsList.add((APDetails) objectMapper.readValue(objectMapper.writeValueAsString(apDetails), APDetails.class));
	}
	for(HashMap<String,Object> apDetails:(List<HashMap<String,Object>>)objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(2)), List.class)){
		goalList.add((APDetails) objectMapper.readValue(objectMapper.writeValueAsString(apDetails), APDetails.class));
	}
	for(HashMap<String,Object> apDetails:(List<HashMap<String,Object>>)objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(3)), List.class)){
		investmentsList.add((APDetails) objectMapper.readValue(objectMapper.writeValueAsString(apDetails), APDetails.class));
	}
	for(HashMap<String,Object> apDetails:(List<HashMap<String,Object>>)objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(4)), List.class)){
		riskPlanningList.add((APDetails) objectMapper.readValue(objectMapper.writeValueAsString(apDetails), APDetails.class));
	}
	
	GeneratePFActionPlan.apDetailsList=apDetailsList;
	GeneratePFActionPlan.apDetails=(APDetails) objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(1)), APDetails.class);
	GeneratePFActionPlan.goalList=goalList;
	GeneratePFActionPlan.investmentsList=investmentsList;
	GeneratePFActionPlan.riskPlanningList=riskPlanningList;
	GeneratePFActionPlan.contextPath=contextPath;
	GeneratePFActionPlan.basePath=GeneratePFActionPlan.apDetails.getBasePath();
	GeneratePFActionPlan.partyId=partyId;
	if(theme.equals("Green")){
		GeneratePFActionPlan.r=100;
		GeneratePFActionPlan.g=147;
		GeneratePFActionPlan.b=53;
		GeneratePFActionPlan.actionPlanImageName="ActionPlan_Green.png";
	}else if(theme.equals("Red")){
		GeneratePFActionPlan.r=202;
		GeneratePFActionPlan.g=81;
		GeneratePFActionPlan.b=78;
		GeneratePFActionPlan.actionPlanImageName="ActionPlan_Red.png";
	}else if(theme.equals("Blue")){
		GeneratePFActionPlan.r=29;
		GeneratePFActionPlan.g=135;
		GeneratePFActionPlan.b=189;
		GeneratePFActionPlan.actionPlanImageName="ActionPlan_Blue.png";
	}else if(theme.equals("Magento")){
		GeneratePFActionPlan.r=152;
		GeneratePFActionPlan.g=36;
		GeneratePFActionPlan.b=85;
		GeneratePFActionPlan.actionPlanImageName="ActionPlan_Magento.png";
	}else{
		GeneratePFActionPlan.r=152;
		GeneratePFActionPlan.g=36;
		GeneratePFActionPlan.b=85;
		GeneratePFActionPlan.actionPlanImageName="ActionPlan_Magento.png";
	}
		
	GeneratePFActionPlan.generateAp();
	
	GenerateClientActionPlan.apDetailsList=apDetailsList;
	GenerateClientActionPlan.apDetails=(APDetails) objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(1)), APDetails.class);
	GenerateClientActionPlan.goalList=goalList;
	GenerateClientActionPlan.investmentsList=investmentsList;
	GenerateClientActionPlan.riskPlanningList=riskPlanningList;
	GenerateClientActionPlan.contextPath=contextPath;
	GenerateClientActionPlan.basePath=GenerateClientActionPlan.apDetails.getBasePath();
	GenerateClientActionPlan.partyId=partyId;
	if(theme.equals("Green")){
		GenerateClientActionPlan.r=100;
		GenerateClientActionPlan.g=147;
		GenerateClientActionPlan.b=53;
		GenerateClientActionPlan.actionPlanImageName="ActionPlan_dfda.png";
	}else if(theme.equals("Red")){
		GenerateClientActionPlan.r=202;
		GenerateClientActionPlan.g=81;
		GenerateClientActionPlan.b=78;
		GenerateClientActionPlan.actionPlanImageName="ActionPlan_Red.png";
	}else if(theme.equals("Blue")){
		GenerateClientActionPlan.r=29;
		GenerateClientActionPlan.g=135;
		GenerateClientActionPlan.b=189;
		GenerateClientActionPlan.actionPlanImageName="ActionPlan_Blue.png";
	}else if(theme.equals("Magento")){
		GenerateClientActionPlan.r=152;
		GenerateClientActionPlan.g=36;
		GenerateClientActionPlan.b=85;
		GenerateClientActionPlan.actionPlanImageName="ActionPlan.png";
	}else{
		GenerateClientActionPlan.r=152;
		GenerateClientActionPlan.g=36;
		GenerateClientActionPlan.b=85;
		GenerateClientActionPlan.actionPlanImageName="ActionPlan.png";
	}
	GenerateClientActionPlan.generateAp("");
	
}

public void generateBiasedActionPlan(int partyId,int buId,String username,String contextPath,String theme) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException{
	url = URL_GET_ACTIONPLAN_DETAILS+username+"/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", partyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("isBiased", true);
	BaseResponse<Object> br = new BaseResponse<Object>();
	List<Object> allDataList=new ArrayList<>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		allDataList=br.getResponseListObject();
	
	List<APDetails> apDetailsList=new ArrayList<>();
	List<APDetails> goalList=new ArrayList<>();
	List<APDetails> investmentsList=new ArrayList<>();
	List<APDetails> riskPlanningList=new ArrayList<>();
	
	for(HashMap<String,Object> apDetails:(List<HashMap<String,Object>>)objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(0)), List.class)){
		apDetailsList.add((APDetails) objectMapper.readValue(objectMapper.writeValueAsString(apDetails), APDetails.class));
	}
	for(HashMap<String,Object> apDetails:(List<HashMap<String,Object>>)objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(2)), List.class)){
		goalList.add((APDetails) objectMapper.readValue(objectMapper.writeValueAsString(apDetails), APDetails.class));
	}
	for(HashMap<String,Object> apDetails:(List<HashMap<String,Object>>)objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(3)), List.class)){
		investmentsList.add((APDetails) objectMapper.readValue(objectMapper.writeValueAsString(apDetails), APDetails.class));
	}
	for(HashMap<String,Object> apDetails:(List<HashMap<String,Object>>)objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(4)), List.class)){
		riskPlanningList.add((APDetails) objectMapper.readValue(objectMapper.writeValueAsString(apDetails), APDetails.class));
	}
	
	
	GenerateClientActionPlan.apDetailsList=apDetailsList;
	GenerateClientActionPlan.apDetails=(APDetails) objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(1)), APDetails.class);
	GenerateClientActionPlan.goalList=goalList;
	GenerateClientActionPlan.investmentsList=investmentsList;
	GenerateClientActionPlan.riskPlanningList=riskPlanningList;
	GenerateClientActionPlan.contextPath=contextPath;
	GenerateClientActionPlan.basePath=GenerateClientActionPlan.apDetails.getBasePath();
	GenerateClientActionPlan.partyId=partyId;
	if(theme.equals("Green")){
		GenerateClientActionPlan.r=100;
		GenerateClientActionPlan.g=147;
		GenerateClientActionPlan.b=53;
		GenerateClientActionPlan.actionPlanImageName="ActionPlan_dfda.png";
	}else if(theme.equals("Red")){
		GenerateClientActionPlan.r=202;
		GenerateClientActionPlan.g=81;
		GenerateClientActionPlan.b=78;
		GenerateClientActionPlan.actionPlanImageName="ActionPlan_Red.png";
	}else if(theme.equals("Blue")){
		GenerateClientActionPlan.r=29;
		GenerateClientActionPlan.g=135;
		GenerateClientActionPlan.b=189;
		GenerateClientActionPlan.actionPlanImageName="ActionPlan_Blue.png";
	}else if(theme.equals("Magento")){
		GenerateClientActionPlan.r=152;
		GenerateClientActionPlan.g=36;
		GenerateClientActionPlan.b=85;
		GenerateClientActionPlan.actionPlanImageName="ActionPlan.png";
	}else{
		GenerateClientActionPlan.r=152;
		GenerateClientActionPlan.g=36;
		GenerateClientActionPlan.b=85;
		GenerateClientActionPlan.actionPlanImageName="ActionPlan.png";
	}
	GenerateClientActionPlan.generateAp("_All_Axis");
	
}
public ModelAndView showAnalysisReportPDF(HttpServletRequest request,
		HttpServletResponse response) throws IOException{
	int createdBy=0;
	logger.info("in showAnalysisReportPDF dcInputPartyId=="+request.getParameter("dcInputPartyId"));
	int dcInputPartyId= Integer.parseInt(request.getParameter("dcInputPartyId"));
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	String buId=request.getSession().getAttribute("dcInputBuId").toString();
	String theme="Magento";
	try{
//		theme=request.getParameter("theme");
		theme=userSession.getThemeName();
	}catch(Exception e1){
		theme="Magento";
	}
	
	String serverPath=request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath());
	createdBy = userSession.getUserId();
	DCOutputData output = new DCOutputData();
	url = URL_SHOW_ANALYSISREPORTPDF+userSession.getName()+"/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", dcInputPartyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("createdBy", createdBy);
	
	BaseResponse<DCOutputData> br = new BaseResponse<DCOutputData>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		output = objectMapper.readValue(
				objectMapper.writeValueAsString(br.getResponseObject()),
				DCOutputData.class);
	HttpSession session = request.getSession(true);
	session.setAttribute("output", output);
	logger.info("output data========"+output);
	ModelAndView mav=null;
//	if(businessUnitId_Fiinfra.equals(buId))
//	{  
////		mav = new ModelAndView("utility/FiinfraDC/DCHomeFiinfra");
//		mav = new ModelAndView("utility/ShubhchintakDC/AnalysisReport");
//		
//		
//	}
//	else{
		mav = new ModelAndView("utility/ShubhchintakDC/AnalysisReport");
		logger.info("Its  Bu="+buId);
//	}
	
	mav.addObject("output", output);
	mav.addObject("themeName", theme);
	return mav;// new ModelAndView("common/query", "queryDatas",
}


public ModelAndView showAnalysisReportPDF1(HttpServletRequest request,
		HttpServletResponse response) throws IOException{
	int createdBy=0;
	int dcInputPartyId= Integer.parseInt(request.getParameter("dcInputPartyId"));
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	String buId="";
	String theme="Magento";
	try{
		buId=request.getSession().getAttribute("dcInputBuId").toString();
		createdBy= userSession.getUserId();
	}catch(Exception e){
		try{
		String userName=request.getParameter("userName");
		dcInputPartyId=Integer.parseInt(request.getParameter("dcInputPartyId"));
		buId=request.getParameter("buId");
		partyId=Integer.parseInt(request.getParameter("partyId"));
		createdBy = Integer.parseInt(request.getParameter("createdBy"));
		int roleId= Integer.parseInt(request.getParameter("roleId"));
		String leadName=request.getParameter("opportunityName");		
		try{
			theme=request.getParameter("theme");
		}catch(Exception e1){
			theme="Magento";
		}
		userSession=new UserSession();
		HttpSession httpSession=request.getSession(true);
		userSession.setUserName(userName);
		userSession.setBuId(Integer.valueOf(buId));
		userSession.setPartyId(partyId);
		userSession.setRoleId(roleId);
		userSession.setId(createdBy);
		userSession.setUserId(createdBy);
		userSession.setIsForceChangePasswordOnLogin(false);
		userSession.setSuccessfulLoginCount(1);
		userSession.setThemeName(theme);
		httpSession.setAttribute("userSession", userSession);
		httpSession.setAttribute("dcInputPartyId", dcInputPartyId);
		httpSession.setAttribute("dcInputBuId", buId);
		httpSession.setAttribute("leadName", leadName);
		}catch(Exception e2){
			buId=businessUnitId_Shubhachintak;
			createdBy= 1;
		}
	}
	String serverPath=request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath());
	DCOutputData output = new DCOutputData();
	url = URL_SHOW_ANALYSISREPORTPDF+userSession.getUserName()+"/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", dcInputPartyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("createdBy", createdBy);
	
	BaseResponse<DCOutputData> br = new BaseResponse<DCOutputData>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		output = objectMapper.readValue(
				objectMapper.writeValueAsString(br.getResponseObject()),
				DCOutputData.class);
	
	String url1 = URL_GET_SECTIONS_TO_SHOW_IN_DC + userSession.getUserName() + "/1234";
	
	logger.info("url:-"+url);
	uriCB = UriComponentsBuilder.fromHttpUrl(url1);
	uriCB.queryParam("partyId", dcInputPartyId);
	uriCB.queryParam("buId", buId);
	
	BaseResponse<Integer> br1 = new BaseResponse<Integer>();
	br1 = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
			BaseResponse.class).getBody();
	List<Integer> objSectionSpecificDcData = new ArrayList<>();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		objSectionSpecificDcData = br1.getResponseListObject();
	
	logger.info("PartyAttributeDatas in WEB======="+objSectionSpecificDcData);	
	String fpsection= new String();
	String fpsection1= new String();
	for(int i=0;i<objSectionSpecificDcData.size();i++)
	{
		fpsection=fpsection+","+objSectionSpecificDcData.get(i);
		fpsection1=fpsection1+" "+objSectionSpecificDcData.get(i);
		
	}
	HttpSession session = request.getSession(true);
	session.setAttribute("output", output);
	
	
	ModelAndView mav=null;

		mav = new ModelAndView("utility/ShubhchintakDC/AnalysisReportDIY");
		logger.info("Its Shubhachitak Bu");
	mav.addObject("themeName", theme);
	mav.addObject("output", output);
	mav.addObject("fpsection", fpsection);
	mav.addObject("fpsection1", fpsection1);
	return mav;// new ModelAndView("common/query", "queryDatas",
}
	
public void displayCashFlowBar(HttpServletRequest request,
		HttpServletResponse response) throws IOException{
	int dcInputPartyId= Integer.parseInt(request.getParameter("dcInputPartyId"));
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	int buId=userSession.getBuId();
	url = URL_GET_CASHFLOWBAR+userSession.getName()+"/1234";
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", dcInputPartyId);
	uriCB.queryParam("buId", buId);
	
	BaseResponse<String> br = new BaseResponse<String>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	String [] cash=null; 
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		//cash=br.getResponseObject();
		cash=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), String[].class);
	logger.info("cash========="+cash);
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, cash);
}

public void uploadGraphImage(HttpServletRequest request,
		HttpServletResponse response) throws IOException{
	int dcInputPartyId= Integer.parseInt(request.getParameter("dcInputPartyId"));
	 String barChartImageData=request.getParameter("barChartImageData");
	 String content="";
	 if(barChartImageData !=null){
		 content = barChartImageData.substring(barChartImageData
				.indexOf(",") + 1);	
		 
	 BASE64Decoder decoder = new BASE64Decoder();
		byte[] decodedBytes = decoder.decodeBuffer(content);
		logger.info("Decoded upload data : " + decodedBytes.length);
	 UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	int buId=userSession.getBuId();
	int createdBy=userSession.getUserId();
	
	String uploadFile = dcInputPartyId+".png";
	
	String realPath = request.getSession().getServletContext()
			.getRealPath("/");
	logger.info("Path is:----" + realPath);
	File file = new File(realPath + "/PathFinder/pdf", ""
			+ dcInputPartyId);
	
	
	logger.info(">>>>>>>>>>>>>>>>>>file name is>>>>>>>"
			+ uploadFile);
	File fileToCreate = new File(realPath + "/PathFinder/pdf/"
			+ dcInputPartyId);

	if (file.exists()) {
		logger.info(">>>>>>>>>>>>>>>>>>in if>>>>>>>");
		FileUtils.deleteDirectory(file);
		file = new File(realPath + "/PathFinder/pdf", ""
				+ dcInputPartyId);
		file.mkdirs();
	} else {
		logger.info(">>>>>>>>>>>>>>>>>>in else>>>>>>>");
	}
	
	BufferedImage image = ImageIO.read(new ByteArrayInputStream(
			decodedBytes));
	if (image == null) {
	}
	File temp=new File("D:\\"+dcInputPartyId);
	if (temp.exists()) {
		logger.info(">>>>>>>>>>>>>>>>>>in if>>>>>>>");
		FileUtils.deleteDirectory(file);
		temp=new File("D:\\"+dcInputPartyId);
		temp.mkdirs();
	} else {
		temp.mkdirs();
		logger.info(">>>>>>>>>>>>>>>>>>in else>>>>>>>");
	}
	File f = new File("D:\\"+dcInputPartyId+"\\cashFlowBar.png");
	ImageIO.write(image, "png", f);
	
	try{
		fileToCreate=new File(realPath + "/PathFinder/pdf/"
				+ dcInputPartyId+"/"+uploadFile);
		FileUtils.copyFile(f, fileToCreate);}
		catch(Exception e){
			
		}
	FileUtils.deleteDirectory(temp);
	 }
}

public void viewOutputAsPdfFromHtml(HttpServletRequest request,
		HttpServletResponse response) throws IOException{
	FileOutputStream fileOutputStreamForWritingHtml = null;
	final ServletContext context = config.getServletContext();
	File file;
	Client client = new Client("fiinfra", "c9dfe99bda3c5ec77067fb1a4611b299");
	String realPath ="D:\\FFreedom-DI\\Attachments\\";
	String content=request.getParameter("htmlString");
	String htmlString=request.getParameter("htmlString");
	int dcInputPartyId= Integer.parseInt(request.getParameter("dcInputPartyId"));
	String opportunityName = request.getParameter("opportunityName");
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	Integer buId=userSession.getBuId();
	int createdBy=userSession.getUserId();
	
	logger.info("opportunity Name in viewOutputAsPdfFromHtml="+opportunityName);
	StringBuilder contentBuilder = new StringBuilder();
	InputStream is;
	is = context
			.getResourceAsStream("css/"+userSession.getThemeName()+"_output.css");
//	if(businessUnitId_Fiinfra.equals(buId.toString()))
//	{  
//		is = context
//				.getResourceAsStream("css/Axis_dc_output.css");
//	}
//	else if(businessUnitId_Spa.equals(buId.toString())){
//		
//		
//		is = context
//				.getResourceAsStream("css/SPA.css");
//	}
//else if(businessUnitId_Shubhachintak.equals(buId.toString())){
//		
//		
//	is = context
//			.getResourceAsStream("css/Axis_dc_output.css");
//	}
//	else{
//		
//		is = context
//				.getResourceAsStream("css/dfdaoutput.css");
//	}
	try {
		BufferedReader in = new BufferedReader(
				new InputStreamReader(is));
		String str;
		while ((str = in.readLine()) != null) {
			contentBuilder.append(str);
		}
		in.close();
	} catch (IOException e) {
		
		logger.error(e);
	}
	String messageBody = null;
	content = contentBuilder.toString();
	content = "<head><style type=\"text/css\">" + content
			+ "</style></head>" + htmlString;
	realPath ="D:\\FFreedom-DI\\Attachments\\";
	try {
		file = new File(realPath+"\\PathFinder\\pdf\\"+dcInputPartyId);
		if (file.exists()) {
			FileUtils.deleteDirectory(file);
			file= new File(realPath+"\\PathFinder\\pdf\\"+dcInputPartyId);
			file.mkdirs();
		} else {
			file.mkdirs();
		}
		
		file = new File(realPath+"\\PathFinder\\pdf\\"+dcInputPartyId+"\\"+dcInputPartyId+".htm");
	//	file = new File(realPath+"\\PathFinder\\pdf\\"+dcInputPartyId+"\\"+"Output.htm");
		fileOutputStreamForWritingHtml = new FileOutputStream(file);
		byte[] contentInBytes = content.getBytes();
		fileOutputStreamForWritingHtml.write(contentInBytes);
		fileOutputStreamForWritingHtml.flush();
		fileOutputStreamForWritingHtml.close();
		Notification notification=null;
		notification=new Notification();
		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(dcInputPartyId);
		notification.setNotifyEventID(FiinfraConstants.ANALYSIS_REPORT_GENERATION);
//		notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
		notification.setBuId(buId);
		notification.setSessionID(request.getSession().getId());
		FrameworkUtil.notify(notification);
		
//	}
} catch (IOException e) {
	
	logger.error(e);
} finally {
	try {
		if (fileOutputStreamForWritingHtml != null) {
			fileOutputStreamForWritingHtml.close();
		}
	} catch (IOException e) {
		logger.error(e);
	}
}
	
	try{
	
	ByteArrayOutputStream out = new ByteArrayOutputStream();
	HtmlCleaner cleaner = new HtmlCleaner();
	CleanerProperties props = cleaner.getProperties();
	TagNode node = cleaner.clean(new FileInputStream(realPath+"\\PathFinder\\pdf\\"+dcInputPartyId+"\\"+dcInputPartyId+".htm"));
	new PrettyXmlSerializer(props).writeToStream(node, out);
	
	
	fileOutputStreamForWritingHtml = new FileOutputStream(realPath+"\\PathFinder\\pdf\\"+dcInputPartyId+"\\"+dcInputPartyId+".pdf");
    client.convertFile(realPath+"\\PathFinder\\pdf\\"+dcInputPartyId+"\\"+dcInputPartyId+".htm", fileOutputStreamForWritingHtml);
    fileOutputStreamForWritingHtml.close();
	
    fileOutputStreamForWritingHtml.close();
    out.flush();
	out.close();
	
	OpportunityData leadDetailsBean=new OpportunityData();
	HttpSession session = request.getSession(true);
	DCOutputData output = new DCOutputData();
	output =(DCOutputData) session.getAttribute("output");
	logger.info("output::"+output.getOpportunityName());
	leadDetailsBean.setPartyId(Integer.parseInt(output.getPartyId()));
	leadDetailsBean.setName(output.getOpportunityName());
	leadDetailsBean.setPartnerName(output.getPartnerName());
	leadDetailsBean.setOutputPdf("D:\\FFreedom-DI\\Attachments"
					+ "\\PathFinder\\pdf\\"+output.getPartyId()+"\\"+output.getPartyId()+".pdf");
	leadDetailsBean.setFileName("PathFinder Output-"+output.getOpportunityName()+".pdf");
	}
	catch(Exception e)
	{
		
	}
	finally{
		try {
			if (fileOutputStreamForWritingHtml != null) {
				fileOutputStreamForWritingHtml.close();
			}
		} catch (IOException e) {
			logger.error(e);
		}
	}
	
}
public void checkMinimumDataForAnalysisReport(HttpServletRequest request,
		HttpServletResponse response) throws IOException
{
//	List sectionDataList<> = new ArrayList();
	int partyId;
	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	Integer buId=userSession.getBuId();
	int createdBy=userSession.getUserId();

	//partyId=Integer.parseInt(request.getSession().getAttribute("partyId").toString());
	 partyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());
	url = URL_CHECK_MINIMUM_DATA_FOR_ANALYSISREPORT+userSession.getName()+"/1234";
	//String xmlString=request.getParameter("xmlString");
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("partyId", partyId);
	uriCB.queryParam("buId", buId);
	uriCB.queryParam("createdBy", createdBy);
	
	BaseResponse<SectionData> br = new BaseResponse<SectionData>();
	br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	SectionData objSectionData = new SectionData();
	if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		objSectionData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), SectionData.class);
	//String pageDataCount=null;
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, objSectionData);
	//pageDataCount=(String)allDataList.get(0);
}

public void generateReport(HttpServletRequest request,
		HttpServletResponse response)throws IOException
{
	  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
     String result="";
     logger.info("In GENERATE REPORT--------");
      int dcInputPartyId=Integer.parseInt(request.getParameter("dcInputPartyId"));
      String pdfFilePath = "D://FFreedom-DI//Attachments//PathFinder//pdf//"+dcInputPartyId+"//"+dcInputPartyId+".pdf";
//      String pdfFilePath = "D://"+dcInputPartyId+".pdf";
      String themeName = userSession.getThemeName();
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
      logger.info("Report URL="+reportUrl);
      File file=null;
      file = new File("D://FFreedom-DI//Attachments//PathFinder//pdf//"+dcInputPartyId);
		if (file.exists()) {
			FileUtils.deleteDirectory(file);
			file= new File("D://FFreedom-DI//Attachments//PathFinder//pdf//"+dcInputPartyId);
			file.mkdirs();
		} else {
			file.mkdirs();
		}
      try {
          convertToPDF(reportUrl, pdfFilePath);
        //  convertWebToPdf(reportUrl, pdfFilePath,dcInputPartyId);
      } catch (IOException e) {
          // TODO Auto-generated catch block
    	  logger.error(e);
          result= "failure";
      }
      result= "Success";
  	PrintWriter out = null;
  	out = response.getWriter();
  	response.setContentType("application/json");
  	objectMapper.writeValue(out, result);
      
}


public void convertToPDF(String htmlPath, String pdfFilePath) throws IOException
		{
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
        logger.error("Error Generating PDF : ", why);
    }
    catch(IOException exc) {
    	logger.error("Error Generating PDF : ", exc);
    } finally{
    	if(fileStream != null){
    		fileStream.close();
    	}
    }
		}



	public void getLifeInsuranceForAllMethods(HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
//		List sectionDataList<> = new ArrayList();
		int partyId;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		Integer buId=userSession.getBuId();
		int createdBy=userSession.getUserId();

		//partyId=Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		 partyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());
		 logger.info("partyId==="+partyId);
		url = URL_GET_LI_ALL_METHOD+userSession.getUserName()+"/1234";
		//String xmlString=request.getParameter("xmlString");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		
		BaseResponse<String> br = new BaseResponse<String>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<String> resultList=new ArrayList<>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList=br.getResponseListObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, resultList);
		//pageDataCount=(String)allDataList.get(0);
	}
	
	public void saveLifeInsuranceMethod(HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
//		List sectionDataList<> = new ArrayList();
		int partyId;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		Integer buId=userSession.getBuId();
		int createdBy=userSession.getUserId();
		 partyId=Integer.parseInt(request.getSession().getAttribute("dcInputPartyId").toString());
		 logger.info("partyId==="+partyId);
		url = URL_SAVE_LI_METHOD+userSession.getUserName()+"/1234";
		//String xmlString=request.getParameter("xmlString");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("liMethodSelect", Integer.valueOf(request.getParameter("liMethodSelect")));
		uriCB.queryParam("lastModifiedBy", createdBy);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		Integer recordCount=0;
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount=br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);
	}

	
	public void getxray(HttpServletRequest request,
			HttpServletResponse response) throws IOException 
	{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId= Integer.parseInt(request.getParameter("partyId"));
		int sourceSystemId=31001;
		int questionType=58001;
		
		url = URL_XRAY_TOOL + userSession.getUserName() + "/1234";
		logger.info("url:-" + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("sourceSystemId",sourceSystemId);
		uriCB.queryParam("questionType",questionType);
		
		
		
		logger.info("PPPPPPPPPPPPPPPPPP-------------" + partyId);
		
		BaseResponse<QuestionData> br = new BaseResponse<QuestionData>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<QuestionData> questionDatas=new ArrayList<>();
		
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			questionDatas=br.getResponseListObject();
		
		List lstoptionData =  new ArrayList();
//		for (QuestionData q : questionDatas) {
//			for (OptionData op : q.getOptions()) {
//				//op.setSelected(false);
//				//why to send score on client side
//				//lstoptionData.add(q.getOptions());
//				op.setScore(null);
//			}
//		}
		logger.info("questionDatas========"+questionDatas);
		logger.info("lstoptionData========"+lstoptionData);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, questionDatas);
		
		
//		ModelAndView mav = new ModelAndView("utility/ShubhchintakDC/x-ray");	
//		mav.addObject("questionDatas", questionDatas);
//		//mav.addObject("pagesize", pagesize);
//		return mav;
	}
	
	public void insertXray(HttpServletRequest request,
			HttpServletResponse response,XrayData xrayData) throws IOException 
	{
		try{
		List<Integer> lstResult = new ArrayList<Integer>();
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info("xmlstring in insertXray===="+request.getParameter("XMlString"));
		String XMlString = request.getParameter("XMlString");
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		logger.info("URL --> " + url);
		url = URL_INSERT_XRAY_RECORDS+userSession.getUserName()+"/1234";
		int buId=userSession.getBuId();
		int lastModifiedBy = userSession.getUserId();
		
		xrayData.setPartyId(partyId);
		xrayData.setXmlString(XMlString);
		xrayData.setLastmodifiedBy(lastModifiedBy);
		xrayData.setBuId(buId);
		
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, xrayData, BaseResponse.class);
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			lstResult=br.getResponseListObject();
		
		logger.info("lstResult IN WEB========"+lstResult);
		
//		String eventTextXML="usp_pp_DC_INP_saveCurrentFinancialStatus("+partyId+","+userSession.getUserId()+","+questionBankId+","+sectionTypeId+","+XMlString+")";
//		logger.info("eventTextXML========="+eventTextXML);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
//		Audit audit = new Audit();
//		audit.setActionByPartyId(partyId);
//		audit.setActionByUserID(lastModifiedBy);
//		audit.setEventID(FiinfraConstants.DC_INSERT_FINANCIAL_STATUS_RECORD);
//		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
//		audit.setSourceModule(SOURCE_MODEULE);
//		audit.setSourceScreen(sectionName);
//		audit.setEventTextXML(eventTextXML);
//		FrameworkUtil.audit(audit);
		
		objectMapper.writeValue(out, lstResult);
		}
		catch(Exception e)
		{
			logger.error(e);
		}
	}
	
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Runtime Exception")
	@ExceptionHandler(RuntimeException.class)
	public void exceptionHandling() {
		logger.info("I am in exceptionHandling of WEB");
	}

	
	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	public RestTemplate getRestTemplate() {
		return restTemplate;
	}
	
}