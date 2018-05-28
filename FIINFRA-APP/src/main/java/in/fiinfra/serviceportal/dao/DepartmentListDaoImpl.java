package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.dao.CommonDaoImpl;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;
import in.fiinfra.common.util.FiinfraConstants;

import java.util.List; 

import javax.ws.rs.core.Response;

import  in.fiinfra.common.service.vo.DepartmentListData;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class DepartmentListDaoImpl implements DepartmentListDao {
	  
	private static final Logger logger = Logger.getLogger(DepartmentListDaoImpl.class);
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
	
	@SuppressWarnings({ "unchecked", "finally" }) 
	@Override
	public Response getAllDepartmentList(int sessionbuId) {
		// TODO Auto-generated method stub
		 
		BaseResponse<DepartmentListData> br = new BaseResponse<DepartmentListData>();
		try
		{
		List<DepartmentListData> DepartmentList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		DepartmentList = jdbcTemplate.query(FiinfraConstants.SP_GET_DEPARTMENT_LIST,new Object[] {sessionbuId},new BeanPropertyRowMapper(DepartmentListData.class));
		br.setResponseListObject(DepartmentList); 
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
	public Response deleteDepartment(String deletelist,int userID) {
		// TODO Auto-generated method stub
		BaseResponse<DepartmentListData> br= new BaseResponse<DepartmentListData>();
		try
		{
		List<DepartmentListData> count;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		count=jdbcTemplate.query(FiinfraConstants.SP_DELETE_DEPARTMENT,new Object[]{deletelist,userID} , new BeanPropertyRowMapper<DepartmentListData>(DepartmentListData.class));
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
	public Response showBizUnitList() {
		// TODO Auto-generated method stub
		 BaseResponse<DepartmentListData> br = new BaseResponse<DepartmentListData>();
			try
			{
			List<DepartmentListData> bizUnitList;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			bizUnitList=jdbcTemplate.query(FiinfraConstants.SP_GET_BIZ_UNIT_BY_PARTY_ID,new Object[]{FiinfraConstants.BU_RECORD_TYPE_ID,0,0} ,new BeanPropertyRowMapper<DepartmentListData>(DepartmentListData.class));
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
	public Response showDepartmentTypelist() {
		// TODO Auto-generated method stub
		BaseResponse<DepartmentListData> br = new BaseResponse<DepartmentListData>();
		try
		{
		List<DepartmentListData> departmentList;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		departmentList=jdbcTemplate.query(FiinfraConstants.SP_GET_DEPARTMENT_TYPE, new Object[]{FiinfraConstants.DEPARTMENT_CODE_TYPE_ID} ,new BeanPropertyRowMapper<DepartmentListData>(DepartmentListData.class));
		br.setResponseListObject(departmentList); 
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
	public Response showDepartmentName() {
		// TODO Auto-generated method stub
		BaseResponse<DepartmentListData> br = new BaseResponse<DepartmentListData>();
		try
		{
		List<DepartmentListData> departmentNames;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		departmentNames=jdbcTemplate.query(FiinfraConstants.SP_GET_DEPARTMENT_NAME, new Object[]{} ,new BeanPropertyRowMapper<DepartmentListData>(DepartmentListData.class));
		br.setResponseListObject(departmentNames); 
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

	@SuppressWarnings({ "unchecked", "finally" })
	@Override
	public Response addDepartmentQuery(String bizUnit_Name,
			String department_Name, int departmenttypeid, int allocationtypeid,
			String departmentShort_Name, int id) {
		// TODO Auto-generated method stub
		 BaseResponse<Integer> br = new BaseResponse();
			try
			{    
				Integer resultAdd;
				
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			resultAdd=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_NEW_DEPARTMENT, new Object[]{  bizUnit_Name,  department_Name, departmenttypeid, FiinfraConstants.ALLOCATION_TYPE_ID, departmentShort_Name,id},Integer.class);
			br.setResponseObject(resultAdd); 
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
	public Response updateDepartment(int departmentid, int bizUnit_Name,
			String department_Type, int departmenttypeid, int allocationtypeid,
			String departmentShort_Name, int id) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse();
		try 
		{
			Integer resultUpdate;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		resultUpdate =jdbcTemplate.queryForObject(FiinfraConstants.SP_EDIT_DEPARTMENT, new Object[]{ departmentid,  bizUnit_Name, department_Type, departmenttypeid, allocationtypeid, departmentShort_Name,id} ,Integer.class);
		br.setResponseObject(resultUpdate); 
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
	public Response getUserId(String name) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse();
		try
		{
			Integer userId;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		userId =jdbcTemplate.queryForObject(FiinfraConstants.SP_GET_USERID,new Object[]{name} ,Integer.class);
		br.setResponseObject(userId); 
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
	public Response getDepartmentTypeId(String departmentType) {
		// TODO Auto-generated method stub  
		BaseResponse<Integer> br = new BaseResponse();
		try
		{
			Integer departmentTypeId;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		departmentTypeId =jdbcTemplate.queryForObject(FiinfraConstants.SP_GET_DEPARTMENTTYPEID, new Object[]{departmentType} ,Integer.class);
		br.setResponseObject(departmentTypeId); 
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
	public Response cascadeDeleteDep(String deletelist) {
		// TODO Auto-generated method stub
		BaseResponse<DepartmentListData> br= new BaseResponse<DepartmentListData>();
		try
		{
		List<DepartmentListData> count;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		count=jdbcTemplate.query(FiinfraConstants.SP_CASCADE_DELETE,new Object[]{deletelist} , new BeanPropertyRowMapper<DepartmentListData>(DepartmentListData.class));
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
	   
	  
	
}
