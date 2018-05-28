package in.fiinfra.common.diy.models;

import in.fiinfra.common.diy.models.PartyKeyValue;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PartySearchCriteria implements Serializable {
	private static final long serialVersionUID = -5757171542325347623L;
	@JsonProperty
	private Integer partyId;
	@JsonProperty
	private String city;
	@JsonProperty
	private String name;
	@JsonProperty
	private String status;
	@JsonProperty
	private String emailId;
	@JsonProperty
	private String phoneNumber;
	@JsonProperty
	private String dcStage;
	@JsonProperty
	private Timestamp creationDate;
	@JsonProperty
	private Timestamp lastModifiedDate;
	// Search parameters
	@JsonProperty
	private List<PartyKeyValue> partySearchList;
	@JsonProperty
	private Integer ownerPartyId;
	@JsonProperty
	private String genericSearch;
	@JsonProperty
	private Integer opportunityStatusID;
	@JsonProperty
	private Integer contactSourceTypeID;
	@JsonProperty
	private Integer recordTypeID;
	


	public Integer getPartyId() {
		return partyId;
	}

	public void setPartyId(Integer partyId) {
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Timestamp getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Timestamp creationDate) {
		this.creationDate = creationDate;
	}

	public String getDcStage() {
		return dcStage;
	}

	public void setDcStage(String dcStage) {
		this.dcStage = dcStage;
	}

	public Timestamp getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Timestamp lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public List<PartyKeyValue> getPartySearchList() {
		return partySearchList;
	}

	public void setPartySearchList(List<PartyKeyValue> partySearchList) {
		this.partySearchList = partySearchList;
	}

	public Integer getOwnerPartyId() {
		return ownerPartyId;
	}

	public void setOwnerPartyId(Integer ownerPartyId) {
		this.ownerPartyId = ownerPartyId;
	}

	public String getGenericSearch() {
		return genericSearch;
	}

	public void setGenericSearch(String genericSearch) {
		this.genericSearch = genericSearch;
	}
	
	
	public Integer getOpportunityStatusID() {
		return opportunityStatusID;
	}

	public void setOpportunityStatusID(Integer opportunityStatusID) {
		this.opportunityStatusID = opportunityStatusID;
	}

	public Integer getContactSourceTypeID() {
		return contactSourceTypeID;
	}

	public void setContactSourceTypeID(Integer contactSourceTypeID) {
		this.contactSourceTypeID = contactSourceTypeID;
	}

	public Integer getRecordTypeID() {
		return recordTypeID;
	}

	public void setRecordTypeID(Integer recordTypeID) {
		this.recordTypeID = recordTypeID;
	}

	@Override
	public String toString() {
		return new ReflectionToStringBuilder(this).toString();
	}

}
