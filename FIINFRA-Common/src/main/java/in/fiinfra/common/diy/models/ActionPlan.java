package in.fiinfra.common.diy.models;

import java.util.List;
import java.util.Map;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

public class ActionPlan {
	
	@JsonProperty
	private String targetAmount;
	@JsonProperty
	private String lumpSum;
	@JsonProperty
	private String sip;
	@JsonProperty
	private Integer goalYear;
	@JsonProperty
	private String goalCompletion;
	@JsonProperty
	private Integer goalId;
	@JsonProperty
	private String goalTypeName;
	@JsonProperty
	private String goalName;
	
	@JsonProperty
	private String name;
	@JsonProperty
	private Float allocationPercent;
	
	@JsonProperty
	private Double productAmount;
	@JsonProperty
	private String productName;
	@JsonProperty
	private Integer productId;
	@JsonProperty
	private Integer fpAdviseId;
	@JsonProperty
	private Integer assetClassId;
	@JsonProperty
	private Integer goalTypeId;
	@JsonProperty
	private Integer partyId;
	@JsonProperty
	private Integer productTypeId;
	@JsonProperty
	private Integer categoryId;
	@JsonProperty
	private String productTypeName;
	@JsonProperty
	private Float recommendPercent;
	@JsonProperty
	private Integer actionApprovalId;
	@JsonProperty
	private String goalFrequencyName;
	@JsonProperty
	private String minLumpSumAmount;
	@JsonProperty
	private String minSipAmount;
	@JsonProperty
	private Integer investmentType;
	@JsonProperty
	private Integer dataFrom;
	
	public Integer getInvestmentType() {
		return investmentType;
	}
	public void setInvestmentType(Integer investmentType) {
		this.investmentType = investmentType;
	}
	public Integer getDataFrom() {
		return dataFrom;
	}
	public void setDataFrom(Integer dataFrom) {
		this.dataFrom = dataFrom;
	}
	public String getMinLumpSumAmount() {
		return minLumpSumAmount;
	}
	public void setMinLumpSumAmount(String minLumpSumAmount) {
		this.minLumpSumAmount = minLumpSumAmount;
	}
	public String getMinSipAmount() {
		return minSipAmount;
	}
	public void setMinSipAmount(String minSipAmount) {
		this.minSipAmount = minSipAmount;
	}
	public String getGoalFrequencyName() {
		return goalFrequencyName;
	}
	public void setGoalFrequencyName(String goalFrequencyName) {
		this.goalFrequencyName = goalFrequencyName;
	}
	public String getGoalTypeName() {
		return goalTypeName;
	}
	public void setGoalTypeName(String goalTypeName) {
		this.goalTypeName = goalTypeName;
	}
	public String getGoalName() {
		return goalName;
	}
	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}
	public Integer getActionApprovalId() {
		return actionApprovalId;
	}
	public void setActionApprovalId(Integer actionApprovalId) {
		this.actionApprovalId = actionApprovalId;
	}
	public Double getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(Double productAmount) {
		this.productAmount = productAmount;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Float getAllocationPercent() {
		return allocationPercent;
	}
	public void setAllocationPercent(Float allocationPercent) {
		this.allocationPercent = allocationPercent;
	}

	public String getTargetAmount() {
		return targetAmount;
	}

	public void setTargetAmount(String targetAmount) {
		this.targetAmount = targetAmount;
	}

	public String getLumpSum() {
		return lumpSum;
	}

	public void setLumpSum(String lumpSum) {
		this.lumpSum = lumpSum;
	}

	public String getSip() {
		return sip;
	}

	public void setSip(String sip) {
		this.sip = sip;
	}

	public Integer getGoalYear() {
		return goalYear;
	}
	
	public void setGoalYear(Integer goalYear) {
		this.goalYear = goalYear;
	}

	public String getGoalCompletion() {
		return goalCompletion;
	}

	public void setGoalCompletion(String goalCompletion) {
		this.goalCompletion = goalCompletion;
	}
	
	public Integer getGoalId() {
		return goalId;
	}

	public void setGoalId(Integer goalId) {
		this.goalId = goalId;
	}

	public Integer getProductId() {
		return productId;
	}
	
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	public Integer getFpAdviseId() {
		return fpAdviseId;
	}
	public void setFpAdviseId(Integer fpAdviseId) {
		this.fpAdviseId = fpAdviseId;
	}
	
	public Integer getAssetClassId() {
		return assetClassId;
	}
	
	public void setAssetClassId(Integer assetClassId) {
		this.assetClassId = assetClassId;
	}
	
	public Integer getGoalTypeId() {
		return goalTypeId;
	}
	public void setGoalTypeId(Integer goalTypeId) {
		this.goalTypeId = goalTypeId;
	}
	
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
//	@Override
//	public String toString() 
//	{
//		return new ReflectionToStringBuilder(this).toString();
//	}
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
	public String getProductTypeName() {
		return productTypeName;
	}
	public void setProductTypeName(String productTypeName) {
		this.productTypeName = productTypeName;
	}
	public Float getRecommendPercent() {
		return recommendPercent;
	}
	public void setRecommendPercent(Float recommendPercent) {
		this.recommendPercent = recommendPercent;
	}
}
