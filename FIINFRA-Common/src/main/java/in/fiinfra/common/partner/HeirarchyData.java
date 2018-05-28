package in.fiinfra.common.partner;



import java.util.List;

public class HeirarchyData {
	private List<LocationData> lstLocationData;
	private List<PartnerHeirarchyData> lstPartnerHeirarchyData;
	
	public List<LocationData> getLstLocationData() {
		return lstLocationData;
	}
	public void setLstLocationData(List<LocationData> lstLocationData) {
		this.lstLocationData = lstLocationData;
	}
	public List<PartnerHeirarchyData> getLstPartnerHeirarchyData() {
		return lstPartnerHeirarchyData;
	}
	public void setLstPartnerHeirarchyData(
			List<PartnerHeirarchyData> lstPartnerHeirarchyData) {
		this.lstPartnerHeirarchyData = lstPartnerHeirarchyData;
	}
	
}
