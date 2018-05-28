package in.fiinfra.common.controller;

/*
 * Test Message
 * */
import in.fiinfra.common.common.ChartData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.token.FiinfraToken;
import in.fiinfra.common.token.FiinfraTokenException;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/common")
public class CommonController
{
	private static final Logger LOGGER = Logger.getLogger(CommonController.class);

	@Autowired RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Value("${COMMON_CODE_VALUES}")
	private String COMMON_CODE_VALUES;
		
	@Value("${GET_CITY_LIST}")
	private String GET_CITY_LIST;
	
	@Value("${GET_CODE_VALUES_FOR_PARENTID}")
	private String GET_CODE_VALUES_FOR_PARENTID;
	
	@Value("${GET_COUNTRY_CODE_VALUES}")
	private String GET_COUNTRY_CODE_VALUES;
	
	@Value("${LOGOUT_URL}") 
	private  String LOGOUT_URL;
	
	@Value("${LOGOUT_USER_FROM_SYSTEM}") 
	private String LOGOUT_USER_FROM_SYSTEM;
	
	@Value("${SHUBHCHINTAK_URL}") 
	private String SHUBHCHINTAK_URL;
	
	@Value("${DFDA_URL}") 
	private String DFDA_URL;
	
	@Value("${FREEDOM_URL}") 
	private String FREEDOM_URL;
	
	@Value("${SPA_URL}") 
	private String SPA_URL;
	
	@Value("${LOGOUT_URL_ESSEL}") 
	private String LOGOUT_URL_ESSEL;
	
