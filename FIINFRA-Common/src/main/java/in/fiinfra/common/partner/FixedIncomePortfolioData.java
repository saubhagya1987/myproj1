package in.fiinfra.common.partner;
/**
 * 
 * @author Raj Mahindra
 * pojo to store data for Add/Edit fixed income form detials
 * @see PortfolioData
 */
public class FixedIncomePortfolioData extends PortfolioData{
	private String depositType;
	private String maturityAmount;
	private String maturityDate;
	private String interestRate;
	private String interestFrequency;
	private String interestPayoutFrequency;
	private String payoutOption;
	private String certificateNo;
	private String installmentFrequency;
	public String getDepositType() {
		return depositType;
	}
	public void setDepositType(String depositType) {
		this.depositType = depositType;
	}
	public String getMaturityAmount() {
		return maturityAmount;
	}
	public void setMaturityAmount(String maturityAmount) {
		this.maturityAmount = maturityAmount;
	}
	public String getMaturityDate() {
		return maturityDate;
	}
	public void setMaturityDate(String maturityDate) {
		this.maturityDate = maturityDate;
	}
	public String getInterestRate() {
		return interestRate;
	}
	public void setInterestRate(String interestRate) {
		this.interestRate = interestRate;
	}
	public String getInterestFrequency() {
		return interestFrequency;
	}
	public void setInterestFrequency(String interestFrequency) {
		this.interestFrequency = interestFrequency;
	}
	public String getInterestPayoutFrequency() {
		return interestPayoutFrequency;
	}
	public void setInterestPayoutFrequency(String interestPayoutFrequency) {
		this.interestPayoutFrequency = interestPayoutFrequency;
	}
	public String getPayoutOption() {
		return payoutOption;
	}
	public void setPayoutOption(String payoutOption) {
		this.payoutOption = payoutOption;
	}
	public String getCertificateNo() {
		return certificateNo;
	}
	public void setCertificateNo(String certificateNo) {
		this.certificateNo = certificateNo;
	}
	public String getInstallmentFrequency() {
		return installmentFrequency;
	}
	public void setInstallmentFrequency(String installmentFrequency) {
		this.installmentFrequency = installmentFrequency;
	}
	

	
}
