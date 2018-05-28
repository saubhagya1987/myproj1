package in.fiinfra.serviceportal.dao;


import in.fiinfra.common.service.vo.Download;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import java.util.Date;
import java.util.List;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class DownloadDaoImpl implements DownloadDao {
	
	private static final Logger logger = Logger.getLogger(DownloadDaoImpl.class);
	@Autowired
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	Response response=null;
	
	//DataSource dataSource;
	@Autowired
	DataSourceProvider dataSourceProvider;
	



	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}



	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}



	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}



	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}




	@SuppressWarnings("finally")
	@Override
	public Response showDownloadedList(String searchText) {

		BaseResponse<Download> br = new BaseResponse<Download>();
		try {
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			@SuppressWarnings({ "unchecked", "rawtypes" })
			List<Download> download = jdbcTemplate.query(
					FiinfraConstants.SP_GET_DOWNLOAD_DETAILS_LIST,
					new Object[] {searchText}, new BeanPropertyRowMapper(Download.class));
			br.setResponseListObject(download);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
			logger.info(response);
		} finally {
			return response;
		}

	}


	@SuppressWarnings("finally")
	@Override
	public Response getDCcolletral(String searchText) {

		BaseResponse<Download> br = new BaseResponse<Download>();
		try {
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			@SuppressWarnings({ "unchecked", "rawtypes" })
			List<Download> download = jdbcTemplate.query(
					FiinfraConstants.SP_GET_DC_COLLETRAL,
					new Object[] {searchText}, new BeanPropertyRowMapper(Download.class));
			br.setResponseListObject(download);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
			logger.info(response);
		} finally {
			return response;
		}

	}

	@Override
	public void addNewDownload(Download download) {
		    
		    int rowcnt=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_NEW_DOC_TO_DOWNLOAD,new Object[] { 
		    		download.getIsDocumentBinary(), 
		    		download.getDocumentName(),
		    		download.getFileName(), 
		    		download.getFileStoragePathURI(),
		    		download.getFileSizeKB(),
		    		download.getParty(),
		    		download.isDownloadModule(),
		    		download.getDownloadModuleID(), 
		    		download.getDownloadDescription(),
		    		download.getCreatedBy(),
		    		download.getLastModifiedBy(), 
		    		download.getIsShareEmail(),
		    		download.getIsShareView(),
		    		download.getIsShareDownload(),
		    		download.getDownloadExpiryDate(),
		    		download.isServicePortal(),
		    		download.isPartnerPortal(),
		    		download.isClientPortal(),
		    		download.getSourceSystemid()
		    		
		    		
		    }, Integer.class);
		   // System.out.println(rowcnt);
		   
		    
	}
	
	



	@Override
	public boolean addDCcolletral(Download download) {
		    
		    int rowcnt=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_DC_COLLETRAL,new Object[] { 
				
		    		download.getBuId2(),download.getSectionid(), download.getDocumentName(), download.getFileName(), download.getFileStoragePathURI(), download.getFileSizeKB(), download.getParty(), download.getCreatedBy(), download.getLastModifiedBy() 
		    		}, Integer.class);
		  
		    
		 //   System.out.println(rowcnt);
		   
		return true;   
		    
	}



	@SuppressWarnings("finally")
	@Override
	public Response getPartyByPartyId() {

		BaseResponse<Download> br = new BaseResponse<Download>();
		try {
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			@SuppressWarnings({ "unchecked", "rawtypes" })
			List<Download> download = jdbcTemplate.query(
					FiinfraConstants.SP_GET_BIZUNIT_BY_PARTY_ID,
					new Object[] { FiinfraConstants.BU_RECORD_TYPE_ID ,0,0},
					new BeanPropertyRowMapper(Download.class));
			br.setResponseListObject(download);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
			logger.info(response);
		} finally {
			return response;
		}

	}



	
	@SuppressWarnings("finally")
	@Override
	public Response ShowDownloadSection() {

		BaseResponse<Download> br = new BaseResponse<Download>();
		try {
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			@SuppressWarnings({ "unchecked", "rawtypes" })
			List<Download> download = jdbcTemplate.query(
					FiinfraConstants.SP_GET_DOWNLOAD_SECTION_BY_CODETYPE_ID,
					new Object[] { FiinfraConstants.DOWNLOAD_CODE_TYPE_ID },
					new BeanPropertyRowMapper(Download.class));
			br.setResponseListObject(download);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
			logger.info(response);
		} finally {
			return response;
		}

	}

	@Override
	public void editDocument(Download download) {
		
		 int rowcnt=jdbcTemplate.queryForObject(FiinfraConstants.SP_EDIT_DOC_TO_DOWNLOAD,new Object[] { 
				 download.getDocumentId(),
				 download.getDocumentName(),
				 download.getFileName(),
				 download.getFileStoragePathURI(),
				 download.getFileSizeKB(),
				 download.getParty(), 
				 download.getDownloadModuleID(),
				 download.getDownloadDescription(),
				 download.getCreatedBy(),
				 download.getIsShareEmail(),
				 download.getIsShareView(),  		
				 download.getIsShareDownload(),  		
				 download.getDownloadExpiryDate(),
				 download.getSourceSystemid()
				 
		  }, Integer.class);
			   logger.info(rowcnt);
				
	}/*

	@SuppressWarnings("finally")
	@Override
	public Response editDocument(int documentId, String documentName,
			String fileName, String fileStoragePathURI, int fileSizeKB,
			int partyId, int downloadModuleID, String downloadDescription,
			int createdBy, boolean isShareEmail, boolean isShareView,
			boolean isShareDownload, Date downloadExpiryDate) {
		@SuppressWarnings({ "unchecked", "rawtypes" })
		BaseResponse<Integer> br = new BaseResponse();
		try {
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
						
			result=jdbcTemplate.queryForObject(FiinfraConstants.SP_EDIT_DOC_TO_DOWNLOAD,new Object[] { 
					    documentId,
						documentName,
						fileName,
						fileStoragePathURI,fileSizeKB,
						partyId,downloadModuleID,
						downloadDescription,createdBy,
						isShareEmail,
						isShareView,isShareDownload,downloadExpiryDate }, Integer.class);
				   logger.info(result);
			
			
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}
*/

	@SuppressWarnings("finally")
	@Override
	public Response deleteDownloadList(String deletelist, int userid) {
		BaseResponse<Download> br = new BaseResponse<Download>();
		try {
			List<Download> count;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			count = jdbcTemplate.query(FiinfraConstants.SP_USP_DELETE_DOWNLOAD_LIST,
					new Object[] { deletelist, userid },
					new BeanPropertyRowMapper<Download>(Download.class));
			br.setResponseListObject(count);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}

	}

	
	@Override
	public List<Download> fileName(int documentId) {
		List<Download>  name = jdbcTemplate.query(FiinfraConstants.SP_USP_FILE_NAME,new Object[]{documentId} ,new BeanPropertyRowMapper<Download>(Download.class));
		return name;
	}


	

}
