package in.fiinfra.serviceportal.service;

import javax.ws.rs.core.Response;

import in.fiinfra.common.partner.TransactionData;
import in.fiinfra.common.partner.TransactionHistoryData;
import in.fiinfra.common.service.vo.NotifyTemplate;
import in.fiinfra.serviceportal.dao.SPETDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class SPETServicesImpl implements SPETServices {
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	
	@Autowired
	private SPETDao etspDao;
	  
 
 
	public SPETDao getEtspDao() {
		return etspDao; 
	}
 


	public void setEtspDao(SPETDao etspDao) {
		this.etspDao = etspDao;
	}

 

	@Override
	public Response getUploadHistory(TransactionData transactionData) {
		// TODO Auto-generated method stub
		Response uploadHistoryData=etspDao.getUploadHistory(transactionData);
		return uploadHistoryData; 
	}

  

	@Override
	public Response showPartnerPSTList(int sessionbuId,int sessionuserId) {
		// TODO Auto-generated method stub 
		Response partnerList = etspDao.showPartnerPSTList(sessionbuId,sessionuserId); 
		return partnerList;
	} 
	  
	@Override
	public Response requestforreprocess(String batchId,String createdBy) {
		// TODO Auto-generated method stub 
		Response partnerList = etspDao.requestforreprocess(batchId,createdBy); 
		return partnerList;
	}



	@Override 
	public Response bulkReprocess(String batchId,String reprocesslist) {
		// TODO Auto-generated method stub
		Response bulkReprocess=etspDao.bulkReprocess(batchId,reprocesslist);
		return bulkReprocess; 
	}



	@Override 
	public Response getbulkuploaderrorcount(TransactionData transactionData) {
		// TODO Auto-generated method stub
		Response uploadHistoryErrorLog =etspDao.getbulkuploaderrorcount(transactionData);
		return uploadHistoryErrorLog; 
	}



	@Override
	public Response getbulkuploadtransactiohistorydetails(
			TransactionHistoryData transactionData) {
		// TODO Auto-generated method stub
		Response uploadHistoryData=etspDao.getbulkuploadtransactiohistorydetails(transactionData); 
		return uploadHistoryData; 
	}



	@Override
	public Response getbulkuploadSourceType(int codeTypeIds, int buId) {
		// TODO Auto-generated method stub
		Response sourceType = etspDao.getbulkuploadSourceType(codeTypeIds, buId);
		return sourceType;
	}

  
 
	@Override
	public Response getbulkuploadFileType(int parentId) {
		// TODO Auto-generated method stub
		Response fileType = etspDao.getbulkuploadFileType(parentId);
		return fileType; 
	}



	@Override
	public int bulkUploadTxn(int txnSourceId, String fileName, int createdBy) {
		// TODO Auto-generated method stub
		int result = 0;
		result = etspDao.bulkUploadTxn(txnSourceId, fileName, createdBy);
		return result;
	}

  

	@Override
	public Response getUniqueBasePath(String txnSourceID) {
		// TODO Auto-generated method stub
		Response basepath=etspDao.getUniqueBasePath(txnSourceID);
		return basepath;
	}



	@Override
	public Response getFTPBasePath(String txnSourceID, String protocol) {
		// TODO Auto-generated method stub
		Response ftpbasepath=etspDao.getFTPBasePath(txnSourceID, protocol);
		return ftpbasepath;
	} 
	
	
	
	

}
