package in.fiinfra.common.common;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.web.multipart.MultipartFile;
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class QueryData{
	private int queryType;
	private String queryFor;
	private int queryTo;
	private int contactType;
	private int contactId;
	private String subject;
	private String notes; 
	@JsonIgnore
	private transient MultipartFile[] queryAttachment;
	private int createdBy;
	private int queryOwner;
	private int queryId;
	private boolean isAttachment;
	private int attachmentCount;
	private int attachment1DocId;
	private int attachment2DocId;
	private int attachment3DocId;
	List<DocumentData> documentDatas;
	private String basePath;
	private String queryTypeName;
	private String queryOwnerName;
	private String lastUpdatedDate;
	private String status;
	private String lastUpdatedByName;
	private boolean isReadByParty;
	private String queryPanel;
	private int unreadCount;
	private List<QueryCommentData> queryCommentDatas;
	private String photoPath;
	private String doc1Name;
	private String doc2Name;
	private String doc3Name;
	private int queryFromRecordType;
	
	private int buId;

	public int getQueryType() {
		return queryType;
	}
	public void setQueryType(int queryType) {
		this.queryType = queryType;
	}
	public String getQueryFor() {
		return queryFor;
	}
	public void setQueryFor(String queryFor) {
		this.queryFor = queryFor;
	}
	public int getQueryTo() {
		return queryTo;
	}
	public void setQueryTo(int queryTo) {
		this.queryTo = queryTo;
	}
	public int getContactType() {
		return contactType;
	}
	public void setContactType(int contactType) {
		this.contactType = contactType;
	}
	public int getContactId() {
		return contactId;
	}
	public void setContactId(int contactId) {
		this.contactId = contactId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public int getQueryId() {
		return queryId;
	}
	public void setQueryId(int queryId) {
		this.queryId = queryId;
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
	public int getQueryOwner() {
		return queryOwner;
	}
	public void setQueryOwner(int queryOwner) {
		this.queryOwner = queryOwner;
	}
	public List<DocumentData> getDocumentDatas() {
		return documentDatas;
	}
	public void setDocumentDatas(List<DocumentData> documentDatas) {
		this.documentDatas = documentDatas;
	}
	@JsonIgnore
	public MultipartFile[] getQueryAttachment() {
		return queryAttachment;
	}
	@JsonIgnore
	public void setQueryAttachment(MultipartFile[] queryAttachment) {
		this.queryAttachment = queryAttachment;
	}
	public String getBasePath() {
		return basePath;
	}
	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}
	public String getQueryTypeName() {
		return queryTypeName;
	}
	public void setQueryTypeName(String queryTypeName) {
		this.queryTypeName = queryTypeName;
	}
	public String getQueryOwnerName() {
		return queryOwnerName;
	}
	public void setQueryOwnerName(String queryOwnerName) {
		this.queryOwnerName = queryOwnerName;
	}
	public String getLastUpdatedDate() {
		return lastUpdatedDate;
	}
	public void setLastUpdatedDate(String lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLastUpdatedByName() {
		return lastUpdatedByName;
	}
	public void setLastUpdatedByName(String lastUpdatedByName) {
		this.lastUpdatedByName = lastUpdatedByName;
	}
	public boolean getIsReadByParty() {
		return isReadByParty;
	}
	public void setIsReadByParty(boolean isReadByParty) {
		this.isReadByParty = isReadByParty;
	}
	public String getQueryPanel() {
		return queryPanel;
	}
	public void setQueryPanel(String queryPanel) {
		this.queryPanel = queryPanel;
	}
	public int getUnreadCount() {
		return unreadCount;
	}
	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}
	public void setReadByParty(boolean isReadByParty) {
		this.isReadByParty = isReadByParty;
	}
	public List<QueryCommentData> getQueryCommentDatas() {
		return queryCommentDatas;
	}
	public void setQueryCommentDatas(List<QueryCommentData> queryCommentDatas) {
		this.queryCommentDatas = queryCommentDatas;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
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
	public int getQueryFromRecordType() {
		return queryFromRecordType;
	}
	public void setQueryFromRecordType(int queryFromRecordType) {
		this.queryFromRecordType = queryFromRecordType;
	}
	public int getBuId() {
		return buId;
	}
	public void setBuId(int buId) {
		this.buId = buId;
	}
	
}
