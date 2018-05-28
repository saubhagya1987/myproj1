package in.fiinfra.query.controller;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.PartyData;
import in.fiinfra.common.common.QueryCommentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.common.QueryRequest;
import in.fiinfra.common.controller.AbstractController;
import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.document.service.DocumentService;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.query.model.CommentData;
import in.fiinfra.query.model.QueryBean;
import in.fiinfra.query.service.QueryService;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Response;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/query")
public class QueryController extends AbstractController {
	
	private static final String QUERY_SOURCE="Query";
	
	@Autowired
	private CommonController commonController;
	
	private static final Logger LOGGER = Logger.getLogger(QueryController.class);

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String defaultQueryList(Model m, QueryRequest q, BindingResult result, HttpServletRequest request) {
		return queryList(m, q, result, request);
	} 

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String queryList(Model m, @ModelAttribute("q") QueryRequest q,
			BindingResult result, HttpServletRequest request) {
		if(!validSession(request)){
			return redirectToLogin();
		}

		populateDefault(q);
		QueryService service = getRestService(QueryService.class);
		UserSession user = AbstractController.getSessionUser();
		//changes for hierarchy 
		q.setPartyId(user.getPartyId());
		m.addAttribute("hierarchy", 1);
		q.setNodeId(Integer.parseInt( request.getSession().getAttribute("nodeId").toString()));
		if(q.getQueryPanel() ==null){
			q.setQueryPanel("inbox");	
		}
		
		populateQuerySearchData(m, q);
		List<Integer> unreadCounts = new ArrayList<Integer>();
		try{
			unreadCounts = service.getUnreadCount(q);
		}catch(Exception ex){
			//remove Exceprion Catch once API get stable  
		}
				
		m.addAttribute("inboxCount", unreadCounts.get(0));
		m.addAttribute("sentCount", unreadCounts.get(1));
		List<QueryData> lstQuery = service.searchQuery(q);
		m.addAttribute("data", lstQuery);
		
		m.addAttribute("q", q);
		
		String partnerSetupLinks = commonController.getRoleBasedSecurityIDS(user.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), user.getBuId(), 283);// Partner Setup links
		m.addAttribute("partnerSetupLinks", partnerSetupLinks);
		request.getSession().setAttribute("partnerSetupLinks", partnerSetupLinks);
		
