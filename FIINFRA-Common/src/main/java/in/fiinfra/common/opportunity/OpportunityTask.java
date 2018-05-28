package in.fiinfra.common.opportunity;

public class OpportunityTask {
	private String TaskName;
	private int oppID;
	private int TaskId;
	private String taskDueDate;
	private String taskComplDate;
	
	public int getTaskId() {
		return TaskId;
	}
	public void setTaskId(int taskId) {
		TaskId = taskId;
	}
	public String getTaskDueDate() {
		return taskDueDate;
	}
	public void setTaskDueDate(String taskDueDate) {
		this.taskDueDate = taskDueDate;
	}
	public String getTaskComplDate() {
		return taskComplDate;
	}
	public void setTaskComplDate(String taskComplDate) {
		this.taskComplDate = taskComplDate;
	}
	public String getTaskName() {
		return TaskName;
	}
	public void setTaskName(String taskName) {
		TaskName = taskName;
	}
	public int getOppID() {
		return oppID;
	}
	public void setOppID(int oppID) {
		oppID = oppID;
	}
	
}
