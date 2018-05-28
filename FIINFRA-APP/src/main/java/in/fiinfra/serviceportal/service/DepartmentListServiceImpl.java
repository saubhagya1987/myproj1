package in.fiinfra.serviceportal.service;

import in.fiinfra.serviceportal.dao.*;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
 
public class DepartmentListServiceImpl implements DepartmentListService {
	
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	
	@Autowired 
	private DepartmentListDao departmentListDao;      
	
	public DepartmentListDao getDepartmentListDao() {
		return departmentListDao;
	}

	public void setDepartmentListDao(DepartmentListDao departmentListDao) {
		this.departmentListDao = departmentListDao;
	}
 
	@Override
	public Response getAllDepartmentList(int sessionbuId)   
	{
		Response DepartmentListData=departmentListDao.getAllDepartmentList(sessionbuId);
	   return DepartmentListData; 
	}
 
	@Override
	public Response deleteDepartment(String deletelist,int userID) {
		// TODO Auto-generated method stub
		
		Response deleteDepartment=departmentListDao.deleteDepartment(deletelist,userID);
		return deleteDepartment;
	}

	
	@Override
	public Response cascadeDeleteDep(String deletelist) {
		// TODO Auto-generated method stub
		
		Response cascadeDelete=departmentListDao.cascadeDeleteDep(deletelist); 
		return cascadeDelete;    
	}

	
	@Override
	public Response showBizUnitList() {
		// TODO Auto-generated method stub
		Response bupartyName = departmentListDao.showBizUnitList();
		return bupartyName;
	}

	@Override
	public Response showDepartmentTypelist() {
		// TODO Auto-generated method stub
		Response departmentList = departmentListDao.showDepartmentTypelist();
		return departmentList;
	}

	@Override
	public Response showDepartmentName() {
		// TODO Auto-generated method stub
		Response departmentNames = departmentListDao.showDepartmentName();
		return departmentNames; 
	}

	@Override
	public Response addDepartmentQuery(String bizUnit_Name,
			String department_Name, int departmenttypeid, int allocationtypeid,
			String departmentShort_Name, int id) {
		// TODO Auto-generated method stub
		Response result = null;
		result = departmentListDao.addDepartmentQuery(bizUnit_Name, department_Name, departmenttypeid, allocationtypeid, departmentShort_Name, id);
		return result;
	}

	@Override
	public Response updateDepartment(int departmentid, int bizUnit_Name,
			String department_Type, int departmenttypeid, int allocationtypeid,
			String departmentShort_Name, int id) {
		// TODO Auto-generated method stub
		Response result = null;
		result = departmentListDao.updateDepartment(departmentid, bizUnit_Name, department_Type, departmenttypeid, allocationtypeid, departmentShort_Name, id);
		return result;
	}

	@Override
	public Response getUserId(String name) {
		// TODO Auto-generated method stub;
		Response userId =departmentListDao.getUserId(name);
		return userId;
	}

	@Override
	public Response getDepartmentTypeId(String departmentType) {
		// TODO Auto-generated method stub
		Response departmentTypeId=departmentListDao.getDepartmentTypeId(departmentType);
		return departmentTypeId; 
	} 

	
	
	
}
