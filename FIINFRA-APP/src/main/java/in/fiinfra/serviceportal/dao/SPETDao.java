package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.partner.TransactionData;
import in.fiinfra.common.partner.TransactionHistoryData;

import javax.ws.rs.core.Response;

public interface SPETDao { 
	Response getUploadHistory(TransactionData transactionData);
	Response showPartnerPSTList(int sessionbuId,int sessionuserId); 
	Response requestforreprocess(String batchId,String createdBy); 
	Response bulkReprocess(String batchId,String reprocesslist);
	Response getbulkuploaderrorcount(TransactionData transactionData);
	Response getbulkuploadtransactiohistorydetails(TransactionHistoryData transactionData); 
	
	Response getbulkuploadSourceType(int codeTypeIds,int buId); 
	Response getbulkuploadFileType(int parentId); 
	

	public int bulkUploadTxn(int txnSourceId,String fileName, int createdBy);  
	Response getUniqueBasePath(String txnSourceID);
	Response getFTPBasePath(String txnSourceID,String protocol);
}
  