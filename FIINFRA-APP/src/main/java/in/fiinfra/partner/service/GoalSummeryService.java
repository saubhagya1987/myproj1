package in.fiinfra.partner.service;

import in.fiinfra.common.partner.AssetAllocationOfGoal;
import in.fiinfra.common.partner.GoalDetail;
import in.fiinfra.common.partner.GoalListData;
import in.fiinfra.common.partner.GoalSummeryData;

import java.util.List;

import org.apache.poi.hssf.util.HSSFColor.GOLD;

public interface GoalSummeryService {
	public List<GoalSummeryData> getGoalSummaryDetails(int partyId,int buId,int nodeId);
	public List<GoalListData> getGoalList(int partyId,int buId,String condition,String parameterValue,String firstElement,String lastElement,int nodeId);
	public List<GoalDetail>getGoalDetail(int partyId,int buId,String type);
	public List<AssetAllocationOfGoal>getAssetAllocation(int partyId,int buId,String type);
	
}
