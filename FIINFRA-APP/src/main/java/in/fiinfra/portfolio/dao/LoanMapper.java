package in.fiinfra.portfolio.dao;

import in.fiinfra.cp.LoanData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class LoanMapper implements RowMapper<LoanData> {

	@Override
	public LoanData mapRow(ResultSet rs, int rowNum) throws SQLException {
		LoanData loanData = new LoanData();
		
		
		loanData.setPartyId(rs.getInt("PartyID"));
		loanData.setPartyLoanId(rs.getInt("PartyLoanID"));
		loanData.setProductName(rs.getString("ProductName"));
		loanData.setLoanAmount(rs.getLong("LoanAmount"));
		loanData.setLoanName(rs.getString("LoanName"));
		loanData.setLoanTypeId(rs.getInt("LoanTypeID"));
		loanData.setEmiAmount(rs.getLong("EMIAmount"));
		loanData.setPrepayPenaltyPercentage(rs.getLong("PrepayPenaltyPercentage"));
		loanData.setLinkedPartyAssetId(rs.getInt("LinkedPartyAssetID"));
		loanData.setLoanTenureMonths(rs.getInt("LoanTenureMonths"));
		loanData.setEmiFreqValue(rs.getLong("EMIFrequencyValue"));
		loanData.setEmiFreqId(rs.getInt("EMIFrequencyID"));
		loanData.setLoanType(rs.getString("LoanType"));
		return loanData;
	}

}
