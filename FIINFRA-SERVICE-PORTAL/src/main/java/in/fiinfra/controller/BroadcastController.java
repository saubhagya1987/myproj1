package in.fiinfra.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.Broadcast;
import in.fiinfra.common.service.vo.RoleAccess;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.cp.CommonUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.JsonParseException;

public class BroadcastController extends MultiActionController {

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(BroadcastController.class);
	
	private RestTemplate restTemplate;

	private ObjectMapper objectMapper;

	@Value("${URL_GET_BROADCAST_LIST}")
	private String URL_GET_BROADCAST_LIST;

	@Value("${URL_GET_USERTYPE_LIST}")
	private String URL_GET_USERTYPE_LIST;

	@Value("${URL_GET_ROLE_LIST}")
	private String URL_GET_ROLE_LIST;

	@Value("${URL_DELETE_BROADCAST}")
	private String URL_DELETE_BROADCAST;

	@Value("${URL_ADD_BROADCAST}")
	private String URL_ADD_BROADCAST;
	
	@Value("${URL_SYSTEM_SOURCE_LIST}")
	private String URL_SYSTEM_SOURCE_LIST;

	String url;

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
	@RequestMapping(value = "/loadbroadcast", method = RequestMethod.GET)
	public ModelAndView loadbroadcast(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}
		// return jsp page
		ModelAndView mav = new ModelAndView("broadcast/broadcast");

