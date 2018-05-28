package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.service.vo.User;

import javax.ws.rs.core.Response;

public interface UserDao 
{
	public Response getTopLoginList(int buId,int userId);
	
	public Response getAllUser(User userData) ;
	public Response getPartyName();	
	public Response getRoleName();	

	public Response getUserDetail(User userData);
	public Response getUnqUserName(User userData);							
	public Response updateUser(User userData);
	public Response addNewUser(User userData);
	
	public Response deleteUser(User userData);
	public Response resetPassword(User userData);
	public Response showAuditHistory(User userData);

	public Response updateUserProfileHeirarchy(User userData);
    
}
