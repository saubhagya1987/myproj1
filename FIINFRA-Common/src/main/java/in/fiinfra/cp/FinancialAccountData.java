package in.fiinfra.cp;


public class FinancialAccountData {
	private Integer partyFinancialAccountID;
	private String accountNumber;
	private String accountName;
	private String bankName;
	private String IFSCNo;
	private String branchCode;
	private Integer createdBy;
	private Integer lastModifiedBy;
	public String getPartyId() {
		return partyId;
	}
	public void setPartyId(String partyId) {
		this.partyId = partyId;
	}
	private String partyId;
	public Integer getPartyFinancialAccountID() {
		return partyFinancialAccountID;
	}
	public void setPartyFinancialAccountID(Integer partyFinancialAccountID) {
		this.partyFinancialAccountID = partyFinancialAccountID;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getIFSCNo() {
		return IFSCNo;
	}
	public void setIFSCNo(String iFSCNo) {
		IFSCNo = iFSCNo;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public Integer getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(Integer lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	

	
}
