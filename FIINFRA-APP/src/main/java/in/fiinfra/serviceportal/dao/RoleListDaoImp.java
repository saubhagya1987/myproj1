package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;
import in.fiinfra.common.service.vo.Role;
import in.fiinfra.common.service.vo.RoleAccess;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("roleListDao")
public class RoleListDaoImp implements RoleListDao {
	@Autowired
	DataSourceProvider dataSourceProvider;

	@Autowired
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	Response response;
	
	private static final Logger logger = Logger.getLogger(RoleListDaoImp.class);

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}

	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}

	@SuppressWarnings("finally")
	@Override
	public Response getRoleList(Role role) {
		try {
			List<Role> roleDatalist;
			BaseResponse<Role> br = new BaseResponse<Role>();
			/*jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));*/
			roleDatalist = jdbcTemplate.query(
					FiinfraConstants.SP_GET_ROLE_LIST, new Object[] {role.getSearchText()},
					new BeanPropertyRowMapper<Role>(Role.class));
			br.setResponseListObject(roleDatalist);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}

	}

	@SuppressWarnings("finally")
	@Override
	public Response uiqueRoleName(Role role) {
		try {
			Integer status;
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			status = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_GET_UNIQUE_ROLE,
					new Object[] { role.getRoleName() }, Integer.class);
			br.setResponseObject(status);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response deleteRole(Role role) {
		try {
			List<Role> deleteRole;
			BaseResponse<Role> br = new BaseResponse<Role>();
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			deleteRole = jdbcTemplate.query(FiinfraConstants.SP_DELETE_ROLE,
					new Object[] { role.getDeleteList(),role.getCreateOrModifiedBy() },
					new BeanPropertyRowMapper<Role>(Role.class));
			br.setResponseListObject(deleteRole);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response addNewRole(Role roleData) {
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = null;
		Date endDate = null;

		if (roleData.getStartDate() != null
				&& !roleData.getStartDate().equals("")) {
			String stDate = roleData.getStartDate();
			try {
				startDate = (Date) formatter.parse(stDate);
			} catch (ParseException e) {
				
				logger.debug(""+e.getStackTrace());
			}

		}

		if (roleData.getExpiryDate() != null
				&& !roleData.getExpiryDate().equals("")) {
			String edDate = roleData.getExpiryDate();
			try {
				endDate = (Date) formatter.parse(edDate);
			} catch (ParseException e) {
				
				logger.debug(""+e.getStackTrace());
			}
		}
		BaseResponse<Integer> br = new BaseResponse<>();
		try 
		{
			Integer addrole;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			addrole = jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_NEW_ROLE,new Object[] { roleData.getRoleName(),roleData.getRoleDescription(),roleData.getisActive(), startDate, endDate,roleData.getCreateOrModifiedBy() },
			new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(addrole);
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
	public Response roleUpdate(Role roleData) {

		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = null;
		Date endDate = null;

		if (roleData.getStartDate() != null
				&& !roleData.getStartDate().equals("")) {
			String stDate = roleData.getStartDate();
			try {
				startDate = (Date) formatter.parse(stDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());
			}

		}

		if (roleData.getExpiryDate() != null
				&& !roleData.getExpiryDate().equals("")) {
			String edDate = roleData.getExpiryDate();
			try {
				endDate = (Date) formatter.parse(edDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());
			}
		}

		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer updaterole;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));// roleId,
																	// roleName,
																	// roleDescription,
																	// isActive,
																	// startDate,
																	// expiryDate
			updaterole = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_EDIT_ROLE,
					new Object[] { roleData.getRoleId(),
							roleData.getRoleName(),
							roleData.getRoleDescription(),
							roleData.getisActive(), startDate, endDate, roleData.getCreateOrModifiedBy()},
					Integer.class);
			br.setResponseObject(updaterole);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}

	}

	@SuppressWarnings("finally")
	@Override
	public Response getAllRoleAccessList(RoleAccess roleAccess) {
		try {
			List<RoleAccess> roleAccessDatalist;
			BaseResponse<RoleAccess> br = new BaseResponse<RoleAccess>();
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			roleAccessDatalist = jdbcTemplate.query(
					FiinfraConstants.SP_GET_ALL_ROLE_ACCESS_LIST, new Object[] {
							roleAccess.getRoleId(), roleAccess.getSourceSystemId(),roleAccess.getSearchText() }, new BeanPropertyRowMapper<RoleAccess>(
							RoleAccess.class));
			br.setResponseListObject(roleAccessDatalist);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getSourceSystemList() {
		try {
			List<RoleAccess> sourceList;
			BaseResponse<RoleAccess> br = new BaseResponse<RoleAccess>();
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			sourceList = jdbcTemplate.query(
					FiinfraConstants.SP_GET_SOURCE_SYSTEM_LIST,
					new Object[] {}, new BeanPropertyRowMapper<RoleAccess>(
							RoleAccess.class));
			br.setResponseListObject(sourceList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response updateRoleAccessList(String objectIdList,int roleId,int createdby, int sourceId) {
		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer updtRoleAccList;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			updtRoleAccList = jdbcTemplate.queryForObject(FiinfraConstants.SP_UPDATE_ROLE_ACCESS_LIST,new Object[] {objectIdList,roleId,createdby,sourceId},Integer.class);
			br.setResponseObject(updtRoleAccList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

}
