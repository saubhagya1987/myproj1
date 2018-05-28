package in.fiinfra.serviceportal.dao;


import in.fiinfra.common.service.vo.User;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl implements UserDao 
{
	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
    Response response;

	public DataSourceProvider getDataSourceProvider()
	{
		return dataSourceProvider;
	}


	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) 
	{
		this.dataSourceProvider = dataSourceProvider;
	}


	@SuppressWarnings({"finally"})
	@Override
	public Response getTopLoginList(int buId,int userId)
	{
		BaseResponse<User> br = new BaseResponse<User>();
		try
		{
			List<User> user;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			user = jdbcTemplate.query(FiinfraConstants.SP_USER_CURRENT_LOGIN,new Object[] {buId,userId},new BeanPropertyRowMapper<User>(User.class));
			br.setResponseListObject(user);
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

	@SuppressWarnings({ "finally" })
	@Override
	public Response getAllUser(User userData) 
	{
		BaseResponse<User> br = new BaseResponse<User>();
		try
		{
			List<User> user;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			user=jdbcTemplate.query(FiinfraConstants.SP_GET_USER_LIST_BU,new Object[]{userData.getSearchText()} , new BeanPropertyRowMapper<User>(User.class));
			br.setResponseListObject(user);
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

	@SuppressWarnings({ "finally" })
	@Override
	public Response getPartyName() 
	{
		BaseResponse<User> br = new BaseResponse<User>();
		try
		{
			List<User> partyList;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			partyList=jdbcTemplate.query(FiinfraConstants.SP_GET_PARTYTYPE,new Object[]{} ,new BeanPropertyRowMapper<User>(User.class));
			br.setResponseListObject(partyList);
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
	
	
	@SuppressWarnings({ "finally" })
	@Override
	public Response getRoleName() 
	{
		BaseResponse<User> br = new BaseResponse<User>();
		try
		{
			List<User> roleName;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			roleName=jdbcTemplate.query(FiinfraConstants.SP_GET_ROLE,new Object[]{} ,new BeanPropertyRowMapper<User>(User.class));
			br.setResponseListObject(roleName);
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

	
	@SuppressWarnings({ "finally" })
	@Override
	public Response getUserDetail(User userData) 
	{
		BaseResponse<User> br = new BaseResponse<User>();
		try
		{
			List<User> user;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			user = jdbcTemplate.query(FiinfraConstants.SP_GET_USER_DETAIL,new Object[] {userData.getUserID()},new BeanPropertyRowMapper<User>(User.class));
			br.setResponseListObject(user);
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
	
	
	@SuppressWarnings({ "finally"})
	@Override
	public Response getUnqUserName(User userData) 
	{
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		try
		{
			Integer status;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			status = jdbcTemplate.queryForObject(FiinfraConstants.SP_GET_UNIQUSERNAME,new Object[]{userData.getUserName()},(Integer.class));
			br.setResponseObject(status);
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
	public Response updateUser(User userData) 
	{
		
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = null;
		Date endDate = null;
		
		if (userData.getAccessStartDate() != null && !userData.getAccessStartDate().equals("")) 
		{
			String stDate = userData.getAccessStartDate();
			try {
				startDate = (Date) formatter.parse(stDate);
			} 
			catch (ParseException e)
			{
				//e.printStackTrace();
			}
			
		}

		if (userData.getAccessEndDate() != null && !userData.getAccessEndDate().equals("")) 
		{
			String edDate = userData.getAccessEndDate();
			try {
				endDate = (Date) formatter.parse(edDate);
			} 
			catch (ParseException e)
			{
				//e.printStackTrace();
			}
		}
	
		
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer updateUser;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			updateUser=jdbcTemplate.queryForObject(FiinfraConstants.SP_UPDATE_USER,new Object[]{userData.getUserID(), userData.getRecordTypeId(),userData.getFirstName(), userData.getLastName(), userData.getEmailID(), userData.getSecurityQueID(), userData.getSecurityAns(), startDate, endDate, userData.getRoleID(), userData.getisLocked(), userData.getisForceChange(), userData.getLoginAttempts(),userData.getModifiedBy()},Integer.class);
			br.setResponseObject(updateUser);
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
	public Response addNewUser(User userData) 
	{
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = null;
		Date endDate = null;
		
		if (userData.getAccessStartDate() != null && !userData.getAccessStartDate().equals("")) 
		{
			String stDate = userData.getAccessStartDate();
			try 
			{
				startDate = (Date) formatter.parse(stDate);
			} 
			catch (ParseException e) 
			{
				//e.printStackTrace();
			}
		}

		if (userData.getAccessEndDate() != null && !userData.getAccessEndDate().equals("")) 
		{
			String edDate = userData.getAccessEndDate();
			try 
			{
				endDate = (Date) formatter.parse(edDate);
			} 
			catch (ParseException e) 
			{
				//e.printStackTrace();
			}
		}

		
		try
		{
			List<User> partyId;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		
			
			
			BaseResponse<User> br = new BaseResponse<>();
			partyId=jdbcTemplate.query(FiinfraConstants.SP_ADD_USER,new Object[]{userData.getRecordTypeId(), userData.getUserName(), userData.getFirstName(),
					userData.getLastName(), userData.getBuPartyId(), userData.getEmailID(), userData.getUserPassword(), userData.getSecurityQueID(), userData.getSecurityAns(),
					startDate, endDate, userData.getRoleID(), userData.getModifiedBy(),userData.getCurrentNode(),userData.getHeadNode()},new BeanPropertyRowMapper<User>(User.class));
			br.setResponseListObject(partyId);
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
	public Response deleteUser(User userData) 
	{	
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		try
		{
			Integer deleteList;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));	
			deleteList=jdbcTemplate.queryForObject(FiinfraConstants.SP_DELETE_USER,new Object[]{userData.getDeleteList(),userData.getModifiedBy()},(Integer.class));
			br.setResponseObject(deleteList);
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
	public Response resetPassword(User userData) 
	{
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		try
		{
			Integer count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_PASSWORD_DETAIL,new Object[] {userData.getUserID(), userData.getUserPassword()},(Integer.class));
			br.setResponseObject(count);
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
	public Response showAuditHistory(User userData) 
	{
		BaseResponse<User> br = new BaseResponse<User>();
		try
		{
			List<User> user;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			user=jdbcTemplate.query(FiinfraConstants.SP_GET_AUDITUSER_LIST,new Object[]{userData.getUserID(),userData.getSearchText()} ,new BeanPropertyRowMapper<User>(User.class));
			br.setResponseListObject(user);
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
	public Response updateUserProfileHeirarchy(User userData) {

		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = null;
		Date endDate = null;
		
		if (userData.getAccessStartDate() != null && !userData.getAccessStartDate().equals("")) 
		{
			String stDate = userData.getAccessStartDate();
			try 
			{
				startDate = (Date) formatter.parse(stDate);
			} 
			catch (ParseException e) 
			{
				//e.printStackTrace();
			}
		}

		if (userData.getAccessEndDate() != null && !userData.getAccessEndDate().equals("")) 
		{
			String edDate = userData.getAccessEndDate();
			try 
			{
				endDate = (Date) formatter.parse(edDate);
			} 
			catch (ParseException e) 
			{
				//e.printStackTrace();
			}
		}
		
		try
		{
			List<User> partyId;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		
			BaseResponse<User> br = new BaseResponse<>();
			partyId=jdbcTemplate.query(FiinfraConstants.SP_UPDATE_USER_PROFILE,new Object[]{userData.getPartyId(),userData.getRecordTypeId(), userData.getFirstName(), userData.getLastName(),  userData.getRoleID(), userData.getCurrentNode(),userData.getHeadNode(),userData.getAccessStartDate(), userData.getAccessEndDate(), userData.getModifiedBy(),userData.getEmailID()},new BeanPropertyRowMapper<User>(User.class));
			br.setResponseListObject(partyId);
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
