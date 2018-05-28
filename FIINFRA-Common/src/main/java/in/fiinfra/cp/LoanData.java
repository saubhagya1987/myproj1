package in.fiinfra.cp;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class LoanData {
	
	private Integer partyLoanId;
	private Integer partyId;
	private Integer loanTypeId;
	private String loanType;
	private String loanName;
	private Integer productId;
	private String productName;
	private long loanAmount;
	private Integer loanTenureMonths;
	private long emiAmount;
	private Integer emiFreqId;
	private long emiFreqValue;
	private Integer canPrepay;
	private long prepayPenaltyPercentage;
	private Integer linkedPartyAssetId;
	private Integer createdBy;
	private String createdDate;
	private Integer lastModifiedBy;
	private String lastModifiedDate;
	private Integer batchRunId;
	public Integer getPartyLoanId() {
		return partyLoanId;
	}
	public void setPartyLoanId(Integer partyLoanId) {
		this.partyLoanId = partyLoanId;
	}
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	public Integer getLoanTypeId() {
		return loanTypeId;
	}
	public void setLoanTypeId(Integer loanTypeId) {
		this.loanTypeId = loanTypeId;
	}
	public String getLoanName() {
		return loanName;
	}
	public void setLoanName(String loanName) {
		this.loanName = loanName;
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
	public long getLoanAmount() {
		return loanAmount;
	}
	public void setLoanAmount(long loanAmount) {
		this.loanAmount = loanAmount;
	}
	public Integer getLoanTenureMonths() {
		return loanTenureMonths;
	}
	public void setLoanTenureMonths(Integer loanTenureMonths) {
		this.loanTenureMonths = loanTenureMonths;
	}
	public long getEmiAmount() {
		return emiAmount;
	}
	public void setEmiAmount(long emiAmount) {
		this.emiAmount = emiAmount;
	}
	public Integer getEmiFreqId() {
		return emiFreqId;
	}
	public void setEmiFreqId(Integer emiFreqId) {
		this.emiFreqId = emiFreqId;
	}
	public long getEmiFreqValue() {
		return emiFreqValue;
	}
	public void setEmiFreqValue(long emiFreqValue) {
		this.emiFreqValue = emiFreqValue;
	}
	public Integer getCanPrepay() {
		return canPrepay;
	}
	public void setCanPrepay(Integer canPrepay) {
		this.canPrepay = canPrepay;
	}
	public long getPrepayPenaltyPercentage() {
		return prepayPenaltyPercentage;
	}
	public void setPrepayPenaltyPercentage(long prepayPenaltyPercentage) {
		this.prepayPenaltyPercentage = prepayPenaltyPercentage;
	}
	public Integer getLinkedPartyAssetId() {
		return linkedPartyAssetId;
	}
	public void setLinkedPartyAssetId(Integer linkedPartyAssetId) {
		this.linkedPartyAssetId = linkedPartyAssetId;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public Integer getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(Integer lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public String getLastModifiedDate() {
		return lastModifiedDate;
	}
	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	public Integer getBatchRunId() {
		return batchRunId;
	}
	public void setBatchRunId(Integer batchRunId) {
		this.batchRunId = batchRunId;
	}
	public String getLoanType() {
		return loanType;
	}
	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}

	
}
