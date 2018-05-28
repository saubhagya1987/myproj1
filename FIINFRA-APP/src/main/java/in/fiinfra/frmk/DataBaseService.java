package in.fiinfra.frmk;

import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;



public class DataBaseService extends BasicService {

	@Autowired
	DataSourceProvider dataSourceProvider;

	@Autowired
	DataBrokerService dataBroker;

	
	public int executeDelete(final String sql,
			final Map<String, Object> params) throws ServiceException {
		return executeUpdateSQL(sql, params);
	}

	public int executeUpdate(final String sql,
			final Map<String, Object> params) throws ServiceException {
		return executeUpdateSQL(sql, params);
	}


	/**
	 * must be executed in current transaction
	 * */
	public int executeUpdateSQL(final String sql,
			final Map<String, Object> params) throws ServiceException {
		final SQLQueryInfo queryInfo = dataBroker.getSQL(sql,params);

		PreparedStatementSetter psSetter = new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				bindParameter(ps, queryInfo, params);
			}
		};
		JdbcTemplate jdbcInvoker = getJdbcTemplate(params);
		return jdbcInvoker.update(queryInfo.getSql(), psSetter);
	}

	public int executeInsert(final String sql,
			final Map<String, Object> params) throws ServiceException {

		final SQLQueryInfo queryInfo = dataBroker.getSQL(sql,params);

		KeyHolder keyHolder = new GeneratedKeyHolder();

		JdbcTemplate jdbcInvoker = getJdbcTemplate(params);

		int row = jdbcInvoker.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(
					Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(queryInfo
						.getSql(),Statement.RETURN_GENERATED_KEYS);
				bindParameter(ps, queryInfo, params);
				return ps;
			}
		}, keyHolder);

		return row >0 ? keyHolder.getKey().intValue():null;
	}

	/**
	 * must be executed in current transaction
	 * */
	public <T> List<T> executeSelect(final String sql,
			final Map<String, Object> params, RowMapper<T> mapper)
			throws ServiceException {
		
		final SQLQueryInfo queryInfo = dataBroker.getSQL(sql,params);

		PreparedStatementSetter psSetter = new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				bindParameter(ps, queryInfo, params);
			}
		};
		JdbcTemplate jdbcInvoker = getJdbcTemplate(params);
		return jdbcInvoker.query(queryInfo.getSql(), psSetter, mapper);
	}


	public <T> List<T> executeSQL(final String sql,
			final Map<String, Object> params, final DbMapper<T> mapper)
			throws ServiceException {

		final SQLQueryInfo queryInfo = dataBroker.getSQL(sql,params);

		PreparedStatementSetter psSetter = new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				bindParameter(ps, queryInfo, params);
			}
		};
		JdbcTemplate jdbcInvoker = getJdbcTemplate(params);

		return jdbcInvoker.query(queryInfo.getSql(), psSetter,
				new ResultSetExtractor<List<T>>() {

					@Override
					public List<T> extractData(ResultSet rs)
							throws SQLException, DataAccessException {

						return mapper.map(rs);
					}

				});
	}
	



	protected void bindParameter(PreparedStatement ps, SQLQueryInfo query,
			Map<String, Object> params) throws SQLException {
		int i = 0;
		for (String s : query.getParamNames()) {
			setParameter(ps, ++i, params.get(s));
		}
	}

	protected void setParameter(PreparedStatement ps, int index, Object param)
			throws SQLException {
		if (param == null || param instanceof String) {
			ps.setString(index, (String) param);
		} else if (param instanceof Integer) {
			ps.setInt(index, (Integer) param);
		} else if (param instanceof Long) {
			ps.setLong(index, (Long) param);
		} else if (param instanceof Boolean) {
			ps.setBoolean(index, (Boolean) param);
		} else if (param instanceof Double) {
			ps.setDouble(index, (Double) param);
		} else if (param instanceof Float) {
			ps.setFloat(index, (Float) param);
		}
		else if (param instanceof Date) {
			java.sql.Date d = new java.sql.Date(((Date) param).getTime());
			ps.setDate(index, d);
		}
		else if(param instanceof Blob){
			ps.setBlob(index, (Blob)param);
		}

		else {
			throw new ServiceException("Unhandled data type "
					+ param.getClass().getName());
		}
		// handle all other possible type
	}

	protected final JdbcTemplate getJdbcTemplate(Map<String, Object> params)
			throws ServiceException {
		Integer bu = (Integer) params.get(FiinfraConstants.BU_ID);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSourceProvider.getDataSource(bu==null?0:bu));
		return jdbcTemplate;
	}	

	public DataBrokerService getDataBroker() {
		return dataBroker;
	}

	public void setDataBroker(DataBrokerService dataBroker) {
		this.dataBroker = dataBroker;
	}
}
