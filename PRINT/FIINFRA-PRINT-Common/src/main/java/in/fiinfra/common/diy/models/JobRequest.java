package in.fiinfra.common.diy.models;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;


@JsonIgnoreProperties(ignoreUnknown = true)

public class JobRequest implements Serializable {

	
	

	
	@JsonProperty
	private String Param1namevalue;
	@JsonProperty
	private String Param2namevalue;
	@JsonProperty
	private String Param3namevalue;
	@JsonProperty
	private String Param4namevalue;
	
	@JsonProperty
	private String BatchJobRequestQTypeID;
	
	
	
	public String getBatchJobRequestQTypeID() {
		return BatchJobRequestQTypeID;
	}
	public void setBatchJobRequestQTypeID(String batchJobRequestQTypeID) {
		BatchJobRequestQTypeID = batchJobRequestQTypeID;
	}
	public String getParam1namevalue() {
		return Param1namevalue;
	}
	public void setParam1namevalue(String param1namevalue) {
		Param1namevalue = param1namevalue;
	}
	public String getParam2namevalue() {
		return Param2namevalue;
	}
	public void setParam2namevalue(String param2namevalue) {
		Param2namevalue = param2namevalue;
	}
	public String getParam3namevalue() {
		return Param3namevalue;
	}
	public void setParam3namevalue(String param3namevalue) {
		Param3namevalue = param3namevalue;
	}
	public String getParam4namevalue() {
		return Param4namevalue;
	}
	public void setParam4namevalue(String param4namevalue) {
		Param4namevalue = param4namevalue;
	}
	
	
	
	
	
}
