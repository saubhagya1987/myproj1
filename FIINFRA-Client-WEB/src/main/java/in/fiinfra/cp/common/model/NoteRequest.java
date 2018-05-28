package in.fiinfra.cp.common.model;

import in.fiinfra.common.common.BaseRequest;

public class NoteRequest extends BaseRequest {

	private Integer refId;
	private Integer refTypeId;
	private String returnUrl;

	@Override
	protected void appendAll(StringBuilder sb) {
		super.appendAll(sb);
		append(sb, "refId", refId);
		append(sb, "refTypeId", refTypeId);

	}

	public Integer getRefId() {
		return refId;
	}

	public void setRefId(Integer refId) {
		this.refId = refId;
	}

	public String getReturnUrl() {
		return returnUrl;
	}

	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}

	public Integer getRefTypeId() {
		return refTypeId;
	}

	public void setRefTypeId(Integer refTypeId) {
		this.refTypeId = refTypeId;
	}

}
