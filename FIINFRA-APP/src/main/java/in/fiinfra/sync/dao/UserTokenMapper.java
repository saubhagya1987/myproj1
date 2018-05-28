package in.fiinfra.sync.dao;

import in.fiinfra.common.diy.models.UserToken;
import in.fiinfra.frmk.DbMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserTokenMapper extends DbMapper<UserToken> {

	@Override
	protected List<UserToken> doMap(ResultSet rs) throws SQLException {
		List<UserToken> lst = new ArrayList<UserToken>();

		while (rs.next()) {
			UserToken token = new UserToken();
			token.setDescription(rs.getString("description"));
			token.setOtp(rs.getInt("otp"));
			token.setToken(rs.getString("token"));
			token.setUserTokenId(rs.getInt("userTokenId"));
			token.setUserId(rs.getInt("userId"));
			token.setOtpConfirmed(rs.getBoolean("isOtpConfirmed"));
			token.setCreatedBy(rs.getInt("createdBy"));
			lst.add(token);
		}
		return lst;
	}

}
