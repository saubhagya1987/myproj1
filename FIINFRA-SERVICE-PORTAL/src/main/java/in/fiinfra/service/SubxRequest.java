package in.fiinfra.service;

import in.fiinfra.common.common.BaseRequest;

public class SubxRequest extends BaseRequest {
	private Integer subxId;
	private String userId;
	private String searchText;
	private String searchType;
	

	public Integer getSubxId() {
		return subxId;
	}

	public void setSubxId(Integer subxId) {
		this.subxId = subxId;
	}

	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	
	
	@Override
	protected void appendAll(StringBuilder sb) {
		
		super.appendAll(sb);
		append(sb, "userId", this.userId);
		append(sb, "subxId", this.subxId);
		append(sb, "searchText", this.searchText);
		append(sb, "searchType", this.searchType);
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	

}
