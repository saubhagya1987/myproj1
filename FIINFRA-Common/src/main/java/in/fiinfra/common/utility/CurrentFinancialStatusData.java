package in.fiinfra.common.utility;

public class CurrentFinancialStatusData {
	
private int buId;
private int partyId;
private String XMLString;
private int questionBankId;
private int sectionTypeId;
public int getBuId() {
	return buId;
}
public void setBuId(int buId) {
	this.buId = buId;
}
public int getPartyId() {
	return partyId;
}
public void setPartyId(int partyId) {
	this.partyId = partyId;
}
public String getXMLString() {
	return XMLString;
}
public void setXMLString(String xMLString) {
	XMLString = xMLString;
}
public int getQuestionBankId() {
	return questionBankId;
}
public void setQuestionBankId(int questionBankId) {
	this.questionBankId = questionBankId;
}
public int getSectionTypeId() {
	return sectionTypeId;
}
public void setSectionTypeId(int sectionTypeId) {
	this.sectionTypeId = sectionTypeId;
}

}
