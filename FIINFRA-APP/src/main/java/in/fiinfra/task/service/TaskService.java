package in.fiinfra.task.service;

import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.TaskSearchCriteria;

import java.util.List;

public interface TaskService 
{
	public List<Task> getListOfTask(Integer partyId,String taskSearchValue,Integer nodeId);
	
	public Boolean updateTask(Task task);
	
	public Boolean saveTask(Task task);
	
	public List<String> saveTask1(Task task);
	
	public List<KeyValue> getPartyIdNameForAdvisorAndRecordType(Integer ownerPartyId,Integer recordTypeId);
	
	public List<KeyValue> getTeamMembersForParty(Integer partyId);

	public List<Task> getTasksForAdvisorWithSearchCriteria(TaskSearchCriteria taskSearchCriteria);
	
	public Boolean deleteTask(String listOfTaskId);
	
	public Task getTaskForTaskId(Integer taskId);
}
