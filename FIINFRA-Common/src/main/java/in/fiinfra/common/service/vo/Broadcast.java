package in.fiinfra.common.service.vo;

import java.io.Serializable;
import org.codehaus.jackson.annotate.JsonProperty;

public class Broadcast implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1006718361419542191L;

	/**
	 * broadcast id
	 */
	@JsonProperty
	private int id;

	/**
	 * name of the section
	 */
	@JsonProperty
	private String sectionName;

	/**
	 * start date of the broadcast
	 */
	@JsonProperty
	private String startDate;

	/**
	 * end date of the broadcast
	 */
	@JsonProperty
	private String expiryDate;

	/**
	 * title of the broadcast
	 */
	@JsonProperty
	private String broadCastTitle;

	/**
	 * text id of the broadcast
	 */
	@JsonProperty
	private int broadCastTextId;

	/**
	 * section id of the broadcast
	 */
	@JsonProperty
	private int broadCastSectionId;

	/**
	 * business unit party id
	 */
	@JsonProperty
	private int buPartyId;

	/**
	 * party record type id
	 */
	@JsonProperty
	private int partyRecordTypeId;

	/**
	 * user type name
	 */
	@JsonProperty
	private String userTypeName;

	/**
	 * role id
	 */
	@JsonProperty
	private int roleID;

	/**
	 * role name
	 */
	@JsonProperty
	private String roleName;

	/**
	 * city id
	 */
	@JsonProperty
	private int cityId;

	/**
	 * city name
	 */
	@JsonProperty
	private String cityName;

	/**
	 * display pop up after login
	 */
	@JsonProperty
	private boolean loginPopUpDisplay;

	/**
	 * created by user
	 */
	@JsonProperty
	private int createdBy;

	/**
	 * last modified by user
	 */
	@JsonProperty
	private int lastModifiedBy;

	/**
	 * description of the broadcast
	 */
	@JsonProperty
	private String description;

	/**
	 * last modified date of the broadcast
	 */
	@JsonProperty
	private String lastModifiedDate;

	private String searchText;

	private String deleteList;
	
	private int sourceSystemId;
	
	private String sourceSystemName;
	
	private String sourceIdList;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
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

	public String getBroadCastTitle() {
		return broadCastTitle;
	}

	public void setBroadCastTitle(String broadCastTitle) {
		this.broadCastTitle = broadCastTitle;
	}

	public int getBroadCastTextId() {
		return broadCastTextId;
	}

	public void setBroadCastTextId(int broadCastTextId) {
		this.broadCastTextId = broadCastTextId;
	}

	public int getBroadCastSectionId() {
		return broadCastSectionId;
	}

	public void setBroadCastSectionId(int broadCastSectionId) {
		this.broadCastSectionId = broadCastSectionId;
	}

	public int getBuPartyId() {
		return buPartyId;
	}

	public void setBuPartyId(int buPartyId) {
		this.buPartyId = buPartyId;
	}

	public int getPartyRecordTypeId() {
		return partyRecordTypeId;
	}

	public void setPartyRecordTypeId(int partyRecordTypeId) {
		this.partyRecordTypeId = partyRecordTypeId;
	}

	public String getUserTypeName() {
		return userTypeName;
	}

	public void setUserTypeName(String userTypeName) {
		this.userTypeName = userTypeName;
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

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public boolean isLoginPopUpDisplay() {
		return loginPopUpDisplay;
	}

	public void setLoginPopUpDisplay(boolean loginPopUpDisplay) {
		this.loginPopUpDisplay = loginPopUpDisplay;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(int lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getDeleteList() {
		return deleteList;
	}

	public void setDeleteList(String deleteList) {
		this.deleteList = deleteList;
	}
	/*
	 * @Override public String toString() { return new
	 * ReflectionToStringBuilder(this).toString(); }
	 */

	public int getSourceSystemId() {
		return sourceSystemId;
	}

	public void setSourceSystemId(int sourceSystemId) {
		this.sourceSystemId = sourceSystemId;
	}
	
	public String getSourceSystemName() {
		return sourceSystemName;
	}

	public void setSourceSystemName(String sourceSystemName) {
		this.sourceSystemName = sourceSystemName;
	}

	public String getSourceIdList() {
		return sourceIdList;
	}

	public void setSourceIdList(String sourceIdList) {
		this.sourceIdList = sourceIdList;
	}
	
}
