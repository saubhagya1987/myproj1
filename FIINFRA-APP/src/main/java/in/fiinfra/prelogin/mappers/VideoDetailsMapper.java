package in.fiinfra.prelogin.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import in.fiinfra.common.video.model.VideoDetailsJson;

import org.springframework.jdbc.core.RowMapper;

public class VideoDetailsMapper implements RowMapper<VideoDetailsJson> 
{

	@Override
	public VideoDetailsJson mapRow(ResultSet rs, int rowCount)
			throws SQLException 
	{
		VideoDetailsJson videoDetailsJson = new VideoDetailsJson();
		videoDetailsJson.setAttributeName(rs.getString("AttributeName"));
		videoDetailsJson.setAttributeValue(rs.getString("AttributeValue"));
		return videoDetailsJson;
	}
	
}
