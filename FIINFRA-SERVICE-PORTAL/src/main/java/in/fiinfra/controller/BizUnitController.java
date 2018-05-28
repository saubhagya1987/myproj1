package in.fiinfra.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Audit;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonParseException;

public class BizUnitController extends MultiActionController {

	private RestTemplate restTemplate;
	String url;
	private String sectionName;
	private ObjectMapper objectMapper;
	final String SOURCE_MODEULE = "BizUnit Profile";

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	public RestTemplate getRestTemplate() {
		return restTemplate;
	}

	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(BizUnitController.class);
	@Value("${URL_GET_BIZ_UNIT_LIST}")
	private String URL_GET_BIZ_UNIT_LIST;
	@Value("${URL_ADD_BIZ_UNIT_LIST}")
	private String URL_ADD_BIZ_UNIT_LIST;
	@Value("${URL_GET_VALUE_FROM_PARENTID}")
	private String URL_GET_VALUE_FROM_PARENTID;
	@Value("${URL_UPDATE_BIZ_UNIT}")
	private String URL_UPDATE_BIZ_UNIT;

	@Value("${URL_GET_BIZ_UNIT_DETAIL}")
	private String URL_GET_BIZ_UNIT_DETAIL;
	@Value("${URL_DELETE_BIZ_UNIT}")
	private String URL_DELETE_BIZ_UNIT;

	@Value("${URL_ADD_EMAIL_BIZ_UNIT}")
	private String URL_ADD_EMAIL_BIZ_UNIT;

	@Value("${URL_ADD_EMAIL_SIGN_BIZ_UNIT}")
	private String URL_ADD_EMAIL_SIGN_BIZ_UNIT;

	@Value("${URL_ADD_DIACLIAMER_SIGN_BIZ_UNIT}")
	private String URL_ADD_DIACLIAMER_SIGN_BIZ_UNIT;

	@Value("${URL_ADD_DNDTEMPLATE_BIZ_UNIT}")
	private String URL_ADD_DNDTEMPLATE_BIZ_UNIT;

	@Value("${URL_GET_WHITE_PAGE}")
	private String URL_GET_WHITE_PAGE;

	@Value("${URL_UPDATE_PARTNER_PROFILE}")
	private String URL_UPDATE_PARTNER_PROFILE;

	@Value("${LOGO_BASE_PATH}")
	private String LOGO_BASE_PATH;

	@Value("${PHOTO_BASE_PATH}")
	private String PHOTO_BASE_PATH;

	@Value("${URL_COPY_BIZ_UNIT}")
	private String URL_COPY_BIZ_UNIT;

	@Value("${URL_UNIQUE_BIZ_UNIT}")
	private String URL_UNIQUE_BIZ_UNIT;
	
	@Value("${URL_ADD_SMS}")
	private String URL_ADD_SMS;

	@Value("${URL_UPDATE_BIZ_UNIT_GENRAL}")
	private String URL_UPDATE_BIZ_UNIT_GENRAL;

		
	
	
	
	
	@RequestMapping(value = "/loadBizUnitList", method = RequestMethod.GET)
	public ModelAndView loadBizUnitList(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("Load Bizunit List ");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		ModelAndView mav = new ModelAndView("bizunit/BizUnitList");
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}

		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
		
		String userToken = null;
		if(userSession.getUserName()!=null){
			userToken = userSession.getUserName();
		}
		else{
			userToken = "abc";
		}


