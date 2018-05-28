package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

public class ClientActionPlan {
	
	@JsonIgnore
	@JsonProperty
	private Integer productId;
	
	@JsonIgnore
	@JsonProperty
	private String productName;
	
	@JsonIgnore
	@JsonProperty
	private Integer goalId;
	
	@JsonIgnore
	@JsonProperty
	private String goalName;
	
	@JsonIgnore
	@JsonProperty
	private Integer goalYear;
	
	@JsonIgnore
	@JsonProperty
	private String lumpSumAmt;
	
	@JsonIgnore
	@JsonProperty
	private String sipAmt;
	
	@JsonIgnore
	@JsonProperty
	private String totalLumpSumAmt;
	
	@JsonIgnore
	@JsonProperty
	private String totalSipAmt;
	
	@JsonIgnore
	@JsonProperty
	private Integer fpSectionTypeId;
	
	@JsonIgnore
	@JsonProperty
	private String revenueAmount;
	
	@JsonIgnore
	@JsonProperty
	private String insuranceAmount;
	
	@JsonIgnore
	@JsonProperty
	private String existingCover;
	
	@JsonIgnore
	@JsonProperty
	private String requiredCover;
	
	@JsonIgnore
	@JsonProperty
	private Double goalPercentage;
	
	@JsonIgnore
	@JsonProperty
	private Integer goalTypeId;
	
	@JsonIgnore
	@JsonProperty
	private Integer investJointly;
	
	@JsonIgnore
	@JsonProperty
	private Integer awareInvest;
	
	@JsonIgnore
	@JsonProperty
	private Integer prepareWill;
	
	@JsonIgnore
	@JsonProperty
	private String successionDate;
	
	@JsonIgnore
	@JsonProperty
	private String premiumAmount;
	
	@JsonIgnore
	@JsonProperty
	private Integer isPreferred;
	
	@JsonIgnore
	@JsonProperty
	private String goalNoteText;
	
	@JsonIgnore
	@JsonProperty
	private Integer manufacturerId;
	
	@JsonIgnore
	@JsonProperty
	private String manufacturerName;
	
	@JsonIgnore
	@JsonProperty
	private String	inflationRate;
	
	@JsonIgnore
	@JsonProperty
	private String equityFund;
	
	@JsonIgnore
	@JsonProperty
	private String 	debtFund;
	
	@JsonIgnore
	@JsonProperty
	private String	goldFund;
	
	@JsonIgnore
	@JsonProperty
	private String moneyFormatted;
	
	@JsonIgnore
	@JsonProperty
	private Double decimalNumber;
	
	@JsonIgnore
	@JsonProperty
	private String purchaseUrl;
	
	
	
	public String getPurchaseUrl() {
		return purchaseUrl;
	}
	public void setPurchaseUrl(String purchaseUrl) {
		this.purchaseUrl = purchaseUrl;
	}
	public String getMoneyFormatted() {
		return moneyFormatted;
	}
	public void setMoneyFormatted(String moneyFormatted) {
		this.moneyFormatted = moneyFormatted;
	}
	public Double getDecimalNumber() {
		return decimalNumber;
	}
	public void setDecimalNumber(Double decimalNumber) {
		this.decimalNumber = decimalNumber;
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
	public Integer getManufacturerId() {
		return manufacturerId;
	}
	public void setManufacturerId(Integer manufacturerId) {
		this.manufacturerId = manufacturerId;
	}
	public String getManufacturerName() {
		return manufacturerName;
	}
	public void setManufacturerName(String manufacturerName) {
		this.manufacturerName = manufacturerName;
	}
	public String getGoalNoteText() {
		return goalNoteText;
	}
	public void setGoalNoteText(String goalNoteText) {
		this.goalNoteText = goalNoteText;
	}
	public String getPremiumAmount() {
		return premiumAmount;
	}
	public void setPremiumAmount(String premiumAmount) {
		this.premiumAmount = premiumAmount;
	}
	public Integer getIsPreferred() {
		return isPreferred;
	}
	public void setIsPreferred(Integer isPreferred) {
		this.isPreferred = isPreferred;
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
	public String getSuccessionDate() {
		return successionDate;
	}
	public void setSuccessionDate(String successionDate) {
		this.successionDate = successionDate;
	}
	public Integer getGoalTypeId() {
		return goalTypeId;
	}
	public void setGoalTypeId(Integer goalTypeId) {
		this.goalTypeId = goalTypeId;
	}
	public String getRevenueAmount() {
		return revenueAmount;
	}
	public void setRevenueAmount(String revenueAmount) {
		this.revenueAmount = revenueAmount;
	}
	public Double getGoalPercentage() {
		return goalPercentage;
	}
	public void setGoalPercentage(Double goalPercentage) {
		this.goalPercentage = goalPercentage;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
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
	public Integer getGoalYear() {
		return goalYear;
	}
	public void setGoalYear(Integer goalYear) {
		this.goalYear = goalYear;
	}
	public String getLumpSumAmt() {
		return lumpSumAmt;
	}
	public void setLumpSumAmt(String lumpSumAmt) {
		this.lumpSumAmt = lumpSumAmt;
	}
	public String getSipAmt() {
		return sipAmt;
	}
	public void setSipAmt(String sipAmt) {
		this.sipAmt = sipAmt;
	}
	public String getTotalLumpSumAmt() {
		return totalLumpSumAmt;
	}
	public void setTotalLumpSumAmt(String totalLumpSumAmt) {
		this.totalLumpSumAmt = totalLumpSumAmt;
	}
	public String getTotalSipAmt() {
		return totalSipAmt;
	}
	public void setTotalSipAmt(String totalSipAmt) {
		this.totalSipAmt = totalSipAmt;
	}
	public Integer getFpSectionTypeId() {
		return fpSectionTypeId;
	}
	public void setFpSectionTypeId(Integer fpSectionTypeId) {
		this.fpSectionTypeId = fpSectionTypeId;
	}
	public String getInsuranceAmount() {
		return insuranceAmount;
	}
	public void setInsuranceAmount(String insuranceAmount) {
		this.insuranceAmount = insuranceAmount;
	}
	public String getExistingCover() {
		return existingCover;
	}
	public void setExistingCover(String existingCover) {
		this.existingCover = existingCover;
	}
	public String getRequiredCover() {
		return requiredCover;
	}
	public void setRequiredCover(String requiredCover) {
		this.requiredCover = requiredCover;
	}
}
