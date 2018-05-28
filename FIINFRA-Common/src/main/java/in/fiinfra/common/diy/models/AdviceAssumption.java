package in.fiinfra.common.diy.models;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class AdviceAssumption {
	
	@JsonProperty
	private Integer id;
	@JsonProperty
	private Integer recordTypeId;
	@JsonProperty
	private Integer partyId;
	@JsonProperty
	private Object assumptionValue;
	@JsonProperty
	private Integer assumptionCodeId;
	@JsonProperty
	private Integer valueDataTypeId;
	@JsonProperty
	private String valueStartRange;
	@JsonProperty
	private String valueEndRange;
	@JsonProperty
	private Integer createdBy;
	@JsonProperty
	private Integer lastModifiedBy;
	@JsonProperty
	private String displayLabel;
	
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
	public Object getAssumptionValue() {
		return assumptionValue;
	}
	public void setAssumptionValue(Object assumptionValue) {
		this.assumptionValue = assumptionValue;
	}
	public Integer getAssumptionCodeId() {
		return assumptionCodeId;
	}
	public void setAssumptionCodeId(Integer assumptionCodeId) {
		this.assumptionCodeId = assumptionCodeId;
	}
	public Integer getValueDataTypeId() {
		return valueDataTypeId;
	}
	public void setValueDataTypeId(Integer valueDataTypeId) {
		this.valueDataTypeId = valueDataTypeId;
	}
	public String getValueStartRange() {
		return valueStartRange;
	}
	public void setValueStartRange(String valueStartRange) {
		this.valueStartRange = valueStartRange;
	}
	public String getValueEndRange() {
		return valueEndRange;
	}
	public void setValueEndRange(String valueEndRange) {
		this.valueEndRange = valueEndRange;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public Integer getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(Integer lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public String getDisplayLabel() {
		return displayLabel;
	}
	public void setDisplayLabel(String displayLabel) {
		this.displayLabel = displayLabel;
	}
//	@Override
//	public String toString() {
//		return new ReflectionToStringBuilder(this).toString();
//	}
}
