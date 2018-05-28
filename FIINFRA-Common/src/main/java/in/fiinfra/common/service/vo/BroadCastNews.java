package in.fiinfra.common.service.vo;

public class BroadCastNews {

	private int id;
	private String title;
	private String description;
	private String section;
	private int bu;
	private int sourceSystemID;
	private boolean active;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public int getBu() {
		return bu;
	}
	public void setBu(int bu) {
		this.bu = bu;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public int getSourceSystemID() {
		return sourceSystemID;
	}
	public void setSourceSystemID(int sourceSystemID) {
		this.sourceSystemID = sourceSystemID;
	}
	
}