		try {

			
			BaseResponse<BizUnit> br = new BaseResponse<BizUnit>();
			BizUnit BizUnitVo = new BizUnit();
			BizUnitVo.setSearchText(searchTextVal); 
			
			url = URL_GET_BIZ_UNIT_LIST + userToken + "/1234";
			br = restTemplate.postForObject(url, BizUnitVo, BaseResponse.class);
			List<BizUnit> list = new ArrayList<BizUnit>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				list = br.getResponseListObject();
			//mav.addObject("UnitBiz", list);
			
			mav.addObject("UnitBiz", objectMapper.writeValueAsString(list));
			
			mav.addObject("size", pagesize);
			PrintWriter out = null;
			
			
			try {
				out = response.getWriter();
			} catch (Exception e) {
				//e.printStackTrace();
			}
		} catch (Exception e) {
			//e.printStackTrace();
		}
		return mav;
	}

	// @RequestMapping(value = "/loadwhitelabel", method = RequestMethod.GET)
	public ModelAndView loadwhitelabel(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("Load White Lable ");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		HttpSession hes = request.getSession();

		hes.setAttribute("partyId", partyId);
		ModelAndView mav = new ModelAndView("bizunit/White_Label");
		try {

			url = URL_GET_WHITE_PAGE + "ramu/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<BizUnit> br = new BaseResponse<BizUnit>();
			br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			BizUnit bizunit = new BizUnit();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				bizunit = objectMapper
						.readValue(objectMapper.writeValueAsString(br
								.getResponseObject()), BizUnit.class);
           
			hes.setAttribute("path", bizunit.getPath());
			
			if (bizunit.getDisclaimer() == null) {
				request.setAttribute("disclaimer", "");
			} else {
				request.setAttribute("disclaimer", bizunit.getDisclaimer());
			}
			/*if (	 bizunit.getPath() == null) {
				request.setAttribute("img", "");
			} else {
				request.setAttribute("img", bizunit.getDisclaimer());
			}*/

			
			
			
			if (bizunit.getTemplate() == null) {
				request.setAttribute("dndTemplate", "");
			} else {
				request.setAttribute("dndTemplate", bizunit.getTemplate());
			}
			if (bizunit.getEmailsign() == null) {
				request.setAttribute("emailsign", "");
			} else {
				request.setAttribute("emailsign", bizunit.getEmailsign());
			}
			if (bizunit.getEmailId() == null) {
				request.setAttribute("emailId11", "");
			} else {
				request.setAttribute("emailId11", bizunit.getEmailId());
			}
			if (bizunit.getCommName() == null) {
				request.setAttribute("commName11", "");
			} else {
				request.setAttribute("commName11", bizunit.getCommName());
			}
			if (bizunit.getSmsSign() == null) {
				request.setAttribute("smsSign11", "");
			} else {
				request.setAttribute("smsSign11", bizunit.getSmsSign());
			}
		///   File  fileName = null;  
			String path;
			path=bizunit.getPath();
		 /*   String  extension = null;  
		      fileName = originalFileName.substring(0,originalFileName.lastIndexOf("."));  
		      
		    extension = bizunit.getPath().substring(bizunit.getPath().lastIndexOf("."));
		      String[] s = extension.split(".");
		      if(s[0].equalsIgnoreCase(""))
		      {
		        path=null; 
		      }
		    if(extension.length()>1)
		    {
		    	
		    }
		    else
		    {
		    	path=null;
		    }*/
			
		    request.setAttribute("path",path);
				
			
			
			//String path=bizunit.getPath();
			
		//	mav.addObject("path", path);
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception e) {
				//e.printStackTrace();
			}
		} catch (Exception e) {
			//e.printStackTrace();
		}

		return mav;
	}
	// @RequestMapping(value ="/loadFaqLists", method = RequestMethod.GET)
	public ModelAndView loadviewprofile(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("Load General Page ");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int partyId = Integer.parseInt(request.getParameter("partyId"));
		HttpSession hes = request.getSession();
		hes.setAttribute("partyId", partyId);
		int buId = 1245;
		ModelAndView mav = new ModelAndView("bizunit/ViewUnitProfile");
		try {
			url = URL_GET_BIZ_UNIT_DETAIL + userSession.getUserName() + "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			BaseResponse<BizUnit> br = new BaseResponse<BizUnit>();
			br = restTemplate.getForObject(
					FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			BizUnit bizUnit = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				bizUnit = objectMapper
						.readValue(objectMapper.writeValueAsString(br
								.getResponseObject()), BizUnit.class);
			request.setAttribute("disBizName", bizUnit.getLastName());
			
			hes.setAttribute("nameBizUnit", bizUnit.getLastName());
			
			

			if (bizUnit.getShortName() == null) {
				request.setAttribute("disShortName", "");
			} else {
				request.setAttribute("disShortName", bizUnit.getShortName());
			}

			if (bizUnit.getCompanyName() == null) {
				request.setAttribute("disCompanyName", "");
			} else {
				request.setAttribute("disCompanyName", bizUnit.getCompanyName());
			}

			request.setAttribute("disAdd1", bizUnit.getStreet());

			if (bizUnit.getStreet2() == null) {
				request.setAttribute("disAdd2", "");
			} else {
				request.setAttribute("disAdd2", bizUnit.getStreet2());
			}

			if (bizUnit.getStreet3() == null) {
				request.setAttribute("disAdd3", "");
			} else {
				request.setAttribute("disAdd3", bizUnit.getStreet3());
			}
   
			if(bizUnit.getCountry()==null)
			{

				request.setAttribute("disCountry",null);
				request.setAttribute("disCountryId", null);
			}
			else
			{
				request.setAttribute("disCountry", bizUnit.getCountry());
				request.setAttribute("disCountryId", bizUnit.getCountryId());
			}
			
			if(bizUnit.getState()==null)
			{
				request.setAttribute("disStateId",null);
				request.setAttribute("disState", null);	
			}
			else
			{
				request.setAttribute("disStateId", bizUnit.getStateId());
				request.setAttribute("disState", bizUnit.getState());
			}
			
			if(bizUnit.getCityId()==null)
			{
				request.setAttribute("disCity", null);
				request.setAttribute("disCityId", null);
			}
			else
			{
				request.setAttribute("disCity", bizUnit.getCity());
				request.setAttribute("disCityId", bizUnit.getCityId());	
			}
			
			if(bizUnit.getEmailids()==null)
			{
				request.setAttribute("disEmail", "");
			}
			else
			{
				request.setAttribute("disEmail",bizUnit.getEmailids());
			}
			
			if(bizUnit.getContact()==null)
			{
				request.setAttribute("disContact", "");
			}
			else
			{
				request.setAttribute("disContact",bizUnit.getContact());
			}

			if(bizUnit.getTwitter()==null)
			{
				request.setAttribute("distwitter", "");
			}
			else
			{
				request.setAttribute("distwitter",bizUnit.getTwitter());
			}
			
			
			
			
			
			
			request.setAttribute("disZip", bizUnit.getZipCode());
			request.setAttribute("disPartyId", bizUnit.getPartyId());
				
			mav.addObject("cityId",bizUnit.getCityId());
			mav.addObject("stateId",bizUnit.getStateId());
			return mav;

		} catch (Exception e) {
			//e.printStackTrace();
		}
		return mav;

	}

	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getValueFromParentId", method = RequestMethod.GET)
	public void getValueFromParentId(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		logger.info("Get code  value from  parent Id ");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_GET_VALUE_FROM_PARENTID + userSession.getUserName() + "/1234";
		String codeTypeIds = request.getParameter("parentId");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("parentId", codeTypeIds);
		//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<BizUnit> br = new BaseResponse<BizUnit>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<BizUnit> codeValueDataList = new ArrayList<BizUnit>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList = br.getResponseListObject();

		//Logger.logEntry(this.getClass(), "codeValueDataList:---"				+ codeValueDataList, Logger.DEBUG, Thread.currentThread()	.getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);
	}

	@SuppressWarnings("unchecked")
	// @RequestMapping(value ="/addbizunit", method = RequestMethod.GET)
	public void addBizUnit(HttpServletRequest request,			HttpServletResponse response ,BizUnit bizUnit) throws Exception {
		logger.info("Add Biz Unit");
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String address2=bizUnit.getStreet2();
	    String address3=bizUnit.getStreet3();
	    
	    if(address2=="" ||address2==null)
	    {
	    	address2="";
	    }
	    if(address3=="" ||address3==null)
	    {
	    	address3="";
	    }
	    
	    String editttwitter=bizUnit.getTwitter();
	    if(editttwitter==""||editttwitter==null)
	    {
	    	editttwitter="";
	    }
		String OBJECT_STRING ="bizUnitName="+ bizUnit.getLastName() +",shortName="+bizUnit.getShortName() +",companyName="+bizUnit.getCompanyName()+",address="+ bizUnit.getStreet() + address2 + address3 +",countryId="+bizUnit.getCountryId() +",stateId="+bizUnit.getStateId()+",cityId="+ bizUnit.getCityId() +",zipCode="+bizUnit.getZipCode() +",editttwitter="+editttwitter;
		//OBJECT_STRING ="bizUnitName="+ bizUnitName +",shortName="+shortName +",companyName="+companyName+",address="+ address1 + address2 + address3 +",countryId="+countryId +",stateId="+stateId+",cityId="+ cityId +",zipCode="+zipCode +",addttwitter="+addttwitter;
		url = URL_ADD_BIZ_UNIT_LIST + userSession.getUserName() + "/1234";
		/*BizUnit bizUnit = new BizUnit();
		bizUnit.setLastName(bizUnitName);
		bizUnit.setShortName(shortName);
		bizUnit.setCompanyName(companyName);
		bizUnit.setStreet(address1);
		bizUnit.setStreet2(address2);
		bizUnit.setStreet3(address3);
		bizUnit.setCountryId(countryId);
		bizUnit.setStateId(stateId);
		bizUnit.setCityId(cityId);
		bizUnit.setZipCode(String.valueOf(zipCode));
		
		bizUnit.setTwitter(addttwitter);
*/
		bizUnit.setCreatedBy(userSession.getUserId());
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, bizUnit, BaseResponse.class);
		Integer codeValueDataList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList = br.getResponseObject();
		//Logger.logEntry(this.getClass(), "codeValueDataList:---"				+ codeValueDataList, Logger.DEBUG, Thread.currentThread()				.getStackTrace()[1].getMethodName());
		
		
		if(codeValueDataList==1)
		{
		
			FiinfraUtility.doAudit(userSession.getPartyId(),
					userSession.getUserId(),
					FiinfraConstants.SRP_ADD_BIZUNIT_EVENT_ID,
					FiinfraConstants.SERVICE_PORTAL,
					FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,
					FiinfraConstants.SRP_ADD_BIZUNIT,
					"SP="+FiinfraConstants.SP_ADD_BIZ_UNIT,
					OBJECT_STRING
					);
		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);
	}

	public void updateBizUnit(HttpServletRequest request,	HttpServletResponse response, BizUnit bizUnit) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		String address2=bizUnit.getStreet2();
	    String address3=bizUnit.getStreet3();
	    
	    if(address2=="" ||address2==null)
	    {
	    	address2="";
	    }
	    if(address3=="" ||address3==null)
	    {
	    	address3="";
	    }
	    
	    String editttwitter=bizUnit.getTwitter();
	    if(editttwitter==""||editttwitter==null)
	    {
	    	editttwitter="";
	    }
		String OBJECT_STRING ="PartyId="+bizUnit.getPartyId()+",bizUnitName="+ bizUnit.getLastName() +",shortName="+bizUnit.getShortName() +",companyName="+bizUnit.getCompanyName()+",address="+ bizUnit.getStreet() + address2 + address3 +",countryId="+bizUnit.getCountryId() +",stateId="+bizUnit.getStateId()+",cityId="+ bizUnit.getCityId() +",zipCode="+bizUnit.getZipCode() +",editttwitter="+editttwitter;
		/*int partyId = Integer.parseInt(request.getParameter("partyId"));
		String bizUnitName = request.getParameter("editBizUnitName");
		String shortName = request.getParameter("editShortName");
		String companyName = request.getParameter("editCompanyName");
		String address1 = request.getParameter("editAddress1");
		String address2 = request.getParameter("editAddress2");
		String address3 = request.getParameter("editAddress3");
		int countryId = Integer.parseInt(request.getParameter("editCountry"));
		int stateId = Integer.parseInt(request.getParameter("editState"));
		int cityId = Integer.parseInt(request.getParameter("editCity"));
		int zipCode = Integer.parseInt(request.getParameter("editZipCode"));
		
		String editttwitter = request.getParameter("edittwitter");
		String OBJECT_STRING ="bizUnitName="+ bizUnitName +",shortName="+shortName +",companyName="+companyName+",address="+ address1 + address2 + address3 +",countryId="+countryId +",stateId="+stateId+",cityId="+ cityId +",zipCode="+zipCode +",editttwitter="+editttwitter;
		BizUnit bizUnit = new BizUnit();
		bizUnit.setPartyId(partyId);
		bizUnit.setLastName(bizUnitName);
		bizUnit.setShortName(shortName);
		bizUnit.setCompanyName(companyName);
		bizUnit.setStreet(address1);
		bizUnit.setStreet2(address2);
		bizUnit.setStreet3(address3);
		bizUnit.setCountryId(countryId);
		bizUnit.setStreet(address1);
		bizUnit.setStateId(stateId);
		bizUnit.setCityId(cityId);
		bizUnit.setZipCode(String.valueOf(zipCode));
		
		bizUnit.setTwitter(editttwitter); */
		bizUnit.setCreatedBy(userSession.getUserId());
		url = URL_UPDATE_BIZ_UNIT + "ramu/1234";

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, bizUnit, BaseResponse.class);
		Integer codeValueDataList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList = br.getResponseObject();

		//Logger.logEntry(this.getClass(), "codeValueDataList:---"				+ codeValueDataList, Logger.DEBUG, Thread.currentThread()				.getStackTrace()[1].getMethodName());
		
		if(codeValueDataList==1)
		{
		FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_UPDATE_BIZUNIT_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_UPDATE_BIZUNIT,"SP="+FiinfraConstants.SP_UPDATE_BIZ_UNIT,OBJECT_STRING);
		}
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);

	}

	
	
	public void updateBizUnitGeneral(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		String bizUnitName = request.getParameter("editBizUnitName");
		String shortName = request.getParameter("editShortName");
		String companyName = request.getParameter("editCompanyName");
		String address1 = request.getParameter("editAddress1");
		String address2 = request.getParameter("editAddress2");
		String address3 = request.getParameter("editAddress3");
		int countryId = Integer.parseInt(request.getParameter("editCountry"));
		int stateId = Integer.parseInt(request.getParameter("editState"));
		int cityId = Integer.parseInt(request.getParameter("editCity"));
		int zipCode = Integer.parseInt(request.getParameter("editZipCode"));
		String contactNo=request.getParameter("contactno");
		String emailId = request.getParameter("emailid");
		String twitter = request.getParameter("twitter");
		
		String OBJECT_STRING ="bizUnitName="+ bizUnitName +",shortName="+shortName +",companyName="+companyName+",address="+ address1 + address2 + address3 +",countryId="+countryId +",stateId="+stateId+",cityId="+ cityId +",zipCode="+(String.valueOf(zipCode))+",contactNo="+ contactNo+",emailId="+emailId +",twitter="+twitter;
		BizUnit bizUnit = new BizUnit();
		bizUnit.setPartyId(partyId);
		bizUnit.setLastName(bizUnitName);
		bizUnit.setShortName(shortName);
		bizUnit.setCompanyName(companyName);
		bizUnit.setStreet(address1);
		bizUnit.setStreet2(address2);
		bizUnit.setStreet3(address3);
		bizUnit.setCountryId(countryId);
		bizUnit.setStreet(address1);
		bizUnit.setStateId(stateId);
		bizUnit.setCityId(cityId);
		bizUnit.setZipCode(String.valueOf(zipCode));
		bizUnit.setCreatedBy(userSession.getUserId());
		bizUnit.setEmailId(emailId);
		bizUnit.setContact(contactNo);
		bizUnit.setTwitter(twitter);
		url = URL_UPDATE_BIZ_UNIT_GENRAL + "ramu/1234";

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread			.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, bizUnit, BaseResponse.class);
		Integer codeValueDataList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList = br.getResponseObject();

		if(codeValueDataList==1)
		{
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_UPDATE_BIZUNIT_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_UPDATE_BIZUNIT,"SP="+FiinfraConstants.SP_GET_BIZ_UNIT_DETAIL,OBJECT_STRING);
		}
		
		//Logger.logEntry(this.getClass(), "codeValueDataList:---"				+ codeValueDataList, Logger.DEBUG, Thread.currentThread()				.getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);

	}

	
	
	
	
	
	
	
	
	
	
	public void getBizUnitDetail(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		logger.info("Get biz unit detail");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		url = URL_GET_BIZ_UNIT_DETAIL + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		BaseResponse<BizUnit> br = new BaseResponse<BizUnit>();
		br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class);
		BizUnit list = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			list = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					BizUnit.class);

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, list);

	}

	public void deleteBizUnit(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		logger.info("In Delete biz unit");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String list = request.getParameter("Lists");
		url = URL_DELETE_BIZ_UNIT + userSession.getUserName() + "/1234";
			
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("Lists", list);
		uriCB.queryParam("createdBy", userSession.getUserId());

		String OBJECT_STRING ="list="+ list +",createdBy="+userSession.getUserId() ;

		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),	BaseResponse.class).getBody();
		Integer codeValueDataList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList = br.getResponseObject();

		

		FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_DELETE_BIZUNIT_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_DELETE_BIZUNIT,"SP="+FiinfraConstants.SP_DELETE_BIZ_UNIT,OBJECT_STRING);

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);

	}

	public void addEmail(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		logger.info("In Add email");
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		String email = request.getParameter("email");
		String emailName = request.getParameter("emailName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		BizUnit bizUnit = new BizUnit();
		bizUnit.setPartyId(partyId);
		bizUnit.setEmailId(email);
		bizUnit.setEmailsign(emailName);
		bizUnit.setCreatedBy(userSession.getUserId());
		String list = request.getParameter("Lists");
		String OBJECT_STRING ="partyId="+ partyId +"Email ID"+email+",emailName="+emailName +",CreatedBy="+userSession.getUserId();
		
		url = URL_ADD_EMAIL_BIZ_UNIT + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, bizUnit, BaseResponse.class);

		Integer count = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			count = br.getResponseObject();

		
		
		if(count==1)
		{
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_BU_EMAIL_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_ADD_BU_EMAIL,"SP="+FiinfraConstants.SP_ADD_EMAIL_BIZ_UNIT,OBJECT_STRING);
		}
		
		
		//Logger.logEntry(this.getClass(), "codeValueDataList:---" + count,				Logger.DEBUG,				Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, count);
	}

	public void addDndTemplate(HttpServletRequest request,
			HttpServletResponse response,BizUnit bizUnit) throws IOException {
		logger.info("In Add DndTemplate");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
	
		bizUnit.setCreatedBy(userSession.getUserId());
		
		
		
		String OBJECT_STRING ="PartyID="+bizUnit.getPartyId()+",Template="+bizUnit.getTemplate()+",CreatedBy="+userSession.getUserId();
		url = URL_ADD_DNDTEMPLATE_BIZ_UNIT + "ramu/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, bizUnit, BaseResponse.class);
		Integer count = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			count = br.getResponseObject();
		//Logger.logEntry(this.getClass(), "codeValueDataList:---" + count,				Logger.DEBUG,				Thread.currentThread().getStackTrace()[1].getMethodName());
		if(count==1)
		{
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_BU_DNDTEMPLATE_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_ADD_BU_DNDTEMPLATE,"SP="+FiinfraConstants.SP_ADD_DISCLIAMER_BIZ_UNIT,OBJECT_STRING);
		}
		
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, count);

	}

	
	
	
	public void addDetail(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		logger.info("In Add SMSSIGN");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		String smssign = request.getParameter("smssign");
		Integer themes =Integer.parseInt(request.getParameter("themes"));
		  
		
		BizUnit bizUnit = new BizUnit();
		bizUnit.setPartyId(partyId);
		bizUnit.setSmsSign(smssign);
		bizUnit.setTheme(themes);
		bizUnit.setCreatedBy(userSession.getUserId());
		
		String OBJECT_STRING ="smssign="+smssign+"themes="+themes+"CreatedBy ="+userSession.getUserId();
		
		String list = request.getParameter("Lists");
		url = URL_ADD_SMS + userSession.getUserName()
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread			.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, bizUnit, BaseResponse.class);
		Integer count = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			count = br.getResponseObject();
	
		if(count==1)
		{
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_BU_SMS_BULOGO_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_ADD_BU_SMS_BULOGO,OBJECT_STRING);
		}
		
		
		//Logger.logEntry(this.getClass(), "codeValueDataList:---" + count,				Logger.DEBUG,				Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, count);
	}
	
	
	public void addDisclaimer(HttpServletRequest request,
			HttpServletResponse response,BizUnit bizUnit) throws IOException {
		logger.info("In Add Disclaimer");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
	//	int partyId = Integer.parseInt(request.getParameter("partyId"));
/*		String disclaimer = request.getParameter("disclaimer");

	*/
		bizUnit.setCreatedBy(userSession.getUserId());	
	/*	BizUnit bizUnit = new BizUnit();
		bizUnit.setPartyId(partyId);
		bizUnit.setDisclaimer(disclaimer);
	
		String list = request.getParameter("Lists");*/
		url = URL_ADD_DIACLIAMER_SIGN_BIZ_UNIT + userSession.getUserName()
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, bizUnit, BaseResponse.class);
		Integer count = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			count = br.getResponseObject();
		
		
		String OBJECT_STRING ="partyId="+bizUnit.getPartyId()+",Disclaimer="+bizUnit.getDisclaimer()+",createdBy="+bizUnit.getCreatedBy()+",Attribute Value="+FiinfraConstants.ATTRIBUTE_CODE_VALUE_EMAILSIGN_ID +",Data Type ID="+FiinfraConstants.DATA_TYPE_ID+",Display Sequence"+FiinfraConstants.DISPLAY_SEQ;
		

		
		if(count==1)
		{
			
			//FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_BU_EMAIL_SIGNATURE_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_ADD_BU_EMAIL_SIGNATURE,"SP="+FiinfraConstants.SP_ADD_EMAIL_SIGN_BIZ_UNIT,OBJECT_STRING);
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_BU_DISCLAIMER_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_ADD_BU_DISCLAIMER,"SP="+FiinfraConstants.SP_ADD_DISCLIAMER_BIZ_UNIT,OBJECT_STRING);
		}
		
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, count);
	}

	public void addEmailSign(HttpServletRequest request,
			HttpServletResponse response,BizUnit bizUnit) throws IOException {
		logger.info("In email Sign");
		/*int partyId = Integer.parseInt(request.getParameter("partyId"));
		String emailSign = request.getParameter("emaliSign");
		*/
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String list = request.getParameter("Lists");
/*
		BizUnit bizUnit = new BizUnit();
		bizUnit.setEmailsign(emailSign);
		bizUnit.setPartyId(partyId);*/
		bizUnit.setCreatedBy(userSession.getUserId());
		url = URL_ADD_EMAIL_SIGN_BIZ_UNIT + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, bizUnit, BaseResponse.class);
		Integer count = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			count = br.getResponseObject();
		String OBJECT_STRING ="partyId="+bizUnit.getPartyId()+",emailSign="+bizUnit.getEmailsign()+",createdBy="+bizUnit.getCreatedBy()+",Attribute Value="+FiinfraConstants.ATTRIBUTE_CODE_VALUE_EMAILSIGN_ID +",Data Type ID="+FiinfraConstants.DATA_TYPE_ID+",Display Sequence"+FiinfraConstants.DISPLAY_SEQ;
		
		
		if(count==1)
		{
			
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_BU_EMAIL_SIGNATURE_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_ADD_BU_EMAIL_SIGNATURE,"SP="+FiinfraConstants.SP_ADD_EMAIL_SIGN_BIZ_UNIT,OBJECT_STRING);
		}
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, count);
	}

	
	
	
	public void getUniqueBizUnit(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String bizUnitName = request.getParameter("addBizName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UNIQUE_BIZ_UNIT + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	uriCB.queryParam("bizUnitName", bizUnitName);
		//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		Integer codeValueDataList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList = br.getResponseObject();
		//Logger.logEntry(this.getClass(), "codeValueDataList:---"				+ codeValueDataList, Logger.DEBUG, Thread.currentThread()				.getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);
	}
	public void copyBu(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		int partyId = Integer.parseInt(request.getParameter("partyId"));
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_COPY_BIZ_UNIT + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BizUnit bizUnit = new BizUnit();
		bizUnit.setPartyId(partyId);
		bizUnit.setCreatedBy(userSession.getUserId());
		//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread				.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, bizUnit, BaseResponse.class);
		Integer codeValueDataList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))codeValueDataList = br.getResponseObject();
		
		FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_COPY_BIZUNIT_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_COPY_BIZUNIT);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);
	}

	@SuppressWarnings({ "unchecked", "unused" })
	public ModelAndView addOtherDetail(HttpServletRequest request,
			HttpServletResponse response, ProfileData profileData)
			throws Exception {
		sectionName = request.getParameter("sectionName");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_PARTNER_PROFILE + "ramu/1234";
		logger.info("URL --> " + url);
		String result = FiinfraConstants.SUCCESS;

		int buId = Integer.parseInt(request.getParameter("partyId"));
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		int lastModifiedBy = userSession.getUserId();
		long currentTime = new Date().getTime();
		int recordCount = 0;
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		DocumentData documentData = new DocumentData();
		MultipartFile[] m = { profileData.getImage() };
		if (profileData.getImage() != null)
			documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(m, currentTime, lastModifiedBy);
		if (documentDatas == null) {
			result = "Attachment size greater than "
					+ FiinfraConstants.MAX_FILE_SIZE + " kb is not allowed.";
		} else {

			if (documentDatas.size() > 0)
				documentData = documentDatas.get(0);
			profileData.setPartyId(partyId);
			profileData.setBuId(buId);
			profileData.setSectionName(sectionName);
			profileData.setLastModifiedBy(lastModifiedBy);
			profileData.setDocumentData(documentData);
			if (documentDatas.size() > 0)
				profileData.setAttachment(true);
			profileData.setAttachmentCount(documentDatas.size());
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.postForObject(url, profileData,
					BaseResponse.class);
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				recordCount = objectMapper
						.readValue(objectMapper.writeValueAsString(br
								.getResponseObject()), Integer.class);
		}
		String basePath = "";
		if (sectionName.equals(FiinfraConstants.PROFILE_PERSONAL_INFO_1))
			basePath = PHOTO_BASE_PATH + partyId;
		else
			basePath = LOGO_BASE_PATH + partyId;
		if (documentDatas.size() > 0) {
			File baseFolder = new File(basePath);
	/*		if (baseFolder.exists()) {
				FileUtils.deleteDirectory(baseFolder);
			}*/
			result = FiinfraUtility.uploadAttachments(m, basePath, currentTime);
			for (MultipartFile f : m) {
				if (f.getOriginalFilename() != null
						&& !f.getOriginalFilename().equals("")) {
					String fileName = null;
					String extension = null;
					fileName = f.getOriginalFilename().substring(0,
							f.getOriginalFilename().lastIndexOf("."));
					extension = f.getOriginalFilename().substring(
							f.getOriginalFilename().lastIndexOf("."));

					fileName = fileName + "_" + currentTime + extension;
					if (sectionName
							.equals(FiinfraConstants.PROFILE_PERSONAL_INFO_1)) {
						String filePath = "/user-images/" + partyId + "\\"
								+ fileName;
						userSession.setPhoto(filePath);
					} else {
						String filePath = "/logo-images/" + partyId + "\\"
								+ fileName;

						userSession.setLogo(filePath);
					}
					request.setAttribute("userSession", userSession);
				}
			}
		}
		List<String> responseList = new ArrayList<>();
		responseList.add(result);
		if (result.equals(FiinfraConstants.SUCCESS)) {
			if (documentDatas.size() > 0) {
				if (sectionName
						.equals(FiinfraConstants.PROFILE_PERSONAL_INFO_1))
					responseList.add("/user-images/" + partyId + "/"
							+ documentData.getFileName());
				else
					responseList.add("/logo-images/" + partyId + "/"
							+ documentData.getFileName());
			}
		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(lastModifiedBy);
		audit.setEventID(FiinfraConstants.SRP_ADD_BU_SMS_BULOGO_EVENT_ID);
		audit.setSourceSystemID(FiinfraConstants.SERVICE_PORTAL);
		audit.setSourceModule(FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT);
		audit.setSourceScreen(FiinfraConstants.SRP_ADD_BU_EMAIL_SIGNATURE);
		FrameworkUtil.audit(audit);
		//objectMapper.writeValue(out, responseList);
		
		
		String s = "/";  
	
			return new ModelAndView("redirect:"+s+"bizunit/loadwhitelabel.htm?partyId="+partyId);	
				
		
		
	}

	public void bizunitExcel(HttpServletRequest request,
			HttpServletResponse response) {
	//	logger.info("IN emport in excel for biz unit");
	//	logger.info("In export bizunit csv");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		ModelAndView mav = new ModelAndView("bizunit/BizUnitList");
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}

		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
		
		String userToken = null;
		if(userSession.getUserName()!=null){
			userToken = userSession.getUserName();
		}
		else{
			userToken = "abc";
		}


		try {
				BaseResponse<BizUnit> baseResponse = new BaseResponse<BizUnit>();
			BizUnit BizUnitVo = new BizUnit();
			BizUnitVo.setSearchText(searchTextVal); 
			
			url = URL_GET_BIZ_UNIT_LIST + userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, BizUnitVo, BaseResponse.class);

			List<BizUnit> faqListAsJson = new ArrayList<BizUnit>();
			List<BizUnit> faqList = new ArrayList<BizUnit>();

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					faqListAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < faqListAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						BizUnit faqList2;
						faqList2 = objectMapper.readValue(objectMapper
								.writeValueAsString(faqListAsJson.get(i)),
								BizUnit.class);

						faqList.add(faqList2);
					}

				} catch (JsonParseException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				} catch (JsonGenerationException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				}
			}

			response.addHeader("Content-Disposition",
					"attachment;filename=BizUnit.xls");

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Biz Unit "));
			writer.print("\t");
			writer.print(CommonUtils.escape("Company Name"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Short Name   "));
			writer.print("\t");
			writer.print(CommonUtils.escape("Common Email Id"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Common Name   "));
			writer.print("\t");
			writer.print(CommonUtils.escape("Updated on"));
			/*
			 * writer.print(","); writer.print(CommonUtils.escape("STATUS"));
			 */

			writer.println();
			for (BizUnit list : faqList) {

				// lastName

				writer.print(CommonUtils.escape(list.getLastName()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getCompanyName()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getShortName()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getEmailId()));
				writer.print("\t");
				writer.print(CommonUtils.escape("" + list.getCommName()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getUpdateon()));
				writer.println();
				/*
				 * writer.print(CommonUtils.escape(task.getStatusName()));
				 * writer.println();
				 */
			}

		} catch (IOException e) {
			//e.printStackTrace();
		}
	}

		

	public void bizunitCSV(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("In export bizunit csv");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		ModelAndView mav = new ModelAndView("bizunit/BizUnitList");
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}

		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
		
		String userToken = null;
		if(userSession.getUserName()!=null){
			userToken = userSession.getUserName();
		}
		else{
			userToken = "abc";
		}


		try {
				BaseResponse<BizUnit> baseResponse = new BaseResponse<BizUnit>();
			BizUnit BizUnitVo = new BizUnit();
			BizUnitVo.setSearchText(searchTextVal); 
			
			url = URL_GET_BIZ_UNIT_LIST + userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, BizUnitVo, BaseResponse.class);

			List<BizUnit> faqListAsJson = new ArrayList<BizUnit>();
			List<BizUnit> faqList = new ArrayList<BizUnit>();

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					faqListAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < faqListAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						BizUnit faqList2;
						faqList2 = objectMapper.readValue(objectMapper
								.writeValueAsString(faqListAsJson.get(i)),
								BizUnit.class);

						faqList.add(faqList2);
					}

				} catch (JsonParseException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				} catch (JsonGenerationException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				}
			}

			response.addHeader("Content-Disposition",
					"attachment;filename=BizUnit.csv");

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Biz Unit "));
			writer.print(",");
			writer.print(CommonUtils.escape("Company Name "));
			writer.print(",");
			writer.print(CommonUtils.escape("Short Name   "));
			writer.print(",");
			writer.print(CommonUtils.escape("Common Email Id"));
			writer.print(",");
			writer.print(CommonUtils.escape("Common Name   "));
			writer.print(",");
			writer.print(CommonUtils.escape("Updated on"));
			/*
			 * writer.print(","); writer.print(CommonUtils.escape("STATUS"));
			 */

			writer.println();
			for (BizUnit list : faqList) {

				// lastName

				writer.print(CommonUtils.escape(list.getLastName()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getCompanyName()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getShortName()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getEmailId()));
				writer.print(",");
				writer.print(CommonUtils.escape("" + list.getCommName()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getUpdateon()));
				writer.println();
				/*
				 * writer.print(CommonUtils.escape(task.getStatusName()));
				 * writer.println();
				 */
			}

		} catch (IOException e) {
			//e.printStackTrace();
		}
	}

}
