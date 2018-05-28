package in.fiinfra.birt.models;

public class IssuerId {
	private int partyID;
	private int attributeValue;
	private String lastName;
	private boolean isActive;
	private int buId;
	
	private String productName;
	private int productId;
	private String startDate;
	
	
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getPartyID() {
		return partyID;
	}
	public void setPartyID(int partyID) {
		this.partyID = partyID;
	}
	public int getAttributeValue() {
		return attributeValue;
	}
	public void setAttributeValue(int attributeValue) {
		this.attributeValue = attributeValue;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public boolean getisActive() {
		return isActive;
	}
	public void setisActive(boolean isActive) {
		this.isActive = isActive;
	}
	public int getBuId() {
		return buId;
	}
	public void setBuId(int buId) {
		this.buId = buId;
	}
	
}