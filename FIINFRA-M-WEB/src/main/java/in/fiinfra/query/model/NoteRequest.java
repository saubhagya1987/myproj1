package in.fiinfra.query.model;

import in.fiinfra.common.common.BaseRequest;

public class NoteRequest extends BaseRequest {

	private Integer refId;
	private Integer refTypeId;
	private String returnUrl;
	private String noteIds;

	public String getNoteIds() {
		return noteIds;
	}

	public void setNoteIds(String noteIds) {
		this.noteIds = noteIds;
	}

	@Override
	protected void appendAll(StringBuilder sb) {
		super.appendAll(sb);
		append(sb, "refId", refId);
		append(sb, "refTypeId", refTypeId);
		append(sb, "noteIds", noteIds);

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
