package in.fiinfra.common.partner;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class AssetAllocatedToGoal {

	@JsonIgnore
	@JsonProperty
	private String partyId;
	
	@JsonIgnore
	@JsonProperty
	private String goalId;
	
	@JsonIgnore
	@JsonProperty
	private String userId;
	
	@JsonIgnore
	@JsonProperty
	private String assetTypeId;
	
	@JsonIgnore
	@JsonProperty
	private String partyAssetId;
	
	@JsonIgnore
	@JsonProperty
	private String allocatedAmount;
	
	@JsonIgnore
	@JsonProperty
	private String allocatedPercent;
	
	@JsonIgnore
	@JsonProperty
	private String currentValue;
	
	@JsonIgnore
	@JsonProperty
	private String availableValue;
	
	
	@JsonIgnore
	@JsonProperty
	private String goalDescription;
	
	@JsonIgnore
	@JsonProperty
	private String assetName;
	
	@JsonIgnore
	@JsonProperty
	private String goalName;
	
	@JsonIgnore
	@JsonProperty
	private String clientName;
	
	@JsonIgnore
	@JsonProperty
	private String assetAmountToGoal;
	
	@JsonIgnore
	@JsonProperty
	private String assetPercentToGoal;
	
	@JsonIgnore
	@JsonProperty
	private String isAutoAllocated;
	
	@JsonIgnore
	@JsonProperty
	private String goalAssetId;
	
	@JsonIgnore
	@JsonProperty
	private String isReviewed;
	
	@JsonIgnore
	@JsonProperty
	private String maturingAmount;
	
	
	public String getMaturingAmount() {
		return maturingAmount;
	}
	public void setMaturingAmount(String maturingAmount) {
		this.maturingAmount = maturingAmount;
	}
	public String getIsReviewed() {
		return isReviewed;
	}
	public void setIsReviewed(String isReviewed) {
		this.isReviewed = isReviewed;
	}
	public String getGoalAssetId() {
		return goalAssetId;
	}
	public void setGoalAssetId(String goalAssetId) {
		this.goalAssetId = goalAssetId;
	}
	public String getAssetName() {
		return assetName;
	}
	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}
	public String getGoalName() {
		return goalName;
	}
	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getAssetAmountToGoal() {
		return assetAmountToGoal;
	}
	public void setAssetAmountToGoal(String assetAmountToGoal) {
		this.assetAmountToGoal = assetAmountToGoal;
	}
	public String getAssetPercentToGoal() {
		return assetPercentToGoal;
	}
	public void setAssetPercentToGoal(String assetPercentToGoal) {
		this.assetPercentToGoal = assetPercentToGoal;
	}
	public String getIsAutoAllocated() {
		return isAutoAllocated;
	}
	public void setIsAutoAllocated(String isAutoAllocated) {
		this.isAutoAllocated = isAutoAllocated;
	}
	public String getGoalDescription() {
		return goalDescription;
	}
	public void setGoalDescription(String goalDescription) {
		this.goalDescription = goalDescription;
	}
	public String getAvailableValue() {
		return availableValue;
	}
	public void setAvailableValue(String availableValue) {
		this.availableValue = availableValue;
	}
	public String getCurrentValue() {
		return currentValue;
	}
	public void setCurrentValue(String currentValue) {
		this.currentValue = currentValue;
	}
	public String getPartyId() {
		return partyId;
	}
	public void setPartyId(String partyId) {
		this.partyId = partyId;
	}
	
	public String getGoalId() {
		return goalId;
	}
	public void setGoalId(String goalId) {
		this.goalId = goalId;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getAssetTypeId() {
		return assetTypeId;
	}
	public void setAssetTypeId(String assetTypeId) {
		this.assetTypeId = assetTypeId;
	}
	
	public String getPartyAssetId() {
		return partyAssetId;
	}
	public void setPartyAssetId(String partyAssetId) {
		this.partyAssetId = partyAssetId;
	}
	
	public String getAllocatedAmount() {
		return allocatedAmount;
	}
	public void setAllocatedAmount(String allocatedAmount) {
		this.allocatedAmount = allocatedAmount;
	}
	
	public String getAllocatedPercent() {
		return allocatedPercent;
	}
	public void setAllocatedPercent(String allocatedPercent) {
		this.allocatedPercent = allocatedPercent;
	}
	
}
