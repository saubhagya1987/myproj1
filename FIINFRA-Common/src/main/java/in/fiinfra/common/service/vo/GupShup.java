package in.fiinfra.common.service.vo;

public class GupShup {

	private int postId;
	private String lastVisitedDate;

	private String postUrl;
	private String postText;
	private int postPartyId;
	private int recordTypeId;
	private int userId;
	
	private int statusRefID;
	private int createdBy;
	private int lastModifiedBy;
	
	private double likeCount;
	private double previewCount;
	private double commentCount;
	private String createDate;
	private String postPerson;
	
	

	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getLastVisitedDate() {
		return lastVisitedDate;
	}
	public void setLastVisitedDate(String lastVisitedDate) {
		this.lastVisitedDate = lastVisitedDate;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getPostPerson() {
		return postPerson;
	}
	public void setPostPerson(String postPerson) {
		this.postPerson = postPerson;
	}
	public double getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(double likeCount) {
		this.likeCount = likeCount;
	}
	public double getPreviewCount() {
		return previewCount;
	}
	public void setPreviewCount(double previewCount) {
		this.previewCount = previewCount;
	}
	public double getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(double commentCount) {
		this.commentCount = commentCount;
	}
	public int getStatusRefID() {
		return statusRefID;
	}
	public void setStatusRefID(int statusRefID) {
		this.statusRefID = statusRefID;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public int getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(int lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public String getPostUrl() {
		return postUrl;
	}
	public void setPostUrl(String postUrl) {
		this.postUrl = postUrl;
	}
	public String getPostText() {
		return postText;
	}
	public void setPostText(String postText) {
		this.postText = postText;
	}
	public int getPostPartyId() {
		return postPartyId;
	}
	public void setPostPartyId(int postPartyId) {
		this.postPartyId = postPartyId;
	}
	public int getRecordTypeId() {
		return recordTypeId;
	}
	public void setRecordTypeId(int recordTypeId) {
		this.recordTypeId = recordTypeId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
