/**
 * 
 */
package in.fiinfra.partner.controller;

import in.fiinfra.common.common.XStreamTranslator;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.ClientPortfolioSummarryData;
import in.fiinfra.common.partner.ContactData;
import in.fiinfra.common.partner.FixedIncomePortfolioData;
import in.fiinfra.common.partner.MFPortfolioData;
import in.fiinfra.common.partner.NomineeData;
import in.fiinfra.common.partner.PortFolioProductInfo;
import in.fiinfra.common.partner.PortfolioData;
import in.fiinfra.common.partner.StockPortfolioData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.pojo.WebResponse;
import in.fiinfra.util.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.QueryParam;

import org.apache.poi.openxml4j.opc.internal.FileHelper;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;

/**
 * @author
 * 
 */

@Controller
@RequestMapping(value = "folio/")
public class FolioController {

	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private ObjectMapper objectMapper;
	
	public static Properties properties;
	
	final String SOURCE_MODULE = "Client Portfolio";
	private String sectionName;
	
	static {
		properties = new Properties();
		InputStream stream = FileHelper.class.getClassLoader()
				.getResourceAsStream("ApplicationResources.properties");
		try {
			properties.load(stream);
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "foliopage.htm", method = RequestMethod.GET)
	public String getFolioPage() {
		// ModelAndView mv = new ModelAndView("mfportfoliosummary");
		return "partner/mfportfoliosummary";
	}

	@RequestMapping(value = "mffoliosummary.htm", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	Map<String, String> getMfFolioSummary(HttpServletResponse response,
			HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		Integer nodeId=0;
		
		if(request.getSession().getAttribute("nodeId")!=null){
			nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		}
		
		
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/folio/mffoliosummary?buId=" + buId
				+ "&partnerId=" + partnerId + "&nodeId="+nodeId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		Map<String, String> folioSummaryMap = restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB), Map.class).getBody();
		return folioSummaryMap;
	}

	@RequestMapping(value = "portfolioproductinfo.htm", method = RequestMethod.GET)
	public @ResponseBody
	List<List<PortFolioProductInfo>> getPortFolioProductInfo(
			HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		//int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		Integer nodeId=0;
		if(request.getSession().getAttribute("nodeId")!=null){
			nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		}
		
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/folio/portfolioproductinfo?buId=" + buId
				+ "&partnerId=" + partnerId + "&nodeId="+nodeId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());

