package in.fiinfra.common.partner;

public class LocationData {
	private int locationId;
	private int parentNodeId;
	private int level;
	private int displaySeqNo;
	public int getDisplaySeqNo() {
		return displaySeqNo;
	}
	public void setDisplaySeqNo(int displaySeqNo) {
		this.displaySeqNo = displaySeqNo;
	}
	public int getParentNodeId() {
		return parentNodeId;
	}
	public void setParentNodeId(int parentNodeId) {
		this.parentNodeId = parentNodeId;
	}
	public int getLocationId() {
		return locationId;
	}
	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}
	private int partyId;
	
	private int createdBy;
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
	private int lastModifiedBy;
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	private String locationName;
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public String getLocationDescription() {
		return locationDescription;
	}
	public void setLocationDescription(String locationDescription) {
		this.locationDescription = locationDescription;
	}
	private String locationDescription;
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	

}
