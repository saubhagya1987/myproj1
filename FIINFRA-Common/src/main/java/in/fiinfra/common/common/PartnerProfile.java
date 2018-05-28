package in.fiinfra.common.common;

import java.util.Date;
import java.util.List;

public class PartnerProfile {

	private int id;
	private int salutationId;
	private String firstName;
	private String middleName;
	private String lastName;
	private Date dateOfBirth;
	private int genderId;
	private int maritalStatusId;
	private int workProfessionId;
	private String workDesignation;
	private String workCompanyName;
	private String panNo;

	private AddressData address;
	private String email;
	private String mobileNo;
	private String alternateNo;
	private List<PartyAttributeData> familyDetails;

	private String campaignName;
	private int contactSourceTypeId;
	private String contactReferalName;

	private int opportunityStatusId;
	private int convertProbablity;
	private int nextActionId;
	private int opportunityRatingId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSalutationId() {
		return salutationId;
	}

	public void setSalutationId(int salutationId) {
		this.salutationId = salutationId;
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

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public int getGenderId() {
		return genderId;
	}

	public void setGenderId(int genderId) {
		this.genderId = genderId;
	}

	public int getMaritalStatusId() {
		return maritalStatusId;
	}

	public void setMaritalStatusId(int maritalStatusId) {
		this.maritalStatusId = maritalStatusId;
	}

	public int getWorkProfessionId() {
		return workProfessionId;
	}

	public void setWorkProfessionId(int workProfession) {
		this.workProfessionId = workProfession;
	}

	public String getWorkDesignation() {
		return workDesignation;
	}

	public void setWorkDesignation(String workDesignation) {
		this.workDesignation = workDesignation;
	}

	public String getWorkCompanyName() {
		return workCompanyName;
	}

	public void setWorkCompanyName(String workCompanyName) {
		this.workCompanyName = workCompanyName;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public AddressData getAddress() {
		return address;
	}

	public void setAddress(AddressData address) {
		this.address = address;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getAlternateNo() {
		return alternateNo;
	}

	public void setAlternateNo(String alternateNo) {
		this.alternateNo = alternateNo;
	}

	public List<PartyAttributeData> getFamilyDetails() {
		return familyDetails;
	}

	public void setFamilyDetails(List<PartyAttributeData> familyDetails) {
		this.familyDetails = familyDetails;
	}

	public String getCampaignName() {
		return campaignName;
	}

	public void setCampaignName(String campaignName) {
		this.campaignName = campaignName;
	}

	public int getContactSourceTypeId() {
		return contactSourceTypeId;
	}

	public void setContactSourceTypeId(int contactSourceTypeId) {
		this.contactSourceTypeId = contactSourceTypeId;
	}
	
	public String getContactReferalName() {
		return contactReferalName;
	}

	public void setContactReferalName(String contactReferalName) {
		this.contactReferalName = contactReferalName;
	}

	public int getOpportunityStatusId() {
		return opportunityStatusId;
	}

	public void setOpportunityStatusId(int opportunityStatusId) {
		this.opportunityStatusId = opportunityStatusId;
	}

	public int getConvertProbablity() {
		return convertProbablity;
	}

	public void setConvertProbablity(int convertProbablity) {
		this.convertProbablity = convertProbablity;
	}

	public int getNextActionId() {
		return nextActionId;
	}

	public void setNextActionId(int nextActionId) {
		this.nextActionId = nextActionId;
	}

	public int getOpportunityRatingId() {
		return opportunityRatingId;
	}

	public void setOpportunityRatingId(int opportunityRatingId) {
		this.opportunityRatingId = opportunityRatingId;
	}

}
