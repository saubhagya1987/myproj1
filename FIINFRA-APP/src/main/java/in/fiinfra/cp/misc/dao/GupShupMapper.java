package in.fiinfra.cp.misc.dao;

import in.fiinfra.cp.GupShupData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class GupShupMapper implements RowMapper<GupShupData> {

	@Override
	public GupShupData mapRow(ResultSet rs, int rowNum) throws SQLException {
		GupShupData gupShupData = new GupShupData();

		gupShupData.setCommentCount(rs.getInt("commentCount"));
		gupShupData.setCreatedById(rs.getInt("createdById"));
		gupShupData.setLastVisitedDate(rs.getTimestamp("lastVisitedDate"));
		gupShupData.setId(rs.getInt("id"));
		gupShupData.setLikeCount(rs.getInt("likeCount"));
		gupShupData.setText(rs.getString("text"));
		gupShupData.setPosturl(rs.getString("postUrl"));
		gupShupData.setPreviewCount(rs.getInt("previewCount"));
		gupShupData.setUserName(rs.getString("PostOwner"));
		gupShupData.setLiked(rs.getBoolean("liked"));
		gupShupData.setCreatedDate(rs.getTimestamp("CreatedDate"));
		return gupShupData;
	}

}
