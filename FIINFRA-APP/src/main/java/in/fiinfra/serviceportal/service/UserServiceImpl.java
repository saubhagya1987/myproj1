package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.User;
import in.fiinfra.serviceportal.dao.UserDao;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceImpl implements UserService
{
	@Autowired
	private UserDao userDao;
	
	public UserDao getUserDao() 
	{
		return userDao;
	}

	public void setUserDao(UserDao userDao) 
	{
		this.userDao = userDao;
	}

	@Override
	public Response getTopLoginList(int buId,int userId) 
	{
		Response topuserList=userDao.getTopLoginList(buId,userId);
		return topuserList ;
	}
	
	@Override
	public Response getAllUser(User userData)
	{
		Response user=userDao.getAllUser(userData);	
		return user;
	}
	
	
	@Override
	public Response getPartyName()
	{
		Response partyname=userDao.getPartyName();
		return partyname;	 
	}
	
	@Override
	public Response getRoleName()
	{
		Response rolename=userDao.getRoleName();
		return rolename;
	}
		
	@Override
	public Response getUserDteail(User userData) 
	{
		Response user=userDao.getUserDetail(userData);
		return user;
	}

	@Override
	public Response getUnqUserName(User userData) 
	{
		Response user=userDao.getUnqUserName(userData);
		return user;
	}
	
	@Override
	public Response updateUser(User userData) 
	{
		Response result = userDao.updateUser(userData);
		return result;
	}
	
	@Override
	public Response addNewUser(User userData) 
	{
		Response result = userDao.addNewUser(userData);
		return result;
	}
	
	@Override
	public Response deleteUser(User userData) 
	{
		Response updateUser=userDao.deleteUser(userData);
		return updateUser;
	}
	
	@Override
	public Response resetPassword(User userdata) 
	{
		Response user=userDao.resetPassword(userdata);
		return user;
	}

	@Override
	public Response showAuditHistory(User userData) 
	{
		Response user=userDao.showAuditHistory(userData);
		return user;
	}

	@Override
	public Response updateUserProfileHeirarchy(User userData) {
		Response user=userDao.updateUserProfileHeirarchy(userData);
		return user;
	}
}
