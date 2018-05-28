package in.fiinfra.common.service.vo;

import java.util.Date;

public class RoleData 
{
	private String roleName;
	private String roleDescription;
	private Date startDate;
	private Date expiryDate;
	private boolean isActive;
	

	@Override
	public String toString() 
	{
		return "RoleData [roleName=" + roleName + ", startDate=" + startDate + ", expiryDate=" + expiryDate +", isActive="+ isActive +"]";
	}

	
	
	
	public String getRoleName() 
	{
		return roleName;
	}
	
	public void setRoleName(String roleName) 
	{
		this.roleName = roleName;
	}
	
	
	public String getRoleDescription() 
	{
		return roleDescription;
	}


	public void setRoleDescription(String roleDescription) 
	{
		this.roleDescription = roleDescription;
	}
	
	public Date getStartDate() 
	{
		return startDate;
	}
	
	public void setStartDate(Date startDate) 
	{
		this.startDate = startDate;
	}
	
	public Date getExpiryDate() 
	{
		return expiryDate;
	}
	
	public void setExpiryDate(Date expiryDate) 
	{
		this.expiryDate = expiryDate;
	}

	public boolean isActive() 
	{
		return isActive;
	}

	public void setisActive(boolean isActive)
	{
		this.isActive = isActive;
	}




	

	
}
