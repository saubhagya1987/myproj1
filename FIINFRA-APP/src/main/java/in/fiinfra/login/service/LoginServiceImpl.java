package in.fiinfra.login.service;

import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.common.diy.models.PasswordPolicy;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.login.dao.LoginDaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
	
	
	@Autowired
	LoginDaoImpl loginDao;

	@Autowired
	private Md5PasswordEncoder passwordEncoder;


	@Override
	public UserDetailsJson getUserDetails(String username) {
		return loginDao.getUserByUserName(username);
	}

	@Override
	public Boolean expireLockAccount(String username) {
		return loginDao.expiredLockAccount(username);
	}

	@Override
	public Integer loginAttemptFailed(String username, String IPaddress) {
		return loginDao.loginAttemptFailed(username, IPaddress);
	}

	@Override
	public UserSession getSessionDataForSuccessfulLogin(String username, String IPaddress) {
		loginDao.successfulLogin(username, IPaddress);
		return loginDao.getSessionDataForSuccessfulLogin(username);
	}

	@Override
	public UserSession getUserByToken(String token, String ip) {
		return loginDao.getUserByToken(token,ip);
	}

	@Override
	public UserSession getSessionUserByToken(int sourceSystemId, String userName, String token) {
//		return loginDao.getSessionUserByToken(sourceSystemId,passwordEncoder.encodePassword(token, ""));
		return loginDao.getSessionUserByToken(sourceSystemId,userName, token);
	}

	@Override
	public List<PasswordPolicy> getPasswordPolicy(String username) 
	{
		return loginDao.getPasswordPolicy(username);
	}

	@Override
	public Boolean resetPassword(String username, String password,Integer isForceChangePassword) 
	{
		return loginDao.resetPassword(username, password,isForceChangePassword);
	}

	@Override
	public Boolean saveUserAccessLog(UserAccessLog userAccessLog) 
	{
		return loginDao.saveUserAccessLog(userAccessLog);
	}

	@Override
	public Integer getUserIdForUsername(String username) 
	{
		return loginDao.getUserIdForUsername(username);
	}

	@Override
	public Boolean logoutUserFromSystem(String username) 
	{
		return loginDao.logoutUserFromSystem(username);
	}

	@Override
	public Boolean userSessionExpired(String username) {
		return loginDao.userSessionExpired(username);
	}

	@Override
	public String getRoleBasedSecurityIds(Integer partyId, Integer sourceId,
			Integer sectionTypeId) {
		
		return loginDao.getRoleBasedSecurityIds(partyId, sourceId, sectionTypeId);
	}
}
