package in.fiinfra.common.common;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class GupShupCommentData {
	private String commentText;
	private Date createdDate;
	private String commentOwner;
	private String photoPath;
	private int partyId;
	private int statusRefId;
	private int userId;

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}


	private int postId;
	private int id;

	/* to be added statusRefId */

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCommentOwner() {
		return commentOwner;
	}

	public void setCommentOwner(String commentOwner) {
		this.commentOwner = commentOwner;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStatusRefId() {
		return statusRefId;
	}

	public void setStatusRefId(int statusRefId) {
		this.statusRefId = statusRefId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
