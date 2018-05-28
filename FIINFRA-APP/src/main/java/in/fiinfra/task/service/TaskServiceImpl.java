package in.fiinfra.task.service;

import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.TaskSearchCriteria;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.task.dao.TaskDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("taskService")
public class TaskServiceImpl implements TaskService 
{
	@Autowired
	TaskDao taskDao;
	

	@Override
	public List<Task> getListOfTask(Integer partyId,String taskSearchValue,Integer nodeId) 
	{
		TaskSearchCriteria taskSearchCriteria = new TaskSearchCriteria();
		taskSearchCriteria.setAdvisorPartyId(partyId);
		taskSearchCriteria.setTaskSearchValue(taskSearchValue);
		taskSearchCriteria.setNodeId(nodeId);
		return taskDao.getTasksForAdvisorWithSearchCriteria(taskSearchCriteria);
		
	}

	@Override
	public Boolean updateTask(Task task)
	{
		String xmlDocument = convertDocumentToXML(task.getDocumentList());
		return taskDao.insertOrUpdateTask(task,xmlDocument);
	}

			
	@Override
	public Boolean saveTask(Task task) 
	{
		String xmlDocument = convertDocumentToXML(task.getDocumentList());
		return taskDao.insertOrUpdateTask(task,xmlDocument);
	}

	 
	@Override
	public List<String> saveTask1(Task task) 
	{
		String xmlDocument = convertDocumentToXML(task.getDocumentList());
		return taskDao.insertOrUpdateTask1(task,xmlDocument);
	}

	@Override
	public List<KeyValue> getPartyIdNameForAdvisorAndRecordType(Integer ownerPartyId,
			Integer recordTypeId) 
	{
		return taskDao.getPartyIdNameForAdvisorAndRecordType(ownerPartyId, recordTypeId);
	}

	@Override
	public List<KeyValue> getTeamMembersForParty(Integer partyId)
	{
		return taskDao.getTeamMembersForParty(partyId);
	}

	@Override
	public List<Task> getTasksForAdvisorWithSearchCriteria(TaskSearchCriteria taskSearchCriteria) {
		return taskDao.getTasksForAdvisorWithSearchCriteria(taskSearchCriteria);
	}
	
	public String convertDocumentToXML(List<Document> documentDatas)
	{
		String xmlDocument = FiinfraUtility.getDocumentDataXML(documentDatas);
		return xmlDocument;
	}

	//to delete task along with documents attached to it
	@Override
	public Boolean deleteTask(String listOfTaskId) 
	{
		return taskDao.deleteTask(listOfTaskId);
	}

	//to retrieve task
	@Override
	public Task getTaskForTaskId(Integer taskId) 
	{
		return taskDao.getTaskForTaskId(taskId);
	}
	
	
	
}
