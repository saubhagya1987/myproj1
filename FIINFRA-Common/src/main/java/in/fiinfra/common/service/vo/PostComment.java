package in.fiinfra.common.service.vo;

public class PostComment {
	
	private int postCommentId;
	private int postId;
	private String postCommentText;
	private int commentPartyId;
	private int statusRefIf;
	private int createdBy;
	private int lastModifiedBy;
	private String commentPerson;
	private String createdDate;
	
	
	public String getCommentPerson() {
		return commentPerson;
	}
	public void setCommentPerson(String commentPerson) {
		this.commentPerson = commentPerson;
	}

	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public int getPostCommentId() {
		return postCommentId;
	}
	public void setPostCommentId(int postCommentId) {
		this.postCommentId = postCommentId;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getPostCommentText() {
		return postCommentText;
	}
	public void setPostCommentText(String postCommentText) {
		this.postCommentText = postCommentText;
	}
	public int getCommentPartyId() {
		return commentPartyId;
	}
	public void setCommentPartyId(int commentPartyId) {
		this.commentPartyId = commentPartyId;
	}
	public int getStatusRefIf() {
		return statusRefIf;
	}
	public void setStatusRefIf(int statusRefIf) {
		this.statusRefIf = statusRefIf;
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
	
	

}
