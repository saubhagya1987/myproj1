package in.fiinfra.common.common;

public class BroadCastData{
	private String broadCastTitle;
	private String broadCastDescription;
	private int buPartyId;
	private int broadCastId;
	
	public int getBroadCastId() {
		return broadCastId;
	}
	public void setBroadCastId(int broadCastId) {
		this.broadCastId = broadCastId;
	}
	public int getBuPartyId() {
		return buPartyId;
	}
	public void setBuPartyId(int buPartyId) {
		this.buPartyId = buPartyId;
	}
	public String getBroadCastTitle() {
		return broadCastTitle;
	}
	public void setBroadCastTitle(String broadCastTitle) {
		this.broadCastTitle = broadCastTitle;
	}
	public String getBroadCastDescription() {
		return broadCastDescription;
	}
	public void setBroadCastDescription(String broadCastDescription) {
		this.broadCastDescription = broadCastDescription;
	}

}