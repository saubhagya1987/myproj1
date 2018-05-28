package in.fiinfra.cp.misc.dao;

import in.fiinfra.common.common.GupShupCommentData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class GupShupCommentMapper implements RowMapper<GupShupCommentData> {

	@Override
	public GupShupCommentData mapRow(ResultSet rs, int rowNum)
			throws SQLException {
		GupShupCommentData gupShupCommentData = new GupShupCommentData();

		gupShupCommentData.setPartyId(rs.getInt("partyId"));
		gupShupCommentData.setCommentOwner(rs.getString("commentOwner"));
		gupShupCommentData.setCommentText(rs.getString("text"));
		gupShupCommentData.setId(rs.getInt("id"));
		gupShupCommentData.setPostId(rs.getInt("PostId"));
		
		gupShupCommentData.setCreatedDate(rs.getTimestamp("CreatedDate"));
		
		return gupShupCommentData;
	}

}
