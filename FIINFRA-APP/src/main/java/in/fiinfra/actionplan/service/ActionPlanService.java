package in.fiinfra.actionplan.service;

import in.fiinfra.common.diy.models.ActionPlan;
import in.fiinfra.common.diy.models.ActionPlanRisk;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductCommension;

import java.util.List;

public interface ActionPlanService {
	
	public List<ActionPlan> getActionPlanData( Integer partyId, Integer goalId, Integer goalTypeId, Integer investmentType );
	
	public List<ActionPlanRisk> getActionPlanDataForRiskCover( Integer partyId, Integer sectionTypeId);
	
	public boolean insertOrUpdateActionPlanData( List<ActionPlan> actionPlanList);
	
	public boolean insertOrUpdateActionPlanDataForRisk(List<ActionPlanRisk> actionPlanRiskList);
	
	public ProductCommension getProductPremiumAmount( ActionPlanRisk actionPlanRisk );
	
	public List<KeyValue> getProductsForRiskCover( Integer riskId, String dataFor );
}
