package in.fiinfra.actionplan.dao;

import in.fiinfra.common.diy.models.ActionPlan;
import in.fiinfra.common.diy.models.ActionPlanRisk;
import in.fiinfra.common.diy.models.FamilyDetail;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductCommension;

import java.util.List;

public interface ActionPlanDao {
	
	public List<ActionPlan> getActionPlanData( Integer partyId, Integer goalId, Integer goalTypeId, Integer investmentType );
	
	public List<ActionPlanRisk> getActionPlanDataForRiskCover( Integer partyId, Integer sectionTypeId);
	
	public boolean insertOrUpdateActionPlanData(String actionPlanDataXml,Integer partyId,String targetAmount,Integer goalId, Integer goalTypeId, Integer goalYear);
	
	public boolean insertOrUpdateActionPlanDataForRisk(String actionPlanDataXml);
	
	public FamilyDetail getFamilyDetail( Integer partyId );
	
	public ProductCommension getProductPremiumAmount( Integer productId, Integer IsSpouse, Integer Age, Integer Childcount, String sumAssured );
	
	public List<KeyValue> getProductsForRiskCover( Integer riskId, String dataFor );
	
	public String getSumAssured( ActionPlanRisk actionPlanRisk );
	
}
