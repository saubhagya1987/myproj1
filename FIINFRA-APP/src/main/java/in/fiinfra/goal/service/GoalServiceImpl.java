package in.fiinfra.goal.service;

import in.fiinfra.common.diy.models.AdviserGoalChart;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.GoalAttribute;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.goal.dao.GoalDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("goalService")
public class GoalServiceImpl implements GoalService {
	
	@Autowired
	GoalDao goalDao;
	
	@Override
	public Integer saveFutureGoals(GoalData goalData) {
				
		String attributeXML = convertAttributeToXml(goalData.getGoalAttributeList());
		goalData.setAttributeXML(attributeXML);
		String goalXML = convertGoalDataToXml( goalData );
		goalData.setGoalDataXml(goalXML);
		/*if(goalData.getGoalTypeId() == 35001) {
			String attributes[] = getEducationGoalAttributes(goalData.getGoalAttributeList());
			Boolean isDataSaved = goalDao.saveEducationData(attributes);
		}*/
		Integer goalId = goalDao.saveFutureGoals(goalData);		
		return goalId;
	}
	
	private String[] getEducationGoalAttributes(List<GoalAttribute> goalAttributeList) {
		String names [] = {"","","","","",""};
		
		if(goalAttributeList != null) {			
			for (GoalAttribute goalAttribute : goalAttributeList) {
				switch(goalAttribute.getAttributeName()) {
				case "100005": 
					names[0] = goalAttribute.getAttributeValue().trim();
					break;
				
				case "100006": 
					names[1] = goalAttribute.getAttributeValue().trim();
					break;
				
				case "100011": 
					names[2] = goalAttribute.getAttributeValue().trim();
					break;
				
				case "100002": 
					names[3] = goalAttribute.getAttributeValue().trim();
					break;
				
				case "100003": 
					names[4] = goalAttribute.getAttributeValue().trim();
					break;
				
				}
			}
		
		}
		
		return names;
	}

	@Override
	public List<GoalData> getFutureGoals(Integer partyId, Integer goalTypeId) {
		
		List<GoalData> goalDataList  = goalDao.getFutureGoals(partyId, goalTypeId);
		return goalDataList;
	}

	public String convertAttributeToXml(List<GoalAttribute> goalAttributeList)
	{
		return FiinfraUtility.getAttributeDataXML(goalAttributeList);
	}
	
	public String convertGoalDataToXml( GoalData goalData )
	{
		return FiinfraUtility.getGoalDataXML(goalData);
	}

	@Override
	public boolean updateFutureGoals(GoalData goalData) {
		
		String attributeXML = convertAttributeToXml(goalData.getGoalAttributeList());
		goalData.setAttributeXML(attributeXML);
		String goalXML = convertGoalDataToXml( goalData );
		goalData.setGoalDataXml(goalXML); 
		goalDao.updateFutureGoals(goalData);
		return true;
	}

	@Override
	public List<GoalData> getListOfFutureGoalsForPartyId(Integer partyId) {
		
		return goalDao.getListOfFutureGoalsForPartyId(partyId);
	}

	@Override
	public GoalData getFutureGoalForGoalId( Integer goalId) {
		
		return goalDao.getFutureGoalForGoalId(goalId);
	}

	@Override
	public List<AdviserGoals> getGoalsForAdviser(Integer partyId,String nodeId) 
	{
		return goalDao.getGoalsForAdviser(partyId,nodeId);
	}
	
	@Override
	public List<AdviserGoalChart> getGoalChartForAdviser(Integer partyId) 
	{
		return goalDao.getGoalChartForAdviser(partyId);
	}

	@Override
	public String getCountOfFutureGoalsForPartyId(Integer partyId) {
		String goalDataCount = goalDao.getCountOfFutureGoalsForPartyId(partyId);
		if(goalDataCount != null && !goalDataCount.isEmpty()) {
			return goalDataCount;
		} else {
			return "0_0";
		}
	}

	@Override
	public Integer getPlanIdForPartyId(Integer partyId) {
		return goalDao.getPlanIdForPartyId(partyId);
		
	}

	@Override
	public boolean deleteGoalForGoalId(Integer partyId,Integer goalId, Integer buId,Integer lastModeifiedBy) {
		
		goalDao.deleteGoalForGoalId(goalId);
		goalDao.saveAllocation(partyId,lastModeifiedBy,buId);
		return true;
	}

	@Override
	public boolean saveAssetAllocationForRetriement(Integer partyId, Integer lastModifiedBy, Integer buId) {
		
		goalDao.saveAllocation(partyId, lastModifiedBy, buId);
		return true;
	}

	@Override
	public Integer getNumberOfGoalsForGoalTypeID(Integer buId,
			Integer goalTypeId) {
		return goalDao.getNumberOfGoalsForGoalTypeID(buId, goalTypeId);
	}

	@Override
	public boolean saveGoalPriority(List<GoalData> goalDataList, Integer partyId, Integer buId, Integer userId) {
		String goalDataXML = FiinfraUtility.getGoalPriorityXML(goalDataList);
		goalDao.saveGoalPriority(goalDataXML, partyId);
		goalDao.saveAllocation(partyId, userId, buId);
		return true;
	}
}
