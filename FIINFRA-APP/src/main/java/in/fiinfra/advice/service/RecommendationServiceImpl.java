package in.fiinfra.advice.service;

import in.fiinfra.advice.dao.RecommendationDao;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.util.FiinfraUtility;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("recommendationService")
public class RecommendationServiceImpl implements RecommendationService {
	
	@Autowired
	RecommendationDao recommendationDao;
	
	@Override
	public List<KeyValue> getProductCategory(Integer ProductTypeId) {
		
		return recommendationDao.getProductCategory(ProductTypeId);
	}

	@Override
	public List<KeyValue> getProductCompanyName(Integer categoryId) {
		
		return recommendationDao.getProductCompanyName(categoryId);
	}

	@Override
	public List<KeyValue> getProductsForCategory(Integer categoryId,
			Integer manufacturedId) {
		
		return recommendationDao.getProductsForCategory(categoryId, manufacturedId);
	}

	@Override
	public List<AdviceRecommendation> getRecommendations(GoalPlanInput goalPlanInput) {
		
		List<AdviceRecommendation> adviceRecommendations = new ArrayList<AdviceRecommendation>();
		adviceRecommendations = recommendationDao.getRecommendations(goalPlanInput);
		/*List<String> productTypeName = recommendationDao.getProductTypes(adviceRecommendations.get(0).getSectionTypeId(),adviceRecommendations.get(0).getAssetClassId());
		adviceRecommendations.get(0).setProductTypeNames(productTypeName);*/
		return adviceRecommendations;
	}

	@Override
	public Boolean insertOrUpdateAdviceRecommendation(List<AdviceRecommendation> adviceRecommendations) {
		
		if( !adviceRecommendations.isEmpty() ) {
			String assetLevelXml = FiinfraUtility.getAssetLevelXML(adviceRecommendations);
			recommendationDao.insertOrUpdateAdviceRecommendation(assetLevelXml);
		}
		return true;
	}

	@Override
	public Boolean insertOrUpdateAdviceRecommendationForLifeRiskCover(List<AdviceRecommendation> adviceRecommendations) {
		
		if( !adviceRecommendations.isEmpty() ) {
			String assetLevelXml = FiinfraUtility.getAssetLevelXML(adviceRecommendations);
			recommendationDao.insertOrUpdateAdviceRecommendationForLifeRiskCover(assetLevelXml);
		}
		return true;
	}

	@Override
	public Boolean insertOrUpdateAdviceRecommendationForGeneralRiskCover(List<AdviceRecommendation> adviceRecommendations) {
		
		if( !adviceRecommendations.isEmpty() ) {
			String assetLevelXml = FiinfraUtility.getAssetLevelXML(adviceRecommendations);
			recommendationDao.insertOrUpdateAdviceRecommendationForGeneralRiskCover(assetLevelXml);
		}
		return true;
	}
	
	 @Override
	 public Boolean RiskCoverSetDefault(String fpSectionTypeId,String productTypeId, String CategoryId, String partyId) {

	  recommendationDao.RiskCoverSetDefault(fpSectionTypeId,productTypeId,CategoryId,partyId);
	  return true;
	 }
	
}
