package in.fiinfra.common.controller;

import in.fiinfra.common.client.ClientData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.QueryCommentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Notification;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.google.gson.Gson;

/*Viraj To DO: exceptional handling for -ve senario where response is null,emply or something else!
 * Implement Service Locator for resolving URL, remove hardcoding
 * Implement security token, remove hardcoding of token-1234
 * get login username and pas qith every query*/
public class QueryController extends MultiActionController {
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	Gson gson;
	String url;
	private static final Logger logger = Logger.getLogger(QueryController.class);
	@Value("${URL_INSERT_QUERY}")
	private String URL_INSERT_QUERY;
	@Value("${URL_DELETE_QUERY}")
	private String URL_DELETE_QUERY;
	@Value("${URL_GET_QUERY_LIST}")
	private String URL_GET_QUERY_LIST;
	@Value("${URL_GET_QUERY_UNREAD_COUNT}")
	private String URL_GET_QUERY_UNREAD_COUNT;
	@Value("${URL_GET_QUERY_RECORD}")
	private String URL_GET_QUERY_RECORD;
	@Value("${URL_INSERT_QUERYCOMMENT}")
	private String URL_INSERT_QUERYCOMMENT;
	@Value("${URL_UPDATE_QUERY_STATUS}")
	private String URL_UPDATE_QUERY_STATUS;
	

	/**
	 * save the query details
	 * 
	 * @param request
	 * @param response
	 * @param queryData
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void saveQuery(HttpServletRequest request,
			HttpServletResponse response, QueryData queryData) throws Exception {
		String result = FiinfraConstants.FAIL;
		request.getSession().setAttribute("QueryResult", result);
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int queryOwner= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int buId = userSession.getBuId();
		queryData.setBuId(buId);
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		queryData.setCreatedBy(createdBy);
		queryData.setQueryOwner(queryOwner);
		long currentTime = new Date().getTime();
		MultipartFile[] m = queryData.getQueryAttachment();
		documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(m,
				currentTime, createdBy);
		//logger.info("documentDatas:-"+documentDatas);
		if (documentDatas == null) {
			result = "Attachment size greater than "
					+ FiinfraConstants.MAX_FILE_SIZE + " kb is not allowed.";
		} else {
			if (documentDatas.size() > 0) {
				queryData.setAttachmentCount(documentDatas.size());
				queryData.setAttachment(true);
			}
			url = URL_INSERT_QUERY + userSession.getUserName() + "/1234";
			//logger.info("url:-"+url);
			queryData.setDocumentDatas(documentDatas);
			BaseResponse<QueryData> br = new BaseResponse<QueryData>();
			br = restTemplate.postForObject(url, queryData, BaseResponse.class);
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				queryData = objectMapper
						.readValue(objectMapper.writeValueAsString(br
								.getResponseObject()), QueryData.class);
			String basePath = queryData.getBasePath();
			int queryId = queryData.getQueryId();
			if (queryId > 0)
				result = FiinfraConstants.SUCCESS;
			if (documentDatas.size() > 0) {
				result = FiinfraUtility.uploadAttachments(m, basePath,
						currentTime);
			}
		}
		
		System.out.println("result-Ams--"+result);
		if(result==FiinfraConstants.SUCCESS)
		{
			System.out.println("Amruta....");
			Map<Integer,String> payloadMapQuery=new HashMap<>();
			payloadMapQuery.put(Integer.valueOf(queryData.getQueryOwner()), queryData.getSubject());
			System.out.println("Amruta...."+payloadMapQuery);
			Notification notification=null;
			for(Map.Entry<Integer,String> map:payloadMapQuery.entrySet()){
				Map<String,String> payloadMap=new HashMap<String, String>();
				payloadMap.put("QuerySubject",map.getValue());
				notification=new Notification();
				notification.setNotifyUserID(userSession.getUserId());
				notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
				notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
				notification.setNotifyPartyID(queryData.getQueryOwner());
				notification.setNotifyEventID(FiinfraConstants.QUERY_REMINDER);
				notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
				notification.setBuId(buId);
				notification.setPayloadMap(payloadMap);
				notification.setSessionID(request.getSession().getId());
				
				FrameworkUtil.notify(notification);
			}
		}
			
		
		String serverPath = request
				.getRequestURL()
				.toString()
				.replace(request.getRequestURI().substring(0),
						request.getContextPath());
		request.getSession().setAttribute("QueryResult", result);
		response.sendRedirect(serverPath + "/addQuery.htm");

	}

	/**
	 * deletes the query and related details
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void deleteQuery(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String queryIds = request.getParameter("queryIds");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_DELETE_QUERY + userSession.getUserName() + "/1234";
		//logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("queryIds", queryIds);
		uriCB.queryParam("buId", buId);
		BaseResponse<String> br = new BaseResponse<String>();
		try {
			br = restTemplate.getForEntity(
					FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class)
					.getBody();
		} catch (Exception e) {
			//e.printStackTrace();ackTrace();
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
	 * retrieves query list based on the query panel.
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonGenerationException 
	 */
	@SuppressWarnings("unchecked")
	public ModelAndView getQueryList(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
//		int partyId = userSession.getPartyId();
		int partyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		
		
		String queryPanel = request.getParameter("queryPanel");// "inbox";
		String searchValue = request.getParameter("value");// "search value";
		queryPanel = queryPanel == null ? "inbox" : queryPanel;
		request.getSession().setAttribute("queryPanel", queryPanel);
		url = URL_GET_QUERY_LIST + userSession.getUserName() + "/1234";
		//logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("queryPanel", queryPanel);
		uriCB.queryParam("searchValue", searchValue);
		uriCB.queryParam("nodeId", nodeId);
		
		BaseResponse<QueryData> br = new BaseResponse<QueryData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<QueryData> queryDatas = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			queryDatas = br.getResponseListObject();
		url = URL_GET_QUERY_UNREAD_COUNT + userSession.getUserName() + "/1234";
		//logger.info("url:-"+url);
		uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("queryPanel", queryPanel);
		uriCB.queryParam("searchValue", searchValue);
		uriCB.queryParam("nodeId", nodeId);
		
		BaseResponse<Integer> br1 = new BaseResponse<Integer>();
		br1 = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<Integer> unreadQueryCount = new ArrayList<>();
		if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			unreadQueryCount = br1.getResponseListObject();
		ModelAndView mav = new ModelAndView("common/query");
		mav.addObject("queryDatas", objectMapper.writeValueAsString(queryDatas));
		mav.addObject("pagesize", pagesize);
		mav.addObject("unreadQueryInboxCount", unreadQueryCount.get(0));
		mav.addObject("unreadQuerySentboxCount", unreadQueryCount.get(1));
		
		return mav;// new ModelAndView("common/query", "queryDatas",
					// queryDatas);
	}
	
