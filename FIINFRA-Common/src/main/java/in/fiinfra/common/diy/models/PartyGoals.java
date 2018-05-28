package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PartyGoals {
	
	@JsonIgnore
	@JsonProperty
	private int goalId;
	
	@JsonIgnore
	@JsonProperty
	private String goalName;
	
	@JsonIgnore
	@JsonProperty
	private String goalDesc;
	
	@JsonIgnore
	@JsonProperty
	private int goalYear;
	
	@JsonIgnore
	@JsonProperty
	private double goalPercent;
	
	@JsonIgnore
	@JsonProperty
	private String goalPv;
	
	@JsonIgnore
	@JsonProperty
	private String goalFv;
	
	@JsonIgnore
	@JsonProperty
	private String assetPv;
	
	@JsonIgnore
	@JsonProperty
	private String assetFv;
	
	@JsonIgnore
	@JsonProperty
	private String goalTypeId;
	
	@JsonIgnore
	@JsonProperty
	private String goalDescription;
	
	public String getGoalDescription() {
		return goalDescription;
	}

	public void setGoalDescription(String goalDescription) {
		this.goalDescription = goalDescription;
	}

	public String getGoalTypeId() {
		return goalTypeId;
	}

	public void setGoalTypeId(String goalTypeId) {
		this.goalTypeId = goalTypeId;
	}

	public int getGoalId() {
		return goalId;
	}

	public void setGoalId(int goalId) {
		this.goalId = goalId;
	}

	public String getGoalName() {
		return goalName;
	}

	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}
	
	public String getGoalDesc() {
		return goalDesc;
	}

	public void setGoalDesc(String goalDesc) {
		this.goalDesc = goalDesc;
	}

	public int getGoalYear() {
		return goalYear;
	}

	public void setGoalYear(int goalYear) {
		this.goalYear = goalYear;
	}

	public double getGoalPercent() {
		return goalPercent;
	}

	public void setGoalPercent(double goalPercent) {
		this.goalPercent = goalPercent;
	}

	public String getGoalPv() {
		return goalPv;
	}

	public void setGoalPv(String goalPv) {
		this.goalPv = goalPv;
	}

	public String getGoalFv() {
		return goalFv;
	}

	public void setGoalFv(String goalFv) {
		this.goalFv = goalFv;
	}

	public String getAssetPv() {
		return assetPv;
	}

	public void setAssetPv(String assetPv) {
		this.assetPv = assetPv;
	}

	public String getAssetFv() {
		return assetFv;
	}

	public void setAssetFv(String assetFv) {
		this.assetFv = assetFv;
	}

}
