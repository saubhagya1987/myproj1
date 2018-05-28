package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.dao.CommonDaoImpl;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.util.DataSourceProvider;
import in.fiinfra.common.service.vo.NotifyTemplate; 

import java.util.List;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
 
public class NotifyTemplateDaoImpl implements NotifyTemplateDao {
	
	private static final Logger logger = Logger.getLogger(NotifyTemplateDaoImpl.class);
	@Autowired 
	DataSourceProvider dataSourceProvider;
	Response response=null; 
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	
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
	
	
	@SuppressWarnings({ "finally", "unchecked" })
	@Override 
	public Response getNotifyTemplateList(NotifyTemplate notifyTemplate) { 
		// TODO Auto-generated method stub      
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		try 
		{
		List<NotifyTemplate> templateList; 
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		templateList = jdbcTemplate.query(FiinfraConstants.SP_GET_NOTIFYTEMPLATE_LIST,new Object[] {notifyTemplate.getSearchText(),notifyTemplate.getBizunit()},new BeanPropertyRowMapper(NotifyTemplate.class));
		br.setResponseListObject(templateList);  
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
	public Response deleteNotifyTemplate(String deletelist,int userID) {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplate> br= new BaseResponse<NotifyTemplate>();
		try
		{  
		List<NotifyTemplate> count;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		count=jdbcTemplate.query(FiinfraConstants.SP_DELETE_NOTIFYTEMPLATE,new Object[]{deletelist,userID} , new BeanPropertyRowMapper<NotifyTemplate>(NotifyTemplate.class));
		br.setResponseListObject(count);   
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} 
		catch (DataAccessException e) { 
			response =FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}  
		finally 
		{
			return response; 
				}
	} 
	
	@SuppressWarnings("finally")
	@Override
	public Response showbizUnit() {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		try
		{
		List<NotifyTemplate> bizUnitList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		bizUnitList=jdbcTemplate.query(FiinfraConstants.SP_GET_TEMP_BIZ_UNIT,new Object[]{FiinfraConstants.BU_RECORD_TYPE_ID,0,0} ,new BeanPropertyRowMapper<NotifyTemplate>(NotifyTemplate.class));
		br.setResponseListObject(bizUnitList);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{  
			return response;
				} 
	}  
	
	@SuppressWarnings("finally")
	@Override
	public Response showSystem() {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		try
		{
		List<NotifyTemplate> systemList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		systemList=jdbcTemplate.query(FiinfraConstants.SP_GET_SYSTEM_RECEPIENT_CHANNEL,new Object[]{FiinfraConstants.NOTIFYTYPE_ID} ,new BeanPropertyRowMapper<NotifyTemplate>(NotifyTemplate.class));
		br.setResponseListObject(systemList);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{ 
			return response;
				} 
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response showEvent() {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		try
		{
		List<NotifyTemplate> eventList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		eventList=jdbcTemplate.query(FiinfraConstants.SP_GET_EVENT,new Object[]{} ,new BeanPropertyRowMapper<NotifyTemplate>(NotifyTemplate.class));
		br.setResponseListObject(eventList);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} 
		catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{ 
			return response;
				} 
	} 
	
	@SuppressWarnings("finally")
	@Override
	public Response showRecepient() {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		try
		{
		List<NotifyTemplate> recepientList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		recepientList=jdbcTemplate.query(FiinfraConstants.SP_GET_SYSTEM_RECEPIENT_CHANNEL,new Object[]{FiinfraConstants.NOTIFYTARGET_ID} ,new BeanPropertyRowMapper<NotifyTemplate>(NotifyTemplate.class));
		br.setResponseListObject(recepientList);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} 
		catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} 
		finally
		{ 
			return response;
				} 
	} 
	
	@SuppressWarnings("finally")
	@Override
	public Response showChannel() {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		try
		{
		List<NotifyTemplate> channelList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		channelList=jdbcTemplate.query(FiinfraConstants.SP_GET_SYSTEM_RECEPIENT_CHANNEL,new Object[]{FiinfraConstants.DELIVERYCHANNEL_ID} ,new BeanPropertyRowMapper<NotifyTemplate>(NotifyTemplate.class));
		br.setResponseListObject(channelList);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} 
		catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} 
		finally
		{
			return response;
				} 
	} 
	
	@SuppressWarnings("finally")
	@Override
	public Response showSignature() {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		try
		{
		List<NotifyTemplate> signList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		signList=jdbcTemplate.query(FiinfraConstants.SP_GET_SYSTEM_RECEPIENT_CHANNEL,new Object[]{FiinfraConstants.SIGNATURE_ID} ,new BeanPropertyRowMapper<NotifyTemplate>(NotifyTemplate.class));
		br.setResponseListObject(signList);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} 
		catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} 
		finally
		{
			return response;
				} 
	} 
	
	@SuppressWarnings("finally")
	@Override
	public Response showName() {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		try
		{
		List<NotifyTemplate> nameList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		nameList=jdbcTemplate.query(FiinfraConstants.SP_GET_NAME,new Object[]{} ,new BeanPropertyRowMapper<NotifyTemplate>(NotifyTemplate.class));
		br.setResponseListObject(nameList);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} 
		catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} 
		finally
		{  
			return response;
				} 
	}  
	 

	
	
	@SuppressWarnings("finally")
	@Override
	public Response showEmail() {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		try
		{
		List<NotifyTemplate> emailList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		emailList=jdbcTemplate.query(FiinfraConstants.SP_GET_EMAIL,new Object[]{} ,new BeanPropertyRowMapper<NotifyTemplate>(NotifyTemplate.class));
		br.setResponseListObject(emailList);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}  
		catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} 
		finally
		{
			return response;
				} 
	} 
	
	
	
	
	
