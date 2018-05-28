package in.fiinfra.advice.dao;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("recommendationDao")
public class RecommendationDaoImpl implements RecommendationDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private static final String SP_GET_PRODUCT_CATEGORY = "{CALL usp_DIY_getProductCategoryForPlanning(?)}";
	private static final String SP_GET_PRODUCT_COMPANY_NAME = "{CALL usp_DIY_getCompanyName(?)}";
	private static final String SP_GET_PRODUCTS_FOR_CATEGORY = "{CALL usp_DIY_getProductForCategoryAndManufacturer(?,?)}";
	private static final String SP_GET_RECOMMENDATIONS = "{CALL usp_DIY_getRecommendationsForEmergency(?,?,?,?,?)}";
	private static final String SP_GET_LIFERECOMMENDATIONS = "{CALL usp_DIY_getRecommendationsForLifeInsurance(?,?,?,?,?,?)}";
	private static final String SP_GET_GENERALRECOMMENDATIONS = "{CALL usp_DIY_getRecommendationsForGeneralInsurance(?,?,?,?,?,?,?)}";
	private static final String SP_INSERT_OR_UPDATE_RECOMMENDATIONS = "{CALL usp_DIY_insertOrUpdateRecommendationForEmergency(?)}";
	private static final String SP_DELETE_ADVICE_RECOMMENDATIONS_FOR_PARTYID_AND_FPSECTION_TYPE_ID = "{CALL usp_DIY_deleteAdviceRecommendationsForpartyId(?,?)}";
	private static final String SP_INSERT_OR_UPDATE_RECOMMENDATIONS_FOR_ASSET = "{CALL usp_DIY_insertOrUpdateRecommendationForAssetClassId(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_GET_PRODUCT_NAMES = "{CALL usp_DIY_getProductTypeName(?,?)}";
	private static final String SP_INSERT_OR_UPDATE_ADVICE_RECOMMENDATION_FOR_LIFE_RISK_COVER = "{CALL usp_DIY_insertOrUpdateRecommendationForLifeRiskCover(?)}";
	private static final String SP_INSERT_OR_UPDATE_ADVICE_RECOMMENDATION_FOR_GENERAL_RISK_COVER = "{CALL usp_DIY_insertOrUpdateRecommendationForGeneralRiskCover(?)}";
	private static final String SP_RISK_COVER_SET_DEFAULT  = "{CALL usp_DIY_riskCoverSetdefault(?,?,?,?)}";
	
	@Override
	public List<KeyValue> getProductCategory(Integer ProductTypeId) {
		
		return jdbcTemplate.query(SP_GET_PRODUCT_CATEGORY, new Object[] {ProductTypeId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));	
	}

	@Override
	public List<KeyValue> getProductCompanyName(Integer categoryId) {
		
		return jdbcTemplate.query(SP_GET_PRODUCT_COMPANY_NAME, new Object[] {categoryId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
		
	}

	@Override
	public List<KeyValue> getProductsForCategory(Integer categoryId,Integer manufacturedId) {
		
		return jdbcTemplate.query(SP_GET_PRODUCTS_FOR_CATEGORY, new Object[] {categoryId,manufacturedId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));		
	}

	@Override
	public List<AdviceRecommendation> getRecommendations(GoalPlanInput goalPlanInput) {
			
		if(null!=goalPlanInput.getProductTypeId() && null!=goalPlanInput.getCategoryId()){
			return jdbcTemplate.query(SP_GET_GENERALRECOMMENDATIONS, new Object[] {goalPlanInput.getSectionTypeId(),goalPlanInput.getClientPartyId(),goalPlanInput.getPartnerPartyId(),goalPlanInput.getBuPartyId(),goalPlanInput.getAssetClassId(),goalPlanInput.getProductTypeId(),goalPlanInput.getCategoryId()}, new BeanPropertyRowMapper<AdviceRecommendation>(AdviceRecommendation.class));
		}else if(null!=goalPlanInput.getProductTypeId()){
			return jdbcTemplate.query(SP_GET_LIFERECOMMENDATIONS, new Object[] {goalPlanInput.getSectionTypeId(),goalPlanInput.getClientPartyId(),goalPlanInput.getPartnerPartyId(),goalPlanInput.getBuPartyId(),goalPlanInput.getAssetClassId(),goalPlanInput.getProductTypeId()}, new BeanPropertyRowMapper<AdviceRecommendation>(AdviceRecommendation.class));
		}else{
			return jdbcTemplate.query(SP_GET_RECOMMENDATIONS, new Object[] {goalPlanInput.getSectionTypeId(),goalPlanInput.getClientPartyId(),goalPlanInput.getPartnerPartyId(),goalPlanInput.getBuPartyId(),goalPlanInput.getAssetClassId()}, new BeanPropertyRowMapper<AdviceRecommendation>(AdviceRecommendation.class));
		}		
	}

	
	@Override
	public boolean insertOrUpdateAdviceRecommendation(String assetLevelXml) {
		
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_RECOMMENDATIONS, new Object[] {assetLevelXml});
		return true;
	}

	@Override
	public boolean deleteAdviceRecommendation(Integer partyId,Integer sectionTypeId) {
		
		jdbcTemplate.update(SP_DELETE_ADVICE_RECOMMENDATIONS_FOR_PARTYID_AND_FPSECTION_TYPE_ID, new Object[] {partyId,sectionTypeId});
		return true;
	}

	@Override
	public boolean insertOrUpdateAdviceRecommendationFoAsset(AdviceRecommendation adviceRecommendation) {
		
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_RECOMMENDATIONS_FOR_ASSET, new Object[] {adviceRecommendation.getId(),adviceRecommendation.getRecordTypeId(),adviceRecommendation.getPartyId(),adviceRecommendation.getSectionTypeId(),adviceRecommendation.getAssetClassId(),
				adviceRecommendation.getProductTypeId(),adviceRecommendation.getCategoryId(),adviceRecommendation.getProductId(),adviceRecommendation.getAllocationPercentProductType(),adviceRecommendation.getAllocationPercentCategoryId(),adviceRecommendation.getAllocationPercentProductId(),
				adviceRecommendation.getSeqNo(),adviceRecommendation.getCreatedBy(),adviceRecommendation.getCreatedBy()});
		return false;
	}

	@Override
	public List<String> getProductTypes(Integer FPSectionTypeId,Integer assetClassId) {
		
		return jdbcTemplate.queryForList(SP_GET_PRODUCT_NAMES, new Object[] {FPSectionTypeId,assetClassId},String.class);
	}

	@Override
	public boolean insertOrUpdateAdviceRecommendationForLifeRiskCover(String assetLevelXml) {
		
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_ADVICE_RECOMMENDATION_FOR_LIFE_RISK_COVER, new Object[] {assetLevelXml});
		return true;
	}
	
	@Override
	public boolean insertOrUpdateAdviceRecommendationForGeneralRiskCover( String assetLevelXml ) {
		
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_ADVICE_RECOMMENDATION_FOR_GENERAL_RISK_COVER, new Object[] { assetLevelXml });
		return true;
	}
	
	@Override
	 public boolean RiskCoverSetDefault(String fpSectionTypeId,String productTypeId, String CategoryId, String partyId) {
	  
	  jdbcTemplate.update(SP_RISK_COVER_SET_DEFAULT, new Object[] {fpSectionTypeId,productTypeId,CategoryId,partyId});
	  return true;
	 }
	
}