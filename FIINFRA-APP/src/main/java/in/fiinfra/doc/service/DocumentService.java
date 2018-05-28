package in.fiinfra.doc.service;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;

import java.util.List;

public interface DocumentService {

	DocumentData saveDocument(int buId, DocumentData document)throws Exception ;
	
	boolean deleteDocument(int buId, int userId, int docId)throws Exception ;
	
	List<DocumentData> getDocuments(DocumentRequest req);
	
	DocumentData getDocument(int buId, int documentId);
	
	String getStoragePath(int buId, int partyId, int refTypeId);
}
