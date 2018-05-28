package in.fiinfra.task.dao;


import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.TaskKeyValue;
import in.fiinfra.common.diy.models.TaskSearchCriteria;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.TaskSearchCriteriaEnum;
import in.fiinfra.utility.dao.DCDaoImpl;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("taskDao")
public class TaskDaoImpl implements TaskDao 
{
	@Autowired
	JdbcTemplate jdbcTemplate;
	private static final Logger logger = Logger.getLogger(TaskDaoImpl.class);
	
	private static final String SP_RETRIVE_TASK_BY_SEARCH_CRITERIA = "{CALL usp_DIY_getTasksOriginatedByPartyID(?,?,?,?,?,?,?,?)}";
	private static final String SP_INSERT_OR_UPDATE_TASK_FOR_TASKID = "{CALL usp_DIY_insertOrUpdateTask(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_RETRIVE_TASK_FOR_TASKID = "{CALL usp_DIY_getTaskForTaskId(?)}";
	private static final String SP_RETRIVE_DOCUMENTS_FOR_DOCUMENTID = "{CALL usp_DIY_getDocumentsForDocumentIds(?,?,?)}";
	private static final String SP_RETRIVE_PARTY_NAME_FOR_ADVISOR_AND_RECORD_TYPE = "{CALL usp_DIY_getPartyNameByAdvisorAndRecordType(?,?)}";
	private static final String SP_RETRIVE_TEAM_MEMBERS_FOR_PARTY_ID = "{CALL usp_DIY_getTeamMembersForParty(?,?)}";
	private static final String SP_DELETE_TASK_FOR_TASK_ID = "{CALL usp_DIY_deleteTaskForTaskId(?)}";

	//returns list of task for TaskOriginatedByPartyID 
	
	@Override
	public List<Task> getTasksForAdvisorWithSearchCriteria(TaskSearchCriteria taskSearchCriteria) 
	{
		List<TaskKeyValue> taskValues = taskSearchCriteria.getStatusList();
				
		String taskSubject=taskSearchCriteria.getSubject();
		Integer advisorPartyID=taskSearchCriteria.getAdvisorPartyId();	
		Integer taskOwnenrPartyID=null;
		Integer taskStatusID=null;//19001; 
		Integer taskTypeID=null;//17004;		
		Integer taskPriorityID=null;//18003;
		String taskSearchValue = taskSearchCriteria.getTaskSearchValue();
		Integer nodeId = taskSearchCriteria.getNodeId();
		
		if (CollectionUtils.isNotEmpty(taskValues)) 
		{
			for (TaskKeyValue taskKeyValue : taskValues) {
				if (taskKeyValue.getStatus() == TaskSearchCriteriaEnum.ASSIGNEDTO) {
					taskOwnenrPartyID = taskKeyValue.getId();
				} else if (taskKeyValue.getStatus() == TaskSearchCriteriaEnum.PRIORITY) {
					taskPriorityID = taskKeyValue.getId();
				} else if (taskKeyValue.getStatus() == TaskSearchCriteriaEnum.STATUS) {
					taskStatusID = taskKeyValue.getId();
				} else if (taskKeyValue.getStatus() == TaskSearchCriteriaEnum.SUBJECTCATEGORY) {
					taskTypeID = taskKeyValue.getId();
				}
			}
		}
		logger.info("-----------Before Calling SP In APP(getTasksForAdvisorWithSearchCriteria)-----------");
		List<Task> tasks =  jdbcTemplate.query(SP_RETRIVE_TASK_BY_SEARCH_CRITERIA, new Object[]{advisorPartyID,taskSearchValue, taskSubject, taskStatusID, taskTypeID, taskOwnenrPartyID, taskPriorityID, nodeId}, 
		    new BeanPropertyRowMapper<Task>(Task.class));
		logger.info("-----------After Calling SP In APP(getTasksForAdvisorWithSearchCriteria)-----------");
		  return tasks;
	}
	
	
	@Override
	public Task getTaskForTaskId(Integer taskId) 
	{
		Task task = new Task();
		List<Task> tasks = jdbcTemplate.query(SP_RETRIVE_TASK_FOR_TASKID, new Object[] {taskId}, new BeanPropertyRowMapper<Task>(Task.class));
		  if(CollectionUtils.isNotEmpty(tasks))
		  {
		   task= tasks.get(0);
		   List<Document> documents =jdbcTemplate.query(SP_RETRIVE_DOCUMENTS_FOR_DOCUMENTID, new Object[] {task.getAttachment1DocumentID(),task.getAttachment2DocumentID(),
				     task.getAttachment3DocumentID()},new BeanPropertyRowMapper<Document>(Document.class));
		   task.setDocumentList(documents);
		  }
		  return task;
		
	}





