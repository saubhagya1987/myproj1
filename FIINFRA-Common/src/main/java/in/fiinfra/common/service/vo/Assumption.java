package in.fiinfra.common.service.vo;

import org.omg.CORBA.PRIVATE_MEMBER;

public class Assumption 
{
   private	String fpAssumptionID;
   private	Integer assumptionCodeID;
   private	Integer assumptionValue;
   private	String codeValue;
   private	Integer codeValueID;
   private	Integer valueDataTypeID;
   private	String dataType;
   private	String defaultValue;
   private	Integer codeTypeID;
   private	String codeType;
   private Integer partyID;
   private String helpText;
   private Integer valueEnd;
   private Integer valueStart;
   private String displayLabel;
   
   //String codeValue;
  // private	int codeValueId;
   
   
   
  
   
   
   
   
   
public Integer getAssumptionValue() {
	return assumptionValue;
}
public Integer getValueEnd() {
	return valueEnd;
}
public void setValueEnd(Integer valueEnd) {
	this.valueEnd = valueEnd;
}
public Integer getValueStart() {
	return valueStart;
}
public void setValueStart(Integer valueStart) {
	this.valueStart = valueStart;
}
public String getDisplayLabel() {
	return displayLabel;
}
public void setDisplayLabel(String displayLabel) {
	this.displayLabel = displayLabel;
}
public String getHelpText() {
	return helpText;
}
public void setHelpText(String helpText) {
	this.helpText = helpText;
}
public Integer getPartyID() {
	return partyID;
}
public void setPartyID(Integer partyID) {
	this.partyID = partyID;
}
public void setAssumptionValue(Integer assumptionValue) {
	this.assumptionValue = assumptionValue;
}
public String getFpAssumptionID() {
	return fpAssumptionID;
}
public void setFpAssumptionID(String fpAssumptionID) {
	this.fpAssumptionID = fpAssumptionID;
}


public Integer getAssumptionCodeID() {
	return assumptionCodeID;
}
public void setAssumptionCodeID(Integer assumptionCodeID) {
	this.assumptionCodeID = assumptionCodeID;
}
public String getCodeValue() {
	return codeValue;
}
public void setCodeValue(String codeValue) {
	this.codeValue = codeValue;
}


public Integer getValueDataTypeID() {
	return valueDataTypeID;
}
public void setValueDataTypeID(Integer valueDataTypeID) {
	this.valueDataTypeID = valueDataTypeID;
}
public String getDataType() {
	return dataType;
}
public void setDataType(String dataType) {
	this.dataType = dataType;
}






public Integer getCodeValueID() {
	return codeValueID;
}
public void setCodeValueID(Integer codeValueID) {
	this.codeValueID = codeValueID;
}
public String getDefaultValue() {
	return defaultValue;
}
public void setDefaultValue(String defaultValue) {
	this.defaultValue = defaultValue;
}




public Integer getCodeTypeID() {
	return codeTypeID;
}
public void setCodeTypeID(Integer codeTypeID) {
	this.codeTypeID = codeTypeID;
}
public String getCodeType() {
	return codeType;
}
public void setCodeType(String codeType) {
	this.codeType = codeType;
}
   
    
   
}
