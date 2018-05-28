package in.fiinfra.common.partner;

public class BatchJob {

	private Integer partyId;
	private Integer BatchJobRequestQTypeID;
	private Integer Param2NameValue;
	private Integer lastModifiedBy;
	private Integer BatchRequestStatusID;

	public Integer getPartyId() {
		return partyId;
	}

	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}

	public Integer getBatchJobRequestQTypeID() {
		return BatchJobRequestQTypeID;
	}

	public void setBatchJobRequestQTypeID(Integer batchJobRequestQTypeID) {
		BatchJobRequestQTypeID = batchJobRequestQTypeID;
	}

	public Integer getParam2NameValue() {
		return Param2NameValue;
	}

	public void setParam2NameValue(Integer param2NameValue) {
		Param2NameValue = param2NameValue;
	}

	public Integer getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(Integer lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public Integer getBatchRequestStatusID() {
		return BatchRequestStatusID;
	}

	public void setBatchRequestStatusID(Integer batchRequestStatusID) {
		BatchRequestStatusID = batchRequestStatusID;
	}

}