	//UPDATED TASK FOR TASK ID
	@Override
	public Boolean insertOrUpdateTask(Task task,String xmlDocument) 
	{
		//TODO need to replace with session variable
		Integer lastModifiedBy=task.getCreatedBy(); 
		Integer createdBy=task.getCreatedBy();
		Integer attachedDocument=0;
		if(CollectionUtils.isNotEmpty(task.getDocumentList()))
		{
			attachedDocument = task.getDocumentList().size();
		}
		logger.info("-----------Before Calling SP In APP(insertOrUpdateTask)-----------");
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_TASK_FOR_TASKID, new Object[] {task.getId(),task.getOwnerPartyId(),
				task.getCategoryId(),task.getTargetContactTypeId(),task.getStatusId(),task.getPriorityId(),task.getTargetPartyId(),
				task.getDueDateTime(),task.getCompletionDateTime(),task.getSubject(),task.getDescription(),lastModifiedBy,createdBy,xmlDocument,attachedDocument,task.getOriginatedPartyId(),task.getTaskEndDate(),task.getAttachment1DocumentID(),task.getAttachment2DocumentID(),task.getAttachment3DocumentID()});
		logger.info("-----------After Calling SP In APP(insertOrUpdateTask)-----------");
		return true;
	}

	//UPDATED TASK FOR TASK ID
	@Override
	public List<String> insertOrUpdateTask1(Task task,String xmlDocument) 
	{
	//	System.out.println("in new opp ");
		Integer lastModifiedBy=task.getCreatedBy(); 
		Integer createdBy=task.getCreatedBy();
		Integer attachedDocument=0;
		String taskDocPath=null;
		if(CollectionUtils.isNotEmpty(task.getDocumentList()))
		{
			attachedDocument = task.getDocumentList().size();
		}
		
//		jdbcTemplate.update(SP_INSERT_OR_UPDATE_TASK_FOR_TASKID, new Object[] {task.getId(),task.getOwnerPartyId(),
//				task.getCategoryId(),task.getTargetContactTypeId(),task.getStatusId(),task.getPriorityId(),task.getTargetPartyId(),
//				task.getDueDateTime(),task.getCompletionDateTime(),task.getSubject(),task.getDescription(),lastModifiedBy,
//				createdBy,xmlDocument,attachedDocument,task.getOriginatedPartyId()});
		List<String> resultList=new ArrayList<>();
		Task opportunityData=new Task();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure1 = new CommonStoredProcedure(
				jdbcTemplate, "usp_DIY_insertOrUpdateTask");
		SqlParameter idParam = new SqlParameter("id", Types.INTEGER);
		SqlParameter ownerPartrIdParam = new SqlParameter("ownerPartrId", Types.INTEGER);
		SqlParameter categoryIdParam = new SqlParameter("categoryId", Types.INTEGER);
		SqlParameter targetContacttypeIdParam = new SqlParameter("targetContacttype", Types.INTEGER);
		SqlParameter statusIdParam = new SqlParameter("statusId", Types.INTEGER);
		SqlParameter priorityIdParam = new SqlParameter("priorityId", Types.INTEGER);
		SqlParameter targetPartyIdParam = new SqlParameter("targetPartyId", Types.INTEGER);
		SqlParameter duedateParam = new SqlParameter("duedate", Types.TIMESTAMP);
		SqlParameter completiondateParam = new SqlParameter("completiondate", Types.TIMESTAMP);
		SqlParameter subjectParam = new SqlParameter("subject", Types.VARCHAR);
		SqlParameter descriptionParam = new SqlParameter("description", Types.VARCHAR);
		SqlParameter lastmodiifedParam = new SqlParameter("lastmodiifed", Types.VARCHAR);
		SqlParameter createdbyParam = new SqlParameter("createdby", Types.VARCHAR);
		SqlParameter xmldocumentParam = new SqlParameter("xmldocument", Types.VARCHAR);
		SqlParameter AttachedDocParam = new SqlParameter("AttachedDoc", Types.INTEGER);
		SqlParameter OriginatedbyPartyParam = new SqlParameter("OriginatedbyParty", Types.INTEGER);
		SqlParameter endDateParam = new SqlParameter("enddate", Types.TIMESTAMP);	
		
		SqlParameter attachmentid1 = new SqlParameter("attachmentid1", Types.INTEGER);	
		SqlParameter attachmentid2 = new SqlParameter("attachmentid2", Types.INTEGER);	
		SqlParameter attachmentid3 = new SqlParameter("attachmentid3", Types.INTEGER);	
		 
		
		
		SqlOutParameter taskPathParam = new SqlOutParameter("taskPath", Types.VARCHAR);
		
		
		//System.out.println("opPartyIdParam"+opPartyIdParam);
		SqlParameter[] paramArray = { idParam,ownerPartrIdParam,categoryIdParam,targetContacttypeIdParam,statusIdParam,priorityIdParam,targetPartyIdParam
				,duedateParam,completiondateParam,subjectParam,descriptionParam,lastmodiifedParam,createdbyParam
				,xmldocumentParam,AttachedDocParam,OriginatedbyPartyParam,endDateParam,attachmentid1,attachmentid2,attachmentid3,taskPathParam};
		myStoredProcedure1.setParameters(paramArray);
		myStoredProcedure1.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
/*		System.out.println("id   "+task.getId());
		System.out.println("ownerPartrId   "+task.getOwnerPartyId());
		System.out.println("categoryId"+task.getCategoryId());
		System.out.println("targetContacttype   "+task.getTargetContactTypeId());
		System.out.println("statusId   "+task.getStatusId());
		System.out.println("priorityId   "+task.getPriorityId());
		System.out.println("targetPartyId   "+task.getTargetPartyId());
		System.out.println("duedate   "+task.getDueDateTime());
		System.out.println("completiondate   "+task.getCompletionDateTime());
		System.out.println("subject   "+task.getSubject());
		System.out.println("description   "+task.getDescription());
		System.out.println("lastmodiifed   "+lastModifiedBy);
		System.out.println("createdby   "+createdBy);
		System.out.println("xmldocument   "+xmlDocument);
		System.out.println("AttachedDoc   "+attachedDocument);
		System.out.println("OriginatedbyParty   "+task.getOriginatedPartyId());*/
		paranValues.put("id",task.getId());
		paranValues.put("ownerPartrId", task.getOwnerPartyId());		
		paranValues.put("categoryId", task.getCategoryId());		
		paranValues.put("targetContacttype", task.getTargetContactTypeId());
		paranValues.put("statusId",task.getStatusId());
		paranValues.put("priorityId",task.getPriorityId() );
		paranValues.put("targetPartyId",task.getTargetPartyId() );
		paranValues.put("duedate",task.getDueDateTime() );
		paranValues.put("completiondate",task.getCompletionDateTime() );
		paranValues.put("subject",task.getSubject() );
		paranValues.put("description",task.getDescription() );
		paranValues.put("lastmodiifed",lastModifiedBy );
		paranValues.put("createdby",createdBy );
		paranValues.put("xmldocument",xmlDocument );
		paranValues.put("AttachedDoc",attachedDocument );
				paranValues.put("OriginatedbyParty",task.getOriginatedPartyId());
				paranValues.put("enddate",task.getTaskEndDate() );
				
				paranValues.put("attachmentid1",task.getAttachment1DocumentID());
				paranValues.put("attachmentid2",task.getAttachment2DocumentID());
				paranValues.put("attachmentid3",task.getAttachment3DocumentID());
		
	//	System.out.println("paranValues:--" + paranValues);
	//	System.out.println("XML"+xmlDocument);
		Map<String, Object> storedProcResult1 = myStoredProcedure1
				.execute(paranValues);


	 if(storedProcResult1.get("taskPath").toString() == null)

		{
			taskDocPath="NoDoc";
		}
		else
		{
		taskDocPath=storedProcResult1.get("taskPath").toString() ;
		}
//		System.out.println("rec----------------"+taskDocPath);
		resultList.add(taskDocPath);
		return resultList;
	}
	
	
	@Override
	public List<KeyValue> getPartyIdNameForAdvisorAndRecordType(Integer ownerPartyId,
			Integer recordTypeId) 
	{
		return jdbcTemplate.query(SP_RETRIVE_PARTY_NAME_FOR_ADVISOR_AND_RECORD_TYPE, new Object[] {ownerPartyId,recordTypeId},new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}
	
	
	@Override
	public List<KeyValue> getTeamMembersForParty(Integer partyId) 
	{
		Integer recoedTypeId = 14008;
		List<KeyValue> keyValues = jdbcTemplate.query(SP_RETRIVE_TEAM_MEMBERS_FOR_PARTY_ID, new Object[] {partyId,recoedTypeId},new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
		return keyValues;
	}

	//to delete task along with documents attached to it
	@Override
	public Boolean deleteTask(String listOfTaskId) 
	{
		jdbcTemplate.update(SP_DELETE_TASK_FOR_TASK_ID, new Object[] {listOfTaskId});
		return true;
	}

	

}
