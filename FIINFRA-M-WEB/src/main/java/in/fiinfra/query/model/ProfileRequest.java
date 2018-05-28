package in.fiinfra.query.model;

import in.fiinfra.common.common.BaseRequest;

public class ProfileRequest extends BaseRequest{

	private int viewId;
	
	private int theme;
	
	public int getViewId() {
		return viewId;
	}


	public void setViewId(int viewId) {
		this.viewId = viewId;
	}


	private String subject;
	


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	@Override
	protected void appendAll(StringBuilder sb) {
		super.appendAll(sb);
		append(sb, "viewId", this.viewId);
	}


	public int getTheme() {
		return theme;
	}


	public void setTheme(int theme) {
		this.theme = theme;
	}
}
