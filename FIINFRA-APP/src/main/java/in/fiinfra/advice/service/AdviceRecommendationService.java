package in.fiinfra.advice.service;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;

import java.util.List;

public interface AdviceRecommendationService {
	
	public List<KeyValue> getProductCategoriesForProductId(Integer typeId);
	
	public List<KeyValue> getCompaniesForProductCategory(Integer categoryId);
	
	public Integer getManufacturerIdForCategoryId(Integer categoryId, Integer productId);
	
	public List<KeyValue> getProductsForCategoryAndManufacturer(Integer manufacturedId, Integer categoryId);
	
	public boolean saveAdviceRecommendation(List<AdviceRecommendation> adviceRecommendations);
	
	public List<AdviceRecommendation> getAdviceRecommendations(GoalPlanInput goalPlanInput);
}
