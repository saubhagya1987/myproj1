package in.fiinfra.login.dao;

import in.fiinfra.common.diy.models.UserSession;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;

public class UserSessionMapper implements RowMapper<UserSession> {

	Map<Integer, UserSession> map = new HashMap<Integer, UserSession>();

	@Override
	public UserSession mapRow(ResultSet rs, int rowNum) throws SQLException {
		int partyId = rs.getInt("partyId");
		UserSession bean = map.get(partyId);
		boolean newBean = false;
		if (bean == null) {
			newBean = true;
			bean = new UserSession();
			bean.setRoles(new ArrayList<String>());
		}
		bean.setBuId(rs.getInt("buId"));
		bean.setPartyId(rs.getInt("partyId"));
		bean.setUserId(rs.getInt("userId"));
		bean.setName(rs.getString("name"));
		bean.setRoleId(rs.getInt("roleId"));
		bean.setLastLoginDttm(rs.getTimestamp("lastLoginDttm"));
		bean.setIsForceChangePasswordOnLogin(rs.getInt("forceChangePassword") > 0);

		bean.setBuLogo(rs.getString("buLogo"));

		bean.setPartyTypeId(rs.getInt("partyTypeId"));
		bean.getRoles().add(rs.getString("roles"));
		bean.setPhoto(rs.getString("photo"));
		bean.setThemeId(rs.getInt("themeId"));
		bean.setThemeName(rs.getString("themeName"));
		bean.setLogo(rs.getString("logo"));
		// owner Specific fields
		bean.setOwnerId(rs.getInt("ownerId"));
		bean.setOwnerName(rs.getString("ownerName"));
		bean.setOwnerPhoto(rs.getString("ownerPhoto"));
		bean.setOwnerLogo(rs.getString("ownerLogo"));
		bean.setOwnerEmail(rs.getString("ownerEmail"));
		bean.setOwnerMobile(rs.getString("ownerMobile"));
		bean.setDashboardPhoto(rs.getString("dashboardPhoto"));
		bean.setDcActivated(rs.getInt("dcActivated") > 0);
		bean.setFirstLogin(!(rs.getInt("FirstLoginFlag") > 0));
		bean.setAlertCount(rs.getInt("AlertCount"));
		bean.setTweeterLink(rs.getString("tweeterLink"));
		bean.setFbLink(rs.getString("fbLink"));
		bean.setXrayActivated(rs.getInt("xrayActivated") > 0);

		return newBean ? bean : null;
	}

}