	public void getQueryListXLS(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		
		
		String queryPanel = request.getParameter("queryPanel");// "inbox";
		String searchValue = request.getParameter("value");// "search value";
		queryPanel = queryPanel == null ? "inbox" : queryPanel;
		request.getSession().setAttribute("queryPanel", queryPanel);
		url = URL_GET_QUERY_LIST + userSession.getUserName() + "/1234";
		//logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("queryPanel", queryPanel);
		uriCB.queryParam("searchValue", searchValue);
		BaseResponse<QueryData> br = new BaseResponse<QueryData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<QueryData> queryDatas = new ArrayList<>();
		List<QueryData> queryDatas1 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			queryDatas = br.getResponseListObject();
				for(int i = 0; i<queryDatas.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					QueryData queryData;
					queryData = objectMapper.readValue(objectMapper.writeValueAsString(queryDatas.get(i)), QueryData.class);
					queryDatas1.add(queryData);
				}

		response.addHeader("Content-type", "application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename=QueryList.xls");
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font=workbook.createFont();
        /* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        /* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet("Query List");
		int rowNum = 0;
		int column = 0;
		HSSFRow excelRow =  sheet.createRow(rowNum++);
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Subject");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Query Type");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Query For");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Last Updated Date");
		}

		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Last Updated By");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Status");
	}


		for(QueryData queryData:queryDatas1){
			column = 0;
			excelRow =  sheet.createRow(rowNum++);
			{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(queryData.getSubject());
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(queryData.getQueryTypeName());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(queryData.getQueryFor());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(queryData.getLastUpdatedDate());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(queryData.getLastUpdatedByName());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(queryData.getStatus());
		}

		}

		workbook.write(response.getOutputStream());
	}
	
	public void getQueryListCSV(HttpServletRequest request, HttpServletResponse response) throws IOException {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		
		
		String queryPanel = request.getParameter("queryPanel");// "inbox";
		String searchValue = request.getParameter("value");// "search value";
		queryPanel = queryPanel == null ? "inbox" : queryPanel;
		request.getSession().setAttribute("queryPanel", queryPanel);
		url = URL_GET_QUERY_LIST + userSession.getUserName() + "/1234";
		//logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("queryPanel", queryPanel);
		uriCB.queryParam("searchValue", searchValue);
		BaseResponse<QueryData> br = new BaseResponse<QueryData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<QueryData> queryDatas = new ArrayList<>();
		List<QueryData> queryDatas1 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			queryDatas = br.getResponseListObject();
				for(int i = 0; i<queryDatas.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					QueryData queryData;
					queryData = objectMapper.readValue(objectMapper.writeValueAsString(queryDatas.get(i)), QueryData.class);
					queryDatas1.add(queryData);
				}
			response.addHeader("Content-Disposition", "attachment;filename=QueryList.csv");
			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Subject"));
			writer.print(",");
			writer.print(CommonUtils.escape("Query Type"));
			writer.print(",");
			writer.print(CommonUtils.escape("Query For"));
			writer.print(",");
			writer.print(CommonUtils.escape("Last Updated Date"));
			writer.print(",");
			writer.print(CommonUtils.escape("Last Updated By"));
			writer.print(",");
			writer.print(CommonUtils.escape("Status"));
			writer.println();
			for(QueryData queryData:queryDatas1){
				writer.print(CommonUtils.escape(queryData.getSubject()));
				writer.print(",");
				writer.print(CommonUtils.escape(queryData.getQueryTypeName()));
				writer.print(",");
				writer.print(CommonUtils.escape(queryData.getQueryFor()));
				writer.print(",");
				writer.print(CommonUtils.escape(queryData.getLastUpdatedDate()));
				writer.print(",");
				writer.print(CommonUtils.escape(queryData.getLastUpdatedByName()));
				writer.print(",");
				writer.print(CommonUtils.escape(queryData.getStatus()));
				writer.println();
			}
	}

	/**
	 * Retrieves the query details and comment list
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
	public void getQueryDetails(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException, IllegalAccessException,
			InvocationTargetException {
		Integer queryId = Integer.parseInt(request.getParameter("queryId")
				.toString());
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partyId = userSession.getPartyId();
		int buId = userSession.getBuId();
		url = URL_GET_QUERY_RECORD + userSession.getUserName() + "/1234";
		//logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("queryId", queryId);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<QueryData> br = new BaseResponse<QueryData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		QueryData queryData = new QueryData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			queryData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					QueryData.class);
		queryData.setQueryId(queryId);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, queryData);
	}

	/**
	 * saves the comment details and attachments
	 * 
	 * @param request
	 * @param response
	 * @param queryCommentData
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void saveComment(HttpServletRequest request,
			HttpServletResponse response, QueryCommentData queryCommentData)
			throws Exception {
		String result = FiinfraConstants.FAIL;
		request.getSession().setAttribute("CommentResult", result);
		request.getSession().setAttribute("QueryId", 0);
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
//		int commentOwner = userSession.getPartyId();
		int commentOwner= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int buId = userSession.getBuId();
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		queryCommentData.setCommentPartyId(commentOwner);
		queryCommentData.setBuId(buId);
		long currentTime = new Date().getTime();
		MultipartFile[] m = queryCommentData.getCommentAttachment();
		documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(m,
				currentTime, createdBy);
		if (documentDatas == null) {
			result = "Attachment size greater than "
					+ FiinfraConstants.MAX_FILE_SIZE + " kb is not allowed.";
		} else {
			if (documentDatas.size() > 0) {
				queryCommentData.setAttachmentCount(documentDatas.size());
				queryCommentData.setAttachment(true);
			}
			url = URL_INSERT_QUERYCOMMENT + userSession.getUserName() + "/1234";
			//logger.info("url:-"+url);
			queryCommentData.setDocumentDatas(documentDatas);
			queryCommentData.setCommentAttachment(null);
			BaseResponse<QueryCommentData> br = new BaseResponse<QueryCommentData>();
			br = restTemplate.postForObject(url, queryCommentData,
					BaseResponse.class);
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				queryCommentData = objectMapper
						.readValue(objectMapper.writeValueAsString(br
								.getResponseObject()), QueryCommentData.class);
			String basePath = queryCommentData.getBasePath();
			int queryCommentId = queryCommentData.getQueryCommentId();
			if (queryCommentId > 0)
				result = FiinfraConstants.SUCCESS;
			if (documentDatas.size() > 0) {
				result = FiinfraUtility.uploadAttachments(m, basePath,
						currentTime);
			}
		}
		String serverPath = request
				.getRequestURL()
				.toString()
				.replace(request.getRequestURI().substring(0),
						request.getContextPath());
		request.getSession().setAttribute("CommentResult", result);
		request.getSession().setAttribute("QueryId",
				queryCommentData.getQueryId());
		response.sendRedirect(serverPath + "/query/getQueryList.htm");
	}

	@SuppressWarnings({ "unchecked" })
	public void saveQueryStatus(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Integer recordCount = 0;
		int queryId = Integer.parseInt(request.getParameter("queryId"));
		int status = Integer.parseInt(request.getParameter("status"));
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int lastUpdatedBy = userSession.getUserId();
		url = URL_UPDATE_QUERY_STATUS + userSession.getUserName() + "/1234";
		//logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("queryId", queryId);
		uriCB.queryParam("status", status);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("lastUpdatedBy", lastUpdatedBy);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Integer.class);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);
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
