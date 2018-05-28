package in.fiinfra.opportunity.controller;


import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.NotesData;
import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.opportunity.BulkUploadOpportunityData;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.opportunity.OpportunityStageData;
import in.fiinfra.common.opportunity.OpportunityTask;
import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.token.FiinfraToken;
import in.fiinfra.common.token.FiinfraTokenException;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.GridData;
import in.fiinfra.common.util.MD5Encryption;
import in.fiinfra.common.util.RandomPasswordGenerator;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.util.Logger;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;



public class OpportunityController extends MultiActionController{
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	@Value("${businessUnitId_Shubhachintak}")
	private String businessUnitId_Shubhachintak;
	
	@Value("${businessUnitId_Fiinfra}")
	private String businessUnitId_Fiinfra;
	
	private String sectionName;
	final String SOURCE_MODULE = "Opportunity Profile";
	final String SOURCE_MODULE_OPPORTUNITY = "Opportunity";
	String url;
	
	@Value("${URL_GET_OPPORTUNITY_PROFILE_RECORD}")
	private String URL_GET_OPPORTUNITY_PROFILE_RECORD;
	@Value("${URL_UPDATE_OPPORTUNITY_PROFILE}")
	private String URL_UPDATE_OPPORTUNITY_PROFILE;
	@Value("${URL_INSERT_DC_ACTIVATION_RECORD}") 
	private String URL_INSERT_DC_ACTIVATION_RECORD;
	@Value("${URL_INSERT_XRAY_ACTIVATION_RECORD}") 
	private String URL_INSERT_XRAY_ACTIVATION_RECORD;
	@Value("${URL_INSERT_BULK_DC_ACTIVATION}")
	private String URL_INSERT_BULK_DC_ACTIVATION;
	@Value("${URL_GET_OPPORTUNITY_RECORD}")
	private String URL_GET_OPPORTUNITY_RECORD;
	@Value("${URL_GET_OPPORTUNITIES_LIST}")
	private String URL_GET_OPPORTUNITIES_LIST;
	@Value("${URL_INSERT_OPPORTUNITY_RECORD}")
	private String URL_INSERT_OPPORTUNITY_RECORD;
	@Value("${URL_INSERT_BULK_OPPORTUNITY}")
	private String URL_INSERT_BULK_OPPORTUNITY;
	@Value("${URL_GET_OPPORTUNITY_STAGE_LIST}")
	private String URL_GET_OPPORTUNITY_STAGE_LIST;
	@Value("${URL_UPDATE_DC_PERSONALINFORMATION_RECORD}")
	private String URL_UPDATE_DC_PERSONALINFORMATION_RECORD;
	
	@Value("${URL_INSERT_NOTE_RECORD}")
	private String URL_INSERT_NOTE_RECORD;
	@Value("${URL_DELETE_NOTE}")
	private String URL_DELETE_NOTE;
	@Value("${URL_INSERT_DOCUMENT}")
	private String URL_INSERT_DOCUMENT;
	@Value("${URL_DELETE_DOCUMENT}")
	private String URL_DELETE_DOCUMENT;
	
	@Value("${URL_GET_OPPORTUNITIES_TASK}")
	private String URL_GET_OPPORTUNITIES_TASK;
	@Value("${URL_DELETE_OPPORTUNITY}")
	private String URL_DELETE_OPPORTUNITY;
	
	@Value("${URL_GET_SECTIONS_TO_SHOW_IN_DC}")
	private String URL_GET_SECTIONS_TO_SHOW_IN_DC;
	
	@Value("${URL_UPDATE_FPPLANTYPE}")
	private String URL_UPDATE_FPPLANTYPE;
	
	@Value("${REDIRECT_DC_FPT}")
	private String REDIRECT_DC_FPT;
	
	@Value("${SUCCESSFULL_LOGIN}")
	private String SUCCESSFULL_LOGIN;
	
	@Value("${URL_GET_NON_ACCESSIBLE_CONTROLIDS}") 
	private  String URL_GET_NON_ACCESSIBLE_CONTROLIDS;
	
	@Value("${URL_GET_HEIRARCHY_DATA_VP}")
	private String URL_GET_HEIRARCHY_DATA_VP;	
	
	@Value("${URL_XRAY_TOOL}")
	private String URL_XRAY_TOOL;
	
	@Value("${URL_GET_SEND_REPORT}")
	private String URL_GET_SEND_REPORT;
	
	
	private final String DATE_FORMAT_DD_MM_YYYY = "dd-MM-yyyy";
	@Autowired
	Md5PasswordEncoder passwordEncoder;
	
	private File opportunityUpload;
	public File getOpportunityUpload() {
		return opportunityUpload;
	}


