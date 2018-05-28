package in.fiinfra.common.admin;

import in.fiinfra.common.common.DocumentData;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AddChat {
private Integer chatOnRelatedPartyId;
private transient MultipartFile[] chatAttachment;
private int attachment1DocId;
private int attachment2DocId;
private int attachment3DocId;
public int getAttachment1DocId() {
	return attachment1DocId;
}
public void setAttachment1DocId(int attachment1DocId) {
	this.attachment1DocId = attachment1DocId;
}
public int getAttachment2DocId() {
	return attachment2DocId;
}
public void setAttachment2DocId(int attachment2DocId) {
	this.attachment2DocId = attachment2DocId;
}
public int getAttachment3DocId() {
	return attachment3DocId;
}
public void setAttachment3DocId(int attachment3DocId) {
	this.attachment3DocId = attachment3DocId;
}
private String feedItemPost;
private String feedFilePost;
private String feedLinkPost;
private String feedLinkURL;
private String feedLinkName;
private String isTagging;
private int createdBy;
private Integer contact;
private int attachmentCount;
private String chatBody;
private Integer parentChatId;
private boolean isAttachment;
private int chatTypeId;
private int chatContentTypeId;
private int chatPartyId;
private int recordTypeId;
private String basePath;
private int chatId;
private int buId;
private String xmlStringUserName;


/*varaibles for comments*/

public String getXmlStringUserName() {
	return xmlStringUserName;
}
public void setXmlStringUserName(String xmlStringUserName) {
	this.xmlStringUserName = xmlStringUserName;
}
private transient MultipartFile[] commentAttachment; 
private String feedItemComment;
private String feedFileComment;
private String feedLinkComment;
private String feedLinkCommentURL;
private String chatType;

public String getChatType() {
	return chatType;
}
public void setChatType(String chatType) {
	this.chatType = chatType;
}
public MultipartFile[] getCommentAttachment() {
	return commentAttachment;
}
public void setCommentAttachment(MultipartFile[] commentAttachment) {
	this.commentAttachment = commentAttachment;
}
public String getFeedItemComment() {
	return feedItemComment;
}
public void setFeedItemComment(String feedItemComment) {
	this.feedItemComment = feedItemComment;
}
public String getFeedFileComment() {
	return feedFileComment;
}
public void setFeedFileComment(String feedFileComment) {
	this.feedFileComment = feedFileComment;
}
public String getFeedLinkComment() {
	return feedLinkComment;
}
public void setFeedLinkComment(String feedLinkComment) {
	this.feedLinkComment = feedLinkComment;
}
public String getFeedLinkCommentURL() {
	return feedLinkCommentURL;
}
public void setFeedLinkCommentURL(String feedLinkCommentURL) {
	this.feedLinkCommentURL = feedLinkCommentURL;
}
public String getBasePath() {
	return basePath;
}
public void setBasePath(String basePath) {
	this.basePath = basePath;
}
public int getChatId() {
	return chatId;
}
public void setChatId(int chatId) {
	this.chatId = chatId;
}
public boolean isAttachment() {
	return isAttachment;
}
public void setAttachment(boolean isAttachment) {
	this.isAttachment = isAttachment;
}
public int getCreatedBy() {
	return createdBy;
}
public int getRecordTypeId() {
	return recordTypeId;
}
public void setRecordTypeId(int recordTypeId) {
	this.recordTypeId = recordTypeId;
}
public void setCreatedBy(int createdBy) {
	this.createdBy = createdBy;
}
List<DocumentData> documentDatas;


public Integer getChatOnRelatedPartyId() {
	return chatOnRelatedPartyId;
}
public void setChatOnRelatedPartyId(Integer chatOnRelatedPartyId) {
	this.chatOnRelatedPartyId = chatOnRelatedPartyId;
}

public MultipartFile[] getChatAttachment() {
	return chatAttachment;
}
public void setChatAttachment(MultipartFile[] chatAttachment) {
	this.chatAttachment = chatAttachment;
}
public String getFeedItemPost() {
	return feedItemPost;
}
public void setFeedItemPost(String feedItemPost) {
	this.feedItemPost = feedItemPost;
}
public String getFeedFilePost() {
	return feedFilePost;
}
public void setFeedFilePost(String feedFilePost) {
	this.feedFilePost = feedFilePost;
}
public String getFeedLinkPost() {
	return feedLinkPost;
}
public void setFeedLinkPost(String feedLinkPost) {
	this.feedLinkPost = feedLinkPost;
}
public String getFeedLinkURL() {
	return feedLinkURL;
}
public void setFeedLinkURL(String feedLinkURL) {
	this.feedLinkURL = feedLinkURL;
}

public String getFeedLinkName() {
	return feedLinkName;
}
public void setFeedLinkName(String feedLinkName) {
	this.feedLinkName = feedLinkName;
}
public String getIsTagging() {
	return isTagging;
}
public void setIsTagging(String isTagging) {
	this.isTagging = isTagging;
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
public Integer getContact() {
	return contact;
}
public void setContact(Integer contact) {
	this.contact = contact;
}
public String getChatBody() {
	return chatBody;
}
public void setChatBody(String chatBody) {
	this.chatBody = chatBody;
}
public Integer getParentChatId() {
	return parentChatId;
}
public void setParentChatId(Integer parentChatId) {
	this.parentChatId = parentChatId;
}
public int getChatTypeId() {
	return chatTypeId;
}
public void setChatTypeId(int chatTypeId) {
	this.chatTypeId = chatTypeId;
}
public int getChatContentTypeId() {
	return chatContentTypeId;
}
public void setChatContentTypeId(int chatContentTypeId) {
	this.chatContentTypeId = chatContentTypeId;
}
public int getChatPartyId() {
	return chatPartyId;
}
public void setChatPartyId(int chatPartyId) {
	this.chatPartyId = chatPartyId;
}
public int getBuId() {
	return buId;
}
public void setBuId(int buId) {
	this.buId = buId;
}

}
