package in.fiinfra.partner.controller;

import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.controller.QueryController;
import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Notification;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import net.sourceforge.jtds.jdbc.DateTime;*/

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.Gson;

public class TaskController extends MultiActionController {
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	Gson gson;
	String url;
	private static final Logger logger = Logger
			.getLogger(QueryController.class);
	@Value("${URL_INSERT_Task}")
	private String URL_INSERT_Task;
/*	@Value("${URL_DELETE_Task}")
	private String URL_DELETE_Task;*/

	@Value("${URL_GET_TASK_LIST}")
	private String URL_GET_TASK_LIST;

	// private String URL_GET_QUERY_UNREAD_COUNT;
	@Value("${URL_GET_TASK_RECORD}")
	private String URL_GET_TASK_RECORD;

	// @Value("${URL_INSERT_QUERYCOMMENT}")
	// private String URL_INSERT_QUERYCOMMENT;
	// @Value("${URL_UPDATE_QUERY_STATUS}")
	// private String URL_UPDATE_QUERY_STATUS;


	@Value("${URL_DELETE_Task_SP}")
	private String URL_DELETE_Task_SP;

	
	@SuppressWarnings("unchecked")
	public ModelAndView getTaskList(HttpServletRequest request,
			HttpServletResponse response) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
//		int partyId = userSession.getPartyId();
		int partyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		 String taskSearchValue = request.getParameter("value");// "inbox";
		// queryPanel = queryPanel == null ? "inbox" : queryPanel;
		// request.getSession().setAttribute("queryPanel", queryPanel);
		url = URL_GET_TASK_LIST + userSession.getUserName() + "/" + partyId
				+ "/1234";
		logger.info("url:-" + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		// uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("taskSearchValue", taskSearchValue);
		uriCB.queryParam("nodeId", nodeId);
		
		BaseResponse<Task> br = new BaseResponse<Task>();
		logger.info("-----------Before Calling APP In Web(getTaskList)-----------");
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		logger.info("-----------After Calling APP In Web(getTaskList)-----------");
		List<Task> taskDatas = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			
			taskDatas=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
			
		List<Task> taskDatas1 = new ArrayList<>();  
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		
//		for(Task t:taskDatas){
//			java.sql.Timestamp t123 = t.getDueDateTime();
//			String dueDate = sdf.format(t123.getTime());
//			t.setDueDateTimeString(dueDate);
//			taskDatas1.add(t);
//		}
		Iterator<Task> i=taskDatas.iterator();
		while(i.hasNext()){
			Task t=objectMapper.readValue(objectMapper.writeValueAsString(i.next()), Task.class);
			java.sql.Timestamp t123 = t.getDueDateTime();
			String dueDate = sdf.format(t123.getTime());
			t.setDueDateTimeString(dueDate);
			taskDatas1.add(t);
		}
		
		taskDatas=taskDatas1;
		logger.info("taskDatas:-------------------------------"
				+ taskDatas);
	
		ModelAndView mav = new ModelAndView("partner/task");
		mav.addObject("taskDatas", objectMapper.writeValueAsString(taskDatas));
		mav.addObject("pagesize", pagesize);
		return mav;
	}
	
