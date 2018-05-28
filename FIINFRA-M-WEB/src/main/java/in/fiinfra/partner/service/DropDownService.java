/**
 * 
 */
package in.fiinfra.partner.service;

import in.fiinfra.common.partner.AssetAvailableValue;
import in.fiinfra.common.util.JsonData;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

/**
 * @author Kunal
 *
 */
@Component
public interface DropDownService {

	public List<JsonData> getProductCategoryList(HttpServletRequest request,Integer vacationId);
	public List<JsonData> getProductCategoryList(Integer productTypeId);
	public List<JsonData> getCompanynameList(HttpServletRequest request, Integer categoryId);
	public String getCommisssionValues(HttpServletRequest request,String username);
	public List<JsonData> getProductNamesList(HttpServletRequest request);
	public List<JsonData> getProductNamesList(HttpServletRequest request,String productData,String assetClassId,String productTypeId,String categoryId,String userName);
	public List<JsonData> getProductCategoryListForRiskCover(HttpServletRequest request,Integer ProductTypeId,String username);
	public List<JsonData> getCompanynameListForRiskCover(HttpServletRequest request,Integer categoryId,String username);
	public List<JsonData> getProductNamesListForRiskCover(HttpServletRequest request,String username);
	public List<JsonData> getProductNamesListForRiskCover(Integer riskId,String dataFor,String userName);
	public String deleteRecommendationForProductCategory(HttpServletRequest request,String username);
	public List<JsonData> getAssetTypeList(String userName);
	public List<JsonData> getAssetNameList(String userName,Integer assetTypeId,Integer partyId, Integer goalId);
	public AssetAvailableValue getAssetAvailableValue(String userName,Integer partyAssetId, Integer goalId, Integer partyId);
	public List<JsonData> getFamilyMembersList(String partyId, String userName);
	public List<JsonData> getAllProductNamesList(HttpServletRequest request,
			String productData, String assetClassId, String productTypeId,
			String categoryId, String userName);
}
