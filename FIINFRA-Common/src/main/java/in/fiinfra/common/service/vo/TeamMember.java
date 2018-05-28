package in.fiinfra.common.service.vo;

import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;

public class TeamMember {
	private Integer partyID;
	private String userName; // actually this is a team member name
	private String contactemail;
	private String alloBU;
	private String contactMobile;
	private String codeValue;
	private Integer codeValueID;
	private Integer recordId;
	private int createdBy;
	private Integer codetype;
	// private String lastname;
	private Integer buId;
	private Boolean userStatus;
	private String firstName;
	private String middleName;
	private String lastName; // used as a user name in listing of team memeber
	private Integer counts;
	private String passwordId;

	private Integer departmentID;
	
	private String departmentIdList;

	private String partyIdList;

	private String startDate;

	private String expiryDate;
	
	private String searchTextVal;
	

	/**
	 * role id
	 */
	private int roleID;

	/**
	 * role name
	 */
	private String roleName;
	
	private String deleteList;

	public String getPasswordId() {
		return passwordId;
	}

	public void setPasswordId(String passwordId) {
		this.passwordId = passwordId;
	}

	public Integer getCounts() {
		return counts;
	}

	public void setCounts(Integer counts) {
		this.counts = counts;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Boolean getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(Boolean userStatus) {
		this.userStatus = userStatus;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public Integer getRecordId() {
		return recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public String getCodeValue() {
		return codeValue;
	}

	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}

	public Integer getCodeValueID() {
		return codeValueID;
	}

	public void setCodeValueID(Integer codeValueID) {
		this.codeValueID = codeValueID;
	}

	public String getAlloBU() {
		return alloBU;
	}

	public void setAlloBU(String alloBU) {
		this.alloBU = alloBU;
	}

	public Integer getPartyID() {
		return partyID;
	}

	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}

	public String getContactMobile() {
		return contactMobile;
	}

	public void setContactMobile(String contactMobile) {
		this.contactMobile = contactMobile;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContactemail() {
		return contactemail;
	}

	public void setContactemail(String contactemail) {
		this.contactemail = contactemail;
	}

	public Integer getCodetype() {
		return codetype;
	}

	public void setCodetype(Integer codetype) {
		this.codetype = codetype;
	}

	/*
	 * public String getLastname() { return lastname; } public void
	 * setLastname(String lastname) { this.lastname = lastname; }
	 */
	public Integer getBuId() {
		return buId;
	}

	public void setBuId(Integer buId) {
		this.buId = buId;
	}

	public String getDepartmentIdList() {
		return departmentIdList;
	}

	public void setDepartmentIdList(String departmentIdList) {
		this.departmentIdList = departmentIdList;
	}

	public String getPartyIdList() {
		return partyIdList;
	}

	public void setPartyIdList(String partyIdList) {
		this.partyIdList = partyIdList;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getSearchTextVal() {
		return searchTextVal;
	}

	public void setSearchTextVal(String searchTextVal) {
		this.searchTextVal = searchTextVal;
	}
	
	public String getDeleteList() {
		return deleteList;
	}

	public void setDeleteList(String deleteList) {
		this.deleteList = deleteList;
	}

	public Integer getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(Integer departmentID) {
		this.departmentID = departmentID;
	}

}
