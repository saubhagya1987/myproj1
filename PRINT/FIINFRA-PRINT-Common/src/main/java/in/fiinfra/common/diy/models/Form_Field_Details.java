package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Form_Field_Details {
	@JsonProperty
	private String FORM_ID;
	@JsonProperty
	private Integer FIELD_ID;
	@JsonProperty
	private String FIELD_NAME;
	@JsonProperty
	private String FIELD_TYPE;
	@JsonProperty
	private String FIELD_DATATYPE;
	@JsonProperty
	private String FIELD_SIZE;
	@JsonProperty
	private String FORM_NAME;
	@JsonProperty
	private String SOURCE_FIELD_NAME;
	public String getFORM_ID() {
		return FORM_ID;
	}
	public void setFORM_ID(String fORM_ID) {
		FORM_ID = fORM_ID;
	}
	
	public Integer getFIELD_ID() {
		return FIELD_ID;
	}
	public void setFIELD_ID(Integer fIELD_ID) {
		FIELD_ID = fIELD_ID;
	}
	public String getFIELD_NAME() {
		return FIELD_NAME;
	}
	public void setFIELD_NAME(String fIELD_NAME) {
		FIELD_NAME = fIELD_NAME;
	}
	public String getFIELD_TYPE() {
		return FIELD_TYPE;
	}
	public void setFIELD_TYPE(String fIELD_TYPE) {
		FIELD_TYPE = fIELD_TYPE;
	}
	public String getFIELD_DATATYPE() {
		return FIELD_DATATYPE;
	}
	public void setFIELD_DATATYPE(String fIELD_DATATYPE) {
		FIELD_DATATYPE = fIELD_DATATYPE;
	}
	public String getFIELD_SIZE() {
		return FIELD_SIZE;
	}
	public void setFIELD_SIZE(String fIELD_SIZE) {
		FIELD_SIZE = fIELD_SIZE;
	}
	public String getFORM_NAME() {
		return FORM_NAME;
	}
	public void setFORM_NAME(String fORM_NAME) {
		FORM_NAME = fORM_NAME;
	}
	public String getSOURCE_FIELD_NAME() {
		return SOURCE_FIELD_NAME;
	}
	public void setSOURCE_FIELD_NAME(String sOURCE_FIELD_NAME) {
		SOURCE_FIELD_NAME = sOURCE_FIELD_NAME;
	}

}
