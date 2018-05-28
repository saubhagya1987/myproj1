package in.fiinfra.sync.dao;

import in.fiinfra.common.partner.SyncContactData;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.frmk.DbMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IntMapper extends DbMapper<Integer> {

	@Override
	protected List<Integer> doMap(ResultSet rs) throws SQLException {
		List<Integer> lst = new ArrayList<Integer>();

		while (rs.next()) {
			lst.add(rs.getInt("value"));
		}
		return lst;
	}

}
