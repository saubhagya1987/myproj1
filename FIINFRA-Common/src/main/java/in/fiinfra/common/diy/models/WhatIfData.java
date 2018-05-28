package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonProperty;

public class WhatIfData {
	
	@JsonProperty
	private Integer id;
	@JsonProperty
	private String currentValue;
	@JsonProperty
	private String monthlyInvest;
	@JsonProperty
	private String availableToGoals;
	@JsonProperty
	private Integer assetNameId;
	@JsonProperty
	private String assetName;
	@JsonProperty
	private Integer fpPlanId;
	@JsonProperty
	private String assetClassName;
	
	public String getAssetClassName() {
		return assetClassName;
	}
	public void setAssetClassName(String assetClassName) {
		this.assetClassName = assetClassName;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAssetNameId() {
		return assetNameId;
	}
	public void setAssetNameId(Integer assetNameId) {
		this.assetNameId = assetNameId;
	}
	public String getAssetName() {
		return assetName;
	}
	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}
	public String getCurrentValue() {
		return currentValue;
	}
	public void setCurrentValue(String currentValue) {
		this.currentValue = currentValue;
	}
	public String getMonthlyInvest() {
		return monthlyInvest;
	}
	public String getAvailableToGoals() {
		return availableToGoals;
	}
	public void setAvailableToGoals(String availableToGoals) {
		this.availableToGoals = availableToGoals;
	}
	public void setMonthlyInvest(String monthlyInvest) {
		this.monthlyInvest = monthlyInvest;
	}
	public Integer getFpPlanId() {
		return fpPlanId;
	}
	public void setFpPlanId(Integer fpPlanId) {
		this.fpPlanId = fpPlanId;
	}
}
