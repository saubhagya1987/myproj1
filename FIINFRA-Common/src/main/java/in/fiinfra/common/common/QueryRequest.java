package in.fiinfra.common.common;

import javax.ws.rs.QueryParam;

public class QueryRequest extends BaseRequest{

	@QueryParam("queryType")
	private int queryType;
	@QueryParam("queryFrom")
	private int queryFrom;
	@QueryParam("queryTo")
	private int queryTo;

	@QueryParam("queryFor")
	private int queryFor;
	
	private String queryOwner;
	@QueryParam("queryId")
	private int queryId;
	private String queryIds;
	@QueryParam("queryPanel")
	private String queryPanel;
	
	@QueryParam("subject")
	private String subject;
	
	@QueryParam("nodeId")
	private int nodeId; 

	private String codeTypes;
	private Integer recordType;
	private String status;
	private String searchValue;

	private String returnUrl;
	
	@QueryParam("link")
	private String link;
	
	
	
	public String getQueryIds() {
		return queryIds;
	}


	public void setQueryIds(String queryIds) {
		this.queryIds = queryIds;
	}


	
	


	public String getCodeTypes() {
		return codeTypes;
	}


	public void setCodeTypes(String codeTypes) {
		this.codeTypes = codeTypes;
	}


	public int getQueryId() {
		return queryId;
	}


	public void setQueryId(int queryId) {
		this.queryId = queryId;
	}


	public String getQueryPanel() {
		return queryPanel;
	}


	public void setQueryPanel(String queryPanel) {
		this.queryPanel = queryPanel;
	}


	
	public String getQueryOwner() {
		return queryOwner;
	}


	public void setQueryOwner(String queryOwner) {
		this.queryOwner = queryOwner;
	}


	
	
	
	public int getQueryType() {
		return queryType;
	}


	public void setQueryType(int queryType) {
		this.queryType = queryType;
	}


	public int getQueryFrom() {
		return queryFrom;
	}


	public void setQueryFrom(int queryFrom) {
		this.queryFrom = queryFrom;
	}


	public int getQueryFor() {
		return queryFor;
	}


	public void setQueryFor(int queryFor) {
		this.queryFor = queryFor;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getLink() {
		return link;
	}


	public void setLink(String link) {
		this.link = link;
	}

	
	
	public int getNodeId() {
		return nodeId;
	}


	public void setNodeId(int nodeId) {
		this.nodeId = nodeId;
	}


	@Override
	protected void appendAll(StringBuilder sb) {
		super.appendAll(sb);
		append(sb, "queryId", this.queryId);
		append(sb, "queryFrom",queryFrom);
		append(sb, "queryFor",queryFor);
		append(sb, "queryTo",queryTo);
		append(sb, "subject",subject);
		append(sb, "queryPanel",queryPanel);
		append(sb, "codeTypeIds",codeTypes);
		append(sb, "queryType",queryType);
		append(sb, "status",status);
		append(sb, "searchValue", searchValue);
		append(sb, "nodeId", nodeId);
		appendWithoutEncode(sb, "queryIds",queryIds);
		
	}


	public Integer getRecordType() {
		return recordType;
	}


	public void setRecordType(Integer recordType) {
		this.recordType = recordType;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getSearchValue() {
		return searchValue;
	}


	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}


	public int getQueryTo() {
		return queryTo;
	}


	public void setQueryTo(int queryTo) {
		this.queryTo = queryTo;
	}


	public String getReturnUrl() {
		return returnUrl;
	}


	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}

	
}
