package in.fiinfra.common.diy.models;

import in.fiinfra.common.util.JsonData;

import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;

public class ActionPlanRisk {
	
	@JsonProperty
	private Integer riskId;
	@JsonProperty
	private String risk;
	@JsonProperty
	private String coverRequired;
	@JsonProperty
	private String coverAvailable;
	@JsonProperty
	private Integer productId;
	@JsonProperty
	private String productNameList;
	@JsonProperty
	private String productName;
	@JsonProperty
	private String premiumAmount;
	@JsonProperty
	private Integer partyId;
	@JsonProperty
	private String allocationPercent;
	@JsonProperty
	private String sumAssured;
	@JsonProperty
	private Integer fpAdviseRecommendId;
	@JsonProperty
	private Integer actionApprovalId;
	@JsonProperty
	private Integer actionFlag;
	
	public Integer getActionApprovalId() {
		return actionApprovalId;
	}
	public void setActionApprovalId(Integer actionApprovalId) {
		this.actionApprovalId = actionApprovalId;
	}
	public Integer getRiskId() {
		return riskId;
	}
	public void setRiskId(Integer riskId) {
		this.riskId = riskId;
	}
	public String getRisk() {
		return risk;
	}
	public void setRisk(String risk) {
		this.risk = risk;
	}
	public String getCoverRequired() {
		return coverRequired;
	}
	public void setCoverRequired(String coverRequired) {
		this.coverRequired = coverRequired;
	}
	public String getCoverAvailable() {
		return coverAvailable;
	}
	public void setCoverAvailable(String coverAvailable) {
		this.coverAvailable = coverAvailable;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductNameList() {
		return productNameList;
	}
	public void setProductNameList(String productNameList) {
		this.productNameList = productNameList;
	}
	public String getPremiumAmount() {
		return premiumAmount;
	}
	public void setPremiumAmount(String premiumAmount) {
		this.premiumAmount = premiumAmount;
	}
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getAllocationPercent() {
		return allocationPercent;
	}
	public void setAllocationPercent(String allocationPercent) {
		this.allocationPercent = allocationPercent;
	}
	public String getSumAssured() {
		return sumAssured;
	}
	public void setSumAssured(String sumAssured) {
		Double sum = Double.parseDouble(sumAssured);
		this.sumAssured = sum.toString();
	}
	public Integer getFpAdviseRecommendId() {
		return fpAdviseRecommendId;
	}
	public void setFpAdviseRecommendId(Integer fpAdviseRecommendId) {
		this.fpAdviseRecommendId = fpAdviseRecommendId;
	}
	public Integer getActionFlag() {
		return actionFlag;
	}
	public void setActionFlag(Integer actionFlag) {
		this.actionFlag = actionFlag;
	}
}
