package in.fiinfra.serviceportal.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import in.fiinfra.common.service.vo.MemberAllocation;
import in.fiinfra.common.service.vo.TeamMember;
import in.fiinfra.common.service.vo.TeamMemberAllocation;
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

@Repository("teamMemberDao")
public class TeamMemberDaoImpl implements TeamMemberDao {

	@Autowired
	DataSourceProvider dataSourceProvider;

	@Autowired
	JdbcTemplate jdbcTemplate;

	Response response = null;
	
	private static final Logger logger = Logger.getLogger(TeamMemberDaoImpl.class);

	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}

	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}

	@SuppressWarnings("finally")
	@Override
	public Response getAllTeamMember(TeamMember teamMember) {
		BaseResponse<TeamMember> br = new BaseResponse<TeamMember>();
		try {
			List<TeamMember> teamMemberList = jdbcTemplate.query(
					FiinfraConstants.SP_GET_TEAMMEMBERLIST,
					new Object[] { teamMember.getSearchTextVal(),
							teamMember.getBuId() },
					new BeanPropertyRowMapper<TeamMember>(TeamMember.class));
			br.setResponseListObject(teamMemberList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getUniqueMemberName(TeamMember teamMember) {

		try {
			Integer status;
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			status = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_GET_UNIQUETEAMMEMBER,
					new Object[] { teamMember.getUserName() }, Integer.class);
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
	public Response addTeamMember(TeamMember teamMember) {
		BaseResponse<Integer> br = new BaseResponse<Integer>();

		try {
			Integer result;
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_ADDTEAMMEMBER,
					new Object[] { teamMember.getFirstName(),
							teamMember.getMiddleName(),
							teamMember.getLastName(), 
							teamMember.getUserName(),
							teamMember.getContactemail(),
							teamMember.getContactMobile(),
							teamMember.getPasswordId(), teamMember.getRoleID(),
							teamMember.getCreatedBy(), teamMember.getBuId(),teamMember.getDepartmentID()
							},
					Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response updateTeamMember(TeamMember teamMember) {
		BaseResponse<Integer> br = new BaseResponse<Integer>();

		try {
			Integer result;
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_UPDATETEAMMEMBER,
					new Object[] { teamMember.getPartyID(),
							teamMember.getContactemail(),
							teamMember.getContactMobile(),
							teamMember.getCreatedBy(), 
							teamMember.getBuId() },
					Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response deleteTeamMember(TeamMember teamMember) {
		BaseResponse<Integer> br = new BaseResponse<Integer>();

		try {
			
			
			Integer count= null;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			count = jdbcTemplate.queryForObject(FiinfraConstants.SP_DELETETEAMMEMBER,new Object[] { teamMember.getDeleteList(),teamMember.getCreatedBy() },(Integer.class));
			
			//bupartyName=jdbcTemplate.queryForObject(FiinfraConstants.SP_USP_FAQ_ADD,new Object[] {Integer.parseInt(faqList.getFaqModuleID()), faqList.getFaqQuestionText(), faqList.getFaqAnswerText(), faqList.getCreatedBy(),faqList.getBuId(),faqList.getSourceID() },Integer.class);
			br.setResponseObject(count);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getAllocationList(int partyID) {
		BaseResponse<TeamMemberAllocation> br = new BaseResponse<TeamMemberAllocation>();
		try {
			List<TeamMemberAllocation> teamMemberList = jdbcTemplate.query(
					FiinfraConstants.SP_GET_ALLOCATION_LIST_FORDEPARTMENT,
					new Object[] { partyID },
					new BeanPropertyRowMapper<TeamMemberAllocation>(
							TeamMemberAllocation.class));
			br.setResponseListObject(teamMemberList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getDepartmentName(int buid) {
		BaseResponse<MemberAllocation> br = new BaseResponse<MemberAllocation>();
		try {
			List<MemberAllocation> departmentname = jdbcTemplate.query(
					FiinfraConstants.SP_GET_DEPARTMENTTYPE_BU,
					new Object[] { buid },
					new BeanPropertyRowMapper<MemberAllocation>(
							MemberAllocation.class));
			br.setResponseListObject(departmentname);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getUnqAllocation(int partyID, int buid, int departmentId) {

		try {
			Integer status;
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			status = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_GET_UNIQUEALLOCATION, new Object[] {
							partyID, buid, departmentId }, Integer.class);
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
	public Response addNewAllocation(TeamMemberAllocation teamMemberAllocation) {

		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = null;
		Date endDate = null;
		BaseResponse<Integer> br = new BaseResponse<Integer>();

		if (teamMemberAllocation.getStartDate() != null
				&& !teamMemberAllocation.getStartDate().equals("")) {
			String stDate = teamMemberAllocation.getStartDate();
			try {
				startDate = (Date) formatter.parse(stDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());
			}

		}

		if (teamMemberAllocation.getEndDate() != null
				&& !teamMemberAllocation.getEndDate().equals("")) {
			String edDate = teamMemberAllocation.getEndDate();
			try {
				endDate = (Date) formatter.parse(edDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());
			}
		}
		try {
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_ADDTEAMMEMBERALLOCATION, new Object[] {
							teamMemberAllocation.getPartyID(),
							teamMemberAllocation.getBuId(),
							teamMemberAllocation.getDepartmentId(), startDate,
							endDate, teamMemberAllocation.getStatus() },
					Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response updateAllocation(TeamMemberAllocation teamMemberAllocation) {
		BaseResponse<Integer> br = new BaseResponse<Integer>();

		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = null;
		Date endDate = null;

		if (teamMemberAllocation.getStartDate() != null
				&& !teamMemberAllocation.getStartDate().equals("")) {
			String stDate = teamMemberAllocation.getStartDate();
			try {
				startDate = (Date) formatter.parse(stDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());
			}

		}

		if (teamMemberAllocation.getEndDate() != null
				&& !teamMemberAllocation.getEndDate().equals("")) {
			String edDate = teamMemberAllocation.getEndDate();
			try {
				endDate = (Date) formatter.parse(edDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());
			}
		}

		try {
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_UPDATEALLOCATIONLIST, new Object[] {
							teamMemberAllocation.getTeammemberId(),
							teamMemberAllocation.getBuId(),
							teamMemberAllocation.getDepartmentId(), startDate,
							endDate, teamMemberAllocation.getStatus() },
					Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response deleteAllocation(TeamMemberAllocation teamMemberAllocation) {
		BaseResponse<TeamMemberAllocation> br = new BaseResponse<TeamMemberAllocation>();

		try {
			List<TeamMemberAllocation> count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count = jdbcTemplate.query(FiinfraConstants.SP_DELETEALLOCATION,
					new Object[] { teamMemberAllocation.getDeleteList(),teamMemberAllocation.getLastmodifyBy() },
					new BeanPropertyRowMapper<TeamMemberAllocation>(TeamMemberAllocation.class));
					br.setResponseListObject(count);
					response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getAvailableBizUnitDeptList() {
		BaseResponse<MemberAllocation> br = new BaseResponse<MemberAllocation>();
		try {
			List<MemberAllocation> teamMemberList = jdbcTemplate.query(
					FiinfraConstants.SP_GET_AVAILABLE_BIZ_UNIT_DEPARTMENT_LIST,
					new Object[] {},
					new BeanPropertyRowMapper<MemberAllocation>(
							MemberAllocation.class));
			br.setResponseListObject(teamMemberList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response addBulkAllocation(TeamMember teamMemberAllocation) {
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = null;
		Date endDate = null;
		BaseResponse<Integer> br = new BaseResponse<Integer>();

		if (teamMemberAllocation.getStartDate() != null
				&& !teamMemberAllocation.getStartDate().equals("")) {
			String stDate = teamMemberAllocation.getStartDate();
			try {
				startDate = (Date) formatter.parse(stDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());
			}

		}

		if (teamMemberAllocation.getExpiryDate() != null
				&& !teamMemberAllocation.getExpiryDate().equals("")) {
			String edDate = teamMemberAllocation.getExpiryDate();
			try {
				endDate = (Date) formatter.parse(edDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());
			}
		}
		try {
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_ADD_BULK_ALLOCATION,
					new Object[] { teamMemberAllocation.getPartyIdList(),
							teamMemberAllocation.getDepartmentIdList(),
							startDate, endDate, 1, 1,
							teamMemberAllocation.getAlloBU() }, Integer.class);

			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}

	}
}