	@SuppressWarnings("finally")
	@Override
	public Response getXmlValues(String id) {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		try 
		{
		List<NotifyTemplate> xmlValues;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		xmlValues=jdbcTemplate.query(FiinfraConstants.SP_GET_XMLVALUES,new Object[]{id} ,new BeanPropertyRowMapper<NotifyTemplate>(NotifyTemplate.class));
		br.setResponseListObject(xmlValues);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} 
		catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} 
		finally
		{
			return response;
				} 
	} 
	      

	  
	@Override  
	public int addNotifyTemplate(int partyid,int notifytypeid,String name,String desc,int notifyeventid,int notifytargetid,int deliverychannelid,int usesugnid,Boolean isactive,Boolean isdnd,Boolean isdesc ,String templateXML,
			String fileName,String fileStoragePathURI, int fileSizeKB,
			String fileName1,String fileStoragePathURI1, int fileSizeKB1,
			String fileName2,String fileStoragePathURI2, int fileSizeKB2 ,int userID) {  
		// TODO Auto-generated method stub 
		int result = 0;       
		result= jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_NOTIFY_TEMPLATE,
				new Object[]{partyid,notifytypeid,name,desc,notifyeventid,notifytargetid,deliverychannelid,usesugnid,isactive,isdnd,isdesc,templateXML,
				fileName,fileStoragePathURI, fileSizeKB,fileName1,fileStoragePathURI1, fileSizeKB1,fileName2,fileStoragePathURI2, fileSizeKB2,userID}, Integer.class);       
		return result;          
	}  
	 
	@Override
	public int editNotifyTemplate(int notifytemplateid, String name,
			String description,String templateXML, int editBizUnitID, int editSystemID, int editRecepientID, int editChannelID, int editEventID, int editSignatureID,Boolean isdnd,Boolean isdesc,int userID) { 
		// TODO Auto-generated method stub
		int result = 0;   
		result = jdbcTemplate.queryForObject(FiinfraConstants.SP_EDIT_NOTIFYTEMPLATE, new Object[]{notifytemplateid,name,description,templateXML,editBizUnitID,editSystemID,editRecepientID,editChannelID,editEventID,editSignatureID, isdnd, isdesc, userID},Integer.class);
		return result; 
	}

	@SuppressWarnings("finally")
	@Override
	public Response showEmailPhone(String toDoList) {
		// TODO Auto-generated method stub
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		try
		{     
		List<NotifyTemplate> emailList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		emailList=jdbcTemplate.query(FiinfraConstants.SP_GET_EMAILPHONE,new Object[]{toDoList} ,new BeanPropertyRowMapper<NotifyTemplate>(NotifyTemplate.class));
		br.setResponseListObject(emailList);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);  
		}  
		catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} 
		finally
		{
			return response;
				}  
	} 

	@Override
	public int importNotifyTemplate(int notifytemplateid, String templateXML) {
		// TODO Auto-generated method stub
		int result = 0;      
		result = jdbcTemplate.queryForObject(FiinfraConstants.SP_IMPORT_NOTIFYTEMPLATE, new Object[]{notifytemplateid,templateXML},Integer.class);
		return result;  
	}

 	
}
