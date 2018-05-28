package in.fiinfra.client.controller;

import in.fiinfra.common.client.ClientData;
import in.fiinfra.common.client.ClientProfileData;
import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.opportunity.OpportunityStageData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.GridData;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.util.Logger;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class ClientController extends MultiActionController{

	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	
	@Value("${URL_GET_CLIENT_LIST}")
	private String URL_GET_CLIENT_LIST;
	@Value("${URL_INSERT_CLIENT_RECORD}")
	private String URL_INSERT_CLIENT_RECORD;
	private String sectionName;
	final String SOURCE_MODULE = "Client Profile";
	final String SOURCE_MODULE_CLIENT = "Client";
	
	String url;
	@Value("${URL_GET_CLIENT_PROFILE_RECORD}")
	private String URL_GET_CLIENT_PROFILE_RECORD;
	@Value("${URL_UPDATE_CLIENT_PROFILE}")
	private String URL_UPDATE_CLIENT_PROFILE;
	@Value("${URL_DELETE_CLIENT}")
	private String URL_DELETE_CLIENT;
	@Value("${URL_UPDATE_DC_PERSONALINFORMATION_RECORD}")
	private String URL_UPDATE_DC_PERSONALINFORMATION_RECORD;
	@Value("${URL_GET_CLIENT_STAGE_LIST}")
	private String URL_GET_CLIENT_STAGE_LIST;
	@Value("${URL_GET_CLIENT_List_TO_MERGE}")
	private String URL_GET_CLIENT_List_TO_MERGE;
	@Value("${URL_MERGE_CLIENTS}")
	private String URL_MERGE_CLIENTS;
	
	
	/**
	 * retrieves Client list based on the party.
	 * @param request
	 * @param response
	 * @return
	 */
	
	@SuppressWarnings("unchecked")
	public ModelAndView getClientList(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		int autoPlanClient=0;
		try{
			autoPlanClient=Integer.parseInt(request.getParameter("autoPlanClient"));
		}catch(Exception e){
			autoPlanClient=0;
		}
		String clientValueSearch = request.getParameter("value");
		ModelAndView mav = new ModelAndView("client/client");	
		mav.addObject("pagesize", pagesize);
		mav.addObject("autoPlanClient", autoPlanClient);
		mav.addObject("value", clientValueSearch);
		return mav;
	}
//	@SuppressWarnings("unchecked")
//	public ModelAndView getClientList(HttpServletRequest request,
//			HttpServletResponse response){
//		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
//		int buId=userSession.getBuId();
////		int partyId=userSession.getPartyId();
//		int partyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
//		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
//		
//		boolean IsAutoPlan=false;
//		String pagesize=request.getParameter("pageSize");
//		if(pagesize==null){
//			pagesize="10";
//		}
//		int autoPlanClient=0;
//		try{
//			autoPlanClient=Integer.parseInt(request.getParameter("autoPlanClient"));
//			if(autoPlanClient==1){
//				IsAutoPlan=true;
//			}
//		}catch(Exception e){
//			
//		}
//		
//		 String clientValueSearch = request.getParameter("value");
//		 logger.info("search value ......."+clientValueSearch);
//		 logger.info("partyId "+partyId);
//		 
//	
//		String url = FiinfraUtility.getRestDBURL();
//		url=URL_GET_CLIENT_LIST + userSession.getUserName() + "/1234";
//		logger.info("URL----------->"+url);
//		
//		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
//		uriCB.queryParam("partyId", partyId);
//		uriCB.queryParam("buId", buId);
//		uriCB.queryParam("clientValueSearch", clientValueSearch);
//		uriCB.queryParam("IsAutoPlan", IsAutoPlan);
//		uriCB.queryParam("nodeId", nodeId);
//		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
//				.currentThread().getStackTrace()[1].getMethodName());
//		
//		BaseResponse<ClientData> br = new BaseResponse<ClientData>();
//		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
//	
//		List<ClientData> clientDatas=new ArrayList<>();	
//		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
//			clientDatas=br.getResponseListObject();
//		
//		Logger.logEntry(this.getClass(), "clientDatas:---" + clientDatas, Logger.DEBUG,
//				Thread.currentThread().getStackTrace()[1].getMethodName());
//		
//		ModelAndView mav = new ModelAndView("client/client");	
//		mav.addObject("clientDatas", clientDatas);
//		mav.addObject("pagesize", pagesize);
//		mav.addObject("autoPlanClient", autoPlanClient);
//		
//		return mav;
//	}
	
	
	@SuppressWarnings("unchecked")
	public void getClientGrid(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		System.out.println("In Client Grid");
		int buId=userSession.getBuId();
//		int partyId=userSession.getPartyId();
		int partyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		boolean IsAutoPlan=false;
		int pageSize=request.getParameter("rows")==null?10:Integer.valueOf(request.getParameter("rows").toString());
		int pageNo=request.getParameter("page")==null?0:Integer.valueOf(request.getParameter("page").toString());
		String orderBy=request.getParameter("sidx")==null?"party.LastModifiedDate":request.getParameter("sidx").toString();
		String sord=request.getParameter("sord")==null?"desc":request.getParameter("sord").toString();
				
		String clientValueSearch = request.getParameter("value");
		
		int autoPlanClient=0;
		try{
			autoPlanClient=Integer.parseInt(request.getParameter("autoPlanClient"));
			if(autoPlanClient==1){
				IsAutoPlan=true;
			}
		}catch(Exception e){
			
		}
		
		String url = FiinfraUtility.getRestDBURL();
		
		//url = url + "services/opportunity/getOpportunitiesList/"+userSession.getUserName()+"/1234";
		url=URL_GET_CLIENT_LIST + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("clientValueSearch", clientValueSearch);
		uriCB.queryParam("IsAutoPlan", IsAutoPlan);
		uriCB.queryParam("nodeId", nodeId);
		uriCB.queryParam("pageNo", pageNo);
		uriCB.queryParam("pageSize", pageSize);
		uriCB.queryParam("orderBy", orderBy);
		uriCB.queryParam("sord", sord);
		
		BaseResponse<GridData> br = new BaseResponse<GridData>();
		logger.info("-----------Before Calling APP In Web(getClientGrid)-----------");
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		logger.info("-----------After Calling APP In Web(getClientGrid)-----------");
		GridData gridData=new GridData();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			gridData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), GridData.class);	
		System.out.println("gridData:---"+gridData);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, gridData);
	}
	
	
	public void getClientListXLS(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		int partyId=userSession.getPartyId();
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		boolean IsAutoPlan=false;
		int pageSize=request.getParameter("rows")==null?100000:Integer.valueOf(request.getParameter("rows").toString());
		int pageNo=request.getParameter("page")==null?0:Integer.valueOf(request.getParameter("page").toString());
		String orderBy=request.getParameter("sidx")==null?"party.LastModifiedDate":request.getParameter("sidx").toString();
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		int autoPlanClient=0;
		try{
			autoPlanClient=Integer.parseInt(request.getParameter("autoPlanClient"));
			if(autoPlanClient==1){
				IsAutoPlan=true;
			}
		}catch(Exception e){
			
		}
		logger.info("pageSize------"+pagesize);
		
		 String clientValueSearch = request.getParameter("value");
		 logger.info("search value ......."+clientValueSearch);
		 logger.info("partyId------------>>>>>>>"+partyId);
		String url = FiinfraUtility.getRestDBURL();
		url=URL_GET_CLIENT_LIST + userSession.getUserName() + "/1234";
		logger.info("URL----------->"+url);
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("clientValueSearch", clientValueSearch);
		uriCB.queryParam("IsAutoPlan", IsAutoPlan);
		uriCB.queryParam("nodeId", nodeId);
		uriCB.queryParam("pageNo", pageNo);
		uriCB.queryParam("pageSize", pageSize);
		uriCB.queryParam("orderBy", orderBy);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<ClientData> clientDatas=new ArrayList<>();	
		List<ClientData> clientList=new ArrayList<>();	
		BaseResponse<GridData> br = new BaseResponse<GridData>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		GridData gridData=new GridData();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			gridData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), GridData.class);
			clientDatas=gridData.getRows();
		}
		 logger.info("autoPlanClient ......."+autoPlanClient);
				for(int i = 0; i<clientDatas.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					ClientData clientData;
					clientData = objectMapper.readValue(objectMapper.writeValueAsString(clientDatas.get(i)), ClientData.class);
					clientList.add(clientData);
				}

		response.addHeader("Content-type", "application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename=ClientList.xls");
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font=workbook.createFont();
        /* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        /* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet("Client List");
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
		cell.setCellValue("PAN No.");
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
		if(autoPlanClient==0){
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Stage");
	}{	HSSFCell cell =  excelRow.createCell(column++);
	cell.setCellStyle(style);
	cell.setCellValue("Auto Plan Client");
}
		}else{
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Status");
	}
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Action Comments");
	}


		for(ClientData clientData:clientList){
			column = 0;
			excelRow =  sheet.createRow(rowNum++);
			{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(clientData.getName());
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(clientData.getRmHead());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(clientData.getCity());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(clientData.getPanNo());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(clientData.getCreatedDate());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(clientData.getEmail());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(clientData.getMobile());
		}
			
			if(autoPlanClient==1){
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(clientData.getAction());
			}}else{
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(clientData.getStage());
			}
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				if(clientData.getAction().equals("1"))
					cell.setCellValue("Yes");
				else
					cell.setCellValue("No");
			}
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(clientData.getActionComments());
		}

		}

		workbook.write(response.getOutputStream());
	}
	
	public void getClientListCSV(HttpServletRequest request, HttpServletResponse response) throws IOException {

		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		int partyId=userSession.getPartyId();
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		boolean IsAutoPlan=false;
		int pageSize=request.getParameter("rows")==null?100000:Integer.valueOf(request.getParameter("rows").toString());
		int pageNo=request.getParameter("page")==null?0:Integer.valueOf(request.getParameter("page").toString());
		String orderBy=request.getParameter("sidx")==null?"party.LastModifiedDate":request.getParameter("sidx").toString();
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		int autoPlanClient=0;
		try{
			autoPlanClient=Integer.parseInt(request.getParameter("autoPlanClient"));
			if(autoPlanClient==1){
				IsAutoPlan=true;
			}
		}catch(Exception e){
			
		}
		logger.info("pageSize------"+pagesize);
		
		 String clientValueSearch = request.getParameter("value");
		logger.info("search value ......."+clientValueSearch);
		logger.info("partyId------------>>>>>>>"+partyId);
		String url = FiinfraUtility.getRestDBURL();
		url=URL_GET_CLIENT_LIST + userSession.getUserName() + "/1234";
		logger.info("URL----------->"+url);
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("clientValueSearch", clientValueSearch);
		uriCB.queryParam("IsAutoPlan", IsAutoPlan);
		uriCB.queryParam("nodeId", nodeId);
		uriCB.queryParam("pageNo", pageNo);
		uriCB.queryParam("pageSize", pageSize);
		uriCB.queryParam("orderBy", orderBy);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<ClientData> clientDatas=new ArrayList<>();	
		List<ClientData> clientList=new ArrayList<>();	
		BaseResponse<GridData> br = new BaseResponse<GridData>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		GridData gridData=new GridData();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			gridData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), GridData.class);
			clientDatas=gridData.getRows();
		}
				for(int i = 0; i<clientDatas.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					ClientData clientData;
					clientData = objectMapper.readValue(objectMapper.writeValueAsString(clientDatas.get(i)), ClientData.class);
					clientList.add(clientData);
				}
			response.addHeader("Content-Disposition", "attachment;filename=ClientList.csv");
			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Name"));
			writer.print(",");
			writer.print(CommonUtils.escape("RM"));
			writer.print(",");
			writer.print(CommonUtils.escape("City"));
			writer.print(",");
			writer.print(CommonUtils.escape("PAN No."));
			writer.print(",");
			writer.print(CommonUtils.escape("Created Date"));
			writer.print(",");
			writer.print(CommonUtils.escape("Email Id"));
			writer.print(",");
			writer.print(CommonUtils.escape("Contact Number"));
			writer.print(",");
			if(autoPlanClient==0){
			writer.print(CommonUtils.escape( "Stage"));
			writer.print(",");
			writer.print(CommonUtils.escape( "Auto Plan Client"));
			writer.print(",");
			}else{
				writer.print(CommonUtils.escape( "Status"));
				writer.print(",");
			}
			writer.print(CommonUtils.escape("Action Comments"));
			
			writer.println();
			for(ClientData clientData:clientList){
				writer.print(CommonUtils.escape(clientData.getName()));
				writer.print(",");
				writer.print(CommonUtils.escape(clientData.getRmHead()));
				writer.print(",");
				writer.print(CommonUtils.escape(clientData.getCity()));
				writer.print(",");
				writer.print(CommonUtils.escape(clientData.getPanNo()));
				writer.print(",");
				writer.print(CommonUtils.escape(clientData.getCreatedDate()));
				writer.print(",");
				writer.print(CommonUtils.escape(clientData.getEmail()));
				writer.print(",");
				writer.print(CommonUtils.escape(""+clientData.getMobile()));
				writer.print(",");
				if(autoPlanClient==0){
				writer.print(CommonUtils.escape(clientData.getStage()));
				writer.print(",");
				if(clientData.getAction().equals("1"))
					writer.print(CommonUtils.escape("Yes"));
				else
					writer.print(CommonUtils.escape("No"));
				writer.print(",");
				}else{
					writer.print(CommonUtils.escape(clientData.getAction()));
					writer.print(",");
				}
				writer.print(CommonUtils.escape(clientData.getActionComments()));
				writer.println();
			}
	}
	
	public void getClientStageList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
//		int partyId=userSession.getPartyId();
		int partyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());

		logger.info("partyId========="+partyId);
		
		int buId=userSession.getBuId();		
	
		url=URL_GET_CLIENT_STAGE_LIST + userSession.getUserName() + "/1234";
		logger.info("URL------------>"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//uriCB.queryParam("buId",buId);
		uriCB.queryParam("partyId",partyId);
		uriCB.queryParam("buId",buId);
		uriCB.queryParam("nodeId", nodeId);
		
		BaseResponse<OpportunityStageData> br = new BaseResponse<OpportunityStageData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<OpportunityStageData> clientStageDatas=new ArrayList<>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			clientStageDatas=br.getResponseListObject();			
		}
		
		//opportunityData.setPartyId(partyId);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, clientStageDatas);
	}

	
	@SuppressWarnings("unchecked")
	public void getClientProfileDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		int buId = userSession.getBuId();
		String partyId=request.getParameter("partyId");
		
		url = URL_GET_CLIENT_PROFILE_RECORD + userSession.getUserName()
				+ "/1234";
		logger.info("URL --> " + url);
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		
		BaseResponse<ClientProfileData> br = new BaseResponse<ClientProfileData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),BaseResponse.class).getBody();
		
		ClientProfileData clientProfileData = new ClientProfileData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			clientProfileData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					ClientProfileData.class);
		logger.info("clientProfileData Pro Data----------"+objectMapper.writeValueAsString(clientProfileData) );
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, clientProfileData);
	}
	
	/**
	 * save the client details
	 * 
	 * @param request
	 * @param response
	 * @param clientData
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void saveClient(HttpServletRequest request,
			HttpServletResponse response, ClientData clientData) throws Exception {
		
		String result="fail";
		request.getSession().setAttribute("OpportunityResult", result);
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int clientOwner = Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int buId=userSession.getBuId();
		clientData.setBuId(buId);
		clientData.setCreatedBy(createdBy);
		clientData.setOwnerPartyID(clientOwner);

		long currentTime = new Date().getTime();
		
		String url = FiinfraUtility.getRestDBURL();
		url=URL_INSERT_CLIENT_RECORD + userSession.getUserName() + "/1234";
		logger.info("URL----------->"+url);
		
		ObjectMapper om = new CustomJacksonObjectMapper();
		String jsonString=om.writeValueAsString(clientData);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, clientData, BaseResponse.class);
		int recordCount=0;
		List<Integer> resultList=new ArrayList<>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList=br.getResponseListObject();
		recordCount=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)), Integer.class);	
		int clientPartyId=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)), Integer.class);		
		int isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(2)),Integer.class);
		
		String eventTextXML="usp_cp_saveClient("+clientOwner+","+FiinfraUtility.getClientXMLString(clientData)+","+createdBy+")";
		logger.info("eventTextXML========="+eventTextXML);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(userSession.getPartyId());
		audit.setObjectName(String.valueOf(clientPartyId));
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.SAVE_CLIENT);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE_CLIENT);
		audit.setSourceScreen("Add Client");
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
//		objectMapper.writeValue(out, recordCount);

		objectMapper.writeValue(out, resultList);
	}

	
	
	@SuppressWarnings("unchecked")
	public void saveClientProfile(HttpServletRequest request,
			HttpServletResponse response, ClientProfileData clientProfileData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_CLIENT_PROFILE + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		String partyId=request.getParameter("partyId");
		int lastModifiedBy = userSession.getUserId();
		clientProfileData.setPartyId(Integer.parseInt(partyId));
		clientProfileData.setBuId(buId);
		clientProfileData.setSectionName(sectionName);
		clientProfileData.setLastModifiedBy(lastModifiedBy);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, clientProfileData, BaseResponse.class);
		int recordCount = 0;
		List<Integer> resultList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList=br.getResponseListObject();
			recordCount = objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)),Integer.class);
			int isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)),Integer.class);
			
		String eventTextXML="usp_cp_saveClientProfileDetails("+partyId+","+sectionName+","+FiinfraUtility.getClientProfileDataXML(clientProfileData, sectionName)+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
					
			
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		
		Audit audit = new Audit();
		audit.setActionByPartyId(Integer.parseInt(partyId));
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.CLIENT_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
//		objectMapper.writeValue(out, recordCount);
		objectMapper.writeValue(out, resultList);
	}
	
	@SuppressWarnings("unchecked")
	public void saveClientProfileAddressData(HttpServletRequest request,
			HttpServletResponse response, AddressData addressData)
			throws Exception {

		
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_CLIENT_PROFILE + userSession.getUserName() + "/1234";
		logger.info("URL --> " + url);
		int buId = userSession.getBuId();
		String partyId=request.getParameter("partyId");
		int lastModifiedBy = userSession.getUserId();
		ClientProfileData clientProfileData = new ClientProfileData();
		clientProfileData.setPartyId(Integer.parseInt(partyId));
		clientProfileData.setBuId(buId);
		clientProfileData.setSectionName(sectionName);
		clientProfileData.setContactEmail(request.getParameter("contactEmail"));
		clientProfileData.setContactMobile(request.getParameter("contactMobile"));
		clientProfileData.setContactMobile2(request.getParameter("contactMobile2"));
		clientProfileData.setLastModifiedBy(lastModifiedBy);
		List<AddressData> addressDatas = new ArrayList<>();
		addressDatas.add(addressData);
		clientProfileData.setAddressDataList(addressDatas);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, clientProfileData, BaseResponse.class);
		int recordCount = 0;
		int isPanExist = 0;
		List<Integer> resultList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList=br.getResponseListObject();
			recordCount = objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)),Integer.class);
			isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)),Integer.class);
//			recordCount = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()),Integer.class);
		
		String eventTextXML="usp_cp_saveClientProfileDetails("+partyId+","+sectionName+","+FiinfraUtility.getClientProfileDataXML(clientProfileData, sectionName)+","+lastModifiedBy+")";
		logger.info("eventTextXML========="+eventTextXML);
							
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(Integer.parseInt(partyId));
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.CLIENT_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, resultList);
//		objectMapper.writeValue(out, recordCount);
	}

	
	@SuppressWarnings("unchecked")
	public void saveClientProfileFamilyMemberData(HttpServletRequest request,
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
		//audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.CLIENT_PROFILE_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE);
		audit.setSourceScreen(sectionName);
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		objectMapper.writeValue(out, responseList);
//		objectMapper.writeValue(out, recordCount);
	}
	
	
	
	/**
	 * deletes the client and related details
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void deleteClients(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String partyIds = request.getParameter("partyIds");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int createdBy=userSession.getUserId();
		ClientData clientData = new ClientData();
		clientData.setCreatedBy(createdBy);
		
		url = URL_DELETE_CLIENT + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyIds", partyIds);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("createdBy", createdBy);
		
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
		audit.setEventID(FiinfraConstants.DELETE_CLIENT);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE_CLIENT);
		audit.setSourceScreen("Delete Client");
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
	 * merge the other Clients
	 * By Vaibhav Deshmukh
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public ModelAndView getClientListToMerge(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
	
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		//int partyId=userSession.getPartyId();
		int partyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		
		int contactpartyId = Integer.parseInt(request.getParameter("contactpartyId"));
		boolean isAllClients=Boolean.parseBoolean(request.getParameter("isAllClients"));
		boolean isFromProfile = Boolean.parseBoolean(request.getParameter("isFromProfile"));
		HttpSession session = request.getSession(true);
		if (contactpartyId!=0){
		session.setAttribute("contactPartyIdForMerge", contactpartyId);
		}
		String searchString= request.getParameter("value");
		logger.info("searchString------------>>>>>>>"+searchString);
		logger.info("contactpartyId ......."+contactpartyId);
		logger.info("contactpartyId session ......."+session.getAttribute("contactPartyIdForMerge"));
		logger.info("partyId------------>>>>>>>"+partyId);
		logger.info("isAllClients------------>>>>>>>"+isAllClients);
		String url = FiinfraUtility.getRestDBURL();
		url=URL_GET_CLIENT_List_TO_MERGE + userSession.getUserName() + "/1234";
//		logger.info("URL----------->"+url);
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("contactpartyId", contactpartyId);
		uriCB.queryParam("isAllClients", isAllClients);
		uriCB.queryParam("isFromProfile", isFromProfile);
		uriCB.queryParam("nodeId", nodeId);
		uriCB.queryParam("searchString", searchString);
//		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
//				.currentThread().getStackTrace()[1].getMethodName());
		
		BaseResponse<ClientData> br = new BaseResponse<ClientData>();
		br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
	
		List<ClientData> mergeclientDatas=new ArrayList<>();	
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			mergeclientDatas=br.getResponseListObject();
		ModelAndView mav;
		if(isFromProfile==true)
		{
			 mav = new ModelAndView("opportunity/opportunity_profile?partyId="+contactpartyId);
			 //mav.addObject("partyId", contactpartyId);
		}
		else{
		 mav = new ModelAndView("client/client");	
		}
		mav.addObject("mergeclientDatas", mergeclientDatas);
		mav.addObject("contactpartyidmerge", contactpartyId);
		return mav;
//		Logger.logEntry(this.getClass(), "clientDatas:---" + mergeclientDatas, Logger.DEBUG,
//				Thread.currentThread().getStackTrace()[1].getMethodName());
		
		
		
		
	}
	
	public void mergeClients(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String mergeClientIds = request.getParameter("mergeClientId");
		int contactPartyId=Integer.parseInt(request.getParameter("contactPartyId_MergeClient"));
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int buId = userSession.getBuId();
		
		//int partyId=request.getSession().setAttribute("oldpartyId", userSession.getPartyId());
		HttpSession session = request.getSession(true);
		int partyId =Integer.parseInt(session.getAttribute("oldpartyId").toString());
		url = URL_MERGE_CLIENTS + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("mergeClientIds", mergeClientIds);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("contactPartyId", contactPartyId);
		
		String eventTextXML="usp_cp_mergeClients("+partyId+","+mergeClientIds+","+contactPartyId+")";
		logger.info("eventTextXML========="+eventTextXML);
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
		
		Audit audit = new Audit();
		audit.setActionByPartyId(createdBy);
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.MERGE_CLIENT);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE_CLIENT);
		audit.setSourceScreen("Merge Client");
		audit.setObjectName(String.valueOf(partyId));
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);		
		
		objectMapper.writeValue(out, br.getStatus());// TO Do: here status can
														// be SUCCESS or
														// .EMPTY_RESULT_SET.
														// Accordingly handle
														// this in View.
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

}
