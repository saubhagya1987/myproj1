package in.fiinfra.common.service.vo;

import java.util.Date;

//@JsonInclude(JsonInclude.Include.NON_NULL)
public class TeamMemberAllocation {
	private String bizunit;
	private Integer partyID;
	private Integer teammemberId;
	private String departmentName;
	private Date allocationStartDate;
	private Date allocationEndDate;
	private boolean status;
	private String userName;
	private String contactemail;
	private String alloBU;
	private Integer contactMobile;
	// private Integer codevalueId;
	private Integer recordId;
	private String createdBy;
	private Integer codetype;
	private String codevalue;
	private String lastname;
	private Integer buid;
	private Integer departmentId;
	private String displayShortName;
	private String allocationStatus;
	private String startDate;
	private String endDate;

	private String deleteList;
	private Integer lastmodifyBy;

	public Integer getLastmodifyBy() {
		return lastmodifyBy;
	}

	public void setLastmodifyBy(Integer lastmodifyBy) {
		this.lastmodifyBy = lastmodifyBy;
	}

	public String getBizunit() {
		return bizunit;
	}

	public void setBizunit(String bizunit) {
		this.bizunit = bizunit;
	}

	public Integer getPartyID() {
		return partyID;
	}

	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Date getAllocationStartDate() {
		return allocationStartDate;
	}

	public void setAllocationStartDate(Date allocationStartDate) {
		this.allocationStartDate = allocationStartDate;
	}

	public Date getAllocationEndDate() {
		return allocationEndDate;
	}

	public void setAllocationEndDate(Date allocationEndDate) {
		this.allocationEndDate = allocationEndDate;
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

	public String getAlloBU() {
		return alloBU;
	}

	public void setAlloBU(String alloBU) {
		this.alloBU = alloBU;
	}

	public Integer getContactMobile() {
		return contactMobile;
	}

	public void setContactMobile(Integer contactMobile) {
		this.contactMobile = contactMobile;
	}

	public Integer getRecordId() {
		return recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Integer getCodetype() {
		return codetype;
	}

	public void setCodetype(Integer codetype) {
		this.codetype = codetype;
	}

	public String getCodevalue() {
		return codevalue;
	}

	public void setCodevalue(String codevalue) {
		this.codevalue = codevalue;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public Integer getBuId() {
		return buid;
	}

	public void setBuId(Integer buId) {
		this.buid = buId;
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getDisplayShortName() {
		return displayShortName;
	}

	public void setDisplayShortName(String displayShortName) {
		this.displayShortName = displayShortName;
	}

	public Integer getTeammemberId() {
		return teammemberId;
	}

	public void setTeammemberId(Integer teammemberId) {
		this.teammemberId = teammemberId;
	}

	public String getAllocationStatus() {
		return allocationStatus;
	}

	public void setAllocationStatus(String allocationStatus) {
		this.allocationStatus = allocationStatus;
	}

	/*
	 * @Override public String toString() { return "bizunit=" + bizunit +
	 * ", partyID=" + partyID + ", teammemberId=" + teammemberId +
	 * ", departmentName=" + departmentName + ", allocationStartDate=" +
	 * allocationStartDate + ", allocationEndDate=" + allocationEndDate +
	 * ", status=" + status + ", userName=" + userName + ", contactemail=" +
	 * contactemail + ", alloBU=" + alloBU + ", contactMobile=" + contactMobile
	 * + ", recordId=" + recordId + ", createdBy=" + createdBy + ", codetype=" +
	 * codetype + ", codevalue=" + codevalue + ", lastname=" + lastname +
	 * ", buid=" + buid + ", departmentId=" + departmentId +
	 * ", displayShortName=" + displayShortName + ", allocationStatus=" +
	 * allocationStatus + ""; }
	 */
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getDeleteList() {
		return deleteList;
	}

	public void setDeleteList(String deleteList) {
		this.deleteList = deleteList;
	}

}
