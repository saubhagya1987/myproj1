package in.fiinfra.birtIntegration.dao;


import in.fiinfra.birt.models.ClientList;
import in.fiinfra.birt.models.ClientListOnly;
import in.fiinfra.birt.models.IssuerId;
import in.fiinfra.birt.models.SectionTypeID;
import in.fiinfra.birt.models.PartnerList;
import in.fiinfra.birt.models.ServiceTeamMemberID;
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
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
@Repository
public class ReportDaoImpl implements ReportDao {
	@Autowired
	DataSourceProvider dataSourceProvider;
	
	@Autowired
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	
	Response response=null;	
	
	@SuppressWarnings("finally")
	@Override

	public Response getCompanyId(int buId,int partyId) 
	{
	
	       BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
				try
				{
				List<IssuerId> bupartyName;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				bupartyName=jdbcTemplate.query(FiinfraConstants.SP_GET_COMPANYID,new Object[]{partyId} ,new BeanPropertyRowMapper<IssuerId>(IssuerId.class));
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
	
	@SuppressWarnings("finally")
	@Override
	public Response getProductId(int buId,int compartyid,int partyId) 
	{
	
	       BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
				try
				{
				List<IssuerId> bupartyName;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				bupartyName=jdbcTemplate.query(FiinfraConstants.SP_GET_PRODUCTID,new Object[]{compartyid, partyId} ,new BeanPropertyRowMapper<IssuerId>(IssuerId.class));
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
	
	@SuppressWarnings("finally")
	@Override
	public Response getInvestorStartDate(int buId,int productId,int partyId) 
	{
	
	       BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
				try
				{
				List<IssuerId> bupartyName;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				bupartyName=jdbcTemplate.query(FiinfraConstants.SP_GET_INVESTORTXNSTARTDATE,new Object[]{productId, partyId} ,new BeanPropertyRowMapper<IssuerId>(IssuerId.class));
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
	
	@SuppressWarnings("finally")
	@Override
	public Response getCompanyID(int buId,int partyID) {

		BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
		try {
			
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			List <IssuerId>downloadList=jdbcTemplate.query(FiinfraConstants.SP_GET_COMPANYID, new Object[] {partyID},new BeanPropertyRowMapper<IssuerId>(IssuerId.class));
			br.setResponseListObject(downloadList);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) 
		{
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}finally
		{
			return response;
			
		}
		
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response getPartnerList(int buId,String searchString,int partyId) {
		BaseResponse<PartnerList> br = new BaseResponse<PartnerList>();
		try {
			
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			List <PartnerList> downloadList=jdbcTemplate.query(FiinfraConstants.SP_GET_PARTNERLIST, new Object[] {buId,searchString,partyId},new BeanPropertyRowMapper<PartnerList>(PartnerList.class));
			
			br.setResponseListObject(downloadList);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}finally{
			return response;
			
		}
		
	}
	
	
	@SuppressWarnings("finally")
	@Override
	public Response getClientList(String searchString,int partnerId) {
		BaseResponse<ClientList> br = new BaseResponse<ClientList>();
		try {
			
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			List <ClientList> downloadList22=jdbcTemplate.query(FiinfraConstants.SP_GET_CLIENTLIST, new Object[] {searchString,partnerId},new BeanPropertyRowMapper<ClientList>(ClientList.class));
			
			br.setResponseListObject(downloadList22);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}finally{
			return response;
			
		}
		
	}
	
	
	@SuppressWarnings("finally")
	@Override
	public Response getClientListOnly(String searchString,int partnerId,int nodeId) {
		BaseResponse<ClientListOnly> br = new BaseResponse<ClientListOnly>();
		try {
			
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			List <ClientListOnly> downloadList22=jdbcTemplate.query(FiinfraConstants.SP_GET_CLIENTLISTONLY, new Object[] {searchString,partnerId,nodeId},new BeanPropertyRowMapper<ClientListOnly>(ClientListOnly.class));
			
			br.setResponseListObject(downloadList22);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}finally{
			return response;
			
		}
		
	}
	
	
	
	@SuppressWarnings("finally")
	@Override
	public Response getSectionTypeID(int buId) {
		BaseResponse<SectionTypeID> br = new BaseResponse<SectionTypeID>();
		try {
			
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			List <SectionTypeID>downloadList=jdbcTemplate.query(FiinfraConstants.SP_GET_SECTIONTYPEID, new Object[] {},new BeanPropertyRowMapper<SectionTypeID>(SectionTypeID.class));
			br.setResponseListObject(downloadList);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}finally{
			return response;
			
		}
		
	}
	
	
	@SuppressWarnings("finally")
	@Override
	public Response getServiceTeamMember(int buId) {
		BaseResponse<ServiceTeamMemberID> br = new BaseResponse<ServiceTeamMemberID>();
		try {
			
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			List <ServiceTeamMemberID>downloadList=jdbcTemplate.query(FiinfraConstants.SP_GET_ServiceTeamMember, new Object[] {},new BeanPropertyRowMapper<ServiceTeamMemberID>(ServiceTeamMemberID.class));
			br.setResponseListObject(downloadList);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}finally{
			return response;
			
		}
		
	}
	

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

	
	
}
