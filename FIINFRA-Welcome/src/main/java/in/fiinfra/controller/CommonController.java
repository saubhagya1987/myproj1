package in.fiinfra.controller;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;
import in.fiinfra.common.util.MD5Encryption;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.UserData;

public class CommonController extends MultiActionController {

	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(CommonController.class);
	String url;

	@Value("${URL_CHANGE_PASSWORD}")
	private String URL_CHANGE_PASSWORD;
	@Value("${URL_GET_PICKLIST_VALUE_LIST}")
	private String URL_GET_PICKLIST_VALUE_LIST;

	public void changePassword(HttpServletRequest request,
			HttpServletResponse response, UserData userData) throws IOException {
		// String oldPassword=request.getParameter("oldPassword");
		// String newPassword=request.getParameter("newPassword");
		// String confirmPassword=request.getParameter("confirmPassword");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		userData.setPartyId(userSession.getPartyId());
		MD5Encryption md5Encryption = new MD5Encryption();
		String encryptrdPassword = md5Encryption.encrypt(userData
				.getOldPassword());
		userData.setOldPassword(encryptrdPassword);
		encryptrdPassword = md5Encryption.encrypt(userData.getNewPassword());
		userData.setNewPassword(encryptrdPassword);
		userData.setUserId(userSession.getUserId());
		url = URL_CHANGE_PASSWORD + userSession.getName() + "/1234?buId="
				+ userSession.getBuId();
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, userData, BaseResponse.class);
		Integer result = 0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);

	}
	
	public String login1(HttpServletRequest request,
			HttpServletResponse response, UserData userData) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		System.out.println("url....."+request.getRequestURI());
		return "redirect:/common/login.htm";

	}
	

	@SuppressWarnings("unchecked")
	public void getPicklistValues(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_PICKLIST_VALUE_LIST + "xyz/1234";
		String codeTypeIds = request.getParameter("codeTypeIds");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("codeTypeIds", codeTypeIds);
		uriCB.queryParam("buId", FiinfraConstants.AXISMFBUID);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList = br.getResponseListObject();

		Logger.logEntry(this.getClass(), "codeValueDataList:---"
				+ codeValueDataList, Logger.DEBUG, Thread.currentThread()
				.getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);
	}
	@RequestMapping(value = "/login.htm", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response) {
		
		request.getSession().setAttribute("BU_FOR_LOGIN_FAIL", "Shubhchintak");
		
		//return new ModelAndView("redirect:" + newRedirectUrl);
		System.out.println("IN LOGIN ACTION-----------------");
		ModelAndView mav = new ModelAndView("common/Login");
		
	//	mav.addObject("tagDatas", tagDatas);
		return mav;
	}
	@RequestMapping(value = "/logindfda.htm", method = RequestMethod.GET)
	public ModelAndView logindfda(HttpServletRequest request,
			HttpServletResponse response) {
		//return new ModelAndView("redirect:" + newRedirectUrl);
		System.out.println("IN LOGIN ACTION-----------------");
		
		request.getSession().setAttribute("BU_FOR_LOGIN_FAIL", "DFDA");
		
		ModelAndView mav = new ModelAndView("common/logindfda");
	//	mav.addObject("tagDatas", tagDatas);
		return mav;
	}
	
	@RequestMapping(value = "/loginessel.htm", method = RequestMethod.GET)
	public ModelAndView loginessel(HttpServletRequest request,
			HttpServletResponse response) {
		
		request.getSession().setAttribute("BU_FOR_LOGIN_FAIL", "ESSEL");
		
		//return new ModelAndView("redirect:" + newRedirectUrl);
		System.out.println("IN LOGIN ACTION-----------------");
		ModelAndView mav = new ModelAndView("common/login_essel");
		
	//	mav.addObject("tagDatas", tagDatas);
		return mav;
	}
	@RequestMapping(value = "/loginspa.htm", method = RequestMethod.GET)
	public ModelAndView loginspa(HttpServletRequest request,
			HttpServletResponse response) {
		//return new ModelAndView("redirect:" + newRedirectUrl);
		request.getSession().setAttribute("BU_FOR_LOGIN_FAIL", "SPA");
		System.out.println("IN LOGIN ACTION-----------------");
		ModelAndView mav = new ModelAndView("common/SPA/loginspa");
	//	mav.addObject("tagDatas", tagDatas);
		return mav;
	}
	@RequestMapping(value = "/loginffreedom.htm", method = RequestMethod.GET)
	public ModelAndView loginffreedom(HttpServletRequest request,
			HttpServletResponse response) {
		//return new ModelAndView("redirect:" + newRedirectUrl);
		request.getSession().setAttribute("BU_FOR_LOGIN_FAIL", "FFREEDOM");
		System.out.println("IN LOGIN ACTION-----------------");
		ModelAndView mav = new ModelAndView("common/loginffreedom");
	//	mav.addObject("tagDatas", tagDatas);
		return mav;
	}
	
	@RequestMapping(value = "/loginFail.htm", method = RequestMethod.GET)
	public ModelAndView loginFail(HttpServletRequest request,
			HttpServletResponse response) {
		//return new ModelAndView("redirect:" + newRedirectUrl);
		System.out.println("IN LOGIN ACTION-----------------");
		
		String modelKey = "common/Login";
		
		String failLoginBUKey = (String) request.getSession().getAttribute("BU_FOR_LOGIN_FAIL");
		
		if ("DFDA".equals(failLoginBUKey)) {
			modelKey = "common/logindfda";
		}
		else if ("Shubhchintak".equals(failLoginBUKey)) {
			modelKey = "common/Login";
		}
		else if("SPA".equals(failLoginBUKey))
		{
			modelKey = "common/SPA/loginspa";
		}
		else if("FFREEDOM".equals(failLoginBUKey))
		{
			modelKey = "common/loginffreedom";
		}
		else if("ESSEL".equals(failLoginBUKey))
		{
			modelKey = "common/login_essel";
		}
		
		ModelAndView mav = new ModelAndView(modelKey);
	//	mav.addObject("tagDatas", tagDatas);
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

}