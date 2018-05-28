package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonProperty;


public class User {
	
	@JsonProperty
	private Integer id;
	@JsonProperty
	private Integer name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getName() {
		return name;
	}

	public void setName(Integer name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + "]";
	}
}
