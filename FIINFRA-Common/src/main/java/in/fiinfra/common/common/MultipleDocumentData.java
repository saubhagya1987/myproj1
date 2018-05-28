package in.fiinfra.common.common;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MultipleDocumentData {
	MultipartFile[] documentFiles;
	List<DocumentData> documentDatas;

	public MultipartFile[] getDocumentFiles() {
		return documentFiles;
	}

	public void setDocumentFiles(MultipartFile[] documentFiles) {
		this.documentFiles = documentFiles;
	}

	public List<DocumentData> getDocumentDatas() {
		return documentDatas;
	}

	public void setDocumentDatas(List<DocumentData> documentDatas) {
		this.documentDatas = documentDatas;
	}
	
	
}
