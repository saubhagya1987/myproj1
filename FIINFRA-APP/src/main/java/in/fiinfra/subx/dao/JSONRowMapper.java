package in.fiinfra.subx.dao;

import in.fiinfra.cp.CommonUtils;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class JSONRowMapper implements ResultSetExtractor<List<Object>> {

	@Override
	public List<Object> extractData(ResultSet rs) throws SQLException,
			DataAccessException {

		String[] headers = null;
		List<Object> lst = new ArrayList<Object>();
		ObjectMapper mapper = new ObjectMapper();
		while (rs.next()) {
			if (headers == null) {
				ResultSetMetaData metaData = rs.getMetaData();
				headers = new String[metaData.getColumnCount()];
				for (int i = 0; i < metaData.getColumnCount(); i++) {
					headers[i] = metaData.getColumnLabel(i + 1);
				}
			}

			ObjectNode node = mapper.createObjectNode();

			for (int i = 0; i < headers.length; i++) {
				String str = rs.getString(i + 1);
				node.put(headers[i], format(headers[i], str));
			}
			lst.add(node);
		}
		return lst;
	}

	private String format(String columnName, String value) {
		return CommonUtils.emptyIfNull(value);
	}

}