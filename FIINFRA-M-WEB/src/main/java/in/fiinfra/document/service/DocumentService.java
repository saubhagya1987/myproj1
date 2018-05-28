package in.fiinfra.document.service;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.service.Services;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.query.model.GetRequest;
import in.fiinfra.query.service.BasicService;

import java.io.File;
import java.util.List;

public class DocumentService extends BasicService {
	
	public Integer addDocument(int BuId, DocumentData document, File thumbailBasePath) throws Exception{
		document.setDocumentStorageLocation(FiinfraUtility.getStorageCodeIdFromDocumentRefType(document.getRefTypeId()));
		
		String storagePath= getService().getForObject(Services.getFileStoragePath, 
				new GetRequest().param("partyId", document.getPartyId()).
				param("storageId", document.getDocumentStorageLocation()).param("buId", BuId), String.class, appendPathParam());
		
		document.setFileStoragePathURI(storagePath);
		
		File phycicalPath = FiinfraUtility.saveDocument(new File(storagePath),"", document.getFiles().get(0));
		if(phycicalPath ==null){
			return -1;
		}
		document.setFileName(phycicalPath.getName());
		document.setFileStoragePathURI(phycicalPath.getAbsolutePath());
		String thumbNail = FiinfraUtility.generateThumbnail(phycicalPath, thumbailBasePath,"thumbail");
		if(thumbNail != null){
			document.setThumbnail(thumbNail);
		}
		
		return getService().postForObject(Services.addDocument, document,Integer.class, appendPathParam());
		
	}

	public List<DocumentData> getDocuments(DocumentRequest req){
		
		return getService().getForObjectCollection(Services.getDocuments, req, DocumentData.class, appendPathParam());
		
	}

	public DocumentData getDocument(DocumentRequest req){
		
		return getService().getForObject(Services.getDocument, req, DocumentData.class, appendPathParam());
		
	}
	
	public String getStoragePath(int partyId, int buId, int storageId){
		return getService().getForObject(Services.getFileStoragePath, 
				new GetRequest().param("partyId", partyId).
				param("storageId", storageId).param("buId", buId), String.class, appendPathParam());

	}
	


}
