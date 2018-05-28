package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown=true)
public class KeyValue
{
	@JsonProperty
	private Integer id;
	@JsonProperty
	private String name;
	
	public KeyValue(){
		
	}
	public KeyValue(Integer id, String name){
		this.id= id;
		this.name = name;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

		
	
}
