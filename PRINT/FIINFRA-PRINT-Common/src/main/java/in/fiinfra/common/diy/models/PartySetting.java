package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonProperty;

public class PartySetting 
{
	@JsonProperty
	private Integer id;
	
	@JsonProperty
	private Integer recordTypeId;
	
	@JsonProperty
	private Integer partyId;
	
	@JsonProperty
	private Integer attributeCodeId;
	
	@JsonProperty
	private Object attributeValue;
	
	@JsonProperty
	private Integer valueDataTypeId;
	
	@JsonProperty
	private String defaultValue;
	
	@JsonProperty
	private String startRange;
	
	@JsonProperty
	private String endRange;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getRecordTypeId() {
		return recordTypeId;
	}
	
	public void setRecordTypeId(Integer recordTypeId) {
		this.recordTypeId = recordTypeId;
	}
	
	public Integer getPartyId() {
		return partyId;
	}
	
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	
	public Integer getAttributeCodeId() {
		return attributeCodeId;
	}
	
	public void setAttributeCodeId(Integer attributeCodeId) {
		this.attributeCodeId = attributeCodeId;
	}
	
	public Object getAttributeValue() {
		return attributeValue;
	}
	
	public void setAttributeValue(Object attributeValue) {
		this.attributeValue = attributeValue;
	}
	
	public Integer getValueDataTypeId() {
		return valueDataTypeId;
	}
	
	public void setValueDataTypeId(Integer valueDataTypeId) {
		this.valueDataTypeId = valueDataTypeId;
	}
	
	public String getStartRange() {
		return startRange;
	}
	
	public void setStartRange(String startRange) {
		this.startRange = startRange;
	}
	
	public String getEndRange() {
		return endRange;
	}
	
	public void setEndRange(String endRange) {
		this.endRange = endRange;
	}
	
	public String getDefaultValue() {
		return defaultValue;
	}
	
	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}
}
