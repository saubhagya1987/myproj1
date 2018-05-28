package in.fiinfra.common.service.vo;

public class BulkUploadOpportunityData{
	private String bulkopportunityXml;
	private int createdBy;
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