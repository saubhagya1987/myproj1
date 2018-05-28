package in.fiinfra.goal.service;

import in.fiinfra.common.diy.models.AdviserGoalChart;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.utility.GoalData;

import java.util.List;

public interface GoalService {
	
	public Integer saveFutureGoals(GoalData goalData );
	
	public List<GoalData> getFutureGoals( Integer partyId, Integer goalTypeId );
	
	public boolean updateFutureGoals( GoalData goalData );
	
	public List<GoalData> getListOfFutureGoalsForPartyId( Integer partyId );
	
	public GoalData getFutureGoalForGoalId( Integer goalId );
	
	public List<AdviserGoals> getGoalsForAdviser(Integer paertyId,String nodeId);
	
	public List<AdviserGoalChart> getGoalChartForAdviser(Integer paertyId);

	public String getCountOfFutureGoalsForPartyId(Integer partyId);

	public Integer getPlanIdForPartyId(Integer partyId);
	
	public boolean deleteGoalForGoalId( Integer partyId,Integer goalId, Integer buId,Integer lastModeifiedBy);
	
	public boolean saveAssetAllocationForRetriement( Integer partyId, Integer lastModifiedBy, Integer buId );
	
	public Integer getNumberOfGoalsForGoalTypeID( Integer buId, Integer goalTypeId);

	public boolean saveGoalPriority(List<GoalData> goalDataList, Integer partyId, Integer buId, Integer userId);
	
}
