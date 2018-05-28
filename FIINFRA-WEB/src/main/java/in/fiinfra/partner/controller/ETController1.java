package in.fiinfra.partner.controller;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.diy.models.ConfigurationProductsList;
import in.fiinfra.common.diy.models.ProductPurchaseURLs;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.AssetAllocatedToGoal;
import in.fiinfra.common.partner.AuditData;
import in.fiinfra.common.partner.ContactData;
import in.fiinfra.common.partner.ETData;
import in.fiinfra.common.partner.ETPrePrintedFormData;
import in.fiinfra.common.partner.NotesData;
import in.fiinfra.common.partner.TransactionData;
import in.fiinfra.common.partner.TransactionHistoryData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.MD5Encryption;
import in.fiinfra.common.util.RandomPasswordGenerator;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.util.Logger;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.QueryParam;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping(value = "et/")
public class ETController1 {
	@Autowired
	private RestTemplate restTemplate;
	final String SOURCE_MODEULE = "ET";
	
	@Value("${URL_GET_APPLICANT_NAME_LIST}")
	private String URL_GET_APPLICANT_NAME_LIST;
	
	@Value("${URL_GET_CLIENT_DETAILS_FOR_APPROVEL}")
	private String URL_GET_CLIENT_DETAILS_FOR_APPROVEL;
	
	@Value("${GET_OL_PRODUCT_PURCHASE_URL}")
	private String GET_OL_PRODUCT_PURCHASE_URL;
	
	@Value("${SAVE_ASSET_ALLOCATION_TO_GOAL_URL}")
	private String SAVE_ASSET_ALLOCATION_TO_GOAL_URL;
	
	
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

	@Autowired
	private ObjectMapper objectMapper;
	
	@Autowired
	Md5PasswordEncoder passwordEncoder;

	@RequestMapping(value = "/saveProposedInvestments.htm", method = RequestMethod.POST, consumes = "application/json")
	public void save(HttpServletResponse response, HttpServletRequest request,
			@RequestBody List<ETData> etDataList,
			@QueryParam("fpActionPlanId") int fpActionPlanId) {

		Map<String, String> map = new HashMap<String, String>();
		int createdBy = 0;
		int partnerId = 0;
		int buId = 0;
		int partyId = 0;
		String sectionName = "Proposed Investment";
		try {
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			createdBy = userSession.getUserId();
			partnerId = userSession.getPartyId();
			buId = userSession.getBuId();
			partyId = userSession.getPartyId();
			String url = FiinfraUtility.getRestDBURL();
			// partner and bu id needs to fetch from session
			url = url + "services/et/saveProposedInvestments?buId=" + buId
					+ "&fpActionPlanId=" + fpActionPlanId + "&createdBy="
					+ createdBy;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

			//System.out.println("url::::::" + url);
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String> resp = restTemplate.postForObject(url,
					etDataList, BaseResponse.class);
			//System.out.println("etDataList::::::" + etDataList);
			Logger.logEntry(this.getClass(), "etDataList:---" + etDataList,
					Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());

			map.put("success", "Data saved successfully");
		} catch (Exception e) {
			map.put("error", "System error occured");
		}
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.ET_INVESTMENT_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setObjectName(Integer.toString(fpActionPlanId));
		FrameworkUtil.audit(audit);

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// return map;

	}

	@RequestMapping(value = "/getExecutionStatus.htm", method = RequestMethod.GET)
	public ModelAndView getExecutionStatus(HttpServletRequest request,
			@QueryParam("fpActionPlanId") int fpActionPlanId) {

		String url = FiinfraUtility.getRestDBURL();
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		// partner and bu id needs to fetch from session
		url = url + "services/et/getExecutionStatus?buId=" + buId
				+ "&fpActionPlanId=" + fpActionPlanId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		//System.out.println("url::::::" + url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		ETData etData = restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB), ETData.class).getBody();
		/*System.out.println("................status"
				+ etData.getExecutionStatus());*/
		Logger.logEntry(this.getClass(),
				"status:---" + etData.getExecutionStatus(), Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());
		ModelAndView mav = new ModelAndView("partner/executiontracker_cancel");
		mav.addObject("etData", etData);

		return mav;

	}

