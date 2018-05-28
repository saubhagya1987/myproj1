package in.fiinfra.serviceportal.dao;

import java.util.List;

import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.service.vo.EmailSmsVo;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.LoggedUser;
import in.fiinfra.common.service.vo.PrePrintedForm;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.util.DataSourceProvider;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("loggedUserDao")
public class LoggedUserDaoImpl implements LoggedUserDao {
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
	public Response getloggedUser(LoggedUser loggedUser) {

		
//		System.out.println(searchtext+"String");
		BaseResponse<LoggedUser> br = new BaseResponse<LoggedUser>();
		try {
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			@SuppressWarnings({ "unchecked", "rawtypes" })
			List<LoggedUser> loggeduser = jdbcTemplate.query( FiinfraConstants.SP_GET_LOGGED_USERS,new Object[] {loggedUser.getSearchtext(),loggedUser.getStatusViewId(),loggedUser.getBuId()}, new BeanPropertyRowMapper(LoggedUser.class));
			//System.out.println("loggeduser  "+ loggeduser);
			br.setResponseListObject(loggeduser);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		//	logger.info(response);
		} finally {
			return response;
		}

	}



	@Override
	public Response getchartUser(String buId) {
		BaseResponse<LoggedUser> br = new BaseResponse<LoggedUser>();
		try {
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			@SuppressWarnings({ "unchecked", "rawtypes" })
			List<LoggedUser> loggedUser = jdbcTemplate.query( FiinfraConstants.SP_GET_LOGGED_CHART_USERS,new Object[] {buId}, new BeanPropertyRowMapper(LoggedUser.class));
			br.setResponseListObject(loggedUser);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		//	logger.info(response);
		} finally {
			return response;
		}

	}



	@Override
	public Response getEmailSms(EmailSmsVo emailSmsVo) {
		 
	BaseResponse<EmailSmsVo> br = new BaseResponse<EmailSmsVo>();
		try {
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			@SuppressWarnings({ "unchecked", "rawtypes" })
			List<EmailSmsVo> emailSms = jdbcTemplate.query( FiinfraConstants.SP_GET_EMAIL_SMS_LIST,new Object[] {emailSmsVo.getSearchtext(),emailSmsVo.getBuId()}, new BeanPropertyRowMapper(EmailSmsVo.class));
			//System.out.println("loggeduser  "+ emailSms);
			br.setResponseListObject(emailSms);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		//	logger.info(response);
		} finally {
			return response;
		}
	
	}



	@Override
	public Response getEmailSmsChart(String buId) {
		BaseResponse<EmailSmsVo> br = new BaseResponse<EmailSmsVo>();
		try {
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			@SuppressWarnings({ "unchecked", "rawtypes" })
			List<EmailSmsVo> emailSms = jdbcTemplate.query( FiinfraConstants.SP_GET_EMAIL_CHART,new Object[] {buId}, new BeanPropertyRowMapper(EmailSmsVo.class));
			br.setResponseListObject(emailSms);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		//	logger.info(response);
		} finally {
			return response;
		}

	}



	@Override
	public Response getPrePrintedFormList(PrePrintedForm preForm) {

		
		
		BaseResponse<PrePrintedForm> br = new BaseResponse<PrePrintedForm>();
		try
		{
		List<PrePrintedForm> prePrintedForm;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		prePrintedForm = jdbcTemplate.query(FiinfraConstants.SP_USP_GET_PREPRINTED_FORM,new Object[] {preForm.getUserId(),preForm.getBuPartyId()},new BeanPropertyRowMapper(PrePrintedForm.class));
		br.setResponseListObject(prePrintedForm);
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
	public Response getPrePrintedFormChart(PrePrintedForm preForm) {
		
		BaseResponse<PrePrintedForm> br = new BaseResponse<PrePrintedForm>();
		try
		{
		List<PrePrintedForm> prePrintedForm;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		prePrintedForm = jdbcTemplate.query(FiinfraConstants.SP_USP_GET_PREPRINTED_FORM_CHART,new Object[] {preForm.getUserId(),preForm.getBuPartyId()},new BeanPropertyRowMapper(PrePrintedForm.class));
		
		br.setResponseListObject(prePrintedForm);
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
	public Response deleteTask(String deletelist,Integer lastModifiedBy) {
	 
		BaseResponse<Task> br = new BaseResponse<Task>();
			try
			{
			List<Task> count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.query(FiinfraConstants.SP_DELETE_TASK_SP,new Object[]{deletelist,lastModifiedBy} , new BeanPropertyRowMapper<Task>(Task.class));
			br.setResponseListObject(count);
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