		List<List<PortFolioProductInfo>> result = restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB), List.class).getBody();
		return result;
	}

	@RequestMapping(value = "partneraummonthwise.htm", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	Map<String, String> getPartnerAUMMonthWise(
			@QueryParam("chartType") String chartType,
			HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		//int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		Integer nodeId=0;
		if(request.getSession().getAttribute("nodeId")!=null){
			nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		}
		
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/folio/partneraummonthwise?buId=" + buId
				+ "&chartType=" + chartType + "&partnerId=" + partnerId+ "&nodeId=" + nodeId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		Map<String, String> monthWiseAUM = restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB), Map.class).getBody();
		return monthWiseAUM;
	}

	@RequestMapping(value = "displayfoliopiechart.htm", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	Map<String, Map<String, String>> displayFolioPieChart(
			HttpServletRequest request) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		//int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		Integer nodeId=0;
		if(request.getSession().getAttribute("nodeId")!=null){
			nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		}
		
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/folio/displayfoliopiechart?buId=" + buId
				+ "&partnerId=" + partnerId+"&nodeId="+nodeId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		Map<String, Map<String, String>> pieChartsInfo = restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB), Map.class)
				.getBody();
		return pieChartsInfo;
	}

	@RequestMapping(value = "clientportfoliosummary.htm", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	Map<String, Map<String, String>> getClientPortfolioSummary(
			HttpServletRequest request, @QueryParam("partyId") String partyId) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/folio/getClientPortfolioSummary?buId=" + buId
				+ "&partyId=" + partyId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		Map<String, Map<String, String>> pieChartsInfo = restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB), Map.class)
				.getBody();
		return pieChartsInfo;
	}

	@RequestMapping(value = "/openclientportfolio.htm", method = RequestMethod.GET)
	public ModelAndView openClientPortfolio(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("partner/clientportfolio");

		try{
			String url = FiinfraUtility.getRestDBURL();
			
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

			url = url + "services/folio/getPortfolioClientList?buId=" + buId
					+ "&partnerId=" + partnerId
					+ "&nodeId=" + nodeId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);


			List<ContactData> contactData = Arrays.asList(restTemplate
					.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
							ContactData[].class).getBody());
			mav.addObject("contactData", contactData);
			}catch (Exception e){
				
			}
			return mav;
	}
	
	
	@RequestMapping(value="/getClientPortfolioSummary.htm")
	@ResponseBody
	public Map<String,List<ClientPortfolioSummarryData>> getClientPortfolioSummary(HttpServletRequest request, @RequestParam(value="partyId") int partyId){
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partnerId=userSession.getPartyId();
		int buId = userSession.getBuId();
		//int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		Integer nodeId=0;
		if(request.getSession().getAttribute("nodeId")!=null){
			nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		}
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/folio/getClientPortfolioSummary?buId=" + buId
				+ "&partyId=" + partyId+"&partnerId="+partnerId+"&nodeId="+nodeId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		Map<String,List<ClientPortfolioSummarryData>> result = restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB), Map.class)
				.getBody();
		
		return result;
	}
	@RequestMapping(value="/viewTransactions.htm")
	@ResponseBody
	public  Map<String,List<Map<String,String>>>  getClientPortFolioTransactions(HttpServletRequest request, @RequestParam(value="partyAssetId") int partyAssetId){
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		int buId = userSession.getBuId();
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/folio/viewTransactions?buId=" + buId
				+ "&partyAssetId=" + partyAssetId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		 Map<String,List<Map<String,String>>> result = restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB), Map.class)
				.getBody();
		
		return result;
	}
	@RequestMapping(value="/goalMapping.htm")
	@ResponseBody
	public  Map<String,List<Map<String,String>>>  getClientPortFolioGoalMapping(HttpServletRequest request, @RequestParam(value="partyAssetId") int partyAssetId){
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		int buId = userSession.getBuId();
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/folio/goalMapping?buId=" + buId
				+ "&partyAssetId=" + partyAssetId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		 Map<String,List<Map<String,String>>> result = restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB), Map.class)
				.getBody();
		
		return result;
	}
	@RequestMapping(value="/updateGoalMapping.htm",method = RequestMethod.POST)
	public void saveForm(HttpServletRequest request,@RequestBody GoalData[] goalData,@RequestParam(value="partyAssetId") int partyAssetId, HttpServletResponse response){
		Map<String,String> map=new HashMap<String,String>();
		try{			
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			
			String url = FiinfraUtility.getRestDBURL();
			//partner and bu id needs to fetch from session
			url = url + "services/folio/updateGoalMapping?buId="+buId+"&createdBy="+createdBy+"&partyAssetId="+partyAssetId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
					.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String >resp = restTemplate.postForObject(url, goalData, BaseResponse.class);	
			Logger.logEntry(this.getClass(), "goalData:---" + goalData, Logger.DEBUG, 
					Thread.currentThread().getStackTrace()[1].getMethodName()); 
			
			map.put("success", "Data saved successfully");
		}catch(Exception e){
			map.put("error", "System error occured");
		}
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			map.put("error", "System error occured");
		}
		
	}
	@RequestMapping(value = "/openfolioNominations.htm", method = RequestMethod.GET)
	public ModelAndView openFolioNominations(@RequestParam("partyAssetId")int partyAssetId,@RequestParam("clientId")int clientId,@RequestParam("assetName") String assetName) {

		ModelAndView mav = new ModelAndView("partner/folionominations");

		return mav;
	}
	
	@RequestMapping(value="/folioNominations.htm")
	@ResponseBody
	public  List<NomineeData>  getClientPortFolioNominations(HttpServletRequest request, @RequestParam(value="partyAssetId") int partyAssetId){
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		int buId = userSession.getBuId();
		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/folio/folioNominations?buId=" + buId
				+ "&partyAssetId=" + partyAssetId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		List<NomineeData> result =Arrays.asList( restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB), NomineeData[].class)
				.getBody());
		
		return result;
	}
	@ExceptionHandler(Exception.class)
	@ResponseBody
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	public Map<String, String> handleAllException(Exception ex) {
		Map<String, String> error = new HashMap<String, String>();
		error.put("error", "System error occured.");
		return error;

	}
	
	@RequestMapping(value="/updateFolioNominations.htm",method = RequestMethod.POST)
	public void updateFolioNominations(HttpServletRequest request,@RequestBody NomineeData nominee,@RequestParam(value="folioNo") String folioNo,
			@RequestParam(value="nomineePartyId") int partyId,@RequestParam(value="clientId") int clientId,@RequestParam(value="partyAssetId") int partyAssetId, HttpServletResponse response){
		Map<String,String> map=new HashMap<String,String>();
		try{
		
				
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			int partnerId=userSession.getPartyId();
			String url = FiinfraUtility.getRestDBURL();
			
			url = url + "services/folio/updateFolioNominations?buId="+buId+"&createdBy="+createdBy+"&folioNo="+folioNo+"&partyId="+partyId
					+"&partnerId="+partnerId+"&clientId="+clientId+"&partyAssetId="+partyAssetId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
					.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String >resp = restTemplate.postForObject(url, nominee, BaseResponse.class);	
			Logger.logEntry(this.getClass(), "goalData:---" + nominee, Logger.DEBUG, 
					Thread.currentThread().getStackTrace()[1].getMethodName()); 
			
			map.put("success", "Data saved successfully");
		}catch(Exception e){
			map.put("error", "System error occured");
		}
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			map.put("error", "System error occured");
		}
		
	}
	
	@RequestMapping(value="/deleteFolioNominations.htm",method = RequestMethod.POST)
	public @ResponseBody Map<String,String> deleteFolioNominations( @QueryParam("noteIds") String noteIds,HttpServletRequest request, HttpServletResponse response){
		
		Map<String,String> result = new HashMap<String,String>();
		try{
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			String url = FiinfraUtility.getRestDBURL();
			
			Logger.logEntry(this.getClass(), "noteIds:---" + noteIds,
					Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			
			url = url + "services/folio/deleteFolioNominations?createdBy="+createdBy+"&buId="+buId +"&noteIds="+noteIds;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
					.currentThread().getStackTrace()[1].getMethodName());
			
			BaseResponse<String >resp = restTemplate.postForObject(url, null, BaseResponse.class);	
			
			result.put("feedback", "success");
		}catch(Exception e){
			
			result.put("feedback", "error");
		}
		
		
		return result;
	}
	
	@RequestMapping(value="/getNomineeDataByPartyId.htm",method = RequestMethod.GET)
	public @ResponseBody NomineeData getNomineeDataByPartyid(@RequestParam("partyId")String partyId ,  HttpServletRequest request){
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int buId = userSession.getBuId();
		String url = FiinfraUtility.getRestDBURL();
		
		url = url + "services/folio/getNomineeDataByPartyId?createdBy="+createdBy+"&partyId="+partyId+"&buId="+buId;;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		 NomineeData data = restTemplate
			.getForEntity(FiinfraUtility.getURLWithParams(uriCB), NomineeData.class)
			.getBody();
		return data;
	}
	
	/**
	 * Controller to handle request for getting the list of transactionTypes , exchangeType, dmatAccounts for Add/Edit stock form
	 * @param partyId
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getClientStockDetailsForAddEditForm.htm",method = RequestMethod.GET)
	public @ResponseBody Map<String,List<Map<String, String>>> getClientStockDetailsForAddEditForm(@RequestParam("partyId")int partyId ,  HttpServletRequest request) {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		String url = FiinfraUtility.getRestDBURL();
		
		url = url + "services/folio/getClientStockDetailsForAddEditForm?partyId="+partyId+"&buId="+buId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		Map<String,List<Map<String, String>>> result = restTemplate
		.getForEntity(FiinfraUtility.getURLWithParams(uriCB), Map.class)
		.getBody();
		return result;		
	}
	
	
	@RequestMapping(value="/addEntryForStock.htm",method = RequestMethod.POST)
	public @ResponseBody Map<String,String> addEntryForForStock(@RequestParam("clientId")int clientId ,  HttpServletRequest request, @RequestBody  StockPortfolioData stockPortfolioData ) {
		Map<String,String> map=new HashMap<String,String>();
		try{
		
			sectionName = request.getParameter("sectionName");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			int partnerId=userSession.getPartyId();
			String url = FiinfraUtility.getRestDBURL();
			Logger.logEntry(this.getClass(), "stockPortfolioData::::::"+stockPortfolioData.getAssetName(),Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			url = url + "services/folio/addEntryForStock?buId="+buId+"&createdBy="+createdBy+"&clientId="+clientId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
					.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String >resp = restTemplate.postForObject(url, stockPortfolioData, BaseResponse.class);	
			
			Logger.logEntry(this.getClass(), "stockPortfolioData:---" + stockPortfolioData, Logger.DEBUG, 
					Thread.currentThread().getStackTrace()[1].getMethodName()); 
			
			map.put("success", "Data saved successfully");
			//audit entry
			int eventId=0;
			if(stockPortfolioData.getMode().equals("Add")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_ADD;
			}
			if(stockPortfolioData.getMode().equals("Edit")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_UPDATE;
			}
			if(stockPortfolioData.getMode().equals("Delete")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_DELETE;
			}
			
			XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
			String eventTextXML="usp_pp_addEntryForStock("+clientId+","+xmlTransaltor.toXMLString(stockPortfolioData)+","+createdBy+")";
			Audit audit = new Audit();
			audit.setActionByUserID(createdBy);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			audit.setSourceModule(SOURCE_MODULE);
			audit.setSourceScreen(sectionName);
			audit.setEventTextXML(eventTextXML);
			FrameworkUtil.audit(audit);
		}catch(Exception e){
			map.put("error", "System error occured.");
		}
		
		return map;
	}
	
	/**
	 * 
	 * @param searchString
	 * @param request
	 * @return
	 * 
	 * Method return the suggestions for stock name  on Stock Add Edit Form
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/quickSearchAssets.htm", method = RequestMethod.GET)
	public @ResponseBody
	WebResponse getAssetForAddEditForm(
			@RequestParam(value = "searchString") String searchString, @RequestParam(value = "searchType") String searchType,
			@RequestParam(value = "mfAMCId") String mfAMCId, @RequestParam(value = "clientPartyId") int clientPartyId, HttpServletRequest request) {
		WebResponse webResponse = new WebResponse();
		try {
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			String url = FiinfraUtility.getRestDBURL();
			url = url + "services/folio/getAssetForAddEditForm?buId=" + buId
					+ "&searchType="+searchType+ "&searchString=" + searchString +"&mfAMCId="+mfAMCId+"&clientPartyId="+clientPartyId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			Map<String, String> result = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
					Map.class).getBody();
			webResponse.setStatusCode(HttpStatus.OK.toString());
			webResponse.setData(result);
			webResponse.setMessage("Success");
		}catch(Exception e) {
			throw e;
		}
		
		return webResponse;

	}
	/**
	 * Controller to handle request for getting the list of transactionTypes , folionos, sip payout frequency for Add/Edit MF form
	 * @param partyId
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getClientMFDetailsForAddEditForm.htm",method = RequestMethod.GET)
	public @ResponseBody Map<String,List<Map<String, String>>> getClientMFDetailsForAddEditForm(@RequestParam("partyId")int partyId ,  HttpServletRequest request) {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		String url = FiinfraUtility.getRestDBURL();
		
		url = url + "services/folio/getClientMFDetailsForAddEditForm?partyId="+partyId+"&buId="+buId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		Map<String,List<Map<String, String>>> result = restTemplate
		.getForEntity(FiinfraUtility.getURLWithParams(uriCB), Map.class)
		.getBody();
		return result;		
	}
	
	/**
	 * Controller to store entry for mutual fund. Called from Add/Edit mutual fund form
	 * @param clientId
	 * @param request
	 * @param mfPortfolioData
	 * @return
	 */
	@RequestMapping(value="/addEntryForMF.htm",method = RequestMethod.POST)
	public @ResponseBody WebResponse addEntryForForMF(@RequestParam("clientId")int clientId , @RequestParam("pmTxnID")int pmTxnID, HttpServletRequest request, @RequestBody  MFPortfolioData mfPortfolioData ) {
		WebResponse webResponse = new WebResponse();
		try{
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			int partnerId=userSession.getPartyId();
			String url = FiinfraUtility.getRestDBURL();
			Logger.logEntry(this.getClass(),"stockPortfolioData::::::"+mfPortfolioData.getAssetName(),Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			url = url + "services/folio/addEntryForMF?buId="+buId+"&createdBy="+createdBy+"&clientId="+clientId+"&pmTxnID="+pmTxnID;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
					.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String >resp = restTemplate.postForObject(url, mfPortfolioData, BaseResponse.class);	
			
			Logger.logEntry(this.getClass(), "stockPortfolioData:---" + mfPortfolioData, Logger.DEBUG, 
					Thread.currentThread().getStackTrace()[1].getMethodName()); 
			
			webResponse.setStatusCode(HttpStatus.OK.toString());
			//webResponse.setMessage(properties.getProperty("common.success.msg"));
			webResponse.setMessage("Data saved Successfully");
			
			
			int eventId=0;
			eventId=FiinfraConstants.CLIENT_PORTFOLIO_ADD;
			
			
			XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
			String eventTextXML="usp_pp_addEntryForMF("+clientId+","+xmlTransaltor.toXMLString(mfPortfolioData)+","+createdBy+",0)";
			Audit audit = new Audit();
			audit.setActionByUserID(createdBy);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			audit.setSourceModule(SOURCE_MODULE);
			audit.setSourceScreen(sectionName);
			audit.setEventTextXML(eventTextXML);
			FrameworkUtil.audit(audit);
		}catch(Exception e){
			webResponse.setStatusCode(HttpStatus.INTERNAL_SERVER_ERROR.toString());
			webResponse.setMessage("System error occurred.");
		}
		return webResponse;
	}
	
	/**
	 * Controller to handle request for getting the list of transactionTypes for Add/Edit ULIP form
	 * @param partyId
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getClientULIPDetailsForAddEditForm.htm",method = RequestMethod.GET)
	public @ResponseBody Map<String,List<Map<String, String>>> getClientULIPDetailsForAddEditForm(@RequestParam("partyId")int partyId ,  HttpServletRequest request) {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		String url = FiinfraUtility.getRestDBURL();
		
		url = url + "services/folio/getClientULIPDetailsForAddEditForm?partyId="+partyId+"&buId="+buId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		Map<String,List<Map<String, String>>> result = restTemplate
		.getForEntity(FiinfraUtility.getURLWithParams(uriCB), Map.class)
		.getBody();
		return result;		
	}
	/**
	 * Controller to store entry for ULIP. Called from Add/Edit ULIP form
	 * @param clientId
	 * @param request
	 * @param ulipPortfolioData
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/addEntryForULIP.htm",method = RequestMethod.POST)
	public @ResponseBody WebResponse addEntryForULIP(@RequestParam("clientId")int clientId ,  HttpServletRequest request, @RequestBody  PortfolioData ulipPortfolioData ) {
		WebResponse webResponse = new WebResponse();
		try{
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			//int partnerId=userSession.getPartyId();
			String url = FiinfraUtility.getRestDBURL();
			url = url + "services/folio/addEntryForULIP?buId="+buId+"&createdBy="+createdBy+"&clientId="+clientId;
			//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String>resp = restTemplate.postForObject(url, ulipPortfolioData, BaseResponse.class);	
			
			//Logger.logEntry(this.getClass(), "ulipPortfolioData:---" + ulipPortfolioData, Logger.DEBUG,Thread.currentThread().getStackTrace()[1].getMethodName()); 
			
			webResponse.setStatusCode(HttpStatus.OK.toString());
			webResponse.setMessage("Data saved Successfully");
			
			//audit entry
			int eventId=0;
			if(ulipPortfolioData.getMode().equals("Add")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_ADD;
			}
			if(ulipPortfolioData.getMode().equals("Edit")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_UPDATE;
			}
			if(ulipPortfolioData.getMode().equals("Delete")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_DELETE;
			}
			XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
			String eventTextXML="usp_pp_addEntryForULIP("+clientId+","+xmlTransaltor.toXMLString(ulipPortfolioData)+","+createdBy+")";
			Audit audit = new Audit();
			audit.setActionByUserID(createdBy);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			audit.setSourceModule(SOURCE_MODULE);
			audit.setSourceScreen(sectionName);
			audit.setEventTextXML(eventTextXML);
			FrameworkUtil.audit(audit);
		}catch(Exception e){
			webResponse.setStatusCode(HttpStatus.INTERNAL_SERVER_ERROR.toString());
			webResponse.setMessage("System error occurred.");
		}
		return webResponse;
	}

	/**
	 * Controller to handle request for getting the list of all dropdowns for Add/Edit Fixed Income form
	 * @param partyId
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getClientFIDetailsForAddEditForm.htm",method = RequestMethod.GET)
	public @ResponseBody Map<String,List<Map<String, String>>> getClientFIDetailsForAddEditForm(@RequestParam("partyId")int partyId ,  HttpServletRequest request) {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		String url = FiinfraUtility.getRestDBURL();
		
		url = url + "services/folio/getClientFIDetailsForAddEditForm?partyId="+partyId+"&buId="+buId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		
		Map<String,List<Map<String, String>>> result = restTemplate
		.getForEntity(FiinfraUtility.getURLWithParams(uriCB), Map.class)
		.getBody();
		return result;		
	}
	/**
	 * Controller to store entry for ULIP. Called from Add/Edit Fixed Income form
	 * @param clientId
	 * @param request
	 * @param fiPortfolioData
	 * @return
	 */
	@RequestMapping(value="/addEntryForFI.htm",method = RequestMethod.POST)
	public @ResponseBody WebResponse addEntryForFI(@RequestParam("clientId")int clientId ,  HttpServletRequest request, @RequestBody  FixedIncomePortfolioData fiPortfolioData ) {
		WebResponse webResponse = new WebResponse();
		try{
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			int partnerId=userSession.getPartyId();
			String url = FiinfraUtility.getRestDBURL();
			url = url + "services/folio/addEntryForFI?buId="+buId+"&createdBy="+createdBy+"&clientId="+clientId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
					.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String >resp = restTemplate.postForObject(url, fiPortfolioData, BaseResponse.class);	
			
			Logger.logEntry(this.getClass(), "fiPortfolioData:---" + fiPortfolioData, Logger.DEBUG, 
					Thread.currentThread().getStackTrace()[1].getMethodName()); 
			
			webResponse.setStatusCode(HttpStatus.OK.toString());
			webResponse.setMessage("Data saved Successfully");
			
			
			//audit entry
			int eventId=0;
			if(fiPortfolioData.getMode().equals("Add")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_ADD;
			}
			if(fiPortfolioData.getMode().equals("Edit")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_UPDATE;
			}
			if(fiPortfolioData.getMode().equals("Delete")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_DELETE;
			}
			XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
			String eventTextXML="usp_pp_addEntryForFixedIncome("+clientId+","+xmlTransaltor.toXMLString(fiPortfolioData)+","+createdBy+")";
			Audit audit = new Audit();
			audit.setActionByUserID(createdBy);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			audit.setSourceModule(SOURCE_MODULE);
			audit.setSourceScreen(sectionName);
			audit.setEventTextXML(eventTextXML);
			FrameworkUtil.audit(audit);
		}catch(Exception e){
			webResponse.setStatusCode(HttpStatus.INTERNAL_SERVER_ERROR.toString());
			webResponse.setMessage("System error occurred.");
		}
		return webResponse;
	}


	@RequestMapping(value="/getAMCList.htm",method = RequestMethod.GET)
	public void getAMCList(HttpServletRequest request,
			HttpServletResponse response) {
		
		try {
			//String searchString = request.getParameter("searchString");
			int clientPartyId = Integer.parseInt(request.getParameter("id"));
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			//int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			String url = FiinfraUtility.getRestDBURL();
			url = url + "services/folio/getAMCList?buId="+buId+"&clientPartyId="+clientPartyId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			List<ContactData> contactData = Arrays.asList(restTemplate
					.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
							ContactData[].class).getBody());
			
			/*Map<String, String> result = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
					Map.class).getBody();*/
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, contactData);
			
		}catch(Exception e) {
			
		}
	}
	
	/**
	 * Controller to handle request for getting the list of all dropdowns for Add/Edit Fixed Income form
	 * @param partyId
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getClientPropertyDetailsForAddEditForm.htm",method = RequestMethod.GET)
	public @ResponseBody Map<String,List<Map<String, String>>> getClientPropertyDetailsForAddEditForm(@RequestParam("partyId")int partyId ,  HttpServletRequest request) {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		String url = FiinfraUtility.getRestDBURL();
		
		url = url + "services/folio/getClientPropertyDetailsForAddEditForm?partyId="+partyId+"&buId="+buId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
		Map<String,List<Map<String, String>>> result = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), Map.class).getBody();
		return result;		
	}
	
	/**
	 * Controller to store entry for property. Called from Add/Edit property form
	 * @param clientId
	 * @param request
	 * @param propertyPortfolioData
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/addEntryForProperty.htm",method = RequestMethod.POST)
	public @ResponseBody WebResponse addEntryForProperty(@RequestParam("clientId")int clientId ,  HttpServletRequest request, @RequestBody  PortfolioData propertyPortfolioData ) {
		WebResponse webResponse = new WebResponse();
		try{
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			//int partnerId=userSession.getPartyId();
			String url = FiinfraUtility.getRestDBURL();
			url = url + "services/folio/addEntryForProperty?buId="+buId+"&createdBy="+createdBy+"&clientId="+clientId;
			//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String>resp = restTemplate.postForObject(url, propertyPortfolioData, BaseResponse.class);	
			
			webResponse.setStatusCode(HttpStatus.OK.toString());
			webResponse.setMessage("Data saved Successfully");
			
			
			//audit entry
			int eventId=0;
			if(propertyPortfolioData.getMode().equals("Add")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_ADD;
			}
			if(propertyPortfolioData.getMode().equals("Edit")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_UPDATE;
			}
			if(propertyPortfolioData.getMode().equals("Delete")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_DELETE;
			}
			XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
			String eventTextXML="usp_pp_addEntryForProperty("+clientId+","+xmlTransaltor.toXMLString(propertyPortfolioData)+","+createdBy+")";
			Audit audit = new Audit();
			audit.setActionByUserID(createdBy);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			audit.setSourceModule(SOURCE_MODULE);
			audit.setSourceScreen(sectionName);
			audit.setEventTextXML(eventTextXML);
			FrameworkUtil.audit(audit);
		}catch(Exception e){
			webResponse.setStatusCode(HttpStatus.INTERNAL_SERVER_ERROR.toString());
			webResponse.setMessage("System error occurred.");
		}
		return webResponse;
	}
	
	/**
	 * Controller to handle request for getting the list of all dropdowns for Add/Edit Fixed Income form
	 * @param partyId
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getClientGoldDetailsForAddEditForm.htm",method = RequestMethod.GET)
	public @ResponseBody Map<String,List<Map<String, String>>> getClientGoldDetailsForAddEditForm(@RequestParam("partyId")int partyId ,  HttpServletRequest request) {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		String url = FiinfraUtility.getRestDBURL();
		
		url = url + "services/folio/getClientGoldDetailsForAddEditForm?partyId="+partyId+"&buId="+buId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
		Map<String,List<Map<String, String>>> result = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), Map.class).getBody();
		return result;		
	}
	
	/**
	 * Controller to store entry for property. Called from Add/Edit property form
	 * @param clientId
	 * @param request
	 * @param propertyPortfolioData
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/addEntryForGold.htm",method = RequestMethod.POST)
	public @ResponseBody WebResponse addEntryForGold(@RequestParam("clientId")int clientId ,  HttpServletRequest request, @RequestBody  PortfolioData goldPortfolioData ) {
		WebResponse webResponse = new WebResponse();
		try{
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			//int partnerId=userSession.getPartyId();
			String url = FiinfraUtility.getRestDBURL();
			url = url + "services/folio/addEntryForGold?buId="+buId+"&createdBy="+createdBy+"&clientId="+clientId;
			//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			//Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String>resp = restTemplate.postForObject(url, goldPortfolioData, BaseResponse.class);	
			
			webResponse.setStatusCode(HttpStatus.OK.toString());
			webResponse.setMessage("Data saved Successfully");
			
			
			//audit entry
			int eventId=0;
			if(goldPortfolioData.getMode().equals("Add")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_ADD;
			}
			if(goldPortfolioData.getMode().equals("Edit")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_UPDATE;
			}
			if(goldPortfolioData.getMode().equals("Delete")){
				eventId=FiinfraConstants.CLIENT_PORTFOLIO_DELETE;
			}
			XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
			String eventTextXML="usp_pp_addEntryForGold("+clientId+","+xmlTransaltor.toXMLString(goldPortfolioData)+","+createdBy+")";
			Audit audit = new Audit();
			audit.setActionByUserID(createdBy);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			audit.setSourceModule(SOURCE_MODULE);
			audit.setSourceScreen(sectionName);
			audit.setEventTextXML(eventTextXML);
			FrameworkUtil.audit(audit);
		}catch(Exception e){
			webResponse.setStatusCode(HttpStatus.INTERNAL_SERVER_ERROR.toString());
			webResponse.setMessage("System error occurred.");
		}
		return webResponse;
	}
	
	
	@RequestMapping(value="/deleteClientTransaction.htm",method = RequestMethod.POST)
	public @ResponseBody Map<String,String> deleteClientTransaction(@RequestParam("clientId")int clientId,HttpServletRequest request, @RequestBody  StockPortfolioData stockPortfolioData){
		
		Map<String,String> result = new HashMap<String,String>();
		try{
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			String url = FiinfraUtility.getRestDBURL();
			
			url = url + "services/folio/deleteClientTransaction?createdBy="+createdBy+"&buId="+buId+"&clientId="+clientId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			
			BaseResponse<String >resp = restTemplate.postForObject(url, stockPortfolioData, BaseResponse.class);	
			
			result.put("feedback", "success");
		}catch(Exception e){
			
			result.put("feedback", "error");
		}
		
		
		return result;
	}
	
	
	@RequestMapping(value = "/openMFTransactions.htm", method = RequestMethod.POST)
	public ModelAndView openMFTransactions(@RequestParam("partyAssetId")int partyAssetId,@RequestParam("clientId")int clientId) {

		ModelAndView mav = new ModelAndView("partner/MFTransactions");

		return mav;
	}
	
	@RequestMapping(value="/getClientMFTransactionDetails.htm",method = RequestMethod.GET)
	public ModelAndView  getClientMFTransactionDetails(@RequestParam("clientId")int clientId,@RequestParam("partyAssetId")int partyAssetId,HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException {
		

			
			
			String amc = "abc";
			String productId ="0";
			int txnType =0;
			String startDate ="abc";
			String endDate = "abc";
		
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			//int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			int partnerId=userSession.getPartyId();
					
			String url = FiinfraUtility.getRestDBURL();
			url = url + "services/folio/getClientMFTransactionDetailst?partnerId="+partnerId+"&partyAssetId="+partyAssetId+"&clientId="+clientId+"&amc="+amc+"&productId="+productId+"&txnType="+txnType+"&startDate="+startDate+"&endDate="+endDate;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			List<MFPortfolioData> MFTransactionDetailstData = Arrays.asList(restTemplate
					.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
							MFPortfolioData[].class).getBody());
			ModelAndView mav = new ModelAndView("partner/MFTransactions");
		
			mav.addObject("MFTransactionDetailstData",  objectMapper.writeValueAsString(MFTransactionDetailstData));
			return mav;
		
	}
	
	//delete transaction details
	
	@RequestMapping(value="/deleteClientMFTransaction.htm",method = RequestMethod.POST)
	public @ResponseBody Map<String,String> deleteClientMFTransaction(HttpServletRequest request,
			HttpServletResponse response) {
		
		Map<String,String> result = new HashMap<String,String>();
		try{
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			int pmTxnId = Integer.parseInt(request.getParameter("pmTxnId"));
			String url = FiinfraUtility.getRestDBURL();
			
			url = url + "services/folio/deleteClientMFTransaction?createdBy="+createdBy+"&buId="+buId+"&pmTxnId="+pmTxnId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			
			BaseResponse<String >resp = restTemplate.postForObject(url, pmTxnId, BaseResponse.class);	
			
			result.put("feedback", "success");
		}catch(Exception e){
			
			result.put("feedback", "error");
		}
		
		return result;
	}
	
	@RequestMapping(value="/getSelectedCMFTransaction.htm",method = RequestMethod.GET)
	public void getSelectedCMFTransaction(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		try {
			//String searchString = request.getParameter("searchString");
			int pmTxnId = Integer.parseInt(request.getParameter("pmTxnId"));
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			//int createdBy = userSession.getUserId();
			int buId = userSession.getBuId();
			String url = FiinfraUtility.getRestDBURL();
			url = url + "services/folio/getSelectedCMFTransaction?buId="+buId+"&pmTxnId="+pmTxnId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			List<MFPortfolioData> contactData = Arrays.asList(restTemplate
					.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
							MFPortfolioData[].class).getBody());
			
			/*Map<String, String> result = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
					Map.class).getBody();*/
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, contactData);
			
		}catch(Exception e) {
			
		}
	}
}
