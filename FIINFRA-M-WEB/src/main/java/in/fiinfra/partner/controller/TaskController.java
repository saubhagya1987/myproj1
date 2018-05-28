/**
 * 
 */
package in.fiinfra.partner.controller;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.PartyData;
import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.TaskKeyValue;
import in.fiinfra.common.diy.models.TaskSearchCriteria;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.DateUtil;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.common.util.TaskSearchCriteriaEnum;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.partner.models.TaskListResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

/**
 * @author Kunal
 *
 */
@Controller
@RequestMapping("/partner")
public class TaskController {
	private static final Logger LOGGER = Logger.getLogger(TaskController.class);
	
	private final String TASKLIST = "taskList";
	private final String TOTALTASKS = "totalTasks";
	private static final String TASK_SOURCE="Task";
	private ServletContext servletContext;
	
	@Value("${GET_TASKLIST_URL}")
	private String GET_TASKLIST_URL;
	
	@Value("${TASKLIST_SEARCH_URL}")
	private String TASKLIST_SEARCH_URL;
	
	@Value("${GET_PICKLIST_VALUELIST}")
	private String GET_PICKLIST_VALUELIST;
	
	@Value("${GET_ASSIGNEDTO_VALUES}")
	private String GET_ASSIGNEDTO_VALUES;
	
	@Value("${ADD_TASK_URL}")
	private String ADD_TASK_URL;
	
	@Value("${TARGETYPE_DROPDOWN_URL}")
	private String TARGETYPE_DROPDOWN_URL;
	
	@Value("${GET_TASK_BY_ID}")
	private String GET_TASK_BY_ID;
	
	@Value("${EDIT_TASK_URL}")
	private String EDIT_TASK_URL;
	
	
	@Value("${DELETE_TASK_FOR_TASKID}")
	private String DELETE_TASK_FOR_TASKID;
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Autowired
	private CommonController commonController;
	
	private final String DATE_FORMAT_DD_MM_YYYY = "dd-MM-yyyy";
	
	@RequestMapping(value = "/addTask", method = RequestMethod.POST)
	public ModelAndView addNewTask(@QueryParam("newTask") boolean newTask,@RequestParam(value = "file1", required = false) MultipartFile fileToUpload1,@RequestParam(value = "file2", required = false) MultipartFile fileToUpload2,
			@RequestParam(value = "file3", required = false) MultipartFile fileToUpload3,@ModelAttribute("task")Task task, Model model,HttpServletRequest request,
			final RedirectAttributes redirectAttributes){
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			modelAndView = new ModelAndView("redirect:/login");
		}
		String eventXML = "usp_DIY_insertOrUpdateTask("+task.getId()+","+task.getOwnerPartyId()+","+
				task.getCategoryId()+","+task.getTargetContactTypeId()+","+task.getStatusId()+","+task.getPriorityId()+","+task.getTargetPartyId()+","+
				task.getDueDateTime()+","+task.getCompletionDateTime()+","+task.getSubject()+","+task.getDescription()+","+userSession.getUserId()+","+userSession.getUserId()+","
				+null+","+null+","+task.getOriginatedPartyId()+","+
				task.getTaskEndDate()+","+task.getAttachment1DocumentID()+","+task.getAttachment2DocumentID()+","+task.getAttachment3DocumentID()+")";
		Integer advisorPartyId = userSession.getPartyId();
		//Integer advisorPartyId = 6375;
		model.addAttribute("advisorPartyId",advisorPartyId);
		if(addTaskNewOrClose(userSession,task,request,fileToUpload1,fileToUpload2,fileToUpload3).equalsIgnoreCase("success")){
			audit(advisorPartyId, userSession.getUserId(), FiinfraConstants.DIY_ADD_TASK_SUCCESSFUL,TASK_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_ADD_TASK,eventXML);
			redirectAttributes.addFlashAttribute("success", "success.task.add");
			if(newTask){
				
				String userName = userSession.getUserName();
				Integer buId = userSession.getBuId();
				Integer PartyId = userSession.getPartyId();
				model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,301));
				
