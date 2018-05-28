package in.fiinfra.common.service;

import in.fiinfra.common.dao.DocumentDataDao;
import in.fiinfra.common.util.DocumentDataInsert;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class DocumentDataServiceImpl implements DocumentDataService 
{

	
	@Autowired
	private DocumentDataDao documentDataDao;
	
	


	public DocumentDataDao getDocumentDataDao() {
		return documentDataDao;
	}




	public void setDocumentDataDao(DocumentDataDao documentDataDao) {
		this.documentDataDao = documentDataDao;
	}




	@Override
	public Response insertorupdate(DocumentDataInsert doc) 
	{
		Response faqList=documentDataDao.insertorupdate(doc);
	   return faqList;
	}
	


}
