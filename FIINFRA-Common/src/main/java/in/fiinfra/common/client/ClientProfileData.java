package in.fiinfra.common.client;
import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.FamilyMemberData;
import in.fiinfra.common.common.NotesData;
import in.fiinfra.common.common.PartyAttributeData;

import java.util.List;











import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class ClientProfileData {
	private String firstName;
	private String lastName;	
	private int salutationId;
	private String companyName;
	private String panNo;
	private String contactEmail;
	private String contactMobile;
	private String contactMobile2;
	private String anniversaryDate;
	public String getAnniversaryDate() {
		return anniversaryDate;
	}
	public void setAnniversaryDate(String anniversaryDate) {
		this.anniversaryDate = anniversaryDate;
	}
	private String workDesignation;
	private String workProfession;
	
	private String familyMemberXml;
	private boolean isFromProfile;
	private int clientCategory;
	private String offeringsXML;
	private List<PartyAttributeData> partyAttributeDatas;
	private List<PartyAttributeData> partyAttributeDatasHealth;
	
	private String memberShipStartDate;
	private String memberShipEndDate;
	private String nextRenewalDate;
	private String lastRenewedOn;
	private String healthXML;
	private int isClientActivated;
	
	private List<PartyAttributeData> InterestedFpList;
	public List<PartyAttributeData> getInterestedFpList() {
		return InterestedFpList;
	}
	public void setInterestedFpList(List<PartyAttributeData> interestedFpList) {
		InterestedFpList = interestedFpList;
	}
	
	private String interestedFpXML;
	public String getInterestedFpXML() {
		return interestedFpXML;
	}
	public void setInterestedFpXML(String interestedFpXML) {
		this.interestedFpXML = interestedFpXML;
	}
	
	
	private String dob;
	private List<AddressData> addressDataList;
	
	private List<FamilyMemberData> familyDataList;
	public List<FamilyMemberData> getFamilyDataList() {
		return familyDataList;
	}
	public void setFamilyDataList(List<FamilyMemberData> familyDataList) {
		this.familyDataList = familyDataList;
	}
	
	private List<NotesData> notesDataList;
	public List<NotesData> getNotesDataList() {
		return notesDataList;
	}
	public void setNotesDataList(List<NotesData> notesDataList) {
		this.notesDataList = notesDataList;
	}
	
	private List<DocumentData> documentDatas;
	public List<DocumentData> getDocumentDatas() {
		return documentDatas;
	}
	public void setDocumentDatas(List<DocumentData> documentDatas) {
		this.documentDatas = documentDatas;
	}

	
	
	private int partyId;
	private int buId;
	private String sectionName;
	private int lastModifiedBy;
	
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
	private int martialStatusID;
	private int genderID;
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getContactMobile2() {
		return contactMobile2;
	}
	public void setContactMobile2(String contactMobile2) {
		this.contactMobile2 = contactMobile2;
	}
	public int getSalutationId() {
		return salutationId;
	}
	public void setSalutationId(int salutationId) {
		this.salutationId = salutationId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getPanNo() {
		return panNo;
	}
	public void setPanNo(String panNo) {
		this.panNo = panNo;
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
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public List<AddressData> getAddressDataList() {
		return addressDataList;
	}
	public void setAddressDataList(List<AddressData> addressDataList) {
		this.addressDataList = addressDataList;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public int getBuId() {
		return buId;
	}
	public void setBuId(int buId) {
		this.buId = buId;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public int getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(int lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public String getFamilyMemberXml() {
		return familyMemberXml;
	}
	public void setFamilyMemberXml(String familyMemberXml) {
		this.familyMemberXml = familyMemberXml;
	}
	public boolean isFromProfile() {
		return isFromProfile;
	}
	public void setFromProfile(boolean isFromProfile) {
		this.isFromProfile = isFromProfile;
	}
	public int getClientCategory() {
		return clientCategory;
	}
	public void setClientCategory(int clientCategory) {
		this.clientCategory = clientCategory;
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
	public String getMemberShipStartDate() {
		return memberShipStartDate;
	}
	public void setMemberShipStartDate(String memberShipStartDate) {
		this.memberShipStartDate = memberShipStartDate;
	}
	public String getMemberShipEndDate() {
		return memberShipEndDate;
	}
	public void setMemberShipEndDate(String memberShipEndDate) {
		this.memberShipEndDate = memberShipEndDate;
	}
	public String getNextRenewalDate() {
		return nextRenewalDate;
	}
	public void setNextRenewalDate(String nextRenewalDate) {
		this.nextRenewalDate = nextRenewalDate;
	}
	public String getLastRenewedOn() {
		return lastRenewedOn;
	}
	public void setLastRenewedOn(String lastRenewedOn) {
		this.lastRenewedOn = lastRenewedOn;
	}
	public String getHealthXML() {
		return healthXML;
	}
	public void setHealthXML(String healthXML) {
		this.healthXML = healthXML;
	}
	public int getIsClientActivated() {
		return isClientActivated;
	}
	public void setIsClientActivated(int isClientActivated) {
		this.isClientActivated = isClientActivated;
	}
	public List<PartyAttributeData> getPartyAttributeDatasHealth() {
		return partyAttributeDatasHealth;
	}
	public void setPartyAttributeDatasHealth(
			List<PartyAttributeData> partyAttributeDatasHealth) {
		this.partyAttributeDatasHealth = partyAttributeDatasHealth;
	}
	
	
	
}
