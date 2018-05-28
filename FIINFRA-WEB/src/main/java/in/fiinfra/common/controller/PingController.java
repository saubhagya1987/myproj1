/*ping */

package in.fiinfra.common.controller;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DndData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.common.RecipientListData;
import in.fiinfra.common.common.ScheduledPindData;
import in.fiinfra.common.common.TagData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.service.vo.AutoPing;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.cp.CommonUtils;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonParseException;
import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.Calendar;
import com.ibm.icu.util.GregorianCalendar;

public class PingController extends MultiActionController{
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	String url;

	@Value("${URL_GET_TAG_LIST_PING}")
	private String URL_GET_TAG_LIST_PING;
	
	@Value("${URL_GET_STANDARD_TAGS_NOTIFICATIONTARGET}")
	private String URL_GET_STANDARD_TAGS_NOTIFICATIONTARGET;
	

	@Value("${URL_GET_TAGS_LIST_PING}")
	private String URL_GET_TAGS_LIST_PING;

	@Value("${URL_SAVE_PING}")
	private String URL_SAVE_PING;

	

	@Value("${URL_GET_PING_RECORD}")
	private String URL_GET_PING_RECORD;

	@Value("${URL_DELETE_TAGS}")
	private String URL_DELETE_TAGS;

	@Value("${URL_INSERt_TAGS}")
	private String URL_INSERt_TAGS;

	
	@Value("${URL_GET_TAG_VALUE_LIST}")
	private String URL_GET_TAG_VALUE_LIST;
	
	@Value("${URL_GET_STANDARD_PING_LIST}")
	private String URL_GET_STANDARD_PING_LIST;
	


	@Value("${URL_UPDATE_PING_ACTIVE_FLAG}")
	private String URL_UPDATE_PING_ACTIVE_FLAG;

	

	@Value("${URL_GET_RECIPIENTLIST_FOR_SCHEDULEPING}")
	private String URL_GET_RECIPIENTLIST_FOR_SCHEDULEPING;

	@Value("${URL_CLONE_PING}")
	private String URL_CLONE_PING;

	
	@Value("${URL_MARK_FAVOURITE_PING}")
	private String URL_MARK_FAVOURITE_PING;
	

	@Value("${URL_INSER_SCHEDULE_PINGS}")
	private String URL_INSER_SCHEDULE_PINGS;



	
	@Value("${URL_SEND_CUSTOM_PING}")
	private String URL_SEND_CUSTOM_PING;
	
	



	@Value("${URL_DELETE_PING}")
	private String URL_DELETE_PING;
	
	@Value("${URL_GET_TAG_VALUE_BY_TAGID}")
	private String URL_GET_TAG_VALUE_BY_TAGID;

	
	@Value("${URL_GET_TAGS_FOR_NOTIFYTEMPLETID}")
	private String URL_GET_TAGS_FOR_NOTIFYTEMPLETID;

	
	@Value("${URL_RESOLVE_TAGS_TEMPLATE_XML}")
	private String URL_RESOLVE_TAGS_TEMPLATE_XML;
	
	


	@Value("${URL_GET_SCHEDULED_PINGS}")
	private String URL_GET_SCHEDULED_PINGS;
	
	@Value("${URL_GET_SCHEDULE_PING_DETAIL_BYSCHEDULEID}")
	private String URL_GET_SCHEDULE_PING_DETAIL_BYSCHEDULEID;
	
	@Value("${URL_GET_RECIPIENTLIST_FOR_SCHEDULED_PING}")
	private String URL_GET_RECIPIENTLIST_FOR_SCHEDULED_PING;
	
	@Value("${URL_DELETE_SCHEDULED_PINGS}")
	private String URL_DELETE_SCHEDULED_PINGS;
	
	@Value("${URL_GETMATCHINGTAGSANDPOTENTIAL_PINGS}")
	private String URL_GETMATCHINGTAGSANDPOTENTIAL_PINGS;
	
	
	@Value("${URL_GET_DELIVARYHISTORY}")
	private String  URL_GET_DELIVARYHISTORY;
	
	@Value("${URL_GET_EMAIL_AND_CONTACT_OF_CONTACT}")
	private String  URL_GET_EMAIL_AND_CONTACT_OF_CONTACT;
	
	@Value("${URL_INSERt_DNDS}")
	private String URL_INSERt_DNDS;
	
	@Value("${URL_GET_DND_LIST}")
	private String URL_GET_DND_LIST;
	
	@Value("${URL_GET_DNDDETAILS}")
	private String URL_GET_DNDDETAILS;
	
	@Value("${URL_DELETE_DNDS}")
	private String URL_DELETE_DNDS;
	
	@Value("${URL_UPDATE_PING_RECIPIENT}")
	private String URL_UPDATE_PING_RECIPIENT;
	
	@Value("${URL_AUTO_PING_EVENT_LIST}")
	String URL_AUTO_PING_EVENT_LIST;
	
	@Value("${URL_CHANGE_AUTO_PING_EVENT_STATUS}")
	String URL_CHANGE_AUTO_PING_EVENT_STATUS;
	
	
	
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
	private static final Logger logger = Logger.getLogger(PingController.class);
	
	@SuppressWarnings("unchecked")
	public ModelAndView getPings(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		url = URL_GET_STANDARD_PING_LIST + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("nodeId", nodeId);
		
		BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<NotifyTemplateData> notifyTemplateDatas = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			notifyTemplateDatas = br.getResponseListObject();
		ModelAndView mav = new ModelAndView("ping/pings");
		mav.addObject("notifyTemplateDatas", objectMapper.writeValueAsString(notifyTemplateDatas));
		mav.addObject("pagesize", pagesize);
		return mav;
	}
	
