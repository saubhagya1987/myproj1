package in.fiinfra.financial.dao;

import in.fiinfra.cp.ExpenseData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
 public class ExpenseMapper implements RowMapper<ExpenseData>{
 

	@Override
	public ExpenseData mapRow(ResultSet rs, int rowNum) throws SQLException {
		ExpenseData expenseData = new ExpenseData();
		
		
		
		expenseData.setExpenseAmount(rs.getLong("ExpenseAmount"));
		expenseData.setExpenseTypeID(rs.getInt("ExpenseTypeID"));
		expenseData.setExpenseName(rs.getString("ExpenseName"));
		expenseData.setExpenseFrequencyID(rs.getInt("ExpenseFrequencyId"));
		expenseData.setPartyExpenseID(rs.getInt("ExpenseId"));
		expenseData.setExpenseSubTypeID(rs.getInt("ExpenseSubTypeId"));
		expenseData.setExpenseFrequency(rs.getString("ExpenseFreq"));
		expenseData.setExpenseSubType(rs.getString("ExpenseSubType"));
		expenseData.setExpenseType(rs.getString("ExpenseType"));
		expenseData.setGrowthRate(rs.getInt("grodthRate"));
		expenseData.setCurrencyDenominationId(rs.getInt("currencyDenominationId"));
		return expenseData;
	}

}
