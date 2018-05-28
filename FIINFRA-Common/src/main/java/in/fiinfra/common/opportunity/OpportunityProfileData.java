package in.fiinfra.common.opportunity;

import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.FamilyMemberData;
import in.fiinfra.common.common.NotesData;
import in.fiinfra.common.common.PartyAttributeData;

import java.util.List;

public class OpportunityProfileData{
	private String panNo;
	public String getPanNo() {
		return panNo;
	}
	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}
	private String firstName;
	private String lastName;
	private String userName;
	private int salutationId;
	private String companyName;
	private String designation;
	private String occupation;
	private String dob;
	private String anniversaryDate;
	public String getAnniversaryDate() {
		return anniversaryDate;
	}
	public void setAnniversaryDate(String anniversaryDate) {
		this.anniversaryDate = anniversaryDate;
	}
	private int martialStatusId;
	private int genderId;
	private String city;
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	private String contactEmail;
	private String contactMobile;
	private String contactMobile2;
	private List<AddressData> addressDataList;
	private List<FamilyMemberData> familyMemberDataList;
	private String campaignName;
	private int opportunitySource;
	private String referralName;
	private int opportunityStatus;
	private int opportunityRating;
	private int convertProbability;
	private int nextAction;
	private List<DocumentData> documentDataList;
	private List<NotesData> notesDataList;
	private String partyId;
	private int buId;
	private String sectionName;
	private int lastModifiedBy;
	private List<PartyAttributeData> partyAttributeDatas;
	private String offeringsXML;
	
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public int getMartialStatusId() {
		return martialStatusId;
	}
	public void setMartialStatusId(int martialStatusId) {
		this.martialStatusId = martialStatusId;
	}
	public int getGenderId() {
		return genderId;
	}
	public void setGenderId(int genderId) {
		this.genderId = genderId;
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
	public String getContactMobile2() {
		return contactMobile2;
	}
	public void setContactMobile2(String contactMobile2) {
		this.contactMobile2 = contactMobile2;
	}
	public List<AddressData> getAddressDataList() {
		return addressDataList;
	}
	public void setAddressDataList(List<AddressData> addressDataList) {
		this.addressDataList = addressDataList;
	}
	public List<FamilyMemberData> getFamilyMemberDataList() {
		return familyMemberDataList;
	}
	public void setFamilyMemberDataList(List<FamilyMemberData> familyMemberDataList) {
		this.familyMemberDataList = familyMemberDataList;
	}
	public String getCampaignName() {
		return campaignName;
	}
	public void setCampaignName(String campaignName) {
		this.campaignName = campaignName;
	}
	public int getOpportunitySource() {
		return opportunitySource;
	}
	public void setOpportunitySource(int opportunitySource) {
		this.opportunitySource = opportunitySource;
	}
	public String getReferralName() {
		return referralName;
	}
	public void setReferralName(String referralName) {
		this.referralName = referralName;
	}
	public int getOpportunityStatus() {
		return opportunityStatus;
	}
	public void setOpportunityStatus(int opportunityStatus) {
		this.opportunityStatus = opportunityStatus;
	}
	public int getOpportunityRating() {
		return opportunityRating;
	}
	public void setOpportunityRating(int opportunityRating) {
		this.opportunityRating = opportunityRating;
	}
	public int getConvertProbability() {
		return convertProbability;
	}
	public void setConvertProbability(int convertProbability) {
		this.convertProbability = convertProbability;
	}
	public int getNextAction() {
		return nextAction;
	}
	public void setNextAction(int nextAction) {
		this.nextAction = nextAction;
	}
	public List<DocumentData> getDocumentDataList() {
		return documentDataList;
	}
	public void setDocumentDataList(List<DocumentData> documentDataList) {
		this.documentDataList = documentDataList;
	}
	public List<NotesData> getNotesDataList() {
		return notesDataList;
	}
	public void setNotesDataList(List<NotesData> notesDataList) {
		this.notesDataList = notesDataList;
	}
	public String getPartyId() {
		return partyId;
	}
	public void setPartyId(String partyId) {
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
		
}