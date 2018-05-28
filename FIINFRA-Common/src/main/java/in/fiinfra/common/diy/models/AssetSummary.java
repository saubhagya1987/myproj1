package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;

public class AssetSummary {
	
	@JsonProperty
	@JsonIgnore
	private Integer partyAssetId;
	@JsonProperty
	@JsonIgnore
	private Integer partyPortfolioId;
	@JsonProperty
	@JsonIgnore
	private Integer ownerPartyId;
	@JsonProperty
	@JsonIgnore
	private Integer partyId;
	@JsonProperty
	@JsonIgnore
	private String ownerName;
	@JsonProperty
	@JsonIgnore
	private Integer assetTypeId;
	@JsonProperty
	@JsonIgnore
	private String assetName;
	@JsonProperty
	@JsonIgnore
	private String bankName;
	@JsonProperty
	@JsonIgnore
	private String accountNumber;
	@JsonProperty
	@JsonIgnore
	private String commcementDate;
	@JsonProperty
	@JsonIgnore
	private String monthlyDeposited;
	@JsonProperty
	@JsonIgnore
	private String maturityDate;
	@JsonProperty
	@JsonIgnore
	private String maturityValue;
	@JsonProperty
	@JsonIgnore
	private String interestRate;
	@JsonProperty
	@JsonIgnore
	private String currentBalance;
	@JsonProperty
	@JsonIgnore
	private String fundScheme;
	@JsonProperty
	@JsonIgnore
	private String assetMgntComp;
	@JsonProperty
	@JsonIgnore
	private String folioNumber;
	@JsonProperty
	@JsonIgnore
	private String sipAmount;
	@JsonProperty
	@JsonIgnore
	private String sipStartDate;
	@JsonProperty
	@JsonIgnore
	private String sipEndDate;
	@JsonProperty
	@JsonIgnore
	private Integer frequency;
	@JsonProperty
	@JsonIgnore
	private Double noOfUnits;
	@JsonProperty
	@JsonIgnore
	private String description;
	@JsonProperty
	@JsonIgnore
	private Integer year;
	@JsonProperty
	@JsonIgnore
	private Integer goalCount;
	@JsonProperty
	@JsonIgnore
	private String allocatedValue;
	@JsonProperty
	@JsonIgnore
	private String percentage;
	@JsonProperty
	@JsonIgnore
	private Integer productId;
	@JsonProperty
	@JsonIgnore
	private Integer goalId;
	
	public Integer getGoalId() {
		return goalId;
	}
	public void setGoalId(Integer goalId) {
		this.goalId = goalId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getAllocatedValue() {
		return allocatedValue;
	}
	public void setAllocatedValue(String allocatedValue) {
		this.allocatedValue = allocatedValue;
	}
	public String getPercentage() {
		return percentage;
	}
	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}
	public Integer getGoalCount() {
		return goalCount;
	}
	public void setGoalCount(Integer goalCount) {
		this.goalCount = goalCount;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getPartyAssetId() {
		return partyAssetId;
	}
	public void setPartyAssetId(Integer partyAssetId) {
		this.partyAssetId = partyAssetId;
	}
	public Integer getPartyPortfolioId() {
		return partyPortfolioId;
	}
	public void setPartyPortfolioId(Integer partyPortfolioId) {
		this.partyPortfolioId = partyPortfolioId;
	}
	public Integer getOwnerPartyId() {
		return ownerPartyId;
	}
	public void setOwnerPartyId(Integer ownerPartyId) {
		this.ownerPartyId = ownerPartyId;
	}
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public Integer getAssetTypeId() {
		return assetTypeId;
	}
	public void setAssetTypeId(Integer assetTypeId) {
		this.assetTypeId = assetTypeId;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getAssetName() {
		return assetName;
	}
	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getCommcementDate() {
		return commcementDate;
	}
	public void setCommcementDate(String commcementDate) {
		this.commcementDate = commcementDate;
	}
	public String getMonthlyDeposited() {
		return monthlyDeposited;
	}
	public void setMonthlyDeposited(String monthlyDeposited) {
		this.monthlyDeposited = monthlyDeposited;
	}
	public String getMaturityDate() {
		return maturityDate;
	}
	public void setMaturityDate(String maturityDate) {
		this.maturityDate = maturityDate;
	}
	public String getMaturityValue() {
		return maturityValue;
	}
	public void setMaturityValue(String maturityValue) {
		this.maturityValue = maturityValue;
	}
	public String getInterestRate() {
		return interestRate;
	}
	public void setInterestRate(String interestRate) {
		this.interestRate = interestRate;
	}
	public String getCurrentBalance() {
		return currentBalance;
	}
	public void setCurrentBalance(String currentBalance) {
		this.currentBalance = currentBalance;
	}
	public String getFundScheme() {
		return fundScheme;
	}
	public void setFundScheme(String fundScheme) {
		this.fundScheme = fundScheme;
	}
	public String getAssetMgntComp() {
		return assetMgntComp;
	}
	public void setAssetMgntComp(String assetMgntComp) {
		this.assetMgntComp = assetMgntComp;
	}
	public String getFolioNumber() {
		return folioNumber;
	}
	public void setFolioNumber(String folioNumber) {
		this.folioNumber = folioNumber;
	}
	public String getSipAmount() {
		return sipAmount;
	}
	public void setSipAmount(String sipAmount) {
		this.sipAmount = sipAmount;
	}
	public String getSipStartDate() {
		return sipStartDate;
	}
	public void setSipStartDate(String sipStartDate) {
		this.sipStartDate = sipStartDate;
	}
	public String getSipEndDate() {
		return sipEndDate;
	}
	public void setSipEndDate(String sipEndDate) {
		this.sipEndDate = sipEndDate;
	}
	public Integer getFrequency() {
		return frequency;
	}
	public void setFrequency(Integer frequency) {
		this.frequency = frequency;
	}
	public Double getNoOfUnits() {
		return noOfUnits;
	}
	public void setNoOfUnits(Double noOfUnits) {
		this.noOfUnits = noOfUnits;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
