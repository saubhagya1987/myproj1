package in.fiinfra.document.service;

import in.fiinfra.auth.model.GetRequest;
import in.fiinfra.birt.models.IssuerId;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.cp.common.model.ReportRequest;
import in.fiinfra.cp.common.service.BasicService;
import in.fiinfra.cp.common.service.Services;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;

public class DocumentService extends BasicService {

	public Integer addDocument(int BuId, DocumentData document, File thumbailBasePath) throws Exception{
		
		document.setDocumentStorageLocation(FiinfraUtility.getStorageCodeIdFromDocumentRefType(document.getRefTypeId()));
		
		MultipartFile file = null;
		if(document.getFiles() != null && document.getFiles().size() >0){
			for(MultipartFile f: document.getFiles()){
				if(!f.isEmpty()){
					file = f;
					break;
				}
			}
		}
		
		if(document.getDocumentId() <=0 || file != null){
			String storagePath= getService().getForObject(Services.getFileStoragePath, 
					new GetRequest().param("partyId", document.getPartyId()).
					param("storageId", document.getDocumentStorageLocation()).param("buId", BuId), String.class, appendPathParam());
			
			document.setFileStoragePathURI(storagePath);
			
			File phycicalPath = FiinfraUtility.saveDocument(new File(storagePath),"", file);
			if(phycicalPath ==null){
				return -1;
			}
			document.setFileName(phycicalPath.getName());
			document.setFileStoragePathURI(phycicalPath.getAbsolutePath());
			if(thumbailBasePath != null){
				String thumbNail = FiinfraUtility.generateThumbnail(phycicalPath, thumbailBasePath,"thumbail");
				if(thumbNail != null){
					document.setThumbnail(thumbNail);
				}
			}
		}
		
		return getService().postForObject(Services.addDocument, document,Integer.class, appendPathParam());
		
	}
	
	public Integer saveDocumentData(DocumentData document) throws Exception{
		
		return getService().postForObject(Services.addDocument, document,Integer.class, appendPathParam());
		
	}


	public List<DocumentData> getDocuments(DocumentRequest req){
		req.setFromClient(true);
		
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

	public String deleteDocument(DocumentRequest q) {
			return getService().getForObject(Services.deleteDocument, q,
					String.class, appendPathParam());
		}
	
	public List<IssuerId> getCompanyId(ReportRequest req) {
		return getService().getForObjectCollection(
				Services.URL_GET_COMPANYID, req, IssuerId.class,
				appendPathParam());
	}

	public List<IssuerId> getProductId(ReportRequest req) {
		return getService().getForObjectCollection(
				Services.URL_GET_PRODUCTID, req, IssuerId.class,
				appendPathParam());
	}
	
	public List<IssuerId> getInvestorStartDate(ReportRequest req) {
		return getService().getForObjectCollection(
				Services.URL_GET_INVESTORTXNSTARTDATE, req, IssuerId.class,
				appendPathParam());
	}
	
}
