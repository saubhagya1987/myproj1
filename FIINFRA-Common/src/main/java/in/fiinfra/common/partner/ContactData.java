package in.fiinfra.common.partner;

public class ContactData {
private int partyId;
private String fName;
private String lName;
private String panNo;
private String emailId;
private String dob;
private String age;
private String name;
private int recordTypeId;

public int getRecordTypeId() {
	return recordTypeId;
}
public void setRecordTypeId(int recordTypeId) {
	this.recordTypeId = recordTypeId;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
/**
 * @return the partyId
 */
public int getPartyId() {
	return partyId;
}
/**
 * @param partyId the partyId to set
 */
public void setPartyId(int partyId) {
	this.partyId = partyId;
}
/**
 * @return the fName
 */
public String getfName() {
	return fName;
}
/**
 * @param fName the fName to set
 */
public void setfName(String fName) {
	this.fName = fName;
}
/**
 * @return the lName
 */
public String getlName() {
	return lName;
}
/**
 * @param lName the lName to set
 */
public void setlName(String lName) {
	this.lName = lName;
}
/**
 * @return the panNo
 */
public String getPanNo() {
	return panNo;
}
/**
 * @param panNo the panNo to set
 */
public void setPanNo(String panNo) {
	this.panNo = panNo;
}
/**
 * @return the emailId
 */
public String getEmailId() {
	return emailId;
}
/**
 * @param emailId the emailId to set
 */
public void setEmailId(String emailId) {
	this.emailId = emailId;
}
public String getDob() {
	return dob;
}
public void setDob(String dob) {
	this.dob = dob;
}
public String getAge() {
	return age;
}
public void setAge(String age) {
	this.age = age;
}

}
