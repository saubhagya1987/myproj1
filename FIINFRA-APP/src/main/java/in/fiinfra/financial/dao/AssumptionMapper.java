package in.fiinfra.financial.dao;

import in.fiinfra.cp.Assumption;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class AssumptionMapper implements RowMapper<Assumption>{

	@Override
	public Assumption mapRow(ResultSet rs, int rowNum) throws SQLException {
		Assumption bean = new Assumption();
		bean.setLabel(rs.getString("DisplayLabel"));
		bean.setEndRange(rs.getString("EndRange"));
		bean.setStartRange(rs.getString("StartRange"));
		bean.setValue(rs.getString("Value"));
		bean.setPriority(rs.getInt("priority"));
		return bean;
	}

}
