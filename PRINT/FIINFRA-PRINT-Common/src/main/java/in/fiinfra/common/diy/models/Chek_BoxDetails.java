package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Chek_BoxDetails {

	@JsonProperty
	private Integer Form_ID;

	@JsonProperty
	private String Field_Name;

	@JsonProperty
	private String Field_Value;
	
	@JsonProperty
	private Integer Field_IND;

	public Integer getForm_ID() {
		return Form_ID;
	}

	public void setForm_ID(Integer form_ID) {
		Form_ID = form_ID;
	}

	public String getField_Name() {
		return Field_Name;
	}

	public void setField_Name(String field_Name) {
		Field_Name = field_Name;
	}

	public String getField_Value() {
		return Field_Value;
	}

	public void setField_Value(String field_Value) {
		Field_Value = field_Value;
	}

	public Integer getField_IND() {
		return Field_IND;
	}

	public void setField_IND(Integer field_IND) {
		Field_IND = field_IND;
	}
	

	
}
