package in.fiinfra.advice.service;

import in.fiinfra.advice.dao.GoalPlanDao;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductCommension;
import in.fiinfra.common.util.FiinfraUtility;

import java.util.List;
import java.util.StringTokenizer;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("goalPlanService")
public class GoalPlanServiceImpl implements GoalPlanService {
	
	@Autowired
	GoalPlanDao goalPlanDao;
	
	@Override
	public Integer getCountOfProductCategoriesForAsset(AdviceRecommendation recommendation) {
		
		return goalPlanDao.getCountOfProductCategoriesForAsset(recommendation);
	}
	
	@Override
	public Integer getCountOfProductTypesForAsset(AdviceRecommendation recommendation) {
		
		return goalPlanDao.getCountOfProductTypesForAsset(recommendation);
	}
	
	@Override
	public List<KeyValue> getProductCategoriesForProductId(Integer assetClassId,Integer typeId) {
		
		return goalPlanDao.getProductCategoriesForProductId(assetClassId,typeId);
	}

	@Override
	public List<KeyValue> getCompaniesForProductCategory(Integer categoryId) {
		
		return goalPlanDao.getCompaniesForProductCategory(categoryId);
	}

	@Override
	public Integer getManufacturerIdForCategoryId(Integer categoryId, Integer productId) {
		
		return goalPlanDao.getManufacturerIdForCategoryId(categoryId, productId);
	}

	@Override
	public List<KeyValue> getProductsForCategoryAndManufacturer(Integer manufacturedId, Integer categoryId) {
		
		return goalPlanDao.getProductsForCategoryAndManufacturer(manufacturedId, categoryId);
	}
	
	@Override
	public List<KeyValue> getProductTypesForAssetId( Integer assetId, Integer recommendationRecordTypeId, Integer riskProfileId, Integer goalYearRangeId )
	{
		return goalPlanDao.getProductTypesForAssetId(assetId, recommendationRecordTypeId,riskProfileId,goalYearRangeId);
	}
	
	@Override
	public List<ProductCommension> getCommensionsForProductId( Integer buPartyId,Integer AssetClassId,Integer CategoryId, Integer ProductId, Integer ProductTypeId)
	{
		return goalPlanDao.getCommensionsForProductId(buPartyId,AssetClassId,CategoryId, ProductId, ProductTypeId);
	}

	@Override
	public List<AdviceRecommendation> getRecommendationForAsset(GoalPlanInput goalPlanInput) {
		
		List<AdviceRecommendation> recommendations = null;
		
		recommendations = goalPlanDao.getRecommendationForAsset(goalPlanInput);
		
		for(AdviceRecommendation recommendation : recommendations){
			recommendation.setCountOfProductTypes(goalPlanDao.getCountOfProductTypesForAsset(recommendation));
		}
		
		return recommendations;
	}

	@Override
	public List<AdviceRecommendation> getRecommendationForProductType(GoalPlanInput goalPlanInput) {
		
		List<AdviceRecommendation> recommendations = null;
		
		recommendations = goalPlanDao.getRecommendationForProductType(goalPlanInput);
		if( !CollectionUtils.isEmpty(recommendations)) {
			for(AdviceRecommendation recommendation : recommendations) {
				recommendation.setProductTypeIds(getProductTypesForAssetId(recommendation.getAssetClassId(), 50002,recommendation.getRiskProfileId(),recommendation.getGoalYearRangeId()));
				recommendation.setCategoryIds(getProductCategoriesForProductId(recommendation.getAssetClassId(),recommendation.getProductTypeId()));
			}
		}
		
		for(AdviceRecommendation recommendation : recommendations){
			
			recommendation.setCountOfProductCategory(goalPlanDao.getCountOfProductCategoriesForAsset(recommendation));
		}
		return recommendations;
	}

	@Override
	public List<AdviceRecommendation> getRecommendationForProductCategory(GoalPlanInput goalPlanInput) {
		
		List<AdviceRecommendation> recommendations = null;
		Integer buPartyId = goalPlanInput.getBuPartyId();
		recommendations = goalPlanDao.getRecommendationForProductCategory(goalPlanInput);
		if(!CollectionUtils.isEmpty(recommendations)) {
			for(AdviceRecommendation recommendation : recommendations) {
				recommendation.setCategoryIds(getProductCategoriesForProductId(recommendation.getAssetClassId(),recommendation.getProductTypeId()));
				recommendation.setManufacturerIds(getCompaniesForProductCategory(recommendation.getCategoryId()));
				recommendation.setProductIds(getProductsForCategoryAndManufacturer(recommendation.getManufacturerId(), recommendation.getCategoryId()));
				recommendation.setProductCommensions(getCommensionsForProductId(buPartyId,recommendation.getAssetClassId(), recommendation.getCategoryId(), recommendation.getProductId(), recommendation.getProductTypeId()));
			}
		}
		return recommendations;
	}
	
