package in.fiinfra.common.common;

public class NotesData{
	private int noteId;
	public int getNoteId() {
		return noteId;
	}
	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}
	private String noteText;
	private int partyId;
	private String noteTag;
	private int createdBy;
	private int noteRefId;
	
	private int noteSectionId;
	public int getNoteSectionId() {
		return noteSectionId;
	}
	public void setNoteSectionId(int noteSectionId) {
		this.noteSectionId = noteSectionId;
	}
	
	public int getNoteRefId() {
		return noteRefId;
	}
	public void setNoteRefId(int noteRefId) {
		this.noteRefId = noteRefId;
	}
	public int getNoteRefTypeId() {
		return noteRefTypeId;
	}
	public void setNoteRefTypeId(int noteRefTypeId) {
		this.noteRefTypeId = noteRefTypeId;
	}
	private int noteRefTypeId;
	private String createdDate;
	private int buId;
	private int notePartyId;
	public int getNotePartyId() {
		return notePartyId;
	}
	public void setNotePartyId(int notePartyId) {
		this.notePartyId = notePartyId;
	}
	public int getBuId() {
		return buId;
	}
	public void setBuId(int buId) {
		this.buId = buId;
	}
	private int fpPlanId;
	private int fpSectionTypeId;
	
	public String getNoteText() {
		return noteText;
	}
	public void setNoteText(String noteText) {
		this.noteText = noteText;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public String getNoteTag() {
		return noteTag;
	}
	public void setNoteTag(String noteTag) {
		this.noteTag = noteTag;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public int getFpPlanId() {
		return fpPlanId;
	}
	public void setFpPlanId(int fpPlanId) {
		this.fpPlanId = fpPlanId;
	}
	public int getFpSectionTypeId() {
		return fpSectionTypeId;
	}
	public void setFpSectionTypeId(int fpSectionTypeId) {
		this.fpSectionTypeId = fpSectionTypeId;
	}

}