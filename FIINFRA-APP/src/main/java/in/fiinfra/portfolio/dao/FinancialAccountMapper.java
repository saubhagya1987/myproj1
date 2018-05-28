package in.fiinfra.portfolio.dao;

import in.fiinfra.cp.FinancialAccountData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

  public class FinancialAccountMapper implements RowMapper<FinancialAccountData>{
 

	@Override
	public FinancialAccountData mapRow(ResultSet rs, int rowNum) throws SQLException {
		FinancialAccountData fa = new FinancialAccountData();
		
		fa.setPartyFinancialAccountID(rs.getInt("PartyFinancialAccountID"));
		fa.setAccountName(rs.getString("AccountName"));
		fa.setAccountNumber(rs.getString("AccountNumber"));
		fa.setIFSCNo(rs.getString("IFSCNo"));
		fa.setBankName(rs.getString("BankName"));
		fa.setBranchCode(rs.getString("BranchCode"));
		return fa;
	}

}
