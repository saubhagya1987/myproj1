package in.fiinfra.financial.dao;

import in.fiinfra.cp.IncomeData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

  public class IncomeMapper implements RowMapper<IncomeData>{
 

	@Override
	public IncomeData mapRow(ResultSet rs, int rowNum) throws SQLException {
		IncomeData incomeData = new IncomeData();
		
		
		incomeData.setPartyIncomeId(rs.getInt("IncomeId"));
		incomeData.setIncomeSubTypeId(rs.getInt("incomeSubTypeId"));
		incomeData.setIncomeFrequencyId(rs.getInt("incomeFrequencyId"));
		incomeData.setIncomeName(rs.getString("incomeName"));
		incomeData.setIncomeAmount(rs.getLong("incomeAmount"));
		incomeData.setIncomeTypeId(rs.getInt("IncomeTypeID"));
		incomeData.setIncomeType(rs.getString("incomeType"));
		incomeData.setIncomeFrequency(rs.getString("incomeFreq"));
		incomeData.setAnnualGrowth(rs.getDouble("annualGrowth"));
		incomeData.setCurrencyDenominationId(rs.getInt("currencyDenominationId"));
		return incomeData;
	}

}
