package in.fiinfra.common.service.vo;

import java.util.Date;

public class RoleAccessListData 
{

 private int objectId;
 private String objectType;
 private String username;
 private Date lastModifiedDate;
 private String objectName;
 private  String actionName;
 private  Boolean isActive;
 
 


public int getObjectId() 
{
	return objectId;
}
public void setObjectId(int objectId) 
{
	this.objectId = objectId;
}
 
 public String getObjectType() 
{
	return objectType;
}
public void setObjectType(String objectType) 
{
	this.objectType = objectType;
}
public String getObjectName() 
{
	return objectName;
}
public void setObjectName(String objectName) 
{
	this.objectName = objectName;
}
public String getActionName() 
{
	return actionName;
}
public void setActionName(String actionName)
{
	this.actionName = actionName;
}
public String getUsername()
{
	return username;
}
public void setUsername(String username)
{
	this.username = username;
}
public Date getLastModifiedDate() 
{
	return lastModifiedDate;
}
public void setLastModifiedDate(Date lastModifiedDate) 
{
	this.lastModifiedDate = lastModifiedDate;
}
public Boolean getIsActive() {
	return isActive;
}
public void setIsActive(Boolean isActive) {
	this.isActive = isActive;
}
@Override
public String toString() {
	return "RoleAccessListData [objectId=" + objectId + ", objectType="
			+ objectType + ", username=" + username + ", lastModifiedDate="
			+ lastModifiedDate + ", objectName=" + objectName + ", actionName="
			+ actionName + ", isActive=" + isActive + "]";
}


}
