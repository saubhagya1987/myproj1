package in.fiinfra.cp.common.model;

import in.fiinfra.common.common.BaseRequest;

public class ProfileRequest extends BaseRequest{
	private String parentId;
	private String userName;

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	
	 public String getUsername() {
		return userName;
	}

	public void setUsername(String userName) {
		this.userName = userName;
	}

	@Override
	protected void appendAll(StringBuilder sb) {
	
		super.appendAll(sb);
		append(sb, "parentId", this.parentId);
		append(sb, "username", this.userName);
	}

}
