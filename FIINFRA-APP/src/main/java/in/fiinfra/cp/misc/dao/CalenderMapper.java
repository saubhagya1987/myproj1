package in.fiinfra.cp.misc.dao;

import in.fiinfra.cp.CalenderData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CalenderMapper implements RowMapper<CalenderData> {

	@Override
	public CalenderData mapRow(ResultSet rs, int rowNum) throws SQLException {
		CalenderData calenderData = new CalenderData();

		calenderData.setCreatedDatetime(rs.getTimestamp("CreatedDate"));
		calenderData.setEvent(rs.getString("Event"));
		calenderData.setDescription(rs.getString("EventDesc"));
		calenderData.setEventDate(rs.getTimestamp("eventDate"));
		calenderData.setEventType(rs.getString("EventType"));

		return calenderData;
	}

}
