package in.fiinfra.partner.controller;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.ActionPlanData;
import in.fiinfra.common.partner.ContactData;
import in.fiinfra.common.partner.ETData;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.util.Logger;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class ETController extends MultiActionController {
	
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	/*
	 * fetch ap details
	 */

	@Value("${APPLET_FILE_UPLAOD}")
	private String APPLET_FILE_UPLAOD;

	public ModelAndView getBulkUploadAbove(HttpServletRequest request,
			HttpServletResponse response) {
		String aptredirect = APPLET_FILE_UPLAOD;
		return new ModelAndView("redirect:" + aptredirect);
	}

	public ModelAndView getApDetails(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException, Exception {

		String url = FiinfraUtility.getRestDBURL();
		int partyId = 0;

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partnerId = userSession.getPartyId();

		logger.info("PartId Et=======" + request.getParameter("partyId"));

		if (request.getParameter("partyId") != null)
			partyId = Integer.parseInt(request.getParameter("partyId"));
		url = url + "services/et/apdetails?partyId=" + partyId + "&buId="
				+ buId + "&partnerId=" + partnerId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		/*
		 * Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG,
		 * Thread .currentThread().getStackTrace()[1].getMethodName());
		 */
		List<ActionPlanData> apData = Arrays.asList(restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB), ActionPlanData[].class)
				.getBody());

		try {
			
			request.getSession().setAttribute("contactName",
					apData.get(0).getClientName());
			request.getSession().setAttribute("clientType",
					apData.get(0).getClientType());
		} catch (Exception e) {
			logger.error(""+e);
		}
		/*Logger.logEntry(this.getClass(), "apData:---" + apData, Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());*/
		
		ModelAndView mav = new ModelAndView("partner/executiontracker");
		mav.addObject("apData", objectMapper.writeValueAsString(apData));

		return mav;
	}

	/*
	 * 
	 * */
	public void quickSearchContacts(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException {

		String url = FiinfraUtility.getRestDBURL();
		String searchString = request.getParameter("searchString");
		// partner and bu id needs to fetch from session

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		Integer nodeId=0;
		if(request.getSession().getAttribute("nodeId")!=null){
			nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		}

		url = url + "services/et/quickSearchContacts?buId=" + buId
				+ "&searchString=" + searchString + "&partnerId=" + partnerId
				+ "&nodeId=" + nodeId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		logger.info("url::::::" + url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<ContactData> contactData = Arrays.asList(restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
						ContactData[].class).getBody());
		logger.info("contactData::::::" + contactData);
		Logger.logEntry(this.getClass(), "contactData:---" + contactData,
				Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, contactData);
	}

	public ModelAndView executionDetails(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException {
		ETData etData = null;
		String url = FiinfraUtility.getRestDBURL();
		int fpActionPlanId = Integer.parseInt(request
				.getParameter("fpActionPlanId"));

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();

		logger.info("................................................................................."
				+ fpActionPlanId);
		url = url + "services/et/executionDetails?buId=" + buId
				+ "&fpActionPlanId=" + fpActionPlanId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());

		try {
			etData = restTemplate.getForEntity(
					FiinfraUtility.getURLWithParams(uriCB), ETData.class)
					.getBody();
		} catch (Exception e) {

		}
		request.getSession().setAttribute("fpActionPlanId", fpActionPlanId);
		ModelAndView mav = new ModelAndView("partner/executiontracker_product");
		mav.addObject("executionDetails", etData);
		mav.addObject("fpActionPlanId", fpActionPlanId);
		return mav;
	}

	public void savePropesedInvestments(HttpServletRequest request,
			HttpServletResponse response) {
		request.getParameter("etDataList");
	}

	public void investments(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException {
		List<ETData> recommendedInvestment = null;
		List<ETData> proposedInvestment = null;
		List<Object> investments = new ArrayList<Object>();
		String url = FiinfraUtility.getRestDBURL();
		Object returnValue = null;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();

		int fpActionPlanId = Integer.parseInt(request
				.getParameter("fpActionPlanId"));
		url = url + "services/et/recommendedInvestment?buId=" + buId
				+ "&fpActionPlanId=" + fpActionPlanId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());

		try {
			recommendedInvestment = Arrays.asList(restTemplate.getForEntity(
					FiinfraUtility.getURLWithParams(uriCB), ETData[].class)
					.getBody());
		} catch (Exception e) {
			logger.error(e);
		}
		url = FiinfraUtility.getRestDBURL();
		fpActionPlanId = Integer.parseInt(request
				.getParameter("fpActionPlanId"));
		url = url + "services/et/proposedInvestment?buId=" + buId
				+ "&fpActionPlanId=" + fpActionPlanId;
		uriCB = UriComponentsBuilder.fromHttpUrl(url);

		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());

		try {
			proposedInvestment = Arrays.asList(restTemplate.getForEntity(
					FiinfraUtility.getURLWithParams(uriCB), ETData[].class)
					.getBody());
		} catch (Exception e) {

		}
		url = FiinfraUtility.getRestDBURL();
		fpActionPlanId = Integer.parseInt(request
				.getParameter("fpActionPlanId"));
		url = url + "services/et/etPickLists?buId=" + buId + "&fpActionPlanId="
				+ fpActionPlanId;
		uriCB = UriComponentsBuilder.fromHttpUrl(url);

		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());

		try {
			returnValue = restTemplate.getForObject(url, Object.class);
			// proposedInvestment=
			// Arrays.asList(restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
			// ETData[].class).getBody());

		} catch (Exception e) {

		}
		PrintWriter out = null;
		out = response.getWriter();
		investments.add(recommendedInvestment);
		investments.add(proposedInvestment);
		investments.add(returnValue);
		logger.info("proposedInvestment:::" + proposedInvestment);
		response.setContentType("application/json");
		objectMapper.writeValue(out, investments);
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
