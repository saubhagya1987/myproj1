package in.fiinfra.login.dao;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.frmk.DbMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SessionUserMapper extends DbMapper<UserSession> {
	
	@Override
	protected List<UserSession> doMap(ResultSet rs) throws SQLException {
		Map<Integer,UserSession> map = new HashMap<Integer, UserSession>();
		while(rs.next()){
			int partyId = rs.getInt("partyId");
			UserSession bean = map.get(partyId);
			if(bean ==null){
				bean = new UserSession();
				bean.setRoles(new ArrayList<String>());
				map.put(partyId, bean);
			}
			bean.setBuId(rs.getInt("buId"));
			bean.setPartyId(rs.getInt("partyId"));
			bean.setUserName(rs.getString("userName"));
			bean.setUserId(rs.getInt("userId"));
			bean.setName(rs.getString("name"));
			bean.setRoleId(rs.getInt("roleId"));
			bean.setLastLoginDttm(rs.getTimestamp("lastLoginDttm"));
			bean.setIsForceChangePasswordOnLogin(rs.getBoolean("isForceChangePasswordOnLogin"));
			
			bean.setBuLogo(rs.getString("buLogo"));
			
			bean.setPartyTypeId(rs.getInt("partyTypeId"));
			bean.getRoles().add(rs.getString("roles"));
			bean.setPhoto(rs.getString("photo"));
			bean.setThemeId(rs.getInt("themeId"));
			bean.setLogo(rs.getString("logo"));
			//owner Specific fields
			//bean.setOwnerId(rs.getInt("createdBy"));
			//bean.setOwnerName(rs.getString("ownerName"));
			/*bean.setOwnerPhoto(rs.getString("ownerPhoto"));
			bean.setOwnerLogo(rs.getString("ownerLogo"));
			bean.setOwnerEmail(rs.getString("ownerEmail"));
			bean.setOwnerMobile(rs.getString("ownerMobile"));
			bean.setDashboardPhoto(rs.getString("dashboardPhoto"));
			bean.setDcActivated(rs.getInt("dcActivated")>0);
			bean.setFirstLogin(!(rs.getInt("FirstLoginFlag")>0));
			bean.setAlertCount(rs.getInt("AlertCount"));
			bean.setTweeterLink(rs.getString("tweeterLink"));
			bean.setFbLink(rs.getString("fbLink"));*/
			
		}
		return new ArrayList<UserSession>(map.values());
	}
}
