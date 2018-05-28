package in.fiinfra.common.service.vo;

import java.util.Date;



public class Download {
	
	private String bizUnit;
	private int party;
	
	private String downloadModuleName;
	private String documentName;
	private String fileName;	
	private String listingExpiresOn;

	private boolean isShareEmail=false;
	private boolean isShareView=false;
	private boolean isShareDownload=false;
	private int documentId;	
	
	private String lastname;
	private String buId;
	private int buId2;

	private String codevalue;
	private String codeValueId;
		
	private String documentText;
	private boolean documentBinary;	
	
	private String fileStoragePathURI;
	private int fileTypeID;
	private int fileSizeKB;
	
	private boolean isDownloadModule;
	private int downloadModuleID;
	private String downloadDescription;
	private	int createdBy;
	private int lastModifiedBy;
	private Date downloadExpiryDate;
	private String viewName;
	private String emailName;
	private String downloadName;
	private String datepickerName;
	private String hiddenIsToClose;
	private String hdndocumentIdNm;
	private String hiddenEditIsToClose;
	private String hdnsizekbNm;
	private String editftxtid;
	private String hdnbasepathNm;
	private String fileNamee;
	private String Sectionid;

	private String createdname;
	private String createddate;

	private boolean isServicePortal=false;
	private boolean isPartnerPortal=false;
	private boolean isClientPortal=false;
	

	private String sourceSystemid;
	private String serviceValue;
	private String partnerValue;
	private String clientValue;
	
	public String getSourceSystemid() {
		return sourceSystemid;
	}
	public void setSourceSystemid(String sourceSystemid) {
		this.sourceSystemid = sourceSystemid;
	}
	
	public void setSourceSysid(String sourceSysid) {
		sourceSysid = sourceSysid;
	}
	public String getServiceValue() {
		return serviceValue;
	}
	public void setServiceValue(String serviceValue) {
		this.serviceValue = serviceValue;
	}
	public String getPartnerValue() {
		return partnerValue;
	}
	public void setPartnerValue(String partnerValue) {
		this.partnerValue = partnerValue;
	}
	public String getClientValue() {
		return clientValue;
	}
	public void setClientValue(String clientValue) {
		this.clientValue = clientValue;
	}
	public boolean isServicePortal() {
		return isServicePortal;
	}
	public void setServicePortal(boolean isServicePortal) {
		this.isServicePortal = isServicePortal;
	}
	public boolean isPartnerPortal() {
		return isPartnerPortal;
	}
	public void setPartnerPortal(boolean isPartnerPortal) {
		this.isPartnerPortal = isPartnerPortal;
	}
	public boolean isClientPortal() {
		return isClientPortal;
	}
	public void setClientPortal(boolean isClientPortal) {
		this.isClientPortal = isClientPortal;
	}
	public String getCreatedname() {
		return createdname;
	}
	public void setCreatedname(String createdname) {
		this.createdname = createdname;
	}
	public String getCreateddate() {
		return createddate;
	}
	public void setCreateddate(String createddate) {
		this.createddate = createddate;
	}
	public int getBuId2() {
		return buId2;
	}
	public String getSectionid() {
		return Sectionid;
	}
	public void setSectionid(String sectionid) {
		Sectionid = sectionid;
	}
	public void setBuId2(int buId2) {
		this.buId2 = buId2;
	}
	public String getBizUnit() {
		return bizUnit;
	}
	public void setBizUnit(String bizUnit) {
		this.bizUnit = bizUnit;
	}
	public int getParty() {
		return party;
	}
	public void setParty(int party) {
		this.party = party;
	}

	public String getDownloadModuleName() {
		return downloadModuleName;
	}
	public void setDownloadModuleName(String downloadModuleName) {
		this.downloadModuleName = downloadModuleName;
	}
	public String getDocumentName() {
		return documentName;
	}
	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getListingExpiresOn() {
		return listingExpiresOn;
	}
	public void setListingExpiresOn(String listingExpiresOn) {
		this.listingExpiresOn = listingExpiresOn;
	}
	public boolean getIsShareEmail() {
		return isShareEmail;
	}
	public void setIsShareEmail(boolean isShareEmail) {
		this.isShareEmail = isShareEmail;
	}
	public boolean getIsShareView() {
		return isShareView;
	}
	public void setIsShareView(boolean isShareView) {
		this.isShareView = isShareView;
	}
	
