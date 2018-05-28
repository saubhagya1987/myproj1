package in.fiinfra.serviceportal.dao;
import in.fiinfra.common.dao.CommonDaoImpl;
import  in.fiinfra.common.service.vo.FaqList;
import  in.fiinfra.common.service.vo.CodeValueData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import java.util.List;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.ws.rs.core.Response;

@Repository("addfaqDao")
public class AddFaqDaoImpl implements AddFaqDao {
	private static final Logger logger = Logger.getLogger(CommonDaoImpl.class);
	@Autowired
	DataSourceProvider dataSourceProvider;
	Response response=null;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
/*	@Autowired
	DataSource dataSource;
*/
	
	@SuppressWarnings("unchecked")
	@Override
	public Response allSearchFaq(FaqList list)
	{
		BaseResponse<FaqList> br = new BaseResponse<FaqList>();
		try
		{
		List<FaqList> faqlist;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		faqlist = jdbcTemplate.query(FiinfraConstants.SP_USP_GET_FAQ,new Object[] {list.getSearchText()},new BeanPropertyRowMapper(FaqList.class));
		br.setResponseListObject(faqlist);
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
	public Response getbupartyNames(FaqList list) 
	{
		       BaseResponse<FaqList> br = new BaseResponse<FaqList>();
			try
			{
			List<FaqList> bupartyName;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			bupartyName=jdbcTemplate.query(FiinfraConstants.SP_USP_GET_FAQBUPARTY,new Object[]{FiinfraConstants.BU_RECORD_TYPE_ID,list.getPartyID(),list.getCreatedBy()} ,new BeanPropertyRowMapper<FaqList>(FaqList.class));
			br.setResponseListObject(bupartyName);
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

	
	@SuppressWarnings("unchecked")
	@Override
	public Response addFaqQuery(FaqList faqList) {

	
		 BaseResponse<Integer> br = new BaseResponse();
			try
			{
				Integer bupartyName;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			bupartyName=jdbcTemplate.queryForObject(FiinfraConstants.SP_USP_FAQ_ADD,new Object[] {Integer.parseInt(faqList.getFaqModuleID()), faqList.getFaqQuestionText(), faqList.getFaqAnswerText(), faqList.getCreatedBy(),faqList.getBuId(),faqList.getSourceID() },Integer.class);
			br.setResponseObject(bupartyName);
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
	public Response updateFaqs(FaqList faqList) {

		
		BaseResponse<Integer> br = new BaseResponse();
		try
		{
			Integer bupartyName;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		bupartyName=jdbcTemplate.queryForObject(FiinfraConstants.SP_USP_UPDATE_FAQ,new Object[]{Integer.parseInt(faqList.getFaqId()), Integer.parseInt(faqList.getFaqModuleID()), faqList.getFaqQuestionText(), faqList.getFaqAnswerText(), faqList.getCreatedBy(), faqList.getBuId(),faqList.getSourceID()} ,Integer.class);
		br.setResponseObject(bupartyName);
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
	public Response deleteFaqs(FaqList faqlist) 
	{
		  BaseResponse<FaqList> br = new BaseResponse<FaqList>();
			try
			{
			List<FaqList> count;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			count=jdbcTemplate.query(FiinfraConstants.SP_USP_DELETE_FAQ,new Object[]{faqlist.getDeleteList(),faqlist.getCreatedBy()} , new BeanPropertyRowMapper<FaqList>(FaqList.class));
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


	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}

	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}

	@Override
	public Response getFaqDetail(int deletelist) 
	{
		 BaseResponse<FaqList> br = new BaseResponse<FaqList>();
			try
			{
			FaqList bupartyName;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			bupartyName=jdbcTemplate.queryForObject(FiinfraConstants.SP_GET_FAQDEATIL,new Object[]{deletelist} ,new BeanPropertyRowMapper<FaqList>(FaqList.class));
			br.setResponseObject(bupartyName);
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
	public Response getPickListValue(String list) 
		{

		   BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
					try
					{
					List<CodeValueData> bupartyName;
					jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
					bupartyName=jdbcTemplate.query(FiinfraConstants.SP_GET_PICKLIST,new Object[]{list,27827} ,new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class));
					br.setResponseListObject(bupartyName);
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
	public Response allSearchFaqAdmin(FaqList list)
	{
		BaseResponse<FaqList> br = new BaseResponse<FaqList>();
		try
		{
		List<FaqList> faqlist1;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		faqlist1 = jdbcTemplate.query(FiinfraConstants.SP_USP_GET_FAQ_ADMIN,new Object[] {list.getSearchText()},new BeanPropertyRowMapper(FaqList.class));
		br.setResponseListObject(faqlist1);
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
