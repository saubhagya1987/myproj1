package in.fiinfra.advice.service;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;

import java.util.List;

public interface RecommendationService {
	
	public List<KeyValue> getProductCategory( Integer ProductTypeId );
	
	public List<KeyValue> getProductCompanyName(  Integer categoryId );
	
	public List<KeyValue> getProductsForCategory( Integer categoryId, Integer manufacturedId );
	
	public List<AdviceRecommendation> getRecommendations( GoalPlanInput goalPlanInput );
	
	public Boolean insertOrUpdateAdviceRecommendation( List<AdviceRecommendation> adviceRecommendations );
	
	public Boolean insertOrUpdateAdviceRecommendationForLifeRiskCover( List<AdviceRecommendation> adviceRecommendations );
	
	public Boolean insertOrUpdateAdviceRecommendationForGeneralRiskCover( List<AdviceRecommendation> adviceRecommendations );
	
	public Boolean RiskCoverSetDefault( String fpSectionTypeId, String productTypeId, String CategoryId, String partyId);
	
}
