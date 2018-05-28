package in.fiinfra.serviceportal.dao;



import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import java.util.List;

import javax.sql.DataSource;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository("bizunitDao")
public class BizUnitDaoImpl implements BizUnitDao
{
	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
   Response response;

	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}


	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}


	@Override
	public Response getBizUnitList(BizUnit bizunit) 
	{
	
		BaseResponse<BizUnit> br = new BaseResponse<BizUnit>();
		try
		{
		List<BizUnit> bizUnit;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		bizUnit = jdbcTemplate.query(FiinfraConstants.SP_GET_BIZUNIT_LIST,new Object[] {bizunit.getSearchText()},new BeanPropertyRowMapper(BizUnit.class));
		br.setResponseListObject(bizUnit);
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
	public Response addBizUnit(BizUnit bizUnit) {


			 BaseResponse<Integer> br = new BaseResponse();
				try
				{
					Integer count;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				count=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_BIZ_UNIT,new Object[] { bizUnit.getLastName(),bizUnit.getShortName() ,bizUnit.getCompanyName(), bizUnit.getStreet(), bizUnit.getStreet2(),bizUnit.getStreet3(), bizUnit.getCountryId(), bizUnit.getStateId(), bizUnit.getCityId(), Integer.parseInt(bizUnit.getZipCode()),bizUnit.getCreatedBy(),bizUnit.getTwitter()},Integer.class);
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
	public Response getUniqueUser(String bizUnitName) {


			 BaseResponse<Integer> br = new BaseResponse();
				try
				{
					Integer count;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				count=jdbcTemplate.queryForObject(FiinfraConstants.SP_GETUNIQUE_BU,new Object[] { bizUnitName},Integer.class);
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
	public Response updateBizUnit(BizUnit bizUnit)
	{

		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForObject(FiinfraConstants.SP_UPDATE_BIZ_UNIT,new Object[] {bizUnit.getPartyId(), bizUnit.getLastName(), bizUnit.getShortName(), bizUnit.getCompanyName(), bizUnit.getStreet(), bizUnit.getStreet2(), bizUnit.getStreet3(), bizUnit.getCountryId(),bizUnit.getStateId(), bizUnit.getCityId(),Integer.parseInt(bizUnit.getZipCode()) , bizUnit.getCreatedBy(),bizUnit.getTwitter()},Integer.class);
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
	public Response getBizUnitDeatil(int partyId) {

		BaseResponse<BizUnit> br = new BaseResponse<BizUnit>();
		try
		{
		BizUnit bizUnit;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		bizUnit =jdbcTemplate.queryForObject(FiinfraConstants.SP_GET_BIZ_UNIT_DETAIL,new Object[] {partyId},new BeanPropertyRowMapper<BizUnit>(BizUnit.class));
		br.setResponseObject(bizUnit);
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
	public Response deleteBizUnit(String partyId,int lastModifiedBy) {

		BaseResponse<BizUnit> br = new BaseResponse<BizUnit>();
		try
		{
		List<BizUnit> bizUnit;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		bizUnit =jdbcTemplate.query(FiinfraConstants.SP_DELETE_BIZ_UNIT,new Object[] {partyId,lastModifiedBy},new BeanPropertyRowMapper(BizUnit.class));
		br.setResponseListObject(bizUnit);
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
	public Response getStateList(int countryId)
	 {

		BaseResponse<BizUnit> br = new BaseResponse<BizUnit>();
		try
		{
		List<BizUnit> bizUnit;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		bizUnit =jdbcTemplate.query(FiinfraConstants.SP_GET_CODEVALUE_FOR_PARENTID,new Object[] {countryId},new BeanPropertyRowMapper(BizUnit.class));
		br.setResponseListObject(bizUnit);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
				}
		
		
		}
	
	@Override
	public Response addEmailBizUnit(int partyId, String emailId, String emailName,int createdBy) {


		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_EMAIL_BIZ_UNIT,new Object[] {partyId,emailId,emailName,createdBy},Integer.class);
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
	public Response addDndTemplate(int partyId, String dndTemplate,int createdBy) {

		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_DISCLIAMER_BIZ_UNIT,new Object[] {partyId,dndTemplate,createdBy,FiinfraConstants.ATTRIBUTE_CODE_VALUE_DND_TEMPLATE,FiinfraConstants.DATA_TYPE_ID,FiinfraConstants.DISPLAY_SEQ},Integer.class);
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
	public Response addDisclaimer(int partyId, String disclaimer,int createdBy) {

		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_DISCLIAMER_BIZ_UNIT,new Object[] {partyId,disclaimer,createdBy,FiinfraConstants.ATTRIBUTE_CODE_VALUE_DISCLIAMER,FiinfraConstants.DATA_TYPE_ID,FiinfraConstants.DISPLAY_SEQ},Integer.class);
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
	public Response addEmailSignBiz(int partyId, String emailSign,int createdBy) {

		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer count;
				//System.out.println("baji"+emailSign);
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_DISCLIAMER_BIZ_UNIT,new Object[] {partyId,emailSign,createdBy,FiinfraConstants.ATTRIBUTE_CODE_VALUE_EMAILSIGN_ID,FiinfraConstants.DATA_TYPE_ID,FiinfraConstants.DISPLAY_SEQ},Integer.class);
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
	public Response getWhiteLableDetail(int partyId) 
	{
		BaseResponse<BizUnit> br = new BaseResponse<BizUnit>();
		try
		{
		BizUnit bizUnit;
		//System.out.println("PArtyID::::::::::::::::::"+partyId);
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		bizUnit =jdbcTemplate.queryForObject(FiinfraConstants.SP_GET_WHITE_LABEL,new Object[] {partyId},new BeanPropertyRowMapper<BizUnit>(BizUnit.class));
		br.setResponseObject(bizUnit);
	
		
		
		
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
	public Response copyBu(BizUnit bizunit) {
		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForObject(FiinfraConstants.SP_COPY_BU,new Object[] {bizunit.getPartyId(),bizunit.getCreatedBy()},Integer.class);
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
	public Response addSms(BizUnit bizunit) {
	
		
		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_SMS_FOR_BU,new Object[] {bizunit.getPartyId(),bizunit.getSmsSign(),FiinfraConstants.SMS_SIGN,bizunit.getTheme(),FiinfraConstants.THEMEID,bizunit.getCreatedBy(),FiinfraConstants.ATTRIBUTE_SEQ},Integer.class);
		/*	
			@partyId int,
			@smsSign nvarchar(255),
			@smsId int,
			@theme int,
			@themeid int,
			@createdBy int,
			@attributeseqid int*/
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
	public Response updateBizUnitGeneral(BizUnit bizUnit) {
		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.queryForObject(FiinfraConstants.SP_UPDATE_BIZ_UNIT_GENERAL,new Object[] {bizUnit.getPartyId(), bizUnit.getLastName(), bizUnit.getShortName(), bizUnit.getCompanyName(), bizUnit.getStreet(), bizUnit.getStreet2(), bizUnit.getStreet3(), bizUnit.getCountryId(),bizUnit.getStateId(), bizUnit.getCityId(),Integer.parseInt(bizUnit.getZipCode()) , bizUnit.getCreatedBy(),bizUnit.getEmailId(),bizUnit.getContact(),bizUnit.getTwitter()},Integer.class);
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


