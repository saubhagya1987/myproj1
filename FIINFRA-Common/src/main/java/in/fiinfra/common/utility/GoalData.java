package in.fiinfra.common.utility;

import in.fiinfra.common.diy.models.GoalAttribute;

import java.sql.Timestamp;
import java.util.List;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

public class GoalData {

	

	
	@JsonProperty
	private Integer id;
	@JsonProperty
	private Integer goalTypeId;
	@JsonProperty
	private String goalDescription;
	@JsonProperty
	private Integer goalEndYear;
	@JsonProperty

	private String goalAmountPv;
	@JsonProperty
	private Integer goalFamilyPartyId;
	@JsonProperty
	private String goalDataXml;
	@JsonProperty
	private String goalAmountFv;
	@JsonProperty
	private Double result;
	@JsonProperty
	private Integer currentYear;

	
	//private Integer id;
	private Integer fpGoalId; /*id*/
	private String description;	/*TodaysCost*/
	private Double costOfAnnual;	
	private String costOfAnnualString;
	//private String endYear	;
	private String startYear;/*Current Year*/	
	//private Integer goalType;	
	private Double inflationRate;	
	private Integer priority;	
	private Integer frequency;	
	private Boolean isIncludedHLV;
	private int percentGoalReachable;
	private String regularInvestment;
	private String futureValueOfAssets;
	private String futureValueOfGoal; /*future Value*/
	private String currentValue;
	private String goalTypeName;
	private Integer amountUnit;
	private Integer goalMonth;
	private String goalInflationRate;
	private String loanTakenOrNot;
	private Integer isAllocateAsset;	
	//private 
	
