package in.fiinfra.common.service.vo;

public class MemberAllocation 
{
	private Integer departmentId;  
	private String displayShortName;
	private Integer buid;
	
	public Integer getBuid() 
	{
		return buid;
	}
	public void setBuid(Integer buid) 
	{
		this.buid = buid;
	}
	public Integer getDepartmentId() 
	{
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) 
	{
		this.departmentId = departmentId;
	}
	public String getDisplayShortName() 
	{
		return displayShortName;
	}
	public void setDisplayShortName(String displayShortName) 
	{
		this.displayShortName = displayShortName;
	}
	
	/*@Override
	public String toString() {
		return "MemberAllocation [departmentId=" + departmentId
				+ ", displayShortName=" + displayShortName + ", buid=" + buid
				+ "]";
	}
	*/
	

}

