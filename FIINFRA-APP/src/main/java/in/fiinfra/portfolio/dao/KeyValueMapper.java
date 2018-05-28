package in.fiinfra.portfolio.dao;

import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.utility.GoalData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

  public class KeyValueMapper implements RowMapper<KeyValue>{
 

	@Override
	public KeyValue mapRow(ResultSet rs, int rowNum) throws SQLException {
		KeyValue keyValue = new KeyValue();
		
		
		keyValue.setName(rs.getString("name"));
		keyValue.setId(rs.getInt("id"));
		return keyValue;
	}

}
