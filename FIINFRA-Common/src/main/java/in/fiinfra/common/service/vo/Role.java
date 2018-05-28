package in.fiinfra.common.service.vo;

import java.util.Date;

public class Role 
{
	private int roleId;
	private String roleName;
	private String roleDescription;
	private boolean isActive;
	private String startDate;
	private String expiryDate;
	private Date lastmodifiedDate;
	private int oldroleId;
	private int  userStatus;
	
	private String deleteList;
	
	private String searchText;
	
	private int createOrModifiedBy;
	
	
	public int getRoleId() 
	{
		return roleId;
	}
	public void setRoleId(int roleId) 
	{
		this.roleId = roleId;
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
	
	public boolean getisActive() 
	{
		return isActive;
	}
	public void setisActive(boolean isActive) 
	{
		this.isActive = isActive;
	}
	
	public void setRoleDescription(String roleDescription)
	{
		this.roleDescription = roleDescription;
	}
	
	public String getStartDate() 
	{
		return startDate;
	}
	
	public void setStartDate(String startDate) 
	{
		this.startDate = startDate;
	}
	
	public String getExpiryDate()
	{
		return expiryDate;
	}
	
	public void setExpiryDate(String expiryDate) 
	{
		this.expiryDate = expiryDate;
	}
		
	public Date getLastmodifiedDate() 
	{
		return lastmodifiedDate;
	}
	
	public void setLastmodifiedDate(Date lastmodifiedDate) 
	{
		this.lastmodifiedDate = lastmodifiedDate;
	}

	public int getOldroleId() 
	{
		return oldroleId;
	}
	
	public void setOldroleId(int oldroleId) 
	{
		this.oldroleId = oldroleId;
	}
	
	
	public int getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	public String getDeleteList() 
	{
		return deleteList;
	}
	
	public void setDeleteList(String deleteList) 
	{
		this.deleteList = deleteList;
	}
	
	
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	
	public int getCreateOrModifiedBy() {
		return createOrModifiedBy;
	}

	public void setCreateOrModifiedBy(int createOrModifiedBy) {
		this.createOrModifiedBy = createOrModifiedBy;
	}
	
	@Override
	public String toString() 
	{
		return "Role [roleId=" + roleId + ", roleName=" + roleName
				+ ", roleDescription=" + roleDescription + ", isActive="
				+ isActive + ", startDate=" + startDate + ", expiryDate="
				+ expiryDate + ", lastmodifiedDate=" + lastmodifiedDate
				+ ", oldroleId=" + oldroleId + ", deleteList=" + deleteList
				+ "]";
	}
		
}
