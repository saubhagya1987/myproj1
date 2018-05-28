package in.fiinfra.doc.dao;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;

import java.util.List;

public interface DocumentDAO {

	List<DocumentData> getDocuments(DocumentRequest req);
	
	void saveDocument(int buId, DocumentData document);
	
	boolean deleteDocument(int buId, int userId, int docId);
	
	DocumentData getDocument(int buId, int documentId);
	
	String getStoragePath(int buId, int partyId, int refTypeId);

}