	@Value("${LOGOUT_URL_VISTA}") 
	private String LOGOUT_URL_VISTA;
	/*@Value("${GET_ROLE_BASED_SECURITY_IDS}") 
	private String GET_ROLE_BASED_SECURITY_IDS;
	*/
	@Value("${GET_ROLE_BASED_SECURITY_IDS}") 
	private String GET_ROLE_BASED_SECURITY_IDS;
	
	
//	@PostConstruct
//	public void init(){
//		try{
//			ApplicationContext appContext =  new ClassPathXmlApplicationContext(new String[] {"fiinfra-servlet.xml"});
//			Resource resource = appContext.getResource("classpath:resources/dcinput/DC_Axis.xml");
//			InputStream is = resource.getInputStream();
//			BufferedReader br = new BufferedReader(new InputStreamReader(is));
//			String line;
//			while ((line = br.readLine()) != null) {
//				LOGGER.debug(line);
//       	  	} 
//			br.close();
//		}catch(Exception ex){
//			LOGGER.error("DC Input File Not Found", ex);
//		}
//	}
	
	
	@RequestMapping(value="/logout", method=RequestMethod.GET )
	public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		String redirectUrl="";
		UserSession userSession =  (UserSession) request.getSession().getAttribute("userSession");
		Integer buId= userSession.getBuId();
		String username =(String) request.getSession().getAttribute("USER_NAME");
		String logouturl = LOGOUT_USER_FROM_SYSTEM+username+"/"+"abc";
		restTemplate.getForObject(logouturl, BaseResponse.class);
		LOGGER.debug("user "+ username+" is logout from system");
		if(buId==27827)//Shubhchintak
		{
			redirectUrl = SHUBHCHINTAK_URL;
		}
		else if(buId==27828)//ffreedom
		{
			redirectUrl = FREEDOM_URL;
		}
		else if(buId==27829)//SPA
		{
			redirectUrl = SPA_URL;
		}
		else if(buId==27830)//DFDA
		{
			redirectUrl = DFDA_URL;
		}
		else if(buId == 460355 )
		{
			redirectUrl = LOGOUT_URL_ESSEL;
		}
		else if(buId == 457481 )
		{
			redirectUrl = LOGOUT_URL_VISTA;
		}
		request.getSession().invalidate();
		response.sendRedirect(redirectUrl);
	}
	
	
	@RequestMapping(value="/gotoPartnalPortal", method=RequestMethod.GET)
	public ModelAndView gotoPartnalPortal(HttpServletRequest request,HttpServletResponse response)
	{
		String baseUrl="";
		String userName =(String) request.getSession().getAttribute("USER_NAME");
		if ( ( request.getServerPort() == 80 ) ||
		         ( request.getServerPort() == 443 ) ){
			baseUrl = request.getScheme() + "://" + request.getServerName() ;				
		}
		else{
			baseUrl = request.getScheme() + "://" +
			        request.getServerName() + ":" + request.getServerPort();				
		}
		//creating link for partner portal
		String sourceSystemId = Integer.toString(FiinfraConstants.PARTNER_PORTAL);
		String securityToken = "";
		
		try {
			securityToken = FiinfraToken.generateRestToken("username", sourceSystemId, request.getLocalAddr());
		} catch (FiinfraTokenException e) {
			LOGGER.info("Exception:  "+e.getMessage());
		}
		 
		String partner_portal_link = baseUrl+"/FIINFRA-WEB/common/buildSession.htm";
		partner_portal_link = partner_portal_link+"?TOKEN=abc&USER_NAME="+userName+"&securityToken="+securityToken;
		request.getSession().setAttribute("PP_Link", partner_portal_link);
		request.getSession().invalidate();
		return new ModelAndView("redirect:"+partner_portal_link);
	}
	
	@RequestMapping(value="/codevalues", method=RequestMethod.GET)
	public @ResponseBody List<CodeValueData> getAllProfiles(@RequestParam("codeTypeId") String codeTypeId) {
		try {
			LOGGER.info("Fetching code values...");
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(COMMON_CODE_VALUES + "/" + codeTypeId + "/1");
//			uriCB.queryParam("codeTypeIds", codeTypeId);
//			uriCB.queryParam("buId", "153");
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				codeValueDataList = br.getResponseListObject();
			
			List<CodeValueData> codeValueList = new ArrayList<CodeValueData>();
			for(int i = 0; i<codeValueDataList.size(); i++){
				CodeValueData codeValue = objectMapper.readValue(objectMapper.writeValueAsString(codeValueDataList.get(i)), CodeValueData.class);
				codeValueList.add(codeValue);
			}
			//Collections.sort(codeValueList);
			return codeValueList;
		} catch (Exception e) {
			LOGGER.error("Error fetching code value data...", e);
			return null;
		}		
	}	
	
	@RequestMapping(value="/codevaluesforInsurance", method=RequestMethod.GET)
	public @ResponseBody List<CodeValueData> codevaluesforFrquency(@RequestParam("codeTypeId") String codeTypeId) {
		try {
			LOGGER.info("Fetching code values...");
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(COMMON_CODE_VALUES + "/" + codeTypeId + "/1");
//			uriCB.queryParam("codeTypeIds", codeTypeId);
//			uriCB.queryParam("buId", "153");
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				codeValueDataList = br.getResponseListObject();
			
			List<CodeValueData> codeValueList = new ArrayList<CodeValueData>();
			for(int i = 0; i<codeValueDataList.size(); i++){
				CodeValueData codeValue = objectMapper.readValue(objectMapper.writeValueAsString(codeValueDataList.get(i)), CodeValueData.class);
				codeValueList.add(codeValue);
			}
			List<CodeValueData> codeValueListSorted = new ArrayList<CodeValueData>();
			codeValueListSorted.add(codeValueList.get(7));
			codeValueListSorted.add(codeValueList.get(3));
			codeValueListSorted.add(codeValueList.get(4));
			codeValueListSorted.add(codeValueList.get(5));
			codeValueListSorted.add(codeValueList.get(6));			
			return codeValueListSorted;
		} catch (Exception e) {
			LOGGER.error("Error fetching code value data...", e);
			return null;
		}		
	}	

	@RequestMapping(value="/codevaluesforEMI", method=RequestMethod.GET)
	public @ResponseBody List<CodeValueData> codevaluesforEMI(@RequestParam("codeTypeId") String codeTypeId) {
		try {
			LOGGER.info("Fetching code values...");
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(COMMON_CODE_VALUES + "/" + codeTypeId + "/1");
//			uriCB.queryParam("codeTypeIds", codeTypeId);
//			uriCB.queryParam("buId", "153");
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				codeValueDataList = br.getResponseListObject();
			
			List<CodeValueData> codeValueList = new ArrayList<CodeValueData>();
			for(int i = 0; i<codeValueDataList.size(); i++){
				CodeValueData codeValue = objectMapper.readValue(objectMapper.writeValueAsString(codeValueDataList.get(i)), CodeValueData.class);
				codeValueList.add(codeValue);
			}
			List<CodeValueData> codeValueListSorted = new ArrayList<CodeValueData>();
			codeValueListSorted.add(codeValueList.get(7));
			codeValueListSorted.add(codeValueList.get(0));
			codeValueListSorted.add(codeValueList.get(1));
			codeValueListSorted.add(codeValueList.get(3));
			codeValueListSorted.add(codeValueList.get(5));
			codeValueListSorted.add(codeValueList.get(6));			
			return codeValueListSorted;
		} catch (Exception e) {
			LOGGER.error("Error fetching code value data...", e);
			return null;
		}		
	}	
	

	@RequestMapping(value="/countries", method=RequestMethod.GET)
	public @ResponseBody List<CodeValueData> getCountries(@RequestParam("codeValueId") Integer codeValueId) {
		try {
			LOGGER.info("Fetching code values...");
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_COUNTRY_CODE_VALUES + codeValueId + "/1");
//			uriCB.queryParam("codeTypeIds", codeTypeId);
//			uriCB.queryParam("buId", "153");
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				codeValueDataList = br.getResponseListObject();
			
			return codeValueDataList;
		} catch (Exception e) {
			LOGGER.error("Error fetching code value data...", e);
			return null;
		}		
	}	
	
