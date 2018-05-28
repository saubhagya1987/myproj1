package in.fiinfra.cp;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class IncomeData {
	private Integer partyIncomeId;
	private Integer partyId;
	private Integer incomeTypeId;
	private Integer incomeSubTypeId;
	private String incomeName;
	private String incomeType; 
	private long incomeAmount;
	private Integer incomeFrequencyId;
	private long annualIncomeAmount;
	private Integer createdBy;
	private String creationDate;
	private Integer lastModifiedBy;
	private String lastModifiedDate;
	public int getCurrencyDenominationId() {
		return currencyDenominationId;
	}
	public void setCurrencyDenominationId(int currencyDenominationId) {
		this.currencyDenominationId = currencyDenominationId;
	}
	private Integer batchRunId;
	private String incomeFrequency;
	private double annualGrowth;
	private int currencyDenominationId;
	
	public Integer getPartyIncomeId() {
		return partyIncomeId;
	}
	public void setPartyIncomeId(Integer partyIncomeId) {
		this.partyIncomeId = partyIncomeId;
	}
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	public Integer getIncomeTypeId() {
		return incomeTypeId;
	}
	public void setIncomeTypeId(Integer incomeTypeId) {
		this.incomeTypeId = incomeTypeId;
	}
	public Integer getIncomeSubTypeId() {
		return incomeSubTypeId;
	}
	public void setIncomeSubTypeId(Integer incomeSubTypeId) {
		this.incomeSubTypeId = incomeSubTypeId;
	}
	public String getIncomeName() {
		return incomeName;
	}
	public void setIncomeName(String incomeName) {
		this.incomeName = incomeName;
	}
	public long getIncomeAmount() {
		return incomeAmount;
	}
	public void setIncomeAmount(long incomeAmount) {
		this.incomeAmount = incomeAmount;
	}
	public Integer getIncomeFrequencyId() {
		return incomeFrequencyId;
	}
	public void setIncomeFrequencyId(Integer incomeFrequencyId) {
		this.incomeFrequencyId = incomeFrequencyId;
	}
	public long getAnnualIncomeAmount() {
		return annualIncomeAmount;
	}
	public void setAnnualIncomeAmount(long annualIncomeAmount) {
		this.annualIncomeAmount = annualIncomeAmount;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
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
	public String getIncomeType() {
		return incomeType;
	}
	public void setIncomeType(String incomeType) {
		this.incomeType = incomeType;
	}
	public String getIncomeFrequency() {
		return incomeFrequency;
	}
	public void setIncomeFrequency(String incomeFrequency) {
		this.incomeFrequency = incomeFrequency;
	}
	public double getAnnualGrowth() {
		return annualGrowth;
	}
	public void setAnnualGrowth(double annualGrowth) {
		this.annualGrowth = annualGrowth;
	}
	
	
	
}