	//insert assetclass level data
	@Override
	public boolean insertOrUpdateRecommendationForAsset(List<AdviceRecommendation> adviceRecommendations) {
		
		String assetLevelXml = FiinfraUtility.getAssetLevelXML(adviceRecommendations);
		goalPlanDao.insertOrUpdateRecommendationForAsset(assetLevelXml);
		return true;
	}
	
	// INsert ProductTYpe Level Data
	@Override
	public boolean insertOrUpdateRecommendationForProductTypeId(List<AdviceRecommendation> adviceRecommendations) {

		String assetLevelXml = FiinfraUtility.getAssetLevelXML(adviceRecommendations);
		goalPlanDao.insertOrUpdateRecommendationForProductTypeId(assetLevelXml);
		return false;
	}
	
	//insert category level data
	@Override
	public Integer insertOrUpdateRecommendationForProductCategory(List<AdviceRecommendation> adviceRecommendations) {
//		goalPlanDao.deleteRecommendationForProductType(adviceRecommendations);
		String assetLevelXml = FiinfraUtility.getAssetLevelXML(adviceRecommendations);
		Integer categoryId = goalPlanDao.insertOrUpdateRecommendationForProductCategory(assetLevelXml);
		return categoryId;
	}
	
	//insert product level data
	@Override
	public boolean insertOrUpdateRecommendationForProduct(List<AdviceRecommendation> adviceRecommendations) {
//		goalPlanDao.deleteRecommendationForProduct(adviceRecommendations);
		String assetLevelXml = FiinfraUtility.getAssetLevelXML(adviceRecommendations);
		return goalPlanDao.insertOrUpdateRecommendationForProduct(assetLevelXml);
	}

	@Override
	public boolean deleteRecommendationForProductCategory(String FPAdviceRecommendId) {
		
		StringTokenizer tokenizer = new StringTokenizer(FPAdviceRecommendId, ",");
		Integer count = tokenizer.countTokens();
		for (int i = 0; i < count; i++) {
			goalPlanDao.deleteRecommendationForProductCategory(Integer.parseInt(tokenizer.nextToken()));
		}
		return true; 
	}

	@Override
	public List<ProductCommension> getCommensionForProductId(
			GoalPlanInput goalPlanInput) {
		
		return goalPlanDao.getCommensionForProductId(goalPlanInput);
	}

	@Override
	public boolean resetGoalPlanData(String fpSectionTypeId, String partyId) {
		return goalPlanDao.resetGoalPlanData(fpSectionTypeId, partyId);
	}

	@Override
	public List<AdviceRecommendation> getGoalBucketProductAllocations(GoalPlanInput goalPlanInput) {
		
		return goalPlanDao.getGoalBucketProductAllocations(goalPlanInput);
	}

	@Override
	public List<AdviceRecommendation> getEditGoalBucketProductAllocation(GoalPlanInput goalPlanInput) {
		
		return goalPlanDao.getEditGoalBucketProductAllocation(goalPlanInput);
	}

	@Override
	public List<KeyValue> getProductsForEditGoalBucketAllocation(Integer assetClassId, Integer productTypeId, Integer categoryId,String productData) {
		
		return goalPlanDao.getProductsForEditGoalBucketAllocation(assetClassId, productTypeId, categoryId, productData);
	}
	
	@Override
	public boolean resetGoalBucketData(String riskProfileId,String goalYearRangeId, String partyId) {
		
		goalPlanDao.resetGoalBucketData(riskProfileId, goalYearRangeId, partyId);
		return true;
	}

	@Override
	public boolean insertOrUpdateGoalBucketAllocation(List<AdviceRecommendation> adviceRecommendations) {
		
		String goalPlanXml = FiinfraUtility.getGoalBucketXml(adviceRecommendations);
		goalPlanDao.insertOrUpdateGoalBucketAllocation(goalPlanXml);
		return true;
	}

	@Override
	public List<KeyValue> getAllProductsName(Integer assetClassId,
			Integer productTypeId, Integer categoryId, String productData) {
		return goalPlanDao.getAllProductsName(assetClassId, productTypeId, categoryId, productData);
	}
}
