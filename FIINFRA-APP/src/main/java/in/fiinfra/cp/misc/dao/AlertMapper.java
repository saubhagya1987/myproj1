package in.fiinfra.cp.misc.dao;

import in.fiinfra.cp.AlertData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

  public class AlertMapper implements RowMapper<AlertData>{
 

	@Override
	public AlertData mapRow(ResultSet rs, int rowNum) throws SQLException {
		AlertData alertData = new AlertData();
		alertData.setOwner(rs.getString("Owner"));
		alertData.setType(rs.getString("Type"));
		alertData.setRefType(rs.getString("RefType"));
		alertData.setSubject(rs.getString("Title"));
		alertData.setLastUpdate(rs.getDate("LastUpdatedDate"));
		alertData.setTaskDueDate(rs.getDate("DueDateTime"));
		alertData.setRefId(rs.getInt("RefId"));
		
		return alertData;
	}

}
