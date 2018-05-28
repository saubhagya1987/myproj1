package in.fiinfra.common.service.vo;

public class Like {
	private int likeRefID;
	private int likeRefType;
	private int likePartyID;
	private int createdBy;
	private int createdDate;
	private int lastModifiedBy;
	private String likePerson;
	private int lastModifiedDate;
	
	
	public String getLikePerson() {
		return likePerson;
	}
	public void setLikePerson(String likePerson) {
		this.likePerson = likePerson;
	}
	public int getLikeRefID() {
		return likeRefID;
	}
	public void setLikeRefID(int likeRefID) {
		this.likeRefID = likeRefID;
	}
	public int getLikeRefType() {
		return likeRefType;
	}
	public void setLikeRefType(int likeRefType) {
		this.likeRefType = likeRefType;
	}
	public int getLikePartyID() {
		return likePartyID;
	}
	public void setLikePartyID(int likePartyID) {
		this.likePartyID = likePartyID;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public int getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(int createdDate) {
		this.createdDate = createdDate;
	}
	public int getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(int lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public int getLastModifiedDate() {
		return lastModifiedDate;
	}
	public void setLastModifiedDate(int lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	
	
}