//	@Path("/getCodeValuesForParentId/{parentId}/{token}") 
	@RequestMapping(value="/codevaluesforparentid", method=RequestMethod.GET)
	public @ResponseBody List<CodeValueData> getCodeValuesForParentId(@RequestParam("parentId") String parentId) {
		try {
			LOGGER.info("Fetching code values using parent id...");
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_CODE_VALUES_FOR_PARENTID +  parentId + "/1?buId=153");
			
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				codeValueDataList = br.getResponseListObject();
			List<CodeValueData> codeValueList = new ArrayList<CodeValueData>();
			for(int i = 0; i<codeValueDataList.size(); i++){
				CodeValueData codeValue = objectMapper.readValue(objectMapper.writeValueAsString(codeValueDataList.get(i)), CodeValueData.class);
				codeValueList.add(codeValue);
			}
			Collections.sort(codeValueList);
			return codeValueList;
		} catch (Exception e) {
			LOGGER.error("Error fetching code value data...", e);
			return null;
		}		
	}	
	
	@RequestMapping(value="/getCities", method=RequestMethod.GET)
	public @ResponseBody List<CodeValueData> getCitites(@RequestParam("parentId") String parentId) {
		try {
			LOGGER.info("Fetching code values...");
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_CITY_LIST + "/1/1?parentId=" + parentId);
//			uriCB.queryParam("codeTypeIds", codeTypeId);
//			uriCB.queryParam("buId", "153");
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				codeValueDataList = br.getResponseListObject();
			List<CodeValueData> codeValueList = new ArrayList<CodeValueData>();
			for(int i = 0; i<codeValueDataList.size(); i++){
				CodeValueData codeValue = objectMapper.readValue(objectMapper.writeValueAsString(codeValueDataList.get(i)), CodeValueData.class);
				codeValueList.add(codeValue);
			}
			Collections.sort(codeValueList);
			return codeValueList;
		} catch (Exception e) {
			LOGGER.error("Error fetching code value data...", e);
			return null;
		}		
	}
	
	public String getRoleBasedSecurityIDS(Integer partyId,String username,Integer buId,Integer sectionTypeId)
	{
		String roleBaseSecurityIDS="";
		/*String token = "12354";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ROLE_BASED_SECURITY_IDS+"/"+username+"/"+partyId+"/"+31006+"/"+sectionTypeId+"/"+token);
		uriCB.queryParam("buId", buId);
		BaseResponse<String> baseResponse = new BaseResponse<String>();
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){	
			roleBaseSecurityIDS = baseResponse.getResponseObject();
		}*/
		LOGGER.debug("roleBaseSecurityIDS=================k==================>"+roleBaseSecurityIDS);
		return roleBaseSecurityIDS;
	}
		

}
