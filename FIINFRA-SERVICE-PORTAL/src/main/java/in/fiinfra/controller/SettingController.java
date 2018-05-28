package in.fiinfra.controller;

import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.Setting;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.support.incrementer.H2SequenceMaxValueIncrementer;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;


public class SettingController extends MultiActionController
{
	String url;
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(SettingController.class);
	
	
	
	
	@Value("${URL_LIST_BIZ_UNIT_SETTING}")
	private String URL_LIST_BIZ_UNIT_SETTING;
	
	
		@Value("${URL_UPDATE_BIZ_UNIT_SETTING}")
	private String URL_UPDATE_BIZ_UNIT_SETTING;
	
			@Value("${URL_ADD_BIZ_UNIT_SETTING}")
	private String URL_ADD_BIZ_UNIT_SETTING;
	
	
			@Value("${URL_DELETE_BIZ_UNIT_SETTING}")
	private String URL_DELETE_BIZ_UNIT_SETTING;
	
			@Value("${URL_GET_BIZ_UNIT_SETTING_DETAIL}")
	private String URL_GET_BIZ_UNIT_SETTING_DETAIL;
			
			@Value("${URL_GET_ADVICE_ASSUMPTIONS}")
	private String URL_GET_ADVICE_ASSUMPTIONS;

			

			@Value("${URL_SAVE_ADVICE_ASSUMPTIONS}")
	private String URL_SAVE_ADVICE_ASSUMPTIONS;
			
			@Value("${URL_GET_UNIQUE_SETTING}")
			private String 	URL_GET_UNIQUE_SETTING;
					
					
			
			
			
	
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
	
	


