package in.fiinfra.cp;

import in.fiinfra.common.utility.GoalData;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class AssetData {
	private Integer partyAssetId;
	private Integer partyId;
	private Integer partyPortfolioId;
	private Integer assetTypeId;
	private String assetType;
	private String assetName;
	private Date investmentDate;
	private long investmentValue;
	private double maturityValue;
	private long currentValue;
	private long transId;
	private long propertyName;
	public long getTransId() {
		return transId;
	}

	public void setTransId(long transId) {
		this.transId = transId;
	}

	public long getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(long propertyName) {
		this.propertyName = propertyName;
	}

	public long getPurchaseAmount() {
		return purchaseAmount;
	}

	public void setPurchaseAmount(long purchaseAmount) {
		this.purchaseAmount = purchaseAmount;
	}

	private long purchaseAmount;
	private long performanceCAGR;
	private long performanceXIRR;
	private Integer goalAllocationPercentUsed;
	private String accountNo;
	private String accountFolioNo;
	private String accountPolicyNo;
	private Integer productId;
	private String productName;
	private long sipAmount;
	private Integer sipFreqId;
	private Integer sipDurationInMonths;
	private Integer sipDate;
	
	private double dcStockValue;
	private double dcDepositValue;
	private double dcMfValue;
	private double dcRetirementValue;
	private double dcGoldValue;
	private double dcPropertyValue;
	
	public Integer getSipDate() {
		return sipDate;
	}

	public void setSipDate(Integer sipDate) {
		this.sipDate = sipDate;
	}

	private Date sipStartDate;
	private Date sipEndDate;
	private Integer createdBy;
	private Date creationDate;
	private Integer lastModifiedBy;
	private Integer lastModifiedDate;
	private Date currentValueDate;
	private long totalUnitsQty;
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
	private long maturityAmount;
	private String ownerParty;
	private String bankName;
	private long interestRate;
	private Integer accountId;

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public long getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(long interestRate) {
		this.interestRate = interestRate;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public long getMaturityAmount() {
		return maturityAmount;
	}

	public void setMaturityAmount(long maturityAmount) {
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

	public long getInvestmentValue() {
		return investmentValue;
	}

	public void setInvestmentValue(long investmentValue) {
		this.investmentValue = investmentValue;
	}

	public long getCurrentValue() {
		return currentValue;
	}

	public void setCurrentValue(long currentValue) {
		this.currentValue = currentValue;
	}

	public long getPerformanceCAGR() {
		return performanceCAGR;
	}

	public void setPerformanceCAGR(long performanceCAGR) {
		this.performanceCAGR = performanceCAGR;
	}

	public long getPerformanceXIRR() {
		return performanceXIRR;
	}

	public void setPerformanceXIRR(long performanceXIRR) {
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

	public long getSipAmount() {
		return sipAmount;
	}

	public void setSipAmount(long sipAmount) {
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

	public Date getSipStartDate() {
		return sipStartDate;
	}

	public void setSipStartDate(Date sipStartDate) {
		this.sipStartDate = sipStartDate;
	}

	public Date getSipEndDate() {
		return sipEndDate;
	}

	public void setSipEndDate(Date sipEndDate) {
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

	public long getTotalUnitsQty() {
		return totalUnitsQty;
	}

	public void setTotalUnitsQty(long totalUnitsQty) {
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

	public double getMaturityValue() {
		return maturityValue;
	}

	public void setMaturityValue(double maturityValue) {
		this.maturityValue = maturityValue;
	}

	public double getDcStockValue() {
		return dcStockValue;
	}

	public void setDcStockValue(double dcStockValue) {
		this.dcStockValue = dcStockValue;
	}

	public double getDcDepositValue() {
		return dcDepositValue;
	}

	public void setDcDepositValue(double dcDepositValue) {
		this.dcDepositValue = dcDepositValue;
	}

	public double getDcMfValue() {
		return dcMfValue;
	}

	public void setDcMfValue(double dcMfValue) {
		this.dcMfValue = dcMfValue;
	}

	public double getDcRetirementValue() {
		return dcRetirementValue;
	}

	public void setDcRetirementValue(double dcRetirementValue) {
		this.dcRetirementValue = dcRetirementValue;
	}

	public double getDcGoldValue() {
		return dcGoldValue;
	}

	public void setDcGoldValue(double dcGoldValue) {
		this.dcGoldValue = dcGoldValue;
	}

	public double getDcPropertyValue() {
		return dcPropertyValue;
	}

	public void setDcPropertyValue(double dcPropertyValue) {
		this.dcPropertyValue = dcPropertyValue;
	}

}
