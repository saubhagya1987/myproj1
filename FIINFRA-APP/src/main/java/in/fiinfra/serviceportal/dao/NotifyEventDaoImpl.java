package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.dao.CommonDaoImpl;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.service.vo.DepartmentListData;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.service.vo.NotifyEvent;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.util.DataSourceProvider;

import java.util.List;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class NotifyEventDaoImpl implements NotifyEventDao {
	
	private static final Logger logger = Logger.getLogger(NotifyEventDaoImpl.class);
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

	@SuppressWarnings({ "unchecked", "finally" })
	@Override 
	public Response getNitifyEventList(NotifyEvent notifyEvent) {
		// TODO Auto-generated method stub  
		 
		BaseResponse<NotifyEvent> br = new BaseResponse<NotifyEvent>();
		try
		{
		List<NotifyEvent> EventList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		EventList = jdbcTemplate.query(FiinfraConstants.SP_GET_NOTIFYEVENT_LIST,new Object[] {notifyEvent.getSearchText()},new BeanPropertyRowMapper(NotifyEvent.class));
		br.setResponseListObject(EventList); 
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
	public Response deleteNotifyEvent(String deletelist,int deleteuserId) {
		// TODO Auto-generated method stub
		BaseResponse<NotifyEvent> br= new BaseResponse<NotifyEvent>();
		try
		{
		List<NotifyEvent> count;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		count=jdbcTemplate.query(FiinfraConstants.SP_DELETE_NOTIFYEVENT,new Object[]{deletelist,deleteuserId} , new BeanPropertyRowMapper<NotifyEvent>(NotifyEvent.class));
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

	@SuppressWarnings("finally")
	@Override
	public Response showCategoryList() {
		// TODO Auto-generated method stub
		BaseResponse<NotifyEvent> br = new BaseResponse<NotifyEvent>();
		try
		{
		List<NotifyEvent> categoryList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		categoryList=jdbcTemplate.query(FiinfraConstants.SP_GET_CATEGORY,new Object[]{FiinfraConstants.EVENTCATEGORY_CODE_TYPE_ID} ,new BeanPropertyRowMapper<NotifyEvent>(NotifyEvent.class));
		br.setResponseListObject(categoryList); 
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{ 
			return response;
				} 
	}

	@SuppressWarnings("finally")
	@Override
	public Response showSystemList() {
		// TODO Auto-generated method stub
		BaseResponse<NotifyEvent> br = new BaseResponse<NotifyEvent>();
		try
		{
		List<NotifyEvent> systemList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		systemList=jdbcTemplate.query(FiinfraConstants.SP_GET_SYSTEM,new Object[]{FiinfraConstants.EVENTSYSTEM_CODE_TYPE_ID} ,new BeanPropertyRowMapper<NotifyEvent>(NotifyEvent.class));
		br.setResponseListObject(systemList); 
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) { 
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{ 
			return response; 
				} 
	}  

	@SuppressWarnings("finally")
	@Override
	public Response addNotifyEvent(String name, String description,
			int eventcategoryid, int sourcesystemid,int userId) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse();
		try
		{  
		Integer resultAdd; 
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		resultAdd=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_NOTIFYEVENT, new Object[]{  name,  description, eventcategoryid, sourcesystemid,userId},Integer.class);
		br.setResponseObject(resultAdd);  
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
	public Response editNotifyEvent(int notifyeventid, String name,
			String description, int eventcategoryid, int sourcesystemid,int userId) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse();
		try
		{
		
		Integer resultUpdate;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		resultUpdate =jdbcTemplate.queryForObject(FiinfraConstants.SP_EDIT_NOTIFYEVENT, new Object[]{ notifyeventid,  name, description, eventcategoryid, sourcesystemid,userId} ,Integer.class);
		br.setResponseObject(resultUpdate); 
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
