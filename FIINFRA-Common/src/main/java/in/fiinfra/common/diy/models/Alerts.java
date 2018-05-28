package in.fiinfra.common.diy.models;

import in.fiinfra.common.common.QueryData;

import java.io.Serializable;
import java.util.List;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Alerts implements Serializable 
{
	private static final long serialVersionUID = -5361504352655003959L;
	@JsonProperty
	List<Task> listOfTask;
	@JsonProperty
	List<QueryData> listOfQuery;
	
	public List<Task> getListOfTask() {
		return listOfTask;
	}
	public void setListOfTask(List<Task> listOfTask) {
		this.listOfTask = listOfTask;
	}
	public List<QueryData> getListOfQuery() {
		return listOfQuery;
	}
	public void setListOfQuery(List<QueryData> listOfQuery) {
		this.listOfQuery = listOfQuery;
	}
	
//	@Override
//	public String toString() 
//	{
//		return new ReflectionToStringBuilder(this).toString();
//	}
	

}
