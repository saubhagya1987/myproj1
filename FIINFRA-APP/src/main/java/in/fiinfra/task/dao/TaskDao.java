package in.fiinfra.task.dao;

import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.TaskSearchCriteria;

import java.util.List;

public interface TaskDao
{
	public Boolean insertOrUpdateTask(Task task,String xmlDocument);
	
	public List<String> insertOrUpdateTask1(Task task,String xmlDocument);
	
	public List<KeyValue> getPartyIdNameForAdvisorAndRecordType(Integer ownerPartyId,Integer recordTypeId);
	
	public List<KeyValue> getTeamMembersForParty(Integer partyId);

	public List<Task> getTasksForAdvisorWithSearchCriteria(TaskSearchCriteria taskSearchCriteria);
	
	public Boolean deleteTask(String listOfTaskId);
	
	public Task getTaskForTaskId(Integer taskId);

}
