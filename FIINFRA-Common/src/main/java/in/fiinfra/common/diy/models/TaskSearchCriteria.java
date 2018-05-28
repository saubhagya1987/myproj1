package in.fiinfra.common.diy.models;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown=true)
public class TaskSearchCriteria {

	@JsonProperty
	private List<TaskKeyValue> statusList;
	@JsonProperty
	private String subject;
	@JsonProperty
	private Integer advisorPartyId;
	@JsonProperty
	private String taskSearchValue;
	@JsonProperty
	private Integer nodeId;
	
	public Integer getNodeId() {
		return nodeId;
	}
	public void setNodeId(Integer nodeId) {
		this.nodeId = nodeId;
	}
	public String getTaskSearchValue() {
		return taskSearchValue;
	}
	public void setTaskSearchValue(String taskSearchValue) {
		this.taskSearchValue = taskSearchValue;
	}
	public List<TaskKeyValue> getStatusList() {
		return statusList;
	}
	public void setStatusList(List<TaskKeyValue> statusList) {
		this.statusList = statusList;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Integer getAdvisorPartyId() {
		return advisorPartyId;
	}
	public void setAdvisorPartyId(Integer advisorPartyId) {
		this.advisorPartyId = advisorPartyId;
	}
	
	
}
