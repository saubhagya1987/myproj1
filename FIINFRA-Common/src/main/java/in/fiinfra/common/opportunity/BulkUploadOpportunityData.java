package in.fiinfra.common.opportunity;

public class BulkUploadOpportunityData{
	private String bulkopportunityXml;
	private int createdBy;
	private int buId;
	public int getBuId() {
		return buId;
	}

	public void setBuId(int buId) {
		this.buId = buId;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public String getBulkopportunityXml() {
		return bulkopportunityXml;
	}

	public void setBulkopportunityXml(String bulkopportunityXml) {
		this.bulkopportunityXml = bulkopportunityXml;
	}
}