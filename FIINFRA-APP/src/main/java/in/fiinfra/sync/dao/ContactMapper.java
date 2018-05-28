package in.fiinfra.sync.dao;

import in.fiinfra.common.partner.SyncContactData;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.frmk.DbMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContactMapper extends DbMapper<SyncContactData> {

	@Override
	protected List<SyncContactData> doMap(ResultSet rs) throws SQLException {
		List<SyncContactData> lst = new ArrayList<SyncContactData>();

		while (rs.next()) {
			SyncContactData contact = new SyncContactData();
			contact.setfName(rs.getString("firstName"));
			contact.setlName(rs.getString("lastName"));
			contact.setEmailId(rs.getString("emailId"));
			contact.setDob(CommonUtils.format(rs.getDate("dob"), "dd-MM-yyyy"));
			// contact.setPanNo(rs.getString("panNo"));
			contact.setPartyId(rs.getInt("partyId"));
			contact.setMaritalStatus(rs.getString("maritalStatus"));
			contact.setActionPlanId(rs.getInt("ClientActionPlanDocumentID"));
			contact.setAnalysisReportId(rs.getInt("quickAnalysisPlanId"));
			contact.setSummaryPlanId(rs.getInt("summaryPlanId"));
			contact.setXrayId(rs.getInt("xrayDocumentId"));
			contact.setDcStatus(rs.getString("dcStatus"));
			contact.setDcStatusId(rs.getInt("dcStatusId"));
			contact.setOccupation(rs.getString("occupationID"));
			contact.setMobile(rs.getString("mobileNo"));
			contact.setRecordTypeId(rs.getInt("recordTypeId"));
			lst.add(contact);
		}
		return lst;
	}

}
