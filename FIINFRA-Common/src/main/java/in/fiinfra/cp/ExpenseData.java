package in.fiinfra.cp;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class ExpenseData {

	private Integer partyExpenseID;
	private Integer partyID;
	private Integer expenseTypeID;
	private Integer expenseSubTypeID;
	private String expenseName;
	private long expenseAmount;
	private int expenseFrequencyID;
	private long annualExpenseAmount;
	private int createdBy;
	private String expenseType;
	private String expenseSubType;
	private String expenseFrequency;
	private String createdDate;
	private Integer lastModifiedBy;
	private String lastModifiedDate;
	private int batchRunId;
	private int growthRate;
	private int currencyDenominationId;

	public int getCurrencyDenominationId() {
		return currencyDenominationId;
	}

	public void setCurrencyDenominationId(int currencyDenominationId) {
		this.currencyDenominationId = currencyDenominationId;
	}

	public Integer getPartyExpenseID() {
		return partyExpenseID;
	}

	public void setPartyExpenseID(Integer partyExpenseID) {
		this.partyExpenseID = partyExpenseID;
	}

	public Integer getPartyID() {
		return partyID;
	}

	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}

	public Integer getExpenseTypeID() {
		return expenseTypeID;
	}

	public void setExpenseTypeID(Integer expenseTypeID) {
		this.expenseTypeID = expenseTypeID;
	}

	public Integer getExpenseSubTypeID() {
		return expenseSubTypeID;
	}

	public void setExpenseSubTypeID(Integer expenseSubTypeID) {
		this.expenseSubTypeID = expenseSubTypeID;
	}

	public String getExpenseName() {
		return expenseName;
	}

	public void setExpenseName(String expenseName) {
		this.expenseName = expenseName;
	}

	public long getExpenseAmount() {
		return expenseAmount;
	}

	public void setExpenseAmount(long expenseAmount) {
		this.expenseAmount = expenseAmount;
	}

	public Integer getExpenseFrequencyID() {
		return expenseFrequencyID;
	}

	public void setExpenseFrequencyID(Integer expenseFrequencyID) {
		this.expenseFrequencyID = expenseFrequencyID;
	}

	public long getAnnualExpenseAmount() {
		return annualExpenseAmount;
	}

	public void setAnnualExpenseAmount(long annualExpenseAmount) {
		this.annualExpenseAmount = annualExpenseAmount;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
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

	public int getBatchRunId() {
		return batchRunId;
	}

	public void setBatchRunId(int batchRunId) {
		this.batchRunId = batchRunId;
	}

	public String getExpenseType() {
		return expenseType;
	}

	public void setExpenseType(String expenseType) {
		this.expenseType = expenseType;
	}

	public String getExpenseSubType() {
		return expenseSubType;
	}

	public void setExpenseSubType(String expenseSubType) {
		this.expenseSubType = expenseSubType;
	}

	public String getExpenseFrequency() {
		return expenseFrequency;
	}

	public void setExpenseFrequency(String expenseFrequency) {
		this.expenseFrequency = expenseFrequency;
	}

	public int getGrowthRate() {
		return growthRate;
	}

	public void setGrowthRate(int growthRate) {
		this.growthRate = growthRate;
	}



}