	public void getTaskListXLS(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		 String taskSearchValue = request.getParameter("value");// "inbox";
		// queryPanel = queryPanel == null ? "inbox" : queryPanel;
		// request.getSession().setAttribute("queryPanel", queryPanel);
		url = URL_GET_TASK_LIST + userSession.getUserName() + "/" + partyId
				+ "/1234";
		logger.info("url:-" + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		// uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("taskSearchValue", taskSearchValue);
		BaseResponse<Task> br = new BaseResponse<Task>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<Task> taskDatas = new ArrayList<>();
		List<Task> taskDatas1 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			
			taskDatas=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				for(int i = 0; i<taskDatas.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					Task task;
					task = objectMapper.readValue(objectMapper.writeValueAsString(taskDatas.get(i)), Task.class);
					try{
					java.sql.Timestamp t123 = task.getDueDateTime();
					String dueDate = sdf.format(t123.getTime());
					task.setDueDateTimeString(dueDate);
					}catch(Exception e){
						task.setDueDateTimeString("");
					}
					taskDatas1.add(task);
				}

		response.addHeader("Content-type", "application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename=TaskList.xls");
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font=workbook.createFont();
        /* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        /* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet("Task List");
		int rowNum = 0;
		int column = 0;
		HSSFRow excelRow =  sheet.createRow(rowNum++);
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Task Owner");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Subject Category");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Task For");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Task Created By");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Subject");
		}

		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Start Date");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("End Date");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Priority");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("Status");
	}


		for(Task task:taskDatas1){
			column = 0;
			excelRow =  sheet.createRow(rowNum++);
			{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(task.getOwnerPartyName());
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(task.getCategoryName());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(task.getTargetPartyName());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(task.getTaskCreatedBy());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(task.getSubject());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(task.getDueDateTimeString());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(task.getEndDateTimeString());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(task.getPriorityName());
		}
			
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(task.getStatusName());
		}

		}

		workbook.write(response.getOutputStream());
	}
	
	public void getTaskListCSV(HttpServletRequest request, HttpServletResponse response) throws IOException {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		int partyId = userSession.getPartyId();
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}
		 String taskSearchValue = request.getParameter("value");// "inbox";
		// queryPanel = queryPanel == null ? "inbox" : queryPanel;
		// request.getSession().setAttribute("queryPanel", queryPanel);
		url = URL_GET_TASK_LIST + userSession.getUserName() + "/" + partyId
				+ "/1234";
		logger.info("url:-" + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		// uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("taskSearchValue", taskSearchValue);
		BaseResponse<Task> br = new BaseResponse<Task>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<Task> taskDatas = new ArrayList<>();
		List<Task> taskDatas1 = new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			
			taskDatas=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				for(int i = 0; i<taskDatas.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					Task task;
					task = objectMapper.readValue(objectMapper.writeValueAsString(taskDatas.get(i)), Task.class);
					try{
					java.sql.Timestamp t123 = task.getDueDateTime();
					String dueDate = sdf.format(t123.getTime());
					task.setDueDateTimeString(dueDate);
					}catch(Exception e){
						task.setDueDateTimeString("");
					}
					taskDatas1.add(task);
				}
			response.addHeader("Content-Disposition", "attachment;filename=TaskList.csv");
			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Task Owner"));
			writer.print(",");
			writer.print(CommonUtils.escape("Subject Category"));
			writer.print(",");
			writer.print(CommonUtils.escape("Task For"));
			writer.print(",");
			writer.print(CommonUtils.escape("Task Created By"));
			writer.print(",");
			writer.print(CommonUtils.escape("Subject"));
			writer.print(",");
			writer.print(CommonUtils.escape("Start Date"));
			writer.print(",");
			writer.print(CommonUtils.escape("End Date"));
			writer.print(",");
			writer.print(CommonUtils.escape("Priority"));
			writer.print(",");
			writer.print(CommonUtils.escape("Status"));
			writer.println();
			for(Task task:taskDatas1){
				writer.print(CommonUtils.escape(task.getOwnerPartyName()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getCategoryName()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getTargetPartyName()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getTaskCreatedBy()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getSubject()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getDueDateTimeString()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getEndDateTimeString()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getPriorityName()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getStatusName()));
				writer.println();
			}
	}

	/**
	 * deletes the task and related details
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	
	
	
	@SuppressWarnings("unchecked")
	public void deleteTask(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String TaskIds = request.getParameter("TaskIds");

		
					UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
					url = URL_DELETE_Task_SP + userSession.getUserName()+ "/1234";
					BaseResponse<Integer> br = new BaseResponse<Integer>();
					Task t=new Task();
					t.setDescription(TaskIds);
					t.setCreatedBy(userSession.getUserId());
					br = restTemplate.postForObject(url, t, BaseResponse.class);
					Integer codeValueDataList=null;
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						 codeValueDataList= br.getResponseObject();
					
					String OBJECT_STRING="Task ID"+TaskIds+"UpDated By"+userSession.getUserId();
					FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_DELETE_TASK_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_TASK,FiinfraConstants.SRP_DELETE_TASK,"SP="+FiinfraConstants.SP_DELETE_TASK_SP,OBJECT_STRING);
					
		//FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_DELETE_TASK_EVENT_ID,FiinfraConstants.PARTNER_PORTAL,FiinfraConstants.PP_SOURCE_MODULE_TASK,FiinfraConstants.SRP_DELETE_TASK);
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, br.getStatus());// TO Do: here status can
	}
	
/*	@SuppressWarnings("unchecked")
	public void deleteTask(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String TaskIds = request.getParameter("TaskIds");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int buId = userSession.getBuId();
		url = URL_DELETE_Task + userSession.getUserName() + "/" + TaskIds
				+ "/1234?buId=" + buId;
		// url = URL_DELETE_Task + userSession.getUserName() + "/1234";
		logger.info("url:-" + url);
		// UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		// uriCB.queryParam("queryIds", queryIds);
		// uriCB.queryParam("buId", buId);
		BaseResponse<String> br = new BaseResponse<String>();
		try {
			br = restTemplate.postForObject(url, null, BaseResponse.class);

		} catch (Exception e) {
		logger.error(e);
		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, br.getStatus());// TO Do: here status can
														// be SUCCESS or
														// .EMPTY_RESULT_SET.
														// Accordingly handle
														// this in View.
	}*/

	/**
	 * save the task details
	 * 
	 * @param request
	 * @param response
	 * @param queryData
	 * @return
	 * @throws Exception
	 */
	
	
	
	@SuppressWarnings("unchecked")
	public void saveTask(HttpServletRequest request,
			HttpServletResponse response, Task taskData) throws Exception {
		
		String result = FiinfraConstants.FAIL;
		request.getSession().setAttribute("TaskResult", result);
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
//		int taskOwner = userSession.getPartyId();
		int taskOwner= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
		int buId = userSession.getBuId();
		int taskId = Integer
				.parseInt(request.getParameter("taskId").toString());
		logger.info("taskId"+ String.valueOf(taskId));
		
		taskData.setCreatedBy(createdBy);
		taskData.setOriginatedPartyId(taskOwner);
		if (taskId == 0)
			taskData.setId(null);
		else
			taskData.setId(taskId);
		long currentTime = new Date().getTime();
		MultipartFile[] m = taskData.getTaskAttachment();
		List<Document> documentDatas = new ArrayList<Document>();
		if(m!=null)
		{
		for (MultipartFile f : m) {
			logger.info("f.getOriginalFilename():--"
					+ f.getOriginalFilename());
			if (f.getOriginalFilename() != null
					&& !f.getOriginalFilename().equals("")) {
				String fileName = null;
				String extension = null;
				Document d = new Document();
				d.setDocumentName(f.getOriginalFilename());
				d.setDocumentStorageLocation(82001);
				d.setDocumentType(10001);
				d.setCreatedBy(createdBy);
				fileName = f.getOriginalFilename().substring(0,
						f.getOriginalFilename().lastIndexOf("."));
				extension = f.getOriginalFilename().substring(
						f.getOriginalFilename().lastIndexOf("."));
				logger.info("File name is :--" + fileName);
				logger.info("extension is:--" + extension);
				logger.info("filename to set:---" + fileName + "_"
						+ currentTime + extension);
				d.setFileName(fileName + "_" + currentTime + extension);
				d.setFileSize((int) f.getSize());
				d.setFileTypeId(11006);
				documentDatas.add(d);
				if (f.getSize() > FiinfraConstants.MAX_FILE_SIZE) {
					documentDatas = null;
					break;
				}
			}
		}
		}
		taskData.setTaskAttachment(null);

		logger.info("documentDatas:-" + documentDatas);
		if (documentDatas == null) {
			result = "Attachment size greater than "
					+ FiinfraConstants.MAX_FILE_SIZE + " kb is not allowed.";
		} else {
			if (documentDatas.size() > 0) {
				// taskData.setAttachmentCount(documentDatas.size());
				// taskData.setAttachment(true);
			}
		}

	//	String duedate = taskData.getDueDateTimeString();
		//String Completionndate = taskData.getCompletionDateTimeString();

		int recordCount = 0;
		
/*		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String dateInString = duedate;
			Date date = formatter.parse(dateInString);
			logger.info(date);
			logger.info(formatter.format(date));
		
		java.sql.Timestamp due = new java.sql.Timestamp(date.getTime());
		taskData.setDueDateTime(due);*/

	

		
		String duedate = taskData.getDueDateTimeString();
		
		String enddate = taskData.getEndDateTimeString();

		
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy h:mm a");
		
		String dateInString = duedate;
		
		
		    
		
			Date date = formatter.parse(dateInString);

		java.sql.Timestamp due = new java.sql.Timestamp(date.getTime());
		taskData.setDueDateTime(due);
		
		
		
		
		
		String endInString = enddate;
		Date date1 = formatter.parse(endInString);

	java.sql.Timestamp end = new java.sql.Timestamp(date1.getTime());
	taskData.setTaskEndDate(end);

		
		
		
		
		url = URL_INSERT_Task + userSession.getUserName() + "/1234";
		logger.info("url:-" + url);
		taskData.setDocumentList(documentDatas);
		BaseResponse<String> br = new BaseResponse<String>();
		logger.info("-----------Before Calling APP In Web(saveTask)-----------");
		br = restTemplate.postForObject(url, taskData, BaseResponse.class);
		//Boolean resultTask = false;
		logger.info("-----------After Calling APP In Web(saveTask)-----------");
		List<String> resultList=new ArrayList<>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			resultList=br.getResponseListObject();
			result = FiinfraConstants.SUCCESS;
		}
		String Path=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)), String.class);
		logger.info("----------------------------Path" + Path);
		logger.info("----------------------------Path" + resultList);
		
		if (documentDatas.size() > 0) {
			 result = FiinfraUtility.uploadAttachments(m, Path,
			 currentTime);
		 } 

		

		

		if(taskId==0)
		{
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_TASK_EVENT_ID,FiinfraConstants.PARTNER_PORTAL,FiinfraConstants.PP_SOURCE_MODULE_TASK,FiinfraConstants.SRP_ADD_TASK);
		
			
			Notification notification=null;
				Map<String,String> taskEmailData=new HashMap<String, String>();
				
				
				  taskEmailData.put("Task.Subject",taskData.getSubject());
				  taskEmailData.put("Task.Description",taskData.getDescription());
				  taskEmailData.put("Task.SubjectCategory",taskData.getSubject());
				  taskEmailData.put("Task.ActivityDate",taskData.getDueDateTimeString());
				  taskEmailData.put("Task.OwnerName",taskData.getTargetPartyName());
				  taskEmailData.put("RelatedTo",taskData.getTargetPartyId()+"");
				  taskEmailData.put("Task.AssignedBy",userSession.getName());
				  taskEmailData.put("Task.Description",taskData.getDescription());
				  taskEmailData.put("Task.Email",userSession.getContactEmail());
				  
				notification=new Notification();
				notification.setSourceSystemID(31001); //need to add in finfra coinstants
				notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
				
				notification.setNotifyPartyID(taskData.getOwnerPartyId());
				notification.setNotifyEventID(262); //need to add a param for new admin portal add partner
				notification.setBuId(userSession.getBuId());
		        notification.setPayloadMap(taskEmailData);
				notification.setSessionID(request.getSession().getId());
				FrameworkUtil.notify(notification);
			
				
				 
			
		}
		else
		{
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_EDIT_TASK_EVENT_ID,FiinfraConstants.PARTNER_PORTAL,FiinfraConstants.PP_SOURCE_MODULE_TASK,FiinfraConstants.SRP_EDIT_TASK);
			Map<String,String> taskEmailData=new HashMap<String, String>();
			  taskEmailData.put("Subject",taskData.getSubject());
			//  taskEmailData.put("Task.Description",taskData.getDescription());
			 // taskEmailData.put("Task.SubjectCategory",taskData.getSubject());
			  taskEmailData.put("Task.OwnerName",taskData.getTargetPartyName());
			  taskEmailData.put("Task.AssignedBy",userSession.getName());
			  taskEmailData.put("Status",taskData.getStatusName());
			  taskEmailData.put("Task.Email",userSession.getContactEmail());
		  
			Notification notification=null;
			notification=new Notification();
			notification.setSourceSystemID(31001); //need to add in finfra coinstants
			notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
			notification.setNotifyPartyID(taskData.getOwnerPartyId());
			notification.setNotifyEventID(263); //need to add a param for new admin portal add partner
			notification.setBuId(userSession.getBuId());
			notification.setPayloadMap(taskEmailData);
			notification.setSessionID(request.getSession().getId());
			FrameworkUtil.notify(notification);
			
			
		}
		
		
		
		
		
		
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(e);
		}
		objectMapper.writeValue(out, result);
	}

	/**
	 * Retrieves the Task details
	 * 
	 * @param request
	 * @param response
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	@SuppressWarnings("unchecked")
	public void getTaskDetails(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException, IllegalAccessException,
			InvocationTargetException {
		Integer TaskId = Integer.parseInt(request.getParameter("taskId")
				.toString());
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int partyId = userSession.getPartyId();
		int buId = userSession.getBuId();

		url = URL_GET_TASK_RECORD + userSession.getUserName() + "/" + TaskId
				+ "/1234";
		logger.info("url:-" + url);
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		// uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("buId", buId);
		BaseResponse<Task> br = new BaseResponse<Task>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		Task taskData = new Task();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			taskData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					Task.class);
		taskData.setId(TaskId);

		java.sql.Timestamp t = taskData.getDueDateTime();
		java.sql.Timestamp t1 = taskData.getCompletionDateTime();
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String dueDate="N/A";
		if(t!=null)
		{
		 dueDate = sdf.format(t.getTime());
		}
		String complDate = "NA";
		if(t1 !=null)
		complDate = sdf.format(t1.getTime());
		logger.info("Current date in String Format: " + dueDate);

		taskData.setDueDateTimeString(dueDate);
		taskData.setCompletionDateTimeString(complDate);

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, taskData);
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
