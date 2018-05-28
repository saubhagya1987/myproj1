package in.fiinfra.common.diy.models;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnore;
//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
@JsonIgnoreProperties(ignoreUnknown=true)
public class AdviserGoals implements Serializable
{

	private static final long serialVersionUID = -6840455864218425384L;
	@JsonProperty
	private String name;
	@JsonProperty
	private String email;
	@JsonProperty
	private String phone;
	@JsonProperty
	private Integer startYear;
	@JsonProperty
	private double amount;
	@JsonProperty
	private Integer goalTypeId;
	@JsonProperty
	private Integer goalId;
	@JsonProperty
	private Integer percentGoal;
	@JsonProperty
	private Integer noOfGoal;
	@JsonProperty
	private Double totalGoalValue;
	@JsonProperty
	private String allocatedTotalAsset;
	@JsonProperty
	private Integer goalsCompleted;
	@JsonProperty
	private String ownerName;
	@JsonProperty
	private String address;
	@JsonProperty
	private Integer stageId;
	@JsonProperty
	private String stage;
	@JsonProperty
	private String logoPath;
	@JsonProperty
	private String buLogoPath;
	@JsonProperty
	private Integer riskProfileId;
	@JsonProperty
	private Integer theme;
	@JsonProperty
	private String clientAddress;
	@JsonProperty
	private String inflationRate;
	@JsonProperty
	private String equityFund;
	@JsonProperty
	private String debtFund;
	@JsonProperty
	private String goldFund;
	@JsonProperty
	@JsonIgnore
	private String goalNote;
	
	public String getGoalNote() {
		return goalNote;
	}
	public void setGoalNote(String goalNote) {
		this.goalNote = goalNote;
	}
	public String getInflationRate() {
		return inflationRate;
	}
	public void setInflationRate(String inflationRate) {
		this.inflationRate = inflationRate;
	}
	public String getEquityFund() {
		return equityFund;
	}
	public void setEquityFund(String equityFund) {
		this.equityFund = equityFund;
	}
	public String getDebtFund() {
		return debtFund;
	}
	public void setDebtFund(String debtFund) {
		this.debtFund = debtFund;
	}
	public String getGoldFund() {
		return goldFund;
	}
	public void setGoldFund(String goldFund) {
		this.goldFund = goldFund;
	}
	public Integer getRiskProfileId() {
		return riskProfileId;
	}
	public void setRiskProfileId(Integer riskProfileId) {
		this.riskProfileId = riskProfileId;
	}
	public Integer getTheme() {
		return theme;
	}
	public void setTheme(Integer theme) {
		this.theme = theme;
	}
	public String getClientAddress() {
		return clientAddress;
	}
	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getStartYear() {
		return startYear;
	}
	public void setStartYear(Integer startYear) {
		this.startYear = startYear;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public Integer getGoalTypeId() {
		return goalTypeId;
	}
	public void setGoalTypeId(Integer goalTypeId) {
		this.goalTypeId = goalTypeId;
	}
	public Integer getGoalId() {
		return goalId;
	}
	public void setGoalId(Integer goalId) {
		this.goalId = goalId;
	}
	public Integer getPercentGoal() {
		return percentGoal;
	}
	public void setPercentGoal(Integer percentGoal) {
		this.percentGoal = percentGoal;
	}
	public Integer getNoOfGoal() {
		return noOfGoal;
	}
	public void setNoOfGoal(Integer noOfGoal) {
		this.noOfGoal = noOfGoal;
	}
	public Double getTotalGoalValue() {
		return totalGoalValue;
	}
	public void setTotalGoalValue(Double totalGoalValue) {
		this.totalGoalValue = totalGoalValue;
	}
	public String getAllocatedTotalAsset() {
		return allocatedTotalAsset;
	}
	public void setAllocatedTotalAsset(String allocatedTotalAsset) {
		this.allocatedTotalAsset = allocatedTotalAsset;
	}
	public Integer getGoalsCompleted() {
		return goalsCompleted;
	}
	public void setGoalsCompleted(Integer goalsCompleted) {
		this.goalsCompleted = goalsCompleted;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getStageId() {
		return stageId;
	}
	public void setStageId(Integer stageId) {
		this.stageId = stageId;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	public String getLogoPath() {
		return logoPath;
	}
	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}
	public String getBuLogoPath() {
		return buLogoPath;
	}
	public void setBuLogoPath(String buLogoPath) {
		this.buLogoPath = buLogoPath;
	}
	
//	@Override
//	public String toString() 
//	{
//		return new ReflectionToStringBuilder(this).toString();
//	}
	
}
