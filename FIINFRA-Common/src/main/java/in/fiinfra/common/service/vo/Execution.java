package in.fiinfra.common.service.vo;

public class Execution {
	private String date;
	private String opportunity;
	private String productName;
	private String lastName;
	private String status;
	private String txnamount;
	private String elapseddays;
	private int executionOpen;
	private int executionCompleted;
	private String investmentAmount;
	private String actualRevenue;
	
	private String duration;
	private String txnType;
	
	
	
	public String getTxnType() {
		return txnType;
	}
	public void setTxnType(String txnType) {
		this.txnType = txnType;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public int getExecutionOpen() {
		return executionOpen;
	}
	public void setExecutionOpen(int executionOpen) {
		this.executionOpen = executionOpen;
	}
	public int getExecutionCompleted() {
		return executionCompleted;
	}
	public void setExecutionCompleted(int executionCompleted) {
		this.executionCompleted = executionCompleted;
	}

	
	public String getInvestmentAmount() {
		return investmentAmount;
	}
	public void setInvestmentAmount(String investmentAmount) {
		this.investmentAmount = investmentAmount;
	}
	public String getActualRevenue() {
		return actualRevenue;
	}
	public void setActualRevenue(String actualRevenue) {
		this.actualRevenue = actualRevenue;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getOpportunity() {
		return opportunity;
	}
	public void setOpportunity(String opportunity) {
		this.opportunity = opportunity;
	}
	public String getTxnamount() {
		return txnamount;
	}
	public void setTxnamount(String txnamount) {
		this.txnamount = txnamount;
	}
	public String getElapseddays() {
		return elapseddays;
	}
	public void setElapseddays(String elapseddays) {
		this.elapseddays = elapseddays;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
