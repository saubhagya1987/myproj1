package in.fiinfra.common.common;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

public class NotifyTemplateData {

private int notifyTemplateID;
private int partyID;
private int notifyTypeID;
private String name;
private String description;
private int notifyEventID;
private int notifyTargetID;
private int deliveryChannelID;
private int useSignatureID;
private String notifyTemplateXML;
private String notifyTemplateXML2;
private boolean Attachment;
private int attachmentCount;
private int attachment1DocumentID;
private int attachment2DocumentID;
private int attachment3DocumentID;
private String attachment1DocumentName;
private String attachment2DocumentName;
private String attachment3DocumentName;
private boolean active;
private boolean Public;
private String ratingDttm;
private int createdBy;
private String createdDate;
private int lastModifiedBy;
private String lastModifiedDate;
private boolean AddDisclaimerText;
private boolean AddDNDText;
private int sourceSystemID;
private String tagList;
@JsonIgnore
private transient MultipartFile[] templateAttachment;
private List<DocumentData> documentDatas;
private List<TagData> tagDatas;

private int scheduleCount;
private int recipientCount;
private int ratingTypeId;
private String pingOwner;
private String sessionId;
private String signature;
private String logo;

private String notifyTagName;
private int notifyTagId;

private int favouriteTemplate;
private int mostUsedTemplate;
private int mostPopularTemplate;
private String partyIDString;



private String source;
private String event;
private String deliveryChannel;
private int eventSourceId;






public String getNotifyTemplateXML2() {
	return notifyTemplateXML2;
}
public void setNotifyTemplateXML2(String notifyTemplateXML2) {
	this.notifyTemplateXML2 = notifyTemplateXML2;
}

public int getNotifyTagId() {
	return notifyTagId;
}
public void setNotifyTagId(int notifyTagId) {
	this.notifyTagId = notifyTagId;
}
public String getNotifyTagName() {
	return notifyTagName;
}
public void setNotifyTagName(String notifyTagName) {
	this.notifyTagName = notifyTagName;
}




public int getNotifyTemplateID() {
	return notifyTemplateID;
}
public void setNotifyTemplateID(int notifyTemplateID) {
	this.notifyTemplateID = notifyTemplateID;
}
public int getPartyID() {
	return partyID;
}
public void setPartyID(int partyID) {
	this.partyID = partyID;
}
public int getNotifyTypeID() {
	return notifyTypeID;
}
public void setNotifyTypeID(int notifyTypeID) {
	this.notifyTypeID = notifyTypeID;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public int getNotifyEventID() {
	return notifyEventID;
}
public void setNotifyEventID(int notifyEventID) {
	this.notifyEventID = notifyEventID;
}
public int getNotifyTargetID() {
	return notifyTargetID;
}
public void setNotifyTargetID(int notifyTargetID) {
	this.notifyTargetID = notifyTargetID;
}
public int getDeliveryChannelID() {
	return deliveryChannelID;
}
public void setDeliveryChannelID(int deliveryChannelID) {
	this.deliveryChannelID = deliveryChannelID;
}
public int getUseSignatureID() {
	return useSignatureID;
}
public void setUseSignatureID(int useSignatureID) {
	this.useSignatureID = useSignatureID;
}
public String getNotifyTemplateXML() {
	return notifyTemplateXML;
}
public void setNotifyTemplateXML(String notifyTemplateXML) {
	this.notifyTemplateXML = notifyTemplateXML;
}
public boolean isAttachment() {
	return Attachment;
}
public void setAttachment(boolean attachment) {
	Attachment = attachment;
}
public int getAttachmentCount() {
	return attachmentCount;
}
public void setAttachmentCount(int attachmentCount) {
	this.attachmentCount = attachmentCount;
}
public int getAttachment1DocumentID() {
	return attachment1DocumentID;
}
public void setAttachment1DocumentID(int attachment1DocumentID) {
	this.attachment1DocumentID = attachment1DocumentID;
}
public int getAttachment2DocumentID() {
	return attachment2DocumentID;
}
public void setAttachment2DocumentID(int attachment2DocumentID) {
	this.attachment2DocumentID = attachment2DocumentID;
}
public int getAttachment3DocumentID() {
	return attachment3DocumentID;
}
public void setAttachment3DocumentID(int attachment3DocumentID) {
	this.attachment3DocumentID = attachment3DocumentID;
}
public boolean getActive() {
	return active;
}
public void setActive(boolean active) {
	this.active = active;
}
public boolean isPublic() {
	return Public;
}
public void setPublic(boolean public1) {
	Public = public1;
}
public String getRatingDttm() {
	return ratingDttm;
}
public void setRatingDttm(String ratingDttm) {
	this.ratingDttm = ratingDttm;
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
public int getLastModifiedBy() {
	return lastModifiedBy;
}
public void setLastModifiedBy(int lastModifiedBy) {
	this.lastModifiedBy = lastModifiedBy;
}
public String getLastModifiedDate() {
	return lastModifiedDate;
}
public void setLastModifiedDate(String lastModifiedDate) {
	this.lastModifiedDate = lastModifiedDate;
}
public boolean isAddDisclaimerText() {
	return AddDisclaimerText;
}
public void setAddDisclaimerText(boolean addDisclaimerText) {
	AddDisclaimerText = addDisclaimerText;
}
public boolean isAddDNDText() {
	return AddDNDText;
}
public void setAddDNDText(boolean addDNDText) {
	AddDNDText = addDNDText;
}
public int getSourceSystemID() {
	return sourceSystemID;
}
public void setSourceSystemID(int sourceSystemID) {
	this.sourceSystemID = sourceSystemID;
}
public String getTagList() {
	return tagList;
}
public void setTagList(String tagList) {
	this.tagList = tagList;
}
public MultipartFile[] getTemplateAttachment() {
	return templateAttachment;
}
public void setTemplateAttachment(MultipartFile[] templateAttachment) {
	this.templateAttachment = templateAttachment;
}
public List<DocumentData> getDocumentDatas() {
	return documentDatas;
}
public void setDocumentDatas(List<DocumentData> documentDatas) {
	this.documentDatas = documentDatas;
}
public List<TagData> getTagDatas() {
	return tagDatas;
}
public void setTagDatas(List<TagData> tagDatas) {
	this.tagDatas = tagDatas;
}
public String getAttachment1DocumentName() {
	return attachment1DocumentName;
}
public void setAttachment1DocumentName(String attachment1DocumentName) {
	this.attachment1DocumentName = attachment1DocumentName;
}
public String getAttachment2DocumentName() {
	return attachment2DocumentName;
}
public void setAttachment2DocumentName(String attachment2DocumentName) {
	this.attachment2DocumentName = attachment2DocumentName;
}
public String getAttachment3DocumentName() {
	return attachment3DocumentName;
}
public void setAttachment3DocumentName(String attachment3DocumentName) {
	this.attachment3DocumentName = attachment3DocumentName;
}
public int getScheduleCount() {
	return scheduleCount;
}
public void setScheduleCount(int scheduleCount) {
	this.scheduleCount = scheduleCount;
}
public int getRecipientCount() {
	return recipientCount;
}
public void setRecipientCount(int recipientCount) {
	this.recipientCount = recipientCount;
}
public int getRatingTypeId() {
	return ratingTypeId;
}
public void setRatingTypeId(int ratingTypeId) {
	this.ratingTypeId = ratingTypeId;
}
public String getPingOwner() {
	return pingOwner;
}
public void setPingOwner(String pingOwner) {
	this.pingOwner = pingOwner;
}
public String getSessionId() {
	return sessionId;
}
public void setSessionId(String sessionId) {
	this.sessionId = sessionId;
}
public String getSignature() {
	return signature;
}
public void setSignature(String signature) {
	this.signature = signature;
}
public String getLogo() {
	return logo;
}
public void setLogo(String logo) {
	this.logo = logo;
}
public int getFavouriteTemplate() {
	return favouriteTemplate;
}
public void setFavouriteTemplate(int favouriteTemplate) {
	this.favouriteTemplate = favouriteTemplate;
}
public int getMostUsedTemplate() {
	return mostUsedTemplate;
}
public void setMostUsedTemplate(int mostUsedTemplate) {
	this.mostUsedTemplate = mostUsedTemplate;
}
public int getMostPopularTemplate() {
	return mostPopularTemplate;
}
public void setMostPopularTemplate(int mostPopularTemplate) {
	this.mostPopularTemplate = mostPopularTemplate;
}
public String getPartyIDString() {
	return partyIDString;
}
public void setPartyIDString(String partyIDString) {
	this.partyIDString = partyIDString;
}
public String getSource() {
	return source;
}
public void setSource(String source) {
	this.source = source;
}
public String getEvent() {
	return event;
}
public void setEvent(String event) {
	this.event = event;
}
public String getDeliveryChannel() {
	return deliveryChannel;
}
public void setDeliveryChannel(String deliveryChannel) {
	this.deliveryChannel = deliveryChannel;
}
public int getEventSourceId() {
	return eventSourceId;
}
public void setEventSourceId(int eventSourceId) {
	this.eventSourceId = eventSourceId;
}



}
