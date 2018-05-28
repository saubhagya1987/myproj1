package in.fiinfra.portfolio.dao;

import in.fiinfra.common.utility.GoalData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

  public class GoalMapper implements RowMapper<GoalData>{
 

	@Override
	public GoalData mapRow(ResultSet rs, int rowNum) throws SQLException {
		GoalData goalData = new GoalData();
		
		goalData.setId(rs.getInt("id"));
		goalData.setGoalName(rs.getString("goalName"));
		goalData.setGoalAmountPv(rs.getString("goalAmountPv"));
		goalData.setGoalStartYear(rs.getInt("createdYear"));
		goalData.setGoalEndYear(rs.getInt("goalEndYear"));
		goalData.setGoalAmountFv(rs.getString("goalAmountFv"));
		goalData.setLoanAmount(rs.getDouble("loanAmount"));
		goalData.setLoanInterestPercentage(rs.getDouble("loanInterestPercentage"));
		goalData.setLoanDurationYears(rs.getInt("loanDurationYears"));
		goalData.setDescription(rs.getString("goalDescription"));
		goalData.setGoalTypeId(rs.getInt("goalTypeId"));
		goalData.setGoalTypeName(rs.getString("GoalType"));
		goalData.setGoalStatusId(rs.getInt("GoalStatusId"));
		goalData.setGoalCompletedPercent(rs.getString("ExistingAssetsGoalAchievePercent"));
		goalData.setRegularInvestAmt(rs.getString("regularInvestAmount"));
		return goalData;
	}

}
