package in.fiinfra.serviceportal.dao;

import java.util.List; 
 
import javax.ws.rs.core.Response; 

public interface DepartmentListDao {

	Response getAllDepartmentList(int sessionbuId);
	
	Response deleteDepartment(String deletelist,int userID);
	
	Response showBizUnitList();	
	
	Response showDepartmentTypelist();
	
	Response showDepartmentName();
	 
	Response addDepartmentQuery(String bizUnit_Name, String department_Name,int departmenttypeid,int allocationtypeid,String departmentShort_Name,int id);
	
	Response updateDepartment(int departmentid, int bizUnit_Name,String department_Type,int departmenttypeid,int allocationtypeid,String departmentShort_Name, int id);
	
	Response getUserId(String name); 
	
	Response  getDepartmentTypeId(String departmentType);   
	
	Response cascadeDeleteDep(String deletelist);//To delete department table  
	
	
	}
