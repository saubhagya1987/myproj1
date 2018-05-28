package in.fiinfra.common.client;

import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.FamilyMemberData;

import java.util.List;

 

public class ClientData{
	private String rmHead;
	
	
	private String xrayReportDocumentID;
	
	
	public String getXrayReportDocumentID() {
		return xrayReportDocumentID;
	}
	public void setXrayReportDocumentID(String xrayReportDocumentID) {
		this.xrayReportDocumentID = xrayReportDocumentID;
	}
	public String getRmHead() {
		return rmHead;
	}
	public void setRmHead(String rmHead) {
		this.rmHead = rmHead;
	}
	private int dcActivation;
	public int getDcActivation() {
		return dcActivation;
	}
	public void setDcActivation(int dcActivation) {
		this.dcActivation = dcActivation;
	}
	private String isDatacollectionChanged;
	public String getIsDatacollectionChanged() {
		return isDatacollectionChanged;
	}
	public void setIsDatacollectionChanged(String isDatacollectionChanged) {
		this.isDatacollectionChanged = isDatacollectionChanged;
	}
	
	private int analysisGoalRiskSuccessionID;
	public int getAnalysisGoalRiskSuccessionID() {
		return analysisGoalRiskSuccessionID;
	}
	public void setAnalysisGoalRiskSuccessionID(int analysisGoalRiskSuccessionID) {
		this.analysisGoalRiskSuccessionID = analysisGoalRiskSuccessionID;
	}
	private String name;
	private String createdDate;	
	private String arGenerationDate;
	public String getArGenerationDate() {
		return arGenerationDate;
	}
	public void setArGenerationDate(String arGenerationDate) {
		this.arGenerationDate = arGenerationDate;
	}
	private String contactEmail;
	private String contactMobile;
	private String stage;
	private String age;
	private String potentialPing;
	public String getPotentialPing() {
		return potentialPing;
	}
	public void setPotentialPing(String potentialPing) {
		this.potentialPing = potentialPing;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	private int fpplanType;
	public int getFpplanType() {
		return fpplanType;
	}
	public void setFpplanType(int fpplanType) {
		this.fpplanType = fpplanType;
	}
	private int actionCommentsId;
	private String actionComments;
	private String city;
	private String action;
	private int recordTypeID;
	
	private String address;
	private String state;
	private String country;
	private String pinCode;
	
	private String panNo;
	private String occupation;
	
	private int ownerPartyID;
	private String lastName;
	private String firstName;
	private int salutationID;
	private String companyName;
	private String workDesignation;
	private String workProfession;
	private String dob;
	private String anniversaryDate;
	public String getAnniversaryDate() {
		return anniversaryDate;
	}
	public void setAnniversaryDate(String anniversaryDate) {
		this.anniversaryDate = anniversaryDate;
	}
	private String contactMobile2;	
	private int createdBy;
	private int partyId;
		
	private int buId;
	private int lastModifiedBy;
	private int martialStatusID;
	private int genderID;
	
	private int analysisReportDocumentID;
	private int clientActionPlanDocumentID;
	private int advisorActionPlanDocumentID;
	private int quickActionPlanDocumentID;
	private int clientActionPlanDocumentIDA;
	private String executionStatusStr;
	public int getQuickActionPlanDocumentID() {
		return quickActionPlanDocumentID;
	}
	public void setQuickActionPlanDocumentID(int quickActionPlanDocumentID) {
		this.quickActionPlanDocumentID = quickActionPlanDocumentID;
	}
	public int getSummaryActionPlanDocumentID() {
		return summaryActionPlanDocumentID;
	}
	public void setSummaryActionPlanDocumentID(int summaryActionPlanDocumentID) {
		this.summaryActionPlanDocumentID = summaryActionPlanDocumentID;
	}

	private int summaryActionPlanDocumentID;
	
	public int getMartialStatusID() {
		return martialStatusID;
	}
	public void setMartialStatusID(int martialStatusID) {
		this.martialStatusID = martialStatusID;
	}
	public int getGenderID() {
		return genderID;
	}
	public void setGenderID(int genderID) {
		this.genderID = genderID;
	}

	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPinCode() {
		return pinCode;
	}
	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	
	private List<FamilyMemberData> familyMemberDataList;
	public List<FamilyMemberData> getFamilyMemberDataList() {
		return familyMemberDataList;
	}
	public void setFamilyMemberDataList(List<FamilyMemberData> familyMemberDataList) {
		this.familyMemberDataList = familyMemberDataList;
	}

	
	
	private List<AddressData> addressDataList;

	public List<AddressData> getAddressDataList() {
		return addressDataList;
	}
	public void setAddressDataList(List<AddressData> addressDataList) {
		this.addressDataList = addressDataList;
	}
	

	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getContactMobile() {
		return contactMobile;
	}
	public void setContactMobile(String contactMobile) {
		this.contactMobile = contactMobile;
	}
	public int getRecordTypeID() {
		return recordTypeID;
	}
	public void setRecordTypeID(int recordTypeID) {
		this.recordTypeID = recordTypeID;
	}
	public int getOwnerPartyID() {
		return ownerPartyID;
	}
	public void setOwnerPartyID(int ownerPartyID) {
		this.ownerPartyID = ownerPartyID;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public int getSalutationID() {
		return salutationID;
	}
	public void setSalutationID(int salutationID) {
		this.salutationID = salutationID;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getWorkDesignation() {
		return workDesignation;
	}
	public void setWorkDesignation(String workDesignation) {
		this.workDesignation = workDesignation;
	}
	public String getWorkProfession() {
		return workProfession;
	}
	public void setWorkProfession(String workProfession) {
		this.workProfession = workProfession;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getContactMobile2() {
		return contactMobile2;
	}
	public void setContactMobile2(String contactMobile2) {
		this.contactMobile2 = contactMobile2;
	}
	
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	
	
	public String getEmail() {
		return contactEmail;
	}
	public void setEmail(String email) {
		this.contactEmail = email;
	}
	public String getMobile() {
		return contactMobile;
	}
	public void setMobile(String mobile) {
		this.contactMobile = mobile;
	}
	public int getActionCommentsId() {
		return actionCommentsId;
	}
	public void setActionCommentsId(int actionCommentsId) {
		this.actionCommentsId = actionCommentsId;
	}
	public String getActionComments() {
		return actionComments;
	}
	public void setActionComments(String actionComments) {
		this.actionComments = actionComments;
	}

	public String getPanNo() {
		return panNo;
	}
	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	
		public int getBuId() {
		return buId;
	}
	public void setBuId(int buId) { 
		this.buId = buId;
	}
	public int getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(int lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public int getAnalysisReportDocumentID() {
		return analysisReportDocumentID;
	}
	public void setAnalysisReportDocumentID(int analysisReportDocumentID) {
		this.analysisReportDocumentID = analysisReportDocumentID;
	}
	public int getClientActionPlanDocumentID() {
		return clientActionPlanDocumentID;
	}
	public void setClientActionPlanDocumentID(int clientActionPlanDocumentID) {
		this.clientActionPlanDocumentID = clientActionPlanDocumentID;
	}
	public int getAdvisorActionPlanDocumentID() {
		return advisorActionPlanDocumentID;
	}
	public void setAdvisorActionPlanDocumentID(int advisorActionPlanDocumentID) {
		this.advisorActionPlanDocumentID = advisorActionPlanDocumentID;
	}
	public String getExecutionStatusStr() {
		return executionStatusStr;
	}
	public void setExecutionStatusStr(String executionStatusStr) {
		this.executionStatusStr = executionStatusStr;
	}
	public int getClientActionPlanDocumentIDA() {
		return clientActionPlanDocumentIDA;
	}
	public void setClientActionPlanDocumentIDA(int clientActionPlanDocumentIDA) {
		this.clientActionPlanDocumentIDA = clientActionPlanDocumentIDA;
	}
	
	
}