package in.fiinfra.login.dao;

import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.common.diy.models.PasswordPolicy;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.frmk.DbInvoker;
import in.fiinfra.util.SQLs;

import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDaoImpl extends DbInvoker implements LoginDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	private static final Logger LOGGER = Logger.getLogger(LoginDaoImpl.class);
	private static final String SP_RETRIVE_USER_BY_USERNAME = "{CALL usp_DIY_getUser(?)}";
	private static final String SP_EXPIRED_LOCK_USER_BY_USERNAME = "{CALL usp_DIY_checkAccountExpiry(?)}";
	private static final String SP_LOG_FAILED_LOGIN_ATTEMPTS = "{CALL usp_DIY_loginAttemptFailed}";
	private static final String SP_SUCCESSFULL_USER_LOGIN = "{CALL usp_DIY_successfulLogin(?,?)}";
	private static final String SP_GET_SESSION_DATA_FOR_USER = "{CALL usp_DIY_getSessionDataForUser(?)}";
	private static final String SP_GET_PASSWORD_POLICY_FOR_USERNAME = "{CALL usp_DIY_getPasswordPolicyForUserName(?)}";
	private static final String SP_RESET_PASSWORD_FOR_USERNAME = "{CALL usp_DIY_resetPasswordForUsername(?,?,?)}";
	private static final String SP_GET_USER_DETAIL_BY_TOKEN = "{CALL usp_CP_getUserDetailByToken(?,?)}";
	private static final String SP_SAVE_USER_ACCESS_LOG = "{CALL usp_DIY_insertDataForUserAccessLog(?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_GET_USERID_FOR_USERNAME = "{CALL usp_DIY_getUserIdForUserName(?)}";
	private static final String SP_LOGOUT_USER_FOR_USERNAME = "{CALL usp_DIY_logoutUserFromSystem(?)}";
	private static final String SP_USER_SESSION_EXPIRED = "{CALL usp_DIY_logUserForSessionExpired(?)}";
	private static final String SP_GET_ROLE_BASED_SECURITY_IDS = "{CALL usp_DIY_getRoleBasedSecurityIds(?,?,?)}";

	@Override
	public UserDetailsJson getUserByUserName(String username) {

		// calling stored procedure with in parameter
		List<UserDetailsJson> details = jdbcTemplate.query(
				SP_RETRIVE_USER_BY_USERNAME, new Object[] { username },
				new BeanPropertyRowMapper<UserDetailsJson>(UserDetailsJson.class));

		// returning UserDetails Object if found
		if (CollectionUtils.isNotEmpty(details))
			return details.get(0);
		else
			// return null object if user not found;
			return null;
	}

	@Override
	public Boolean expiredLockAccount(String username) {
		// calling SP to Unlock the user with user name and return true or false
		// for acknowledgment
		int result = jdbcTemplate.update(SP_EXPIRED_LOCK_USER_BY_USERNAME,
				new Object[] { username });
		return result <= 0 ? false : true;
	}

	@Override
	public Integer loginAttemptFailed(String username, String IPaddress) {
		// calling SP if user failed to login with credentials
		/*jdbcTemplate.update(SP_LOG_FAILED_LOGIN_ATTEMPTS,
				new Object[] { username, IPaddress });
		Integer result2 = jdbcTemplate.queryForObject(
				"SELECT IsAccountLocked from TXN_User WHERE UserName=?",
				new Object[] { username }, Integer.class);
		*/
		
		//calling stored procedure for lock user if attempts exceeds(out parameter) 
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_loginAttemptFailed");
		SqlParameter UserName = new SqlParameter("UserName", Types.VARCHAR);
		SqlParameter LastLoginIPAddress = new SqlParameter("LastLoginIPAddress", Types.VARCHAR);
		SqlOutParameter Result = new SqlOutParameter("Result", Types.INTEGER);
		SqlParameter[] param = {UserName,LastLoginIPAddress,Result};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("UserName", username);
		paramValue.put("LastLoginIPAddress", IPaddress);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		Integer result2 =(Integer) storedProcedureResult.get("Result");
			
		return result2;
	}

	@Override
	public Boolean successfulLogin(String username, String IPaddress) {
		// calling SP if user successfully login to the system
		int result = jdbcTemplate.update(SP_SUCCESSFULL_USER_LOGIN,
				new Object[] { username, IPaddress });
		return result <= 0 ? false : true;
	}

	//GET session variables for user
	@Override
	public UserSession getSessionDataForSuccessfulLogin(String username)
	{
		List<UserSession> userSessions = jdbcTemplate.query(SP_GET_SESSION_DATA_FOR_USER, new Object[] {username}, new BeanPropertyRowMapper<UserSession>(UserSession.class));
		if(CollectionUtils.isNotEmpty(userSessions))
			return userSessions.get(0);
		
		return null;
	}

	//GET session variables for user by token (used in client Portal)
	@Override
	public UserSession getUserByToken(String token, String ip)
	{
		List<UserSession> userSessions = jdbcTemplate.query(SP_GET_USER_DETAIL_BY_TOKEN, new Object[] {token,ip}, new UserSessionMapper());
		if(CollectionUtils.isNotEmpty(userSessions)){
			return userSessions.get(0);
		}
			
		return null;
	}

	@Override
	public UserSession getSessionUserByToken(int sourceSystemId, String userName, String token){
		Map<String,Object> params = new HashMap<String,Object>();
		addIdParameter(params, "sourceSystemId", sourceSystemId);
		addStringParameter(params, "token", token);
		addStringParameter(params, "userName", userName);
		return executeSelectOne(SQLs.sel_session_user_by_token, params, new SessionUserMapper()); 
	}

	

	@Override
	public List<PasswordPolicy> getPasswordPolicy(String username) 
	{
		List<PasswordPolicy> passwordPolicies = jdbcTemplate.query(SP_GET_PASSWORD_POLICY_FOR_USERNAME, new Object[] {username}, new BeanPropertyRowMapper<PasswordPolicy>(PasswordPolicy.class));
		if(CollectionUtils.isNotEmpty(passwordPolicies))
		{
			return passwordPolicies;
		}
		return null;
	}

	@Override
	public Boolean resetPassword(String username, String password,Integer isForceChangePassword) 
	{
		Integer result =  jdbcTemplate.update(SP_RESET_PASSWORD_FOR_USERNAME, new Object[] {username,password,isForceChangePassword});
		return result>0?true:false;
	}

	@Override
	public Boolean saveUserAccessLog(UserAccessLog userAccessLog) 
	{
		jdbcTemplate.update(SP_SAVE_USER_ACCESS_LOG, new Object[] {userAccessLog.getUserId(),userAccessLog.getLoginAccessModeId(),
				userAccessLog.getSsoSourceSystem(),userAccessLog.getEnteredPassword(),userAccessLog.getSourceIPAddress(),
				userAccessLog.getLoginSuccessful(),userAccessLog.getRedirectUrl(),userAccessLog.getFailureCode(),
				userAccessLog.getSessionId(),userAccessLog.getSessionExpired(),userAccessLog.getFailureText(),userAccessLog.getSourceSystemId()});
		return true;
	}

	@SuppressWarnings("deprecation")
	@Override
	public Integer getUserIdForUsername(String username) 
	{
		return jdbcTemplate.queryForObject(SP_GET_USERID_FOR_USERNAME, new Object[] {username}, Integer.class);
	}

	@Override
	public Boolean logoutUserFromSystem(String username) 
	{
		jdbcTemplate.update(SP_LOGOUT_USER_FOR_USERNAME, new Object[] {username});
		return true;
	}

	@Override
	public Boolean userSessionExpired(String username) 
	{
		jdbcTemplate.update(SP_USER_SESSION_EXPIRED, new Object[] {username});
		return true;
	}

	@Override
	public String getRoleBasedSecurityIds(Integer partyId, Integer sourceId,
			Integer sectionTypeId) {
		
		return jdbcTemplate.queryForObject(SP_GET_ROLE_BASED_SECURITY_IDS, new Object[] {partyId, sourceId, sectionTypeId}, String.class);
	}
}
