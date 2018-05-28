package in.fiinfra.advice.dao;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;

import java.util.List;

public interface AdviceRecommendationDao {
	
	public List<KeyValue> getProductCategoriesForProductId(Integer typeId);
	
	public List<KeyValue> getCompaniesForProductCategory(Integer categoryId);
	
	public Integer getManufacturerIdForCategoryId(Integer categoryId, Integer productId);
	
	public List<KeyValue> getProductsForCategoryAndManufacturer(Integer manufacturedId, Integer categoryId);
	
	public boolean insertOrUpdateAdviceRecommendation(AdviceRecommendation adviceRecommendation);
	
	public List<AdviceRecommendation> getAdviceRecommendations(GoalPlanInput goalPlanInput);
	
	public boolean deleteAdviceRecommendations( Integer partyId, Integer sectionTypeId );
}
