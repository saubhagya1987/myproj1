package in.fiinfra.common.diy.models;

import java.util.List;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

public class Suggestion {
	
	@JsonProperty
	private Integer partyId;
	@JsonProperty
	private String datafor;

//	EmergncyFund variables
	@JsonProperty
	private String monthlyExpence;
	@JsonProperty
	private Integer noOfMonthsWoIncome;
	@JsonProperty
	private String minimumEmergncyFund;
	@JsonProperty
	private String idealEmergencyFund;
	@JsonProperty
	private String monthlyEmi;
	@JsonProperty
	private Integer minEmergencyNoOfMonths;
//	Loan Status Variables
	@JsonProperty
	private String loanEmiPercent;
	@JsonProperty
	private String loanInFuture;
	@JsonProperty
	private Integer age;
//	Risk Cover variables
	@JsonProperty
	private String lifeIdealCover;
	@JsonProperty
	private String lifeCurrentCover;
	@JsonProperty
	private String healthIdealCover;
	@JsonProperty
	private String healthCurrentCover;
	@JsonProperty
	private String accidentIdealCover;
	@JsonProperty
	private String accidentCurrentCover;
	@JsonProperty
	private String criticalIdealCover;
	@JsonProperty
	private String criticalCurrentCover;
//	Cash Flow Variables
	@JsonProperty
	private String monthlyincome;
	@JsonProperty
	private String expence;
	@JsonProperty
	private String loanreapayment;
	@JsonProperty
	private String surplus;
	@JsonProperty
	private String havetoinvest;
	@JsonProperty
	private String currentinvest;
//	Retirement Variables
	@JsonProperty
	private String corpusNeeded;
	@JsonProperty
	private String corpusAccumulated;
	@JsonProperty
	private String regularInvest;
	@JsonProperty
	private String lumpsum;
	@JsonProperty
	private Integer goalYear;
	@JsonProperty
	private String retirementPlanningUpTo;
	@JsonProperty
	private String amountNeeded;
	
//	Goal Variables
	@JsonProperty
	private Integer goalId;
	@JsonProperty
	private String goalName;
	@JsonProperty
	private String investAmount;
	@JsonProperty
	private String goalLumpSumAmount;
	@JsonProperty
	private String goalachievement;
//	Succession Planning
	@JsonProperty
	private Integer investJointly;
	@JsonProperty
	private Integer awareInvest;
	@JsonProperty
	private Integer prepareWill;
	@JsonProperty
	private Integer insuranceMethod;
	@JsonProperty
	private String description;
	
	private List<ProductData> suggestionList;
	
	public List<ProductData> getSuggestionList() {
		return suggestionList;
	}

	public void setSuggestionList(List<ProductData> suggestionList) {
		this.suggestionList = suggestionList;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getInsuranceMethod() {
		return insuranceMethod;
	}

	public void setInsuranceMethod(Integer insuranceMethod) {
		this.insuranceMethod = insuranceMethod;
	}

	public String getMonthlyEmi() {
		return monthlyEmi;
	}

	public void setMonthlyEmi(String monthlyEmi) {
		this.monthlyEmi = monthlyEmi;
	}

	public Integer getMinEmergencyNoOfMonths() {
		return minEmergencyNoOfMonths;
	}

	public void setMinEmergencyNoOfMonths(Integer minEmergencyNoOfMonths) {
		this.minEmergencyNoOfMonths = minEmergencyNoOfMonths;
	}

	public Integer getInvestJointly() {
		return investJointly;
	}

	public void setInvestJointly(Integer investJointly) {
		this.investJointly = investJointly;
	}

	public Integer getAwareInvest() {
		return awareInvest;
	}

	public void setAwareInvest(Integer awareInvest) {
		this.awareInvest = awareInvest;
	}

	public Integer getPrepareWill() {
		return prepareWill;
	}

	public void setPrepareWill(Integer prepareWill) {
		this.prepareWill = prepareWill;
	}

	public String getIdealEmergencyFund() {
		return idealEmergencyFund;
	}

	public void setIdealEmergencyFund(String idealEmergencyFund) {
		this.idealEmergencyFund = idealEmergencyFund;
	}

	public Integer getPartyId() {
		return partyId;
	}

	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}

	public String getDatafor() {
		return datafor;
	}

	public void setDatafor(String datafor) {
		this.datafor = datafor;
	}

	public String getMonthlyExpence() {
		return monthlyExpence;
	}

	public void setMonthlyExpence(String monthlyExpence) {
		this.monthlyExpence = monthlyExpence;
	}

	public Integer getNoOfMonthsWoIncome() {
		return noOfMonthsWoIncome;
	}

	public void setNoOfMonthsWoIncome(Integer noOfMonthsWoIncome) {
		this.noOfMonthsWoIncome = noOfMonthsWoIncome;
	}

	public String getMinimumEmergncyFund() {
		return minimumEmergncyFund;
	}

	public void setMinimumEmergncyFund(String minimumEmergncyFund) {
		this.minimumEmergncyFund = minimumEmergncyFund;
	}

	public String getLoanEmiPercent() {
		return loanEmiPercent;
	}

