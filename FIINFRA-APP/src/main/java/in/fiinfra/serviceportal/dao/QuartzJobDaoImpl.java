package in.fiinfra.serviceportal.dao;

import java.util.List;

import in.fiinfra.common.service.vo.QuartzJob;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;
import javax.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class QuartzJobDaoImpl implements QuartzJobDao {
	@Autowired
	DataSourceProvider dataSourceProvider;

	@Autowired
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	Response response;

	@Override
	public Response getquratzJobList(QuartzJob quartzJob) {
		// TODO Auto-generated method stub
		try {
			List<QuartzJob> quartzJobList;
			BaseResponse<QuartzJob> br = new BaseResponse<QuartzJob>();

			quartzJobList = jdbcTemplate.query(
					FiinfraConstants.SP_GET_QUARTZ_LIST, new Object[] {},
					new BeanPropertyRowMapper<QuartzJob>(QuartzJob.class));
			br.setResponseListObject(quartzJobList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@Override
	public Response getquratzJobUpdate(QuartzJob quartzJob) {
		// TODO Auto-generated method stub
		try {
			List<QuartzJob> quartzJobList;
			BaseResponse<QuartzJob> br = new BaseResponse<QuartzJob>();

			quartzJobList = jdbcTemplate.query(
					FiinfraConstants.SP_GET_QUARTZ_LIST, new Object[] {quartzJob.getTriggerName(),quartzJob.getTriggerState()},
					new BeanPropertyRowMapper<QuartzJob>(QuartzJob.class));
			br.setResponseListObject(quartzJobList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

}