	//@RequestMapping(value ="/loadprofile_setting.htm", method = RequestMethod.GET)
	public ModelAndView loadprofile_setting(HttpServletRequest request,HttpServletResponse response)
	{
		
		logger.info("In bizunit setting");
		String roleId;
		String loggedInUserPartyId;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int partyId=Integer.parseInt(request.getParameter("partyId"));
		HttpSession hes=request.getSession();
		hes.setAttribute("partyId", partyId);
		request.setAttribute("partyId",partyId );
		int buId=1245;
		ModelAndView mav = new ModelAndView("bizunit/ViewProfile_Setting");
		
	
			try {
				url = URL_LIST_BIZ_UNIT_SETTING+"ramu"+"/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				
				BaseResponse<Setting> br = new BaseResponse<Setting>();
				uriCB.queryParam("partyId", partyId);
				br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				List<Setting> list = new ArrayList<Setting>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					list=br.getResponseListObject();
				//mav.addObject("SettingList", list);
				
				mav.addObject("SettingList", objectMapper.writeValueAsString(list));
				
				PrintWriter out= null; 
				try {
					out = response.getWriter();
				} catch (Exception e) {
					// // e.printStackTrace();
				}
			} catch (Exception e) {
				// e.printStackTrace();
			}
				
				
				return mav;
						
	}
	
	
	
	
	
	
	public void deleteBizUnitSetting(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		
		

	      logger.info("In delete vizunit setting");
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			String list=request.getParameter("Lists");
			url = URL_DELETE_BIZ_UNIT_SETTING + userSession.getUserName()+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("Lists", list);
			uriCB.queryParam("createdBy", userSession.getUserId());
		//	Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			//br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			Integer codeValueDataList=null;
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				 codeValueDataList= br.getResponseObject();
		
				FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_DELETE_BU_SETTING_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_FAQ,FiinfraConstants.SRP_DELETE_BU_SETTING);
		
			
				
				
			//Logger.logEntry(this.getClass(), "codeValueDataList:---"+ codeValueDataList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, codeValueDataList);
 		
	}
	
	
	
	@SuppressWarnings("unchecked")
	public void addBizSetting(HttpServletRequest request,HttpServletResponse response,Setting setting) throws Exception {
		logger.info("in add bizunit setting");
		
/*
	   Integer	partyId=Integer.parseInt(request.getParameter("partyId"));
	   
	  Integer	addAssumeType=Integer.parseInt(request.getParameter("addAssumeType"));
	Integer 	addCodeValueId=Integer.parseInt(request.getParameter("addCodeValueId"));
	Integer	addDataTypeValue=Integer.parseInt(request.getParameter("addDataTypeValue"));
	String	addCodeValue=request.getParameter("addCodeValue");
	Integer	addDataType=Integer.parseInt(request.getParameter("addDataType"));
 
	String	addRangeStart1=request.getParameter("addRangeStart");
	String addRangeEnd1=request.getParameter("addRangeEnd");
	Integer addRangeStart=null;
	
	if(addRangeStart1=="")
	{
		addRangeStart1=null;
	}
	if(addRangeEnd1=="")
	{
		addRangeEnd1=null;
	}
	Integer	addRangeEnd=null;
	if(addRangeStart1==null)
	{
		addRangeStart=null;
	}
	else
	{
		addRangeStart=Integer.parseInt(addRangeStart1);	
	}
	if(addRangeEnd1==null)
	{
		addRangeEnd=null;
	}
	else
	{
		addRangeEnd=Integer.parseInt(addRangeEnd1);	
	}*/
 /// addRangeStart=Integer.parseInt(request.getParameter("addRangeStart"));
  
  
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
		url = URL_ADD_BIZ_UNIT_SETTING + "ramu/1234";

			
		
	/*	Setting setting=new Setting();
		
		setting.setPartyId(partyId);
		 setting.setSettingType(addAssumeType);
		setting.setAttributeCodeId(addCodeValueId);
		 setting.setAttributeValue(addCodeValue);
		 setting.setDefaultValue(addDataTypeValue);
		 setting.setDataTypeId(addDataType);
		 setting.setStartRange(addRangeStart);
		 setting.setEndRange(addRangeEnd);*/
		//Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<>();
		br = restTemplate.postForObject(url, setting, BaseResponse.class);
		Integer recordCount=0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = br.getResponseObject();
		
		if(recordCount==1)
		{
		//	FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants. SRP_ADD_BU_SETTING_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_ADD_BU_SETTING);
		
		}


		
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);
	}

	
	

	

	public void getSettingDetail(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		
		
		logger.info("In getsetting detail");
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			int partyId=Integer.parseInt(request.getParameter("partyId"));
			int partySettingId=Integer.parseInt(request.getParameter("partySettingId"));
			url = URL_GET_BIZ_UNIT_SETTING_DETAIL + userSession.getUserName()+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyId);
			uriCB.queryParam("partySettingId", partySettingId);
		//	Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Setting> br = new BaseResponse<Setting>();
			br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			Setting codeValueDataList=null;
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				 codeValueDataList= objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Setting.class);
		//	Logger.logEntry(this.getClass(), "codeValueDataList:---"+ codeValueDataList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, codeValueDataList);
			

 		
	}
	@SuppressWarnings("unchecked")
	public void updateBizSetting(HttpServletRequest request,HttpServletResponse response, Setting setting) throws Exception {
		logger.info("in update biz setting");
	
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_UPDATE_BIZ_UNIT_SETTING + userSession.getUserName()+ "/1234";
		//Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<>();
		setting.setCreatedby(userSession.getUserId());
		br = restTemplate.postForObject(url, setting, BaseResponse.class);
		Integer recordCount=0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount= objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Integer.class);	
		
		if(recordCount==1)
		{
			

			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_EDIT_BU_SETTING_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_BIZUNIT,FiinfraConstants.SRP_UPDATE_BU_SETTING);
			  	
			
		}
		
		PrintWriter out = null;
		out = response.getWriter();
		
		
		
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);/*eDataList);*/
	}
	public void saveAdviceAssumption(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_SAVE_ADVICE_ASSUMPTIONS+"/1234?buId="+userSession.getBuId();
		int partyId=Integer.parseInt(request.getParameter("partyId"));
		request.setAttribute("partyId", request.getParameter("partyId"));
		int recordTypeId=Integer.parseInt(request.getParameter("recordTypeId"));
		String dataXML=request.getParameter("dataXML");
		List<AdviceAssumption> adviceAssumptionList = new ArrayList<AdviceAssumption>();
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = null;
		try {
			db = dbf.newDocumentBuilder();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}
		InputSource is = new InputSource();
		is.setCharacterStream(new StringReader(dataXML));

		Document doc = null;
		try {
			doc = db.parse(is);
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}
		NodeList nodes = doc.getElementsByTagName("Assumption");
		  for (int i = 0; i < nodes.getLength(); i++) {
	          Element element = (Element) nodes.item(i);
	          NodeList assumptionCodeIdNode = element.getElementsByTagName("AssumptionCodeId");
	          Element line = (Element) assumptionCodeIdNode.item(0);
	          String assumptionCodeId = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList assumptionValueNode = element.getElementsByTagName("AssumptionValue");
	          line = (Element) assumptionValueNode.item(0);
	          String assumptionValue = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList valueDataTypeIdNode = element.getElementsByTagName("ValueDataTypeId");
	          line = (Element) valueDataTypeIdNode.item(0);
	          String valueDataTypeId = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList displayLabelNode = element.getElementsByTagName("DisplayLabel");
	          line = (Element) displayLabelNode.item(0);
	          String displayLabel = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList valueEndRangeNode = element.getElementsByTagName("ValueEndRange");
	          line = (Element) valueEndRangeNode.item(0);
	          String valueEndRange = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList valueStartRangeNode = element.getElementsByTagName("ValueStartRange");
	          line = (Element) valueStartRangeNode.item(0);
	          String valueStartRange = FiinfraUtility.getCharacterDataFromElement(line);
	          NodeList idNode = element.getElementsByTagName("Id");
	          line = (Element) idNode.item(0);
	          String id = FiinfraUtility.getCharacterDataFromElement(line);
	          
	        
	          AdviceAssumption assumption=new AdviceAssumption();
	          
	          assumption.setAssumptionCodeId(Integer.parseInt(assumptionCodeId));
	          assumption.setAssumptionValue(assumptionValue);
	          assumption.setValueDataTypeId(Integer.parseInt(valueDataTypeId));
	          assumption.setDisplayLabel(displayLabel);
	          assumption.setValueEndRange(valueEndRange);
	          assumption.setValueStartRange(valueStartRange);
	          assumption.setRecordTypeId(recordTypeId);
	          assumption.setPartyId(partyId);
	          assumption.setCreatedBy(userSession.getUserId());
	          assumption.setLastModifiedBy(userSession.getUserId());
	          if(id.equals("0")){
	        	  assumption.setId(null);
	          }else{
	        	  assumption.setId(Integer.parseInt(id));
	          }
	          adviceAssumptionList.add(assumption);
		}
		
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse = restTemplate.postForObject(url, adviceAssumptionList, BaseResponse.class);
		Boolean result=false;
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result=baseResponse.getResponseObject();
		//logger.info("result:------"+result);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);
	}
	
	

	public void getAdviceAssumptions(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		logger.info("In get Assumption");
		ModelAndView mav = new ModelAndView("bizunit/BizUnit_assumptions");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_ADVICE_ASSUMPTIONS+"/1234?buId="+userSession.getBuId();
		
		HttpSession hes=request.getSession();
		int partyId=Integer.parseInt(request.getParameter("partyId"));
		request.setAttribute("partyId",partyId);
		hes.setAttribute("partyId", partyId);
		String assumptionCodeIds = "98021,98022,98032,98002,98047,98045,98028,98020,98055,98027,98046,98019,98001";
		PartySettingInput partySettingInput=new PartySettingInput();
		partySettingInput.setClientPartyId(partyId);
		partySettingInput.setPartnerPartyId(userSession.getPartyId());
		partySettingInput.setBuPartyId(userSession.getBuId());
		partySettingInput.setAssumptionCodeIds(assumptionCodeIds);
		BaseResponse<AdviceAssumption> br = new BaseResponse<AdviceAssumption>();
		List<AdviceAssumption> adviceAssumptions = new ArrayList<AdviceAssumption>();
		br = restTemplate.postForObject(url, partySettingInput, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			adviceAssumptions = br.getResponseListObject();
		mav.addObject(adviceAssumptions);
		//logger.info("adviceAssumptions:------"+adviceAssumptions);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, adviceAssumptions);
		
	}
	

	
public void getUniqueSetting(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		logger.info("In Unique Setting");
		
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_UNIQUE_SETTING+"ramu/1234";
		
		
		HttpSession hes=request.getSession();
		int partyId=Integer.parseInt(request.getParameter("partyId"));
		int addCodeValueId=Integer.parseInt(request.getParameter("addCodeValueId"));
	//	request.setAttribute("partyId",partyId);
	//	hes.setAttribute("partyId", partyId);
	//	String assumptionCodeIds = "98021,98022,98032,98002,98047,98045,98028,98020,98055,98027,98046,98019,98001";
		//PartySettingInput partySettingInput=new PartySettingInput();
	//	partySettingInput.setClientPartyId(partyId);
	//	partySettingInput.setPartnerPartyId(userSession.getPartyId());
	//	partySettingInput.setBuPartyId(userSession.getBuId());
	//	partySettingInput.setAssumptionCodeIds(assumptionCodeIds);
		
		Setting setting=new Setting();
		setting.setPartyId(partyId);
		setting.setAttributeCodeId(addCodeValueId);
		//Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<>();
		br = restTemplate.postForObject(url, setting, BaseResponse.class);
		Integer recordCount=0;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recordCount);
		
	}
	
	
	
	
	
	
}
