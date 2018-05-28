package in.fiinfra.advice.dao;

import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("adviceRecommendationDao")
public class AdviceRecommendationDaoImpl implements AdviceRecommendationDao {
	
	private static final String SP_GET_PRODUCT_CATEGORIES = "{CALL usp_DIY_getProductCategories(?)}";
	private static final String SP_GET_COMPANY_NAME = "{CALL usp_DIY_getCompanyName(?)}";
	private static final String SP_GET_MANUFACTURERID_FOR_CATEGORY_ID = "{CALL usp_DIY_getManufacturerIdForCategoryId(?,?)}";
	private static final String SP_GET_PRODUCT_NAME = "{CALL usp_DIY_getProductName(?,?)}";
	private static final String SP_INSERT_OR_UPDATE_ADVICE_RECOMMENDATIONS = "{CALL usp_DIY_insertOrUpdateAdviceRecommendation(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_GET_ADVICE_RECOMMENDATIONS = "{CALL usp_DIY_getAdviceRecommendations(?,?,?,?,?,?)}";
	private static final String SP_DELETE_ADVICE_RECOMMENDATION = "{CALL usp_DIY_deleteAdviceRecommendationsForpartyId(?,?)}";
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<KeyValue> getProductCategoriesForProductId(Integer typeId) {
		
		return jdbcTemplate.query(SP_GET_PRODUCT_CATEGORIES, new Object[] {typeId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class)); 
	}

	@Override
	public List<KeyValue> getCompaniesForProductCategory(Integer categoryId) {
		
		return jdbcTemplate.query(SP_GET_COMPANY_NAME, new Object[] {categoryId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}

	@Override
	public List<KeyValue> getProductsForCategoryAndManufacturer(Integer manufacturedId,Integer categoryId) {
		
		return jdbcTemplate.query(SP_GET_PRODUCT_NAME, new Object[] {manufacturedId,categoryId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}
	
	@Override
	public Integer getManufacturerIdForCategoryId(Integer categoryId, Integer productId) {
		
		return jdbcTemplate.queryForObject(SP_GET_MANUFACTURERID_FOR_CATEGORY_ID, new Object[] {categoryId,productId}, Integer.class);
	}

	@Override
	public boolean insertOrUpdateAdviceRecommendation(AdviceRecommendation adviceRecommendation) {
		
		Integer LastModifiedBy = adviceRecommendation.getCreatedBy();
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_ADVICE_RECOMMENDATIONS, new Object[] {adviceRecommendation.getId(), adviceRecommendation.getRecordTypeId(),adviceRecommendation.getPartyId(),adviceRecommendation.getSectionTypeId(),
					adviceRecommendation.getAssetClassId(), adviceRecommendation.getProductTypeId(), adviceRecommendation.getCategoryId(),adviceRecommendation.getProductId(),adviceRecommendation.getParentFPAdviseRecommendID(),adviceRecommendation.getSeqNo(),adviceRecommendation.getRecommendationRecordTypeId(),adviceRecommendation.getCreatedBy(),LastModifiedBy});
		return true;
	}
	
	@Override
	public boolean deleteAdviceRecommendations( Integer partyId, Integer sectionTypeId )
	{
		jdbcTemplate.update(SP_DELETE_ADVICE_RECOMMENDATION, new Object[] {partyId, sectionTypeId});
		return true;
	}
	
	@Override
	public List<AdviceRecommendation> getAdviceRecommendations(GoalPlanInput goalPlanInput) {
		// clientPartyId,patnerPartyId,buPartyId,fpSectionTypeId,productTypeId
		return jdbcTemplate.query(SP_GET_ADVICE_RECOMMENDATIONS, new Object[] {goalPlanInput.getClientPartyId(),goalPlanInput.getPartnerPartyId(),
					goalPlanInput.getBuPartyId(),goalPlanInput.getSectionTypeId(),goalPlanInput.getAssetClassId(),goalPlanInput.getProductTypeId()}, new BeanPropertyRowMapper<AdviceRecommendation>(AdviceRecommendation.class));
	}
}
