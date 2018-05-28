package in.fiinfra.common.diy.models;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

public class GoalAttribute {
	
	@JsonProperty
	private Integer goalAttributeID;
	@JsonProperty
	private Integer goalID;
	@JsonProperty
	private String attributeName;
	@JsonProperty
	private String attributeValue;
	@JsonProperty
	private Integer valueDataTypeID;
	@JsonProperty
	private Integer createdBy;
	
	public Integer getGoalAttributeID() {
		return goalAttributeID;
	}
	public void setGoalAttributeID(Integer goalAttributeID) {
		this.goalAttributeID = goalAttributeID;
	}
	public Integer getGoalID() {
		return goalID;
	}
	public void setGoalID(Integer goalID) {
		this.goalID = goalID;
	}
	public String getAttributeName() {
		return attributeName;
	}
	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}
	public String getAttributeValue() {
		return attributeValue;
	}
	public void setAttributeValue(String attributeValue) {
		this.attributeValue = attributeValue;
	}
	public Integer getValueDataTypeID() {
		return valueDataTypeID;
	}
	public void setValueDataTypeID(Integer valueDataTypeID) {
		this.valueDataTypeID = valueDataTypeID;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
//	@Override
//	public String toString() {
//		return new ReflectionToStringBuilder(this).toString();
//	}	
}
