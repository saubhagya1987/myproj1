package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.service.vo.CodeTypeData;
import in.fiinfra.common.service.vo.CodeValueData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import java.util.List;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("codeTypeDao")
public class CodeTypeDaoImpl implements CodeTypeDao 
{
	
	@Autowired
	DataSourceProvider dataSourceProvider;
	
	@Autowired
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	
	public DataSourceProvider getDataSourceProvider() 
	{
		return dataSourceProvider;
	}
	public void setDataSourceProvider(DataSourceProvider dataSourceProvider)
	{
		this.dataSourceProvider = dataSourceProvider;
	}
	public JdbcTemplate getJdbcTemplate() 
	{
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) 
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	
	Response response;
	
	//CODETYPE
	@SuppressWarnings("finally")
	@Override
	public Response getCodetypeList(CodeTypeData codetypedata) 
	{
		BaseResponse<CodeTypeData> br = new BaseResponse<CodeTypeData>();
		try
			{
				List<CodeTypeData> codetypeList;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				codetypeList = jdbcTemplate.query(FiinfraConstants.SP_GET_CODETYPE_DETAILS_LIST,new Object[]{codetypedata.getSearchText()},new BeanPropertyRowMapper<CodeTypeData>(CodeTypeData.class));
				br.setResponseListObject(codetypeList);
				response = FiinfraResponseBuilder.getSuccessResponse(br, null);
			}
			catch (DataAccessException e) 
			{
				response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
			}
			finally
			{
				return response;
			}
		
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response getMaxCodeTypeId(CodeTypeData codetypedata) 
	{
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		try
			{
				Integer maxCodetypeId;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				maxCodetypeId = jdbcTemplate.queryForObject(FiinfraConstants.SP_MAX_CODETYPE_ID,new Object[]{},(Integer.class));
				br.setResponseObject(maxCodetypeId);
				response = FiinfraResponseBuilder.getSuccessResponse(br, null);
			}
			catch (DataAccessException e) 
			{
				response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
			}
			finally
			{
				return response;
			}
		
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response addNewCodetype(CodeTypeData codetypedata) 
	{
		
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer codetype;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			codetype=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_NEW_CODE_TYPE,new Object[]{codetypedata.getCodeTypeId(),codetypedata.getCodeType(),codetypedata.getCodeTypeDescription()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(codetype);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
		
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response updateCodeType(CodeTypeData codetypedata) 
	{
		
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer codetype;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			codetype=jdbcTemplate.queryForObject(FiinfraConstants.SP_EDIT_CODE_TYPE,new Object[]{codetypedata.getCodeTypeId(),codetypedata.getCodeType(),codetypedata.getCodeTypeDescription()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(codetype);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
		
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response deleteCodetype(CodeTypeData codetypedata) 
	{
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer result = null;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(FiinfraConstants.SP_DELETE_CODETYPES, new Object[] {codetypedata.getDeleteList()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response viewValesfunction(CodeTypeData codetypedata) 
	{
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		try
		{
			List<CodeValueData> codevalueList;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			codevalueList=jdbcTemplate.query(FiinfraConstants.SP_GET_CODETYPE_VALUES_BY_CODETYPEID, new Object[] {codetypedata.getCodeTypeId()},new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class));
			br.setResponseListObject(codevalueList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
			
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}
	

	@SuppressWarnings("finally")
	@Override
	public Response saveReorderedCodeValues(CodeTypeData codetypedata) 
	{
		try
		{
			BaseResponse<Integer> br = new BaseResponse<>();
			Integer result = null;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(FiinfraConstants.SP_UPDATE_DISPLAY_SEQ_NO, new Object[] {codetypedata.getCodeValueIDs()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response saveDefaultValueforCodeValues(CodeValueData codevaluedata) 
	{
		
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer rowcnt;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			rowcnt=jdbcTemplate.queryForObject(FiinfraConstants.SP_SET_DEFAULT_CODEVALUE,new Object[]{codevaluedata.getCodeTypeId(),codevaluedata.getCodeValueId()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(rowcnt);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
		
	}
	
	
	//CODEVALUE
	@SuppressWarnings("finally")
	@Override
	public Response getAllCodeValueDetails(CodeValueData codevaluedata) 
	{
		try
		{
			List<CodeValueData> codevaluelist;
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			codevaluelist = jdbcTemplate.query(FiinfraConstants.SP_GET_ALL_CODEVALUES_DETAILS,new Object[]{codevaluedata.getCodeTypeId(),codevaluedata.getSearchText()},new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class));
			br.setResponseListObject(codevaluelist);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response deleteCodeValues(CodeTypeData codetypedata) 
	{
		try
		{
			BaseResponse<Integer> br = new BaseResponse<>();
			Integer result = null;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(FiinfraConstants.SP_DELETE_SELECTED_CODE_VALUES, new Object[] {codetypedata.getDeleteList()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response getCodeTypeListforCombobox() 
	{
		BaseResponse<CodeTypeData> br = new BaseResponse<CodeTypeData>();
		try
		{
		List<CodeTypeData> codetypeList;
		//jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		codetypeList=jdbcTemplate.query(FiinfraConstants.SP_GET_ALL_CODETYPES,new Object[]{} ,new BeanPropertyRowMapper<CodeTypeData>(CodeTypeData.class));
		br.setResponseListObject(codetypeList);
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
	
	@SuppressWarnings({"finally"})
	@Override
	public Response getParentCodeValues(CodeValueData codevaluedata) 
	{
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		try
		{
			List<CodeValueData> parentCodeValueList;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			parentCodeValueList = jdbcTemplate.query(FiinfraConstants.SP_GET_PARENT_CODE_VALUES,new Object[]{codevaluedata.getCodeTypeId()},new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class));
			br.setResponseListObject(parentCodeValueList);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
		
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response getMaxCodeValueId(CodeValueData codevaluedata) 
	{
		try
		{
			Integer maxCodeValueId = null;
			BaseResponse<Integer> br = new BaseResponse<>();
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			maxCodeValueId = jdbcTemplate.queryForObject(FiinfraConstants.SP_GET_MAX_CODE_VALUEID, new Object[] {codevaluedata.getCodeTypeId()},(Integer.class));
			br.setResponseObject(maxCodeValueId);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}
	
	

	
	@SuppressWarnings("finally")
	@Override
	public Response getMaxDisplaySeqNo(CodeValueData codevaluedata) 
	{
		try
		{
			Integer displaySeqNo = null;
			BaseResponse<Integer> br = new BaseResponse<>();
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			displaySeqNo = jdbcTemplate.queryForObject(FiinfraConstants.SP_GET_MAX_DISPLAY_SEQ_NO, new Object[] {codevaluedata.getCodeTypeId()},(Integer.class));
			br.setResponseObject(displaySeqNo);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response addNewCodeValue(CodeValueData codevaluedata) 
	{
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer result;																						
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			result=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_NEW_CODE_VALUE,new Object[]{codevaluedata.getCodeValueId(),codevaluedata.getCodeTypeId(),codevaluedata.getCodeValue(),codevaluedata.getCodeValueDescription(),codevaluedata.getDisplaySeqNo(),codevaluedata.getParentCodeValueId(),codevaluedata.getMappedValue1(),codevaluedata.getMappedValue2(),codevaluedata.getMappedValue3(),codevaluedata.getIsDefault(),codevaluedata.getIsDisplay(),codevaluedata.getIsActive()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}
	@SuppressWarnings("finally")
	@Override
	public Response getCodeValueDetalisToUpdate(CodeValueData codevaluedata) 
	{
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		try
		{
			List<CodeValueData> CodeValueDetalisToUpdate;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			CodeValueDetalisToUpdate = jdbcTemplate.query(FiinfraConstants.SP_GET_CODEVALUE_DETAILS_TO_UPDATE,new Object[]{codevaluedata.getCodeValueId()},new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class));
			br.setResponseListObject(CodeValueDetalisToUpdate);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response updateCodeValue(CodeValueData codevaluedata) 
	{
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer codeValue;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));         
			codeValue=jdbcTemplate.queryForObject(FiinfraConstants.SP_UPDATE_CODE_VALUE,new Object[]{codevaluedata.getCodeValueId(),codevaluedata.getCodeValue(),codevaluedata.getCodeValueDescription(),codevaluedata.getDisplaySeqNo(),codevaluedata.getMappedValue1(),codevaluedata.getMappedValue2(),codevaluedata.getMappedValue3(),codevaluedata.getIsDefault(),codevaluedata.getIsDisplay(),codevaluedata.getIsActive()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(codeValue);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}
	

	
}
		