	@RequestMapping(value = "/cancelExecution.htm", method = RequestMethod.POST)
	public void cancelExecution(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String cancelComment,
			@QueryParam("fpActionPlanId") int fpActionPlanId) {

		int createdBy = 0;
		int partnerId = 0;
		int buId = 0;
		int partyId = 0;
		String sectionName = "Execution Cancel";

		Map<String, String> map = new HashMap<String, String>();
		try {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			createdBy = userSession.getUserId();
			partnerId = userSession.getPartyId();
			buId = userSession.getBuId();
			partyId = userSession.getPartyId();
			String url = FiinfraUtility.getRestDBURL();
			// partner and bu id needs to fetch from session
			url = url + "services/et/cancelExecution?buId=" + buId
					+ "&fpApActionPlan=" + fpActionPlanId + "&createdBy="
					+ createdBy;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

			//System.out.println("url::::::" + url);
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String> resp = restTemplate.postForObject(url,
					cancelComment, BaseResponse.class);
			//System.out.println("etDataList::::::" + cancelComment);
			Logger.logEntry(this.getClass(), "etDataList:---" + cancelComment,
					Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());

			map.put("success", "Execution is cancelled successfully");
		} catch (Exception e) {
			map.put("error", "System error occured");
		}
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.ET_EXECUTION_CANCELLED);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setObjectName(Integer.toString(fpActionPlanId));
		FrameworkUtil.audit(audit);

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// return map;

	}

	@RequestMapping(value = "/openEtForm.htm", method = RequestMethod.GET)
	public ModelAndView openForm(HttpServletRequest request,
			@QueryParam("fpActionPlanId") int fpActionPlanId) throws JsonGenerationException, JsonMappingException, IOException {

		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();

		// partner and bu id needs to fetch from session
		url = url + "services/et/getPrePrintedFormProducts?buId=" + buId
				+ "&fpActionPlanId=" + fpActionPlanId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		//System.out.println("url::::::" + url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<ETPrePrintedFormData> formList = Arrays.asList(restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
						ETPrePrintedFormData[].class).getBody());

		Logger.logEntry(this.getClass(), "formList:---" + formList,
				Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());

		ModelAndView mav = new ModelAndView("partner/executiontracker_form");
		mav.addObject("etFormList", formList);
		url = FiinfraUtility.getRestDBURL();
		url = url + "services/et/availableEtForms?buId=" + buId
				+ "&fpActionPlanId=" + fpActionPlanId;
		uriCB = UriComponentsBuilder.fromHttpUrl(url);

		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());

		List<ETPrePrintedFormData> avaibaleForms = Arrays.asList(restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
						ETPrePrintedFormData[].class).getBody());
		
		int listSize = avaibaleForms.size();
		mav.addObject("listSize", listSize);
		mav.addObject("avaibaleForms", objectMapper.writeValueAsString(avaibaleForms));

		return mav;
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/loadEtForm.htm", method = RequestMethod.GET)
	public void loadEtForm(HttpServletRequest request,
			@QueryParam("fpExecutionId") int fpExecutionId,
			HttpServletResponse response) {
		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();

		url = url + "services/et/loadEtForm?buId=" + buId + "&fpExecutionId="
				+ fpExecutionId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		//System.out.println("url::::::" + url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		ETPrePrintedFormData etForm = restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB),
				ETPrePrintedFormData.class).getBody();
		//System.out.println("................etForm" + etForm);
		Logger.logEntry(this.getClass(), "etForm:---" + etForm, Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, etForm);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/autoPolpulateEtForm.htm", method = RequestMethod.GET)
	public void autoPolpulateEtForm(HttpServletRequest request,
			@QueryParam("fpActionPlanId") int fpActionPlanId,
			HttpServletResponse response) {
		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();

		url = url + "services/et/autoPolpulateEtForm?buId=" + buId
				+ "&fpActionPlanId=" + fpActionPlanId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		//System.out.println("url::::::" + url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		ETPrePrintedFormData etForm = restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB),
				ETPrePrintedFormData.class).getBody();
		//System.out.println("................etForm" + etForm);
		Logger.logEntry(this.getClass(), "etForm:---" + etForm, Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, etForm);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/saveEtForm.htm", method = RequestMethod.POST)
	public void saveForm(HttpServletRequest request,
			@RequestBody ETPrePrintedFormData etForm,
			@RequestParam("fpExecutionId") int fpExecutionId,
			HttpServletResponse response) {
		Map<String, String> map = new HashMap<String, String>();
		try {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int partnerId = userSession.getPartyId();
			int buId = userSession.getBuId();

			String url = FiinfraUtility.getRestDBURL();
			// partner and bu id needs to fetch from session
			url = url + "services/et/saveEtForm?buId=" + buId
					+ "&fpExecutionId=" + fpExecutionId + "&createdBy="
					+ createdBy;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

			//System.out.println("url::::::" + url);
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> resp = restTemplate.postForObject(url, etForm,
					BaseResponse.class);
			//System.out.println("etForm::::::" + etForm);
			Logger.logEntry(this.getClass(), "etForm:---" + etForm,
					Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());

			map.put("fpExecutionId",resp.getResponseObject().toString());
			map.put("success", "Data saved successfully");
		} catch (Exception e) {
			map.put("error", "System error occured");
			map.put("fpExecutionId", "0");
			e.printStackTrace();
		}
		/*System.out
				.println("holder name........................................"
						+ etForm.getName1());*/

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/generateEtForm.htm", method = RequestMethod.POST)
	public void generateEtForm(HttpServletRequest request,
			@RequestParam("fpExecutionId") int fpExecutionId,
			@RequestParam("fpActionPlanId") int fpActionPlanId,
			HttpServletResponse response) {
		int createdBy = 0;
		int partnerId = 0;
		int buId = 0;
		int partyId = 0;
		String sectionName = "ET PrePrinted Form Generation Request";
		Map<String, String> map = new HashMap<String, String>();
		try {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			createdBy = userSession.getUserId();
			partnerId = userSession.getPartyId();
			buId = userSession.getBuId();
			partyId = userSession.getPartyId();
			String url = FiinfraUtility.getRestDBURL();
			// partner and bu id needs to fetch from session
			url = url + "services/et/generateEtForm?buId=" + buId
					+ "&fpExecutionId=" + fpExecutionId + "&createdbBy="
					+ createdBy;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

			//System.out.println("url::::::" + url);
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String> resp = restTemplate.postForObject(url, null,
					BaseResponse.class);
			Logger.logEntry(this.getClass(), "fpExecutionId:--generateForm-"
					+ fpExecutionId, Logger.DEBUG, Thread.currentThread()
					.getStackTrace()[1].getMethodName());

			map.put("success",
					"Form generation request has been made successfully");
		} catch (Exception e) {
			map.put("error", "System error occured");
			e.printStackTrace();
		}
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.ET_PREPRINTED_FORM_GENERATION);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setObjectName(Integer.toString(fpActionPlanId));
		audit.setProgamNo(Integer.toString(fpExecutionId));
		FrameworkUtil.audit(audit);

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/loadProductsForManufacturer.htm", method = RequestMethod.GET)
	public void loadProductsForManufacturer(HttpServletRequest request,
			@QueryParam("manufacturerCode") int manufacturerCode,
			HttpServletResponse response) {
		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		// partner and bu id needs to fetch from session
		url = url + "services/et/loadProductsForManufacturer?buId=" + buId
				+ "&manufacturerCode=" + manufacturerCode;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		//System.out.println("url::::::" + url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		Map products = restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB), Map.class).getBody();
		//System.out.println("................products" + products);
		Logger.logEntry(this.getClass(), "products:---" + products,
				Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, products);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/etDocs.htm", method = RequestMethod.GET)
	public ModelAndView getAllEtDocuments(
			@QueryParam("fpActionPlanId") int fpActionPlanId,
			HttpServletResponse response, HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {
		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();

		url = url + "services/et/etDocs?buId=" + buId + "&fpActionPlanId="
				+ fpActionPlanId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		//System.out.println("url::::::" + url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<DocumentData> docs = Arrays.asList(restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB), DocumentData[].class)
				.getBody());
		// System.out.println("................docs"+docs.get(0).getFileName());
		Logger.logEntry(this.getClass(), "docs:---" + docs, Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());

		ModelAndView mav = new ModelAndView("partner/executiontracker_doc");
		mav.addObject("docs", objectMapper.writeValueAsString(docs));
		return mav;

	}

	@RequestMapping(value = "/etNotes.htm", method = RequestMethod.GET)
	public ModelAndView getEtNotes(
			@QueryParam("fpActionPlanId") int fpActionPlanId,
			HttpServletResponse response, HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {
		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();

		url = url + "services/et/etNotes?buId=" + buId + "&fpActionPlanId="
				+ fpActionPlanId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		//System.out.println("url::::::" + url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<NotesData> notes = Arrays.asList(restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB), NotesData[].class)
				.getBody());
		//System.out.println("................notes" + notes);
		Logger.logEntry(this.getClass(), "notes:---" + notes, Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());

		ModelAndView mav = new ModelAndView("partner/executiontracker_notes");
		mav.addObject("notes", objectMapper.writeValueAsString(notes));
		return mav;

	}

	@RequestMapping(value = "/saveEtNote.htm", method = RequestMethod.POST)
	public void saveEtNote(@QueryParam("fpActionPlanId") int fpActionPlanId,
			@QueryParam("noteId") int noteId, HttpServletResponse response,
			HttpServletRequest request) {
		String url = FiinfraUtility.getRestDBURL();
		Map<String, String> map = new HashMap<String, String>();
		try {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int partnerId = userSession.getPartyId();
			int buId = userSession.getBuId();

			url = url + "services/et/saveEtNote?buId=" + buId
					+ "&fpActionPlanId=" + fpActionPlanId + "&noteId=" + noteId
					+ "&createdBy=" + createdBy;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			String noteText = request.getParameter("noteText");
			//System.out.println("noteTextnoteTextnoteText::" + noteText);
			Logger.logEntry(this.getClass(), "noteText:---" + noteText,
					Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String> resp = restTemplate.postForObject(url,
					noteText, BaseResponse.class);

			map.put("success", "Note added Successfully");
		} catch (Exception e) {
			map.put("error", "System error occured");
			e.printStackTrace();
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/deleteEtNotes.htm", method = RequestMethod.POST)
	public void deleteEtNotes(@QueryParam("noteIds") String noteIds,
			HttpServletResponse response, HttpServletRequest request) {
		String url = FiinfraUtility.getRestDBURL();
		Map<String, String> map = new HashMap<String, String>();
		try {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int partnerId = userSession.getPartyId();
			int buId = userSession.getBuId();

			url = url + "services/et/deleteEtNotes?buId=" + buId + "&noteIds="
					+ noteIds;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			//System.out.println("noteIds::" + noteIds);
			Logger.logEntry(this.getClass(), "noteIds:---" + noteIds,
					Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String> resp = restTemplate.postForObject(url, null,
					BaseResponse.class);

			map.put("success", "Notes deleted Successfully");
		} catch (Exception e) {
			map.put("error", "System error occured");
			e.printStackTrace();
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/uploadDoc.htm", method = RequestMethod.POST)
	public void uploadDoc(@QueryParam("fpActionPlanId") int fpActionPlanId,
			MultipartHttpServletRequest request, HttpServletResponse response) {

		DocumentData doc = new DocumentData();
		List<DocumentData> docs = new ArrayList<DocumentData>();
		Iterator<String> itr = request.getFileNames();
		Map<String, MultipartFile> fileMap = request.getFileMap();
		List<MultipartFile> multipartFiles = new ArrayList<MultipartFile>();
		while (itr.hasNext()) {
			//System.out.println("........");
			String fileName = itr.next();
			multipartFiles.add(request.getFile(fileName));
		}

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();

		long currentTime = new Date().getTime();
		MultipartFile[] m = multipartFiles
				.toArray(new MultipartFile[multipartFiles.size()]);

		docs = FiinfraUtility.getDocumentDatasFromMultiPartFiles(m,
				currentTime, createdBy);
		String result = "";
		if (docs == null) {
			result = "Attachment size greater than "
					+ FiinfraConstants.MAX_FILE_SIZE + " kb is not allowed.";
		} else {
			//System.out.println("doc:--" + doc);
		}

		String url = FiinfraUtility.getRestDBURL();
		Map<String, String> map = new HashMap<String, String>();
		try {
			// partner and bu id needs to fetch from session

			url = url + "services/et/uploadDoc?buId=" + buId
					+ "&fpActionPlanId=" + fpActionPlanId + "&createdBy="
					+ createdBy;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse resp = restTemplate.postForObject(url, docs,
					BaseResponse.class);

			result = FiinfraUtility.uploadAttachments(m, resp
					.getResponseObject().toString(), currentTime);

			/*System.out.println("resp:::::::::::::::::"
					+ resp.getResponseObject().toString());*/
			map.put("success", "Documents added successfully");
		} catch (Exception e) {
			map.put("error", "System error occured");
			e.printStackTrace();
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/deleteEtDocs.htm", method = RequestMethod.POST)
	public void deleteEtDocs(@QueryParam("docIds") String docIds,
			HttpServletResponse response, HttpServletRequest request) {
		String url = FiinfraUtility.getRestDBURL();
		Map<String, String> map = new HashMap<String, String>();
		try {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int partnerId = userSession.getPartyId();
			int buId = userSession.getBuId();

			url = url + "services/et/deleteEtDocs?buId=" + buId + "&docIds="
					+ docIds;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			//System.out.println("docIds::" + docIds);
			Logger.logEntry(this.getClass(), "docIds:---" + docIds,
					Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<String> resp = restTemplate.postForObject(url, null,
					BaseResponse.class);

			FiinfraUtility.deleteDocs(resp.getResponseObject());
			map.put("success", "Docs deleted Successfully");
		} catch (Exception e) {
			map.put("error", "System error occured");
			e.printStackTrace();
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/getTxnSource.htm", method = RequestMethod.GET)
	public ModelAndView getTxnSource(@QueryParam("docIds") String docIds,
			HttpServletResponse response, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView(
				"partner/executiontracker_bulkupload");

		return mav;
	}

	@RequestMapping(value = "/bulkUploadTxn.htm", method = RequestMethod.POST)
	public void bulkUploadTxn(MultipartHttpServletRequest request,
			HttpServletResponse response,
			@QueryParam("txnSourceId") int txnSourceId,
			@QueryParam("fileType") int fileTypeId) {

		List<DocumentData> docs = new ArrayList<DocumentData>();
		Iterator<String> itr = request.getFileNames();
		//Map<String, MultipartFile> fileMap = request.getFileMap();
		List<MultipartFile> multipartFiles = new ArrayList<MultipartFile>();
		while (itr.hasNext()) {
			//System.out.println("........");
			String fileName = itr.next();
			multipartFiles.add(request.getFile(fileName));
		}

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		int nodeId = 0;
		
		long currentTime = new Date().getTime();
		MultipartFile[] m = multipartFiles
				.toArray(new MultipartFile[multipartFiles.size()]);

		docs = FiinfraUtility.getDocumentDatasFromMultiPartFiles(m,
				currentTime, createdBy);
		String result = "";
		Map<String, String> map = new HashMap<String, String>();
		if (docs == null) {
			result = "Attachment size greater than "
					+ FiinfraConstants.MAX_FILE_SIZE + " kb is not allowed.";
		} else {

			for (MultipartFile f : m) {
				if (f.getOriginalFilename() != null
						&& !f.getOriginalFilename().equals("")) {
					String fileName = null;
					String extension = null;
					fileName = f.getOriginalFilename().substring(0,
							f.getOriginalFilename().lastIndexOf("."));
					extension = f.getOriginalFilename().substring(
							f.getOriginalFilename().lastIndexOf("."));
					System.out.println("File name is :--" + fileName);
					System.out.println("extension is:--" + extension);
					System.out.println("filename to set:---" + fileName + "_"+ currentTime + extension);
					fileName = fileName.replace(" ","") + "_" + currentTime + extension;
					String basePath="D:\\FTP\\Temp";
					String filePath = basePath + "\\" + fileName;
					File baseFolder = new File(basePath);
					File fileToUpload = new File(filePath);
					if (baseFolder.exists()) {

					} else {
						baseFolder.mkdirs();// creates directory
					}
					try {
						f.transferTo(fileToUpload);
						//get mandatory column for this file
						String url = FiinfraUtility.getRestDBURL();
						/*url = url + "services/et/getRTAFileMandatoryColumnList?buId=" + buId
								+ "&partnerId=" + partnerId	+ "&nodeId=" + nodeId +"&sourceTypeId="+txnSourceId+"&fileTypeId="+fileTypeId;
						UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);


						List<ContactData> contactData = Arrays.asList(restTemplate
								.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
										ContactData[].class).getBody());
						mav.addObject("contactData", contactData);*/
						
						ArrayList<String> columnList = new ArrayList<String>();
						columnList.add("amc_code");
						columnList.add("folio_no");
						ArrayList<String> fileColumnList = new ArrayList<String>();
						int numOfSheets = 0;
						
						if(extension.equals(".xls")||extension.equals(".xlsx")){
							jxl.Workbook workbook = jxl.Workbook.getWorkbook(fileToUpload);
						 
							jxl.Sheet sheet=workbook.getSheet(numOfSheets);
							for (int j = 0; j < sheet.getColumns(); j++) {
								
								for (int i = 0; i < 1; i++) {
									jxl.Cell cell = sheet.getCell(j,i);
									jxl.CellType type = cell.getType();
									if (type == jxl.CellType.LABEL) {
							            System.out.println("I got a label " + cell.getContents());
										//if(columnList.contains(cell.getContents())){
											//System.out.println("Items Present:"+cell.getContents());
											fileColumnList.add(cell.getContents());
										//}
											/*else{
											System.out.println("Bad file");
											result = cell.getContents();
											map.put("error", "Missing some Mandatory column"+result);
											break outerloop;
										//}*/
							          }
								}
							}
						
						}
						if(extension.equals(".dbf")){
							System.out.println("Dbf related code goes here");
						}
						System.out.println(columnList.size());
						System.out.println(fileColumnList.size());
						outerloop:
						for (String s : columnList){
							if (fileColumnList.contains(s)){
								System.out.println(s);
								System.out.println("Column Present..");
								result="success";
							}else{
								System.out.println("Column not Present..");
								result="fail";
								break outerloop;
							}
						}
						
						System.out.println("Final Result: "+result);
						
					} catch (Exception e) {
						e.printStackTrace();
						// logger.error(e.getMessage());
					}
					
				}
			}
			
			
			
		}

		String url = FiinfraUtility.getRestDBURL();
		
		try {
			// partner and bu id needs to fetch from session

			url = url + "services/et/bulkUploadTxn?buId=" + buId
					+ "&createdBy=" + partnerId + "&txnSourceId=" + txnSourceId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse resp = restTemplate.postForObject(url, docs,
					BaseResponse.class);

			result = FiinfraUtility.uploadAttachments(m, resp
					.getResponseObject().toString(), currentTime);

			
			map.put("success",
					"The uploaded files processing request has been submitted and will be processed shortly. You will receive an email notification when its completed. On receiving notification,  visit the Upload History screen for reviewing the results.");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("error", "System error occured");
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	/*public static byte[] getBytes(InputStream is) throws IOException {
	    ByteArrayOutputStream buffer = new ByteArrayOutputStream();

	    int len;
	    byte[] data = new byte[100000];
	    while ((len = is.read(data, 0, data.length)) != -1) {
	    buffer.write(data, 0, len);
	    }

	    buffer.flush();
	    return buffer.toByteArray();
	}*/
	
	@RequestMapping(value = "/showuploadhistory.htm", method = RequestMethod.GET)
	public ModelAndView showUploadHistory(HttpServletResponse response,
			HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {

		String url = FiinfraUtility.getRestDBURL();
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getPartyId();
		int buId = userSession.getBuId();
		url = url + "services/et/bulkUploadTxnHistory?buId=" + buId
				+ "&createdBy=" + createdBy;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		List<TransactionData> txns = Arrays.asList(restTemplate.getForEntity(
				url, TransactionData[].class, BaseResponse.class).getBody());

		ModelAndView mv = new ModelAndView(
				"partner/executiontracker_uploadhistory");
		mv.addObject("txns", objectMapper.writeValueAsString(txns));
		
		return mv;
	}

	@RequestMapping(value = "/updateEtClientApproval.htm", method = RequestMethod.POST)
	public void updateEtClientApproval(
			@QueryParam("fpExecutionId") int fpExecutionId,
			@RequestParam("fpActionPlanId") int fpActionPlanId,
			HttpServletResponse response, HttpServletRequest request,
			@QueryParam("partyId") int partyId) throws JsonGenerationException, JsonMappingException, IOException {
		String url = FiinfraUtility.getRestDBURL();

		int createdBy = 0;
		int partnerId = 0;
		int buId = 0;
		String sectionName = "ET_ClientApprovalStatusUpdate";
		Map<String, String> map = new HashMap<String, String>();
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		try {

			
			createdBy = userSession.getUserId();
			partnerId = userSession.getPartyId();
			buId = userSession.getBuId();

			url = url + "services/et/updateEtClientApproval?buId=" + buId
					+ "&fpExecutionId=" + fpExecutionId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			//System.out.println("fpExecutionId::" + fpExecutionId);
			Logger.logEntry(this.getClass(), "fpExecutionId:---"
					+ fpExecutionId, Logger.DEBUG, Thread.currentThread()
					.getStackTrace()[1].getMethodName());
			BaseResponse<String> resp = restTemplate.postForObject(url, null,
					BaseResponse.class);

			map.put("success", "Status Updated");
		} catch (Exception e) {
			map.put("error", "System error occured");
			e.printStackTrace();
		}
		
		Audit audit = new Audit();
		audit.setActionByPartyId(partnerId);
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.ET_CLIENT_APPROVAL_STATUS_UPDATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODEULE);
		audit.setSourceScreen(sectionName);
		audit.setObjectName(Integer.toString(fpActionPlanId));
		FrameworkUtil.audit(audit);
		
		Map<String,String> payloadMap=new HashMap<String, String>();
		
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}
		
		
		ETData data = new ETData();
		data.setFpExecutionId(fpExecutionId);
		data.setBuId(buId);
		
		
		BaseResponse<ETData> br1 = new BaseResponse<ETData>();
		url = URL_GET_CLIENT_DETAILS_FOR_APPROVEL + userToken + "/1234";
		br1 = restTemplate.postForObject(url, data, BaseResponse.class);
		List<ETData> recList = new ArrayList<ETData>();
		if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recList = br1.getResponseListObject();
		
		/*
		System.out.println(recList.get(0));
		String productName = etproduct.getProductName();
		System.out.println(productName);*/
		
		//get purchase product urls
		String token = "12345";									
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_OL_PRODUCT_PURCHASE_URL + "/" + userSession.getUserName() + "/" + token);
		uriCB.queryParam("partnerPartyId", userSession.getPartyId());		
		uriCB.queryParam("executionId", fpExecutionId);
		uriCB.queryParam("productsId", "");
		uriCB.queryParam("settingTypeID", 146003);//purchase MF
		BaseResponse<ProductPurchaseURLs> br = new BaseResponse<ProductPurchaseURLs>();
		br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		List<ProductPurchaseURLs> URLjson = new ArrayList<>();
		List<ProductPurchaseURLs> productsURLs = new ArrayList<>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			URLjson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), List.class);
			for (int i=0;i<URLjson.size();++i) {
				productsURLs.add(objectMapper.readValue(objectMapper.writeValueAsString(URLjson.get(i)), ProductPurchaseURLs.class));
			}
		}
		
		String purchaseURL=null;
		
		for (ProductPurchaseURLs productPurchaseURLs : productsURLs) {
			if(productPurchaseURLs.getIsURLPresent()==1){
				purchaseURL = productPurchaseURLs.getUrl();
			}
		}
		ObjectMapper mapper = new CustomJacksonObjectMapper();
		String jsonSuccessString=mapper.writeValueAsString(recList);
		recList = mapper.readValue(jsonSuccessString, mapper.getTypeFactory().constructCollectionType(List.class, ETData.class));
		
		int noOfCAPSAlpha = 1;
		int noOfDigits = 1;
		int noOfSplChars = 1;
		int minLen = 8;
		int maxLen = 15;
		String hexString = null;
		char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
				noOfCAPSAlpha, noOfDigits, noOfSplChars);
		hexString = new String(pswd);
		
		MD5Encryption md5Encryption = new MD5Encryption();
		//String encryptrdPassword = md5Encryption.encrypt(hexString);
		String encryptrdPassword = passwordEncoder.encodePassword(hexString, null);
		
		String productName = recList.get(0).getProductName();
		String sipFrequency = recList.get(0).getFrequency();
		String sipAmount = recList.get(0).getTotalSIPAmont();
		String goalName = recList.get(0).getGoalName();
		String goalType = recList.get(0).getGoalType();
		//payloadMap.put("Client.Name","shree");
		payloadMap.put("Goal.GoalType", goalType);
		payloadMap.put("Goal.Name", goalName);
		payloadMap.put("ET.SIPAmount", sipAmount);
		payloadMap.put("ET.SIPFrequency", sipFrequency);
		payloadMap.put("ET.ProductName", productName);
		payloadMap.put("temporaryPassword", encryptrdPassword);
		if(purchaseURL != null){
			payloadMap.put("purchase", "To purchase product please <a href=\""+purchaseURL+"\">click here</a>");
//			payloadMap.put("purchaseURL", purchaseURL);
		}
		else{
			payloadMap.put("purchase", "");
//			payloadMap.put("purchaseURL", "");
		}
		//payloadMap.put("BusinessUnit.LandingURL", "testurl");
		
		Notification notification = new Notification();
		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(partyId);
		notification
				.setNotifyEventID(FiinfraConstants.EXECUTION_APPROVAL_TO_CLIENT);
		notification.setBuId(buId);

		notification.setPayloadMap(payloadMap);
		notification.setSessionID(request.getSession().getId());
		notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
		FrameworkUtil.notify(notification);

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/etTrackingHistory.htm", method = RequestMethod.GET)
	public ModelAndView getEtTrackingHistory(
			@QueryParam("fpActionPlanId") int fpActionPlanId,
			HttpServletResponse response, HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {
		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();

		url = url + "services/et/getEtTrackingHistory?buId=" + buId
				+ "&fpActionPlanId=" + fpActionPlanId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		//System.out.println("url::::::" + url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<AuditData> auditList = Arrays.asList(restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB), AuditData[].class)
				.getBody());
		// System.out.println("................AuditData"+auditList.get(0).getActionBy());
		Logger.logEntry(this.getClass(), "auditList:---" + auditList,
				Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());

		ModelAndView mav = new ModelAndView("partner/executiontracker_history");
		mav.addObject("auditList", objectMapper.writeValueAsString(auditList));
		return mav;

	}

	@RequestMapping(value = "loadfoliodetails.htm", method = RequestMethod.GET)
	public void loadFolioDetails(HttpServletRequest request,
			@QueryParam("folioId") String folioId, HttpServletResponse response) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();

		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/et/loadfoliodetails?buId=" + buId + "&folioId="
				+ folioId;

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		ResponseEntity<ETPrePrintedFormData> responseEntity = restTemplate
				.getForEntity(url, ETPrePrintedFormData.class);
		ETPrePrintedFormData form = responseEntity.getBody();
		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, form);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "getbulkuploaderrorcount.htm", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	Object[] viewErrorCount(HttpServletRequest request,
			@QueryParam("queueId") Integer queueId) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();

		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/et/getbulkuploaderrorcount?buId=" + buId
				+ "&queueId=" + queueId;

		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		url = FiinfraUtility.getURLWithParams(uriCB);
		Object[] responseEntity = restTemplate
				.getForEntity(url, Object[].class).getBody();
		return responseEntity;
	}

	@RequestMapping(value = "getbulkuploadtransactiohistorydetails.htm", method = RequestMethod.GET)
	public ModelAndView getBulkUploadTransactionHistoryDetails(
			HttpServletRequest request, HttpServletResponse response,
			@QueryParam("queueId") Integer queueId) throws Exception {
		ModelAndView mv = new ModelAndView(
				"partner/executiontracker_uploadhistorydetails");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int patnerId = userSession.getPartyId();

		String url = FiinfraUtility.getRestDBURL();
		url = url + "services/et/getbulkuploadtransactiohistorydetails?buId="
				+ buId + "&queueId=" + queueId + "&patnerId=" + patnerId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		TransactionHistoryData[] result = restTemplate.getForEntity(
				FiinfraUtility.getURLWithParams(uriCB),
				TransactionHistoryData[].class).getBody();
		//mv.addObject("transactionHistoryData", Arrays.asList(result));
		mv.addObject("transactionHistoryData",objectMapper.writeValueAsString(result));
		return mv;
	}

	@RequestMapping(value = "requestforreprocess.htm", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	Map<String, String> requestForReporcess(HttpServletRequest request,
			@QueryParam("queueId") Integer queueId) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId = userSession.getBuId();
			int createdBy = userSession.getUserId();

			String url = FiinfraUtility.getRestDBURL();
			url = url + "services/et/requestforreprocess?createdBy="
					+ createdBy + "&queueId=" + queueId + "&buId=" + buId;

			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			// String responseEntity =
			// restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),String.class).getBody();

			BaseResponse<String> resp = restTemplate.postForObject(url, null,
					BaseResponse.class);

			map.put("success", "Batch will be reprocessed shortly");
		} catch (Exception e) {
			map.put("error", "System error occured");
			e.printStackTrace();
		}
		return map;
	}

	/* @RequestMapping(value="loadfoliodetails.htm",method=RequestMethod.GET,produces="application/json")
	   public @ResponseBody ETPrePrintedFormData
	   loadFolioDetails(HttpServletRequest request ,
	   @QueryParam("folioId")String folioId,HttpServletResponse response){
	   UserSession userSession = (UserSession) request.getSession()
	  .getAttribute("userSession");
	  int buId = userSession.getBuId();
	 
	  String url = FiinfraUtility.getRestDBURL();
	  url = url +
	  "services/et/loadfoliodetails?buId="+buId+"&folioId="+folioId;
	
	  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	  Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
	  .currentThread().getStackTrace()[1].getMethodName());
	  ResponseEntity<ETPrePrintedFormData> responseEntity =
	  restTemplate.getForEntity(url, ETPrePrintedFormData.class);
	  ETPrePrintedFormData form = responseEntity.getBody();
	  response.setContentType("application/json");
	  return form;
	 }*/
	 
	@RequestMapping(value = "getServiceOrder.htm", method = RequestMethod.GET)
	public ModelAndView getServiceOrder(HttpServletRequest request,
			HttpServletResponse response, @QueryParam("queueId") Integer queueId)
			throws Exception {
		ModelAndView mv = new ModelAndView("partner/service_order");
		return mv;
	}
	
	@RequestMapping(value = "getApplicantDetails.htm", method = RequestMethod.GET)
	public void getApplicantDetails(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int buId = userSession.getBuId();
		int userId = userSession.getUserId();
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}
		
		int actionPlanId = Integer.parseInt(request.getParameter("actionPlanId"));
		int partyId = 0;
		if (request.getParameterMap().containsKey("partyId")) {
			partyId = Integer.parseInt(request.getParameter("partyId"));
		}
		

		ETPrePrintedFormData data = new ETPrePrintedFormData();
		data.setFpExecutionId(actionPlanId);
		data.setBuId(buId);
		data.setPartyId(partyId);
		String url;
		
		BaseResponse<ETPrePrintedFormData> br1 = new BaseResponse<ETPrePrintedFormData>();
		url = URL_GET_APPLICANT_NAME_LIST + userToken + "/1234";
		br1 = restTemplate.postForObject(url, data, BaseResponse.class);
		List<ETPrePrintedFormData> recList = new ArrayList<ETPrePrintedFormData>();
		if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recList = br1.getResponseListObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recList);
	}
	
	@RequestMapping(value = "sendEmail.htm", method = RequestMethod.GET)
	public void sendEmail(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int buId = userSession.getBuId();
		/*String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}*/
		
		int docId = Integer.parseInt(request.getParameter("docId"));
	
		int partyId = Integer.parseInt(request.getParameter("partyId"));
		
		Notification notification=null;
		notification=new Notification();
		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(partyId);
		notification.setNotifyEventID(FiinfraConstants.SEND_PREPRINTED_FORM);
		notification.setBuId(buId);
		notification.setAttachment1DocumentID(docId);
		notification.setSessionID(request.getSession().getId());
		FrameworkUtil.notify(notification);	
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, FiinfraConstants.SUCCESS);
		
	}
	

	@RequestMapping(value = "/loadPrePrintedFormToGenerate.htm", method = RequestMethod.GET)
	public ModelAndView loadPrePrintedFormToGenerate(HttpServletRequest request,
			@QueryParam("fpActionPlanId") int fpActionPlanId) {

		ModelAndView mav = new ModelAndView("partner/PortFolioPrePrintedForm");

		return mav;
	}
	
	
		
	@SuppressWarnings("unused")
	@RequestMapping(value = "/loadAvailablePrePrintedForms.htm", method = RequestMethod.GET)
	public ModelAndView loadAvailablePrePrintedForms(
			HttpServletRequest request,
			@QueryParam("clientPartyId") int clientPartyId) throws JsonGenerationException, JsonMappingException, IOException {

		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdby = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		String quickSearchHidden = request.getParameter("quickSearchHidden");
		request.setAttribute("quickSearchHidden",quickSearchHidden);
		String ownerPartyId = request.getParameter("ownerPartyId");
		// partner and bu id needs to fetch from session
		url = url + "services/et/loadAvailablePrePrintedForms?buId=" + buId
				+ "&clientPartyId=" + clientPartyId+"&ownerPartyId="+ownerPartyId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<ETPrePrintedFormData> formList = Arrays.asList(restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
						ETPrePrintedFormData[].class).getBody());

		Logger.logEntry(this.getClass(), "formList:---" + formList,
				Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());

		
		ModelAndView mav = new ModelAndView("partner/PortFolioPrePrintedFormList");
		int listSize = formList.size();
		mav.addObject("listSize", listSize);
		mav.addObject("formList",  objectMapper.writeValueAsString(formList));
		return mav;
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/loadClientsAvailablePrePrintedForms.htm", method = RequestMethod.GET)
	public void loadClientsAvailablePrePrintedForms(HttpServletRequest request,HttpServletResponse response,
			@QueryParam("clientPartyId") int clientPartyId) throws IOException {

		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdby = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();

		// partner and bu id needs to fetch from session
		url = url + "services/et/loadAvailablePrePrintedForms?buId=" + buId
				+ "&clientPartyId=" + clientPartyId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<ETPrePrintedFormData> formList = Arrays.asList(restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
						ETPrePrintedFormData[].class).getBody());

		Logger.logEntry(this.getClass(), "formList:---" + formList,
				Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, formList);
	}
	
	
	@SuppressWarnings({ "unused" })
	@RequestMapping(value = "/loadMutualFundProduct.htm", method = RequestMethod.GET)
	public void loadMutualFundProduct(HttpServletRequest request,
			@QueryParam("searchStr") String searchStr,
			HttpServletResponse response) {
		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();

		url = url + "services/et/loadMutualFundProduct?buId=" + buId + "&searchStr="
				+ searchStr;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
	
		
		List<ETPrePrintedFormData> formList = Arrays.asList(restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
						ETPrePrintedFormData[].class).getBody());
	
		
		Logger.logEntry(this.getClass(), "etForm:---" + formList, Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());

		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, formList);
		} catch (IOException e) {
		}

	}
	

	@SuppressWarnings("unused")
	 @RequestMapping(value = "/loadPortFolioPrePrintedForm.htm", method = RequestMethod.GET)
	 public void loadPortFolioPrePrintedForm(HttpServletRequest request,
	   @QueryParam("productid") int productid,@QueryParam("clientPartyId") int clientPartyId,
	   HttpServletResponse response) {
	  String url = FiinfraUtility.getRestDBURL();

	  UserSession userSession = (UserSession) request.getSession()
	    .getAttribute("userSession");
	  int createdBy = userSession.getUserId();
	  int partnerId = userSession.getPartyId();
	  int buId = userSession.getBuId();

	  url = url + "services/et/loadPortFolioPrePrintedForm?buId=" + buId + "&productid="
	    + productid+"&clientPartyId="+clientPartyId;
	  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

	  Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
	    .currentThread().getStackTrace()[1].getMethodName());
	  ETPrePrintedFormData etForm = restTemplate.getForEntity(
	    FiinfraUtility.getURLWithParams(uriCB),
	    ETPrePrintedFormData.class).getBody();
	  Logger.logEntry(this.getClass(), "etForm:---" + etForm, Logger.DEBUG,
	    Thread.currentThread().getStackTrace()[1].getMethodName());

	  PrintWriter out = null;
	  try {
	   out = response.getWriter();
	   response.setContentType("application/json");
	   objectMapper.writeValue(out, etForm);
	  } catch (IOException e) {
	   e.printStackTrace();
	  }

	 }
	
	

	@SuppressWarnings("unused")
	public void loadPrePrintedForm(HttpServletRequest request,
			@QueryParam("fpActionPlanId") int fpActionPlanId,
			HttpServletResponse response) throws InterruptedException {
		// wait 15 secs
		Thread.sleep(15000);
		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();

		url = url + "services/et/availableEtForms?buId=" + buId
				+ "&fpActionPlanId=" + fpActionPlanId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		List<ETPrePrintedFormData> avaibaleForms = Arrays.asList(restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
						ETPrePrintedFormData[].class).getBody());
		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, avaibaleForms);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	@SuppressWarnings("unused")
	@RequestMapping(value = "/assetAutoAllocation.htm", method = RequestMethod.GET)
	public ModelAndView assetAutoAllocation(
			HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException, InterruptedException {

		Thread.sleep(15000);
		String url = FiinfraUtility.getRestDBURL();

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());

		// partner and bu id needs to fetch from session
		url = url + "services/et/assetAutoAllocation?partnerId=" + partnerId
				+ "&nodeId="+nodeId+"&buId="+buId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());
		List<AssetAllocatedToGoal> formList = Arrays.asList(restTemplate
				.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
						AssetAllocatedToGoal[].class).getBody());

		Logger.logEntry(this.getClass(), "formList:---" + formList,
				Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());

		
		ModelAndView mav = new ModelAndView("partner/AssetAutoAllocation");
		int listSize = formList.size();
		mav.addObject("listSize", listSize);
		mav.addObject("assetAutoAllocation",  objectMapper.writeValueAsString(formList));
		return mav;
	}

	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/deleteAsset.htm", method = RequestMethod.POST)
	public void deleteAsset(@QueryParam("goalAssetId") String goalAssetId,
			HttpServletResponse response, HttpServletRequest request) {
		String url = FiinfraUtility.getRestDBURL();
		Map<String, String> map = new HashMap<String, String>();
		PrintWriter out = null;
		try {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int createdBy = userSession.getUserId();
			int partnerId = userSession.getPartyId();
			int buId = userSession.getBuId();

			url = url + "services/et/deleteAsset?buId=" + buId + "&goalAssetId="
					+ goalAssetId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			Logger.logEntry(this.getClass(), "goalAssetId:---" + goalAssetId,
					Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			@SuppressWarnings("unchecked")
			BaseResponse<String> resp = restTemplate.postForObject(url, null,
					BaseResponse.class);

					out = response.getWriter();
					response.setContentType("application/json");
					objectMapper.writeValue(out, FiinfraConstants.success);
		} catch (Exception e) {
			try {
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, FiinfraConstants.error);
				e.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}

	}
	@SuppressWarnings("unused")
	@RequestMapping(value = "/confirmAsset.htm", method = RequestMethod.POST)
	public void confirmAsset(@QueryParam("goalAssetId") String goalAssetId,
			HttpServletResponse response, HttpServletRequest request) {
		String url = FiinfraUtility.getRestDBURL();
		Map<String, String> map = new HashMap<String, String>();
		PrintWriter out = null;
		try {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int userId = userSession.getUserId();
			int partnerId = userSession.getPartyId();
			int buId = userSession.getBuId();

			url = url + "services/et/confirmAsset?buId=" + buId + "&goalAssetId="
					+ goalAssetId+"&userId="+userId;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			Logger.logEntry(this.getClass(), "goalAssetId:---" + goalAssetId,
					Logger.DEBUG,
					Thread.currentThread().getStackTrace()[1].getMethodName());
			@SuppressWarnings("unchecked")
			BaseResponse<String> resp = restTemplate.postForObject(url, null,
					BaseResponse.class);

					out = response.getWriter();
					response.setContentType("application/json");
					objectMapper.writeValue(out, FiinfraConstants.success);
		} catch (Exception e) {
			try {
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, FiinfraConstants.error);
				e.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}

	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/assetAutoAllocationDetailsWhileEdit.htm", method = RequestMethod.GET)
	public void assetAutoAllocationDetailsWhileEdit(@QueryParam("goalAssetId") String goalAssetId,
			HttpServletResponse response, HttpServletRequest request) {
		  String url = FiinfraUtility.getRestDBURL();

		  UserSession userSession = (UserSession) request.getSession()
		    .getAttribute("userSession");
		  int createdBy = userSession.getUserId();
		  int partnerId = userSession.getPartyId();
		  int buId = userSession.getBuId();

		  url = url + "services/et/assetAutoAllocationDetailsWhileEdit?buId=" + buId + "&goalAssetId="
		    + goalAssetId;
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

		  Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
		    .currentThread().getStackTrace()[1].getMethodName());
		  AssetAllocatedToGoal assetAllocatedToGoal = restTemplate.getForEntity(
		    FiinfraUtility.getURLWithParams(uriCB),
		    AssetAllocatedToGoal.class).getBody();
		  Logger.logEntry(this.getClass(), "assetAllocatedToGoal::" + assetAllocatedToGoal, Logger.DEBUG,
		    Thread.currentThread().getStackTrace()[1].getMethodName());

		  PrintWriter out = null;
		  try {
		   out = response.getWriter();
		   response.setContentType("application/json");
		   objectMapper.writeValue(out, assetAllocatedToGoal);
		  } catch (IOException e) {
		   e.printStackTrace();
		  }

		 }
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/saveAssetsAllocatedToGoal.htm", method = {RequestMethod.POST})
	public void saveAssetsAllocatedToGoal(Model model,HttpServletRequest request, HttpServletResponse response, final RedirectAttributes redirectAttributes) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		    PrintWriter out = null;
			String userName = userSession.getUserName();
			Integer userId = userSession.getUserId();
			Integer token = 123;
			Integer buId = userSession.getBuId();
		
			String partyId = request.getParameter("partyId");
			String goalId = request.getParameter("goalId");
			String currentValue = request.getParameter("currentValue");
			String partyAssetId = request.getParameter("partyAssetId");
			String availableValue = request.getParameter("availableValue");
		
		AssetAllocatedToGoal allocatedToGoal = new AssetAllocatedToGoal();
		List<AssetAllocatedToGoal> allocatedToGoalList = new ArrayList<AssetAllocatedToGoal>();
			    allocatedToGoal = new AssetAllocatedToGoal();
				allocatedToGoal.setPartyId(partyId);
				allocatedToGoal.setGoalId(goalId);
				allocatedToGoal.setUserId(""+userId);
				allocatedToGoal.setAssetTypeId("0");
				allocatedToGoal.setPartyAssetId(partyAssetId);
				allocatedToGoal.setAllocatedAmount(currentValue);
				allocatedToGoal.setAllocatedPercent("0");
				allocatedToGoal.setAvailableValue(availableValue);
			    allocatedToGoalList.add(allocatedToGoal);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(SAVE_ASSET_ALLOCATION_TO_GOAL_URL + "/" + userName + "/" + token+"?buId="+buId);;
		
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		// post the object to service
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), allocatedToGoalList, BaseResponse.class);
	 try {
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			   out = response.getWriter();
			   response.setContentType("application/json");
				objectMapper.writeValue(out, FiinfraConstants.success);
		   }else{
			   out = response.getWriter();
			   response.setContentType("application/json");
			   objectMapper.writeValue(out, FiinfraConstants.error);
		   }
	  } catch (IOException e) {
		  try {
			   out = response.getWriter();
			   response.setContentType("application/json");
			objectMapper.writeValue(out, FiinfraConstants.error);
		} catch (IOException io) {
			io.printStackTrace();
		}
	  }
	}

}
