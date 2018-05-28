package in.fiinfra.query.model;

import in.fiinfra.common.common.DocumentData;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

public class CommentData {

	List<DocumentData> documentDatas;
	private String commentText;
	private String status;
	@JsonIgnore
	private transient MultipartFile[] queryAttachment;
	private String commentTypeName;
	private boolean isAttachment;
	private int attachmentCount;
	private String basePath;
	private int queryId;
	int buId;
	
	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public MultipartFile[] getQueryAttachment() {
		return queryAttachment;
	}

	public void setQueryAttachment(MultipartFile[] queryAttachment) {
		this.queryAttachment = queryAttachment;
	}

	public String getCommentTypeName() {
		return commentTypeName;
	}

	public void setCommentTypeName(String commentTypeName) {
		this.commentTypeName = commentTypeName;
	}

	public List<DocumentData> getDocumentDatas() {
		return documentDatas;
	}

	public void setDocumentDatas(List<DocumentData> documentDatas) {
		this.documentDatas = documentDatas;
	}

	public int getAttachmentCount() {
		return attachmentCount;
	}

	public void setAttachmentCount(int attachmentCount) {
		this.attachmentCount = attachmentCount;
	}

	public boolean isAttachment() {
		return isAttachment;
	}

	public void setAttachment(boolean isAttachment) {
		this.isAttachment = isAttachment;
	}

	public String getBasePath() {
		return basePath;
	}

	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}

	public int getQueryId() {
		return queryId;
	}

	public void setQueryId(int queryId) {
		this.queryId = queryId;
	}

	public int getBuId() {
		return buId;
	}

	public void setBuId(int buId) {
		this.buId = buId;
	}

}