	public void getPingsXLS(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		url = URL_GET_STANDARD_PING_LIST + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<NotifyTemplateData> notifyTemplateDatas = new ArrayList<>();
		List<NotifyTemplateData> notifyTemplateDatas1 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			notifyTemplateDatas = br.getResponseListObject();
				for(int i = 0; i<notifyTemplateDatas.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					NotifyTemplateData noTemplateData;
					noTemplateData = objectMapper.readValue(objectMapper.writeValueAsString(notifyTemplateDatas.get(i)), NotifyTemplateData.class);
					notifyTemplateDatas1.add(noTemplateData);
				}

		response.addHeader("Content-type", "application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename=PingList.xls");
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font=workbook.createFont();
        /* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        /* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet("Ping List");
		int rowNum = 0;
		int column = 0;
		HSSFRow excelRow =  sheet.createRow(rowNum++);
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Ping Name");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Ping Owner");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Tag List");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Schedule Count");
		}

		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Recipient Count");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Creation Date");
	}


		for(NotifyTemplateData notifyTemplateData:notifyTemplateDatas1){
			column = 0;
			excelRow =  sheet.createRow(rowNum++);
			{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(notifyTemplateData.getName());
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(notifyTemplateData.getPingOwner());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(notifyTemplateData.getTagList());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(notifyTemplateData.getScheduleCount());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(notifyTemplateData.getRecipientCount());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(notifyTemplateData.getCreatedDate());
		}

		}

		workbook.write(response.getOutputStream());
	}
	
	public void getPingsCSV(HttpServletRequest request, HttpServletResponse response) throws IOException {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		url = URL_GET_STANDARD_PING_LIST + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<NotifyTemplateData> notifyTemplateDatas = new ArrayList<>();
		List<NotifyTemplateData> notifyTemplateDatas1 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			notifyTemplateDatas = br.getResponseListObject();
				for(int i = 0; i<notifyTemplateDatas.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					NotifyTemplateData noTemplateData;
					noTemplateData = objectMapper.readValue(objectMapper.writeValueAsString(notifyTemplateDatas.get(i)), NotifyTemplateData.class);
					notifyTemplateDatas1.add(noTemplateData);
				}
			response.addHeader("Content-Disposition", "attachment;filename=PingList.csv");
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
			for(NotifyTemplateData notifyTemplateData:notifyTemplateDatas1){
				writer.print(CommonUtils.escape(notifyTemplateData.getName()));
				writer.print(",");
				writer.print(CommonUtils.escape(notifyTemplateData.getPingOwner()));
				writer.print(",");
				writer.print(CommonUtils.escape(notifyTemplateData.getTagList()));
				writer.print(",");
				writer.print(CommonUtils.escape(""+notifyTemplateData.getScheduleCount()));
				writer.print(",");
				writer.print(CommonUtils.escape(""+notifyTemplateData.getRecipientCount()));
				writer.print(",");
				writer.print(CommonUtils.escape(notifyTemplateData.getCreatedDate()));
				writer.println();
			}
	}
	
	
	
	@SuppressWarnings("unchecked")
	public void getTagListAddPing(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		url = URL_GET_TAG_LIST_PING + userSession.getUserName() + "/1234";
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
	public void getStandardTags(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_GET_STANDARD_TAGS_NOTIFICATIONTARGET + userSession.getUserName() + "/1234";
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
	public void savePing(HttpServletRequest request,HttpServletResponse response,NotifyTemplateData notifyTemplateData) throws IOException{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int buId = userSession.getBuId();
//		int partyID=userSession.getPartyId();
		int partyID= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		long currentTime = new Date().getTime();
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		MultipartFile[] m = notifyTemplateData.getTemplateAttachment();
		notifyTemplateData.setTemplateAttachment(null);
		documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(m,
				currentTime, createdBy);
		logger.info("documentDatas:-"+documentDatas);
		notifyTemplateData.setDocumentDatas(documentDatas);
		if (documentDatas.size() > 0) {
			notifyTemplateData.setAttachmentCount(documentDatas.size());
			notifyTemplateData.setAttachment(true);
		}
		notifyTemplateData.setNotifyTypeID(56002);
		notifyTemplateData.setPartyID(partyID);
		notifyTemplateData.setPublic(true);
		notifyTemplateData.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notifyTemplateData.setCreatedBy(createdBy);
		notifyTemplateData.setLastModifiedBy(createdBy);
		
		url = URL_SAVE_PING + userSession.getUserName() + "/1234";
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
				logger.error(e);
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
					uriCB.queryParam("partyId", partyId);
					uriCB.queryParam("buId", buId);
					br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
							BaseResponse.class).getBody();
				}
			}).start();
		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, resultList);
	}
	

	@SuppressWarnings("unchecked")
	public void getPingDetails(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_GET_PING_RECORD + userSession.getUserName() + "/1234";
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
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, notifyTemplateData);
	}

	public ModelAndView getTagsList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		url = URL_GET_TAGS_LIST_PING + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<TagData> br = new BaseResponse<TagData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<TagData> tagDatas = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			tagDatas = br.getResponseListObject();
	ModelAndView mav = new ModelAndView("ping/tagslist");
	mav.addObject("tagDatas", objectMapper.writeValueAsString(tagDatas));
	return mav;
	}

	@SuppressWarnings("unchecked")
	public void getTagValueList(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_GET_TAG_VALUE_LIST + userSession.getUserName() + "/1234";
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
	public void deleteTags(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String tagIds = request.getParameter("tagIds");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_DELETE_TAGS + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("tagIds", tagIds);
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

	

	public void insertTags(HttpServletRequest request,
	HttpServletResponse response,TagData tagData) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		Integer recordCount = 0;
		int tagId = 0;
		String active = request.getParameter("isActive");
		
		String result = FiinfraConstants.FAIL;
		int createdBy = userSession.getUserId();
		int buId = userSession.getBuId();
		if(active.equals("checked"))
		{
			tagData.setActive(true);
		}
		else{
			tagData.setActive(false);
		}
		try{
		 tagId = Integer.parseInt(request.getParameter("tagId"));
		tagData.setNotifyTagId(tagId);
		}catch(Exception e)
		{
			tagData.setNotifyTagId(0);
		}
		tagData.setBuId(buId);
		tagData.setCreatedBy(createdBy);
		url = URL_INSERt_TAGS + userSession.getUserName() + "/1234";
		BaseResponse<QueryData> br = new BaseResponse<QueryData>();
		br = restTemplate.postForObject(url, tagData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			tagData = objectMapper
					.readValue(objectMapper.writeValueAsString(br
							.getResponseObject()), TagData.class);
		
		int notifyTagId = tagData.getNotifyTagId();
		if (notifyTagId > 0)
			result = FiinfraConstants.SUCCESS;
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(e);
		}
		objectMapper.writeValue(out, result);
	}
	public void getTagDetails(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int tagId =Integer.parseInt(request.getParameter("tagId"));
		logger.info("TagId="+tagId);
		url = URL_GET_TAG_VALUE_BY_TAGID + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("notifyTagId",tagId);
		uriCB.queryParam("buId", buId);
		BaseResponse<TagData> br = new BaseResponse<TagData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		TagData objTagdata =  new TagData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			objTagdata = objectMapper
			.readValue(objectMapper.writeValueAsString(br
					.getResponseObject()), TagData.class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, objTagdata );
	}
	

	@SuppressWarnings("unchecked")
	public void updatePingActiveFlag(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int lastModifiedBy=userSession.getUserId();
		url = URL_UPDATE_PING_ACTIVE_FLAG + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("notifyTemplateId", request.getParameter("notifyTemplateId"));
		uriCB.queryParam("isActive", Boolean.valueOf(request.getParameter("isActive").toString()));
		uriCB.queryParam("lastModifiedBy", lastModifiedBy);
		uriCB.queryParam("buId", buId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		int recordCount=0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);
	}


	public ModelAndView getDNDList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		url = URL_GET_DND_LIST + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<DndData> br = new BaseResponse<DndData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<DndData> dndData = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			dndData = br.getResponseListObject();
		
		ModelAndView mav = new ModelAndView("ping/dnd");
		mav.addObject("dndData", objectMapper.writeValueAsString(dndData));
		
	//	mav.addObject("tagDatas", tagDatas);
		return mav;
	}
	public ModelAndView getScheduledPings(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		url = URL_GET_SCHEDULED_PINGS + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<ScheduledPindData> br = new BaseResponse<ScheduledPindData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<ScheduledPindData> scheduledPingData = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			scheduledPingData = br.getResponseListObject();
		
		ModelAndView mav = new ModelAndView("ping/scheduledpings");
		mav.addObject("scheduledPingData",  objectMapper.writeValueAsString(scheduledPingData));
		return mav;
	}

	public void getScheduledPingsXLS(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		url = URL_GET_SCHEDULED_PINGS + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<ScheduledPindData> br = new BaseResponse<ScheduledPindData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<ScheduledPindData> scheduledPingData = new ArrayList<>();
		List<ScheduledPindData> scheduledPingData1 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			scheduledPingData = br.getResponseListObject();
		for(int i = 0; i<scheduledPingData.size(); i++){
			//get the actual party object from its LinkedHashMap representation
			ScheduledPindData noScheduledPindData;
			noScheduledPindData = objectMapper.readValue(objectMapper.writeValueAsString(scheduledPingData.get(i)), ScheduledPindData.class);
			scheduledPingData1.add(noScheduledPindData);
		}
		
		response.addHeader("Content-type", "application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename=SchedulePings.xls");
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font=workbook.createFont();
        /* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        /* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet("SchedulePings");
		int rowNum = 0;
		int column = 0;
		HSSFRow excelRow =  sheet.createRow(rowNum++);
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Ping Name");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Schedule Date");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Recipient Count");
		}
		
		


		for(ScheduledPindData schedulepingList:scheduledPingData1){
			column = 0;
			excelRow =  sheet.createRow(rowNum++);
			{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(schedulepingList.getPingName());
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(schedulepingList.getScheduledDate());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(schedulepingList.getRecipientCount());
		}
			
			

		}

		workbook.write(response.getOutputStream());
	}
	
//	dsad
	public void getScheduledPingsCSV(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		url = URL_GET_SCHEDULED_PINGS + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<ScheduledPindData> br = new BaseResponse<ScheduledPindData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<ScheduledPindData> scheduledPingData = new ArrayList<>();
		List<ScheduledPindData> scheduledPingData1 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			scheduledPingData = br.getResponseListObject();
		for(int i = 0; i<scheduledPingData.size(); i++){
			//get the actual party object from its LinkedHashMap representation
			ScheduledPindData noScheduledPindData;
			noScheduledPindData = objectMapper.readValue(objectMapper.writeValueAsString(scheduledPingData.get(i)), ScheduledPindData.class);
			scheduledPingData1.add(noScheduledPindData);
		}
		
		response.addHeader("Content-Disposition", "attachment;filename=SchedulePing.csv");
		PrintWriter writer = response.getWriter();
		writer.print(CommonUtils.escape("Ping Name"));
		writer.print(",");
		writer.print(CommonUtils.escape("Schedule Date"));
		writer.print(",");
		writer.print(CommonUtils.escape("Recipient Count"));
		writer.print(",");
	
		
		writer.println();
		for(ScheduledPindData schedulePing_Data:scheduledPingData1){
			writer.print(CommonUtils.escape(schedulePing_Data.getPingName()));
			writer.print(",");
			writer.print(CommonUtils.escape(schedulePing_Data.getScheduledDate()));
			writer.print(",");
			writer.print(CommonUtils.escape(""+schedulePing_Data.getRecipientCount()));
			
			writer.println(",");
			logger.info("Delivared on="+schedulePing_Data.getRecipientCount());
		}
	}
	@SuppressWarnings("unchecked")
	public void getPingNames(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		url = URL_GET_STANDARD_PING_LIST + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<NotifyTemplateData> notifyTemplateDatas = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			notifyTemplateDatas = br.getResponseListObject();
		
		
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, notifyTemplateDatas );
//		ModelAndView mav = new ModelAndView("ping/pings");
//		mav.addObject("notifyTemplateDatas", notifyTemplateDatas);
//		return mav;
	}
	

	public void getRecipientDetails(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		String notifyTagId =  request.getParameter("notifyTagId");
		String recipientType = request.getParameter("recipientType");
		int notifyTempletId = Integer.parseInt(request.getParameter("notifyTempletId"));
		logger.info("notifyTempletId===="+notifyTempletId);
		logger.info("recipientType===="+recipientType);
		logger.info("notifyTagId===="+notifyTagId);
		url = URL_GET_RECIPIENTLIST_FOR_SCHEDULEPING + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("notifyTagId", notifyTagId);
		uriCB.queryParam("recipientType", recipientType);
		uriCB.queryParam("notifyTempletId", notifyTempletId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<RecipientListData> br = new BaseResponse<RecipientListData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<RecipientListData> reciepientData = new ArrayList<>();
		List<RecipientListData> reciepientData1 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			reciepientData1 = br.getResponseListObject();
		Iterator<RecipientListData> i=reciepientData1.iterator();
		while(i.hasNext()){
			RecipientListData r=objectMapper.readValue(objectMapper.writeValueAsString(i.next()), RecipientListData.class);
			int ownerPartyId=r.getPing();
			if(ownerPartyId==partyId || ownerPartyId==buId)
				reciepientData.add(r);
		}
		logger.info("reciepientData in WEB=========="+reciepientData);
//		ModelAndView mav = new ModelAndView("ping/addnewscheduleping");
//		mav.addObject("reciepientData", reciepientData);
//		return mav;
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, reciepientData );
	}
	
	public void insertSchedulePings(HttpServletRequest request,
	HttpServletResponse response,RecipientListData reciepientData) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		Integer recordCount = 0;
		int tagId = 0;
		String xmlStringNotifyParty = request.getParameter("xmlStringNotifyParty");
		String tagList = request.getParameter("tagList");
		int notifyScheduleId_add_edit = Integer.parseInt(request.getParameter("notifyScheduleId"));
		String result = FiinfraConstants.FAIL;
		int createdBy = userSession.getUserId();
		int buId = userSession.getBuId();
		
		logger.info("schedule Date="+reciepientData.getScheduleDate());
		Date date = new Date()  ;
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");  
		Calendar calendar = GregorianCalendar.getInstance(); 
		logger.info("Ping="+reciepientData.getPing());
		if(reciepientData.getPing()!=0)
		{
			reciepientData.setPing(Integer.parseInt(request.getParameter("ping"))); 
		}
		if(reciepientData.getScheduleDate()==null)
		{
			reciepientData.setScheduleDate(sdf.format(date));
			int a =calendar.get(Calendar.HOUR_OF_DAY);
			if(a<=12)
			{
				reciepientData.setHrType("AM");
				String hours = String.valueOf(a);
				reciepientData.setScheduleHours(hours);
			}
			else{
				reciepientData.setHrType("PM");
				String hours = String.valueOf(a-12);
				reciepientData.setScheduleHours(hours);
			}
			
			String minute = String.valueOf(calendar.get(Calendar.MINUTE));
			reciepientData.setScheduleMinute(minute);
		}
		logger.info("Date="+sdf.format(date)); 
		logger.info("hrtype="+reciepientData.getHrType());
		logger.info("hour="+reciepientData.getScheduleHours());
		logger.info("min="+reciepientData.getScheduleMinute());
		reciepientData.setBuId(buId);
		reciepientData.setCreatedBy(createdBy);
		reciepientData.setXmlStringNotifyParty(xmlStringNotifyParty);
		reciepientData.setXmlTagList(tagList);
		reciepientData.setNotifyScheduleId(notifyScheduleId_add_edit);
		
		logger.info("ping id="+reciepientData.getPing());
		url = URL_INSER_SCHEDULE_PINGS + userSession.getUserName() + "/1234";
		BaseResponse<RecipientListData> br = new BaseResponse<RecipientListData>();
		br = restTemplate.postForObject(url, reciepientData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			reciepientData = objectMapper
					.readValue(objectMapper.writeValueAsString(br
							.getResponseObject()), RecipientListData.class);
		
		int notifyScheduleId = reciepientData.getNotifyScheduleId();
		if (notifyScheduleId > 0)
			result = FiinfraConstants.SUCCESS;
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(e);
		}
		objectMapper.writeValue(out, result);
	}

	@SuppressWarnings("unchecked")
	public void clonePing(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int lastModifiedBy=userSession.getUserId();
		url = URL_CLONE_PING + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("notifyTemplateId", request.getParameter("notifyTemplateId"));
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("lastModifiedBy", lastModifiedBy);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		int recordCount=0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);
	}
	
	@SuppressWarnings("unchecked")
	public void markPingAsFavourite(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int lastModifiedBy=userSession.getUserId();
		int partyId=userSession.getPartyId();
		url = URL_MARK_FAVOURITE_PING + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("notifyTemplateId", request.getParameter("notifyTemplateId"));
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("lastModifiedBy", lastModifiedBy);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		int recordCount=0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);
	}
	
	@SuppressWarnings("unchecked")
	public void deletePing(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_DELETE_PING + userSession.getUserName() + "/1234";
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
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);

	
	
	}
	public void getTagsForPing(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int notifyTempletId = Integer.parseInt(request.getParameter("ping"));
		url = URL_GET_TAGS_FOR_NOTIFYTEMPLETID + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("notifyTempletId", notifyTempletId);
		uriCB.queryParam("buId", buId);
		BaseResponse<TagData> br = new BaseResponse<TagData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<TagData> tagData = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			tagData = br.getResponseListObject();
		
		
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, tagData );
//		ModelAndView mav = new ModelAndView("ping/pings");
//		mav.addObject("notifyTemplateDatas", notifyTemplateDatas);
//		return mav;
	}

public void getSchedulePingDatilsByScheduleId(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	
	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int buId = userSession.getBuId();
	int partyId = userSession.getPartyId();
	int notifyScheduleId = Integer.parseInt(request.getParameter("notifyScheduleId"));
	url = URL_GET_SCHEDULE_PING_DETAIL_BYSCHEDULEID + userSession.getUserName() + "/1234";
	logger.info("url:-"+url);
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("notifyScheduleId", notifyScheduleId);
	uriCB.queryParam("buId", buId);
	BaseResponse<RecipientListData> br = new BaseResponse<RecipientListData>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
			BaseResponse.class).getBody();
	RecipientListData recipientListData =new  RecipientListData();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		recipientListData = objectMapper
		.readValue(objectMapper.writeValueAsString(br
				.getResponseObject()), RecipientListData.class);
	

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recipientListData );
	
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
		notifyTemplateData.setTemplateAttachment(null);
		documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(m,
				currentTime, createdBy);
		logger.info("documentDatas:-"+documentDatas);
		notifyTemplateData.setDocumentDatas(documentDatas);
		if (documentDatas.size() > 0) {
			notifyTemplateData.setAttachmentCount(documentDatas.size());
			notifyTemplateData.setAttachment(true);
			
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

	@SuppressWarnings("unchecked")
	public void sendNotificationHeader(HttpServletRequest request,HttpServletResponse response,NotifyTemplateData notifyTemplateData) throws IOException{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String result = FiinfraConstants.FAIL;
		int createdBy = userSession.getUserId();
		int buId = userSession.getBuId();
		int partyID=userSession.getPartyId();
		long currentTime = new Date().getTime();
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		MultipartFile[] m = notifyTemplateData.getTemplateAttachment();
		notifyTemplateData.setTemplateAttachment(null);
		documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(m,
				currentTime, createdBy);
		logger.info("documentDatas:-"+documentDatas);
		
		notifyTemplateData.setDocumentDatas(documentDatas);
		if (documentDatas.size() > 0) {
			notifyTemplateData.setAttachmentCount(documentDatas.size());
			notifyTemplateData.setAttachment(true);
			
			logger.info("Document Count****"+documentDatas.size());
		}
		notifyTemplateData.setNotifyTypeID(56002);
//		notifyTemplateData.setPartyID(partyID);
		notifyTemplateData.setPublic(true);
		notifyTemplateData.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notifyTemplateData.setCreatedBy(createdBy);
		notifyTemplateData.setLastModifiedBy(createdBy);
		notifyTemplateData.setSessionId(request.getSession().getId());
		
		url = URL_SEND_CUSTOM_PING + userSession.getUserName() + "/1234";
		notifyTemplateData.setDocumentDatas(documentDatas);
		logger.info("url:-"+url);
		BaseResponse<String> br = new BaseResponse<String>();
		List<String> resultList=new ArrayList<>();
		br = restTemplate.postForObject(url, notifyTemplateData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			resultList = br.getResponseListObject();
		int recordCount=Integer.parseInt(resultList.get(0));
		if(recordCount>0){
			result=FiinfraConstants.success;
			String basePath = resultList.get(1);
			if (documentDatas.size() > 0) {
				notifyTemplateData.setAttachmentCount(documentDatas.size());
				notifyTemplateData.setAttachment(true);
				FiinfraUtility.uploadAttachments(m, basePath,
						currentTime);
			}
		}
		
		String serverPath = request
				.getRequestURL()
				.toString()
				.replace(request.getRequestURI().substring(0),
						request.getContextPath());
		request.getSession().setAttribute("LogTicketResult", result);
		response.sendRedirect(serverPath + "/index.htm");
	}

public ModelAndView editSchedulePing(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	
	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int buId = userSession.getBuId();
	int partyId = userSession.getPartyId();
//	String notifyTagId =  request.getParameter("notifyTagId");
	String recipientType = "0";
	int notifyScheduleId = Integer.parseInt(request.getParameter("notifyScheduleId"));
	logger.info("notifyScheduleId===="+notifyScheduleId);
	logger.info("recipientType===="+recipientType);
	url = URL_GET_RECIPIENTLIST_FOR_SCHEDULED_PING + userSession.getUserName() + "/1234";
	logger.info("url:-"+url);
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("notifyScheduleId", notifyScheduleId);
//	URICB.QUERYPARAM("RECIPIENTTYPE", RECIPIENTTYPE);
//	URICB.QUERYPARAM("NOTIFYTEMPLETID", NOTIFYTEMPLETID);
	uriCB.queryParam("buId", buId);
	BaseResponse<RecipientListData> br = new BaseResponse<RecipientListData>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
			BaseResponse.class).getBody();
	List<RecipientListData> reciepientData = new ArrayList<>();
	List<RecipientListData> reciepientData1 = new ArrayList<>();
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		reciepientData1 = br.getResponseListObject();
	Iterator<RecipientListData> i=reciepientData1.iterator();
	while(i.hasNext()){
		RecipientListData r=objectMapper.readValue(objectMapper.writeValueAsString(i.next()), RecipientListData.class);
		int ownerPartyId=r.getPing();
		if(ownerPartyId==partyId)
			reciepientData.add(r);
	}
	ModelAndView mav = new ModelAndView("ping/addnewscheduleping");
	mav.addObject("reciepientData", objectMapper.writeValueAsString(reciepientData));
	return mav;
	


	}
@SuppressWarnings("unchecked")
public void deleteSchedulePings(HttpServletRequest request,
		HttpServletResponse response) throws IOException {
	String schedulePingIds = request.getParameter("schedulePingIds");
	UserSession userSession = (UserSession) request.getSession()
			.getAttribute("userSession");
	int buId = userSession.getBuId();
	url = URL_DELETE_SCHEDULED_PINGS + userSession.getUserName() + "/1234";
	logger.info("url:-"+url);
	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("schedulePingIds", schedulePingIds);
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
	public void getMatchingTagsAndPotentialPings(HttpServletRequest request,HttpServletResponse response,NotifyTemplateData notifyTemplateData) throws IOException{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int ownerpartyId = userSession.getPartyId();
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		url = URL_GETMATCHINGTAGSANDPOTENTIAL_PINGS + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("ownerpartyId", ownerpartyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<NotifyTemplateData> notifyTempletData = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			notifyTempletData = br.getResponseListObject();
		
		
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, notifyTempletData );
	}

	
	public ModelAndView getDelivaryHistory(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int notifyTemplateId = Integer.parseInt(request.getParameter("notifyTemplateId"));
		String recipientType = "0";
//		int notifyScheduleId = Integer.parseInt(request.getParameter("notifyScheduleId"));
		url = URL_GET_DELIVARYHISTORY + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
//		URICB.QUERYPARAM("RECIPIENTTYPE", RECIPIENTTYPE);
//		URICB.QUERYPARAM("NOTIFYTEMPLETID", NOTIFYTEMPLETID);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("notifyTemplateId", notifyTemplateId);
		BaseResponse<RecipientListData> br = new BaseResponse<RecipientListData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<RecipientListData> reciepientData = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			reciepientData = br.getResponseListObject();
		ModelAndView mav = new ModelAndView("ping/deliveryhistory");
		mav.addObject("reciepientData", reciepientData);
		return mav;
		


		}
	
	public void getDelivaryHistoryXLS(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
	
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int notifyTemplateId = Integer.parseInt(request.getParameter("notifyTemplateId"));
		String recipientType = "0";
//		int notifyScheduleId = Integer.parseInt(request.getParameter("notifyScheduleId"));
		url = URL_GET_DELIVARYHISTORY + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
//		URICB.QUERYPARAM("RECIPIENTTYPE", RECIPIENTTYPE);
//		URICB.QUERYPARAM("NOTIFYTEMPLETID", NOTIFYTEMPLETID);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("notifyTemplateId", notifyTemplateId);
		BaseResponse<RecipientListData> br = new BaseResponse<RecipientListData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<RecipientListData> reciepientData = new ArrayList<>();
		List<RecipientListData> reciepientData1	 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			reciepientData = br.getResponseListObject();
		for(int i = 0; i<reciepientData.size(); i++){
			//get the actual party object from its LinkedHashMap representation
			RecipientListData noreciepientData;
			noreciepientData = objectMapper.readValue(objectMapper.writeValueAsString(reciepientData.get(i)), RecipientListData.class);
			reciepientData1.add(noreciepientData);
		}

		response.addHeader("Content-type", "application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename=DelivaryHistory.xls");
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font=workbook.createFont();
        /* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        /* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet("Delivary History List");
		int rowNum = 0;
		int column = 0;
		HSSFRow excelRow =  sheet.createRow(rowNum++);
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Recipient Name");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Scheduled By");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Scheduled on");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Delivered On");
		}

		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Ping Count");
	}
		


		for(RecipientListData recipientList:reciepientData1){
			column = 0;
			excelRow =  sheet.createRow(rowNum++);
			{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(recipientList.getRecipientName());
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(recipientList.getScheduledBy());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(recipientList.getScheduledOn());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(recipientList.getScheduleMinute());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(recipientList.getPingCount());
		}
			

		}

		workbook.write(response.getOutputStream());
	}
	
	public void getDelivaryHistoryCSV(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
	
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int notifyTemplateId = Integer.parseInt(request.getParameter("notifyTemplateId"));
		String recipientType = "0";
//		int notifyScheduleId = Integer.parseInt(request.getParameter("notifyScheduleId"));
		url = URL_GET_DELIVARYHISTORY + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
//		URICB.QUERYPARAM("RECIPIENTTYPE", RECIPIENTTYPE);
//		URICB.QUERYPARAM("NOTIFYTEMPLETID", NOTIFYTEMPLETID);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("notifyTemplateId", notifyTemplateId);
		BaseResponse<RecipientListData> br = new BaseResponse<RecipientListData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<RecipientListData> reciepientData = new ArrayList<>();
		List<RecipientListData> reciepientData1	 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			reciepientData = br.getResponseListObject();
		for(int i = 0; i<reciepientData.size(); i++){
			//get the actual party object from its LinkedHashMap representation
			RecipientListData noreciepientData;
			noreciepientData = objectMapper.readValue(objectMapper.writeValueAsString(reciepientData.get(i)), RecipientListData.class);
			reciepientData1.add(noreciepientData);
		}

		response.addHeader("Content-Disposition", "attachment;filename=DelivaryHistory.csv");
		PrintWriter writer = response.getWriter();
		writer.print(CommonUtils.escape("Recipient Name"));
		writer.print(",");
		writer.print(CommonUtils.escape("Scheduled By"));
		writer.print(",");
		writer.print(CommonUtils.escape("Scheduled on"));
		writer.print(",");
		writer.print(CommonUtils.escape("Delivered On"));
		writer.print(",");
		writer.print(CommonUtils.escape("Ping Count"));
		writer.print(",");
		
		
		writer.println();
		for(RecipientListData noreciepient_Data:reciepientData1){
			writer.print(CommonUtils.escape(noreciepient_Data.getRecipientName()));
			writer.print(",");
			writer.print(CommonUtils.escape(noreciepient_Data.getScheduledBy()));
			writer.print(",");
			writer.print(CommonUtils.escape(noreciepient_Data.getScheduledOn()));
			writer.print(",");
			writer.print(CommonUtils.escape(""+noreciepient_Data.getScheduleMinute()));
			writer.print(",");
			writer.print(CommonUtils.escape(""+noreciepient_Data.getPingCount()));
			writer.print(",");
			logger.info("Delivared on="+noreciepient_Data.getScheduleMinute());
		}
	}
	public void getTagsListXLS(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		url = URL_GET_TAGS_LIST_PING + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<TagData> br = new BaseResponse<TagData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<TagData> tagDatas = new ArrayList<>();
		List<TagData> tagDatas1 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			tagDatas = br.getResponseListObject();
		for(int i = 0; i<tagDatas.size(); i++){
			//get the actual party object from its LinkedHashMap representation
			TagData noTagData;
			noTagData = objectMapper.readValue(objectMapper.writeValueAsString(tagDatas.get(i)), TagData.class);
			tagDatas1.add(noTagData);
		}

		response.addHeader("Content-type", "application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename=TagList.xls");
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font=workbook.createFont();
        /* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        /* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet("Tag List");
		int rowNum = 0;
		int column = 0;
		HSSFRow excelRow =  sheet.createRow(rowNum++);
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Tag Name");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Description");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Mapped Code Type Name");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Last Update date");
		}

		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Last Update By");
	}
		


		for(TagData tagDatasList:tagDatas1){
			column = 0;
			excelRow =  sheet.createRow(rowNum++);
			{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(tagDatasList.getNotifyTagName());
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(tagDatasList.getNotifyTagDescription());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(tagDatasList.getMappedCodeValue());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(tagDatasList.getLastModifiedDate());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(tagDatasList.getLastModifiedBy());
		}
			

		}

		workbook.write(response.getOutputStream());
	
	}
	
	
	public void getTagsListCSV(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		url = URL_GET_TAGS_LIST_PING + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<TagData> br = new BaseResponse<TagData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<TagData> tagDatas = new ArrayList<>();
		List<TagData> tagDatas1	 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			tagDatas = br.getResponseListObject();
		TagData noTagData;
		for(int i = 0; i<tagDatas.size(); i++){
			//get the actual party object from its LinkedHashMap representation
			
			noTagData = objectMapper.readValue(objectMapper.writeValueAsString(tagDatas.get(i)), TagData.class);
			tagDatas1.add(noTagData);
		}
		response.addHeader("Content-Disposition", "attachment;filename=TagList.csv");
		PrintWriter writer = response.getWriter();
		writer.print(CommonUtils.escape("Tag Name"));
		writer.print(",");
		writer.print(CommonUtils.escape("Description"));
		writer.print(",");
		writer.print(CommonUtils.escape("Mapped Code Type Name"));
		writer.print(",");
		writer.print(CommonUtils.escape("Last Update date"));
		writer.print(",");
		writer.print(CommonUtils.escape("Last Update By"));
		writer.print(",");
		
		writer.println();
		for(TagData tag_Data:tagDatas1){
			writer.print(CommonUtils.escape(tag_Data.getNotifyTagName()));
			writer.print(",");
			writer.print(CommonUtils.escape(tag_Data.getNotifyTagDescription()));
			writer.print(",");
			writer.print(CommonUtils.escape(tag_Data.getMappedCodeValue()));
			writer.print(",");
			writer.print(CommonUtils.escape(""+tag_Data.getLastModifiedDate()));
			writer.print(",");
			writer.print(CommonUtils.escape(""+tag_Data.getLastModifiedBy()));
			writer.println(",");
			logger.info("Delivared on="+tag_Data.getLastModifiedBy());
		}
	}
	public void getEmailAndContactOfContact(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int contactId =Integer.parseInt(request.getParameter("contactId"));
		url = URL_GET_EMAIL_AND_CONTACT_OF_CONTACT + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("contactId", contactId);
		uriCB.queryParam("buId", buId);
		
	
	
	
	BaseResponse<OpportunityData> br = new BaseResponse<OpportunityData>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
			BaseResponse.class).getBody();
	OpportunityData oppData = null;
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		oppData = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), OpportunityData.class);
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, oppData);
		
	}
	
	public void insertDnd(HttpServletRequest request,
			HttpServletResponse response,DndData dndData) throws IOException {
				UserSession userSession = (UserSession) request.getSession()
						.getAttribute("userSession");
				Integer recordCount = 0;
				int dndId = 0;
				String active = request.getParameter("active1");
				int partyId=Integer.parseInt(request.getParameter("partyId"));
				dndData.setContactPartyId(partyId);
				String result = FiinfraConstants.FAIL;
				int createdBy = userSession.getUserId();
				int buId = userSession.getBuId();
				if(active.equals("checked"))
				{
					dndData.setActive(true);
				}
				else{
					dndData.setActive(false);
				}
				try{
					dndId = Integer.parseInt(request.getParameter("dndId"));
				dndData.setDndId_Add_Edit(dndId);
				}catch(Exception e)
				{
					dndData.setDndId_Add_Edit(0);
				}
				logger.info("Tag id In Web="+dndId);
				
				logger.info("is active in tagdata==="+dndData.isActive());
				logger.info("is active in tagdata delivary channel Id========"+dndData.getDelivaryChannel());
				dndData.setBuId(buId);
				dndData.setCreatedBy(createdBy);
				url = URL_INSERt_DNDS + userSession.getUserName() + "/1234";
				BaseResponse<QueryData> br = new BaseResponse<QueryData>();
				br = restTemplate.postForObject(url, dndData, BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					dndData = objectMapper
							.readValue(objectMapper.writeValueAsString(br
									.getResponseObject()), DndData.class);
				
				int notifyDndId = dndData.getNotifyDndId();
				if (notifyDndId > 0)
					result = FiinfraConstants.SUCCESS;
				PrintWriter out = null;
				try {
					out = response.getWriter();
				} catch (IOException e) {
					logger.error(e);
				}
				objectMapper.writeValue(out, result);
			}
	
	
	 public void getDNDDetails(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		int dndId =Integer.parseInt(request.getParameter("dndId"));
		url = URL_GET_DNDDETAILS + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("dndId", dndId);
		uriCB.queryParam("buId", buId);
		
	
	
	
	BaseResponse<DndData> br = new BaseResponse<DndData>();
	br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
			BaseResponse.class).getBody();
	DndData dndData = null;
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		dndData = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), DndData.class);
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, dndData);
		
	}
	 @SuppressWarnings("unchecked")
		public void deleteDnd(HttpServletRequest request, 
				HttpServletResponse response) throws IOException {
			String dndIds = request.getParameter("dndIds");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId = userSession.getBuId();
			url = URL_DELETE_DNDS + userSession.getUserName() + "/1234";
			logger.info("url:-"+url);
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("dndIds", dndIds);
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
	 
	 public void getDNDListXLS(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId = userSession.getBuId();
			int partyId = userSession.getPartyId();
			url = URL_GET_DND_LIST + userSession.getUserName() + "/1234";
			logger.info("url:-"+url);
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("buId", buId);
			BaseResponse<DndData> br = new BaseResponse<DndData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
					BaseResponse.class).getBody();
			List<DndData> dndData = new ArrayList<>();
			List<DndData> dndData1 = new ArrayList<>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				dndData = br.getResponseListObject();
			for(int i = 0; i<dndData.size(); i++){
				//get the actual party object from its LinkedHashMap representation
				DndData noDndData;
				noDndData = objectMapper.readValue(objectMapper.writeValueAsString(dndData.get(i)), DndData.class);
				dndData1.add(noDndData);
			}
			response.addHeader("Content-type", "application/vnd.ms-excel");
			response.addHeader("Content-Disposition", "attachment;filename=DNDList.xls");
			
			HSSFWorkbook workbook = new HSSFWorkbook();
			CellStyle style = workbook.createCellStyle();
			HSSFFont font=workbook.createFont();
	        /* set the weight of the font */
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	        /* attach the font to the style created earlier */
			style.setFont(font);
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

			HSSFSheet sheet = workbook.createSheet("DNDList");
			int rowNum = 0;
			int column = 0;
			HSSFRow excelRow =  sheet.createRow(rowNum++);
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("DND For");
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
			cell.setCellValue("Date");
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Time");
			}
			


