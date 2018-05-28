package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonProperty;

public class DcInputData {

	@JsonProperty
	private Integer id;

	@JsonProperty
	private Integer partyId;

	@JsonProperty
	private Integer fpPlanId;

	@JsonProperty
	private Integer attributeCodeId;

	@JsonProperty
	private Object attributeValue;

	@JsonProperty
	private Integer attributeValueDataTypeId;

	@JsonProperty
	private Object attributeReferenceValue;

	@JsonProperty
	private Integer attributeSequenceNo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPartyId() {
		return partyId;
	}

	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}

	public Integer getFpPlanId() {
		return fpPlanId;
	}

	public void setFpPlanId(Integer fpPlanId) {
		this.fpPlanId = fpPlanId;
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

	public Integer getAttributeValueDataTypeId() {
		return attributeValueDataTypeId;
	}

	public void setAttributeValueDataTypeId(Integer attributeValueDataTypeId) {
		this.attributeValueDataTypeId = attributeValueDataTypeId;
	}

	public Object getAttributeReferenceValue() {
		return attributeReferenceValue;
	}

	public void setAttributeReferenceValue(Object attributeReferenceValue) {
		this.attributeReferenceValue = attributeReferenceValue;
	}

	public Integer getAttributeSequenceNo() {
		return attributeSequenceNo;
	}

	public void setAttributeSequenceNo(Integer attributeSequenceNo) {
		this.attributeSequenceNo = attributeSequenceNo;
	}

	
}
