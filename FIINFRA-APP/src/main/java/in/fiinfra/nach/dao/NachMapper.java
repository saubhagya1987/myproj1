package in.fiinfra.nach.dao;

import in.fiinfra.frmk.DbMapper;
import in.fiinfra.pg.NachData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NachMapper extends DbMapper<NachData>  {

	@Override
	protected List<NachData> doMap(ResultSet rs) throws SQLException {
		List<NachData> lst = new ArrayList<NachData>();

		while (rs.next()) {
			NachData nach = new NachData();
			nach.setEmail(rs.getString("Email"));
			nach.setMobile(rs.getString("Phone No"));
			nach.setBankName(rs.getString("Bank Name"));
			// nach.setErrorDetail(rs.getString("errorDetails"));
			nach.setEndDate(rs.getDate("End Date"));
			nach.setStartDate(rs.getDate("Start Date"));
			nach.setPartyID(rs.getInt("PartyID"));
			nach.setNachId(rs.getInt("NACHID"));
			nach.setNachFormId(rs.getInt("NachFormId"));
			nach.setIfsc(rs.getString("ifsc"));
			nach.setAccountNumber(rs.getString("Account Number"));
			nach.setLimitAmount(rs.getDouble("Amount"));
			nach.setPartyName(rs.getString("Party Name"));
			nach.setErrorDetail(rs.getString("Error"));
			nach.setRemark(rs.getString("Remark"));
			nach.setFrequencyId(rs.getInt("FrequencyID"));
			nach.setPhoneNo(rs.getString("Phone No"));
			nach.setRegistrationDate(rs.getDate("Registration Date"));
			nach.setStatusId(rs.getInt("StatusCodeID"));
			nach.setMicr(rs.getString("MICR"));
			nach.setUmrn(rs.getString("UMRN No"));
            nach.setNachStatusCode(rs.getString("NachStatusCode"));
            nach.setFrequency(rs.getString("Frequency"));
            nach.setAccountId(rs.getInt("AccountTypeID"));
            nach.setReferece1(rs.getString("Reference 1"));
            nach.setRefernce2(rs.getString("Reference 2"));
			
            lst.add(nach);
		}
		return lst;
	}
}
