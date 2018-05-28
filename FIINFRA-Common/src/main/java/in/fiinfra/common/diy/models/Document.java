package in.fiinfra.common.diy.models;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Document implements Serializable
{
	@JsonProperty
	private Integer documentId;
	@JsonProperty
	private Integer documentType;
	@JsonProperty
	private String documentName;
	@JsonProperty
	private Integer documentStorageLocation;
	@JsonProperty
	private String fileName;
	@JsonProperty
	private String fileStoragePathURI;
	@JsonProperty
	private Integer fileTypeId;
	@JsonProperty
	private Integer fileSize;//KB
	@JsonProperty
	private Integer partyId;
	@JsonProperty
	private Integer createdBy;
	@JsonProperty
	private String flag;

	public Document() 
	{
		this.documentId=-1;
		this.documentType=-1;
		this.documentStorageLocation=-1;
		this.fileSize=-1;
		this.fileTypeId=-1;
	}
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public Integer getDocumentId() {
		return documentId;
	}
	public void setDocumentId(Integer documentId) {
		this.documentId = documentId;
	}
	public Integer getDocumentType() {
		return documentType;
	}
	public void setDocumentType(Integer documentType) {
		this.documentType = documentType;
	}
	public String getDocumentName() {
		return documentName;
	}
	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}
	public Integer getDocumentStorageLocation() {
		return documentStorageLocation;
	}
	public void setDocumentStorageLocation(Integer documentStorageLocation) {
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
	public Integer getFileTypeId() {
		return fileTypeId;
	}
	public void setFileTypeId(Integer fileTypeId) {
		this.fileTypeId = fileTypeId;
	}
	public Integer getFileSize() {
		return fileSize;
	}
	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	
	
	
}
