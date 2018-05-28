package in.fiinfra.serviceportal.dao;

import java.util.List;

import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.service.vo.QuerySp;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

			 
@Repository("queryspDao")
public class QueryspDaoImpl implements QueryspDao
{
	
	
	
	
	private static final Logger logger = Logger.getLogger(QueryspDaoImpl.class);
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



	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}



	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}



	@Override
	public Response getQueryList(QuerySp query) {
		BaseResponse<QuerySp> br = new BaseResponse<QuerySp>();
		try
		{
			
		
			
		List<QuerySp> queryList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		queryList = jdbcTemplate.query(FiinfraConstants.SP_USP_GET_QUERY,new Object[] {query.getPartyId(),query.getNodeId(),query.getBuId()},new BeanPropertyRowMapper(QuerySp.class));
		br.setResponseListObject(queryList);
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
	public Response getClientList(QuerySp query) {
	    BaseResponse<QuerySp> br = new BaseResponse<QuerySp>();
				try
				{
				List<QuerySp> bupartyName;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				

				
				bupartyName=jdbcTemplate.query(FiinfraConstants.SP_USP_GET_CLIENT_LIST,new Object[]{query.getPartyId(),query.getNodeId(),query.getBuId()} ,new BeanPropertyRowMapper<QuerySp>(QuerySp.class));
				br.setResponseListObject(bupartyName);
				//System.out.println(bupartyName+"bupartyname");
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
	public Response addQuery(QuerySp query) {
		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForObject(FiinfraConstants.SP_USP_ADD_QUERY,new Object[] { },Integer.class);
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
