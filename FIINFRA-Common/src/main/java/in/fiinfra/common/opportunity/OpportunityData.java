package in.fiinfra.common.opportunity;



import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.FamilyMemberData;


import in.fiinfra.common.common.NotesData;
import in.fiinfra.common.common.PartyAttributeData;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.web.multipart.MultipartFile;
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class OpportunityData{
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
	private int fpplanType;
	public int getFpplanType() {
		return fpplanType;
	}
	public void setFpplanType(int fpplanType) {
		this.fpplanType = fpplanType;
	}
	private String enableDCTool;
	public String getEnableDCTool() {
		return enableDCTool;
	}
	
	public void setEnableDCTool(String enableDCTool) {
		this.enableDCTool = enableDCTool;
	}
	private String enableXRayTool;
	public String getEnableXRayTool() {
		return enableXRayTool;
	}
	public void setEnableXRayTool(String enableXRayTool) {
		this.enableXRayTool = enableXRayTool;
	}
	
	private int analysisGoalRiskSuccessionID;
	public int getAnalysisGoalRiskSuccessionID() {
		return analysisGoalRiskSuccessionID;
	}
	public void setAnalysisGoalRiskSuccessionID(int analysisGoalRiskSuccessionID) {
		this.analysisGoalRiskSuccessionID = analysisGoalRiskSuccessionID;
	}
	private int dcActivation;
	private String name;	
	private String createdDate;
	private String arGenerationDate;
	public String getArGenerationDate() {
		return arGenerationDate;
	}
	public void setArGenerationDate(String arGenerationDate) {
		this.arGenerationDate = arGenerationDate;
	}
	private String opportunityStatus;
	private String status;
	private String contactEmail;
	private String contactMobile;
	private String stage;
	private int actionCommentsId;
	private String actionComments;
	private String city;
	private String action;
	private int recordTypeID;
	private String address;
	private int executionStatus;
	private String executionStatusStr;
	private int martialStatusID;
	private String isDatacollectionChanged;
	private String potentialPing;
	public String getPotentialPing() {
		return potentialPing;
	}
	public void setPotentialPing(String potentialPing) {
		this.potentialPing = potentialPing;
	}
	public String getIsDatacollectionChanged() {
		return isDatacollectionChanged;
	}
	public void setIsDatacollectionChanged(String isDatacollectionChanged) {
		this.isDatacollectionChanged = isDatacollectionChanged;
	}
	public int getMartialStatusID() {
		return martialStatusID;
	}
	public void setMartialStatusID(int martialStatusID) {
		this.martialStatusID = martialStatusID;
	}
	public int getDcActivation() {
		return dcActivation;
	}
	public void setDcActivation(int dcActivation) {
		this.dcActivation = dcActivation;
	}
	public int getGenderID() {
		return genderID;
	}
	public void setGenderID(int genderID) {
		this.genderID = genderID;
	}

	private int genderID;

	public String getExecutionStatusStr() {
		return executionStatusStr;
	}
	public void setExecutionStatusStr(String executionStatusStr) {
		this.executionStatusStr = executionStatusStr;
	}
	public int getExecutionStatus() {
		return executionStatus;
	}
	public void setExecutionStatus(int executionStatus) {
		this.executionStatus = executionStatus;
	}

	private transient MultipartFile[] opportunityAttachment;
	public MultipartFile[] getOpportunityAttachment() {
		return opportunityAttachment;
	}
	public void setOpportunityAttachment(MultipartFile[] opportunityAttachment) {
		this.opportunityAttachment = opportunityAttachment;
	}

	List<DocumentData> documentDatas;
	public List<DocumentData> getDocumentDatas() {
		return documentDatas;
	}
	public void setDocumentDatas(List<DocumentData> documentDatas) {
		this.documentDatas = documentDatas;
	}
	public List<NotesData> getNotesDatas() {
		return notesDatas;
	}
	public void setNotesDatas(List<NotesData> notesDatas) {
		this.notesDatas = notesDatas;
	}

	List<NotesData> notesDatas;
	private String outputPdf;
	private String partnerName;
	private String fileName;
	private String age;
	
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}

	private int analysisReportDocumentID;
	private int clientActionPlanDocumentID;
	private int advisorActionPlanDocumentID;
	MultipartFile[] leadUpload;
	
	private int quickActionPlanDocumentID;
	private int summaryActionPlanDocumentID;
	private int clientActionPlanDocumentIDA;
	
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

	
	private List<CodeValueData> OccupationList = new ArrayList<CodeValueData>();
	
	private List<PartyAttributeData> partyAttributeDatas;
	

	public List<CodeValueData> getOccupationList() {
		return OccupationList;
	}
	public void setOccupationList(List<CodeValueData> occupationList) {
		OccupationList = occupationList;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOutputPdf() {
		return outputPdf;
	}
	public void setOutputPdf(String outputPdf) {
		this.outputPdf = outputPdf;
	}
	


	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}

	private AddressData addressDataRecord;
	public AddressData getAddressDataRecord() {
		return addressDataRecord;
	}
	public void setAddressDataRecord(AddressData addressDataRecord) {
		this.addressDataRecord = addressDataRecord;
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

	private String state;
	private String country;
	private String pinCode;
	
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	
	private String panNo;
	private String occupation;
	private String organization;
	private int experience;
	private String photo;
	private String spouseName;
	private String spousePAN;
	private String spouseDob;
	private int spouseAge;
	private int workprofessionSpouse;
	private String motherName;
	private String motherPAN;
	private String motherDob;
	private int motherAge;
	private int workprofessionMother;
	private String fatherName;
	private String fatherPAN;
	private String fatherDob;
	private int fatherAge;
	private int workprofessionFather;
	private String motherInLawName;
	private String motherInLawPAN;
	private String motherInLawDob;
	private int motherInLawAge;
	private int workprofessionMotherInLow;
	private String fatherInLawName;
	private String fatherInLawPAN;
	private int workprofessionfatherInLaw;
	private String huf;
	private String hufDob;
	private int hufAge;
	private int workprofessionHuf;
	private String hufPan;
	
	
	public String getHufPan() {
		return hufPan;
	}
	public void setHufPan(String hufPan) {
		this.hufPan = hufPan;
	}
	public String getHuf() {
		return huf;
	}
	public void setHuf(String huf) {
		this.huf = huf;
	}
	public String getHufDob() {
		return hufDob;
	}
	public void setHufDob(String hufDob) {
		this.hufDob = hufDob;
	}
	public int getHufAge() {
		return hufAge;
	}
	public void setHufAge(int hufAge) {
		this.hufAge = hufAge;
	}
	public String getSpousePAN() {
		return spousePAN;
	}
	public void setSpousePAN(String spousePAN) {
		this.spousePAN = spousePAN;
	}
	public String getMotherPAN() {
		return motherPAN;
	}
	public void setMotherPAN(String motherPAN) {
		this.motherPAN = motherPAN;
	}
	public String getFatherPAN() {
		return fatherPAN;
	}
	public void setFatherPAN(String fatherPAN) {
		this.fatherPAN = fatherPAN;
	}
	public String getMotherInLawPAN() {
		return motherInLawPAN;
	}
	public void setMotherInLawPAN(String motherInLawPAN) {
		this.motherInLawPAN = motherInLawPAN;
	}
	public String getFatherInLawPAN() {
		return fatherInLawPAN;
	}
	public void setFatherInLawPAN(String fatherInLawPAN) {
		this.fatherInLawPAN = fatherInLawPAN;
	}

	private String fatherInLawDob;
	private int fatherInLawAge;
	private String familyMemberXml;
	@JsonIgnore
	private transient MultipartFile contactPhoto;
	private DocumentData documentData;
	private boolean isAttachment;
	private int attachmentCount;
	private int buId;
	private int lastModifiedBy;
	
	private String offeringsXML;
	private boolean isFromProfile;
	
	private List<FamilyMemberData> familyMemberDataList;
	private List<AddressData> addressDataList;
	private List<NotesData> notesDataList;
	
	public List<NotesData> getNotesDataList() {
		return notesDataList;
	}
	public void setNotesDataList(List<NotesData> notesDataList) {
		this.notesDataList = notesDataList;
	}
	
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
	public String getCampaignName() {
		return campaignName;
	}
	public void setCampaignName(String campaignName) {
		this.campaignName = campaignName;
	}
	public int getContactSourceTypeID() {
		return contactSourceTypeID;
	}
	public void setContactSourceTypeID(int contactSourceTypeID) {
		this.contactSourceTypeID = contactSourceTypeID;
	}
	public String getContactReferalName() {
		return contactReferalName;
	}
	public void setContactReferalName(String contactReferalName) {
		this.contactReferalName = contactReferalName;
	}
	public int getOpportunityStatusID() {
		return opportunityStatusID;
	}
	public void setOpportunityStatusID(int opportunityStatusID) {
		this.opportunityStatusID = opportunityStatusID;
	}
	public int getOpportunityRatingID() {
		return opportunityRatingID;
	}
	public void setOpportunityRatingID(int opportunityRatingID) {
		this.opportunityRatingID = opportunityRatingID;
	}
	public int getConvertProbablity() {
		return convertProbablity;
	}
	public void setConvertProbablity(int convertProbablity) {
		this.convertProbablity = convertProbablity;
	}
	public int getNextActionID() {
		return nextActionID;
	}
	public void setNextActionID(int nextActionID) {
		this.nextActionID = nextActionID;
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
	private int ownerPartyID;
	private String lastName;
	private String firstName;
	
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
	private int salutationID;
	private String companyName;
	private String workDesignation;
	private String designation;
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}

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
	private String campaignName;
	private int contactSourceTypeID;
	private String contactReferalName;
	private int opportunityStatusID;
	private int opportunityRatingID;
	private int convertProbablity;
	private int nextActionID;
	private int createdBy;
	private int partyId;
	


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
	public String getOpportunityStatus() {
		return opportunityStatus;
	}
	public void setOpportunityStatus(String opportunityStatus) {
		this.opportunityStatus = opportunityStatus;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
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
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public int getExperience() {
		return experience;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public List<FamilyMemberData> getFamilyMemberDataList() {
		return familyMemberDataList;
	}
	public void setFamilyMemberDataList(List<FamilyMemberData> familyMemberDataList) {
		this.familyMemberDataList = familyMemberDataList;
	}
	public String getSpouseName() {
		return spouseName;
	}
	public void setSpouseName(String spouseName) {
		this.spouseName = spouseName;
	}
	public int getSpouseAge() {
		return spouseAge;
	}
	public void setSpouseAge(int spouseAge) {
		this.spouseAge = spouseAge;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public int getMotherAge() {
		return motherAge;
	}
	public void setMotherAge(int motherAge) {
		this.motherAge = motherAge;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public int getFatherAge() {
		return fatherAge;
	}
	public void setFatherAge(int fatherAge) {
		this.fatherAge = fatherAge;
	}
	public String getMotherInLawName() {
		return motherInLawName;
	}
	public void setMotherInLawName(String motherInLawName) {
		this.motherInLawName = motherInLawName;
	}
	public int getMotherInLawAge() {
		return motherInLawAge;
	}
	public void setMotherInLawAge(int motherInLawAge) {
		this.motherInLawAge = motherInLawAge;
	}
	public String getFatherInLawName() {
		return fatherInLawName;
	}
	public void setFatherInLawName(String fatherInLawName) {
		this.fatherInLawName = fatherInLawName;
	}
	public int getFatherInLawAge() {
		return fatherInLawAge;
	}
	public void setFatherInLawAge(int fatherInLawAge) {
		this.fatherInLawAge = fatherInLawAge;
	}

	public String getFamilyMemberXml() {
		return familyMemberXml;
	}
	public void setFamilyMemberXml(String familyMemberXml) {
		this.familyMemberXml = familyMemberXml;
	}
	public MultipartFile getContactPhoto() {
		return contactPhoto;
	}
	public void setContactPhoto(MultipartFile contactPhoto) {
		this.contactPhoto = contactPhoto;
	}
	public DocumentData getDocumentData() {
		return documentData;
	}
	public void setDocumentData(DocumentData documentData) {
		this.documentData = documentData;
	}
	public boolean isAttachment() {
		return isAttachment;
	}
	public void setAttachment(boolean isAttachment) {
		this.isAttachment = isAttachment;
	}
	public int getAttachmentCount() {
		return attachmentCount;
	}
	public void setAttachmentCount(int attachmentCount) {
		this.attachmentCount = attachmentCount;
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
	public MultipartFile[] getLeadUpload() {
		return leadUpload;
	}
	public void setLeadUpload(MultipartFile[] leadUpload) {
		this.leadUpload = leadUpload;
	}
	public String getOfferingsXML() {
		return offeringsXML;
	}
	public void setOfferingsXML(String offeringsXML) {
		this.offeringsXML = offeringsXML;
	}
	public List<PartyAttributeData> getPartyAttributeDatas() {
		return partyAttributeDatas;
	}
	public void setPartyAttributeDatas(List<PartyAttributeData> partyAttributeDatas) {
		this.partyAttributeDatas = partyAttributeDatas;
	}
	public String getSpouseDob() {
		return spouseDob;
	}
	public void setSpouseDob(String spouseDob) {
		this.spouseDob = spouseDob;
	}
	public String getMotherDob() {
		return motherDob;
	}
	public void setMotherDob(String motherDob) {
		this.motherDob = motherDob;
	}
	public String getFatherDob() {
		return fatherDob;
	}
	public void setFatherDob(String fatherDob) {
		this.fatherDob = fatherDob;
	}
	public String getMotherInLawDob() {
		return motherInLawDob;
	}
	public void setMotherInLawDob(String motherInLawDob) {
		this.motherInLawDob = motherInLawDob;
	}
	public String getFatherInLawDob() {
		return fatherInLawDob;
	}
	public void setFatherInLawDob(String fatherInLawDob) {
		this.fatherInLawDob = fatherInLawDob;
	}
	public boolean isFromProfile() {
		return isFromProfile;
	}
	public void setFromProfile(boolean isFromProfile) {
		this.isFromProfile = isFromProfile;
	}
	public int getClientActionPlanDocumentIDA() {
		return clientActionPlanDocumentIDA;
	}
	public void setClientActionPlanDocumentIDA(int clientActionPlanDocumentIDA) {
		this.clientActionPlanDocumentIDA = clientActionPlanDocumentIDA;
	}
	public int getWorkprofessionSpouse() {
		return workprofessionSpouse;
	}
	public void setWorkprofessionSpouse(int workprofessionSpouse) {
		this.workprofessionSpouse = workprofessionSpouse;
	}
	public int getWorkprofessionMother() {
		return workprofessionMother;
	}
	public void setWorkprofessionMother(int workprofessionMother) {
		this.workprofessionMother = workprofessionMother;
	}
	public int getWorkprofessionFather() {
		return workprofessionFather;
	}
	public void setWorkprofessionFather(int workprofessionFather) {
		this.workprofessionFather = workprofessionFather;
	}
	public int getWorkprofessionMotherInLow() {
		return workprofessionMotherInLow;
	}
	public void setWorkprofessionMotherInLow(int workprofessionMotherInLow) {
		this.workprofessionMotherInLow = workprofessionMotherInLow;
	}
	public int getWorkprofessionHuf() {
		return workprofessionHuf;
	}
	public void setWorkprofessionHuf(int workprofessionHuf) {
		this.workprofessionHuf = workprofessionHuf;
	}
	public int getWorkprofessionfatherInLaw() {
		return workprofessionfatherInLaw;
	}
	public void setWorkprofessionfatherInLaw(int workprofessionfatherInLaw) {
		this.workprofessionfatherInLaw = workprofessionfatherInLaw;
	}	
	
	
	
}