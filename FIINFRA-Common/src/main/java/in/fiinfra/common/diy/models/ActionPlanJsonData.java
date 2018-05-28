package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonProperty;

public class ActionPlanJsonData {
	
	@JsonProperty
	private Integer id;
	@JsonProperty
	private Integer goalId;
	@JsonProperty
	private Integer goalYear;
	@JsonProperty
	private String targetAmount;
	@JsonProperty
	private String goalCompletion;
	@JsonProperty
	private String lumpsum;
	@JsonProperty
	private String sip;
	@JsonProperty
	private String assetName;
	@JsonProperty
	private String allocationPercent;
	@JsonProperty
	private String productName;
	@JsonProperty
	private String productAmount;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGoalId() {
		return goalId;
	}
	public void setGoalId(Integer goalId) {
		this.goalId = goalId;
	}
	public Integer getGoalYear() {
		return goalYear;
	}
	public void setGoalYear(Integer goalYear) {
		this.goalYear = goalYear;
	}
	public String getTargetAmount() {
		return targetAmount;
	}
	public void setTargetAmount(String targetAmount) {
		this.targetAmount = targetAmount;
	}
	public String getGoalCompletion() {
		return goalCompletion;
	}
	public void setGoalCompletion(String goalCompletion) {
		this.goalCompletion = goalCompletion;
	}
	public String getLumpsum() {
		return lumpsum;
	}
	public void setLumpsum(String lumpsum) {
		this.lumpsum = lumpsum;
	}
	public String getSip() {
		return sip;
	}
	public void setSip(String sip) {
		this.sip = sip;
	}
	public String getAssetName() {
		return assetName;
	}
	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}
	public String getAllocationPercent() {
		return allocationPercent;
	}
	public void setAllocationPercent(String allocationPercent) {
		this.allocationPercent = allocationPercent;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(String productAmount) {
		this.productAmount = productAmount;
	}
}
