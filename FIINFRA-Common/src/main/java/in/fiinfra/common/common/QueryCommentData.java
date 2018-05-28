package in.fiinfra.common.common;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.web.multipart.MultipartFile;
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class QueryCommentData {
private String commentText;
private String createdDate;
private String commentOwner;
private String photoPath;
private int doc1Id;
private int doc2Id;
private int doc3Id;
private String doc1Name;
private String doc2Name;
private String doc3Name;
private int queryCommentId;
private int commentPartyId;
List<DocumentData> documentDatas;
private boolean isAttachment;
private int attachmentCount;
private String basePath;
private int queryId;
int buId;


@JsonIgnore
private transient MultipartFile[] commentAttachment;


public String getCommentText() {
	return commentText;
}
public void setCommentText(String commentText) {
	this.commentText = commentText;
}
public String getCreatedDate() {
	return createdDate;
}
public void setCreatedDate(String createdDate) {
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
public int getDoc1Id() {
	return doc1Id;
}
public void setDoc1Id(int doc1Id) {
	this.doc1Id = doc1Id;
}
public int getDoc2Id() {
	return doc2Id;
}
public void setDoc2Id(int doc2Id) {
	this.doc2Id = doc2Id;
}
public int getDoc3Id() {
	return doc3Id;
}
public void setDoc3Id(int doc3Id) {
	this.doc3Id = doc3Id;
}
public String getDoc1Name() {
	return doc1Name;
}
public void setDoc1Name(String doc1Name) {
	this.doc1Name = doc1Name;
}
public String getDoc2Name() {
	return doc2Name;
}
public void setDoc2Name(String doc2Name) {
	this.doc2Name = doc2Name;
}
public String getDoc3Name() {
	return doc3Name;
}
public void setDoc3Name(String doc3Name) {
	this.doc3Name = doc3Name;
}
public int getQueryCommentId() {
	return queryCommentId;
}
public void setQueryCommentId(int queryCommentId) {
	this.queryCommentId = queryCommentId;
}
public MultipartFile[] getCommentAttachment() {
	return commentAttachment;
}
public void setCommentAttachment(MultipartFile[] commentAttachment) {
	this.commentAttachment = commentAttachment;
}
public int getCommentPartyId() {
	return commentPartyId;
}
public void setCommentPartyId(int commentPartyId) {
	this.commentPartyId = commentPartyId;
}
public List<DocumentData> getDocumentDatas() {
	return documentDatas;
}
public void setDocumentDatas(List<DocumentData> documentDatas) {
	this.documentDatas = documentDatas;
}
public boolean isAttachment() {
	return isAttachment;
}
public void setAttachment(boolean isAttachment) {
	this.isAttachment = isAttachment;
}
public int getAttachmentCount() {
	return attachmentCount;
}
public void setAttachmentCount(int attachmentCount) {
	this.attachmentCount = attachmentCount;
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