	public void setOpportunityUpload(File opportunityUpload) {
		this.opportunityUpload = opportunityUpload;
	}

	
	private List<OpportunityData> lstSuccessOpportunity;
	private List<OpportunityData> lstFailedOpportunity;
	private List<OpportunityData> lstExistingOpportunity;
	OpportunityData opportunityData=new OpportunityData();
	BulkUploadOpportunityData bulkUploadOpportunityData =null;
	
	
	@SuppressWarnings("unchecked")
	public void getSendReport(HttpServletRequest request,HttpServletResponse response,NotifyTemplateData notifyTemplateData) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int ownerpartyId = userSession.getPartyId();
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		url = URL_GET_SEND_REPORT + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	
		uriCB.queryParam("partyId", partyId);
		BaseResponse<OpportunityData> br = new BaseResponse<OpportunityData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<OpportunityData> sendReportDatas = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			sendReportDatas = br.getResponseListObject();
		
		
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, sendReportDatas );
	}

	
	/**
	 * retrieves opportunity list based on the party.
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonGenerationException 
	 */
	@SuppressWarnings("unchecked")
	public ModelAndView getOpportunitiesList(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		String oppSearchValue = request.getParameter("value");
		if(oppSearchValue==null){
			oppSearchValue="";
		}
		ModelAndView mav = new ModelAndView("opportunity/opportunities");	
		mav.addObject("pagesize", pagesize);
		mav.addObject("value", oppSearchValue);
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	public void getOpportunitiesGrid(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		int partyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		int pageSize=request.getParameter("rows")==null?10:Integer.valueOf(request.getParameter("rows").toString());
		int pageNo=request.getParameter("page")==null?0:Integer.valueOf(request.getParameter("page").toString());
		String orderBy=request.getParameter("sidx")==null?"party.LastModifiedDate":request.getParameter("sidx").toString();
		String sord=request.getParameter("sord")==null?"desc":request.getParameter("sord").toString();
		
		
		String oppSearchValue = request.getParameter("value");
		String url = FiinfraUtility.getRestDBURL();
		
		//url = url + "services/opportunity/getOpportunitiesList/"+userSession.getUserName()+"/1234";
		url=URL_GET_OPPORTUNITIES_LIST + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("oppSearchValue", oppSearchValue);
		uriCB.queryParam("nodeId", nodeId);
		uriCB.queryParam("pageNo", pageNo);
		uriCB.queryParam("pageSize", pageSize);
		uriCB.queryParam("orderBy", orderBy);
		uriCB.queryParam("sord", sord);
		BaseResponse<GridData> br = new BaseResponse<GridData>();
		logger.info("-----------Before Calling APP In Web(getOpportunitiesGrid)-----------");
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		logger.info("-----------After Calling APP In Web(getOpportunitiesGrid)-----------");
		GridData gridData=new GridData();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			gridData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), GridData.class);	
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, gridData);
	}
	
	public void getOpportunitiesListXLS(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//TODO change hard coding
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		int partyId=userSession.getPartyId();
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		int pageSize=request.getParameter("rows")==null?100000:Integer.valueOf(request.getParameter("rows").toString());
		int pageNo=request.getParameter("page")==null?0:Integer.valueOf(request.getParameter("page").toString());
		String orderBy=request.getParameter("sidx")==null?"party.LastModifiedDate":request.getParameter("sidx").toString();
		
		//logger.info("pageSize------"+pagesize);
		
		
		String oppSearchValue = request.getParameter("value");
		String url = FiinfraUtility.getRestDBURL();
		
		//url = url + "services/opportunity/getOpportunitiesList/"+userSession.getUserName()+"/1234";
		url=URL_GET_OPPORTUNITIES_LIST + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("oppSearchValue", oppSearchValue);
		uriCB.queryParam("nodeId", nodeId);
		uriCB.queryParam("pageNo", pageNo);
		uriCB.queryParam("pageSize", pageSize);
		uriCB.queryParam("orderBy", orderBy);
		
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		BaseResponse<GridData> br = new BaseResponse<GridData>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		System.out.println("br:---"+br);
		GridData gridData=new GridData();
		List<OpportunityData> opportunityDatas=new ArrayList<>();	
		List<OpportunityData> opportunitList=new ArrayList<>();	
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			gridData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), GridData.class);	
			opportunityDatas=gridData.getRows();
		}
		
			try{
				for(int i = 0; i<opportunityDatas.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					OpportunityData opportunityData;
					opportunityData = objectMapper.readValue(objectMapper.writeValueAsString(opportunityDatas.get(i)), OpportunityData.class);
					opportunitList.add(opportunityData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}

		response.addHeader("Content-type", "application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename=OpportunityList.xls");
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font=workbook.createFont();
        /* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        /* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet("Opportunity List");
		int rowNum = 0;
		int column = 0;
		HSSFRow excelRow =  sheet.createRow(rowNum++);
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Name");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("RM");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("City");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Created Date");
		}

		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Email Id");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Contact Number");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Client Portal Activated?");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Stage");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Action Comments");
	}


		for(OpportunityData opportunityData:opportunitList){
			column = 0;
			excelRow =  sheet.createRow(rowNum++);
			{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(opportunityData.getName());
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(opportunityData.getRmHead());
		}
			
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(opportunityData.getCity());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(opportunityData.getCreatedDate());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(opportunityData.getEmail());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(opportunityData.getMobile());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			int dcActivation=opportunityData.getDcActivation();
			
			if(dcActivation==0)
			{
				cell.setCellValue("No");
			}
			else{
				cell.setCellValue("Yes");
			}			
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(opportunityData.getStage());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(opportunityData.getActionComments());
		}

		}

		
		workbook.write(response.getOutputStream());
	}
	
	public void getOpportunitiesListCSV(HttpServletRequest request, HttpServletResponse response) throws IOException {

		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		int partyId=userSession.getPartyId();
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		int pageSize=request.getParameter("rows")==null?100000:Integer.valueOf(request.getParameter("rows").toString());
		int pageNo=request.getParameter("page")==null?0:Integer.valueOf(request.getParameter("page").toString());
		String orderBy=request.getParameter("sidx")==null?"party.LastModifiedDate":request.getParameter("sidx").toString();
		
		//logger.info("pageSize------"+pagesize);
		
		
		String oppSearchValue = request.getParameter("value");
		String url = FiinfraUtility.getRestDBURL();
		
		//url = url + "services/opportunity/getOpportunitiesList/"+userSession.getUserName()+"/1234";
		url=URL_GET_OPPORTUNITIES_LIST + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("oppSearchValue", oppSearchValue);
		uriCB.queryParam("nodeId", nodeId);
		uriCB.queryParam("pageNo", pageNo);
		uriCB.queryParam("pageSize", pageSize);
		uriCB.queryParam("orderBy", orderBy);
		
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		BaseResponse<GridData> br = new BaseResponse<GridData>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		System.out.println("br:---"+br);
		GridData gridData=new GridData();
		List<OpportunityData> opportunityDatas=new ArrayList<>();	
		List<OpportunityData> opportunitList=new ArrayList<>();	
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			gridData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), GridData.class);	
			opportunityDatas=gridData.getRows();
		}
				
				for(int i = 0; i<opportunityDatas.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					OpportunityData opportunityData;
					opportunityData = objectMapper.readValue(objectMapper.writeValueAsString(opportunityDatas.get(i)), OpportunityData.class);
					opportunitList.add(opportunityData);
				}
			response.addHeader("Content-Disposition", "attachment;filename=OpportunityList.csv");
			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Name"));
			writer.print(",");
			writer.print(CommonUtils.escape("RM"));
			writer.print(",");
			writer.print(CommonUtils.escape("City"));
			writer.print(",");
			writer.print(CommonUtils.escape("Created Date"));
			writer.print(",");
			writer.print(CommonUtils.escape("Email Id"));
			writer.print(",");
			writer.print(CommonUtils.escape("Contact Number"));
			writer.print(",");
			writer.print(CommonUtils.escape("Client Portal Activated?"));
			writer.print(",");
			writer.print(CommonUtils.escape( "Stage"));
			writer.print(",");
			writer.print(CommonUtils.escape("Action Comments"));
			
			writer.println();
			for(OpportunityData opportunityData:opportunitList){
				writer.print(CommonUtils.escape(opportunityData.getName()));
				writer.print(",");
				writer.print(CommonUtils.escape(opportunityData.getRmHead()));
				writer.print(",");
				writer.print(CommonUtils.escape(opportunityData.getCity()));
				writer.print(",");
				writer.print(CommonUtils.escape(opportunityData.getCreatedDate()));
				writer.print(",");
				writer.print(CommonUtils.escape(opportunityData.getEmail()));
				writer.print(",");
				writer.print(CommonUtils.escape(""+opportunityData.getMobile()));
				writer.print(",");
				int dcActivation=opportunityData.getDcActivation();
				
				if(dcActivation==0)
				{
				writer.print(CommonUtils.escape(""+"No"));
				writer.print(",");
				}
				else{
					writer.print(CommonUtils.escape(""+"Yes"));
					writer.print(",");
				}
				
				writer.print(CommonUtils.escape(opportunityData.getStage()));
				writer.print(",");
				writer.print(CommonUtils.escape(opportunityData.getActionComments()));
				writer.println();
			}
	}
	
	@SuppressWarnings("unchecked")
	public void getOpportunitiesTaskList(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		int partyId=userSession.getPartyId();
		String oppSearchValue = request.getParameter("value");
		String url = FiinfraUtility.getRestDBURL();
		partyId=Integer.parseInt(request.getParameter("partyId"));
		request.getSession().setAttribute("dcInputPartyId",partyId);
		request.getSession().setAttribute("dcInputBuId",buId);
		//url = url + "services/opportunity/getOpportunitiesList/"+userSession.getUserName()+"/1234";
		url=URL_GET_OPPORTUNITIES_TASK + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("oppSearchValue", oppSearchValue);
		
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		BaseResponse<OpportunityTask> br = new BaseResponse<OpportunityTask>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	
		List<OpportunityTask> opportunityDatas=new ArrayList<>();	
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			opportunityDatas=br.getResponseListObject();
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, opportunityDatas);

	}

	
	/**
	 * save the opportunity details
	 * 
	 * @param request
	 * @param response
	 * @param opportunityData
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void saveOpportunity(HttpServletRequest request,
			HttpServletResponse response, OpportunityData opportunityData) throws Exception {
		
		String result="fail";
		request.getSession().setAttribute("OpportunityResult", result);
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");

		String partyId=request.getParameter("partyId");
		String opartyId=request.getParameter("opartyId");		
		
		logger.info("Request .........PartyID-------"+partyId);
		logger.info("Request ...OOOOOOOOOOOO......PartyID-------"+opartyId);


		int createdBy = userSession.getUserId();
//		int opportunityOwner = userSession.getPartyId();
		int opportunityOwner= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int buId=userSession.getBuId();
		opportunityData.setBuId(buId);
		opportunityData.setCreatedBy(createdBy);
		opportunityData.setOwnerPartyID(opportunityOwner);

		String url = FiinfraUtility.getRestDBURL();

		url=URL_INSERT_OPPORTUNITY_RECORD + userSession.getUserName() + "/1234";
		ObjectMapper om = new CustomJacksonObjectMapper();
		String jsonString=om.writeValueAsString(opportunityData);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		
		br = restTemplate.postForObject(url, opportunityData, BaseResponse.class);
		int recordCount=0;
		List<Integer> resultList=new ArrayList<>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList=br.getResponseListObject();
		recordCount=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)), Integer.class);	
		int opPartyId=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)), Integer.class);		
		int isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(2)),Integer.class);
		
		String eventTextXML="usp_cp_saveOpportunity("+opartyId+","+partyId+","+FiinfraUtility.getopportunityXMLString(opportunityData)+","+createdBy+","+createdBy+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(userSession.getPartyId());
		audit.setObjectName(String.valueOf(opPartyId));
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.SAVE_OPPORTUNITY);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE_OPPORTUNITY);
		audit.setSourceScreen("Add/Edit Opportunity");
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, resultList);
	}
	
	
	@SuppressWarnings("unchecked")
	public void getOpportunityProfileDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
		String partyId=request.getParameter("partyId");
		int buId=userSession.getBuId();		
		
		
		url=URL_GET_OPPORTUNITY_PROFILE_RECORD + userSession.getUserName() + "/1234";
		logger.info("URL------------>"+url);
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId",buId);
		uriCB.queryParam("partyId",partyId);
		
		BaseResponse<OpportunityProfileData> br = new BaseResponse<OpportunityProfileData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		OpportunityProfileData opportunityProfileData=new OpportunityProfileData();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			opportunityProfileData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), OpportunityProfileData.class);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, opportunityProfileData);
	}
	
	@SuppressWarnings("unchecked")
	public void saveOpportunityProfileData(HttpServletRequest request,
			HttpServletResponse response, OpportunityProfileData opportunityProfileData)
			throws Exception {
		//redirectDcActivation
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_OPPORTUNITY_PROFILE + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		String partyId=request.getParameter("partyId");
		int lastModifiedBy = userSession.getUserId();
		opportunityProfileData.setPartyId(partyId);
		opportunityProfileData.setBuId(buId);
		opportunityProfileData.setSectionName(sectionName);
		opportunityProfileData.setLastModifiedBy(lastModifiedBy);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, opportunityProfileData, BaseResponse.class);
		int recordCount = 0;
		List<Integer> resultList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList=br.getResponseListObject();
			recordCount = objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)),Integer.class);
			int isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)),Integer.class);
		
		String eventTextXML="usp_cp_saveOpportunityProfileDetails("+partyId+","+sectionName+","+FiinfraUtility.getOpportunityProfileDataXML(opportunityProfileData, sectionName)+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
			
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(Integer.parseInt(partyId));
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, resultList);
	}
	
	@SuppressWarnings("unchecked")
	public void saveOpportunityProfileAddressData(HttpServletRequest request,
			HttpServletResponse response, AddressData addressData)
			throws Exception {

		
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_OPPORTUNITY_PROFILE + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		String partyId=request.getParameter("partyId");
		int lastModifiedBy = userSession.getUserId();
		OpportunityProfileData opportunityProfileData = new OpportunityProfileData();
		opportunityProfileData.setPartyId(partyId);
		opportunityProfileData.setBuId(buId);
		opportunityProfileData.setSectionName(sectionName);
		opportunityProfileData.setLastModifiedBy(lastModifiedBy);
		opportunityProfileData.setContactEmail(request.getParameter("contactEmail"));
		opportunityProfileData.setContactMobile(request.getParameter("contactMobile"));
		opportunityProfileData.setContactMobile2(request.getParameter("contactMobile2"));
		List<AddressData> addressDatas = new ArrayList<>();
		addressDatas.add(addressData);
		opportunityProfileData.setAddressDataList(addressDatas);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, opportunityProfileData, BaseResponse.class);
		int recordCount = 0;
		List<Integer> resultList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList=br.getResponseListObject();
			recordCount = objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)),Integer.class);
			int isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)),Integer.class);
			
		String eventTextXML="usp_cp_saveOpportunityProfileDetails("+partyId+","+sectionName+","+FiinfraUtility.getOpportunityProfileDataXML(opportunityProfileData, sectionName)+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
				
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		//audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, resultList);
	}

	@SuppressWarnings("unchecked")
	public void saveOpportunityProfileFamilyMemberData(HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {
		int isFamilyMemberPresent=0;
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId=Integer.parseInt(request.getParameter("partyId"));
		url = URL_UPDATE_DC_PERSONALINFORMATION_RECORD+userSession.getName()+"/1234";
		List<Integer> resultList=new ArrayList<>();
		int isPanExist=0;
		int lastModifiedBy = userSession.getUserId();
		String result="success";		
		int recordCount=0;
		OpportunityData opportunityData=new OpportunityData();
		opportunityData.setPartyId(partyId);
		opportunityData.setBuId(buId);
		opportunityData.setLastModifiedBy(lastModifiedBy);
		opportunityData.setFamilyMemberXml(request.getParameter("familyMemberXML"));
		opportunityData.setFromProfile(true);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		opportunityData.setContactPhoto(null);
		br = restTemplate.postForObject(url, opportunityData, BaseResponse.class);
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList=br.getResponseListObject();//NOw Added
			recordCount=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)), Integer.class);	
			isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)),Integer.class);
			isFamilyMemberPresent = objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(2)),Integer.class);
			logger.info("isFamilyMemberPresent in WEB====="+isFamilyMemberPresent);
//			recordCount=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Integer.class);
			
			List<String> responseList=new ArrayList<>();
			responseList.add(String.valueOf(recordCount));
			responseList.add(String.valueOf(isPanExist));
			responseList.add(String.valueOf(isFamilyMemberPresent));
		
		String eventTextXML="usp_pp_DC_INP_savePersonalInformation("+partyId+","+opportunityData.getFamilyMemberXml()+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
					
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE);
		audit.setSourceScreen(sectionName);
		FrameworkUtil.audit(audit);
		
		objectMapper.writeValue(out, responseList);
//		objectMapper.writeValue(out, recordCount);
	}

	@SuppressWarnings("unchecked")
	public void saveOpportunityProfileNotesData(HttpServletRequest request,
			HttpServletResponse response, NotesData notesData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_OPPORTUNITY_PROFILE + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		String partyId=request.getParameter("partyId");
		int lastModifiedBy = userSession.getUserId();
		OpportunityProfileData opportunityProfileData = new OpportunityProfileData();
		opportunityProfileData.setPartyId(partyId);
		opportunityProfileData.setBuId(buId);
		opportunityProfileData.setSectionName(sectionName);
		opportunityProfileData.setLastModifiedBy(lastModifiedBy);
		List<NotesData> notesDatas = new ArrayList<>();
		notesDatas.add(notesData);
		opportunityProfileData.setNotesDataList(notesDatas);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, opportunityProfileData, BaseResponse.class);
		int recordCount = 0;
		List<Integer> resultList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))			
			resultList=br.getResponseListObject();
			recordCount = objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)),Integer.class);
			int isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)),Integer.class);
		
		String eventTextXML="usp_cp_saveOpportunityProfileDetails("+partyId+","+sectionName+","+FiinfraUtility.getOpportunityProfileDataXML(opportunityProfileData, sectionName)+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
			
        			
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		//audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, resultList);
	}
	
	@SuppressWarnings("unchecked")
	public void saveOpportunityProfileDocumentData(HttpServletRequest request,
			HttpServletResponse response, DocumentData documentData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_OPPORTUNITY_PROFILE + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		String partyId=request.getParameter("partyId");
		int lastModifiedBy = userSession.getUserId();
		OpportunityProfileData opportunityProfileData = new OpportunityProfileData();
		opportunityProfileData.setPartyId(partyId);
		opportunityProfileData.setBuId(buId);
		opportunityProfileData.setSectionName(sectionName);
		opportunityProfileData.setLastModifiedBy(lastModifiedBy);
		List<DocumentData> documentDatas = new ArrayList<>();
		documentDatas.add(documentData);
		opportunityProfileData.setDocumentDataList(documentDatas);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, opportunityProfileData, BaseResponse.class);
		int recordCount = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		
		String eventTextXML="usp_cp_saveOpportunityProfileDetails("+partyId+","+sectionName+","+FiinfraUtility.getOpportunityProfileDataXML(opportunityProfileData, sectionName)+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
		
				
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(Integer.parseInt(partyId));
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, recordCount);
	}
	@SuppressWarnings("unchecked")
	public void redirectDcInput(HttpServletRequest request,
			HttpServletResponse response, OpportunityData opportunityData) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String partyId;
		String buId;
		String name;
		String isDatacollectionChange;
		String redirectToClient;
		String serverPath=request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath());
		partyId=request.getParameter("partyId");
		buId=request.getParameter("buId");
		name=request.getParameter("pname");
		isDatacollectionChange = request.getParameter("isDatacollectionChange");
		redirectToClient = request.getParameter("isClient");
		if(isDatacollectionChange==null)
		{
			isDatacollectionChange=request.getSession().getAttribute("dcInputDocId_AnalysisReport").toString();
		}
		logger.info("DOCID================================="+isDatacollectionChange);
		if(partyId==null){
			partyId=request.getSession().getAttribute("dcInputPartyId").toString();
			buId=request.getSession().getAttribute("dcInputBuId").toString();
			name=request.getSession().getAttribute("dcInputUsername").toString();
		}

		logger.info("partyId in redirectDcInput=="+partyId);
		logger.info("buId in redirectDcInput=="+buId);
		logger.info("businessUnitId_Shubhachintak=="+businessUnitId_Shubhachintak);
		logger.info("businessUnitId_Fiinfra=="+businessUnitId_Fiinfra);
		logger.info("name=================="+name);
		logger.info("serverPath=="+serverPath);
		request.getSession().setAttribute("dcInputPartyId",partyId);
		request.getSession().setAttribute("dcInputBuId",buId);
		request.getSession().setAttribute("dcInputUsername",name);
		request.getSession().setAttribute("dcInputDocId_AnalysisReport",isDatacollectionChange);
		request.getSession().setAttribute("redirectToClient",redirectToClient);
		
		url = URL_GET_SECTIONS_TO_SHOW_IN_DC + userSession.getUserName() + "/1234";
		
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<Integer> objSectionSpecificDcData = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			objSectionSpecificDcData = br.getResponseListObject();
		
		String section= new String();
		for(int i=0;i<objSectionSpecificDcData.size();i++)
		{
			section=section+","+objSectionSpecificDcData.get(i);
		}
		//Iterator i = objSectionSpecificDcData.iterator();
//		for(SectionSpecificDcData element : objSectionSpecificDcData) {
//			}
		
		request.getSession().setAttribute("SectionToShowInDcList",objSectionSpecificDcData);
		request.getSession().setAttribute("Section",section);
		
//		if(businessUnitId_Fiinfra.equals(buId))
//		{  
//			
//			String redirectUrl="";
//			redirectUrl=serverPath+"/DCHomeFiinfra.htm";
//			response.sendRedirect(redirectUrl);
//		}
//		else{
			String redirectUrl="";
			logger.info("server path:---"+request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath()));
			redirectUrl=serverPath+"/DCHomeShubhchintak.htm";

			response.sendRedirect(redirectUrl);
			
			
//			<%=request.getContextPath()%>/CashflowFiinfra.htm
//		}
	}
	
	public void redirectDcInputFPT(HttpServletRequest request,
			HttpServletResponse response, OpportunityData opportunityData) throws Exception {
		UserSession userSession=new UserSession();
		String partyId;
		String buId;
		String name;
		String isDatacollectionChange;
		String serverPath=request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath());
		System.out.println("IN redirectDcInputFPT"); 
		partyId=request.getParameter("partyId");
		buId=request.getParameter("buId");
		name=request.getParameter("opportunityName");
		int createdBy = Integer.parseInt(request.getParameter("createdBy"));
		int roleId= Integer.parseInt(request.getParameter("roleId"));
		String partnerName = request.getParameter("partnerName");
		String inflationRate = request.getParameter("inflationRate");
		isDatacollectionChange = "0";
		String userName=request.getParameter("USER_NAME");
		String theme="Magento";
		try{
			theme=request.getParameter("theme");
		}catch(Exception e){
			theme="Magento";
		}
		if(isDatacollectionChange==null)
		{
			isDatacollectionChange=request.getSession().getAttribute("dcInputDocId_AnalysisReport").toString();
		}
		logger.info("DOCID================================="+isDatacollectionChange);
		if(partyId==null){
			partyId=request.getSession().getAttribute("dcInputPartyId").toString();
			buId=request.getSession().getAttribute("dcInputBuId").toString();
			name=request.getSession().getAttribute("dcInputUsername").toString();
		}

		logger.info("partyId in redirectDcInput=="+partyId);
		logger.info("buId in redirectDcInput=="+buId);
		logger.info("businessUnitId_Shubhachintak=="+businessUnitId_Shubhachintak);
		logger.info("businessUnitId_Fiinfra=="+businessUnitId_Fiinfra);
		logger.info("name=================="+name);
		logger.info("serverPath=="+serverPath);
		logger.info("userName=="+userName);
		HttpSession httpSession=request.getSession();
//		userSession.setUserName(userName);
//		userSession.setBuId(Integer.valueOf(buId));
//		userSession.setPartyId(Integer.valueOf(partyId));
//		userSession.setRoleId(roleId);
//		userSession.setId(createdBy);
//		userSession.setUserId(createdBy);
//		userSession.setIsForceChangePasswordOnLogin(false);
//		userSession.setSuccessfulLoginCount(1);
//		userSession.setThemeName(theme);
//		userSession.setName(partnerName);
		request.getSession().setAttribute("dcInputPartyId",partyId);
		request.getSession().setAttribute("dcInputBuId",buId);
		request.getSession().setAttribute("dcInputUsername",name);
		request.getSession().setAttribute("dcInputDocId_AnalysisReport",isDatacollectionChange);
		httpSession.setAttribute("inflationRate_DcInput", inflationRate);
		httpSession.setAttribute("leadName", name);
//		httpSession.setAttribute("userSession", userSession);
		
		request.getSession().setAttribute("dcInputPartyId",partyId);
		request.getSession().setAttribute("dcInputBuId",buId);
		request.getSession().setAttribute("dcInputUsername",name);
		request.getSession().setAttribute("dcInputDocId_AnalysisReport",isDatacollectionChange);
		
		
		String url = SUCCESSFULL_LOGIN + userName + "/" + request.getRemoteAddr();
		userSession =  restTemplate.getForObject(url, UserSession.class);
		request.getSession().setAttribute("userSession", userSession);
		userSession.setUserName(userName); 
		url = URL_GET_NON_ACCESSIBLE_CONTROLIDS + userName + "/1234?partyId="+userSession.getPartyId()+"&buId="+userSession.getBuId()+"&sourceSystemId="+FiinfraConstants.PARTNER_PORTAL;
		BaseResponse<String> br=new BaseResponse<>();
		br = restTemplate.getForEntity(url, BaseResponse.class).getBody();
		List<String> idList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			idList = br.getResponseListObject();
		request.getSession().setAttribute("idList", idList);
		logger.info("idList:-------"+idList);
		logger.info("isHeadOfNode="+userSession.getHeadOfNode());
		logger.info("Cureent Node Id="+userSession.getCurrentNodeId());
		
		if(userSession.getHeadOfNode()==true){
		int currentNodeId=userSession.getCurrentNodeId();
		int level=userSession.getLevel();
		url=URL_GET_HEIRARCHY_DATA_VP + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", userSession.getPartyId());
		uriCB.queryParam("currentNodeId", currentNodeId);
		uriCB.queryParam("level", level);
		
		BaseResponse<HeirarchyData> br1= new BaseResponse<HeirarchyData>();
		br1= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	
		HeirarchyData heirarchyDatas=new HeirarchyData();
		if(br1.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			heirarchyDatas=objectMapper.readValue(objectMapper.writeValueAsString(br1.getResponseObject()), HeirarchyData.class);			
		}
		logger.info("heirarchyDatas Data----------"+heirarchyDatas);
		request.getSession().setAttribute("lstLocationData", objectMapper.writeValueAsString(heirarchyDatas.getLstLocationData()));
		request.getSession().setAttribute("lstPartnerHeirarchyData", objectMapper.writeValueAsString(heirarchyDatas.getLstPartnerHeirarchyData()));
		}else{
			request.getSession().setAttribute("lstLocationData", null);
			request.getSession().setAttribute("lstPartnerHeirarchyData", null);
		}
		request.getSession().setAttribute("nodeId", 0);
		request.getSession().setAttribute("partyId", userSession.getPartyId());
		request.getSession().setAttribute("oldpartyId", userSession.getPartyId());
		
		
		url = URL_GET_SECTIONS_TO_SHOW_IN_DC + userName + "/1234";
		
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<Integer> br1 = new BaseResponse<Integer>();
		br1 = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<Integer> objSectionSpecificDcData = new ArrayList<>();
		if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			objSectionSpecificDcData = br1.getResponseListObject();
		
		String section= new String();
		for(int i=0;i<objSectionSpecificDcData.size();i++)
		{
			section=section+","+objSectionSpecificDcData.get(i);
		}
		
		request.getSession().setAttribute("SectionToShowInDcList",objSectionSpecificDcData);
		request.getSession().setAttribute("Section",section);
		
			String redirectUrl="";
			logger.info("server path:---"+request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath()));
			redirectUrl=serverPath+"/DCHomeShubhchintak.htm";
			response.sendRedirect(redirectUrl);
	}
	@SuppressWarnings("unchecked")
	public void redirectDcActivation(HttpServletRequest request,
			HttpServletResponse response,UserData userData)
			throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");		
		
		int createdBy = userSession.getUserId();
		int roleId=userData.getRoleId();
		int buId=userSession.getBuId();
		userData.setCreatedBy(createdBy);
		userData.setBuID(buId);
		String url = FiinfraUtility.getRestDBURL();
		url = URL_INSERT_DC_ACTIVATION_RECORD + userSession.getUserName() + "/1234";
		logger.info("URL------------>"+url);
		
		ObjectMapper om = new CustomJacksonObjectMapper();
		String jsonString=om.writeValueAsString(userData);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());

		String partyIds=userData.getPartyIds();
		
		String userDataXML="<Root>";
		String[] partyIdArray=partyIds.split(",");
		int noOfCAPSAlpha = 1;
		int noOfDigits = 1;
		int noOfSplChars = 1;
		int minLen = 8;
		int maxLen = 15;
		Map<Integer,String> passwordMap=new HashMap<>();
		for(String partyId:partyIdArray){
			String hexString = null;
			
			char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
					noOfCAPSAlpha, noOfDigits, noOfSplChars);
			hexString = new String(pswd);
			logger.info("hexString is-----" + hexString);
			MD5Encryption md5Encryption = new MD5Encryption();
			//String encryptrdPassword = md5Encryption.encrypt(hexString);
			String encryptrdPassword = passwordEncoder.encodePassword(hexString, null);
			userDataXML+="<User>";
			userDataXML+="<userPassword>"+encryptrdPassword+"</userPassword>";
			userDataXML+="<partyid>"+partyId+"</partyid>";
			userDataXML+="<RoleId>"+roleId+"</RoleId>";
			userDataXML+="</User>";
			passwordMap.put(Integer.valueOf(partyId), hexString);
		}
		userDataXML+="</Root>";
		userData.setUserDataXML(userDataXML);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, userData, BaseResponse.class);
		List<Integer> resultList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList = br.getResponseListObject();
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		if(objectMapper.readValue(
				objectMapper.writeValueAsString(resultList.get(0)),
				Integer.class)>0){
		Notification notification=null;
		for(Map.Entry<Integer,String> map:passwordMap.entrySet()){
			Map<String,String> payloadMap=new HashMap<String, String>();
			payloadMap.put("Password",map.getValue());
			notification=new Notification();
			notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
			notification.setNotifyPartyID(map.getKey());
			notification.setNotifyEventID(FiinfraConstants.DC_ACTIVATION);
//			notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
			notification.setBuId(buId);
			notification.setPayloadMap(payloadMap);
			notification.setSessionID(request.getSession().getId());
			FrameworkUtil.notify(notification);
		}
		}
		
		String eventTextXML="usp_cp_saveDcActivationDetails("+userDataXML+","+createdBy+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		logger.info("Result List Dc Activation isContactEmailPresent---------"+resultList);
		Audit audit = new Audit();
		audit.setActionByPartyId(userSession.getPartyId());
		audit.setObjectName(partyIds);
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.SAVE_OPPORTUNITY);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE_OPPORTUNITY);
		audit.setSourceScreen("DC Activation");
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, resultList);
		
	}
	
	@SuppressWarnings("unchecked")
	public void redirectXRayActivation(HttpServletRequest request,
			HttpServletResponse response,UserData userData)
			throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");		
		
		int createdBy = userSession.getUserId();
		int buId=userSession.getBuId();
		int roleId=userData.getRoleId();
		userData.setCreatedBy(createdBy);
		userData.setBuID(buId);
		String url = FiinfraUtility.getRestDBURL();
		String xraypartyIds=userData.getPartyIds();
		
		String userDataXML="<Root>";
		String[] partyIdArray=xraypartyIds.split(",");
		int noOfCAPSAlpha = 1;
		int noOfDigits = 1;
		int noOfSplChars = 1;
		int minLen = 8;
		int maxLen = 15;
		Map<Integer,String> passwordMap=new HashMap<>();
		for(String partyId:partyIdArray){
			String hexString = null;
			
			char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
					noOfCAPSAlpha, noOfDigits, noOfSplChars);
			hexString = new String(pswd);
			logger.info("hexString is-----" + hexString);
			MD5Encryption md5Encryption = new MD5Encryption();
			//String encryptrdPassword = md5Encryption.encrypt(hexString);
			String encryptrdPassword = passwordEncoder.encodePassword(hexString, null);
			userDataXML+="<User>";
			userDataXML+="<userPassword>"+encryptrdPassword+"</userPassword>";
			userDataXML+="<partyid>"+partyId+"</partyid>";
			userDataXML+="<RoleId>"+roleId+"</RoleId>";
			userDataXML+="</User>";
			passwordMap.put(Integer.valueOf(partyId), hexString);
		}
		userDataXML+="</Root>";
		userData.setUserDataXML(userDataXML);
		
			
		url = URL_INSERT_XRAY_ACTIVATION_RECORD + userSession.getUserName() + "/1234";
		logger.info("URL------------>"+url);
		
		ObjectMapper om = new CustomJacksonObjectMapper();
		String jsonString=om.writeValueAsString(userData);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());

		
		logger.info("redirectXRayActivation----------"+xraypartyIds);
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, userData, BaseResponse.class);
		List<Integer> resultList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList = br.getResponseListObject();
		
		String alreadyActivatedPartyIds=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(2)),String.class);
		
		logger.info("alreadyActivatedPartyIds----****---"+alreadyActivatedPartyIds);
//		String partyIds=userData.getPartyIds();
				
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		if(objectMapper.readValue(
				objectMapper.writeValueAsString(resultList.get(0)),
				Integer.class)>0){
			
			String delims = "[,]+";
			String[] tokens = xraypartyIds.split(delims);
			
			//for (int i = 0; i < tokens.length; i++){
			for(Map.Entry<Integer,String> map:passwordMap.entrySet()){
				Map<String,String> payloadMap=new HashMap<String, String>();
				int partyId=map.getKey();
				if(alreadyActivatedPartyIds.contains(String.valueOf(partyId))){
					payloadMap.put("Password","You can use your current password to login.");
				}else{
					payloadMap.put("Password",map.getValue());
				}
				
				//logger.info(tokens[i]);
				
				logger.info("PartyId===="+partyId);
				
				Notification notification=null;
				notification=new Notification();
				notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
				notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
				notification.setNotifyPartyID(partyId);
				notification.setNotifyEventID(FiinfraConstants.XRAY_REMINDER);
				notification.setBuId(buId);
				notification.setPayloadMap(payloadMap);
				notification.setSessionID(request.getSession().getId());
				logger.info(notification);
				FrameworkUtil.notify(notification);			
			}
				
		}
		
		logger.info("Result List XRAy Activation ---------"+resultList);
		Audit audit = new Audit();
		audit.setActionByPartyId(userSession.getPartyId());
		audit.setObjectName(xraypartyIds);
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.XRAY_ACTIVATION);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE_OPPORTUNITY);
		audit.setSourceScreen("XRay Activation");
//		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, resultList);
	}
	
	/**
	 * Activates the Opportunities and related details
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void bulkActivateOpportunities(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String partyIds = request.getParameter("partyIds");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_INSERT_BULK_DC_ACTIVATION + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyIds", partyIds);
		uriCB.queryParam("buId", buId);
		logger.info("PPPPPPPPPPPPPPPPPP-------------"+partyIds);
		

		BaseResponse<Integer> br = new BaseResponse<Integer>();
		List<Integer> resultList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList = br.getResponseListObject();
		
		logger.info("bulk------------"+resultList);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, br.getStatus());// TO Do: here status can
														// be SUCCESS or
														// .EMPTY_RESULT_SET.
														// Accordingly handle
														// this in View.
	}

	/**
	 * Retrieves the Opportunity details 
	 * 
	 * @param request
	 * @param response
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	@SuppressWarnings("unchecked")
	public void getOpportunityDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
		String partyId=request.getParameter("partyId");
		logger.info("opartyId=-======partyId========="+partyId);
		
		int buId=userSession.getBuId();		
	
		url=URL_GET_OPPORTUNITY_RECORD + userSession.getUserName() + "/1234";
		logger.info("URL------------>"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//uriCB.queryParam("buId",buId);
		uriCB.queryParam("partyId",partyId);
		
		BaseResponse<OpportunityData> br = new BaseResponse<OpportunityData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		OpportunityData opportunityData=new OpportunityData();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			opportunityData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), OpportunityData.class);			
		}
		
		logger.info("Opportunity Data----------"+objectMapper.writeValueAsString(opportunityData) );
		
		//opportunityData.setPartyId(partyId);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, opportunityData);
	}
	
	public void getOpportunityStageList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
//		int partyId=userSession.getPartyId();
		int partyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		partyId=Integer.parseInt(request.getParameter("partyId"));
		int buId=userSession.getBuId();		
	
		url=URL_GET_OPPORTUNITY_STAGE_LIST + userSession.getUserName() + "/1234";
		logger.info("URL------------>"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//uriCB.queryParam("buId",buId);
		uriCB.queryParam("partyId",partyId);
		uriCB.queryParam("buId",buId);
		uriCB.queryParam("nodeId", nodeId);
		
		BaseResponse<OpportunityStageData> br = new BaseResponse<OpportunityStageData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<OpportunityStageData> opportunityStageDatas=new ArrayList<>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			opportunityStageDatas=br.getResponseListObject();			
		}
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, opportunityStageDatas);
	}

//@SuppressWarnings("unchecked")
//public ModelAndView importBulkOpportunities(HttpServletRequest request,
//			HttpServletResponse response,OpportunityData opportunityDatas) throws IOException {
//	UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
//	logger.info("Hello in import..."+opportunityDatas.getLeadUpload());
//	bulkUploadOpportunityData = new BulkUploadOpportunityData();
//	
//	String opportunityUploadFileName;
//	opportunityUploadFileName=opportunityDatas.getLeadUpload()[0].getOriginalFilename();
//	MultipartFile opportunityUploadFile;
//	opportunityUploadFile=opportunityDatas.getLeadUpload()[0];
//	
//	logger.info("File name is:----"+opportunityUploadFileName);
//	
//	int buId = userSession.getBuId();
//	int partyId=userSession.getPartyId();
//	int createdBy = userSession.getUserId();
//	
//	opportunityData.setLeadUpload(opportunityDatas.getLeadUpload());
//	opportunityData.setOwnerPartyID(partyId);
//	opportunityData.setBuId(buId);
//	opportunityData.setCreatedBy(createdBy);
//	bulkUploadOpportunityData.setCreatedBy(createdBy);
//	bulkUploadOpportunityData.setBuId(buId);
//	String xmlString;
//	int TotalOps = 0;
//	
//	lstSuccessOpportunity=new ArrayList<>();
//	lstFailedOpportunity=new ArrayList<>();
//	lstExistingOpportunity=new ArrayList<>();
//	List<OpportunityData> lstToCreateOpportunity=null;
//	
//	try{
//		if (opportunityUploadFileName.substring(
//				opportunityUploadFileName.lastIndexOf('.') + 1).equals("xls")) {				
//				lstToCreateOpportunity = readXls();
//				logger.info("Create Oppo-----------"+lstToCreateOpportunity);
//				
//		} else if (opportunityUploadFileName.substring(
//				opportunityUploadFileName.lastIndexOf('.') + 1).equals("xlsx")) {
//				lstToCreateOpportunity = readXlsx();
//		}
//		logger.info("lstFailedOpportunity size:----------"+ lstFailedOpportunity.size());
//		this.lstFailedOpportunity=lstFailedOpportunity;
//		request.getSession().setAttribute("lstFailedOpportunity",lstFailedOpportunity);
//		TotalOps = lstFailedOpportunity.size();
//		TotalOps = TotalOps + lstToCreateOpportunity.size();
//		request.getSession().setAttribute("TotalOpportunityCount",TotalOps);	
//		request.getSession().setAttribute("TotalFailedOpportunityCount", lstFailedOpportunity.size());
//
//		logger.info("**To Create Opportunity By SP**" + lstToCreateOpportunity);
//		if(lstToCreateOpportunity!=null){
//			if(lstToCreateOpportunity.size()>0){
//				xmlString=getOpportunityToInsertXmlString(lstToCreateOpportunity);
//				
//				bulkUploadOpportunityData.setBulkopportunityXml(xmlString);
//				logger.info("XML String"+xmlString);
//				
//			}
//			
//		}
//			
//	}
//	catch(Exception e)
//	{
//		logger.error(e);
//	}
//	
//	url=URL_INSERT_BULK_OPPORTUNITY + userSession.getUserName() + "/1234";
//	logger.info("URL------------>"+url);
//	
//	ObjectMapper om = new CustomJacksonObjectMapper();
//	String jsonString=om.writeValueAsString(bulkUploadOpportunityData);
//	Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
//			.currentThread().getStackTrace()[1].getMethodName());
//	List<List<OpportunityData>> oppList=new ArrayList<>();
//	BaseResponse<List<OpportunityData>> br = new BaseResponse<List<OpportunityData>>();
//	br = restTemplate.postForObject(url, bulkUploadOpportunityData, BaseResponse.class);
//	String result = null;
//	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
//	oppList = objectMapper.readValue(
//				objectMapper.writeValueAsString(br.getResponseListObject()),
//				List.class);
//	logger.info("lstFailedOpportunity@@@@@@---"+oppList);
//	
//	List<OpportunityData> lstSuccessOpportunity=new ArrayList<OpportunityData>(); 
//	lstSuccessOpportunity=oppList.get(0);
//	
//	logger.info("lstSuccessOpportunity....."+lstSuccessOpportunity);
//	logger.info("lstFailedOpportunity@@@@@@---"+lstFailedOpportunity);
//	
//	String eventTextXML="usp_pp_OpportunitiesByBulkUpload("+bulkUploadOpportunityData+","+createdBy+")";
//	logger.info("eventTextXML========="+eventTextXML);
//		
//	PrintWriter out = null;
//	out = response.getWriter();
//	response.setContentType("application/json");
//	
//	Audit audit = new Audit();
//	audit.setActionByPartyId(partyId);
//	audit.setActionByUserID(createdBy);
//	audit.setEventID(FiinfraConstants.USER_PROFILE_CREATE);
//	audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
//	audit.setSourceModule(SOURCE_MODULE);		
//	audit.setEventTextXML(eventTextXML);
//	FrameworkUtil.audit(audit);
//	
//	ModelAndView mav = new ModelAndView("opportunity/bulkuploadOpportunity");
//	mav.addObject("lstSuccessOpportunity", objectMapper.writeValueAsString(lstSuccessOpportunity));
////	mav.addObject("lstSuccessOpportunity", lstSuccessOpportunity);
////	mav.addObject("lstExistingOpportunity", lstExistingOpportunity);
//	mav.addObject("lstFailedOpportunity", objectMapper.writeValueAsString(lstFailedOpportunity));
//	return mav;
//
//}

	@SuppressWarnings("unchecked")
	public void importBulkOpportunities(HttpServletRequest request,
				HttpServletResponse response,OpportunityData opportunityDatas) throws IOException {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info("Hello in import..."+opportunityDatas.getLeadUpload());
		bulkUploadOpportunityData = new BulkUploadOpportunityData();
		
		String opportunityUploadFileName;
		opportunityUploadFileName=opportunityDatas.getLeadUpload()[0].getOriginalFilename();
		MultipartFile opportunityUploadFile;
		opportunityUploadFile=opportunityDatas.getLeadUpload()[0];
		
		logger.info("File name is:----"+opportunityUploadFileName);
		
		int buId = userSession.getBuId();
		int partyId=userSession.getPartyId();
		int createdBy = userSession.getUserId();
		
		opportunityData.setLeadUpload(opportunityDatas.getLeadUpload());
		opportunityData.setOwnerPartyID(partyId);
		opportunityData.setBuId(buId);
		opportunityData.setCreatedBy(createdBy);
		bulkUploadOpportunityData.setCreatedBy(createdBy);
		bulkUploadOpportunityData.setBuId(buId);
		String xmlString;
		int TotalOps = 0;
		
		lstSuccessOpportunity=new ArrayList<>();
		lstFailedOpportunity=new ArrayList<>();
		lstExistingOpportunity=new ArrayList<>();
		List<OpportunityData> lstToCreateOpportunity=null;
		
		try{
			if (opportunityUploadFileName.substring(
					opportunityUploadFileName.lastIndexOf('.') + 1).equals("xls")) {				
					lstToCreateOpportunity = readXls();
					logger.info("Create Oppo-----------"+lstToCreateOpportunity);
					
			} else if (opportunityUploadFileName.substring(
					opportunityUploadFileName.lastIndexOf('.') + 1).equals("xlsx")) {
					lstToCreateOpportunity = readXlsx();
			}
			logger.info("lstFailedOpportunity size:----------"+ lstFailedOpportunity.size());
			this.lstFailedOpportunity=lstFailedOpportunity;
			request.getSession().setAttribute("lstFailedOpportunity",lstFailedOpportunity);
			TotalOps = lstFailedOpportunity.size();
			TotalOps = TotalOps + lstToCreateOpportunity.size();
			request.getSession().setAttribute("TotalOpportunityCount",TotalOps);	
			request.getSession().setAttribute("TotalFailedOpportunityCount", lstFailedOpportunity.size());

			logger.info("**To Create Opportunity By SP**" + lstToCreateOpportunity);
			if(lstToCreateOpportunity!=null){
				if(lstToCreateOpportunity.size()>0){
					xmlString=getOpportunityToInsertXmlString(lstToCreateOpportunity);
					
					bulkUploadOpportunityData.setBulkopportunityXml(xmlString);
					logger.info("XML String"+xmlString);
					
				}
				
			}
				
		}
		catch(Exception e)
		{
			logger.error(e);
		}
		
		url=URL_INSERT_BULK_OPPORTUNITY + userSession.getUserName() + "/1234";
		logger.info("URL------------>"+url);
		
		ObjectMapper om = new CustomJacksonObjectMapper();
		String jsonString=om.writeValueAsString(bulkUploadOpportunityData);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<List<OpportunityData>> oppList=new ArrayList<>();
		BaseResponse<List<OpportunityData>> br = new BaseResponse<List<OpportunityData>>();
		br = restTemplate.postForObject(url, bulkUploadOpportunityData, BaseResponse.class);
		String result = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		oppList = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseListObject()),
					List.class);
//		logger.info("lstFailedOpportunity@@@@@@---"+oppList);
		
		List<OpportunityData> lstSuccessOpportunity=new ArrayList<OpportunityData>(); 
		lstSuccessOpportunity=oppList.get(0);
		oppList.add(lstFailedOpportunity);
		logger.info("lstSuccessOpportunity....."+lstSuccessOpportunity);
		logger.info("lstFailedOpportunity@@@@@@---"+oppList.get(2));
		
		String eventTextXML="usp_pp_OpportunitiesByBulkUpload("+bulkUploadOpportunityData+","+createdBy+")";
		logger.info("eventTextXML========="+eventTextXML);
			
//		PrintWriter out = null;
//		out = response.getWriter();
//		response.setContentType("application/json");
		
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.USER_PROFILE_CREATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE);		
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
//		
//		ModelAndView mav = new ModelAndView("opportunity/bulkuploadOpportunity");
//		mav.addObject("lstSuccessOpportunity", objectMapper.writeValueAsString(lstSuccessOpportunity));
////		mav.addObject("lstSuccessOpportunity", lstSuccessOpportunity);
////		mav.addObject("lstExistingOpportunity", lstExistingOpportunity);
//		mav.addObject("lstFailedOpportunity", objectMapper.writeValueAsString(lstFailedOpportunity));
//		return mav;
		  PrintWriter out = null;
		  out = response.getWriter();
		  response.setContentType("application/json");
		  objectMapper.writeValue(out, oppList );
	}

	
	
	
	public List<OpportunityData> readXls() throws IOException, BiffException{
		List<OpportunityData> lstToCreateOpportunity = new ArrayList<OpportunityData>();
	
		MultipartFile bulkUploadFile= opportunityData.getLeadUpload()[0];		
		int ownerPartyId=opportunityData.getOwnerPartyID();
		int buId=opportunityData.getBuId();


		Workbook workbook = Workbook
				.getWorkbook(bulkUploadFile.getInputStream());
				
		int numOfSheets = 0;
		int numOfRows = 1;
		
		Sheet sheet=workbook.getSheet(numOfSheets);
		

		while(numOfRows < sheet.getRows())
		{
			try{		
				opportunityData=new OpportunityData();
			Cell cell1 = sheet.getCell(0, numOfRows);
			Cell cell2 = sheet.getCell(1, numOfRows);
			Cell cell3 = sheet.getCell(2, numOfRows);
			Cell cell4 = sheet.getCell(3, numOfRows);
			Cell cell5 = sheet.getCell(4, numOfRows);
			Cell cell6 = sheet.getCell(5, numOfRows);
			Cell cell7 = sheet.getCell(6, numOfRows);
			Cell cell8 = sheet.getCell(7, numOfRows);
			Cell cell9 = sheet.getCell(8, numOfRows);
			Cell cell10 = sheet.getCell(9, numOfRows);
			Cell cell11 = sheet.getCell(10, numOfRows);
			Cell cell12 = sheet.getCell(11, numOfRows);
			Cell cell13 = sheet.getCell(12, numOfRows);
			Cell cell14 = sheet.getCell(13, numOfRows);
			Cell cell15 = sheet.getCell(14, numOfRows);						
			
			String cell1Content = cell1.getContents();
			String cell2Content = cell2.getContents();
			String cell3Content = cell3.getContents();
			String cell4Content = cell4.getContents();
			String cell5Content = cell5.getContents();
			String cell6Content = cell6.getContents();
			String cell7Content = cell7.getContents();
			String cell8Content = cell8.getContents();
			String cell9Content = cell9.getContents();
			String cell10Content = cell10.getContents();
			String cell11Content = cell11.getContents();
			String cell12Content = cell12.getContents();
			String cell13Content = cell13.getContents();
			String cell14Content = cell14.getContents();
			String cell15Content = cell15.getContents();
			
			cell1Content=cell1Content.replaceAll("^\\s+|\\s+$","");
			cell2Content=cell2Content.replaceAll("^\\s+|\\s+$","");
			cell3Content=cell3Content.replaceAll("^\\s+|\\s+$","");
			cell4Content=cell4Content.replaceAll("^\\s+|\\s+$","");
			cell5Content=cell5Content.replaceAll("^\\s+|\\s+$","");
			cell6Content=cell6Content.replaceAll("^\\s+|\\s+$","");
			cell7Content=cell7Content.replaceAll("^\\s+|\\s+$","");
			cell8Content=cell8Content.replaceAll("^\\s+|\\s+$","");
			cell9Content=cell9Content.replaceAll("^\\s+|\\s+$","");
			cell10Content=cell10Content.replaceAll("^\\s+|\\s+$","");
			cell11Content=cell11Content.replaceAll("^\\s+|\\s+$","");
			cell12Content=cell12Content.replaceAll("^\\s+|\\s+$","");
			cell13Content=cell13Content.replaceAll("^\\s+|\\s+$","");
			cell14Content=cell14Content.replaceAll("^\\s+|\\s+$","");
			cell15Content=cell15Content.replaceAll("^\\s+|\\s+$","");
			
			logger.info(" FirstName	LastName	Company	Designation	Age	Contact Email	Contact Mobile	Contact Mobile 2	Address	City	Pin Code	Campaign Name	Referral Name      Enable DC Tool          X-Ray");
			logger.info(cell1Content + "  " + cell2Content + "  "
							 + cell3Content + "  " + cell4Content + "  "
							 + cell5Content + "  " + cell6Content + "  "
							 + cell7Content + "  " + cell8Content + "  "
							 + cell9Content + "  " + cell10Content + "  "
							 + cell11Content + "  " + cell12Content + "  "
							 + cell13Content + "  " + cell14Content + "  " + cell15Content + "  ");
			
			
			
//			OpportunityData opportunityData = new OpportunityData();
			try{
			opportunityData.setFirstName(cell1Content);
			opportunityData.setLastName(cell2Content);
			opportunityData.setCompanyName(cell3Content);
			opportunityData.setDesignation(cell4Content);
			opportunityData.setAge(cell5Content);
			opportunityData.setContactEmail(cell6Content);
			opportunityData.setContactMobile(cell7Content);
			opportunityData.setContactMobile2(cell8Content);
			opportunityData.setAddress(cell9Content);
			opportunityData.setCity(cell10Content);
			opportunityData.setPinCode(cell11Content);
			opportunityData.setCampaignName(cell12Content);
			opportunityData.setContactReferalName(cell13Content);
			opportunityData.setEnableDCTool(cell14Content);
			opportunityData.setEnableXRayTool(cell15Content);
			opportunityData.setOwnerPartyID(ownerPartyId);
			opportunityData.setBuId(buId);

			String email=cell6Content;
			Validator validator = new Validator();			
			int resultMail=validator.emailvalid(email);
			
			
			String mob=cell7Content;
			int resultMob=validator.largeval(mob, 10);
			
			if (cell2Content.trim() != "" && cell6Content.trim() != "") {
				if(resultMail==0 || resultMob==0)
				{
					lstToCreateOpportunity.add(opportunityData);
				}else{
					lstFailedOpportunity.add(opportunityData);
				}
			} 
			else {
				lstFailedOpportunity.add(opportunityData);
			}
			
			}catch(Exception e){
				logger.error(e);
			}
			}catch(Exception e){
				logger.error(e);
			}
			numOfRows++;
		}
		logger.info("lstFailedOpportunity Size is:-------"+lstFailedOpportunity.size());
		logger.info("lstToCreateOpportunity Size is "+lstToCreateOpportunity.size());
		
		return lstToCreateOpportunity;
	}


	public List<OpportunityData> getLstSuccessOpportunity() {
		return lstSuccessOpportunity;
	}


	public void setLstSuccessOpportunity(List<OpportunityData> lstSuccessOpportunity) {
		this.lstSuccessOpportunity = lstSuccessOpportunity;
	}


	public List<OpportunityData> getLstFailedOpportunity() {
		return lstFailedOpportunity;
	}


	public void setLstFailedOpportunity(List<OpportunityData> lstFailedOpportunity) {
		this.lstFailedOpportunity = lstFailedOpportunity;
	}


	public List<OpportunityData> readXlsx() throws FileNotFoundException, IOException {
		List<OpportunityData> lstToCreateOpportunity = new ArrayList<OpportunityData>();
		
		MultipartFile bulkUploadFile= opportunityData.getLeadUpload()[0];
		int ownerPartyId=opportunityData.getOwnerPartyID();
		int buId=opportunityData.getBuId();
		
		XSSFWorkbook workbook = new XSSFWorkbook(bulkUploadFile.getInputStream());
		
		int numOfSheets = 0;
		List<OpportunityData> lstFailedOpportunity = new ArrayList<OpportunityData>();
		
		XSSFSheet sheet;
		sheet = workbook.getSheetAt(numOfSheets);
		int numRow = 1;

		XSSFRow rowIndex;
		
		while (numRow <= sheet.getLastRowNum()) {

			rowIndex = sheet.getRow(numRow);
			int numCol = 0;
			try {
				// while (numCol < 3) {
				XSSFCell cellIndex1 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex2 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex3 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex4 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex5 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex6 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex7 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex8 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex9 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex10 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex11 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex12 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex13 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex14 = rowIndex.getCell(numCol);
				numCol++;
				XSSFCell cellIndex15 = rowIndex.getCell(numCol);
				numCol++;
								
				String cell1Content = null;
				String cell2Content = null;
				String cell3Content = null;
				String cell4Content = null;
				String cell5Content = null;
				String cell6Content = null;
				String cell7Content =null;
				String cell8Content = null;
				String cell9Content = null;
				String cell10Content = null;
				String cell11Content = null;
				String cell12Content = null;
				String cell13Content = null;
				String cell14Content = null;
				String cell15Content = null;
				
				
				try{
					cell1Content = cellIndex1.toString();
				}catch(Exception e){}
				try{
					cell2Content = cellIndex2.toString();
				}catch(Exception e){
					cell2Content="";
				}
				try{
					cell3Content = cellIndex3.toString();
				}catch(Exception e){}
				try{
					cell4Content = cellIndex4.toString();
				}catch(Exception e){}
				try{
					cell5Content = cellIndex5.toString();
				}catch(Exception e){}
				try{
					cell6Content = cellIndex6.toString();
				}catch(Exception e){
					cell6Content="";
				}
				try{
					cell7Content = cellIndex7.toString();
				}catch(Exception e){}
				try{
					cell8Content = cellIndex8.toString();
				}catch(Exception e){}
				try{
					cell9Content = cellIndex9.toString();
				}catch(Exception e){}
				try{
					cell10Content = cellIndex10.toString();
				}catch(Exception e){}
				try{
					cell11Content = cellIndex11.toString();
				}catch(Exception e){}
				try{
					cell12Content = cellIndex12.toString();
				}catch(Exception e){}
				try{
					cell13Content = cellIndex13.toString();
				}catch(Exception e){}
				try{
					cell14Content = cellIndex14.toString();
				}catch(Exception e){}				
				try{
					cell15Content = cellIndex15.toString();
				}catch(Exception e){}
				
				logger.info(" FirstName	LastName	Company	Designation	Occupation	Age	Contact Email	Contact Mobile	Contact Mobile 2	Address	City	Pin Code	Campaign Name	Referral Name    Enable DC Tool");
				logger.info(cell1Content + "  " + cell2Content + "  "
						+ cell3Content + "  " + cell4Content + "  "
						+ cell5Content + "  " + cell6Content + "  "
						+ cell7Content + "  " + cell8Content + "  "
						+ cell9Content + "  " + cell10Content + "  "
						+ cell11Content + "  " + cell12Content + "  "
						+ cell13Content + "  " + cell14Content + "  ");
				
				
				OpportunityData opportunityData = new OpportunityData();
				try{
				opportunityData.setFirstName(cell1Content);
				opportunityData.setLastName(cell2Content);
				opportunityData.setCompanyName(cell3Content);
				opportunityData.setDesignation(cell4Content);
				opportunityData.setAge(cell5Content);
				opportunityData.setContactEmail(cell6Content);
				opportunityData.setContactMobile(cell7Content);
				opportunityData.setContactMobile2(cell8Content);
				opportunityData.setAddress(cell9Content);
				opportunityData.setCity(cell10Content);
				opportunityData.setPinCode(cell11Content);
				opportunityData.setCampaignName(cell12Content);
				opportunityData.setContactReferalName(cell13Content);
				opportunityData.setEnableDCTool(cell14Content);
				opportunityData.setOwnerPartyID(ownerPartyId);
				opportunityData.setBuId(buId);
				
				if (cell2Content.trim() != "" && cell6Content.trim() != "") {
					lstToCreateOpportunity.add(opportunityData);
				} else {
					lstFailedOpportunity.add(opportunityData);
				}
				
				}catch(Exception e){
					logger.error(e);
				}
				
			}catch(Exception e){
				logger.error(e);
			}
			numRow++;
		}
		logger.info("lstFailedOpportunity Size is:-------"+lstFailedOpportunity.size());
		
		return lstToCreateOpportunity;
	}
	
	private String getOpportunityToInsertXmlString(List<OpportunityData> lstToCreateOpportunity) {
		logger.info("lstToCreateOpportunity--------s"+lstToCreateOpportunity);
		int opportunityOwner = opportunityData.getOwnerPartyID();
		int buId=opportunityData.getBuId();
		if (lstToCreateOpportunity.size() > 0) {
			StringBuilder sb = new StringBuilder("<root>");
			Iterator<OpportunityData> it = lstToCreateOpportunity.iterator();
			while (it.hasNext()) {
				OpportunityData opportunityData = it.next();	
				
				sb.append("<Opportunity>");
				sb.append("<FirstName><![CDATA[" + opportunityData.getFirstName() + "]]></FirstName>");
				sb.append("<LastName><![CDATA[" + opportunityData.getLastName() + "]]></LastName>");
				sb.append("<CompanyName><![CDATA[" + opportunityData.getCompanyName() + "]]></CompanyName>");
				sb.append("<Designation><![CDATA[" + opportunityData.getDesignation() + "]]></Designation>");
				try {
					sb.append("<Age>" + opportunityData.getAge()
							+ "</Age>");
				} catch (Exception e) {
					sb.append("<Age>0</Age>");
				}
				
				sb.append("<ContactEmail><![CDATA[" + opportunityData.getContactEmail() + "]]></ContactEmail>");
				sb.append("<ContactMobile><![CDATA[" + opportunityData.getContactMobile() + "]]></ContactMobile>");
				sb.append("<ContactMobile2><![CDATA[" + opportunityData.getContactMobile2() + "]]></ContactMobile2>");// used Alternate Mobile 
				sb.append("<Address><![CDATA[" + opportunityData.getAddress() + "]]></Address>");
				sb.append("<City><![CDATA[" + opportunityData.getCity() + "]]></City>");				
				sb.append("<PinCode>" + opportunityData.getPinCode() + "</PinCode>");
				sb.append("<CampaignName><![CDATA[" + opportunityData.getCampaignName() + "]]></CampaignName>");
				sb.append("<ReferredBy><![CDATA[" + opportunityData.getContactReferalName() + "]]></ReferredBy>");				
				sb.append("<EnableDCTool><![CDATA[" + opportunityData.getEnableDCTool() + "]]></EnableDCTool>");
				sb.append("<EnableXRayTool><![CDATA[" + opportunityData.getEnableXRayTool() + "]]></EnableXRayTool>");
				sb.append("<ownerPartyId>" + opportunityData.getOwnerPartyID() + "</ownerPartyId>");
				sb.append("<buId>" + opportunityData.getBuId() + "</buId>");
				
				sb.append("</Opportunity>");
			}
			sb.append("</root>");
			logger.info("SB.toString()---------"+sb.toString());
			return sb.toString();
		}
		return null;
	}

	/**
	 * saves the notes details
	 * 
	 * @param request
	 * @param response
	 * @param noteText
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void saveNote(HttpServletRequest request,
			HttpServletResponse response, NotesData noteData)
			throws Exception {
		
		String result = FiinfraConstants.FAIL;
		
		String notetext=request.getParameter("notetext");		
		String partyId=request.getParameter("partyId");
		noteData.setNoteText(notetext);
		noteData.setPartyId(Integer.parseInt(partyId));
		noteData.setNoteId(Integer.parseInt(request.getParameter("noteId")));
		
		
//		request.getSession().setAttribute("NoteResult", result);
//		request.getSession().setAttribute("NoteId", 0);
				
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		int createdBy = userSession.getUserId();
		int buId = userSession.getBuId();
		noteData.setBuId(buId);
		noteData.setCreatedBy(createdBy);

		String url = FiinfraUtility.getRestDBURL();	//NOW

		url = URL_INSERT_NOTE_RECORD + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		
		ObjectMapper om = new CustomJacksonObjectMapper();//NOW
		String jsonString=om.writeValueAsString(noteData);//NOW
		
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());	//NOW
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, noteData, BaseResponse.class);
		int recordCount=0;
		List<Integer> resultList=new ArrayList<>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList=br.getResponseListObject();
		recordCount=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)), Integer.class);	
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);
	
	}

	/**
	 * deletes the query and related details
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void deleteNote(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String noteIds = request.getParameter("noteIds");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		
		url = URL_DELETE_NOTE + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("noteIds", noteIds);
		uriCB.queryParam("buId", buId);
		BaseResponse<String> br = new BaseResponse<String>();
		try {
			br = restTemplate.getForEntity(
					FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class)
					.getBody();
		} catch (Exception e) {
			logger.error(e);
		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, br.getStatus());// TO Do: here status can
														// be SUCCESS or
														// .EMPTY_RESULT_SET.
														// Accordingly handle
														// this in View.
	}
	
	
	/**
	 * deletes the Opportunity and related details
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void deleteOpportunities(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String partyIds = request.getParameter("partyIds");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int createdBy=userSession.getUserId();
		opportunityData.setCreatedBy(createdBy);
		
		url = URL_DELETE_OPPORTUNITY + userSession.getUserName() + "/1234";
		logger.info("url:-" + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyIds", partyIds);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("createdBy", createdBy);
		
		logger.info("PPPPPPPPPPPPPPPPPP-------------" + partyIds);
		BaseResponse<String> br = new BaseResponse<String>();
		try {
			br = restTemplate.getForEntity(
					FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class)
					.getBody();
		} catch (Exception e) {
			logger.error(e);
		}
		
		String eventTextXML="usp_cp_deleteOpportunities("+partyIds+","+createdBy+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(createdBy);
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.DELETE_OPPORTUNITY);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE_OPPORTUNITY);
		audit.setSourceScreen("Delete Opportunity");
		audit.setEventTextXML(eventTextXML);
		audit.setObjectName(partyIds);
		FrameworkUtil.audit(audit);	
		
		objectMapper.writeValue(out, br.getStatus());// TO Do: here status can
														// be SUCCESS or
														// .EMPTY_RESULT_SET.
														// Accordingly handle
														// this in View.
	}
	
	/**
	 * deletes the Opportunity and related details
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void bulkDCReminder(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String partyIds = request.getParameter("partyIds");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		
		logger.info("party IDS----************---"+partyIds);
		
		String delims = "[,]+";
		String[] tokens = partyIds.split(delims);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		for (int i = 0; i < tokens.length; i++){
			logger.info(tokens[i]);
			int partyId=Integer.parseInt(tokens[i]);
//			int contactPartyId=Integer.parseInt(request.getParameter("partyId"));
			logger.info("PartyId===="+partyId);
			
			Notification notification=null;
			notification=new Notification();
			notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
			notification.setNotifyPartyID(partyId);
			notification.setNotifyEventID(FiinfraConstants.DC_REMINDER);
			notification.setBuId(buId);
			notification.setSessionID(request.getSession().getId());
			FrameworkUtil.notify(notification);			
		}
		
		objectMapper.writeValue(out, FiinfraConstants.SUCCESS);
//		int contactPartyId=Integer.parseInt(request.getParameter("partyId"));
//		PrintWriter out = null;
//		out = response.getWriter();
//		response.setContentType("application/json");
//		Notification notification=null;
//		notification=new Notification();
//		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
//		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
//		notification.setNotifyPartyID(contactPartyId);
//		notification.setNotifyEventID(FiinfraConstants.DC_REMINDER);
//		notification.setBuId(buId);
//		notification.setSessionID(request.getSession().getId());
//		FrameworkUtil.notify(notification);
//		objectMapper.writeValue(out, FiinfraConstants.SUCCESS);
//		
		
//		url = URL_DELETE_OPPORTUNITY + userSession.getUserName() + "/1234";
//		logger.info("url:-"+url);
//		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
//		uriCB.queryParam("partyIds", partyIds);
//		uriCB.queryParam("buId", buId);
//		BaseResponse<String> br = new BaseResponse<String>();
//		try {
//			br = restTemplate.getForEntity(
//					FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class)
//					.getBody();
//		} catch (Exception e) {
//		}
//		
//		PrintWriter out = null;
//		out = response.getWriter();
//		response.setContentType("application/json");
//		objectMapper.writeValue(out, br.getStatus());
	}
	
	/**
	 * bulkXRayReminder the Opportunity and related details
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void bulkXRayReminder(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String partyIds = request.getParameter("partyIds");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		
		logger.info("party IDS----************---"+partyIds);
		
		String delims = "[,]+";
		String[] tokens = partyIds.split(delims);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		for (int i = 0; i < tokens.length; i++){
			logger.info(tokens[i]);
			int partyId=Integer.parseInt(tokens[i]);
//			int contactPartyId=Integer.parseInt(request.getParameter("partyId"));
			logger.info("PartyId===="+partyId);
			
			Notification notification=null;
			notification=new Notification();
			notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
			notification.setNotifyPartyID(partyId);
			notification.setNotifyEventID(FiinfraConstants.XRAY_REMINDER);
			notification.setBuId(buId);
			notification.setSessionID(request.getSession().getId());
			FrameworkUtil.notify(notification);			
		}
		
		objectMapper.writeValue(out, FiinfraConstants.SUCCESS);

	}
	
	public void updateFpplanType(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int fpPlanTypeId = Integer.parseInt(request.getParameter("fpPlanTypeId"));
		int dcInputPartyId = Integer.parseInt(request.getParameter("partyId"));
		String inflationRate="";
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int createdBy=userSession.getUserId();
		
		
		url = URL_UPDATE_FPPLANTYPE + userSession.getUserName() + "/1234";
		logger.info("url:-" + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("fpPlanTypeId", fpPlanTypeId);
		uriCB.queryParam("dcInputPartyId", dcInputPartyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("createdBy", createdBy);
		
		logger.info("PPPPPPPPPPPPPPPPPP-------------" + fpPlanTypeId+"    ,dcInputPartyId="+dcInputPartyId);
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			inflationRate=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), String.class);
		System.out.println("inflationRate in WEB="+inflationRate);
		HttpSession httpSession=request.getSession(true);
		httpSession.setAttribute("inflationRate_DcInput", inflationRate);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out,inflationRate);
	}
	public ModelAndView redirectDcfpt(HttpServletRequest request,
			HttpServletResponse response) throws IOException 
	{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int RECORD_TYPE_ID=Integer.parseInt(request.getParameter("recordTypeId"));
		int CONTACT_PARTYID=Integer.parseInt(request.getParameter("partyId"));
		String CONTACT_NAME=request.getParameter("pname");
		String USER_NAME=userSession.getUserName();
		logger.info("RECORD_TYPE_ID====="+RECORD_TYPE_ID);
		HttpSession sesion = request.getSession(false);
		String baseUrl="";
		  if ( ( request.getServerPort() == 80 ) ||
		           ( request.getServerPort() == 443 ) ){
		   baseUrl = request.getScheme() + "://" + request.getServerName() ;    
		  }
		  else{
		   baseUrl = request.getScheme() + "://" +
		           request.getServerName() + ":" + request.getServerPort();    
		  }
		sesion.invalidate();
		logger.info("After invalidating Session====="+userSession.getUserName());
		String sourceSystemId = Integer.toString(FiinfraConstants.PARTNER_PORTAL);
		String securityToken = "";
		
		try {
			securityToken = FiinfraToken.generateRestToken("username", sourceSystemId, request.getLocalAddr());
		} catch (FiinfraTokenException e) {
			logger.info("Exception:  "+e.getMessage());
		}
		url = baseUrl+"/FIINFRA-M-WEB/partner/loadhome.htm?TOKEN=abc&USER_NAME="+USER_NAME+"&securityToken="+securityToken+"&RECORD_TYPE_ID="+RECORD_TYPE_ID+"&CONTACT_PARTYID="+CONTACT_PARTYID+"&CONTACT_NAME="+CONTACT_NAME; 
		System.out.println("URL="+url);
		return new ModelAndView("redirect:"+url);
	}
	
	public ModelAndView xray(HttpServletRequest request,
			HttpServletResponse response) throws IOException 
	{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId= Integer.parseInt(request.getParameter("partyId"));
		String name = request.getParameter("name");
		
		
		ModelAndView mav = new ModelAndView("utility/ShubhchintakDC/x-ray");	
		
		mav.addObject("partyId", partyId);
		mav.addObject("name", name);
		return mav;
	}
	public RestTemplate getRestTemplate() {
		return restTemplate;
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


	public List<OpportunityData> getLstExistingOpportunity() {
		return lstExistingOpportunity;
	}


	public void setLstExistingOpportunity(
			List<OpportunityData> lstExistingOpportunity) {
		this.lstExistingOpportunity = lstExistingOpportunity;
	}
	
	
	
}