				modelAndView = new ModelAndView("redirect:/partner/addTask");
			}
			else {
				
				String userName = userSession.getUserName();
				Integer buId = userSession.getBuId();
				Integer PartyId = userSession.getPartyId();
				model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,328));
				
				modelAndView = new ModelAndView("redirect:/partner/tasklist");
			}
		}else{
			audit(advisorPartyId, userSession.getUserId(), FiinfraConstants.DIY_ADD_TASK_FAILED,TASK_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_ADD_TASK,eventXML);
			redirectAttributes.addFlashAttribute("error", "error.task.add");
			modelAndView = new ModelAndView("");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/editTask", method = RequestMethod.POST)
	public ModelAndView saveEditedTask(@QueryParam("newTask") boolean newTask,@RequestParam(value = "file1", required = false) MultipartFile fileToUpload1,@RequestParam(value = "file2", required = false) MultipartFile fileToUpload2,
			@RequestParam(value = "file3", required = false) MultipartFile fileToUpload3,@ModelAttribute("task")Task task, Model model,HttpServletRequest request,
			final RedirectAttributes redirectAttributes){
		ModelAndView modelAndView = null;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			modelAndView = new ModelAndView("redirect:/login");
		}
		
		Object o = request.getParameter("doc1Details");
		//LOGGER.debug(request.getParameter("doc1Details"));
		String eventXML = "usp_DIY_insertOrUpdateTask("+task.getId()+","+task.getOwnerPartyId()+","+
				task.getCategoryId()+","+task.getTargetContactTypeId()+","+task.getStatusId()+","+task.getPriorityId()+","+task.getTargetPartyId()+","+
				task.getDueDateTime()+","+task.getCompletionDateTime()+","+task.getSubject()+","+task.getDescription()+","+userSession.getUserId()+","+userSession.getUserId()+","
				+null+","+null+","+task.getOriginatedPartyId()+","+
				task.getTaskEndDate()+","+task.getAttachment1DocumentID()+","+task.getAttachment2DocumentID()+","+task.getAttachment3DocumentID()+")";
		
		if(addTaskNewOrClose(userSession,task,request,fileToUpload1,fileToUpload2,fileToUpload3).equalsIgnoreCase("success")){
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_UPDATE_TASK_SUCCESSFUL,TASK_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_UPDATE_TASK,eventXML);
			redirectAttributes.addFlashAttribute("success", "success.task.update");
			
			if(newTask){
				
				String userName = userSession.getUserName();
				Integer buId = userSession.getBuId();
				Integer PartyId = userSession.getPartyId();
				model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,301));
				modelAndView = new ModelAndView("redirect:/partner/addTask");
			}
			else{				
				String userName = userSession.getUserName();
				Integer buId = userSession.getBuId();
				Integer PartyId = userSession.getPartyId();
				model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,328));
				modelAndView = new ModelAndView("redirect:/partner/tasklist");;
			     }
		}else{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_UPDATE_TASK_FAILED,TASK_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_UPDATE_TASK,eventXML);
			redirectAttributes.addFlashAttribute("error", "error.task.update");
			return null;
		}
		return modelAndView;
	}
	private String addTaskNewOrClose(UserSession userSession, Task task,HttpServletRequest request,MultipartFile fileToUpload1,MultipartFile fileToUpload2,MultipartFile fileToUpload3){
		//changes for Hierarchy  
		Integer advisorPartyId = userSession.getPartyId();
		if(advisorPartyId == 0){
			advisorPartyId = userSession.getPartyId();
		  }
		Integer buId = userSession.getBuId();
		Integer createdBy = userSession.getUserId();
		List<Document> documentList = new ArrayList<Document>();
		
		try {
			task.setDueDateTime(DateUtil.getTimeStampForNewFormat(task.getDueDateTimeString()));
			task.setCompletionDateTime(DateUtil.getTimeStampForNewFormat(task.getCompletionDateTimeString()));
			task.setOriginatedPartyId(advisorPartyId);//who created
			task.setCreatedBy(createdBy);
			//task.setTargetContactTypeId(14005);
			//task.setTargetPartyId(28023);
		} catch (ParseException e) {
			LOGGER.error("Error occurred in date parsing",e);
		}
		
		if(null != fileToUpload1 && !fileToUpload1.isEmpty()){
			documentList.add(saveFile(fileToUpload1,advisorPartyId));
		}
		if(null != fileToUpload2 && !fileToUpload2.isEmpty()){
			documentList.add(saveFile(fileToUpload2,advisorPartyId));
		}
		if(null != fileToUpload3 && !fileToUpload3.isEmpty()){
			documentList.add(saveFile(fileToUpload3,advisorPartyId));
		}
		if(!documentList.isEmpty()){
			task.setDocumentList(documentList);
		}
		//task.setOwnerPartyId(advisorPartyId);// who got assigned
		String token = "153443";
		UriComponentsBuilder uriCB;
		if(task.getId()!= null){
			 uriCB = UriComponentsBuilder.fromHttpUrl(EDIT_TASK_URL+ "/"+userSession.getUserName()+"/" + token+"&buId="+buId);
			 
		}else{
			 uriCB = UriComponentsBuilder.fromHttpUrl(ADD_TASK_URL + "/"+userSession.getUserName()+"/" + token+"&buId="+buId);
		}
		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), task, BaseResponse.class);
		
		return baseResponse.getStatus();
	}
	private Document saveFile(MultipartFile fileToUpload, Integer advisorPartyId){
		
		Document documentData = new Document();
		String fileName = fileToUpload.getOriginalFilename();
		
		String modifiedFileName = FilenameUtils.getBaseName(fileToUpload.getOriginalFilename()) + "_" + System.currentTimeMillis()
                + "." + FilenameUtils.getExtension(fileToUpload.getOriginalFilename());
		try {
            File file = new File("D:/UploadDocuments");
            
            if(!file.exists()){
            	file.mkdir();
            }
 
            FileUtils.writeByteArrayToFile(new File("D:/UploadDocuments/"+modifiedFileName), fileToUpload.getBytes());
            LOGGER.debug("Go to the location:  " + file.toString()
                    + " on your computer and verify that the image has been stored.");
            
            documentData.setPartyId(advisorPartyId);// confirm the id
    		documentData.setCreatedBy(advisorPartyId);
    		documentData.setDocumentName(modifiedFileName);
    		documentData.setDocumentStorageLocation(82001);//local disk
    		documentData.setDocumentType(10001);//doc,image,thumbnail
    		documentData.setFileName(fileName);
    		documentData.setFileSize((int)fileToUpload.getSize());
    		documentData.setFileStoragePathURI("D:/");
    		documentData.setFileTypeId(11004);//pdf,jpeg,png
        } catch (IOException e) {
             e.printStackTrace();
        }
		
		return documentData;
	}
	@Produces("application/json")
	//@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	//@RequestMapping(value = "/addTask", method = RequestMethod.POST)
	public @ResponseBody String uploadFile(@RequestParam("assigned_to") String assignedTo,@RequestParam("task_cat") String taskCat,@RequestParam("task_stat") String taskStat,
			@RequestParam("taskpriorityId") String taskpriorityId,@RequestParam("task_category_select") String taskCategory,@RequestParam("due_date") String dueDate,@RequestParam("completion_date") String completionDate,
			@RequestParam("task_subject") String taskSubject,@RequestParam("subject_desc") String subjectDesc,
			@RequestParam(value = "file1", required = false) MultipartFile fileToUpload,@RequestParam(value = "file2", required = false) MultipartFile fileToUpload2,
			@RequestParam(value = "file3", required = false) MultipartFile fileToUpload3,Model model,HttpServletRequest request) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		Integer advisorPartyId = userSession.getPartyId();
		Integer buId = userSession.getBuId();
		Integer createdBy = userSession.getUserId();
		
		String documentName = fileToUpload.getOriginalFilename();
		
		String modifiedFileName = FilenameUtils.getBaseName(fileToUpload.getOriginalFilename()) + "_" + System.currentTimeMillis()
                + "." + FilenameUtils.getExtension(fileToUpload.getOriginalFilename());
		
		TaskListResponse taskListResponse = new TaskListResponse();
		Document documentData = new Document();
		documentData.setPartyId(advisorPartyId);
		documentData.setCreatedBy(advisorPartyId);
		documentData.setDocumentName(modifiedFileName);
		documentData.setDocumentType(10001);//doc,image,thumbnail
		documentData.setFileName(modifiedFileName);
		documentData.setFileSize((int)fileToUpload.getSize());
		documentData.setFileStoragePathURI("D:/");
		documentData.setFileTypeId(11004);//pdf,jpeg,png
		List<Document> documentList = new ArrayList<Document>();
		documentList.add(documentData);
		try {
            File file = new File("D:/UploadDocuments");
            
            if(!file.exists()){
            	file.mkdir();
            }
 
            FileUtils.writeByteArrayToFile(new File("D:/UploadDocuments/"+modifiedFileName), fileToUpload.getBytes());
            LOGGER.debug("Go to the location:  " + file.toString()
                    + " on your computer and verify that the image has been stored.");
        } catch (IOException e) {
             e.printStackTrace();
        }
		
		String token = "153443";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(ADD_TASK_URL + "/" + token+"&buId="+buId);
		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		Task task = new Task();
		task.setDocumentList(documentList);
		task.setOwnerPartyId(6326);
		  task.setOriginatedPartyId(6326);
		  task.setOriginatedPartyId(6326);
		  task.setTargetContactTypeId(17004);
		  task.setStatusId(19001);
		  task.setPriorityId(18003);
		  task.setDueDateTime(new Timestamp(System.currentTimeMillis()));
		  task.setCompletionDateTime(new Timestamp(System.currentTimeMillis()));
		  task.setSubject("Testing");
		  task.setDescription("Testing Done");
		  task.setCreatedBy(createdBy);
		
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), task, BaseResponse.class);
		//taskListResponse
		return "Success"; //taskListResponse;//
	}
	
	@RequestMapping(value = "/tasklist", method = RequestMethod.GET)
	public String showTaskList(Model model,HttpServletRequest request) {

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		request.getSession().removeAttribute("headerName");
		String taskSearchValue = request.getParameter("value");//for calender
		
		//TODO change hard coding
		//Integer advisorPartyId = userSession.getPartyId(); //6326
		Integer advisorPartyId = userSession.getPartyId();
		//code for hierarchy 
		model.addAttribute("hierarchy", 1);
		Integer nodeId = Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		Integer buId = userSession.getBuId();
		String token = "153443";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_TASKLIST_URL + "/"+userSession.getUserName()+"/" + advisorPartyId + "/"+token+"&buId="+buId);
		uriCB.queryParam("nodeId", nodeId);
		uriCB.queryParam("taskSearchValue", taskSearchValue);
		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		List<Task> taskListAsJson = new ArrayList<Task> ();
		List<Task> taskList = new ArrayList<Task> ();
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				taskListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
				
				for(int i = 0; i<taskListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					Task task;
					task = objectMapper.readValue(objectMapper.writeValueAsString(taskListAsJson.get(i)), Task.class);
					Format format = new SimpleDateFormat(DATE_FORMAT_DD_MM_YYYY);
					
					if(task.getDueDateTime() != null){
						//task.setDueDateTimeString(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(task.getDueDateTime()));
						task.setDueDateTimeString(new SimpleDateFormat("dd-MMM-yyyy ").format(task.getDueDateTime()));
					}
					taskList.add(task);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		initDropDown(request);
		/*List<KeyValue> keyValueList = getTargetTypeDropdownvalues("Opportunity",request);
		List<JsonData> targetTypeList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(null);
		jsonDataDefault.setText("---select---");
		for(KeyValue keyValue : keyValueList){
			JsonData jsonData = new JsonData();
			jsonData.setValue(keyValue.getId());
			jsonData.setText(keyValue.getName());
			targetTypeList.add(jsonData);
		}
		targetTypeList.add(jsonDataDefault);
		model.addAttribute("targetTypeList",targetTypeList);*/
		if (taskList.size() > 10) {
			model.addAttribute(TASKLIST, taskList.subList(0, 9));
		} else {
			model.addAttribute(TASKLIST, taskList);
		}
		model.addAttribute(TOTALTASKS,taskListAsJson.size());
		model.addAttribute("begin","0");
		model.addAttribute("end","9");
		model.addAttribute("advisorPartyId",advisorPartyId);
		//request.setAttribute(TASKLIST, taskList);
		model.addAttribute("buId",buId);
		request.getSession().setAttribute(TASKLIST, taskList);
		request.getSession().setAttribute("begin","0");
		request.getSession().setAttribute("end","9");
		
		String partnerSetupLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 283);// Partner Setup links
		model.addAttribute("partnerSetupLinks", partnerSetupLinks);
		request.getSession().setAttribute("partnerSetupLinks", partnerSetupLinks);
		
		String roleBaseLinks =commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 323);// Partner Dashboard links
		model.addAttribute("roleBaseLinks", roleBaseLinks);
		request.getSession().setAttribute("smallMenuLinks", roleBaseLinks);
		
		String userName = userSession.getUserName();
		Integer PartyId = userSession.getPartyId();
		model.addAttribute("roleBaseLinks",commonController.getRoleBasedSecurityIDS(PartyId,userName,buId,328));
		
		return "partner/tasklist";
	}
	
	@RequestMapping(value = "/task/xls", method = RequestMethod.GET)
	public void taskXLS(Model model,HttpServletRequest request, HttpServletResponse response) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		try{
		
			if(userSession == null) {
			response.sendRedirect("/login");
			return ;
		}

		//TODO change hard coding
		Integer advisorPartyId = userSession.getPartyId(); //6326
		Integer buId = userSession.getBuId();
		String token = "153443";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_TASKLIST_URL + "/"+userSession.getUserName()+"/" + advisorPartyId + "/"+token+"&buId="+buId);
		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		List<Task> taskListAsJson = new ArrayList<Task> ();
		List<Task> taskList = new ArrayList<Task> ();
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				taskListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
				
				for(int i = 0; i<taskListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					Task task;
					task = objectMapper.readValue(objectMapper.writeValueAsString(taskListAsJson.get(i)), Task.class);
					Format format = new SimpleDateFormat(DATE_FORMAT_DD_MM_YYYY);
					
					if(task.getDueDateTime() != null){
						//task.setDueDateTimeString(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(task.getDueDateTime()));
						task.setDueDateTimeString(new SimpleDateFormat("dd-MMM-yyyy ").format(task.getDueDateTime()));
					}
					taskList.add(task);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
		cell.setCellValue("TASK OWNER");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("SUBJECT CATEGORY");
		}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("TASK FOR");
		}

		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("SUBJECT");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("DATE");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("PRIORITY");
	}
		{	HSSFCell cell =  excelRow.createCell(column++);
		cell.setCellStyle(style);
		cell.setCellValue("STATUS");
	}


		for(Task task:taskList){
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
			cell.setCellValue(task.getTargetContactType());
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
			cell.setCellValue(task.getPriorityName());
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue(task.getStatusName());
		}

			
			
		}

		
		workbook.write(response.getOutputStream());
		     
		} catch (IOException e) {
		    e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/task/csv", method = RequestMethod.GET)
	public void taskCSV(Model model,HttpServletRequest request, HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		try{
		
			if(userSession == null) {
			response.sendRedirect("/login");
			return ;
		}

		//TODO change hard coding
		Integer advisorPartyId = userSession.getPartyId(); //6326
		Integer buId = userSession.getBuId();
		String token = "153443";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_TASKLIST_URL + "/"+userSession.getUserName()+"/" + advisorPartyId + "/"+token+"&buId="+buId);
		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		List<Task> taskListAsJson = new ArrayList<Task> ();
		List<Task> taskList = new ArrayList<Task> ();
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				taskListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
				
				for(int i = 0; i<taskListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					Task task;
					task = objectMapper.readValue(objectMapper.writeValueAsString(taskListAsJson.get(i)), Task.class);
					Format format = new SimpleDateFormat(DATE_FORMAT_DD_MM_YYYY);
					
					if(task.getDueDateTime() != null){
						//task.setDueDateTimeString(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(task.getDueDateTime()));
						task.setDueDateTimeString(new SimpleDateFormat("dd-MMM-yyyy ").format(task.getDueDateTime()));
					}
					taskList.add(task);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

		
			response.addHeader("Content-Disposition", "attachment;filename=TaskList.csv");
			
			     
			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("TASK OWNER"));
			writer.print(",");
			writer.print(CommonUtils.escape("SUBJECT CATEGORY"));
			writer.print(",");
			writer.print(CommonUtils.escape("TASK FOR"));
			writer.print(",");
			writer.print(CommonUtils.escape("SUBJECT"));
			writer.print(",");
			writer.print(CommonUtils.escape("DATE"));
			writer.print(",");
			writer.print(CommonUtils.escape( "PRIORITY"));
			writer.print(",");
			writer.print(CommonUtils.escape("STATUS"));
			
			writer.println();
			for(Task task:taskList){
				writer.print(CommonUtils.escape(task.getOwnerPartyName()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getCategoryName()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getTargetContactType()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getSubject()));
				writer.print(",");
				writer.print(CommonUtils.escape(""+task.getDueDateTimeString()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getPriorityName()));
				writer.print(",");
				writer.print(CommonUtils.escape(task.getStatusName()));
				writer.println();
			}
		     
		} catch (IOException e) {
		    e.printStackTrace();
		}
	}

	
	@RequestMapping(value="/getAssignedDropdownvalues", method=RequestMethod.GET)
	public @ResponseBody PartyData getAssignedDropdownvalues(HttpServletRequest request){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		//TODO change hard coding
		Integer advisorPartyId = userSession.getPartyId();
		Integer buId = userSession.getBuId();
		String token = "153443";
		String advisorname = "ramu";
		//Integer advisorPartyId = 6375;
		PartyData partyData = null;
		
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSIGNEDTO_VALUES +"/"+ advisorname + "/"+token+"?partyId="+advisorPartyId+"&buId="+buId);
		BaseResponse<PartyData> baseResponse = new BaseResponse<PartyData>();
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();		
		try {
			//baseResponse.getResponseObject() gives LinkedHashMap which can not be cast to PartyData, so we need to convert the json object to PartyData
			partyData =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), PartyData.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return partyData;
		
	}
	
	@RequestMapping(value="/getTargetTypeDropdownvalues", method=RequestMethod.GET)
	public @ResponseBody List<KeyValue> getTargetTypeDropdownvalues(@RequestParam("targetType") String targetType,HttpServletRequest request){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		Integer buId = userSession.getBuId();
		String token = "153443";
		Integer advisorPartyId = userSession.getPartyId(); //6375
		Integer recordTypeId = null;
		//KeyValue keyValue = null;
		List<KeyValue> keyValueList = new ArrayList<KeyValue>();
		List<KeyValue> keyValueListAsJson = new ArrayList<KeyValue>();
		
		if(targetType.equalsIgnoreCase("Opportunity") || targetType.equalsIgnoreCase("OpportunityOpportunity") || targetType.equalsIgnoreCase("1")){
			recordTypeId = 14005;
		}else if(targetType.equalsIgnoreCase("Client") || targetType.equalsIgnoreCase("2")){
			recordTypeId = 14006;
		}else{
			recordTypeId = 14007;
		}
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(TARGETYPE_DROPDOWN_URL + "/"+userSession.getUserName()+"/" + advisorPartyId + "/"+recordTypeId+"/"+token+"?buId="+buId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();		
		try {
			//baseResponse.getResponseObject() gives LinkedHashMap which can not be cast to PartyData, so we need to convert the json object to PartyData
			//keyValue =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), KeyValue.class);
			
			keyValueListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
			
			for(int i = 0; i<keyValueListAsJson.size(); i++){
				//get the actual party object from its LinkedHashMap representation
				KeyValue keyValue = null;
				keyValue = objectMapper.readValue(objectMapper.writeValueAsString(keyValueListAsJson.get(i)), KeyValue.class);
				keyValueList.add(keyValue);
			}
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return keyValueList;
		
	}
	
	@RequestMapping(value="/codevalues", method=RequestMethod.GET)
	public @ResponseBody List<CodeValueData> dropdownInit(HttpServletRequest request){
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		List<CodeValueData> codeValueDataListAsJson = null;
		
		/*Integer buId = 153;
		String token = "153443";
		String advisorname = "ramu";
		String codeTypeIds = "17,18,19";
		List<CodeValueData> codeValueDataList = null;
		List<CodeValueData> codeValueDataListAsJson = null;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PICKLIST_VALUELIST + "/" + advisorname + "/"+token+"?buId="+buId+"&codeTypeIds="+codeTypeIds);
		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				codeValueDataListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return codeValueDataListAsJson;*/
		codeValueDataListAsJson = (List<CodeValueData>)request.getSession().getAttribute("codeValueDataListAsJson");
		return codeValueDataListAsJson;
	}
	private void initDropDown(HttpServletRequest request){
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			//return null;
		}
		Integer buId = 153;
		String token = "153443";
		String advisorname = "ramu";
		String codeTypeIds = "17,18,19";
		List<CodeValueData> codeValueDataList = null;
		List<CodeValueData> codeValueDataListAsJson = null;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_PICKLIST_VALUELIST + "/" + advisorname + "/"+token+"?buId="+buId+"&codeTypeIds="+codeTypeIds);
		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				codeValueDataListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.getSession().setAttribute("codeValueDataListAsJson", codeValueDataListAsJson);
		//return codeValueDataListAsJson;
	}
	@RequestMapping(value = "/searchTaskList", method = RequestMethod.GET)
	public @ResponseBody TaskListResponse searchTaskList(@RequestParam("advisorPartyId") Integer advisorPartyId, @QueryParam("buId") Integer buId,
			@RequestParam("subject") String subject,@RequestParam("status") String status,@RequestParam("subjectCategory") String subjectCategory,
			@RequestParam("assignedTo") String assignedTo, @RequestParam("priority") String priority,Model model,HttpServletRequest request) {
		String token = "153443";
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(TASKLIST_SEARCH_URL + "/"+userSession.getUserName()+"/" + token + "?buId="+buId);
		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		
		TaskSearchCriteria taskSearchCriteria = new TaskSearchCriteria();
		TaskListResponse taskListResponse = new TaskListResponse();
		
		
		List<TaskKeyValue> taskKeyValueList = new ArrayList<TaskKeyValue>();
		List<Task> taskListAsJson = new ArrayList<Task> ();
		List<Task> taskList = new ArrayList<Task> ();
		
		taskSearchCriteria.setAdvisorPartyId(userSession.getPartyId());
		//code for hierarchy 
		model.addAttribute("hierarchy", 1);
		Integer nodeId = Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
		taskSearchCriteria.setNodeId(nodeId);
		if (!StringUtils.isEmpty(subject)) {
			taskSearchCriteria.setSubject(subject);
		}
		if (!StringUtils.isEmpty(status)) {
			TaskKeyValue taskKeyValue = new TaskKeyValue();
			taskKeyValue.setId(Integer.parseInt(status)==-1?null:Integer.parseInt(status));
			taskKeyValue.setStatus(TaskSearchCriteriaEnum.STATUS);
			taskKeyValueList.add(taskKeyValue);
		}
		if (!StringUtils.isEmpty(subjectCategory)) {
			TaskKeyValue taskKeyValue = new TaskKeyValue();
			taskKeyValue.setId(Integer.parseInt(subjectCategory)==-1?null:Integer.parseInt(subjectCategory));
			taskKeyValue.setStatus(TaskSearchCriteriaEnum.SUBJECTCATEGORY);
			taskKeyValueList.add(taskKeyValue);
		}
		if (!StringUtils.isEmpty(assignedTo)) {
			TaskKeyValue taskKeyValue = new TaskKeyValue();
			taskKeyValue.setId(Integer.parseInt(assignedTo)==-1?null:Integer.parseInt(assignedTo));
			taskKeyValue.setStatus(TaskSearchCriteriaEnum.ASSIGNEDTO);
			taskKeyValueList.add(taskKeyValue);
		}
		if (!StringUtils.isEmpty(priority)) {
			TaskKeyValue taskKeyValue = new TaskKeyValue();
			taskKeyValue.setId(Integer.parseInt(priority)==-1?null:Integer.parseInt(priority));
			taskKeyValue.setStatus(TaskSearchCriteriaEnum.PRIORITY);
			taskKeyValueList.add(taskKeyValue);
		}
		taskSearchCriteria.setStatusList(taskKeyValueList);
		//call service for all parties associated 
				baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), taskSearchCriteria, BaseResponse.class);
				//br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), party, BaseResponse.class);
				
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				taskListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		for(int i = 0; i<taskListAsJson.size(); i++){
			//get the actual party object from its LinkedHashMap representation
			Task task;
			try {
				task = objectMapper.readValue(objectMapper.writeValueAsString(taskListAsJson.get(i)), Task.class);
				taskList.add(task);
				
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		/*model.addAttribute(TASKLIST, taskList);
		model.addAttribute(TOTALTASKS,taskListAsJson.size());
		model.addAttribute("begin","0");
		model.addAttribute("end","9");
		model.addAttribute("advisorPartyId",advisorPartyId);
		request.setAttribute(TASKLIST, taskList);
		model.addAttribute("buId",buId);*/
		taskListResponse.setTotalRecords(taskList.size());
		taskListResponse.setTaskList(taskList.size()>9?taskList.subList(0,10):taskList);
		request.getSession().setAttribute(TASKLIST, taskList);
		taskListResponse.setStartIndex(1);
		if(taskList.size()<10) {
			taskListResponse.setEndIndex(taskList.size());
		} else {
			taskListResponse.setEndIndex(10);
		}
		request.getSession().setAttribute("begin","0");
		request.getSession().setAttribute("end","9");
		
		return taskListResponse;
		
	}
	
	@RequestMapping(value="/task/delete", method=RequestMethod.GET)
	public String deleteTask(HttpServletRequest request,final RedirectAttributes redirectAttributes)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession"); 
		Integer buId = userSession.getBuId();
		String token = "1234";
		String taskIds = request.getParameter("taskIds");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(DELETE_TASK_FOR_TASKID+userSession.getUserName()+"/"+taskIds+"/"+ token);
		uriCB.queryParam("buId", buId);
		BaseResponse<Boolean> br = new BaseResponse<Boolean>();
		br = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), null, BaseResponse.class);
		String eventXML = "usp_DIY_deleteTaskForTaskId("+taskIds+")";
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{	audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_DELETE_TASK_SUCCESSFUL,TASK_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_DELETE_TASK,eventXML);
			redirectAttributes.addFlashAttribute("success", "success.task.delete");
			return "redirect:/partner/tasklist";
		}
		else
		{
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_DELETE_TASK_FAILED,TASK_SOURCE,FiinfraConstants.DIY_SOURCE_MODULE_DELETE_TASK,eventXML);
			redirectAttributes.addFlashAttribute("error", "error.task.delete");
			return "redirect:/partner/tasklist";
		}
		
		
	}
	
	
	@Produces("application/json")
	@RequestMapping(value = "/tasklist/nextPage", method = RequestMethod.GET)
	public @ResponseBody TaskListResponse showTaskListNextPage(Model model,HttpServletRequest request) {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return null;
		}
		Integer advisorPartyId = userSession.getPartyId(); //6326
		Integer buId = userSession.getBuId(); // 153
		
		int newBegin = Integer.parseInt(request.getSession().getAttribute("end").toString())+1;
		int newEnd = newBegin+10;
		
		TaskListResponse taskListResponse = new TaskListResponse();
		taskListResponse.setStartIndex(newBegin);
		taskListResponse.setEndIndex(newEnd);
		List<Task> nextTaskList = (List<Task>)request.getSession().getAttribute(TASKLIST);
		if(newBegin>=nextTaskList.size()){
			return null;
		}else if(newEnd > nextTaskList.size()){
			taskListResponse.setTaskList(nextTaskList.subList(newBegin,nextTaskList.size()));
			taskListResponse.setEndIndex(nextTaskList.size());
			request.getSession().setAttribute("begin",newBegin);
			request.getSession().setAttribute("end",nextTaskList.size());
		}else{
		taskListResponse.setTaskList(nextTaskList.subList(newBegin,newEnd));
		request.getSession().setAttribute("begin",newBegin);
		request.getSession().setAttribute("end",newEnd-1);
		}
		
		return taskListResponse;
	}
	
	@Produces("application/json")
	@RequestMapping(value = "/tasklist/previousPage", method = RequestMethod.GET)
	public @ResponseBody TaskListResponse showTaskListPreviousPage(Model model,HttpServletRequest request) {
		String advisorPartyId = request.getParameter("advisorPartyId");
		String buId = request.getParameter("buId");
		int newBegin = Integer.parseInt(request.getSession().getAttribute("begin").toString())-10;
		int newEnd = newBegin+10;
		
		//request.getSession().setAttribute("end",newEnd-1);
		TaskListResponse taskListResponse = new TaskListResponse();
		taskListResponse.setStartIndex(newBegin);
		taskListResponse.setEndIndex(newEnd);
		List<Task> taskList = (List<Task>)request.getSession().getAttribute(TASKLIST);
		if(newBegin< 0 ){
			return null;
		}else{
			taskListResponse.setTaskList(taskList.subList(newBegin,newEnd));
			request.getSession().setAttribute("begin",newBegin);
			request.getSession().setAttribute("end",newEnd-1);
		}
		
		return taskListResponse;
	}
	
	@RequestMapping(value = "/editTask/{taskId}", method = RequestMethod.GET)
	public String editTask(@PathVariable("taskId") Integer taskId,Model model,HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		String retUrl = request.getParameter("retUrl");
		if(retUrl != null) {
			model.addAttribute("retUrl", retUrl);
		} else {
			model.addAttribute("retUrl", "");
		}
		initDropDown(request);
		Integer advisorPartyId = userSession.getPartyId(); // 6375;
		Integer buId = userSession.getBuId(); //153
		//Integer taskId = 163951;
		
		String token = "153443";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(GET_TASK_BY_ID + "/"+userSession.getUserName()+"/" + taskId + "/" + token +"?buId="+buId);
		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		Task task = new Task();
		
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				task = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), Task.class);
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<KeyValue> keyValueListForOpportunity = getTargetTypeDropdownvalues("Opportunity",request);
		List<JsonData> targetTypeListForOpportunity = new ArrayList<JsonData>();
		for(KeyValue keyValue : keyValueListForOpportunity){
			JsonData jsonData = new JsonData();
			jsonData.setValue(keyValue.getId());
			jsonData.setText(keyValue.getName());
			targetTypeListForOpportunity.add(jsonData);
		}
		List<KeyValue> keyValueListForPremiumClient = getTargetTypeDropdownvalues("PremiumClient",request);
		List<JsonData> targetTypeListForPremiumClient = new ArrayList<JsonData>();
		for(KeyValue keyValue : keyValueListForPremiumClient){
			JsonData jsonData = new JsonData();
			jsonData.setValue(keyValue.getId());
			jsonData.setText(keyValue.getName());
			targetTypeListForPremiumClient.add(jsonData);
		}
		List<KeyValue> keyValueListForClient = getTargetTypeDropdownvalues("Client",request);
		List<JsonData> targetTypeListForClient = new ArrayList<JsonData>();
		for(KeyValue keyValue : keyValueListForClient){
			JsonData jsonData = new JsonData();
			jsonData.setValue(keyValue.getId());
			jsonData.setText(keyValue.getName());
			targetTypeListForClient.add(jsonData);
		}
		//targetTypeList.add(jsonDataDefault);
		model.addAttribute("targetTypeListForOpportunity",objectMapper.writeValueAsString(targetTypeListForOpportunity));
		model.addAttribute("targetTypeListForClient",objectMapper.writeValueAsString(targetTypeListForClient));
		model.addAttribute("targetTypeListForPremiumClient",objectMapper.writeValueAsString(targetTypeListForPremiumClient));
		task.setId(taskId);
		if(task.getTargetContactTypeId()==null)
		{
			task.setTargetContactTypeId(0);
		}
		model.addAttribute("task",task);
		model.addAttribute("doc1Details",task.getDocumentList().size()>=1 ? task.getDocumentList().get(0) : "");
		model.addAttribute("doc2Details",task.getDocumentList().size()>=2 ? task.getDocumentList().get(1) : "");
		model.addAttribute("doc3Details",task.getDocumentList().size()>=3 ? task.getDocumentList().get(2) : "");
		if(task.getDocumentList() != null){
		model.addAttribute("doc1",task.getDocumentList().size()>=1 ? task.getDocumentList().get(0).getFileName() : "");
		model.addAttribute("doc2",task.getDocumentList().size()>=2 ? task.getDocumentList().get(1).getFileName() : "");
		model.addAttribute("doc3",task.getDocumentList().size()>=3 ? task.getDocumentList().get(2).getFileName() : "");
		}
		model.addAttribute("advisorPartyId",advisorPartyId);
		return "partner/editTask";
	}
	
	@RequestMapping(value = "/addTask", method = RequestMethod.GET)
	public String addTask(Model model,HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {
		try {
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) {
				return "redirect:/login";
			}
			//for calendar  
			String taskDate = request.getParameter("date");
			if(taskDate != null){
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(taskDate);
			model.addAttribute("completionDtTime", new SimpleDateFormat("dd-MMM-yyyy").format(date));
			}
			initDropDown(request);
			List<KeyValue> keyValueListForOpportunity = getTargetTypeDropdownvalues("Opportunity",request);
			List<JsonData> targetTypeListForOpportunity = new ArrayList<JsonData>();
			for(KeyValue keyValue : keyValueListForOpportunity){
				JsonData jsonData = new JsonData();
				jsonData.setValue(keyValue.getId());
				jsonData.setText(keyValue.getName());
				targetTypeListForOpportunity.add(jsonData);
			}
			List<KeyValue> keyValueListForPremiumClient = getTargetTypeDropdownvalues("PremiumClient",request);
			List<JsonData> targetTypeListForPremiumClient = new ArrayList<JsonData>();
			for(KeyValue keyValue : keyValueListForPremiumClient){
				JsonData jsonData = new JsonData();
				jsonData.setValue(keyValue.getId());
				jsonData.setText(keyValue.getName());
				targetTypeListForPremiumClient.add(jsonData);
			}
			List<KeyValue> keyValueListForClient = getTargetTypeDropdownvalues("Client",request);
			List<JsonData> targetTypeListForClient = new ArrayList<JsonData>();
			for(KeyValue keyValue : keyValueListForClient){
				JsonData jsonData = new JsonData();
				jsonData.setValue(keyValue.getId());
				jsonData.setText(keyValue.getName());
				targetTypeListForClient.add(jsonData);
			}
			//targetTypeList.add(jsonDataDefault);
			model.addAttribute("targetTypeListForOpportunity",objectMapper.writeValueAsString(targetTypeListForOpportunity));
			model.addAttribute("targetTypeListForClient",objectMapper.writeValueAsString(targetTypeListForClient));
			model.addAttribute("targetTypeListForPremiumClient",objectMapper.writeValueAsString(targetTypeListForPremiumClient));
			Integer advisorPartyId = userSession.getPartyId();
			model.addAttribute("advisorPartyId",advisorPartyId);
			model.addAttribute("task",new Task());
			return "partner/addTask";
		} catch (ParseException e) 
		{
			LOGGER.debug("Exception"+e.getMessage());
		}
		return null;
	}
	private void audit(int actionByPartyId, int actionByUserId, int eventId, String sourceModule, String sourceScreen,String eventXML){
		try{
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);				
			audit.setActionByUserID(actionByUserId);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_MOBILE_PORTAL);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
			audit.setEventTextXML(eventXML);
			FrameworkUtil.audit(audit);
		} catch(Exception exception){
			LOGGER.error("Error occured while doing Audit", exception);
		}		
	}
}
