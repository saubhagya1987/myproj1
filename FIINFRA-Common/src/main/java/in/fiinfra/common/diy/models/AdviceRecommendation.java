package in.fiinfra.common.diy.models;

import java.io.Serializable;
import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author MWX-21
 *
 */
/**
 * @author MWX-21
 *
 */
/**
 * @author MWX-21
 *
 */
@JsonIgnoreProperties(ignoreUnknown=true)
public class AdviceRecommendation implements Serializable 
{	
	@JsonProperty
	private String id;
	@JsonProperty
	private Integer recordTypeId;
	@JsonProperty
	private Integer partyId;
	@JsonProperty
	private Integer buPartyId;
	@JsonProperty
	private Integer sectionTypeId;
	@JsonProperty
	private Integer riskProfileId;
	@JsonProperty
	private Integer goalYearRangeId;
	@JsonProperty
	private String goalYearRange;
	@JsonProperty
	private Integer assetClassId;
	@JsonProperty
	private Integer productTypeId;
	@JsonProperty
	private String productTypeName;
	@JsonProperty
	private Integer categoryId;
	@JsonProperty
	private Integer subCategoryId;
	@JsonProperty
	private Integer productId;
	@JsonProperty
	private Integer allocationPercent;
	@JsonProperty
	private Double allocationPercentAssetClass;
	@JsonProperty
	private Double allocationPercentProductType;
	@JsonProperty
	private Double allocationPercentCategoryId;
	@JsonProperty
	private Double allocationPercentProductId;
	@JsonProperty
	private String productText;
	@JsonProperty
	private Integer seqNo;
	@JsonProperty
	private Integer parentFPAdviseRecommendID;
	@JsonProperty
	private Integer createdBy;
	@JsonProperty
	private Boolean	preferredProduct;
	@JsonProperty
	private Integer manufacturerId;
	@JsonProperty
	private Long  allocationStartRangeValue;
	@JsonProperty
	private Long allocationEndRangeValue;
	@JsonProperty
	private List<KeyValue> categoryIds;
	@JsonProperty
	private List<KeyValue> manufacturerIds;
	@JsonProperty
	private List<KeyValue> productIds;
	@JsonProperty
	private List<KeyValue> productTypeIds;
	@JsonProperty
	private String productCategoryList;
	@JsonProperty
	private Integer countOfProductTypes;
	@JsonProperty
	private Integer countOfProductCategory;
	@JsonProperty
	private Integer recommendationRecordTypeId;
	@JsonProperty
	private Integer ispreferredProduct;
	@JsonProperty
	private List<ProductCommension> productCommensions;
	@JsonProperty
	private List<String> productTypeNames;
	@JsonProperty
	private String assetName;
	@JsonProperty
	private String categoryName;
	@JsonProperty
	private String productName;
	@JsonIgnore
	@JsonProperty
	private String sectionTypeName;
	@JsonIgnore
	@JsonProperty
	private String riskProfile;
	@JsonIgnore
	@JsonProperty
	private String isCustom;
	@JsonIgnore
	@JsonProperty
	private String isPreferred;
	
