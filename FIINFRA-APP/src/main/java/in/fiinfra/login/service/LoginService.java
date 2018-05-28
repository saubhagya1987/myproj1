package in.fiinfra.login.service;

import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.common.diy.models.PasswordPolicy;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;

import java.util.List;

public interface LoginService {
	public UserDetailsJson getUserDetails(String username);

	public Boolean expireLockAccount(String username);

	public Integer loginAttemptFailed(String username, String IPaddress);

	public UserSession getSessionDataForSuccessfulLogin(String username, String IPaddress);
	
	public List<PasswordPolicy> getPasswordPolicy(String username);
	
	public Boolean resetPassword(String username, String password,Integer isForceChangePassword);
	
	public UserSession getUserByToken(String token, String remoteIp);
	
	public UserSession getSessionUserByToken(int sourceSystemId, String userName, String token);
	
	public Boolean saveUserAccessLog(UserAccessLog userAccessLog);
	
	public Integer getUserIdForUsername(String username);
	
	public Boolean logoutUserFromSystem(String username);
	
	public Boolean userSessionExpired(String username);
	
	public String getRoleBasedSecurityIds(Integer partyId, Integer sourceId, Integer sectionTypeId);
}
