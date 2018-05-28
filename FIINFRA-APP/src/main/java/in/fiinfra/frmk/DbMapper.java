package in.fiinfra.frmk;

import in.fiinfra.common.common.StringUtils;
import in.fiinfra.cp.CommonUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;



public abstract class DbMapper<T> {

	public List<T> map(ResultSet rs) throws SQLException {
		return doMap(rs);
	}

	protected abstract List<T> doMap(ResultSet rs) throws SQLException;

	public static Date getDate(ResultSet rs, String columnName)
			throws SQLException {
		return rs.getDate(columnName);
	}

	public static Integer getInt(ResultSet rs, String column)
			throws SQLException {
		return getInt(rs, column, null);
	}

	public static Long getLong(ResultSet rs, String column)
			throws SQLException {
		long val = rs.getLong(column);
		return val >0 ? val:null;
	}

	public static boolean getBoolean(ResultSet rs, String coulmnIndex)
			throws SQLException {
		return getInt(rs, coulmnIndex, 0) == 1;

	}

	public static Integer getInt(ResultSet rs, String column,
			Integer defaultValue) throws SQLException {
		String value = rs.getString(column);
		return CommonUtils.toInt(value, defaultValue);
	}

	public static Double getDouble(ResultSet rs, String column) throws SQLException {
		return rs.getDouble(column);
	}

	public static String getString(ResultSet rs, String columnIndex)
			throws SQLException {
		String value = rs.getString(columnIndex);
		if (!StringUtils.isEmpty(value)) {
			return value;
		}
		return null;
	}

}
