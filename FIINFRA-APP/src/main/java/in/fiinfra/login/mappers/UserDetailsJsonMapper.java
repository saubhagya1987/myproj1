package in.fiinfra.login.mappers;

import in.fiinfra.common.authentication.models.UserDetailsJson;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UserDetailsJsonMapper implements RowMapper<UserDetailsJson> {
	@Override
	public UserDetailsJson mapRow(ResultSet rs, int rowCount)
			throws SQLException {
		UserDetailsJson userDetailsJson = new UserDetailsJson();
		userDetailsJson.setUserName(rs.getString("UserName"));
		userDetailsJson.setUserID(rs.getInt("UserID"));
		userDetailsJson.setActive(rs.getBoolean("IsActive"));
		userDetailsJson.setPassword(rs.getString("Password"));
		userDetailsJson.setLoginAttempts(rs.getInt("LoginAttempts"));
		userDetailsJson.setAccountLocked(rs.getBoolean("IsAccountLocked"));
		userDetailsJson.setAccountLockDttm(rs.getTimestamp("AccountLockDttm"));
		userDetailsJson.setAccountLockExpiryDttm(rs
				.getTimestamp("AccountLockExpiryDttm"));
		userDetailsJson.setLastFailedLoginDttm(rs
				.getTimestamp("LastFailedLoginDttm"));
		userDetailsJson.setLastLoginIPAddress(rs
				.getString("LastLoginIPAddress"));
		userDetailsJson.setLoggedIn(rs.getBoolean("IsLoggedIn"));
		userDetailsJson.setAccessStartDate(rs.getTimestamp("AccessStartDate"));
		userDetailsJson
				.setAccessExpiryDate(rs.getTimestamp("AccessExpiryDate"));
		userDetailsJson.setForceChangePasswordOnLogin(rs
				.getBoolean("IsForceChangePasswordOnLogin"));
		userDetailsJson.setLastSuccessfulLoginDttm(rs
				.getTimestamp("LastSuccessfulLoginDttm"));
		userDetailsJson.setRoleName(rs.getString("RoleName"));
		userDetailsJson.setEmailId(rs.getString("EmailID"));
		return userDetailsJson;
	}

}
