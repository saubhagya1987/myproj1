package in.fiinfra.common.service.vo;

public class Query {
	private int queryId;
	private String subject;
	private String queryOwnerName;
	private int queryFromRecordType;
	private String queryTypeName;
	private String lastUpdatedDate;
	private String lastUpdatedByName;
	private String status;
	boolean readByParty;
	private String queryFor;
	private int contactType;
	private String CreatedDate;
	public int getQueryId() {
		return queryId;
	}
	public void setQueryId(int queryId) {
		this.queryId = queryId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getQueryOwnerName() {
		return queryOwnerName;
	}
	public void setQueryOwnerName(String queryOwnerName) {
		this.queryOwnerName = queryOwnerName;
	}
	public int getQueryFromRecordType() {
		return queryFromRecordType;
	}
	public void setQueryFromRecordType(int queryFromRecordType) {
		this.queryFromRecordType = queryFromRecordType;
	}
	public String getQueryTypeName() {
		return queryTypeName;
	}
	public void setQueryTypeName(String queryTypeName) {
		this.queryTypeName = queryTypeName;
	}
	public String getLastUpdatedDate() {
		return lastUpdatedDate;
	}
	public void setLastUpdatedDate(String lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}
	public String getLastUpdatedByName() {
		return lastUpdatedByName;
	}
	public void setLastUpdatedByName(String lastUpdatedByName) {
		this.lastUpdatedByName = lastUpdatedByName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public boolean isReadByParty() {
		return readByParty;
	}
	public void setReadByParty(boolean readByParty) {
		this.readByParty = readByParty;
	}
	public String getQueryFor() {
		return queryFor;
	}
	public void setQueryFor(String queryFor) {
		this.queryFor = queryFor;
	}
	public int getContactType() {
		return contactType;
	}
	public void setContactType(int contactType) {
		this.contactType = contactType;
	}
	
	
	
	
	
	

}
