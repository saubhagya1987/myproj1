package in.fiinfra.partner.service;

import in.fiinfra.partner.dao.GoalSummeryDao;
import in.fiinfra.common.partner.AssetAllocationOfGoal;
import in.fiinfra.common.partner.GoalDetail;
import in.fiinfra.common.partner.GoalListData;
import in.fiinfra.common.partner.GoalSummeryData;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

public class GoalServiceImpl implements GoalSummeryService{
	@Autowired
	GoalSummeryDao goalSummeryDao;
	@Override
	public List<GoalSummeryData> getGoalSummaryDetails(int partyId, int buId,int nodeId) {
		// TODO Auto-generated method stub
		return goalSummeryDao.getGoalSummaryDetails(partyId, buId, nodeId);
	}
	@Override
	public List<GoalListData> getGoalList(int partyId,int buId,String condition,String parameterValue,String firstElement,String lastElement,int nodeId)
	{
		return goalSummeryDao.getGoalList(partyId, buId,condition,parameterValue,firstElement,lastElement,nodeId);
	}
	
	@Override
	public List<GoalDetail> getGoalDetail(int partyId, int buId,String type) {
		// TODO Auto-generated method stub
		return goalSummeryDao.getGoalDetail(partyId, buId,type);
	}
	@Override
	public List<AssetAllocationOfGoal> getAssetAllocation(int partyId, int buId,String type) {
		// TODO Auto-generated method stub
		return goalSummeryDao.getAssetAllocation(partyId, buId,type);
	}
	
	public GoalSummeryDao getGoalSummeryDao() {
		return goalSummeryDao;
	}
	public void setGoalSummeryDao(GoalSummeryDao goalSummeryDao) {
		this.goalSummeryDao = goalSummeryDao;
	}
	
	
}
