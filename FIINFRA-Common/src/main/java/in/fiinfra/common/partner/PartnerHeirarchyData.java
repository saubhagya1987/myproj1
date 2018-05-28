package in.fiinfra.common.partner;

public class PartnerHeirarchyData {
	
	private boolean headOfNode;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public int getCurrentNodeId() {
		return currentNodeId;
	}
	public void setCurrentNodeId(int currentNodeId) {
		this.currentNodeId = currentNodeId;
	}
	public int getLocationId() {
		return locationId;
	}
	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}
	
	public int getParentNodeId() {
		return parentNodeId;
	}
	public void setParentNodeId(int parentNodeId) {
		this.parentNodeId = parentNodeId;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getDisplaySeqNo() {
		return displaySeqNo;
	}
	public void setDisplaySeqNo(int displaySeqNo) {
		this.displaySeqNo = displaySeqNo;
	}
	private String userName;
	private int partyId;
	private int currentNodeId;
	private int locationId;
	private String locationName;
	private String locationDescription;
	private int parentNodeId;
	private int level;
	private int displaySeqNo;
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
	public boolean getHeadOfNode() {
		return headOfNode;
	}
	public void setHeadOfNode(boolean headOfNode) {
		this.headOfNode = headOfNode;
	}
	
		

}
