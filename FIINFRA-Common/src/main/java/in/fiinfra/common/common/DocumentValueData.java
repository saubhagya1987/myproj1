package in.fiinfra.common.common;

import java.util.Comparator;

public class DocumentValueData implements Comparator<DocumentValueData>{
	
	private int documentID;
	private int documentTypeID;
	private String documentText;
	private String documentName;
	private int documentStorageLocationID;
	private String fileName;
	private String filePath;
	private int fileTypeID;
	private int fileSize;
	private int isDownloadModule;
	private int downloadModuleID;
	private String downloadDescription;
	private String DownloadModuleName;
	private boolean isShareEmail;
	private boolean isShareView;
	private boolean isShareDownload;
	
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

	public String getDownloadModuleName() {
		return DownloadModuleName;
	}
	public void setDownloadModuleName(String downloadModuleName) {
		DownloadModuleName = downloadModuleName;
	}
	public int getDocumentID() {
		return documentID;
	}
	public void setDocumentID(int documentID) {
		this.documentID = documentID;
	}
	public int getDocumentTypeID() {
		return documentTypeID;
	}
	public void setDocumentTypeID(int documentTypeID) {
		this.documentTypeID = documentTypeID;
	}
	public String getDocumentText() {
		return documentText;
	}
	public void setDocumentText(String documentText) {
		this.documentText = documentText;
	}
	public String getDocumentName() {
		return documentName;
	}
	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}
	public int getDocumentStorageLocationID() {
		return documentStorageLocationID;
	}
	public void setDocumentStorageLocationID(int documentStorageLocationID) {
		this.documentStorageLocationID = documentStorageLocationID;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getFileTypeID() {
		return fileTypeID;
	}
	public void setFileTypeID(int fileTypeID) {
		this.fileTypeID = fileTypeID;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public int getIsDownloadModule() {
		return isDownloadModule;
	}
	public void setIsDownloadModule(int isDownloadModule) {
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
	@Override
	public int compare(DocumentValueData data1, DocumentValueData data2) {		
		return data1.getDownloadModuleID()-data2.getDownloadModuleID();
	}
}
