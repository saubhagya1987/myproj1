/**
 * 
 */
package in.fiinfra.common.diy.models;

import in.fiinfra.common.util.TaskSearchCriteriaEnum;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Kunal
 *
 */
@JsonIgnoreProperties(ignoreUnknown=true)
public class TaskKeyValue {

	@JsonProperty
	private Integer id;
	
	@JsonProperty
	private TaskSearchCriteriaEnum status;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TaskSearchCriteriaEnum getStatus() {
		return status;
	}

	public void setStatus(TaskSearchCriteriaEnum status) {
		this.status = status;
	}

}
