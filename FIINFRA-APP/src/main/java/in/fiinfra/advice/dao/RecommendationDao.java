package in.fiinfra.advice.dao;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;

import java.util.List;

public interface RecommendationDao {
	
	public List<KeyValue> getProductCategory( Integer ProductTypeId );
	
	public List<KeyValue> getProductCompanyName(  Integer categoryId );
	
	public List<KeyValue> getProductsForCategory( Integer categoryId, Integer manufacturedId );
	
	public List<AdviceRecommendation> getRecommendations( GoalPlanInput goalPlanInput );
	
	public boolean insertOrUpdateAdviceRecommendation(String assetLevelXml);
	
	public boolean insertOrUpdateAdviceRecommendationFoAsset( AdviceRecommendation adviceRecommendation );
	
	public boolean deleteAdviceRecommendation( Integer partyId, Integer sectionTypeId );
	
	public List<String> getProductTypes( Integer FPSectionTypeId ,Integer assetClassId );
	
	public boolean insertOrUpdateAdviceRecommendationForLifeRiskCover( String assetLevelXml );
	
	public boolean insertOrUpdateAdviceRecommendationForGeneralRiskCover( String assetLevelXml );
	
	public boolean RiskCoverSetDefault(String fpSectionTypeId,String productTypeId, String CategoryId, String partyId);
	
}
