package in.fiinfra.common.service.vo;



public class LoginHistory 
{
	private String roleName;
	private int userId;
	private String userName;
	private String loginDateTime;
	private String loginAccessMode;	
	private String sourceIPAddress;
	private String redirectURLFullPath;
	private String failureText;
	private String logoutDateTime;
	private String buId;
	private String searchText; 
	

	
	
	public String getRoleName() 
	{
		return roleName;
	}
	public void setRoleName(String roleName) 
	{
		this.roleName = roleName;
	}
	public String getLoginDateTime()
	{
		return loginDateTime;
	}
	public void setLoginDateTime(String loginDateTime) 
	{
		this.loginDateTime = loginDateTime;
	}
	public String getLoginAccessMode() 
	{
		return loginAccessMode;
	}
	public void setLoginAccessModeId(String loginAccessModeId) 
	{
		this.loginAccessMode = loginAccessModeId;
	}
	
	public String getSourceIPAddress()
	{
		return sourceIPAddress;
	}
	public void setSourceIPAddress(String sourceIPAddress) 
	{
		this.sourceIPAddress = sourceIPAddress;
	}
	
	public String getRedirectURLFullPath() 
	{
		return redirectURLFullPath;
	}
	public void setRedirectURLFullPath(String redirectURLFullPath) 
	{
		this.redirectURLFullPath = redirectURLFullPath;
	}
	
	public String getFailureText() 
	{
		return failureText;
	}
	public void setFailureText(String failureText) 
	{
		this.failureText = failureText;
	}
	public String getLogoutDateTime() 
	{
		return logoutDateTime;
	}
	public void setLogoutDateTime(String logoutDateTime) 
	{
		this.logoutDateTime = logoutDateTime;
	}
	
	public String getBuId() 
	{
		return buId;
	}
	public void setBuId(String buId) 
	{
		this.buId = buId;
	}
	public String getSearchText() 
	{
		return searchText;
	}
	public void setSearchText(String searchText) 
	{
		this.searchText = searchText;
	}
	
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName) 
	{
		this.userName = userName;
	}
	public void setLoginAccessMode(String loginAccessMode) 
	{
		this.loginAccessMode = loginAccessMode;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
}