	public Integer getIsAllocateAsset() {
		return isAllocateAsset;
	}
	public void setIsAllocateAsset(Integer isAllocateAsset) {
		this.isAllocateAsset = isAllocateAsset;
	}
	public String getLoanTakenOrNot() {
		return loanTakenOrNot;
	}
	public void setLoanTakenOrNot(String loanTakenOrNot) {
		this.loanTakenOrNot = loanTakenOrNot;
	}
	public String getGoalInflationRate() {
		return goalInflationRate;
	}
	public void setGoalInflationRate(String goalInflationRate) {
		this.goalInflationRate = goalInflationRate;
	}
	public Integer getAmountUnit() {
		return amountUnit;
	}
	public void setAmountUnit(Integer amountUnit) {
		this.amountUnit = amountUnit;
	}
	public Integer getFpGoalId() {
		return fpGoalId;
	}
	public void setFpGoalId(Integer fpGoalId) {
		this.fpGoalId = fpGoalId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getCostOfAnnual() {
		return costOfAnnual;
	}
	public void setCostOfAnnual(Double costOfAnnual) {
		this.costOfAnnual = costOfAnnual;
	}
	public String getCostOfAnnualString() {
		return costOfAnnualString;
	}
	public void setCostOfAnnualString(String costOfAnnualString) {
		this.costOfAnnualString = costOfAnnualString;
	}
	public String getStartYear() {
		return startYear;
	}
	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}
	public Double getInflationRate() {
		return inflationRate;
	}
	public void setInflationRate(Double inflationRate) {
		this.inflationRate = inflationRate;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public Integer getFrequency() {
		return frequency;
	}
	public void setFrequency(Integer frequency) {
		this.frequency = frequency;
	}
	public Boolean getIsIncludedHLV() {
		return isIncludedHLV;
	}
	public void setIsIncludedHLV(Boolean isIncludedHLV) {
		this.isIncludedHLV = isIncludedHLV;
	}
	public int getPercentGoalReachable() {
		return percentGoalReachable;
	}
	public void setPercentGoalReachable(int percentGoalReachable) {
		this.percentGoalReachable = percentGoalReachable;
	}
	public String getRegularInvestment() {
		return regularInvestment;
	}
	public void setRegularInvestment(String regularInvestment) {
		this.regularInvestment = regularInvestment;
	}
	public String getFutureValueOfAssets() {
		return futureValueOfAssets;
	}
	public void setFutureValueOfAssets(String futureValueOfAssets) {
		this.futureValueOfAssets = futureValueOfAssets;
	}
	public String getFutureValueOfGoal() {
		return futureValueOfGoal;
	}
	public void setFutureValueOfGoal(String futureValueOfGoal) {
		this.futureValueOfGoal = futureValueOfGoal;
	}
	public String getCurrentValue() {
		return currentValue;
	}
	public void setCurrentValue(String currentValue) {
		this.currentValue = currentValue;
	}
	public String getGoalTypeName() {
		return goalTypeName;
	}
	public void setGoalTypeName(String goalTypeName) {
		this.goalTypeName = goalTypeName;
	}
	
	public String getGoalPV() {
		return goalPV;
	}
	public void setGoalPV(String goalPV) {
		this.goalPV = goalPV;
	}
	//private int goalDuration;
	private String goalPV;/*goal lumsum*/
	//private int goalAchivement;
	

	

	@JsonProperty
	private Integer lastModifiedBy;
	@JsonProperty
	private Integer partyId;
	@JsonProperty
	private Integer buId;
	@JsonProperty
	private Integer goalStartYear;
	@JsonProperty
	private Integer isLoan;
	@JsonProperty
	private Double loanAmount;
	@JsonProperty
	private Double loanDownPayment;
	@JsonProperty
	private Double loanInterestPercentage;
	@JsonProperty
	private Integer loanDurationYears;
	@JsonProperty
	private String goalName;
	@JsonProperty
	private List<GoalAttribute> goalAttributeList;
	@JsonProperty
	private Integer createdBy;
	@JsonProperty
	private String attributeXML;
	@JsonProperty
	private Integer goalStatusId;
	@JsonProperty
	private Integer goalPriorityId;
	@JsonProperty
	private Integer goalSeqNo;
	@JsonProperty
	private Timestamp createdDate;
	@JsonProperty
	private String assetValue;
	@JsonProperty
	private String goalCompletedPercent;
	@JsonProperty
	private String regularInvestAmt;
	@JsonProperty
	private String lumpsumAmount;
	@JsonProperty
	private String monthlyincome;
	public Integer getGoalMonth() {
		return goalMonth;
	}
	public void setGoalMonth(Integer goalMonth) {
		this.goalMonth = goalMonth;
	}
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
	@JsonProperty
	private Integer userId;
	@JsonProperty
	private String goalFv;
	@JsonProperty
	private String assetFv;
	@JsonProperty
	private String loanTaken;
	@JsonProperty
	private Double shortfall;
	@JsonProperty
	private String goalNote;
	
	private String goalFrequency;
	
	public String getGoalFrequency() {
		return goalFrequency;
	}
	public void setGoalFrequency(String goalFrequency) {
		this.goalFrequency = goalFrequency;
	}
	public String getGoalNote() {
		return goalNote;
	}
	public void setGoalNote(String goalNote) {
		this.goalNote = goalNote;
	}
	public Double getShortfall() {
		return shortfall;
	}
	public void setShortfall(Double shortfall) {
		this.shortfall = shortfall;
	}
	public String getLoanTaken() {
		return loanTaken;
	}
	public void setLoanTaken(String loanTaken) {
		this.loanTaken = loanTaken;
	}
	public String getGoalFv() {
		return goalFv;
	}
	public void setGoalFv(String goalFv) {
		this.goalFv = goalFv;
	}
	public String getAssetFv() {
		return assetFv;
	}
	public void setAssetFv(String assetFv) {
		this.assetFv = assetFv;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
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
	public String getRegularInvestAmt() {
		return regularInvestAmt;
	}
	public void setRegularInvestAmt(String regularInvestAmt) {
		this.regularInvestAmt = regularInvestAmt;
	}
	public String getLumpsumAmount() {
		return lumpsumAmount;
	}
	public void setLumpsumAmount(String lumpsumAmount) {
		this.lumpsumAmount = lumpsumAmount;
	}
	public String getGoalCompletedPercent() {
		return goalCompletedPercent;
	}
	public void setGoalCompletedPercent(String goalCompletedPercent) {
		this.goalCompletedPercent = goalCompletedPercent;
	}
	public String getAssetValue() {
		return assetValue;
	}
	public void setAssetValue(String assetValue) {
		this.assetValue = assetValue;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public void setGoalTypeId(Integer goalTypeId) {
		this.goalTypeId = goalTypeId;
	}
	public Integer getGoalTypeId() {
		return goalTypeId;
	}
	public String getGoalDescription() {
		return goalDescription;
	}
	public void setGoalDescription(String goalDescription) {
		this.goalDescription = goalDescription;
	}
	public Integer getGoalEndYear() {
		return goalEndYear;
	}
	public void setGoalEndYear(Integer goalEndYear) {
		this.goalEndYear = goalEndYear;
	}
	public String getGoalAmountPv() {
		return goalAmountPv;
	}
	public void setGoalAmountPv(String goalAmountPv) {
//		Float amountPv = Float.parseFloat(goalAmountPv);
		this.goalAmountPv = goalAmountPv;
	}
	public Integer getGoalFamilyPartyId() {
		return goalFamilyPartyId;
	}
	public void setGoalFamilyPartyId(Integer goalFamilyPartyId) {
		this.goalFamilyPartyId = goalFamilyPartyId;
	}
	public String getGoalDataXml() {
		return goalDataXml;
	}
	public void setGoalDataXml(String goalDataXml) {
		this.goalDataXml = goalDataXml;
	}
	public Integer getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(Integer lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	public Integer getBuId() {
		return buId;
	}
	public void setBuId(Integer buId) {
		this.buId = buId;
	}
	public Integer getGoalStartYear() {
		return goalStartYear;
	}
	public void setGoalStartYear(Integer goalStartYear) {
		this.goalStartYear = goalStartYear;
	}
	public Integer getIsLoan() {
		return isLoan;
	}
	public void setIsLoan(Integer isLoan) {
		this.isLoan = isLoan;
	}
	public Double getLoanAmount() {
		return loanAmount;
	}
	public void setLoanAmount(Double loanAmount) {
		this.loanAmount = loanAmount;
	}
	public Double getLoanDownPayment() {
		return loanDownPayment;
	}
	public void setLoanDownPayment(Double loanDownPayment) {
		this.loanDownPayment = loanDownPayment;
	}
	public Double getLoanInterestPercentage() {
		return loanInterestPercentage;
	}
	public void setLoanInterestPercentage(Double loanInterestPercentage) {
		this.loanInterestPercentage = loanInterestPercentage;
	}
	public Integer getLoanDurationYears() {
		return loanDurationYears;
	}
	public void setLoanDurationYears(Integer loanDurationYears) {
		this.loanDurationYears = loanDurationYears;
	}
	public String getGoalName() {
		return goalName;
	}
	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}
	public List<GoalAttribute> getGoalAttributeList() {
		return goalAttributeList;
	}
	public void setGoalAttributeList(List<GoalAttribute> goalAttributeList) {
		this.goalAttributeList = goalAttributeList;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public String getAttributeXML() {
		return attributeXML;
	}
	public void setAttributeXML(String attributeXML) {
		this.attributeXML = attributeXML;
	}
	public Integer getGoalStatusId() {
		return goalStatusId;
	}
	public void setGoalStatusId(Integer goalStatusId) {
		this.goalStatusId = goalStatusId;
	}
	public Integer getGoalPriorityId() {
		return goalPriorityId;
	}
	public void setGoalPriorityId(Integer goalPriorityId) {
		this.goalPriorityId = goalPriorityId;
	}
	public Integer getGoalSeqNo() {
		return goalSeqNo;
	}
	public void setGoalSeqNo(Integer goalSeqNo) {
		this.goalSeqNo = goalSeqNo;
	}
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	public String getGoalAmountFv() {
		return goalAmountFv;
	}
	public void setGoalAmountFv(String goalAmountFv) {
		if(goalAmountFv != null)
		{	Float amountFv = Float.parseFloat(goalAmountFv);
			this.goalAmountFv = amountFv.toString();
		}
		else{
			this.goalAmountFv = "0.0";
		}
	}
	public Double getResult() {
		return result;
	}
	public void setResult(Double result) {
		this.result = result;
	}
	public Integer getCurrentYear() {
		return currentYear;
	}
	public void setCurrentYear(Integer currentYear) {
		this.currentYear = currentYear;
	}
	
	private String assetName;
	
	private String presentValue;
	
	private String percentAllocated;

	public String getAssetName() {
		return assetName;
	}
	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}
	public String getPresentValue() {
		return presentValue;
	}
	public void setPresentValue(String presentValue) {
		this.presentValue = presentValue;
	}
	public String getPercentAllocated() {
		return percentAllocated;
	}
	public void setPercentAllocated(String percentAllocated) {
		this.percentAllocated = percentAllocated;
	}
	
	private String futureAssetPercent;

	public String getFutureAssetPercent() {
		return futureAssetPercent;
	}
	public void setFutureAssetPercent(String futureAssetPercent) {
		this.futureAssetPercent = futureAssetPercent;
	}
	
//	@Override
//	public String toString() {
//		return new ReflectionToStringBuilder(this).toString();
//	}
}