	public void setLoanEmiPercent(String loanEmiPercent) {
		this.loanEmiPercent = loanEmiPercent;
	}

	public String getLoanInFuture() {
		return loanInFuture;
	}

	public void setLoanInFuture(String loanInFuture) {
		this.loanInFuture = loanInFuture;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getLifeIdealCover() {
		return lifeIdealCover;
	}

	public void setLifeIdealCover(String lifeIdealCover) {
		this.lifeIdealCover = lifeIdealCover;
	}

	public String getLifeCurrentCover() {
		return lifeCurrentCover;
	}

	public void setLifeCurrentCover(String lifeCurrentCover) {
		this.lifeCurrentCover = lifeCurrentCover;
	}

	public String getHealthIdealCover() {
		return healthIdealCover;
	}

	public void setHealthIdealCover(String healthIdealCover) {
		this.healthIdealCover = healthIdealCover;
	}

	public String getHealthCurrentCover() {
		return healthCurrentCover;
	}

	public void setHealthCurrentCover(String healthCurrentCover) {
		this.healthCurrentCover = healthCurrentCover;
	}

	public String getAccidentIdealCover() {
		return accidentIdealCover;
	}

	public void setAccidentIdealCover(String accidentIdealCover) {
		this.accidentIdealCover = accidentIdealCover;
	}

	public String getAccidentCurrentCover() {
		return accidentCurrentCover;
	}

	public void setAccidentCurrentCover(String accidentCurrentCover) {
		this.accidentCurrentCover = accidentCurrentCover;
	}

	public String getCriticalIdealCover() {
		return criticalIdealCover;
	}

	public void setCriticalIdealCover(String criticalIdealCover) {
		this.criticalIdealCover = criticalIdealCover;
	}

	public String getCriticalCurrentCover() {
		return criticalCurrentCover;
	}

	public void setCriticalCurrentCover(String criticalCurrentCover) {
		this.criticalCurrentCover = criticalCurrentCover;
	}
	
	public String getMonthlyincome() {
		return monthlyincome;
	}

	public void setMonthlyincome(String monthlyincome) {
		this.monthlyincome = monthlyincome;
	}

	public String getExpence() {
		return expence;
	}

	public void setExpence(String expence) {
		this.expence = expence;
	}

	public String getLoanreapayment() {
		return loanreapayment;
	}

	public void setLoanreapayment(String loanreapayment) {
		this.loanreapayment = loanreapayment;
	}

	public String getSurplus() {
		return surplus;
	}

	public void setSurplus(String surplus) {
		this.surplus = surplus;
	}

	public String getHavetoinvest() {
		return havetoinvest;
	}

	public void setHavetoinvest(String havetoinvest) {
		this.havetoinvest = havetoinvest;
	}

	public String getCurrentinvest() {
		return currentinvest;
	}

	public void setCurrentinvest(String currentinvest) {
		this.currentinvest = currentinvest;
	}

	public String getCorpusNeeded() {
		return corpusNeeded;
	}

	public void setCorpusNeeded(String corpusNeeded) {
		this.corpusNeeded = corpusNeeded;
	}

	public String getCorpusAccumulated() {
		return corpusAccumulated;
	}

	public void setCorpusAccumulated(String corpusAccumulated) {
		this.corpusAccumulated = corpusAccumulated;
	}

	public String getRegularInvest() {
		return regularInvest;
	}

	public void setRegularInvest(String regularInvest) {
		this.regularInvest = regularInvest;
	}

	public String getLumpsum() {
		return lumpsum;
	}

	public void setLumpsum(String lumpsum) {
		this.lumpsum = lumpsum;
	}
	
	public Integer getGoalYear() {
		return goalYear;
	}

	public void setGoalYear(Integer goalYear) {
		this.goalYear = goalYear;
	}

	public String getRetirementPlanningUpTo() {
		return retirementPlanningUpTo;
	}

	public void setRetirementPlanningUpTo(String retirementPlanningUpTo) {
		this.retirementPlanningUpTo = retirementPlanningUpTo;
	}

	public String getAmountNeeded() {
		return amountNeeded;
	}

	public void setAmountNeeded(String amountNeeded) {
		this.amountNeeded = amountNeeded;
	}

//	@Override
//	public String toString() {
//		return new ReflectionToStringBuilder(this).toString();
//	}

	public Integer getGoalId() {
		return goalId;
	}

	public void setGoalId(Integer goalId) {
		this.goalId = goalId;
	}

	public String getGoalName() {
		return goalName;
	}

	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}

	public String getInvestAmount() {
		return investAmount;
	}

	public void setInvestAmount(String investAmount) {
		this.investAmount = investAmount;
	}

	public String getGoalLumpSumAmount() {
		return goalLumpSumAmount;
	}

	public void setGoalLumpSumAmount(String goalLumpSumAmount) {
		this.goalLumpSumAmount = goalLumpSumAmount;
	}

	public String getGoalachievement() {
		return goalachievement;
	}

	public void setGoalachievement(String goalachievement) {
		this.goalachievement = goalachievement;
	}
}
