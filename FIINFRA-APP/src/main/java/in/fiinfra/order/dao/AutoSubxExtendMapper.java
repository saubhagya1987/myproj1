package in.fiinfra.order.dao;

import in.fiinfra.pg.AutoSubxExtendData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

public class AutoSubxExtendMapper implements
		ResultSetExtractor<List<AutoSubxExtendData>> {

	@Override
	public List<AutoSubxExtendData> extractData(ResultSet rs)
			throws SQLException, DataAccessException {
		List<AutoSubxExtendData> lst = new ArrayList<AutoSubxExtendData>();
		while (rs.next()) {
			AutoSubxExtendData bean = new AutoSubxExtendData();
			bean.setBuId(rs.getInt("buId"));
			bean.setPartyID(rs.getInt("PartyID"));
			bean.setProductID(rs.getInt("ProductID"));
			bean.setPlanCount(rs.getInt("PlanCount"));
			bean.setRefDate(rs.getDate("RefDate"));
			bean.setEndDate(rs.getDate("SubscriptionExpiryDate"));

			lst.add(bean);
		}

		return lst;
	}

}
