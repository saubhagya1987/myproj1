package in.fiinfra.common.service.vo;

import java.util.Date;  

public class DepartmentListData {  
	 
	private String bizUnit;      
	private String department_Type; 
	private String department_Name;
	private String department_SortName; 
	 
	private String  lastname ;
  
	  
	//private int updatedBy;   
	private String updatedBy;
	private String updatedOn;     
	private int BuId; 
	private int Department_BuId;
	private int departmentId;
	private String departmentname;  
	    
	private String codetype;          
	private String codevalue;    
	private int codevalueId;       
	private int DepartmentTypeID;  
	private int userID; 
	
	int createby;        
	
 
	public int getCreateby() {
		return createby;
	}
	public void setCreateby(int createby) {
		this.createby = createby;
	}
	public int getDepartmentTypeID() {
		return DepartmentTypeID;  
	}
	public void setDepartmentTypeID(int departmentTypeID) {
		DepartmentTypeID = departmentTypeID;
	}
	public int getCodevalueId() {  
		return codevalueId;
	}
	public void setCodevalueId(int codevalueId) {
		this.codevalueId = codevalueId;    
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
	public String getCodetype() {  
		return codetype;
	}
	public void setCodetype(String codetype) {  
		this.codetype = codetype;
	}
	public String getCodevalue() {
		return codevalue;   
	}
	public void setCodevalue(String codevalue) {
		this.codevalue = codevalue;  
	}
	public String getLastname() {  
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getBizUnit() {
		return bizUnit;
	}
	public void setBizUnit(String bizUnit) {
		this.bizUnit = bizUnit;
	}
	public String getDepartment_Type() {
		return department_Type;
	}
	public void setDepartment_Type(String department_Type) {
		this.department_Type = department_Type;
	}
	public String getDepartment_Name() {
		return department_Name;
	}
	public void setDepartment_Name(String department_Name) {
		this.department_Name = department_Name;
	}
	public String getDepartment_SortName() {
		return department_SortName;
	}
	public void setDepartment_SortName(String department_SortName) {
		this.department_SortName = department_SortName;
	} 
	public String getUpdatedBy() {   
		return updatedBy;
	} 
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public String getUpdatedOn() {
		return updatedOn;
	} 
	public void setUpdatedOn(String updatedOn) {
		this.updatedOn = updatedOn;  
	}
	public int getBuId() { 
		return BuId; 
	}   
	public void setBuId(int buId) {
		this.BuId = buId;   
	}
	public int getDepartment_BuId() { 
		return Department_BuId; 
	}
	public void setDepartment_BuId(int department_BuId) {
		this.Department_BuId = department_BuId;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}  
	
	
	  
	

}
