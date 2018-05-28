package in.fiinfra.login.dao;

import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.common.diy.models.PasswordPolicy;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;

import java.util.List;

public interface LoginDao {
	public UserDetailsJson getUserByUserName(String username);

	public Boolean expiredLockAccount(String username);

	public Integer loginAttemptFailed(String username, String IPaddress);

	public Boolean successfulLogin(String username, String IPaddress);
	
	public UserSession getSessionDataForSuccessfulLogin(String username);
	
	public List<PasswordPolicy> getPasswordPolicy(String username);
	
	public Boolean resetPassword(String username, String password,Integer isForceChangePassword); 
	
	public UserSession getUserByToken(String username, String ip);
	
	public UserSession getSessionUserByToken(int sourceSystemId, String userName, String token);
	
	
	public Boolean saveUserAccessLog(UserAccessLog userAccessLog);
	
	public Integer getUserIdForUsername(String username);
	
	public Boolean logoutUserFromSystem(String username);
	
	public Boolean userSessionExpired(String username);
	
	public String getRoleBasedSecurityIds(Integer partyId, Integer sourceId, Integer sectionTypeId);
	
}
