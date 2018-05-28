package in.fiinfra.common.diy.models;

import in.fiinfra.common.utility.GoalData;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AssetData {
	
	private Integer partyAssetId;
	
	
	private Integer partyId;
	
	
	private Integer partyPortfolioId;
	
	
	private Integer assetTypeId;
	
	
	private String assetType;
	
	
	private String assetName;
	
	
	private Date investmentDate;
	
	
	private String investmentValue;
	
	
	private String maturityValue;
	
	
	private String currentValue;
	
	
	private Double performanceCAGR;
	
	
	private Double performanceXIRR;
	
	
	private Integer goalAllocationPercentUsed;
	
	
	private String accountNo;
	
	
	private String accountFolioNo;
	
	
	private String accountPolicyNo;
	
	
	private Integer productId;
	
	
	private String productName;
	
	
	private Double sipAmount;
	
	
	private Integer sipFreqId;
	
	
	private Integer sipDurationInMonths;
	
	
	private Integer sipDate;
	
	
	private Double dcStockValue;
	
	
	private Double dcDepositValue;
	
	
	private Double dcMfValue;
	
	
	private Double dcRetirementValue;
	
	
	private Double dcGoldValue;
	
	
	private Double dcPropertyValue;
	
	public Integer getSipDate() {
		return sipDate;
	}

	public void setSipDate(Integer sipDate) {
		this.sipDate = sipDate;
	}
	
	
	private String sipStartDate;
	
	
	private String sipEndDate;
	
	
	private Integer createdBy;
	
	
	private Date creationDate;
	
	
	private Integer lastModifiedBy;
	
	
	private Integer lastModifiedDate;
	
	
	private Date currentValueDate;
	
	
	private Double totalUnitsQty;
	
	
	private Integer productTypeId;
	
	
	private Integer ownerPartyId;
	
	
	private String description;
	
	
	private Integer retirementYear;
	public Integer getRetirementYear() {
		return retirementYear;
	}

	public void setRetirementYear(Integer retirementYear) {
		this.retirementYear = retirementYear;
	}
	
	
	
	private Date maturityDate;
	
	
	private Double maturityAmount;
	
	
	private String ownerParty;
	
	
	private String bankName;
	
	
	private Double interestRate;
	
	
	private Integer accountId;

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(Double interestRate) {
		this.interestRate = interestRate;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public Double getMaturityAmount() {
		return maturityAmount;
	}

	public void setMaturityAmount(Double maturityAmount) {
		this.maturityAmount = maturityAmount;
	}
	
	
	private String accountName;
	
	
	private String accountNumber;
	
	
	private String accountType;
	
	
	private Integer accountTypeId;
	
	
	private String branchDetail;
	
	
	private String assetComp;
	
	public String getAssetComp() {
		return assetComp;
	}

	public void setAssetComp(String assetComp) {
		this.assetComp = assetComp;
	}

	public String getOwnerParty() {
		return ownerParty;
	}

	public void setOwnerParty(String ownerParty) {
		this.ownerParty = ownerParty;
	}

	public Integer getOwnerPartyId() {
		return ownerPartyId;
	}

	public void setOwnerPartyId(Integer ownerPartyId) {
		this.ownerPartyId = ownerPartyId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getProductTypeId() {
		return productTypeId;
	}

	public void setProductTypeId(Integer productTypeId) {
		this.productTypeId = productTypeId;
	}
	
	
	private String productType;
	
	
	private String productCategory;

	private final List<GoalData> goals = new ArrayList<GoalData>();

	public Integer getPartyAssetId() {
		return partyAssetId;
	}

	public void setPartyAssetId(Integer partyAssetId) {
		this.partyAssetId = partyAssetId;
	}

	public Integer getPartyId() {
		return partyId;
	}

	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}

	public Integer getPartyPortfolioId() {
		return partyPortfolioId;
	}

	public void setPartyPortfolioId(Integer partyPortfolioId) {
		this.partyPortfolioId = partyPortfolioId;
	}

	public Integer getAssetTypeId() {
		return assetTypeId;
	}

	public void setAssetTypeId(Integer assetTypeId) {
		this.assetTypeId = assetTypeId;
	}

	public String getAssetName() {
		return assetName;
	}

	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}

	public Date getInvestmentDate() {
		return investmentDate;
	}

	public void setInvestmentDate(Date investmentDate) {
		this.investmentDate = investmentDate;
	}

	public String getInvestmentValue() {
		return investmentValue;
	}

	public void setInvestmentValue(String investmentValue) {
		this.investmentValue = investmentValue;
	}

	public String getCurrentValue() {
		return currentValue;
	}

	public void setCurrentValue(String currentValue) {
		this.currentValue = currentValue;
	}

	public Double getPerformanceCAGR() {
		return performanceCAGR;
	}

	public void setPerformanceCAGR(Double performanceCAGR) {
		this.performanceCAGR = performanceCAGR;
	}

	public Double getPerformanceXIRR() {
		return performanceXIRR;
	}

	public void setPerformanceXIRR(Double performanceXIRR) {
		this.performanceXIRR = performanceXIRR;
	}

	public Integer getGoalAllocationPercentUsed() {
		return goalAllocationPercentUsed;
	}

	public void setGoalAllocationPercentUsed(Integer goalAllocationPercentUsed) {
		this.goalAllocationPercentUsed = goalAllocationPercentUsed;
	}

	public String getAccountFolioNo() {
		return accountFolioNo;
	}

	public void setAccountFolioNo(String accountFolioNo) {
		this.accountFolioNo = accountFolioNo;
	}

	public String getAccountPolicyNo() {
		return accountPolicyNo;
	}

	public void setAccountPolicyNo(String accountPolicyNo) {
		this.accountPolicyNo = accountPolicyNo;
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

	public Double getSipAmount() {
		return sipAmount;
	}

	public void setSipAmount(Double sipAmount) {
		this.sipAmount = sipAmount;
	}

	public Integer getSipFreqId() {
		return sipFreqId;
	}

	public void setSipFreqId(Integer sipFreqId) {
		this.sipFreqId = sipFreqId;
	}

	public Integer getSipDurationInMonths() {
		return sipDurationInMonths;
	}

	public void setSipDurationInMonths(Integer sipDurationInMonths) {
		this.sipDurationInMonths = sipDurationInMonths;
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


	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public Integer getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(Integer lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public Integer getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Integer lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public Double getTotalUnitsQty() {
		return totalUnitsQty;
	}

	public void setTotalUnitsQty(Double totalUnitsQty) {
		this.totalUnitsQty = totalUnitsQty;
	}

	public String getAssetType() {
		return assetType;
	}

	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}

	public List<GoalData> getGoals() {
		return goals;
	}

	public void addGoal(GoalData goal) {
		this.goals.add(goal);
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public Date getMaturityDate() {
		return maturityDate;
	}

	public void setMaturityDate(Date maturityDate) {
		this.maturityDate = maturityDate;
	}

	public Date getCurrentValueDate() {
		return currentValueDate;
	}

	public void setCurrentValueDate(Date currentValueDate) {
		this.currentValueDate = currentValueDate;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getBranchDetail() {
		return branchDetail;
	}

	public void setBranchDetail(String branchDetail) {
		this.branchDetail = branchDetail;
	}

	public Integer getAccountTypeId() {
		return accountTypeId;
	}

	public void setAccountTypeId(Integer accountTypeId) {
		this.accountTypeId = accountTypeId;
	}

	public String getMaturityValue() {
		return maturityValue;
	}

	public void setMaturityValue(String maturityValue) {
		this.maturityValue = maturityValue;
	}

	public Double getDcStockValue() {
		return dcStockValue;
	}

	public void setDcStockValue(Double dcStockValue) {
		this.dcStockValue = dcStockValue;
	}

	public Double getDcDepositValue() {
		return dcDepositValue;
	}

	public void setDcDepositValue(Double dcDepositValue) {
		this.dcDepositValue = dcDepositValue;
	}

	public Double getDcMfValue() {
		return dcMfValue;
	}

	public void setDcMfValue(Double dcMfValue) {
		this.dcMfValue = dcMfValue;
	}

	public Double getDcRetirementValue() {
		return dcRetirementValue;
	}

	public void setDcRetirementValue(Double dcRetirementValue) {
		this.dcRetirementValue = dcRetirementValue;
	}

	public Double getDcGoldValue() {
		return dcGoldValue;
	}

	public void setDcGoldValue(Double dcGoldValue) {
		this.dcGoldValue = dcGoldValue;
	}

	public Double getDcPropertyValue() {
		return dcPropertyValue;
	}

	public void setDcPropertyValue(Double dcPropertyValue) {
		this.dcPropertyValue = dcPropertyValue;
	}

}
