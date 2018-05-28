package in.fiinfra.nach.dao;

import in.fiinfra.frmk.DbMapper;
import in.fiinfra.pg.AutoPaymentData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AutoPaymentMapper extends DbMapper<AutoPaymentData>  {

	@Override
	protected List<AutoPaymentData> doMap(ResultSet rs) throws SQLException {
		List<AutoPaymentData> lst = new ArrayList<AutoPaymentData>();

		while (rs.next()) {
			AutoPaymentData nach = new AutoPaymentData();
			
						
			nach.setDueDate(rs.getDate("SubscriptionExpiryDate"));
			
			nach.setPartyId(rs.getInt("PartyID"));
			
			//nach.setOrderDate(rs.getDate("orderDate"));
			nach.setIfsc(rs.getString("IFSC"));
			nach.setAccountNumber(rs.getString("Account Number"));
			nach.setInvestorName(rs.getString("Investor Name"));
			nach.setPartnerName(rs.getString("Party Name"));
			
			nach.setRemark(rs.getString("Remark"));
			nach.setFrequencyId(rs.getInt("FrequencyID"));
			
			nach.setMicr(rs.getString("MICR"));
			nach.setUmrn(rs.getString("UMRN No"));
            
            nach.setFrequency(rs.getString("Frequency"));
            nach.setProductName(rs.getString("productName"));
            nach.setProductId(rs.getInt("productId"));
            
            lst.add(nach);
		}
		return lst;
	}
}
