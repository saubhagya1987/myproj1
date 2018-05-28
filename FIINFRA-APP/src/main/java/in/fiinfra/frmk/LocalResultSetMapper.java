package in.fiinfra.frmk;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LocalResultSetMapper extends DbMapper<RsIterator>{
	
	

	@Override
	protected List<RsIterator> doMap(ResultSet rs) throws SQLException {
		String[] headers = null;
		List<String[]> rows = new ArrayList<String[]>();
		while (rs.next()) {
			if (headers == null) {
				ResultSetMetaData metaData = rs.getMetaData();
				headers = new String[metaData.getColumnCount()];
				for (int i = 0; i < metaData.getColumnCount(); i++) {
					headers[i] = metaData.getColumnLabel(i + 1);
				}
			}
			String[] row = new String[headers.length];
			for (int i = 0; i < headers.length; i++) {
				String ob = rs.getString(i + 1);
				if (ob == null) {
					row[i] = "";
				} else {
					row[i] = ob;
				}
			}
			rows.add(row);

		}
		List<RsIterator> result = new ArrayList<RsIterator>();
		result.add(new LocalResultSet(headers, rows));
		return result;
	}
}
