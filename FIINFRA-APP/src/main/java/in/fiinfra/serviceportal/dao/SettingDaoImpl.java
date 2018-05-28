package in.fiinfra.serviceportal.dao;



import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.Setting;
import in.fiinfra.util.DataSourceProvider;

import java.util.List;

import javax.sql.DataSource;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
@Repository("settingDao")
public class SettingDaoImpl implements SettingDao 
{
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	@Autowired
	DataSourceProvider dataSourceProvider;
	
	 Response response;

	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}



	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}



	@Override
	public Response getSettingList(int partyId)
	{
	
		BaseResponse<Setting> br = new BaseResponse<Setting>();
		try
		{
		List<Setting> listSetting;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		listSetting =jdbcTemplate.query(FiinfraConstants.SP_GET_SETTING_LIST,new Object[] {partyId},new BeanPropertyRowMapper<Setting>(Setting.class));
		br.setResponseListObject(listSetting);
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
	public Response addSetting(Setting setting)
	{
		
		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer count;
			
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForInt(FiinfraConstants.SP_ADD_BIZUNIT_SETTING,new Object[] {FiinfraConstants.BU_RECORD_TYPE_ID,setting.getPartyId(), setting.getSettingType(),setting.getAttributeCodeId(), setting.getAttributeValue(), setting.getDefaultValue(), setting.getDataTypeId(), setting.getStartRange(), setting.getEndRange(),setting.getCreatedby()});
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


	@Override
	public Response deleteSetting(String List,int lastModifiedBy) {
		  BaseResponse<Setting> br = new BaseResponse<Setting>();
			try
			{
			List<Setting> count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.query(FiinfraConstants.SP_DELETE_BIZUNIT_SETTING,new Object[]{List,lastModifiedBy} , new BeanPropertyRowMapper<Setting>(Setting.class));
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



	@Override
	public Response getSettingDetail(int party, int partySettingId) {
		
		BaseResponse<Setting> br = new BaseResponse<Setting>();
		try
		{
		Setting listSetting;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		listSetting =jdbcTemplate.queryForObject(FiinfraConstants.SP_GET_BIZUNIT_SETTING_DETAIL,new Object[] {party,partySettingId},new BeanPropertyRowMapper<Setting>(Setting.class));
		br.setResponseObject(listSetting);
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
	public Response updateSetting(Setting setting) {

		 BaseResponse<Integer> br = new BaseResponse<Integer>();
			try
			{
				Integer count=0;
			
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			
			count=jdbcTemplate.queryForInt(FiinfraConstants.SP_UPDATE_BIZUNIT_SETTING,new Object[] {setting.getPartySettingId(),setting.getPartyId(), setting.getSettingType(),setting.getAttributeCodeId(), setting.getAttributeValue(), setting.getDefaultValue(), setting.getDataTypeId(), setting.getStartRange(), setting.getEndRange(),setting.getCreatedby()});
			br.setResponseObject(count);
			Gson gson = new Gson();
			//System.out.println(gson.toJson(br));
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
	public Response getUniqueSetting(Setting setting) {

		 BaseResponse<Integer> br = new BaseResponse<Integer>();
			try
			{
				Integer count=0;
			
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			
			count=jdbcTemplate.queryForInt(FiinfraConstants.SP_GET_CHECK_BIZUNIT_SETTING_COUNT,new Object[] {setting.getPartyId(),setting.getAttributeCodeId()});
			br.setResponseObject(count);
			Gson gson = new Gson();
		//	System.out.println(gson.toJson(br));
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
