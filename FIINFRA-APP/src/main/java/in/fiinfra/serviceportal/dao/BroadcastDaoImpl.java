package in.fiinfra.serviceportal.dao;

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

import in.fiinfra.common.service.vo.Broadcast;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

@Repository("broadcastDao")
public class BroadcastDaoImpl implements BroadcastDao {

	@Autowired
	DataSourceProvider dataSourceProvider;

	@Autowired
	JdbcTemplate jdbcTemplate;

	Response response = null;
	
	private static final Logger logger = Logger.getLogger(BroadcastDaoImpl.class);

	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}

	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}

	@SuppressWarnings({ "unchecked", "finally" })
	@Override
	public Response showBroadcastList(Broadcast broadcast) {

		BaseResponse<Broadcast> br = new BaseResponse<Broadcast>();
		try {
			List<Broadcast> broadcastList = jdbcTemplate.query(
					FiinfraConstants.SP_GET_BROADCAST_LIST,
					new Object[] { broadcast.getSearchText() },
					new BeanPropertyRowMapper(Broadcast.class));
			br.setResponseListObject(broadcastList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getUserTypeList(Broadcast broadcast) {
		BaseResponse<Broadcast> br = new BaseResponse<Broadcast>();
		try {
			List<Broadcast> uTypeList;
			uTypeList = jdbcTemplate.query(
					FiinfraConstants.SP_GET_BROADCAST_USERTYPE_LIST,
					new Object[] {}, new BeanPropertyRowMapper<Broadcast>(
							Broadcast.class));
			br.setResponseListObject(uTypeList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getAllRoleList(Broadcast broadcast) {
		BaseResponse<Broadcast> br = new BaseResponse<Broadcast>();
		try {
			List<Broadcast> roleList;
			roleList = jdbcTemplate.query(FiinfraConstants.SP_GET_ROLE,
					new Object[] {}, new BeanPropertyRowMapper<Broadcast>(
							Broadcast.class));
			br.setResponseListObject(roleList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response deleteBroadCastList(Broadcast broadcast) {

		BaseResponse<Broadcast> br = new BaseResponse<Broadcast>();
		try {
			List<Broadcast> count;
			count = jdbcTemplate.query(
					FiinfraConstants.SP_USP_DELETE_BROADCAST_LIST,
					new Object[] { broadcast.getDeleteList(),broadcast.getCreatedBy() },
					new BeanPropertyRowMapper<Broadcast>(Broadcast.class));
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
	public Response insertOrUpdateBroadcast(Broadcast broadcast) {
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = null;
		Date endDate = null;

		if (broadcast.getStartDate() != null
				&& !broadcast.getStartDate().equals("")) {
			String stDate = broadcast.getStartDate();
			try {
				startDate = (Date) formatter.parse(stDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());;
			}
		}

		if (broadcast.getExpiryDate() != null
				&& !broadcast.getExpiryDate().equals("")) {
			String edDate = broadcast.getExpiryDate();
			try {
				endDate = (Date) formatter.parse(edDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());;
			}
		}

		try {
			Integer result;
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_INSERT_OR_UPDATE_BROADCAST,
					new Object[] { broadcast.getId(), startDate, endDate,
							broadcast.getBroadCastTitle(),
							broadcast.getBroadCastTextId(),
							broadcast.getBroadCastSectionId(),
							broadcast.getBuPartyId(),
							broadcast.getPartyRecordTypeId(),
							broadcast.getRoleID(), broadcast.getCityId(),
							broadcast.isLoginPopUpDisplay(),
							broadcast.getCreatedBy(),
							broadcast.getLastModifiedBy(),
							broadcast.getDescription(), broadcast.getSourceIdList()}, Integer.class);

			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}

	}

}

