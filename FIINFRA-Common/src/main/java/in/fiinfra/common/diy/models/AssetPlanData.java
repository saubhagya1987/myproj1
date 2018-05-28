package in.fiinfra.common.diy.models;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

public class AssetPlanData {
	
	@JsonProperty
	private String name;
	@JsonProperty
	private Float allocationPercent;
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
	private Integer assetClassId;
	@JsonProperty
	private Integer fpAdviseId;
	@JsonProperty
	private Integer productTypeId;
	@JsonProperty
	private String productTypeName;
	@JsonProperty
	private float recommendPercent;
	@JsonProperty
	private String goalTypeName;
	@JsonProperty
	private String goalName;
	@JsonProperty
	private String goalFrequencyName;
	@JsonProperty
	private Integer goalTypeId;
	@JsonProperty
	private Integer investmentType;
	
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
	public Integer getAssetClassId() {
		return assetClassId;
	}
	public void setAssetClassId(Integer assetClassId) {
		this.assetClassId = assetClassId;
	}
	public Integer getFpAdviseId() {
		return fpAdviseId;
	}
	public void setFpAdviseId(Integer fpAdviseId) {
		this.fpAdviseId = fpAdviseId;
	}
	public Integer getProductTypeId() {
		return productTypeId;
	}
	public void setProductTypeId(Integer productTypeId) {
		this.productTypeId = productTypeId;
	}
	public String getProductTypeName() {
		return productTypeName;
	}
	public void setProductTypeName(String productTypeName) {
		this.productTypeName = productTypeName;
	}
	public float getRecommendPercent() {
		return recommendPercent;
	}
	public void setRecommendPercent(float recommendPercent) {
		this.recommendPercent = recommendPercent;
	}
	public Integer getGoalTypeId() {
		return goalTypeId;
	}
	public void setGoalTypeId(Integer goalTypeId) {
		this.goalTypeId = goalTypeId;
	}	
	public Integer getInvestmentType() {
		return investmentType;
	}
	public void setInvestmentType(Integer investmentType) {
		this.investmentType = investmentType;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((allocationPercent == null) ? 0 : allocationPercent
						.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AssetPlanData other = (AssetPlanData) obj;
		if (allocationPercent == null) {
			if (other.allocationPercent != null)
				return false;
		} else if (!allocationPercent.equals(other.allocationPercent))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
//	@Override
//	public String toString() 
//	{
//		return new ReflectionToStringBuilder(this).toString();
//	}
}
