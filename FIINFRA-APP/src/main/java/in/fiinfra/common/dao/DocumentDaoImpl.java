package in.fiinfra.common.dao;

import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.DocumentDataInsert;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository("documentDataDao")
public class DocumentDaoImpl implements DocumentDataDao 
{
	private static final Logger logger = Logger.getLogger(DocumentDaoImpl.class);
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



	@Override
	public Response insertorupdate(DocumentDataInsert doc) {
		

		BaseResponse<Integer> br = new BaseResponse();
		try
		{
			Integer count;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		count=jdbcTemplate.queryForObject(FiinfraConstants.SP_COMMON_INSERT_OR_UPDATE_DOCUMENT,new Object[]{doc.getDocumentName(),doc.getDocumentStorageLocationID(),doc.getDocumentTypeID(),doc.getCreatedBy(),doc.getFileName(),doc.getFileStoragePathURI(),doc.getFileTypeID(),doc.getLastModifiedBy(),doc.getPartyID(),doc.getDocumentRefTypeId(),doc.getDocumentRefRecordId(),doc.getBuId(),doc.getExtraParam()} ,Integer.class);
	
		
		br.setResponseObject(count);
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

	
}
