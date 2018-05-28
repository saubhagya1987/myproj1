package in.fiinfra.serviceportal.dao;

import java.util.List;

import in.fiinfra.common.dao.CommonDaoImpl;
import in.fiinfra.common.partner.TransactionData;
import in.fiinfra.common.partner.TransactionHistoryData;
import in.fiinfra.common.service.vo.CodeValueData;
import in.fiinfra.common.service.vo.DepartmentListData;
import in.fiinfra.common.service.vo.NotifyEvent;
import in.fiinfra.common.service.vo.NotifyTemplate;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.ws.rs.core.Response;

@Repository("etspDao")
public class SPETDaoImpl implements SPETDao {
	
	private static final Logger logger = Logger.getLogger(SPETDaoImpl.class);
	
	@Autowired 
	DataSourceProvider dataSourceProvider;
	Response response=null;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();  
	
	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}
  
	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}

	@SuppressWarnings({ "finally", "unchecked" })
	@Override 
	public Response getUploadHistory(TransactionData transactionData) {
		// TODO Auto-generated method stub
		
		 
		BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
		try
		{
		List<TransactionData> uploadHistory;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		uploadHistory = jdbcTemplate.query(FiinfraConstants.SP_GET_UPLOAD_HISTORY,new Object[] {transactionData.getSearchText(),transactionData.getBuId()},new BeanPropertyRowMapper(TransactionData.class));
		br.setResponseListObject(uploadHistory); 
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally  
		{ 
			return response; 
		}
		
	}

	@SuppressWarnings("finally")
	@Override
	public Response showPartnerPSTList(int sessionbuId,int sessionuserId) {
		// TODO Auto-generated method stub
		BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
		try
		{ 
		List<TransactionData> partnerList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		partnerList=jdbcTemplate.query(FiinfraConstants.SP_GET_PARTNER_PST_LIST,new Object[]{ sessionbuId,sessionuserId} ,new BeanPropertyRowMapper<TransactionData>(TransactionData.class));
		br.setResponseListObject(partnerList);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
	}   
	
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally   
		{ 
			return response; 
		}    
	}   
	
	@SuppressWarnings("finally")
	@Override
	public Response requestforreprocess(String batchId,String createdBy) {
		// TODO Auto-generated method stub
		BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
		try
		{ 
		List<TransactionData> partnerList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		partnerList=jdbcTemplate.query(FiinfraConstants.SP_GET_REQUEST_REPROCESS,new Object[]{batchId,createdBy} ,new BeanPropertyRowMapper<TransactionData>(TransactionData.class));
		br.setResponseListObject(partnerList);   
		response=FiinfraResponseBuilder.getSuccessResponse(br, null); 
	}    
	 
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally     
		{ 
			return response; 
		}    
	}

	@SuppressWarnings("finally")
	@Override
	public Response bulkReprocess(String batchId,String reprocesslist) {
		// TODO Auto-generated method stub
		BaseResponse<TransactionData> br= new BaseResponse<TransactionData>();
		try 
		{ 
		List<TransactionData> count; 
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		count=jdbcTemplate.query(FiinfraConstants.SP_GET_BULK_REPROCESS,new Object[]{batchId,reprocesslist} , new BeanPropertyRowMapper<TransactionData>(TransactionData.class));
		br.setResponseListObject(count);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} 
		catch (DataAccessException e) {
			response =FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally  
		{
			return response; 
				}
	}

	 
	
	@SuppressWarnings({ "finally", "unchecked" })   
	@Override 
	public Response getbulkuploaderrorcount(TransactionData transactionData) {
		// TODO Auto-generated method stub
		BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
		try
		{ 
		List<TransactionData> uploadHistoryErrorLog;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		uploadHistoryErrorLog = jdbcTemplate.query(FiinfraConstants.SP_GET_TXN_HISTORYERRORLOG,new Object[] {transactionData.getBatchId()},new BeanPropertyRowMapper<TransactionData>(TransactionData.class));
		br.setResponseListObject(uploadHistoryErrorLog);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally  
		{  
			return response; 
		}
	}
 
	@SuppressWarnings({ "unchecked", "finally" })
	@Override
	public Response getbulkuploadtransactiohistorydetails(
			TransactionHistoryData transactionData) {
		// TODO Auto-generated method stub
		BaseResponse<TransactionHistoryData> br = new BaseResponse<TransactionHistoryData>();
		try 
		{
		List<TransactionHistoryData> uploadHistory;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		uploadHistory = jdbcTemplate.query(FiinfraConstants.SP_GET_TXN_HISTORYDETAILS,new Object[] {transactionData.getBatchId(),transactionData.getPartyid()},new BeanPropertyRowMapper(TransactionHistoryData.class));
		br.setResponseListObject(uploadHistory); 
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} 
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}   
		finally    
		{   
			return response; 
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getbulkuploadSourceType(int codeTypeIds, int buId) {
		// TODO Auto-generated method stub
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		try
		{  
		List<CodeValueData> SourceTypeList;  
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		SourceTypeList=jdbcTemplate.query(FiinfraConstants.SP_GET_CODETYPEVALUES_BY_CODETYPEID,new Object[]{ codeTypeIds,buId} ,new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class));
		br.setResponseListObject(SourceTypeList);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
	}    
	
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally   
		{ 
			return response; 
		}    
	}

	@SuppressWarnings("finally")
	@Override
	public Response getbulkuploadFileType(int parentId) {
		// TODO Auto-generated method stub
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		try
		{  
		List<CodeValueData> FileTypeList;  
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		FileTypeList=jdbcTemplate.query(FiinfraConstants.SP_GET_FILETYPE,new Object[]{ parentId} ,new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class));
		br.setResponseListObject(FileTypeList);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
	}    
	
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally   
		{ 
			return response; 
		}  
	}
 
	@Override
	public int bulkUploadTxn(int txnSourceId, String fileName, int createdBy) {
		// TODO Auto-generated method stub
		int result = 0;
		result= jdbcTemplate.queryForObject(FiinfraConstants.SP_UPLOAD_RTAFILES, new Object[]{txnSourceId,fileName,createdBy},Integer.class);
		return result;
	}

	
	@SuppressWarnings("finally")
	@Override 
	public Response getUniqueBasePath(String txnSourceID) {
		BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
		try {
			List<TransactionData> basepath;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			basepath = jdbcTemplate.query(FiinfraConstants.SP_UNIQUE_BASEPATH,new Object[] {txnSourceID},new BeanPropertyRowMapper<TransactionData>(TransactionData.class));
			br.setResponseListObject(basepath);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getFTPBasePath(String txnSourceID,String protocol) {
		BaseResponse<TransactionData> br = new BaseResponse<TransactionData>();
		try {
			List<TransactionData> basepath;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			basepath = jdbcTemplate.query(FiinfraConstants.SP_FTP_BASEPATH,new Object[] {txnSourceID,protocol},new BeanPropertyRowMapper<TransactionData>(TransactionData.class));
			br.setResponseListObject(basepath);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}
	
}
