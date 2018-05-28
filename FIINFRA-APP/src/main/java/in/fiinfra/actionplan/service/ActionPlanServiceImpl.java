package in.fiinfra.actionplan.service;


import in.fiinfra.actionplan.dao.ActionPlanDao;
import in.fiinfra.common.diy.models.ActionPlan;
import in.fiinfra.common.diy.models.ActionPlanRisk;
import in.fiinfra.common.diy.models.FamilyDetail;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductCommension;
import in.fiinfra.common.util.FiinfraUtility;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("actionPlanService")
public class ActionPlanServiceImpl implements ActionPlanService {
	
	@Autowired
	ActionPlanDao actionPlanDao;

	@Override
	public List<ActionPlan> getActionPlanData(Integer partyId,Integer goalId,Integer goalTypeId,Integer investmentType) {

		List<ActionPlan> actionPlanJsonDataList = new ArrayList<ActionPlan>();
		actionPlanJsonDataList = actionPlanDao.getActionPlanData(partyId, goalId, goalTypeId,investmentType);
		
		return actionPlanJsonDataList;
	}

	@Override
	public List<ActionPlanRisk> getActionPlanDataForRiskCover(Integer partyId,Integer sectionTypeId) {
		
		List<ActionPlanRisk> actionPlanRiskList = actionPlanDao.getActionPlanDataForRiskCover(partyId, sectionTypeId);
		ProductCommension commension = new ProductCommension();
		for (ActionPlanRisk actionPlanRisk : actionPlanRiskList) {
			commension = getProductPremiumAmount(actionPlanRisk);
			Double pre = Double.parseDouble(commension.getPreimum());
			Double sum = Double.parseDouble(commension.getSumAssured());
			actionPlanRisk.setPremiumAmount(pre.toString());
			actionPlanRisk.setSumAssured(sum.toString());
		}
		
		return actionPlanRiskList;
	}

	@Override
	public boolean insertOrUpdateActionPlanData(List<ActionPlan> actionPlanList) {
		
		String actionPlanDataXml = FiinfraUtility.getActionPlanDataXml(actionPlanList);
		actionPlanDao.insertOrUpdateActionPlanData(actionPlanDataXml,actionPlanList.get(0).getPartyId(),actionPlanList.get(0).getTargetAmount(),actionPlanList.get(0).getGoalId(),actionPlanList.get(0).getGoalTypeId(),actionPlanList.get(0).getGoalYear());
		return true;
	}
	
	@Override
	public boolean insertOrUpdateActionPlanDataForRisk(List<ActionPlanRisk> actionPlanRiskList) {
		
		String actionPlanDataXml = FiinfraUtility.getActionPlanDataRiskXml(actionPlanRiskList);
		actionPlanDao.insertOrUpdateActionPlanDataForRisk(actionPlanDataXml);
		return true;
	}

	@Override
	public ProductCommension getProductPremiumAmount(ActionPlanRisk actionPlanRisk) {
		
		FamilyDetail familyDetail = actionPlanDao.getFamilyDetail(actionPlanRisk.getPartyId());
		ProductCommension premiumAmount = new ProductCommension();
		String dataFor = actionPlanRisk.getRisk().substring(0,2).toUpperCase();
		String sumAssured = actionPlanDao.getSumAssured(actionPlanRisk);
		if( dataFor.equals("LI") ) {
			premiumAmount = actionPlanDao.getProductPremiumAmount(actionPlanRisk.getProductId(),-1,familyDetail.getAge(),-1,sumAssured);
		} else {
			premiumAmount = actionPlanDao.getProductPremiumAmount(actionPlanRisk.getProductId(),familyDetail.getIsSpouse(),familyDetail.getAge(),familyDetail.getChildcount(),sumAssured);
		}
		return premiumAmount;
	}

	@Override
	public List<KeyValue> getProductsForRiskCover(Integer riskId, String dataFor) {
		
		return actionPlanDao.getProductsForRiskCover(riskId, dataFor);
	}
}
