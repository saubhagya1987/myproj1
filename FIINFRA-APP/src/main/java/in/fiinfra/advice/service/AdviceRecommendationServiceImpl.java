package in.fiinfra.advice.service;

import in.fiinfra.advice.dao.AdviceRecommendationDao;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adviceRecommendationService")
public class AdviceRecommendationServiceImpl implements AdviceRecommendationService {
	
	@Autowired
	AdviceRecommendationDao adviceRecommendationDao;

	// getProductCategoriesForProductId
	@Override
	public List<KeyValue> getProductCategoriesForProductId(Integer typeId) 
	{
		return adviceRecommendationDao.getProductCategoriesForProductId(typeId);
	}

	//getCompaniesForProductCategory
	@Override
	public List<KeyValue> getCompaniesForProductCategory(Integer categoryId) 
	{
		return adviceRecommendationDao.getCompaniesForProductCategory(categoryId);
	}

	//getProductsForCategoryAndManufacturer
	@Override
	public List<KeyValue> getProductsForCategoryAndManufacturer(Integer manufacturedId,
			Integer categoryId) 
	{
		return adviceRecommendationDao.getProductsForCategoryAndManufacturer(manufacturedId, categoryId);
	}
	
	@Override
	public Integer getManufacturerIdForCategoryId(Integer categoryId, Integer productId) {
		
		return adviceRecommendationDao.getManufacturerIdForCategoryId(categoryId, productId);
	}

	@Override
	public boolean saveAdviceRecommendation(
			List<AdviceRecommendation> adviceRecommendations) {
		
		if(CollectionUtils.isNotEmpty(adviceRecommendations))
		{
			Integer sectionTypeid = adviceRecommendations.get(0).getSectionTypeId();
			Integer partyId = adviceRecommendations.get(0).getPartyId();
			adviceRecommendationDao.deleteAdviceRecommendations(partyId, sectionTypeid);
			
			for (AdviceRecommendation adviceRecommendation : adviceRecommendations) 
			{
				adviceRecommendationDao.insertOrUpdateAdviceRecommendation(adviceRecommendation);
			}
			return true;
		}
		return true;
	}

	@Override
	public List<AdviceRecommendation> getAdviceRecommendations(GoalPlanInput goalPlanInput) {
		List<AdviceRecommendation> recommendations;

		recommendations =  adviceRecommendationDao.getAdviceRecommendations(goalPlanInput);
		for (AdviceRecommendation recommendation : recommendations) {
			if( recommendation.getCategoryId() == null ) {
				recommendation.setProductId(null);
				recommendation.setManufacturerId(null);
			}
			else if( recommendation.getManufacturerId() == null ) {
				recommendation.setProductId(null);
			}
		}
		return recommendations;
	}
}
