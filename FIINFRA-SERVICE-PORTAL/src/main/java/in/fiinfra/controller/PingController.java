package in.fiinfra.controller;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.common.TagData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;
import in.fiinfra.cp.CommonUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class PingController extends MultiActionController {

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(PingController.class);
	
	private RestTemplate restTemplate;

	private ObjectMapper objectMapper;

	String url;

	@Value("${URL_GET_STANDARD_PING_LIST}")
	private String URL_GET_STANDARD_PING_LIST;
	
	@Value("${URL_GET_PICKLIST_VALUE_LIST}")
	private String URL_GET_PICKLIST_VALUE_LIST;
	
	@Value("${URL_GET_TAG_LIST_PING}")
	private String URL_GET_TAG_LIST_PING;
	
	@Value("${URL_GET_TAG_VALUE_LIST}")
	private String URL_GET_TAG_VALUE_LIST;
	
	@Value("${URL_GET_STANDARD_TAGS_NOTIFICATIONTARGET}")
	private String URL_GET_STANDARD_TAGS_NOTIFICATIONTARGET;
	
	@Value("${URL_GET_PING_RECORD}")
	private String URL_GET_PING_RECORD;
	
	@Value("${URL_RESOLVE_TAGS_TEMPLATE_XML}")
	private String URL_RESOLVE_TAGS_TEMPLATE_XML;
	
	@Value("${URL_SEND_CUSTOM_PING}")
	private String URL_SEND_CUSTOM_PING;
	
	@Value("${URL_GET_DOCUMENT_RECORD}")
	private String URL_GET_DOCUMENT_RECORD;
	
	@Value("${URL_SAVE_PING}")
	private String URL_SAVE_PING;
	
	@Value("${URL_UPDATE_PING_RECIPIENT}")
	private String URL_UPDATE_PING_RECIPIENT;
	
	@Value("${URL_DELETE_PING}")
	private String URL_DELETE_PING;

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

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getPings", method = RequestMethod.GET)
	public ModelAndView getPings(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		url = URL_GET_STANDARD_PING_LIST + userSession.getUserName() + "/1234";
		logger.info("url:-" + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("partyId", buId);
		uriCB.queryParam("buId", buId);
		BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<NotifyTemplateData> notifyTemplateDatas = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			notifyTemplateDatas = br.getResponseListObject();
		ModelAndView mav = new ModelAndView("ping/pings");
//		mav.addObject("notifyTemplateDatas", notifyTemplateDatas);
		mav.addObject("notifyTemplateDatas", objectMapper.writeValueAsString(notifyTemplateDatas));
		mav.addObject("pagesize", pagesize);
		return mav;
	}

	@SuppressWarnings("unchecked")
	public void getPingsExport(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		url = URL_GET_STANDARD_PING_LIST + userSession.getUserName() + "/1234";
		logger.info("url:-" + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("partyId", buId);
		uriCB.queryParam("buId", buId);
		BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<NotifyTemplateData> notifyTemplateDatas = new ArrayList<>();
		List<NotifyTemplateData> notifyTemplateDatas1 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			notifyTemplateDatas = br.getResponseListObject();
		for (int i = 0; i < notifyTemplateDatas.size(); i++) {
			// get the actual party object from its LinkedHashMap representation
			NotifyTemplateData noTemplateData;
			noTemplateData = objectMapper
					.readValue(objectMapper
							.writeValueAsString(notifyTemplateDatas.get(i)),
							NotifyTemplateData.class);
			notifyTemplateDatas1.add(noTemplateData);
		}
		String type = request.getParameter("type");

		if (type != null && type.equals("XLS")) {

			response.addHeader("Content-type", "application/vnd.ms-excel");
			response.addHeader("Content-Disposition",
					"attachment;filename=PingList.xls");

			HSSFWorkbook workbook = new HSSFWorkbook();
			CellStyle style = workbook.createCellStyle();
			HSSFFont font = workbook.createFont();
			/* set the weight of the font */
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			/* attach the font to the style created earlier */
			style.setFont(font);
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

			HSSFSheet sheet = workbook.createSheet("Ping List");
			int rowNum = 0;
			int column = 0;
			HSSFRow excelRow = sheet.createRow(rowNum++);
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue("Ping Name");
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue("Ping Owner");
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue("Tag List");
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue("Schedule Count");
			}

			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue("Recipient Count");
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue("Creation Date");
			}

			for (NotifyTemplateData notifyTemplateData : notifyTemplateDatas1) {
				column = 0;
				excelRow = sheet.createRow(rowNum++);
				{
					HSSFCell cell = excelRow.createCell(column++);
					cell.setCellStyle(style);
					cell.setCellValue(notifyTemplateData.getName());
				}
				{
					HSSFCell cell = excelRow.createCell(column++);
					cell.setCellStyle(style);
					cell.setCellValue(notifyTemplateData.getPingOwner());
					
				}
				{
					HSSFCell cell = excelRow.createCell(column++);
					cell.setCellStyle(style);
					cell.setCellValue(notifyTemplateData.getTagList());
				}
				{
					HSSFCell cell = excelRow.createCell(column++);
					cell.setCellStyle(style);
					cell.setCellValue(notifyTemplateData.getScheduleCount());
				}
				{
					HSSFCell cell = excelRow.createCell(column++);
					cell.setCellStyle(style);
					cell.setCellValue(notifyTemplateData.getRecipientCount());
				}
				{
					HSSFCell cell = excelRow.createCell(column++);
					cell.setCellStyle(style);
					cell.setCellValue(notifyTemplateData.getCreatedDate());
				}

			}

			workbook.write(response.getOutputStream());
		}

		if (type != null && type.equals("CSV")) {
			response.addHeader("Content-Disposition",
					"attachment;filename=PingList.csv");
			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Ping Name"));
			writer.print(",");
			writer.print(CommonUtils.escape("Ping Owner"));
			writer.print(",");
			writer.print(CommonUtils.escape("Tag List"));
			writer.print(",");
			writer.print(CommonUtils.escape("Schedule Count"));
			writer.print(",");
			writer.print(CommonUtils.escape("Recipient Count"));
			writer.print(",");
			writer.print(CommonUtils.escape("Creation Date"));
			writer.print(",");

			writer.println();
			for (NotifyTemplateData notifyTemplateData : notifyTemplateDatas1) {
				writer.print(CommonUtils.escape(notifyTemplateData.getName()));
				writer.print(",");
				writer.print(CommonUtils.escape(notifyTemplateData
						.getPingOwner()));
				writer.print(",");
				writer.print(CommonUtils.escape(notifyTemplateData.getTagList()));
				writer.print(",");
				writer.print(CommonUtils.escape(""
						+ notifyTemplateData.getScheduleCount()));
				writer.print(",");
				writer.print(CommonUtils.escape(""
						+ notifyTemplateData.getRecipientCount()));
				writer.print(",");
				writer.print(CommonUtils.escape(notifyTemplateData
						.getCreatedDate()));
				writer.println();
			}
		}

	}
	
	@RequestMapping(value = "/addPing", method = RequestMethod.GET)
	public ModelAndView addPing(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("ping/addping");
		String id = request.getParameter("notifyTemplateId");
		String action = "Add";
		if (id != null && id!="") {
			action = "Edit";
		}
		mav.addObject("action", action);
		return mav;
	}
	
	//web project common controller copied here
	@SuppressWarnings("unchecked")
	public void getPicklistValues(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_PICKLIST_VALUE_LIST+"xyz/1234";
		String codeTypeIds=request.getParameter("codeTypeIds");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("codeTypeIds", codeTypeIds);
		uriCB.queryParam("buId", FiinfraConstants.AXISMFBUID);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			 codeValueDataList= br.getResponseListObject();
		
		Logger.logEntry(this.getClass(), "codeValueDataList:---"
				+ codeValueDataList, Logger.DEBUG, Thread.currentThread()
				.getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);
	}
	
	@SuppressWarnings("unchecked")
	public void getTagListAddPing(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		url = URL_GET_TAG_LIST_PING + "abc" + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<TagData> br = new BaseResponse<TagData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<TagData> tagDatas = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			tagDatas = br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, tagDatas);
	}
	
	@SuppressWarnings("unchecked")
	public void getTagValueList(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_GET_TAG_VALUE_LIST + "abc" + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("notifyTagId", request.getParameterValues("notifyTagId"));
		uriCB.queryParam("buId", buId);
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<CodeValueData> codeValueDatas = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDatas = br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDatas);
	}
	
	@SuppressWarnings("unchecked")
	public void getStandardTags(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_GET_STANDARD_TAGS_NOTIFICATIONTARGET + "abc" + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("notifyTargetId", request.getParameterValues("notifyTarget"));
		uriCB.queryParam("buId", buId);
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<CodeValueData> codeValueDatas = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDatas = br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDatas);
	}
	
	@SuppressWarnings("unchecked")
	public void getPingDetails(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_GET_PING_RECORD + "abc" + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("notifyTemplateId", request.getParameterValues("notifyTemplateId"));
		uriCB.queryParam("buId", buId);
		BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		NotifyTemplateData notifyTemplateData = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			notifyTemplateData = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), NotifyTemplateData.class);
		
		
		
	String AddPingList="notifyTemplateIds="+notifyTemplateData.getNotifyTemplateID();
		
	String SP_RETRIVE_PING_RECORD ="{CALL usp_cp_getPingDetails(?)}";
		
		FiinfraUtility.doAudit(userSession.getPartyId(),
				   userSession.getUserId(),
				   FiinfraConstants.SRP_ADD_PING_EVENT_ID,
				   FiinfraConstants.SERVICE_PORTAL,
				   FiinfraConstants.SRP_SOURCE_MODULE_PING, 
				   FiinfraConstants.SRP_EDIT_PING,
				   "SP="+SP_RETRIVE_PING_RECORD+",List="+AddPingList,
				   "List="+AddPingList);
		
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, notifyTemplateData);
	}
	
	@SuppressWarnings("unchecked")
	public void getResolvedTagsTemplateXML(HttpServletRequest request,HttpServletResponse response,NotifyTemplateData notifyTemplateData) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_RESOLVE_TAGS_TEMPLATE_XML + userSession.getUserName() + "/1234";
		BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
		br = restTemplate.postForObject(url, notifyTemplateData, BaseResponse.class);
		NotifyTemplateData notifyTemplateData1=new NotifyTemplateData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			notifyTemplateData1 = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), NotifyTemplateData.class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, notifyTemplateData1);
	}
	
	@SuppressWarnings("unchecked")
	public void sendNotification(HttpServletRequest request,HttpServletResponse response,NotifyTemplateData notifyTemplateData) throws IOException{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int buId = userSession.getBuId();
		int partyID=userSession.getPartyId();
		long currentTime = new Date().getTime();
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		MultipartFile[] m = notifyTemplateData.getTemplateAttachment();
		//System.out.println("Multi Ams--"+m);
		notifyTemplateData.setTemplateAttachment(null);
		documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(m,
				currentTime, createdBy);
		logger.info("documentDatas:-"+documentDatas);
		notifyTemplateData.setDocumentDatas(documentDatas);
		if (documentDatas.size() > 0) {
			notifyTemplateData.setAttachmentCount(documentDatas.size());
			notifyTemplateData.setAttachment(true);
			
			//System.out.println("Document Count****"+documentDatas.size());
		}
		notifyTemplateData.setNotifyTypeID(56002);
//		notifyTemplateData.setPartyID(partyID);
		notifyTemplateData.setPublic(true);
		notifyTemplateData.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notifyTemplateData.setCreatedBy(createdBy);
		notifyTemplateData.setLastModifiedBy(createdBy);
		notifyTemplateData.setSessionId(request.getSession().getId());
		
		url = URL_SEND_CUSTOM_PING + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		BaseResponse<String> br = new BaseResponse<String>();
		List<String> resultList=new ArrayList<>();
		br = restTemplate.postForObject(url, notifyTemplateData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList = br.getResponseListObject();
		int recordCount=Integer.parseInt(resultList.get(0));
		if(recordCount>0){
			String basePath = resultList.get(1);
			if (documentDatas.size() > 0) {
				FiinfraUtility.uploadAttachments(m, basePath,
						currentTime);
			}
		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, resultList);
	}
	
	/**
	 * Downloads the document
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void downloadDocument(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		//System.out.println("URL --> " + url);
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_DOCUMENT_RECORD+userSession.getUserName()+"/1234";
		int docId=Integer.parseInt(request.getParameter("docId"));
		
		int buId=userSession.getBuId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("docId",docId); 
		uriCB.queryParam("buId",buId);
//		DocumentData documentData=(DocumentData) FiinfraUtility.postRequest(uriCB,DocumentData.class,restTemplate);
		BaseResponse<DocumentData> br = new BaseResponse<DocumentData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		DocumentData documentData=new DocumentData();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			documentData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), DocumentData.class);
//			documentData=br.getResponseObject();
		//System.out.println("file name is:--"+documentData.getDocumentName());
		//System.out.println("file path is:--"+documentData.getFileStoragePathURI());
		InputStream file = new FileInputStream(new File(documentData.getFileStoragePathURI()));
		//System.out.println("file:----"+file.available());
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment; filename=\"" + documentData.getDocumentName() +"\"");
        FileCopyUtils.copy(file, response.getOutputStream());
	}
	
	@SuppressWarnings("unchecked")
	public void savePing(HttpServletRequest request,HttpServletResponse response,NotifyTemplateData notifyTemplateData) throws IOException{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int buId = userSession.getBuId();
		int partyID=userSession.getPartyId();
		/*if(notifyTemplateData.getNotifyTemplateID()==0){
			notifyTemplateData.setPartyID(buId);
		} else{
			notifyTemplateData.setPartyID(partyID);
		}*/
		long currentTime = new Date().getTime();
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		MultipartFile[] m = notifyTemplateData.getTemplateAttachment();
		notifyTemplateData.setTemplateAttachment(null);
		documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(m,
				currentTime, createdBy);
		logger.info("documentDatas:-"+documentDatas);
		
		if (documentDatas.size() > 0) {
			notifyTemplateData.setDocumentDatas(documentDatas);
			notifyTemplateData.setAttachmentCount(documentDatas.size());
			notifyTemplateData.setAttachment(true);
		} else {
			notifyTemplateData.setAttachmentCount(0);
			notifyTemplateData.setAttachment(false);
		}
		notifyTemplateData.setNotifyTypeID(56002);
		notifyTemplateData.setPartyID(buId);
		notifyTemplateData.setPublic(true);
		notifyTemplateData.setSourceSystemID(FiinfraConstants.SERVICE_PORTAL);
		notifyTemplateData.setCreatedBy(createdBy);
		notifyTemplateData.setLastModifiedBy(createdBy);
		
		url = URL_SAVE_PING + "abc" + "/1234";
		logger.info("url:-"+url);
		BaseResponse<String> br = new BaseResponse<String>();
		List<String> resultList=new ArrayList<>();
		br = restTemplate.postForObject(url, notifyTemplateData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList = br.getResponseListObject();
		int recordCount=Integer.parseInt(resultList.get(0));
		if(recordCount>0){
			String basePath = resultList.get(2);
			String fileNamesToRetain = resultList.get(3);
			File baseFolder = new File(basePath);
			try{
				String[] fileNames=fileNamesToRetain.split(",");
				for (File file : baseFolder.listFiles()) {
			        if (file.isDirectory()) {
			        } else {
			        	if(Arrays.asList(fileNames).contains(file.getName())){
			        		
			        	}else{
			        		file.delete();
			        	}
			        }
			    }
			}catch(Exception e){
				logger.error(""+e);
			}
			
			if (documentDatas.size() > 0) {
				FiinfraUtility.uploadAttachments(m, basePath,
						currentTime);
			}
			
			final UserSession userSession1 = (UserSession) request.getSession().getAttribute("userSession");
			new Thread(new Runnable() {
				@Override
				public void run() {
					String url=URL_UPDATE_PING_RECIPIENT+ userSession1.getUserName() + "/1234";;
					BaseResponse<Integer> br = new BaseResponse<Integer>();
					int buId = userSession1.getBuId();
					int partyId=userSession1.getPartyId();
					UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
					uriCB.queryParam("partyId", buId);
					uriCB.queryParam("buId", buId);
					br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
							BaseResponse.class).getBody();
				}
			}).start();
		}
		
	
		
		String AddPingList= "NotifyTemplateID = "+notifyTemplateData.getNotifyTemplateID()+
		",PartyID ="+ notifyTemplateData.getPartyID()+
		",NotifyTypeID ="+ notifyTemplateData.getNotifyTypeID()+
		",Name ="+ notifyTemplateData.getName()+
		",Description ="+ notifyTemplateData.getDescription()+
		",NotifyTargetID ="+ notifyTemplateData.getNotifyTargetID()+
		",DeliveryChannelID ="+ notifyTemplateData.getDeliveryChannelID()+
		",UseSignatureID ="+ notifyTemplateData.getUseSignatureID()+
		",NotifyTemplateXML ="+ notifyTemplateData.getNotifyTemplateXML()+
		",IsAttachment ="+ notifyTemplateData.isAttachment()+
		",AttachmentCount ="+ notifyTemplateData.getAttachmentCount()+
		",Attachment1DocumentID ="+ notifyTemplateData.getAttachment1DocumentID()+
		",Attachment2DocumentID ="+ notifyTemplateData.getAttachment2DocumentID()+
		",Attachment3DocumentID ="+ notifyTemplateData.getAttachment3DocumentID()+
		",IsPublic ="+ notifyTemplateData.isPublic()+
		",LastModifiedBy ="+ notifyTemplateData.getLastModifiedBy()+
		",IsAddDisclaimerText ="+ notifyTemplateData.isAddDisclaimerText()+
		",IsAddDNDText ="+ notifyTemplateData.isAddDNDText()+
		",SourceSystemID ="+ notifyTemplateData.getSourceSystemID()+
		",TagList ="+ notifyTemplateData.getTagList();
		
		String SP_SAVE_PING="{CALL usp_cp_savePing}";
		
		FiinfraUtility.doAudit(userSession.getPartyId(),
				   userSession.getUserId(),
	               FiinfraConstants.SRP_ADD_PING_EVENT_ID,
	               FiinfraConstants.SERVICE_PORTAL,
	               FiinfraConstants.SRP_SOURCE_MODULE_PING,
	               FiinfraConstants.SRP_ADD_PING,
	               "SP="+SP_SAVE_PING+",List="+AddPingList,
	               "List="+AddPingList);

		
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, resultList);
	}
	
	@SuppressWarnings("unchecked")
	public void deletePing(HttpServletRequest request,HttpServletResponse response,NotifyTemplateData notifyTemplateData) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_DELETE_PING + "abc" + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("notifyTemplateIds", request.getParameter("notifyTemplateId"));
		uriCB.queryParam("buId", buId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		int recordCount=0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = br.getResponseObject();
		
		String AddPingList="notifyTemplateIds="+notifyTemplateData.getNotifyTemplateID();
		
		String SP_DELETE_PING="{CALL usp_cp_deletePings(?)}";
		
		FiinfraUtility.doAudit(userSession.getPartyId(),
				   userSession.getUserId(),
				   FiinfraConstants.SRP_DELETE_PING_EVENT_ID,
				   FiinfraConstants.SERVICE_PORTAL,
				   FiinfraConstants.SRP_SOURCE_MODULE_PING, 
				   FiinfraConstants.SRP_DELETE_PING,
				   "SP="+SP_DELETE_PING+",List="+AddPingList,
				   "List="+AddPingList);

		
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);

	
	
	}
}