			for(DndData dndDataList:dndData1){
				column = 0;
				excelRow =  sheet.createRow(rowNum++);
				{	HSSFCell cell =  excelRow.createCell(column++);
					cell.setCellStyle(style);
					cell.setCellValue(dndDataList.getDndFor());
				}
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(dndDataList.getEmailId());
			}
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(dndDataList.getMobileNo());
			}
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(""+dndDataList.getDndDate());
			}	
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(""+dndDataList.getDndTime());
			}	

			}

			workbook.write(response.getOutputStream());
		
		}
//dsf
	 public void getDNDListCSV(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId = userSession.getBuId();
			int partyId = userSession.getPartyId();
			url = URL_GET_DND_LIST + userSession.getUserName() + "/1234";
			logger.info("url:-"+url);
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("buId", buId);
			BaseResponse<DndData> br = new BaseResponse<DndData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
					BaseResponse.class).getBody();
			List<DndData> dndData = new ArrayList<>();
			List<DndData> dndData1 = new ArrayList<>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				dndData = br.getResponseListObject();
			for(int i = 0; i<dndData.size(); i++){
				//get the actual party object from its LinkedHashMap representation
				DndData noDndData;
				noDndData = objectMapper.readValue(objectMapper.writeValueAsString(dndData.get(i)), DndData.class);
				dndData1.add(noDndData);
			}
			response.addHeader("Content-Disposition", "attachment;filename=DNDList.csv");
			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("DND For"));
			writer.print(",");
			writer.print(CommonUtils.escape("Email Id"));
			writer.print(",");
			writer.print(CommonUtils.escape("Contact Number"));
			writer.print(",");
			writer.print(CommonUtils.escape("Date"));
			writer.print(",");
			writer.print(CommonUtils.escape("Time"));
			writer.print(",");
			
			writer.println();
			for(DndData dndList:dndData1){
				writer.print(CommonUtils.escape(dndList.getDndFor()));
				writer.print(",");
				writer.print(CommonUtils.escape(dndList.getEmailId()));
				writer.print(",");
				writer.print(CommonUtils.escape(dndList.getMobileNo()));
				writer.print(",");
				writer.print(CommonUtils.escape(""+dndList.getDndDate()));
				writer.print(",");
				writer.print(CommonUtils.escape(""+dndList.getDndTime()));
				writer.println();
			}
	 }
	 
	 public ModelAndView getAutoPingEvent(HttpServletRequest request,HttpServletResponse response)throws IOException{
		 	UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int partyId = userSession.getPartyId();
			String pagesize = request.getParameter("pageSize");
			if (pagesize == null) {
				pagesize = "10";
			}
			url = URL_AUTO_PING_EVENT_LIST+ "abc"
					+ "/1234?partyId="+partyId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<AutoPing> autoping_eventlist = new ArrayList<AutoPing>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				autoping_eventlist= br.getResponseListObject();
			logger.info(autoping_eventlist);
			ModelAndView mav = new ModelAndView("ping/autopingEvent");
			mav.addObject("autoping_eventlist", objectMapper.writeValueAsString(autoping_eventlist));
			mav.addObject("size", pagesize);
			return mav;
		}
	 
	 
	 public void eventExportAutoPing(HttpServletRequest request,
				HttpServletResponse response) {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int partyId = userSession.getPartyId();
			String userToken = null;
			if (userSession.getUserName() != null) {
				userToken = userSession.getUserName();
			} else {
				userToken = "abc";
			}

			
			

			try {

				//AutoPing revBook = new AutoPing();
				
				List<AutoPing> premAsJson = new ArrayList<AutoPing>();
				List<AutoPing> premumList = new ArrayList<AutoPing>();

				/*BaseResponse<AutoPing> baseResponse = new BaseResponse<AutoPing>();
				url = URL_AUTO_PING_EVENT_LIST+ userToken + "/1234";
				baseResponse = restTemplate.postForObject(url, revBook,
						BaseResponse.class);*/
				url = URL_AUTO_PING_EVENT_LIST+ "abc"
						+ "/1234?partyId="+partyId;
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				BaseResponse<AutoPing> baseResponse = new BaseResponse<AutoPing>();
				baseResponse =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				//List<AutoPing> autoping_eventlist = new ArrayList<AutoPing>();
				/*if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					autoping_eventlist= baseResponse.getResponseListObject();*/

				if (baseResponse.getStatus().equalsIgnoreCase(
						FiinfraConstants.success)) {
					try {
						premAsJson = objectMapper.readValue(objectMapper
								.writeValueAsString(baseResponse
										.getResponseListObject()), ArrayList.class);

						for (int i = 0; i < premAsJson.size(); i++) {
							// get the actual party object from its LinkedHashMap
							// representation
							AutoPing list2;
							list2 = objectMapper.readValue(objectMapper
									.writeValueAsString(premAsJson.get(i)),
									AutoPing.class);

							premumList.add(list2);
						}

					} catch (JsonParseException e) {
						logger.error(""+e);
					} catch (JsonMappingException e) {
						logger.error(""+e);
					} catch (JsonGenerationException e) {
						logger.error(""+e);
					} catch (IOException e) {
						logger.error(""+e);
					}
				}

				String type = request.getParameter("type");
				String seperator = ",";
				if (type.equals("CSV")) {
					response.addHeader("Content-Disposition",
							"attachment;filename=event.csv"); 	
					seperator = ",";
				}
				if (type.equals("excel")) {
					response.addHeader("Content-Disposition",
							"attachment;filename=event.xls");
					seperator = "\t";
				}

				/*
				 * if (type.equals("CSV")) {
				 * response.addHeader("Content-Disposition",
				 * "attachment;filename=ProductCategoryRevenue.csv");
				 */

				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Event"));

				writer.print(seperator);
				writer.print(CommonUtils.escape("Event Description"));

				writer.print(seperator);
				writer.print(CommonUtils.escape("Source"));
				
				writer.print(seperator);
				writer.print(CommonUtils.escape("Status"));

				/*writer.print(seperator);
				writer.print(CommonUtils.escape("LastModifiedDate"));

				writer.print(seperator);
				writer.print(CommonUtils.escape("LastModifiedBy"));*/

				

				writer.println();
				for (AutoPing list : premumList) {

					writer.print(CommonUtils.escape("" + list.getEvent()));
					writer.print(seperator);

					writer.print(CommonUtils.escape("" + list.getEventDescription()));
					writer.print(seperator);

					writer.print(CommonUtils.escape("" + list.getSource()));
					writer.print(seperator);
					String status=null;
					if(list.getIsRecuring()==1){
						status="Enabled";
					}else{
						status="Disabled";
					}
					writer.print(CommonUtils.escape("" + status));
					writer.print(seperator);

					/*writer.print(CommonUtils.escape("" + list.getLastModifiedDate()));
					writer.print(seperator);
					
					writer.print(CommonUtils.escape("" + list.getEventCreatedBy()));
					writer.print(seperator);*/

					

					writer.println();
				}

				// }

			} catch (Exception e) {
				logger.error(""+e);
			}

		}
	 public void changeAutoPingStatus(HttpServletRequest request,HttpServletResponse response) throws IOException{
		 	int eventId = Integer.parseInt(request.getParameter("eventId"));
		 	String flag=request.getParameter("flag");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int partyId = userSession.getPartyId();
			int lastUpdatedBy=userSession.getUserId();
			url = URL_CHANGE_AUTO_PING_EVENT_STATUS + userSession.getUserName() + "/1234";
			logger.info("url:-"+url);
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("eventId", eventId);
			uriCB.queryParam("flag",flag);
			uriCB.queryParam("partyId",partyId);
			uriCB.queryParam("lastUpdatedBy",lastUpdatedBy);
			BaseResponse <Integer> br = new BaseResponse<Integer>();
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
			objectMapper.writeValue(out, br.getResponseObject());
	 }
}