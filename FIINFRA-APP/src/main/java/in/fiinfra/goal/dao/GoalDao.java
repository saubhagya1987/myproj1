package in.fiinfra.goal.dao;

import in.fiinfra.common.diy.models.AdviserGoalChart;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.utility.GoalData;

import java.util.List;

public interface GoalDao {

	public Integer saveFutureGoals(GoalData goalData);

	public List<GoalData> getFutureGoals(Integer partyId, Integer goalTypeId);

	public boolean updateFutureGoals(GoalData goalData);

	public List<GoalData> getListOfFutureGoalsForPartyId(Integer partyId);

	public GoalData getFutureGoalForGoalId(Integer goalId);

	public List<AdviserGoals> getGoalsForAdviser(Integer partyId,String nodeId);
	
	public List<AdviserGoalChart> getGoalChartForAdviser(Integer partyId);

	public String getCountOfFutureGoalsForPartyId(Integer partyId);

	public Integer getPlanIdForPartyId(Integer partyId);
	
	public boolean saveAllocation(Integer partyId, Integer lastModifiedby, Integer buId);
	
	public boolean deleteGoalForGoalId( Integer goalId );
	
	public Integer getNumberOfGoalsForGoalTypeID( Integer buId, Integer goalTypeId);

	public boolean saveGoalPriority(String goalDataXML, Integer partyId);

	public Boolean saveEducationData(String[] attributes);
	
}
