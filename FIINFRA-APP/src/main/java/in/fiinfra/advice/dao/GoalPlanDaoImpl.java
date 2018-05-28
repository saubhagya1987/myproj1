 package in.fiinfra.advice.dao;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductCommension;
import in.fiinfra.common.util.CommonStoredProcedure;

import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("goalPlanDao")
public class GoalPlanDaoImpl implements GoalPlanDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private static final String SP_GET_RECOMMENDATION_FOR_ASSET = "{CALL usp_DIY_getRecommendationForAsset(?,?,?,?,?,?,?)}";
	private static final String SP_GET_PRODUCT_RECOMMENDATION_FOR_PRODUCT_TYPE = "{CALL usp_DIY_getRecommendationForProductType(?,?,?,?,?,?,?,?)}";
	private static final String SP_GET_RECOMMENDATION_FOR_PRODUCT_CATEGORY = "{CALL usp_DIY_getRecommendationForProductCategory(?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_INSERT_OR_UPDATE_RECOMMENDATION_FOR_ASSET = "{CALL usp_DIY_insertOrUpdateRecommendationForAsset(?)}";
	private static final String SP_INSERT_OR_UPDATE_RECOMMENDATION_FOR_PRODUCT_CATEGORY = "{CALL usp_DIY_insertOrUpdateRecommendationForProductCategory(?)}";
	private static final String SP_GET_COUNT_OF_PRODUCT_TYPES_FOR_ASSET = "{CALL usp_DIY_getCountOfProductTypeForAsset(?,?,?,?,?)}";
	private static final String SP_GET_COUNT_OF_PRODUCT_CATEGORIES_FOR_ASSET = "{CALL usp_DIY_getCountOfProductCategoriesForAsset(?,?,?,?,?,?)}";
	private static final String SP_DELETE_RECOMMENDATION_FOR_ASSET = "{CALL usp_DIY_deleteRecommendationForAsset(?)}";
	private static final String SP_GET_PRODUCT_CATEGORIES = "{CALL usp_DIY_getProductCategoriesForProductId(?,?)}";
	private static final String SP_GET_COMPANY_NAME = "{CALL usp_DIY_getCompanyName(?)}";
	private static final String SP_GET_MANUFACTURERID_FOR_CATEGORY_ID = "{CALL usp_DIY_getManufacturerIdForCategoryId(?,?)}";
	private static final String SP_GET_PRODUCT_NAME = "{CALL usp_DIY_getProductName(?,?)}";
	private static final String SP_INSERT_OR_UPDATE_RECOMMENDATION_FOR_PRODUCT = "{CALL usp_DIY_insertOrUpdateRecommendationForProduct(?)}";
	private static final String SP_GET_PRODUCT_TYPE_FOR_ASSET_ID = "{CALL usp_DIY_getProductTypeForAssetId(?,?,?,?)}";
	private static final String SP_GET_COMMENSIONS_FOR_PRODUCT = "{CALL usp_DIY_getCommenstionsForProductId(?,?,?,?,?)}";
	private static final String SP_DELETE_RECOMMENDATION_FOR_PRODUCT_TYPE = "{CALL usp_DIY_deleteRecommendationForProductType(?,?,?,?,?,?,?)}";
	private static final String SP_DELETE_RECOMMENDATION_FOR_PRODUCT = "{CALL usp_DIY_deleteRecommendationForProduct(?,?,?,?,?,?,?,?)}";
	private static final String SP_INSERT_OR_UPDATE_RECOMMENDATION_FOR_PRODYCT_TYPE_ID = "{CALL usp_DIY_insertOrUpdateRecommendationForProductType(?)}";
	private static final String SP_RESET_GOAL_PLAN_DATA = "{CALL usp_DIY_deleteAdviceRecommendationsForpartyId(?,?)}";
	private static final String SP_GET_GOAL_BUCKET_PRODUCT_ALLOCATIONS="{CALL usp_DIY_getGoalBucketProductAllocations(?,?,?,?,?)}";
	private static final String SP_GET_EDIT_GOAL_BUCKET_PRODUCT_ALLOCATIONS="{CALL usp_DIY_getEditGoalBucketProductAllocations(?,?,?,?)}";
	private static final String SP_GET_PRODUCTS_FOR_GOAL_BUCKET_ALLOCATION="{CALL usp_DIY_getProductsForEditGoalBucketAllocation(?,?,?,?)}";
	private static final String SP_SET_DEFAULT_GOAL_BUCKET_DATA="{CALL usp_DIY_resetGoalBucketPlanData(?,?,?)}";
	private static final String SP_INSERT_OR_UPDATE_GOAL_BUCKET_ALLOCATION="{CALL usp_DIY_insertOrUpdateGoalPlanBucketAllocation(?)}";
	private static final String SP_GET_ALL_PRODUCTS="{CALL usp_DIY_getAllProducts(?,?,?,?)}";
	
	@Override
	public List<KeyValue> getProductCategoriesForProductId(Integer assetClassId,Integer typeId) {
		
		return jdbcTemplate.query(SP_GET_PRODUCT_CATEGORIES, new Object[] {assetClassId,typeId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}

	@Override
	public List<KeyValue> getCompaniesForProductCategory(Integer categoryId) {
		
		return jdbcTemplate.query(SP_GET_COMPANY_NAME, new Object[] {categoryId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}

	@Override
	public List<ProductCommension> getCommensionsForProductId( Integer buPartyId,Integer AssetClassId,Integer CategoryId,Integer ProductId, Integer ProductTypeId) {
		
		return jdbcTemplate.query(SP_GET_COMMENSIONS_FOR_PRODUCT, new Object[] {buPartyId,AssetClassId,CategoryId,ProductId,ProductTypeId}, new BeanPropertyRowMapper<ProductCommension>(ProductCommension.class));
	}

	@Override
	public Integer getManufacturerIdForCategoryId(Integer categoryId,
			Integer productId) {
		
		return jdbcTemplate.queryForObject(SP_GET_MANUFACTURERID_FOR_CATEGORY_ID, new Object[] {categoryId,productId}, Integer.class);
	}

	@Override
	public List<KeyValue> getProductsForCategoryAndManufacturer(
			Integer manufacturedId, Integer categoryId) {
		
		return jdbcTemplate.query(SP_GET_PRODUCT_NAME, new Object[] {manufacturedId,categoryId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}
	
	@Override
	public List<KeyValue> getProductTypesForAssetId(Integer assetId,Integer recommendationRecordTypeId, Integer riskProfileId, Integer goalYearRangeId) {
		
		return jdbcTemplate.query(SP_GET_PRODUCT_TYPE_FOR_ASSET_ID, new Object[] {assetId,recommendationRecordTypeId,riskProfileId,goalYearRangeId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}
	
	@Override
	public List<AdviceRecommendation> getRecommendationForAsset(GoalPlanInput goalPlanInput) 
	{
		return jdbcTemplate.query(SP_GET_RECOMMENDATION_FOR_ASSET, new Object[] {goalPlanInput.getSectionTypeId(),goalPlanInput.getClientPartyId(),goalPlanInput.getPartnerPartyId(),goalPlanInput.getBuPartyId(),
					goalPlanInput.getAssetClassId(),goalPlanInput.getRiskProfileId(),goalPlanInput.getRecommendationRecordTypeId()}, new BeanPropertyRowMapper<AdviceRecommendation>(AdviceRecommendation.class));
	}

	@Override
	public List<AdviceRecommendation> getRecommendationForProductType(GoalPlanInput goalPlanInput) {
		
		return jdbcTemplate.query(SP_GET_PRODUCT_RECOMMENDATION_FOR_PRODUCT_TYPE, new Object[] {goalPlanInput.getSectionTypeId(), goalPlanInput.getClientPartyId(),goalPlanInput.getPartnerPartyId(), goalPlanInput.getBuPartyId(),
					goalPlanInput.getAssetClassId(),goalPlanInput.getGoalYearRangeId(),goalPlanInput.getRiskProfileId(),goalPlanInput.getRecommendationRecordTypeId()}, new BeanPropertyRowMapper<AdviceRecommendation>(AdviceRecommendation.class));
	}

	@Override
	public List<AdviceRecommendation> getRecommendationForProductCategory(GoalPlanInput goalPlanInput) {
		
		return jdbcTemplate.query(SP_GET_RECOMMENDATION_FOR_PRODUCT_CATEGORY, new Object[] {goalPlanInput.getSectionTypeId(),goalPlanInput.getClientPartyId(),goalPlanInput.getPartnerPartyId(), goalPlanInput.getBuPartyId(),
					goalPlanInput.getAssetClassId(),goalPlanInput.getGoalYearRangeId(),goalPlanInput.getRiskProfileId(),goalPlanInput.getRecommendationRecordTypeId(),goalPlanInput.getCategoryId(),goalPlanInput.getProductTypeId()}, new BeanPropertyRowMapper<AdviceRecommendation>(AdviceRecommendation.class));
	}
	
	@Override
	public Integer getCountOfProductTypesForAsset(AdviceRecommendation recommendation) {		
		
		return jdbcTemplate.queryForObject(SP_GET_COUNT_OF_PRODUCT_TYPES_FOR_ASSET, new Object[] {recommendation.getPartyId(),recommendation.getAssetClassId(),
				recommendation.getGoalYearRangeId(),recommendation.getRiskProfileId(),recommendation.getRecommendationRecordTypeId()+2}, Integer.class);
	}

	@Override
	public Integer getCountOfProductCategoriesForAsset(AdviceRecommendation recommendation) {
		
		Integer recommendationRecordTypeId = 50005;
		return jdbcTemplate.queryForObject(SP_GET_COUNT_OF_PRODUCT_CATEGORIES_FOR_ASSET, new Object[] {recommendation.getPartyId(),
				recommendation.getAssetClassId(),recommendation.getGoalYearRangeId(),recommendation.getRiskProfileId(),recommendationRecordTypeId,recommendation.getCategoryId()}, Integer.class);
	}

	@Override
	public boolean insertOrUpdateRecommendationForAsset( String assetXml ) {
		
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_RECOMMENDATION_FOR_ASSET, new Object[] {assetXml});
		return true;
	}
	
	@Override
	public boolean insertOrUpdateRecommendationForProductTypeId(String assetXml) {
		
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_RECOMMENDATION_FOR_PRODYCT_TYPE_ID, new Object[] {assetXml});
		return true;
	}

	@Override
	public Integer insertOrUpdateRecommendationForProductCategory(String assetXml) {
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_insertOrUpdateRecommendationForProductCategory");
		SqlParameter Assetxml = new SqlParameter("Assetxml", Types.VARCHAR);
		SqlOutParameter ParentOutId = new SqlOutParameter("ParentOutId", Types.VARCHAR);
		
		SqlParameter[] param = {Assetxml, ParentOutId};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("Assetxml", assetXml);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		String Id =(String) storedProcedureResult.get("ParentOutId");
		Integer categoryId;
		if( Id == null || Id.isEmpty() ){
			categoryId = 0;
		}else {
			categoryId = Integer.parseInt(Id);
		}
		return categoryId;
	}

	@Override
	public boolean insertOrUpdateRecommendationForProduct(String assetXml) {
		
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_RECOMMENDATION_FOR_PRODUCT, new Object[] {assetXml});
		
		return true;
	}

	@Override
	public boolean deleteRecommendationForProductCategory(Integer FPAdviceRecommendId) {
		
		jdbcTemplate.update(SP_DELETE_RECOMMENDATION_FOR_ASSET, new Object[] {FPAdviceRecommendId});
		return true;
	}

	@Override
	public List<ProductCommension> getCommensionForProductId(GoalPlanInput goalPlanInput) {
		
		return jdbcTemplate.query(SP_GET_COMMENSIONS_FOR_PRODUCT, new Object[] {goalPlanInput.getBuPartyId(),goalPlanInput.getAssetClassId(),goalPlanInput.getCategoryId(),goalPlanInput.getProductId(),goalPlanInput.getProductTypeId()}, new BeanPropertyRowMapper<ProductCommension>(ProductCommension.class));
	}

	@Override
	public boolean deleteRecommendationForProductType(List<AdviceRecommendation> adviceRecommendations) {
		
		if( !adviceRecommendations.isEmpty() )
		{	
			AdviceRecommendation adviceRecommendation = adviceRecommendations.get(0);
			jdbcTemplate.update(SP_DELETE_RECOMMENDATION_FOR_PRODUCT_TYPE, new Object[] {adviceRecommendation.getAssetClassId(),adviceRecommendation.getRiskProfileId(),adviceRecommendation.getGoalYearRangeId(),adviceRecommendation.getPartyId(),
						adviceRecommendation.getSectionTypeId(),adviceRecommendation.getProductTypeId(),adviceRecommendation.getRecommendationRecordTypeId()});
			
		}	
		return true;
	}

	@Override
	public boolean deleteRecommendationForProduct(List<AdviceRecommendation> adviceRecommendations) {
		
		if( !adviceRecommendations.isEmpty() )
		{	
			AdviceRecommendation adviceRecommendation = adviceRecommendations.get(0);
			jdbcTemplate.update(SP_DELETE_RECOMMENDATION_FOR_PRODUCT, new Object[] {adviceRecommendation.getAssetClassId(),adviceRecommendation.getRiskProfileId(),adviceRecommendation.getGoalYearRangeId(),adviceRecommendation.getPartyId(),
						adviceRecommendation.getSectionTypeId(),adviceRecommendation.getProductTypeId(),adviceRecommendation.getCategoryId(),adviceRecommendation.getRecommendationRecordTypeId()});	
		}	
		return true;
	}

	@Override
	public boolean resetGoalPlanData(String fpSectionTypeId, String partyId) {
		jdbcTemplate.update(SP_RESET_GOAL_PLAN_DATA, new Object[] {
				partyId,fpSectionTypeId
		});
		return true;
	}

	@Override
	public List<AdviceRecommendation> getGoalBucketProductAllocations( GoalPlanInput goalPlanInput ) {
		
		return jdbcTemplate.query(SP_GET_GOAL_BUCKET_PRODUCT_ALLOCATIONS, new Object[] {goalPlanInput.getPartnerPartyId(),goalPlanInput.getBuPartyId(),
				goalPlanInput.getRiskProfileIds(),goalPlanInput.getGoalYearRangeId(),goalPlanInput.getAssetClassId()}, new BeanPropertyRowMapper<AdviceRecommendation>(AdviceRecommendation.class));
	}
	
	public List<AdviceRecommendation> getEditGoalBucketProductAllocation( GoalPlanInput goalPlanInput ){
		
		return jdbcTemplate.query(SP_GET_EDIT_GOAL_BUCKET_PRODUCT_ALLOCATIONS, new Object[] {goalPlanInput.getPartnerPartyId(),goalPlanInput.getBuPartyId(),
				goalPlanInput.getRiskProfileIds(),goalPlanInput.getGoalYearRangeId()}, new BeanPropertyRowMapper<AdviceRecommendation>(AdviceRecommendation.class));
	}

	@Override
	public List<KeyValue> getProductsForEditGoalBucketAllocation(Integer assetClassId, Integer productTypeId, Integer categoryId, String productData) {
		
		return jdbcTemplate.query(SP_GET_PRODUCTS_FOR_GOAL_BUCKET_ALLOCATION, new Object[] {assetClassId,productTypeId,categoryId,productData}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}
	
	@Override
	public boolean resetGoalBucketData(String riskProfileId,String goalYearRangeId, String partyId) {
		
		jdbcTemplate.update(SP_SET_DEFAULT_GOAL_BUCKET_DATA, new Object[] {riskProfileId,goalYearRangeId,partyId});
		return true;
	}

	@Override
	public boolean insertOrUpdateGoalBucketAllocation(String goalPlanXml) {
		
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_GOAL_BUCKET_ALLOCATION, new Object[] {goalPlanXml});
		return true;
	}
	@Override
	public List<KeyValue> getAllProductsName(Integer assetClassId,
			Integer productTypeId, Integer categoryId, String productData) {
		return jdbcTemplate.query(SP_GET_ALL_PRODUCTS, new Object[] {assetClassId,productTypeId,categoryId,productData}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}
}
