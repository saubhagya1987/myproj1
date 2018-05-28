package in.fiinfra.common.partner;

public class ActionPlanData {

	private int fpId;
	private int fpApId;
	private String clientName;
	private String clientType;
	private String purpose;
	private String opportunity;
	private String amountInvolved;
	private String potentialRevenue;
	private String recommendedProducts;
	private String investmentAmount;
	private String status;
	private String exStartDate;
	private int partyId;
	
	public String getClientType() {
		return clientType;
	}
	public void setClientType(String clientType) {
		this.clientType = clientType;
	}
	public int getFpId() {
		return fpId;
	}
	public void setFpId(int fpId) {
		this.fpId = fpId;
	}
	public int getFpApId() {
		return fpApId;
	}
	public void setFpApId(int fpApId) {
		this.fpApId = fpApId;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getOpportunity() {
		return opportunity;
	}
	public void setOpportunity(String opportunity) {
		this.opportunity = opportunity;
	}
	public String getAmountInvolved() {
		return amountInvolved;
	}
	public void setAmountInvolved(String amountInvolved) {
		this.amountInvolved = amountInvolved;
	}
	public String getPotentialRevenue() {
		return potentialRevenue;
	}
	public void setPotentialRevenue(String potentialRevenue) {
		this.potentialRevenue = potentialRevenue;
	}
	public String getRecommendedProducts() {
		return recommendedProducts;
	}
	public void setRecommendedProducts(String recommendedProducts) {
		this.recommendedProducts = recommendedProducts;
	}
	public String getInvestmentAmount() {
		return investmentAmount;
	}
	public void setInvestmentAmount(String investmentAmount) {
		this.investmentAmount = investmentAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getExStartDate() {
		return exStartDate;
	}
	public void setExStartDate(String exStartDate) {
		this.exStartDate = exStartDate;
	}
	/**
	 * @return the partyId
	 */
	public int getPartyId() {
		return partyId;
	}
	/**
	 * @param partyId the partyId to set
	 */
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	
	
}
