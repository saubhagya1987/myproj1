package in.fiinfra.advice.dao;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductCommension;

import java.util.List;

public interface GoalPlanDao {
	
	public List<AdviceRecommendation> getRecommendationForAsset(GoalPlanInput goalPlanInput);
	
	public List<AdviceRecommendation> getRecommendationForProductType(GoalPlanInput goalPlanInput);
	
	public List<AdviceRecommendation> getRecommendationForProductCategory(GoalPlanInput goalPlanInput);
	
	public List<KeyValue> getProductCategoriesForProductId(Integer assetTypeId,Integer typeId);
	
	public List<KeyValue> getCompaniesForProductCategory(Integer categoryId);
	
	public List<KeyValue> getProductTypesForAssetId(Integer assetId,Integer recommendationRecordTypeId, Integer riskProfileId, Integer goalYearRangeId);
	
	public List<ProductCommension> getCommensionsForProductId( Integer buPartyId,Integer assetClassId, Integer CategoryId, Integer ProductId, Integer ProductTypeId);
	
	public List<ProductCommension> getCommensionForProductId(GoalPlanInput goalPlanInput);
	
	public boolean deleteRecommendationForProductType( List<AdviceRecommendation> adviceRecommendations);
	
	public Integer getManufacturerIdForCategoryId(Integer categoryId, Integer productId);
	
	public List<KeyValue> getProductsForCategoryAndManufacturer(Integer manufacturedId, Integer categoryId);
	
	public Integer getCountOfProductTypesForAsset(AdviceRecommendation recommendation);
	
	public Integer getCountOfProductCategoriesForAsset(AdviceRecommendation recommendation);
	
	public boolean insertOrUpdateRecommendationForAsset(String assetXML);
	
	public boolean insertOrUpdateRecommendationForProductTypeId(String assetXML);
	
	public Integer insertOrUpdateRecommendationForProductCategory(String assetXML);
	
	public boolean insertOrUpdateRecommendationForProduct(String assetXML);
	
	public boolean deleteRecommendationForProductCategory(Integer FPAdviceRecommendId);
	
	public boolean deleteRecommendationForProduct(List<AdviceRecommendation> adviceRecommendations);
	
	public boolean resetGoalPlanData(String fpSectionTypeId,String partyId);
	
	public List<AdviceRecommendation> getGoalBucketProductAllocations( GoalPlanInput goalPlanInput );
	
	public List<AdviceRecommendation> getEditGoalBucketProductAllocation( GoalPlanInput goalPlanInput );
	
	public List<KeyValue> getProductsForEditGoalBucketAllocation( Integer assetClassId, Integer productTypeId, Integer categoryId, String productData);
	
	public boolean resetGoalBucketData( String riskProfileId, String goalYearRangeId, String partyId);
	
	public boolean insertOrUpdateGoalBucketAllocation( String goalPlanXml );

	public List<KeyValue> getAllProductsName(Integer assetClassId,
			Integer productTypeId, Integer categoryId, String productData);
}
