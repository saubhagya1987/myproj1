package in.fiinfra.common.service.vo;

public class LoggedUser {

//	Party Type	User ID	User Name	Biz Unit	Email ID	Contact No	Assigned Role	Last Login On	Session ID 
	
	private String partyType;
	private Integer partyId;
	private Integer userId;
	private String userName;
	private String bizUnit;
	private String emailId;
	private String contactNo;
	private String assignedRole;
	private String lastLoginOn;
	private String sessionId;
	private Integer buId;
	

	private String time;
	private int partner_ct;
	private int client_ct;
	
	private String statusViewId; 
	private String searchtext;
	
	
	
	
	public Integer getBuId() {
		return buId;
	}
	public void setBuId(Integer buId) {
		this.buId = buId;
	}
	public String getSearchtext() {
		return searchtext;
	}
	public void setSearchtext(String searchtext) {
		this.searchtext = searchtext;
	}
	public String getStatusViewId() {
		return statusViewId;
	}
	public void setStatusViewId(String statusViewId) {
		this.statusViewId = statusViewId;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
	
	
	
	
	
	
	
	public int getPartner_ct() {
		return partner_ct;
	}
	public void setPartner_ct(int partner_ct) {
		this.partner_ct = partner_ct;
	}
	public int getClient_ct() {
		return client_ct;
	}
	public void setClient_ct(int client_ct) {
		this.client_ct = client_ct;
	}
	public String getPartyType() {
		return partyType;
	}
	public void setPartyType(String partyType) {
		this.partyType = partyType;
	}
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBizUnit() {
		return bizUnit;
	}
	public void setBizUnit(String bizUnit) {
		this.bizUnit = bizUnit;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getAssignedRole() {
		return assignedRole;
	}
	public void setAssignedRole(String assignedRole) {
		this.assignedRole = assignedRole;
	}
	public String getLastLoginOn() {
		return lastLoginOn;
	}
	public void setLastLoginOn(String lastLoginOn) {
		this.lastLoginOn = lastLoginOn;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	
	
}