	public boolean getIsShareDownload() {
		return isShareDownload;
	}
	public void setIsShareDownload(boolean isShareDownload) {
		this.isShareDownload = isShareDownload;
	}
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getBuId() {
		return buId;
	}
	public void setBuId(String buId) {
		this.buId = buId;
	}
	public String getCodevalue() {
		return codevalue;
	}
	public void setCodevalue(String codevalue) {
		this.codevalue = codevalue;
	}
	public String getCodeValueId() {
		return codeValueId;
	}
	public void setCodeValueId(String codeValueId) {
		this.codeValueId = codeValueId;
	}
	public String getDocumentText() {
		return documentText;
	}
	public void setDocumentText(String documentText) {
		this.documentText = documentText;
	}
	public boolean getIsDocumentBinary() {
		return documentBinary;
	}
	public void setIsDocumentBinary(boolean documentBinary) {
		this.documentBinary = documentBinary;
	}
	public String getFileStoragePathURI() {
		return fileStoragePathURI;
	}
	public void setFileStoragePathURI(String fileStoragePathURI) {
		this.fileStoragePathURI = fileStoragePathURI;
	}
	public int getFileTypeID() {
		return fileTypeID;
	}
	public void setFileTypeID(int fileTypeID) {
		this.fileTypeID = fileTypeID;
	}
	public int getFileSizeKB() {
		return fileSizeKB;
	}
	public void setFileSizeKB(int fileSizeKB) {
		this.fileSizeKB = fileSizeKB;
	}
	public boolean isDownloadModule() {
		return isDownloadModule;
	}
	public void setDownloadModule(boolean isDownloadModule) {
		this.isDownloadModule = isDownloadModule;
	}
	public int getDownloadModuleID() {
		return downloadModuleID;
	}
	public void setDownloadModuleID(int downloadModuleID) {
		this.downloadModuleID = downloadModuleID;
	}
	public String getDownloadDescription() {
		return downloadDescription;
	}
	public void setDownloadDescription(String downloadDescription) {
		this.downloadDescription = downloadDescription;
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
	public Date getDownloadExpiryDate() {
		return downloadExpiryDate;
	}
	public void setDownloadExpiryDate(Date downloadExpiryDate) {
		this.downloadExpiryDate = downloadExpiryDate;
	}
	public String getViewName() {
		return viewName;
	}
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	public String getEmailName() {
		return emailName;
	}
	public void setEmailName(String emailName) {
		this.emailName = emailName;
	}
	public String getDownloadName() {
		return downloadName;
	}
	public void setDownloadName(String downloadName) {
		this.downloadName = downloadName;
	}
	public String getDatepickerName() {
		return datepickerName;
	}
	public void setDatepickerName(String datepickerName) {
		this.datepickerName = datepickerName;
	}
	public String getHiddenIsToClose() {
		return hiddenIsToClose;
	}
	public void setHiddenIsToClose(String hiddenIsToClose) {
		this.hiddenIsToClose = hiddenIsToClose;
	}
	public String getHdndocumentIdNm() {
		return hdndocumentIdNm;
	}
	public void setHdndocumentIdNm(String hdndocumentIdNm) {
		this.hdndocumentIdNm = hdndocumentIdNm;
	}
	public String getHiddenEditIsToClose() {
		return hiddenEditIsToClose;
	}
	public void setHiddenEditIsToClose(String hiddenEditIsToClose) {
		this.hiddenEditIsToClose = hiddenEditIsToClose;
	}
	public String getHdnsizekbNm() {
		return hdnsizekbNm;
	}
	public void setHdnsizekbNm(String hdnsizekbNm) {
		this.hdnsizekbNm = hdnsizekbNm;
	}
	public String getEditftxtid() {
		return editftxtid;
	}
	public void setEditftxtid(String editftxtid) {
		this.editftxtid = editftxtid;
	}
	public String getHdnbasepathNm() {
		return hdnbasepathNm;
	}
	public void setHdnbasepathNm(String hdnbasepathNm) {
		this.hdnbasepathNm = hdnbasepathNm;
	}
	public String getFileNamee() {
		return fileNamee;
	}
	public void setFileNamee(String fileNamee) {
		this.fileNamee = fileNamee;
	}
	@Override
	public String toString() {
		return "Download [bizUnit=" + bizUnit + ", party=" + party
				+ ", downloadModuleName=" + downloadModuleName
				+ ", documentName=" + documentName + ", fileName=" + fileName
				+ ", listingExpiresOn=" + listingExpiresOn + ", isShareEmail="
				+ isShareEmail + ", isShareView=" + isShareView
				+ ", isShareDownload=" + isShareDownload + ", documentId="
				+ documentId + ", lastname=" + lastname + ", buId=" + buId
				+ ", codevalue=" + codevalue + ", codeValueId=" + codeValueId
				+ ", documentText=" + documentText + ", documentBinary="
				+ documentBinary + ", fileStoragePathURI=" + fileStoragePathURI
				+ ", fileTypeID=" + fileTypeID + ", fileSizeKB=" + fileSizeKB
				+ ", isDownloadModule=" + isDownloadModule
				+ ", downloadModuleID=" + downloadModuleID
				+ ", downloadDescription=" + downloadDescription
				+ ", createdBy=" + createdBy + ", lastModifiedBy="
				+ lastModifiedBy + ", downloadExpiryDate=" + downloadExpiryDate
				+ ", viewName=" + viewName + ", emailName=" + emailName
				+ ", downloadName=" + downloadName + ", datepickerName="
				+ datepickerName + ", hiddenIsToClose=" + hiddenIsToClose
				+ ", hdndocumentIdNm=" + hdndocumentIdNm
				+ ", hiddenEditIsToClose=" + hiddenEditIsToClose
				+ ", hdnsizekbNm=" + hdnsizekbNm + ", editftxtid=" + editftxtid
				+ ", hdnbasepathNm=" + hdnbasepathNm + ", fileNamee="
				+ fileNamee + ", sourceSystemIDe=" + sourceSystemid+ "]";
	}

	

}