		String searchTextVal = null;

		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}

		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		BaseResponse<Broadcast> br = new BaseResponse<Broadcast>();
		try {

			Broadcast broadcast = new Broadcast();
			broadcast.setSearchText(searchTextVal);
			url = URL_GET_BROADCAST_LIST + userToken + "/1234";
			br = restTemplate.postForObject(url, broadcast, BaseResponse.class);
			List<Broadcast> broadcastList = new ArrayList<Broadcast>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				broadcastList = br.getResponseListObject();
			mav.addObject("broadcastList", objectMapper.writeValueAsString( broadcastList));
			mav.addObject("size", pagesize);
			mav.addObject("searchTextVal", searchTextVal);
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception e) {
				logger.error(""+e);
			}
		} catch (Exception e) {
			logger.error(""+e);
		}
		return mav;
	}

	@SuppressWarnings("unchecked")
	public void getUserType(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		Broadcast broadcast = new Broadcast();
		url = URL_GET_USERTYPE_LIST + userSession.getUserName() + "/1234";
		BaseResponse<Broadcast> br = new BaseResponse<Broadcast>();
		br = restTemplate.postForObject(url, broadcast, BaseResponse.class);
		List<Broadcast> userTypelist = new ArrayList<Broadcast>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			userTypelist = br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, userTypelist);
	}

	@SuppressWarnings("unchecked")
	public void getRoleList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String token = "abcd";
		if (userSession.getUserName() != null) {
			token = userSession.getUserName();
		}
		url = URL_GET_ROLE_LIST + token + "/1234";
		Broadcast broadcast = new Broadcast();
		BaseResponse<Broadcast> br = new BaseResponse<Broadcast>();
		br = restTemplate.postForObject(url, broadcast, BaseResponse.class);
		List<Broadcast> rolelist = new ArrayList<Broadcast>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			rolelist = br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, rolelist);
	}

	@SuppressWarnings("unchecked")
	public void addNewBroadcast(HttpServletRequest request,
			HttpServletResponse response, Broadcast broadcastData)
			throws JsonGenerationException, JsonMappingException, IOException,
			ParseException {

		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int createdby = userSession.getUserId();
		int lastmodifiedby = userSession.getUserId();
		broadcastData.setBroadCastTextId(5860);
		broadcastData.setCreatedBy(createdby);
		broadcastData.setLastModifiedBy(lastmodifiedby);

		// for audit functionality
		String module = FiinfraConstants.SRP_ADD_BROADCAST;
		int eventId = 97165;
		if (broadcastData.getId() != 0) {
			module = FiinfraConstants.SRP_EDIT_BROADCAST;
			eventId = 97166;
		}
		
		url = URL_ADD_BROADCAST + userSession.getUserName() + "/1234";
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, broadcastData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			// insert record for audit tracking
			FiinfraUtility.doAudit(userSession.getPartyId(),
					userSession.getUserId(), eventId,
					FiinfraConstants.SERVICE_PORTAL,
					FiinfraConstants.SRP_SOURCE_MODULE_BROADCAST, module);
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
	}

	@SuppressWarnings("unchecked")
	public void deleteBroadcastList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		if (request.getParameter("selectedlvalz") != null) {
			String list = request.getParameter("selectedlvalz");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			url = URL_DELETE_BROADCAST + userSession.getUserName() + "/1234";
			Broadcast broadcast = new Broadcast();
			
			broadcast.setCreatedBy(userSession.getUserId());
			broadcast.setDeleteList(list);
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.postForObject(url, broadcast, BaseResponse.class);
			Integer codeValueDataList = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				FiinfraUtility.doAudit(userSession.getPartyId(),
						userSession.getUserId(), 97167,
						FiinfraConstants.SERVICE_PORTAL,
						FiinfraConstants.SRP_SOURCE_MODULE_BROADCAST,
						FiinfraConstants.SRP_DELETE_BROADCAST);
			codeValueDataList = br.getResponseObject();
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, codeValueDataList);
		}
	}

	@SuppressWarnings("unchecked")
	public void exportBroadcast(HttpServletRequest request,
			HttpServletResponse response) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}
		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
		try {
			Broadcast broadcast = new Broadcast();
			broadcast.setSearchText(searchTextVal);
			BaseResponse<Broadcast> baseResponse = new BaseResponse<Broadcast>();
			url = URL_GET_BROADCAST_LIST + userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, broadcast,
					BaseResponse.class);
			List<Broadcast> premAsJson = new ArrayList<Broadcast>();
			List<Broadcast> premumList = new ArrayList<Broadcast>();
			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					premAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < premAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						Broadcast list2;
						list2 = objectMapper.readValue(objectMapper
								.writeValueAsString(premAsJson.get(i)),
								Broadcast.class);

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
			if (type.equals("CSV")) {

				response.addHeader("Content-Disposition",
						"attachment;filename=BroadcastList.csv");
				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Section"));
				writer.print(",");
				writer.print(CommonUtils.escape("Broadcast Title"));
				writer.print(",");
				writer.print(CommonUtils.escape("Start Datetime"));
				writer.print(",");
				writer.print(CommonUtils.escape("Expiry Datetime"));
				writer.print(",");
				writer.print(CommonUtils.escape("Show Popup on Login"));
				writer.print(",");
				writer.print(CommonUtils.escape("Update on"));
				writer.print(",");
				writer.print(CommonUtils.escape("Source System"));
				writer.println();
				for (Broadcast list : premumList) {
					writer.print(CommonUtils.escape(list.getSectionName()));
					writer.print(",");
					writer.print(CommonUtils.escape(list.getBroadCastTitle()));
					writer.print(",");
					writer.print(CommonUtils.escape(list.getStartDate()));
					writer.print(",");
					writer.print(CommonUtils.escape(list.getExpiryDate()));
					writer.print(",");
					writer.print(CommonUtils
							.escape(list.isLoginPopUpDisplay() == true ? "Yes"
									: "No"));
					writer.print(",");
					writer.print(CommonUtils.escape(list.getLastModifiedDate()));
					writer.print(",");
					//writer.print(CommonUtils.escape(list.getSourceSystemName()));
					String sources = list.getSourceIdList();
					String[] sourcesArray = sources.split(",");
					for (int i=0; i<sourcesArray.length; i++)
				    {	
						if(sourcesArray[i].equals("31001")){
							writer.print(CommonUtils.escape("Partner Portal "));
						} else if(sourcesArray[i].equals("31003")){
							writer.print(CommonUtils.escape("Service Portal "));
						} else if(sourcesArray[i].equals("31004")){
							writer.print(CommonUtils.escape("Client Portal "));
						} else if(sourcesArray[i].equals("31005")){
							writer.print(CommonUtils.escape("SFDC "));
						} else if(sourcesArray[i].equals("31006")){
							writer.print(CommonUtils.escape("DIY "));
						} 
						
						
				    }
					/*<c:forEach var="name" items="${data.sourceIdList}">
						<c:if test="${name=='31001'}">Partner Portal </br> </c:if>
						<c:if test="${name=='31003'}">Service Portal</br></c:if>
						<c:if test="${name=='31004'}">Client Portal</br></c:if>
						<c:if test="${name=='31005'}">SFDC</br></c:if>
						<c:if test="${name=='31006'}">DIY</c:if> 
						
						</c:forEach>*/
					writer.println();
				}
			}

			if (type.equals("excel")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=BroadcastList.xls");
				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Section"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Broadcast Title"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Start Datetime"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Expiry Datetime"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Show Popup on Login"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Update on"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Source System"));
				writer.println();

				for (Broadcast list : premumList) {

					writer.print(CommonUtils.escape(list.getSectionName()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list.getBroadCastTitle()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list.getStartDate()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list.getExpiryDate()));
					writer.print("\t");
					writer.print(CommonUtils
							.escape(list.isLoginPopUpDisplay() == true ? "Yes"
									: "No"));
					writer.print("\t");
					writer.print(CommonUtils.escape(list.getLastModifiedDate()));
					writer.print("\t");
					//writer.print(CommonUtils.escape(list.getSourceSystemName()));
					String sources = list.getSourceIdList();
					String[] sourcesArray = sources.split(",");
					for (int i=0; i<sourcesArray.length; i++)
				    {	
						if(sourcesArray[i].equals("31001")){
							writer.print(CommonUtils.escape("Partner Portal "));
						} else if(sourcesArray[i].equals("31003")){
							writer.print(CommonUtils.escape("Service Portal "));
						} else if(sourcesArray[i].equals("31004")){
							writer.print(CommonUtils.escape("Client Portal "));
						} else if(sourcesArray[i].equals("31005")){
							writer.print(CommonUtils.escape("SFDC "));
						} else if(sourcesArray[i].equals("31006")){
							writer.print(CommonUtils.escape("DIY "));
						} 
						
						
				    }
					writer.println();

				}

			}

		} catch (Exception e) {
			logger.error(""+e);
		}

	}

	
	@SuppressWarnings("unchecked")
	public void getSourceSystemList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String token = "abcd";
		if (userSession.getUserName() != null) {
			token = userSession.getUserName();
		}
		RoleAccess roleAccess = new RoleAccess();
		//get system source id list
		url = URL_SYSTEM_SOURCE_LIST + token + "/1234";
		BaseResponse<RoleAccess> br = new BaseResponse<RoleAccess>();
		br = restTemplate.postForObject(url, roleAccess, BaseResponse.class);
		List<RoleAccess> sourceList = new ArrayList<RoleAccess>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			sourceList = br.getResponseListObject();

		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, sourceList);
	}
	
}
