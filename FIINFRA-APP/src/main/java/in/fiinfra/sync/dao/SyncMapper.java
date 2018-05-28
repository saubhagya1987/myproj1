package in.fiinfra.sync.dao;

import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.SyncData;
import in.fiinfra.common.partner.SyncContactData;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.frmk.DbMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SyncMapper extends DbMapper<SyncData> {

	@Override
	protected List<SyncData> doMap(ResultSet rs) throws SQLException {
		List<SyncData> lst = new ArrayList<SyncData>();

		while (rs.next()) {
			SyncData party = new SyncData();
			party.setLogoUrl(rs.getString("logo"));
			party.setPartnerName(rs.getString("PartyName"));
			lst.add(party);
		}
		return lst;
	}

}