	public String getIsPreferred() {
		return isPreferred;
	}
	public void setIsPreferred(String isPreferred) {
		this.isPreferred = isPreferred;
	}
	public String getSectionTypeName() {
		return sectionTypeName;
	}
	public void setSectionTypeName(String SectionTypeName) {
		this.sectionTypeName = SectionTypeName;
	}
	public String getRiskProfile() {
		return riskProfile;
	}
	public void setRiskProfile(String riskProfile) {
		this.riskProfile = riskProfile;
	}
	public String getIsCustom() {
		return isCustom;
	}
	public void setIsCustom(String isCustom) {
		this.isCustom = isCustom;
	}
	public String getAssetName() {
		return assetName;
	}
	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getAllocationPercentAssetClass() {
		return allocationPercentAssetClass;
	}
	public void setAllocationPercentAssetClass(Double allocationPercentAssetClass) {
		this.allocationPercentAssetClass = allocationPercentAssetClass;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getRecordTypeId() {
		return recordTypeId;
	}
	public void setRecordTypeId(Integer recordTypeId) {
		this.recordTypeId = recordTypeId;
	}
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	public Integer getSectionTypeId() {
		return sectionTypeId;
	}
	public void setSectionTypeId(Integer sectionTypeId) {
		this.sectionTypeId = sectionTypeId;
	}
	public Integer getRiskProfileId() {
		return riskProfileId;
	}
	public void setRiskProfileId(Integer riskProfileId) {
		this.riskProfileId = riskProfileId;
	}
	public Integer getGoalYearRangeId() {
		return goalYearRangeId;
	}
	public void setGoalYearRangeId(Integer goalYearRangeId) {
		this.goalYearRangeId = goalYearRangeId;
	}
	public String getGoalYearRange() {
		return goalYearRange;
	}
	public void setGoalYearRange(String goalYearRange) {
		this.goalYearRange = goalYearRange;
	}
	public Integer getAssetClassId() {
		return assetClassId;
	}
	public void setAssetClassId(Integer assetClassId) {
		this.assetClassId = assetClassId;
	}
	public Integer getProductTypeId() {
		return productTypeId;
	}
	public void setProductTypeId(Integer productTypeId) {
		this.productTypeId = productTypeId;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getSubCategoryId() {
		return subCategoryId;
	}
	public void setSubCategoryId(Integer subCategoryId) {
		this.subCategoryId = subCategoryId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getAllocationPercent() {
		return allocationPercent;
	}
	public void setAllocationPercent(Integer allocationPercent) {
		this.allocationPercent = allocationPercent;
	}
	public String getProductText() {
		return productText;
	}
	public void setProductText(String productText) {
		this.productText = productText;
	}
	public Integer getSeqNo() {
		return seqNo;
	}
	public void setSeqNo(Integer seqNo) {
		this.seqNo = seqNo;
	}
	public Integer getParentFPAdviseRecommendID() {
		return parentFPAdviseRecommendID;
	}
	public void setParentFPAdviseRecommendID(Integer parentFPAdviseRecommendID) {
		this.parentFPAdviseRecommendID = parentFPAdviseRecommendID;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public Boolean getPreferredProduct() {
		return preferredProduct;
	}
	public void setPreferredProduct(Boolean preferredProduct) {
		this.preferredProduct = preferredProduct;
	}
	public Long getAllocationStartRangeValue() {
		return allocationStartRangeValue;
	}
	public void setAllocationStartRangeValue(Long allocationStartRangeValue) {
		this.allocationStartRangeValue = allocationStartRangeValue;
	}
	public Long getAllocationEndRangeValue() {
		return allocationEndRangeValue;
	}
	public void setAllocationEndRangeValue(Long allocationEndRangeValue) {
		this.allocationEndRangeValue = allocationEndRangeValue;
	}
	public List<KeyValue> getCategoryIds() {
		return categoryIds;
	}
	public void setCategoryIds(List<KeyValue> categoryIds) {
		this.categoryIds = categoryIds;
	}
	public List<KeyValue> getManufacturerIds() {
		return manufacturerIds;
	}
	public void setManufacturerIds(List<KeyValue> manufacturerIds) {
		this.manufacturerIds = manufacturerIds;
	}
	public List<KeyValue> getProductIds() {
		return productIds;
	}
	public void setProductIds(List<KeyValue> productIds) {
		this.productIds = productIds;
	}
	public List<KeyValue> getProductTypeIds() {
		return productTypeIds;
	}
	public void setProductTypeIds(List<KeyValue> productTypeIds) {
		this.productTypeIds = productTypeIds;
	}
	public Integer getCountOfProductTypes() {
		return countOfProductTypes;
	}
	public void setCountOfProductTypes(Integer countOfProductTypes) {
		this.countOfProductTypes = countOfProductTypes;
	}
	public Integer getCountOfProductCategory() {
		return countOfProductCategory;
	}
	public void setCountOfProductCategory(Integer countOfProductCategory) {
		this.countOfProductCategory = countOfProductCategory;
	}
	public Integer getManufacturerId() {
		return manufacturerId;
	}
	public void setManufacturerId(Integer manufacturerId) {
		this.manufacturerId = manufacturerId;
	}
	public Integer getRecommendationRecordTypeId() {
		return recommendationRecordTypeId;
	}
	public void setRecommendationRecordTypeId(Integer recommendationRecordTypeId) {
		this.recommendationRecordTypeId = recommendationRecordTypeId;
	}
	public Integer getIspreferredProduct() {
		return ispreferredProduct;
	}
	public void setIspreferredProduct(Integer ispreferredProduct) {
		this.ispreferredProduct = ispreferredProduct;
	}
	public String getProductTypeName() {
		return productTypeName;
	}
	public void setProductTypeName(String productTypeName) {
		this.productTypeName = productTypeName;
	}
	public List<ProductCommension> getProductCommensions() {
		return productCommensions;
	}
	public void setProductCommensions(List<ProductCommension> productCommensions) {
		this.productCommensions = productCommensions;
	}
	public Double getAllocationPercentProductType() {
		return allocationPercentProductType;
	}
	public void setAllocationPercentProductType(Double allocationPercentProductType) {
		this.allocationPercentProductType = allocationPercentProductType;
	}
	public Double getAllocationPercentCategoryId() {
		return allocationPercentCategoryId;
	}
	public void setAllocationPercentCategoryId(Double allocationPercentCategoryId) {
		this.allocationPercentCategoryId = allocationPercentCategoryId;
	}
	public Double getAllocationPercentProductId() {
		return allocationPercentProductId;
	}
	public void setAllocationPercentProductId(Double allocationPercentProductId) {
		this.allocationPercentProductId = allocationPercentProductId;
	}
	public List<String> getProductTypeNames() {
		return productTypeNames;
	}
	public void setProductTypeNames(List<String> productTypeNames) {
		this.productTypeNames = productTypeNames;
	}
	public Integer getBuPartyId() {
		return buPartyId;
	}
	public void setBuPartyId(Integer buPartyId) {
		this.buPartyId = buPartyId;
	}
	public String getProductCategoryList() {
		return productCategoryList;
	}
	public void setProductCategoryList(String productCategoryList) {
		this.productCategoryList = productCategoryList;
	}
//	@Override
//	public String toString() 
//	{
//		return new ReflectionToStringBuilder(this).toString();
//	}
}
