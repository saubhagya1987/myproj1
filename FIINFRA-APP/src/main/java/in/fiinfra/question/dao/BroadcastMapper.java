package in.fiinfra.question.dao;

import in.fiinfra.cp.BroadcastData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BroadcastMapper implements RowMapper<BroadcastData> {

	@Override
	public BroadcastData mapRow(ResultSet rs, int rowNum) throws SQLException {
		BroadcastData broadcastData = new BroadcastData();

		broadcastData.setBroadCastId(rs.getInt("ID"));
		broadcastData.setBroadCastEndDate(rs.getDate("ExpiryDttm"));
		broadcastData.setDaysToGo(rs.getInt("days"));
		broadcastData.setBroadCastSectionId(rs.getInt("BroadCastSectionID"));
		broadcastData.setBroadCastStartDate(rs.getDate("StartDttm"));
		broadcastData.setBroadCastTitle(rs.getString("Title"));
		broadcastData.setDescription(rs.getString("Description"));
		return broadcastData;
	}

}
