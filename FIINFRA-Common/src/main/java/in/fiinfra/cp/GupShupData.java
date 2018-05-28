package in.fiinfra.cp;

import in.fiinfra.common.common.GupShupCommentData;

import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class GupShupData {
	private int partyId;
	private Integer id;
	private int likeCount;
	private int commentCount;
	private int previewCount;
	private String posturl;
	private String text;
	private Date lastVisitedDate;
	private Integer createdById;
	private String imagePath;
	private String userName;
	private boolean liked;
	private Date createdDate;
	/* to be add status,recordTypeId and likeRefId */

	private List<GupShupCommentData> comments;

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getPreviewCount() {
		return previewCount;
	}

	public void setPreviewCount(int previewCount) {
		this.previewCount = previewCount;
	}

	public String getPosturl() {
		return posturl;
	}

	public void setPosturl(String posturl) {
		this.posturl = posturl;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getLastVisitedDate() {
		return lastVisitedDate;
	}

	public void setLastVisitedDate(Date lastVisitedDate) {
		this.lastVisitedDate = lastVisitedDate;
	}

	public Integer getCreatedById() {
		return createdById;
	}

	public void setCreatedById(Integer createdById) {
		this.createdById = createdById;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<GupShupCommentData> getComments() {
		return comments;
	}

	public void setComments(List<GupShupCommentData> comments) {
		this.comments = comments;
	}

	public boolean isLiked() {
		return liked;
	}

	public void setLiked(boolean liked) {
		this.liked = liked;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

}
