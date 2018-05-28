package in.fiinfra.common.common;

import java.util.List;

public class PartyAttributeData {
	private String attributeValue;
	private int seqNo;
	private int attributeCodeId;
	private int partyId;
	List<CodeValueData> lstCodeValueData;
	private String attributereferenceValue;
	
	public List<CodeValueData> getLstCodeValueData() {
		return lstCodeValueData;
	}
	public void setLstCodeValueData(List<CodeValueData> lstCodeValueData) {
		this.lstCodeValueData = lstCodeValueData;
	}
	public String getAttributeValue() {
		return attributeValue;
	}
	public void setAttributeValue(String attributeValue) {
		this.attributeValue = attributeValue;
	}
	public int getSeqNo() {
		return seqNo;
	}
	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}
	public int getAttributeCodeId() {
		return attributeCodeId;
	}
	public void setAttributeCodeId(int attributeCodeId) {
		this.attributeCodeId = attributeCodeId;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public String getAttributereferenceValue() {
		return attributereferenceValue;
	}
	public void setAttributereferenceValue(String attributereferenceValue) {
		this.attributereferenceValue = attributereferenceValue;
	}
	
	
}
