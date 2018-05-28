package in.fiinfra.common.diy.models;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Party implements Serializable {
	private static final long serialVersionUID = 7673525333999103809L;

	@JsonProperty
	private Integer id;
	@JsonProperty
	private Integer ownerPartyId;
	@JsonProperty
	private String firstName;
	@JsonProperty
	private String middleName;
	@JsonProperty
	private String lastName;
	@JsonProperty
	private Integer salutationId;
	@JsonProperty
	private String companyName;
	@JsonProperty
	private String contactMobile1;
	@JsonProperty
	private String contactMobile2;
	@JsonProperty
	private String contactHome;
	@JsonProperty
	private String contactOffice;
	@JsonProperty
	private String contactFax;
	@JsonProperty
	private String contactEmail1;
	@JsonProperty
	private String contactEmail2;
	@JsonProperty
	private String emailCommunicationName;
	@JsonProperty
	private String workProfession;
	@JsonProperty
	private String workDesignation;
	@JsonProperty
	private String workCompanyName;
	@JsonProperty
	private String workIndustry;
	@JsonProperty
	private Timestamp dob;
	@JsonProperty
	private String dobAsString;
	@JsonProperty
	private Integer age;
	@JsonProperty
	private Integer genderId;
	@JsonProperty
	private Integer maritalStatusID;
	@JsonProperty
	private String campaignName;
	@JsonProperty
	private Integer contactSourceTypeID;
	@JsonProperty
	private String contactReferalName;
	@JsonProperty
	private Integer convertProbablity;
	@JsonProperty
	private Integer oppotunityRatingId;
	@JsonProperty
	private Integer oppotunityStatusId;
	@JsonProperty
	private Integer currentStageId;
	@JsonProperty
	private Integer nextActionId;
	@JsonProperty
	private String websiteURL;
	@JsonProperty
	private Integer buPartyId;
	@JsonProperty
	private Boolean active;
	@JsonProperty
	private String name;
	@JsonProperty
	private Integer relatedPartyId;
	@JsonProperty
	private Integer relationshipId;
	@JsonProperty
	private List<Party> associatedParties;
	@JsonProperty
	private List<PartyAttribute> partyAttributes;
	@JsonProperty
	private String panNumber;
	@JsonProperty
	private List<Address> addressList;
	@JsonProperty
	private Integer recordTypeId;
	@JsonProperty
	private Integer partyUserMapTypeId;
	@JsonProperty
	private Timestamp lastModifiedDate;
	@JsonProperty
	private String cityName;
	@JsonProperty
	private Integer createdBy;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOwnerPartyId() {
		return ownerPartyId;
	}

	public void setOwnerPartyId(Integer ownerPartyId) {
		this.ownerPartyId = ownerPartyId;
	}

	public Integer getSalutationId() {
		return salutationId;
	}

	public void setSalutationId(Integer salutationId) {
		this.salutationId = salutationId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getContactOffice() {
		return contactOffice;
	}

	public void setContactOffice(String contactOffice) {
		this.contactOffice = contactOffice;
	}

	public String getContactFax() {
		return contactFax;
	}

	public void setContactFax(String contactFax) {
		this.contactFax = contactFax;
	}

	public String getEmailCommunicationName() {
		return emailCommunicationName;
	}

	public void setEmailCommunicationName(String emailCommunicationName) {
		this.emailCommunicationName = emailCommunicationName;
	}

	public String getWorkProfession() {
		return workProfession;
	}

	public void setWorkProfession(String workProfession) {
		this.workProfession = workProfession;
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

	public String getWorkIndustry() {
		return workIndustry;
	}

	public void setWorkIndustry(String workIndustry) {
		this.workIndustry = workIndustry;
	}

	public Timestamp getDob() {
		return dob;
	}

	public void setDob(Timestamp dob) {
		this.dob = dob;
	}

	public String getDobAsString() {
		return dobAsString;
	}

	public void setDobAsString(String dobAsString) {
		this.dobAsString = dobAsString;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getGenderId() {
		return genderId;
	}

	public void setGenderId(Integer genderId) {
		this.genderId = genderId;
	}

	public Integer getMaritalStatusID() {
		return maritalStatusID;
	}

	public void setMaritalStatusID(Integer maritalStatusID) {
		this.maritalStatusID = maritalStatusID;
	}

	public String getCampaignName() {
		return campaignName;
	}

	public void setCampaignName(String campaignName) {
		this.campaignName = campaignName;
	}

	public Integer getContactSourceTypeID() {
		return contactSourceTypeID;
	}

	public void setContactSourceTypeID(Integer contactSourceTypeID) {
		this.contactSourceTypeID = contactSourceTypeID;
	}

	public String getContactReferalName() {
		return contactReferalName;
	}

	public void setContactReferalName(String contactReferalName) {
		this.contactReferalName = contactReferalName;
	}

	public Integer getConvertProbablity() {
		return convertProbablity;
	}

	public void setConvertProbablity(Integer convertProbablity) {
		this.convertProbablity = convertProbablity;
	}

	public Integer getOppotunityRatingId() {
		return oppotunityRatingId;
	}

	public void setOppotunityRatingId(Integer oppotunityRatingId) {
		this.oppotunityRatingId = oppotunityRatingId;
	}

	public Integer getNextActionId() {
		return nextActionId;
	}

	public void setNextActionId(Integer nextActionId) {
		this.nextActionId = nextActionId;
	}

	public String getWebsiteURL() {
		return websiteURL;
	}

	public void setWebsiteURL(String websiteURL) {
		this.websiteURL = websiteURL;
	}

	public Integer getBuPartyId() {
		return buPartyId;
	}

	public void setBuPartyId(Integer buPartyId) {
		this.buPartyId = buPartyId;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
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

	public String getContactEmail1() {
		return contactEmail1;
	}

	public void setContactEmail1(String contactEmail1) {
		this.contactEmail1 = contactEmail1;
	}

	public String getContactEmail2() {
		return contactEmail2;
	}

	public void setContactEmail2(String contactEmail2) {
		this.contactEmail2 = contactEmail2;
	}

	public String getContactMobile1() {
		return contactMobile1;
	}

	public void setContactMobile1(String contactMobile1) {
		this.contactMobile1 = contactMobile1;
	}

	public String getContactMobile2() {
		return contactMobile2;
	}

	public void setContactMobile2(String contactMobile2) {
		this.contactMobile2 = contactMobile2;
	}

	public String getContactHome() {
		return contactHome;
	}

	public void setContactHome(String contactHome) {
		this.contactHome = contactHome;
	}

	public Integer getOppotunityStatusId() {
		return oppotunityStatusId;
	}

	public void setOppotunityStatusId(Integer oppotunityStatusId) {
		this.oppotunityStatusId = oppotunityStatusId;
	}

	public Integer getCurrentStageId() {
		return currentStageId;
	}

	public void setCurrentStageId(Integer currentStageId) {
		this.currentStageId = currentStageId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getRelatedPartyId() {
		return relatedPartyId;
	}

	public void setRelatedPartyId(Integer relatedPartyId) {
		this.relatedPartyId = relatedPartyId;
	}

	public Integer getRelationshipId() {
		return relationshipId;
	}

	public void setRelationshipId(Integer relationshipId) {
		this.relationshipId = relationshipId;
	}

	public List<Party> getAssociatedParties() {
		return associatedParties;
	}

	public void setAssociatedParties(List<Party> associatedParties) {
		this.associatedParties = associatedParties;
	}

	public String getPanNumber() {
		return panNumber;
	}

	public void setPanNumber(String panNumber) {
		this.panNumber = panNumber;
	}

	public List<Address> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}

	public Integer getRecordTypeId() {
		return recordTypeId;
	}

	public void setRecordTypeId(Integer recordTypeId) {
		this.recordTypeId = recordTypeId;
	}

	public Integer getPartyUserMapTypeId() {
		return partyUserMapTypeId;
	}

	public void setPartyUserMapTypeId(Integer partyUserMapTypeId) {
		this.partyUserMapTypeId = partyUserMapTypeId;
	}

	public Timestamp getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Timestamp lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	
	public List<PartyAttribute> getPartyAttributes() {
		return partyAttributes;
	}

	public void setPartyAttributes(List<PartyAttribute> partyAttributes) {
		this.partyAttributes = partyAttributes;
	}
	
	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	@Override
	public String toString() {
		return new ReflectionToStringBuilder(this).toString();
	}
}