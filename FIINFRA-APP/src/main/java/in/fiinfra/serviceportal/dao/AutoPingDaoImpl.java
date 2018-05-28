package in.fiinfra.serviceportal.dao;

import java.util.List;

import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.service.vo.AutoPing;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class AutoPingDaoImpl implements AutoPingDao{

	@Autowired
	DataSourceProvider dataSourceProvider;

	@Autowired
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	Response response;
	
	@Override
	public Response getAutoPingList() {
		// TODO Auto-generated method stub
		BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
		try{
			List<AutoPing> autoping;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			autoping= jdbcTemplate.query(FiinfraConstants.SP_AUTOPING_LIST,new Object[]{},new BeanPropertyRowMapper(AutoPing.class));
			br.setResponseListObject(autoping);
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
	public Response getSelectEventList(int selectSource) {
		// TODO Auto-generated method stub
		BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
		try{
			List<AutoPing> autoping;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			autoping= jdbcTemplate.query(FiinfraConstants.SP_SELECT_EVENT_LIST,new Object[]{selectSource},new BeanPropertyRowMapper(AutoPing.class));
			br.setResponseListObject(autoping);
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
	public Response addAutoPing(AutoPing autoping) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer ap;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			ap=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_AUTOPING,new Object[]{autoping.getPartyId(),autoping.getNotifyTypeId(),autoping.getPingName(),autoping.getPingDescription(),
			autoping.getEventId(),autoping.getNotifyTargetId(),autoping.getDeliveryChannelId(),autoping.getUseSignature(),autoping.getTemplateXML(),autoping.getCreatedby(),autoping.getLastModifiedBy()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(ap);
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


	@Override
	public Response schAutoPing(AutoPing autoPing) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer ap;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			//ap=jdbcTemplate.queryForObject(FiinfraConstants.SP_SCH_AUTOPING,new Object[]{autoPing.getPingId(),autoPing.getFrequencyValue(),autoPing.getCreatedby(),autoPing.getLastModifiedBy(),autoPing.getNextFiretime(),autoPing.getFrequencyId()},new BeanPropertyRowMapper<Integer>(Integer.class));
		//	ap=jdbcTemplate.queryForObject(FiinfraConstants.SP_SCH_AUTOPING,new Object[]{autoPing.getPingId(),autoPing.getScheduleDatetime(),autoPing.getFrequencyId(),autoPing.getCreatedby(),autoPing.getIsRecuring()},new BeanPropertyRowMapper<Integer>(Integer.class));
			ap=jdbcTemplate.queryForObject(FiinfraConstants.SP_SCH_AUTOPING,new Object[]{autoPing.getTemplateId(),autoPing.getScheduleDttm(),autoPing.getFrequencyId(),autoPing.getCreatedby(),autoPing.getIsRecuring(),autoPing.getFrequencyValue()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(ap);
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


	@Override
	public Response getEventAutoPingList() {
		// TODO Auto-generated method stub
		BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
		try{
			List<AutoPing> autoping;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			autoping= jdbcTemplate.query(FiinfraConstants.SP_AUTOPING_EVENT_LIST,new Object[]{},new BeanPropertyRowMapper(AutoPing.class));
			br.setResponseListObject(autoping);
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
	public Response getSchAutoPingList() {
		// TODO Auto-generated method stub
		BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
		try{
			List<AutoPing> autoping;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			autoping= jdbcTemplate.query(FiinfraConstants.SP_AUTOPING_SCH_LIST,new Object[]{},new BeanPropertyRowMapper(AutoPing.class));
			br.setResponseListObject(autoping);
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
	public Response addAutoPingEvent(AutoPing autoPing) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer ap_event;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			ap_event=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_AUTOPING_EVENT,new Object[]{autoPing.getEventId(),autoPing.getEvent(),autoPing.getEventDescription(),autoPing.getSource(),autoPing.getCreatedby(),autoPing.getLastModifiedBy()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(ap_event);
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


	@Override
	public Response getEventAutoPingEditList(int eventId) {
		// TODO Auto-generated method stub
		BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
		try{
			List<AutoPing> autoping;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			autoping= jdbcTemplate.query(FiinfraConstants.SP_EVENT_LIST,new Object[]{eventId},new BeanPropertyRowMapper(AutoPing.class));
			br.setResponseListObject(autoping);
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
	public Response getEventAutoPingListForPartner(int partyId) {
		BaseResponse<AutoPing> br = new BaseResponse<AutoPing>();
		try{
			List<AutoPing> autoping;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			autoping= jdbcTemplate.query("{CALL usp_pp_getAutopingEventList(?)}",new Object[]{partyId},new BeanPropertyRowMapper(AutoPing.class));
			br.setResponseListObject(autoping);
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
	public Integer updateEventStatusAutoPingForPartner(int partyId,
			int eventId, String flag,int lastUpdatedBy) {
		int ap=0;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		ap=jdbcTemplate.queryForInt("{CALL usp_pp_updateAutoPingStatus(?,?,?,?)}",new Object[]{partyId,eventId,flag,lastUpdatedBy});
		return ap;
	}


	@Override
	public Response getStandardAutoPingList(
			NotifyTemplateData notifyTemplateData) {
		// TODO Auto-generated method stub
		try {
			List<NotifyTemplateData> quartzJobList;
			BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();

			quartzJobList = jdbcTemplate.query(
					FiinfraConstants.SP_AUTOPING_LIST, new Object[] {},
					new BeanPropertyRowMapper<NotifyTemplateData>(NotifyTemplateData.class));
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
	public Response getAddAutoPingTemp(NotifyTemplateData notifyTemplateData) {
		// TODO Auto-generated method stub
		try {
			List<NotifyTemplateData> quartzJobList;
			BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();

			quartzJobList = jdbcTemplate.query(
					FiinfraConstants.SP_ADD_AUTOPING, new Object[] {notifyTemplateData.getNotifyTemplateID(),notifyTemplateData.getPartyID(),notifyTemplateData.getNotifyTypeID(),notifyTemplateData.getName(),notifyTemplateData.getDescription(),notifyTemplateData.getNotifyEventID(),notifyTemplateData.getNotifyTargetID(),notifyTemplateData.getDeliveryChannelID(),notifyTemplateData.getUseSignatureID(),notifyTemplateData.getNotifyTemplateXML(),notifyTemplateData.getCreatedBy(),notifyTemplateData.getLastModifiedBy()},
					new BeanPropertyRowMapper<NotifyTemplateData>(NotifyTemplateData.class));
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
	public Response getAutoPingEditList(int notifyTemplateId, int buId) {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplateData> br = new BaseResponse<NotifyTemplateData>();
		try{
			List<NotifyTemplateData> notifyTemplateData;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			notifyTemplateData= jdbcTemplate.query(FiinfraConstants.SP_AUTOPING_EDIT_LIST,new Object[]{notifyTemplateId,buId},new BeanPropertyRowMapper(NotifyTemplateData.class));
			br.setResponseListObject(notifyTemplateData);
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