		String roleBaseLinks =commonController.getRoleBasedSecurityIDS(user.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), user.getBuId(), 323);// Partner Dashboard links
		m.addAttribute("roleBaseLinks", roleBaseLinks);
		request.getSession().setAttribute("smallMenuLinks", roleBaseLinks);

		String userName = user.getUserName();
		Integer buId = user.getBuId();
		Integer PartyId = user.getPartyId();
		m.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,254));
		
		return "query/list";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String querySearch(Model m, @ModelAttribute("q") QueryRequest q,
			BindingResult result, HttpServletRequest request) {
		if(!validSession(request)){
			return redirectToLogin();
		}

		QueryService service = getRestService(QueryService.class);
		UserSession user = AbstractController.getSessionUser();
		q.setPartyId(user.getPartyId());
		//code for hierarchy 
		m.addAttribute("heirarchy", 1);
		q.setNodeId(Integer.parseInt( request.getSession().getAttribute("nodeId").toString()));
		q.setBuId(user.getBuId());
		if(q.getQueryPanel() ==null){
			q.setQueryPanel("inbox");	
		}
		
		populateQuerySearchData(m, q);
		List<Integer> unreadCounts = new ArrayList<Integer>();
		try{
			unreadCounts = service.getUnreadCount(q);
		}catch(Exception ex){
			//remove Exceprion Catch once API get stable  
		}
				
		
		m.addAttribute("inboxCount", unreadCounts.get(0));
		m.addAttribute("sentCount", unreadCounts.get(1));
		if(q.getSubject() != null) {
			q.setSubject(q.getSubject().trim().replace(" ", "_"));
		}
		List<QueryData> lstQuery = service.searchQuery(q);
		m.addAttribute("data", lstQuery);
		
		m.addAttribute("q", q);

		return "query/search";
	}


	@RequestMapping(value = "/xls", method = RequestMethod.GET)
	public void queryXLS(Model m, @ModelAttribute("q") QueryRequest q,
			BindingResult result, HttpServletRequest request, HttpServletResponse response) {

		populateDefault(q);
		QueryService service = getRestService(QueryService.class);
		UserSession user = AbstractController.getSessionUser();
		q.setPartyId(user.getPartyId());
		if(q.getQueryPanel() ==null){
			q.setQueryPanel("inbox");	
		}
		
		List<QueryData> lstQuery = service.searchQuery(q);
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
			cell.setCellValue("MESSAGE COUNT");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("SUBJECT");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("QUERY TYPE");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("QUERY OWNER");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("QUERY REFERENCE NO.");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("LAST UPDATED");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("STATUS");
	}


		for(QueryData query:lstQuery){
			column = 0;
			excelRow =  sheet.createRow(rowNum++);
			{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(query.getUnreadCount());
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(query.getSubject());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(query.getQueryTypeName());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(query.getQueryOwnerName());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(query.getQueryFor());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(query.getLastUpdatedDate());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(query.getStatus());
		}

			
			
		}

		try {
		    workbook.write(response.getOutputStream());
		     
		} catch (IOException e) {
		    e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/csv", method = RequestMethod.GET)
	public void queryCSV(Model m, @ModelAttribute("q") QueryRequest q,
			BindingResult result, HttpServletRequest request, HttpServletResponse response) {

		populateDefault(q);
		QueryService service = getRestService(QueryService.class);
		UserSession user = AbstractController.getSessionUser();
		q.setPartyId(user.getPartyId());
		if(q.getQueryPanel() ==null){
			q.setQueryPanel("inbox");	
		}
		
		List<QueryData> lstQuery = service.searchQuery(q);
		

		try {
			response.addHeader("Content-Disposition", "attachment;filename=QueryList.csv");
			
			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("MESSAGE COUNT"));
			writer.print(",");
			writer.print(CommonUtils.escape("SUBJECT"));
			writer.print(",");
			writer.print(CommonUtils.escape("QUERY TYPE"));
			writer.print(",");
			writer.print(CommonUtils.escape("QUERY OWNER"));
			writer.print(",");
			writer.print(CommonUtils.escape("QUERY REFERENCE NO."));
			writer.print(",");
			writer.print(CommonUtils.escape("LAST UPDATED"));
			writer.print(",");
			writer.print(CommonUtils.escape("STATUS"));
			writer.println();
			for(QueryData query:lstQuery){
				writer.print(CommonUtils.escape(""+query.getUnreadCount()));
				writer.print(",");
				writer.print(CommonUtils.escape(query.getSubject()));
				writer.print(",");
				writer.print(CommonUtils.escape(query.getQueryTypeName()));
				writer.print(",");
				writer.print(CommonUtils.escape(query.getQueryOwnerName()));
				writer.print(",");
				writer.print(CommonUtils.escape(query.getQueryFor()));
				writer.print(",");
				writer.print(CommonUtils.escape(query.getLastUpdatedDate()));
				writer.print(",");
				writer.print(CommonUtils.escape(query.getStatus()));
				writer.println();
			}
		     
		} catch (IOException e) {
		    e.printStackTrace();
		}
	}

	private void populateDefault(QueryRequest q){
		UserSession user = AbstractController.getSessionUser();
		q.setBuId(user.getBuId());
		q.setPartyId(user.getPartyId());
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String createQuery(Model m, HttpServletRequest request) {
		if(!validSession(request)){
			return redirectToLogin();
		}

		QueryData query = new QueryData();
		m.addAttribute("bean", new QueryBean());
		m.addAttribute("query", query);
		populateFormData(m, query);
		
		UserSession user = AbstractController.getSessionUser();
		String userName = user.getUserName();
		Integer buId = user.getBuId();
		Integer PartyId = user.getPartyId();
		m.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,302));
		
		if(request.getParameter("returnUrl")!=null)
		{
			m.addAttribute("returnUrl", request.getParameter("returnUrl"));
		}
		else{
		m.addAttribute("returnUrl","empty");
		}
		
		return "query/form";
	}
	
	@RequestMapping(value = "/view", method=RequestMethod.GET)
	public String viewQuery( Model m,QueryRequest q, HttpServletRequest request ) {
		if(!validSession(request)){
			return redirectToLogin();
		}

		populateDefault(q);
		QueryData query = null;
		if(q.getQueryId() > 0){
			QueryService service = getRestService(QueryService.class);
			query = service.getQuery(q.getQueryId());
		}
		//query id not come during get details what the ????
		if(query != null){
			query.setQueryId(q.getQueryId());
		}
		else{
			query = new QueryData();
		}
		populateFormData(m, query);
		m.addAttribute("query", query);
		return "query/formEdit";
	}
	

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String createQuery(
			@ModelAttribute("query") QueryData query,  BindingResult result,
			Model m, HttpServletRequest request,
			final RedirectAttributes redirectAttributes,
			HttpServletResponse response) {
		
		if(!validSession(request)){
			return redirectToLogin();
		}

		

		QueryService service = getRestService(QueryService.class);

		
		String result1 = "fail";
		String errorMSg = "";
		UserSession user = AbstractController.getSessionUser();
		int buId = user.getBuId();
		query.setBuId(buId);
		query.setCreatedBy(user.getUserId());
		query.setQueryOwner(user.getPartyId());
		if(query.getContactType() <=0){
			query.setContactId(user.getPartyId());
		}
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		long currentTime = new Date().getTime();
		MultipartFile[] mulFiles = query.getQueryAttachment() ;
		if(mulFiles != null){
			documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(
				mulFiles, currentTime, user.getUserId());
			if (documentDatas == null) {
				result1 = "Attachment size greater than "
						+ FiinfraConstants.MAX_FILE_SIZE + " kb is not allowed.";
			} else {
				if (documentDatas.size()>0) {
					query.setAttachmentCount(documentDatas.size());
					query.setAttachment(true);
				}
				
			}
		}
		query.setDocumentDatas(documentDatas);
		query = service.addUpdateQuery(query);

		int queryId = query.getQueryId();
		if (queryId > 0){
			result1 = "success";
		}
		else{
			errorMSg = "Fail to Create Query";
		}
			
		String basePath = query.getBasePath();

		if (documentDatas.size() > 0) {
			try {
				result1 = FiinfraUtility.uploadAttachments(mulFiles, basePath,
						currentTime);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(StringUtils.isEmpty(errorMSg)){
			audit(user.getPartyId(), user.getUserId(), FiinfraConstants.DIY_ADD_QUERY_SUCCESSFUL,QUERY_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_ADD_QUERY);
			redirectAttributes.addFlashAttribute("success", "success.query.save");	
		}
		else{
			redirectAttributes.addFlashAttribute("error", "error.query.save");	
			audit(user.getPartyId(), user.getUserId(), FiinfraConstants.DIY_ADD_QUERY_FAILED,QUERY_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_ADD_QUERY);
			m.addAttribute("error", errorMSg);
		}
		
		
		if("success".equalsIgnoreCase(result1)){
			if("new".equalsIgnoreCase(request.getParameter("action"))){
				return "redirect:add";
			}
			return "redirect:list";
		}

		return "query/form";
	}


	
	@RequestMapping(value = "/messages", method=RequestMethod.GET)
	public String viewMessages( Model m,QueryRequest q, HttpServletRequest request ) {
		if(!validSession(request)){
			return redirectToLogin();
		}

		
		if(q.getQueryId() > 0){
			
			//check validation
			QueryService service = getRestService(QueryService.class);

			QueryData query = service.getQuery(q.getQueryId());
			CommentData newComment =  new CommentData();
			
			newComment.setCommentTypeName("Public");
			newComment.setQueryId(q.getQueryId());
			newComment.setStatus(query.getStatus());
			populateCommentFormData(m, newComment);

			m.addAttribute("data", query);
			m.addAttribute("queryComment", newComment);
			m.addAttribute("link", q.getLink());
		}
		return "query/message";
	}
	
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	public String deleteQuery( Model m,HttpServletRequest request, final RedirectAttributes redirectAttributes ,
			QueryRequest q) {
		if(!validSession(request)){
			return redirectToLogin();
		}
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
		QueryService service = getRestService(QueryService.class);
		Response responce = service.deleteQuery(q);
		if(responce == null) {
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_DELETE_QUERY_SUCCESSFUL, QUERY_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_DELETE_QUERY);
		}
		else {
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_DELETE_QUERY_FAILED, QUERY_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_DELETE_QUERY);
		}
		
		return "redirect:/query/list"; 
	}
	
	
	@RequestMapping(value = "/getParty", method=RequestMethod.GET)
	public @ResponseBody List<KeyValue> getParty( Model m, QueryRequest q, HttpServletRequest request) {

		QueryService service = getRestService(QueryService.class);
		List<KeyValue> partyList = service.getPartyName(q, q.getRecordType());
		Collections.sort(partyList);
		partyList.add(0, new KeyValue(-1, "Query For"));
		return partyList;  
	} 




	@RequestMapping(value = "/comment/save", method=RequestMethod.POST)
	public String saveComment( Model m,final RedirectAttributes redirectAttributes ,
			@ModelAttribute("queryComment") CommentData queryCommentData, HttpServletRequest request) {
		if(!validSession(request)){
			return redirectToLogin();
		}

		//check validation
		QueryService service = getRestService(QueryService.class);
		
		UserSession user = AbstractController.getSessionUser();
		int createdBy = user.getPartyId(); 

		
//		int commentOwner = 2;
		int commentOwner =createdBy;
		String result="fail";
		
		QueryCommentData comment = new QueryCommentData();
		
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		comment.setCommentPartyId(commentOwner);
		comment.setCommentText(queryCommentData.getCommentText());
		comment.setQueryId(queryCommentData.getQueryId());
		long currentTime = new Date().getTime();
		MultipartFile[] files = queryCommentData.getQueryAttachment();
		documentDatas=FiinfraUtility.getDocumentDatasFromMultiPartFiles(files,currentTime,createdBy);
		if(documentDatas==null){
			result="Attachment size greater than "+FiinfraConstants.MAX_FILE_SIZE+" kb is not allowed.";
		}else{
		if (documentDatas.size()>0) {
			comment.setAttachmentCount(documentDatas.size());
			comment.setAttachment(true);
			
			DocumentData document =  documentDatas.get(0);
			document.setDocumentStorageLocation(FiinfraUtility.getStorageCodeIdFromDocumentRefType(111006));
			
			String storagePath= getBean(DocumentService.class).getStoragePath(user.getPartyId(), user.getBuId(), 
					FiinfraUtility.getStorageCodeIdFromDocumentRefType(111006)); 
			
			document.setFileStoragePathURI(storagePath);
			
			File phycicalPath = FiinfraUtility.saveDocument(new File(storagePath),"", files[0]);
			if(phycicalPath !=null){
				document.setFileName(phycicalPath.getName());
				document.setFileStoragePathURI(phycicalPath.getAbsolutePath());
				comment.setDocumentDatas(documentDatas);
			}
		}
		}

		
		comment.setCommentAttachment(null);
		
		service.addUpdateComment(comment);
		
		QueryRequest q = new QueryRequest();
		q.setQueryId(queryCommentData.getQueryId());
		q.setStatus(queryCommentData.getStatus());
		q.setBuId(user.getBuId());
		q.setLastUpdatedBy(user.getUserId());
		service.updateStatus(q);
		
		redirectAttributes.addFlashAttribute("success", "success.comment.save");
		
		
		return "redirect:/query/list";
	}
	
