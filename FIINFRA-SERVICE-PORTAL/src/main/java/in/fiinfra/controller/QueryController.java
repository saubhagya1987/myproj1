package in.fiinfra.controller;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.QueryCommentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class QueryController extends  MultiActionController 
{
	private RestTemplate restTemplate;

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(FaqController.class);
	
	@Value("${URL_GET_QUERY_RECORD}")
	private String URL_GET_QUERY_RECORD;
	
	@Value("${URL_INSERT_QUERYCOMMENT}")
	private String URL_INSERT_QUERYCOMMENT;
	
	
	@Value("${URL_GET_QUERY_LIST}")
	private String URL_GET_QUERY_LIST;
	
	
	
	
	@Value("${URL_GET_QUERY_UNREAD_COUNT}")
	private String URL_GET_QUERY_UNREAD_COUNT;
	
	
	@Value("${URL_UPDATE_QUERY_STATUS}")
	private String URL_UPDATE_QUERY_STATUS;
	
	@Value("${URL_DELETE_QUERY}")
	private String URL_DELETE_QUERY;
	
	
	
	
	String url;
	
	private ObjectMapper objectMapper;
	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}
	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
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
		logger.info("url:-"+url);
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
		int commentOwner = userSession.getPartyId();
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
			logger.info("url:-"+url);
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


	@SuppressWarnings("unchecked")
	public ModelAndView getQueryList(HttpServletRequest request,
			HttpServletResponse response) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		
		// partyId = 6326;
		
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		logger.info("pageSize------"+pagesize);
		
		
		String queryPanel = request.getParameter("queryPanel");// "inbox";
		String searchValue = request.getParameter("value");// "search value";
		logger.info("Search value ......"+searchValue);
		queryPanel = queryPanel == null ? "inbox" : queryPanel;
		request.getSession().setAttribute("queryPanel", queryPanel);
		url = URL_GET_QUERY_LIST + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("queryPanel", queryPanel);
		uriCB.queryParam("searchValue", searchValue);
		BaseResponse<QueryData> br = new BaseResponse<QueryData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<QueryData> queryDatas = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			queryDatas = br.getResponseListObject();
		url = URL_GET_QUERY_UNREAD_COUNT + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("queryPanel", queryPanel);
		uriCB.queryParam("searchValue", searchValue);
		BaseResponse<Integer> br1 = new BaseResponse<Integer>();
		br1 = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<Integer> unreadQueryCount = new ArrayList<>();
		if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			unreadQueryCount = br1.getResponseListObject();
		ModelAndView mav = new ModelAndView("partner/query");
		mav.addObject("queryDatas", queryDatas);
		mav.addObject("pagesize", pagesize);
		mav.addObject("unreadQueryInboxCount", unreadQueryCount.get(0));
		mav.addObject("unreadQuerySentboxCount", unreadQueryCount.get(1));
		
		return mav;// new ModelAndView("common/query", "queryDatas",
					// queryDatas);
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
		logger.info("url:-"+url);
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

	
	@SuppressWarnings("unchecked")
	public void deleteQuery(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String queryIds = request.getParameter("queryIds");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_DELETE_QUERY + userSession.getUserName() + "/1234";
		logger.info("url:-"+url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("queryIds", queryIds);
		uriCB.queryParam("buId", buId);
		BaseResponse<String> br = new BaseResponse<String>();
		try {
			br = restTemplate.getForEntity(
					FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class)
					.getBody();
		} catch (Exception e) {
			e.printStackTrace();
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

	
	public RestTemplate getRestTemplate() {
		return restTemplate;
	}
	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}	
}
