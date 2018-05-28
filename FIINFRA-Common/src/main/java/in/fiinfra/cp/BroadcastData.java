package in.fiinfra.cp;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class BroadcastData {

	private Integer broadCastId;
	private String broadCastTitle;
	private Integer broadCastTextId;
	private Integer broadCastSectionId;
	private Date broadCastStartDate;
	private Date broadCastEndDate;
	private Integer roleId;
	private Integer cityId;
	private Integer createdBy;
	private Integer buPartyId;
	private Integer lastModifiedBy;
	private Date lastModifiedDate;
	private Integer daysToGo;
	private String description;

	public Integer getBroadCastId() {
		return broadCastId;
	}

	public void setBroadCastId(Integer broadCastId) {
		this.broadCastId = broadCastId;
	}

	public String getBroadCastTitle() {
		return broadCastTitle;
	}

	public void setBroadCastTitle(String broadCastTitle) {
		this.broadCastTitle = broadCastTitle;
	}

	public Integer getBroadCastTextId() {
		return broadCastTextId;
	}

	public void setBroadCastTextId(Integer broadCastTextId) {
		this.broadCastTextId = broadCastTextId;
	}

	public Integer getBroadCastSectionId() {
		return broadCastSectionId;
	}

	public void setBroadCastSectionId(Integer broadCastSectionId) {
		this.broadCastSectionId = broadCastSectionId;
	}

	public Date getBroadCastStartDate() {
		return broadCastStartDate;
	}

	public void setBroadCastStartDate(Date broadCastStartDate) {
		this.broadCastStartDate = broadCastStartDate;
	}

	public Date getBroadCastEndDate() {
		return broadCastEndDate;
	}

	public void setBroadCastEndDate(Date broadCastEndDate) {
		this.broadCastEndDate = broadCastEndDate;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Integer getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(Integer lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public Integer getBuPartyId() {
		return buPartyId;
	}

	public void setBuPartyId(Integer buPartyId) {
		this.buPartyId = buPartyId;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public Integer getDaysToGo() {
		return daysToGo;
	}

	public void setDaysToGo(Integer daysToGo) {
		this.daysToGo = daysToGo;
	}


}
