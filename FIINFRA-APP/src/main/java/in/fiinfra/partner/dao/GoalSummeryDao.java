package in.fiinfra.partner.dao;



import in.fiinfra.common.partner.AssetAllocationOfGoal;
import in.fiinfra.common.partner.GoalDetail;
import in.fiinfra.common.partner.GoalSummeryData;
import in.fiinfra.common.partner.GoalListData;

import java.util.List;

public interface GoalSummeryDao {
	public List<GoalSummeryData> getGoalSummaryDetails(int partyId,int buId,int nodeId);
	public List<GoalListData> getGoalList(int partyId,int buId,String condition,String parameterValue,String firstElement,String lastElement,int nodeId);
	public List<GoalDetail> getGoalDetail(int partyId,int buId,String type);
	public List<AssetAllocationOfGoal> getAssetAllocation(int partyId,int buId,String type);
	
	
}
