package in.fiinfra.common.diy.models;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author MWX-21
 *
 */
/**
 * @author MWX-21
 *
 */
public class GoalPlanInput {
	
	@JsonProperty
	private Integer sectionTypeId;
	@JsonProperty
	private Integer clientPartyId;
	@JsonProperty
	private Integer partnerPartyId;
	@JsonProperty
	private Integer buPartyId;
	@JsonProperty
	private String assetClassId;
	@JsonProperty
	private Integer assetId;
	@JsonProperty
	private Integer goalYearRangeId;
	@JsonProperty
	private Integer riskProfileId;
	@JsonProperty
	private Integer recordTypeId;
	@JsonProperty
	private Integer categoryId;
	@JsonProperty
	private Integer recommendationRecordTypeId;
	@JsonProperty
	private Integer productId;
	@JsonProperty
	private Integer productTypeId;
	@JsonProperty
	private String riskProfileIds;
	@JsonProperty
	private String categoryIds;
	
	private String goalYearRangeName;
	private String allocationPercent;
	private String assetClassName;
	
	public String getGoalYearRangeName() {
		return goalYearRangeName;
	}
	public void setGoalYearRangeName(String goalYearRangeName) {
		this.goalYearRangeName = goalYearRangeName;
	}
	public String getAllocationPercent() {
		return allocationPercent;
	}
	public void setAllocationPercent(String allocationPercent) {
		this.allocationPercent = allocationPercent;
	}
	public String getAssetClassName() {
		return assetClassName;
	}
	public void setAssetClassName(String assetClassName) {
		this.assetClassName = assetClassName;
	}
	public String getCategoryIds() {
		return categoryIds;
	}
	public void setCategoryIds(String categoryIds) {
		this.categoryIds = categoryIds;
	}
	public String getRiskProfileIds() {
		return riskProfileIds;
	}
	public void setRiskProfileIds(String riskProfileIds) {
		this.riskProfileIds = riskProfileIds;
	}
	public Integer getSectionTypeId() {
		return sectionTypeId;
	}
	public void setSectionTypeId(Integer sectionTypeId) {
		this.sectionTypeId = sectionTypeId;
	}
	public Integer getClientPartyId() {
		return clientPartyId;
	}
	public void setClientPartyId(Integer clientPartyId) {
		this.clientPartyId = clientPartyId;
	}
	public Integer getPartnerPartyId() {
		return partnerPartyId;
	}
	public void setPartnerPartyId(Integer partnerPartyId) {
		this.partnerPartyId = partnerPartyId;
	}
	public Integer getBuPartyId() {
		return buPartyId;
	}
	public void setBuPartyId(Integer buPartyId) {
		this.buPartyId = buPartyId;
	}
	public String getAssetClassId() {
		return assetClassId;
	}
	public void setAssetClassId(String assetClassId) {
		this.assetClassId = assetClassId;
	}
	public Integer getGoalYearRangeId() {
		return goalYearRangeId;
	}
	public void setGoalYearRangeId(Integer goalYearRangeId) {
		this.goalYearRangeId = goalYearRangeId;
	}
	public Integer getRiskProfileId() {
		return riskProfileId;
	}
	public void setRiskProfileId(Integer riskProfileId) {
		this.riskProfileId = riskProfileId;
	}
	public Integer getRecordTypeId() {
		return recordTypeId;
	}
	public void setRecordTypeId(Integer recordTypeId) {
		this.recordTypeId = recordTypeId;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getRecommendationRecordTypeId() {
		return recommendationRecordTypeId;
	}
	public void setRecommendationRecordTypeId(Integer recommendationRecordTypeId) {
		this.recommendationRecordTypeId = recommendationRecordTypeId;
	}
	public Integer getAssetId() {
		return assetId;
	}
	public void setAssetId(Integer assetId) {
		this.assetId = assetId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getProductTypeId() {
		return productTypeId;
	}
	public void setProductTypeId(Integer productTypeId) {
		this.productTypeId = productTypeId;
	}
//	@Override
//	public String toString() {
//		return new ReflectionToStringBuilder(this).toString();
//	}
}