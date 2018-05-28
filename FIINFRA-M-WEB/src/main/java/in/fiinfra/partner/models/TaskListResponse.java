/**
 * 
 */
package in.fiinfra.partner.models;

import in.fiinfra.common.diy.models.Task;

import java.util.List;

/**
 * @author Kunal
 *
 */
public class TaskListResponse {

	private int startIndex;
	private int endIndex;
	private int totalRecords;
	List<Task> taskList;
	
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public List<Task> getTaskList() {
		return taskList;
	}
	public void setTaskList(List<Task> taskList) {
		this.taskList = taskList;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	
	
}
