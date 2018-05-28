package in.fiinfra.cp.misc.dao;

import in.fiinfra.cp.TestimonialData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class TestimonialMapper implements RowMapper<TestimonialData> {

	@Override
	public TestimonialData mapRow(ResultSet rs, int rowNum) throws SQLException {
		TestimonialData testimonialData = new TestimonialData();

		testimonialData.setCreatedById(rs.getInt("createdById"));
		testimonialData.setCreatedDateTime(rs.getTimestamp("creationDate"));
		testimonialData.setId(rs.getInt("id"));
		testimonialData.setText(rs.getString("text"));
		testimonialData.setUrl(rs.getString("url"));
		testimonialData.setPage(rs.getInt("page"));
		testimonialData.setUserName(rs.getString("userName"));
		testimonialData.setCity(rs.getString("city"));
		testimonialData.setDesignation(rs.getString("WorkDesignation"));
		testimonialData.setGenderId(rs.getInt("GenderID"));
		testimonialData.setPhoto(rs.getString("photo"));

		return testimonialData;
	}

}