public void populateQuerySearchData(Model m, QueryRequest q) {
		
		QueryService service = getBean(QueryService.class);

		List<KeyValue> contacts = new ArrayList<KeyValue>();
		

		UserSession user = AbstractController.getSessionUser();
		
		m.addAttribute("partyId", user.getPartyId());
		q.setPartyId(user.getPartyId());
		PartyData p = service.getAllocatedTeamMember(q);
		//PartyData p = new PartyData();

		List<KeyValue> queryTo = new ArrayList<KeyValue>();
		
		queryTo.add(new KeyValue(user.getPartyId(),"Self" ));
		

		/*if (p.getPstPartyId() != 0) {
			queryTo.add(new KeyValue(p.getPstPartyId(), p.getPstName() + "["
					+ p.getPstDepartmentName() + "]"));
		}
		if (p.getMstPartyId() != 0) {
			queryTo.add(new KeyValue(p.getMstPartyId(), p.getMstName() + "["
					+ p.getMstDepartmentName() + "]"));
		}
		if (p.getFpaPartyId() != 0) {
			queryTo.add(new KeyValue(p.getFpaPartyId(), p.getFpaName() + "["
					+ p.getFpaDepartmentName() + "]"));
		}
		if (p.getMst2PartyId() != 0) {
			queryTo.add(new KeyValue(p.getMst2PartyId(), p.getMst2Name() + "["
					+ p.getMst2DepartmentName() + "]"));
		}
		*/
		
		if (p.getPstPartyId() != 0) {
			queryTo.add(new KeyValue(p.getPstPartyId(), p.getPstName()));
		}
		if (p.getMstPartyId() != 0) {
			queryTo.add(new KeyValue(p.getMstPartyId(), p.getMstName()));
		}
		if (p.getFpaPartyId() != 0) {
			queryTo.add(new KeyValue(p.getFpaPartyId(), p.getFpaName()));
		}
		if (p.getMst2PartyId() != 0) {
			queryTo.add(new KeyValue(p.getMst2PartyId(), p.getMst2Name()));
		}
		
		Integer[] contactTypes = new Integer[2];
		
		{
			List<CodeValueData> lst = service.getCodeValue("14");
			
			for(CodeValueData d:lst){
				if(d.getCodeValue().equalsIgnoreCase("Opportunity")){
					contactTypes[0] = d.getCodeValueId();
				}
				else if(d.getCodeValue().equalsIgnoreCase("Client")){
					contactTypes[1] = d.getCodeValueId();
				}
			}
		}
		for(Integer cType:contactTypes){
				contacts .addAll(service.getPartyName(q, cType));	
		}
		
		List<KeyValue> queryTypes = toKeyValue(service.getCodeValue("20"));
		Collections.sort(contacts);
		contacts.add(0, new KeyValue(-1,"Query For"));
		queryTo.add(0,new KeyValue(-1,"Query To"));
		queryTypes.add(0,new KeyValue(-1,"Query Type"));
		m.addAttribute("contacts", contacts);
		m.addAttribute("queryTo", queryTo);
		m.addAttribute("queryTypes", queryTypes);
	}	
	public void populateFormData(Model m, QueryData query) {
		
		QueryRequest q = new QueryRequest();
		
		populateQuerySearchData(m, q);
		
		QueryService service = getBean(QueryService.class);

		List<KeyValue> contacts = new ArrayList<KeyValue>();
		List<KeyValue> statusCodes = toKeyValue(service.getCodeValue("22"));
		
		Integer[] contactTypes = new Integer[3];
		
		{
			List<CodeValueData> lst = service.getCodeValue("14");
			
			for(CodeValueData d:lst){
				if(d.getCodeValue().equalsIgnoreCase("Opportunity")){
					contactTypes[0] = d.getCodeValueId();
				}
				else if(d.getCodeValue().equalsIgnoreCase("Premium Client")){
					contactTypes[2] = d.getCodeValueId();
				}
				else if(d.getCodeValue().equalsIgnoreCase("Client")){
					contactTypes[1] = d.getCodeValueId();
				}
			}
			
			m.addAttribute("contactTypes", contactTypes);
			contacts = service.getPartyName(q, query.getContactType() >0? query.getContactType():contactTypes[0]);
			m.addAttribute("contacts", contacts);
		}

		UserSession user = AbstractController.getSessionUser();
		
		m.addAttribute("partyId", user.getPartyId());
		q.setPartyId(user.getPartyId());
		m.addAttribute("status", statusCodes);
		m.addAttribute("mySelf", query.getContactId() == user.getPartyId());
		m.addAttribute("RefTypeId", "111006");
		m.addAttribute("sectionId", "1");
		
		//for add notes
//		for (CodeValueData d:)
		
	}
	
	public void populateCommentFormData(Model m, CommentData comment) {
		QueryService service = getBean(QueryService.class);

		List<KeyValue> statusCodes = new ArrayList<KeyValue>();


		{
			List<CodeValueData> lst = service.getCodeValue("22");
			for (CodeValueData d : lst) {
				KeyValue k = new KeyValue();
				k.setId(d.getCodeValueId());
				k.setName(d.getCodeValue());
				statusCodes	.add(k);
			}
		}
		m.addAttribute("status", statusCodes);
	}
	
	private void audit(int actionByPartyId, int actionByUserId, int eventId, String sourceModule, String sourceScreen){
		try{
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);				
			audit.setActionByUserID(actionByUserId);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_MOBILE_PORTAL);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
			FrameworkUtil.audit(audit);
		} catch(Exception exception){
			LOGGER.error("Error occured while doing Audit", exception);
		}		
	}

}
