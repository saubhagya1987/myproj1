package in.fiinfra.advice.service;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductCommension;

import java.util.List;

public interface GoalPlanService {
	
	public List<AdviceRecommendation> getRecommendationForAsset(GoalPlanInput goalPlanInput);
	
	public List<AdviceRecommendation> getRecommendationForProductType(GoalPlanInput goalPlanInput);
	
	public List<AdviceRecommendation> getRecommendationForProductCategory(GoalPlanInput goalPlanInput);
	
	public List<KeyValue> getProductCategoriesForProductId(Integer assetClassId,Integer typeId);
	
	public List<KeyValue> getCompaniesForProductCategory(Integer categoryId);
	
	public List<KeyValue> getProductTypesForAssetId(Integer assetId,Integer recommendationRecordTypeId, Integer riskProfileId, Integer goalYearRangeId);
	
	public List<ProductCommension> getCommensionsForProductId( Integer buPartyId,Integer assetClassId, Integer CategoryId, Integer ProductId, Integer ProductTypeId);
	
	public List<ProductCommension> getCommensionForProductId(GoalPlanInput goalPlanInput);
	
	public Integer getManufacturerIdForCategoryId(Integer categoryId, Integer productId);
	
	public List<KeyValue> getProductsForCategoryAndManufacturer(Integer manufacturedId, Integer categoryId);
	
	public Integer getCountOfProductTypesForAsset(AdviceRecommendation recommendation);
	
	public Integer getCountOfProductCategoriesForAsset(AdviceRecommendation recommendation);
	
	public boolean insertOrUpdateRecommendationForAsset(List<AdviceRecommendation> adviceRecommendations);
	
	public boolean insertOrUpdateRecommendationForProductTypeId(List<AdviceRecommendation> adviceRecommendations);
	
	public Integer insertOrUpdateRecommendationForProductCategory(List<AdviceRecommendation> adviceRecommendations);
	
	public boolean insertOrUpdateRecommendationForProduct(List<AdviceRecommendation> adviceRecommendations);
	
	public boolean deleteRecommendationForProductCategory(String FPAdviceRecommendId);
	
	public boolean resetGoalPlanData(String fpSectionTypeId,String partyId);
	
	public List<AdviceRecommendation> getGoalBucketProductAllocations( GoalPlanInput goalPlanInput );
	
	public List<AdviceRecommendation> getEditGoalBucketProductAllocation( GoalPlanInput goalPlanInput );
	
	public List<KeyValue> getProductsForEditGoalBucketAllocation( Integer assetClassId, Integer productTypeId, Integer categoryId, String productData);
	
	public boolean resetGoalBucketData( String riskProfileId, String goalYearRangeId, String partyId);
	
	public boolean insertOrUpdateGoalBucketAllocation( List<AdviceRecommendation> adviceRecommendations );

	public List<KeyValue> getAllProductsName(Integer assetClassId,
			Integer productTypeId, Integer categoryId, String productData);
}
