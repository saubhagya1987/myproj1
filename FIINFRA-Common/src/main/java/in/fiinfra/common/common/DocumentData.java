package in.fiinfra.common.common;

import java.util.Date;
import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.web.multipart.MultipartFile;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class DocumentData {
	public static final String THUMBNAIL_EXT = "png";

	private int documentType;
	private String documentName;
	private int documentStorageLocation;
	private String fileName;
	private String fileStoragePathURI;
	private int fileTypeId;
	private int fileSize;// KB
	private int partyId;
	private int createdBy;

	private String uploadedBy;
	private String uploadedOn;
	private int documentId;
	private String createdByName;
	private String refTypeName;
	private int buId;
	private String documentTypeValue;

	MultipartFile documentAttachment;

	public MultipartFile getDocumentAttachment() {
		return documentAttachment;
	}

	public void setDocumentAttachment(MultipartFile documentAttachment) {
		this.documentAttachment = documentAttachment;
	}

	// private transient MultipartFile[] documentAttachment;
	//
	//
	// public MultipartFile[] getDocumentAttachment() {
	// System.out.println("Amruta"+documentAttachment);
	// return documentAttachment;
	// }
	// public void setDocumentAttachment(MultipartFile[] documentAttachment) {
	// this.documentAttachment = documentAttachment;
	// }
	public int getBuId() {
		return buId;
	}

	public void setBuId(int buId) {
		this.buId = buId;
	}

	@JsonIgnore
	private List<MultipartFile> files;
	private String contactEmailId;
	private String partnerEmailId;

	private String createdDate;

	private Date lastModifiedDate;

	private String description;

	private Integer refTypeId;

	private Integer refId;

	private String thumbnail;

	private Integer sectionId;

	public String getContactEmailId() {
		return contactEmailId;
	}

	public void setContactEmailId(String contactEmailId) {
		this.contactEmailId = contactEmailId;
	}

	public String getPartnerEmailId() {
		return partnerEmailId;
	}

	public void setPartnerEmailId(String partnerEmailId) {
		this.partnerEmailId = partnerEmailId;
	}

	@JsonIgnore
	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public String getUploadedOn() {
		return uploadedOn;
	}

	public void setUploadedOn(String uploadedOn) {
		this.uploadedOn = uploadedOn;
	}

	public int getDocumentId() {
		return documentId;
	}

	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}

	public String getUploadedBy() {
		return uploadedBy;
	}

	public void setUploadedBy(String uploadedBy) {
		this.uploadedBy = uploadedBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public int getDocumentType() {
		return documentType;
	}

	public void setDocumentType(int documentType) {
		this.documentType = documentType;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public int getDocumentStorageLocation() {
		return documentStorageLocation;
	}

	public void setDocumentStorageLocation(int documentStorageLocation) {
		this.documentStorageLocation = documentStorageLocation;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileStoragePathURI() {
		return fileStoragePathURI;
	}

	public void setFileStoragePathURI(String fileStoragePathURI) {
		this.fileStoragePathURI = fileStoragePathURI;
	}

	public int getFileTypeId() {
		return fileTypeId;
	}

	public void setFileTypeId(int fileTypeId) {
		this.fileTypeId = fileTypeId;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public String getDescription() {

		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getRefTypeId() {
		return refTypeId;
	}

	public void setRefTypeId(Integer refTypeId) {
		this.refTypeId = refTypeId;
	}

	public Integer getRefId() {
		return refId;
	}

	public void setRefId(Integer refId) {
		this.refId = refId;
	}

	public String getThumbnail() {
		return this.thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getCreatedByName() {
		return createdByName;
	}

	public void setCreatedByName(String createdByName) {
		this.createdByName = createdByName;
	}

	public String getRefTypeName() {
		return refTypeName;
	}

	public void setRefTypeName(String refTypeName) {
		this.refTypeName = refTypeName;
	}

	public Integer getSectionId() {
		return sectionId;
	}

	public void setSectionId(Integer sectionId) {
		this.sectionId = sectionId;
	}

	public String getDocumentTypeValue() {
		return documentTypeValue;
	}

	public void setDocumentTypeValue(String documentTypeValue) {
		this.documentTypeValue = documentTypeValue;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

}
