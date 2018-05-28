package in.fiinfra.doc.service;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.doc.dao.DocumentDAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("documentService")
public class DocumentServiceImpl implements DocumentService{

	@Autowired
	DocumentDAO documentDao;
	
	
	@Override
	public DocumentData saveDocument(int buId, DocumentData document) throws Exception {
		
		
		documentDao.saveDocument(buId, document);	
		
		return document;
	}

	@Override
	public boolean deleteDocument(int buId, int userId, int docId) throws Exception {
		return documentDao.deleteDocument(buId, userId, docId);	
	}


	@Override
	public List<DocumentData> getDocuments( DocumentRequest req) {
		List<DocumentData> documents = documentDao.getDocuments(req);
		return documents;
	}

	@Override
	public DocumentData getDocument( int buId, int documentId) {
		return documentDao.getDocument(buId,documentId);
	}
	
	@Override
	public String getStoragePath(int buId, int partyId, int refTypeId){
		return documentDao.getStoragePath(buId, partyId, refTypeId); 
	}

}
