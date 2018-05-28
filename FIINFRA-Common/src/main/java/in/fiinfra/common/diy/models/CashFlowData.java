package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonProperty;

public class CashFlowData {
	@JsonProperty
	private String monthlyIncome;
	@JsonProperty
	private String monthlyExpenditure;
	@JsonProperty
	private String surplus;
	@JsonProperty
	private String currentInvest;
	@JsonProperty
	private String surPlusRatioStatus;
	@JsonProperty
	private String savingRatioStatus;
	@JsonProperty
	private String emiRatioStatus;
	@JsonProperty
	private String liquididyRatioStatus;
	@JsonProperty
	private String solvencyRatioStatus;
	@JsonProperty
	private String debtAssetRatioStatus;
	@JsonProperty
	private String source1;
	@JsonProperty
	private String source2;
	@JsonProperty
	private String source3;
	@JsonProperty
	private String totIncomeSource;
	@JsonProperty
	private String totExpenseAmount;
	@JsonProperty
	private String totEMI;
	@JsonProperty
	private String totPremiums;
	@JsonProperty
	private String totExpenses;
	@JsonProperty
	private String surplusRatio;
	@JsonProperty
	private String savingRatio;
	@JsonProperty
	private String emiRatio;
	@JsonProperty
	private String liquidityRatio;
	@JsonProperty
	private String solvencyRatio;
	@JsonProperty
	private String debtAssetRatio;
	@JsonProperty
	private String netSurplusAmt;

	
	
	
	
	
	public String getMonthlyExpenditure() {
		return monthlyExpenditure;
	}

	public void setMonthlyExpenditure(String monthlyExpenditure) {
		this.monthlyExpenditure = monthlyExpenditure;
	}
	public String getMonthlyIncome() {
		return monthlyIncome;
	}

	public void setMonthlyIncome(String monthlyIncome) {
		this.monthlyIncome = monthlyIncome;
	}

	public String getCurrentInvest() {
		return currentInvest;
	}

	public void setCurrentInvest(String currentInvest) {
		this.currentInvest = currentInvest;
	}

	public String getTotIncomeSource() {
		return totIncomeSource;
	}

	public void setTotIncomeSource(String totIncomeSource) {
		this.totIncomeSource = totIncomeSource;
	}

	public String getSurplusRatio() {
		return surplusRatio;
	}

	public void setSurplusRatio(String surplusRatio) {
		this.surplusRatio = surplusRatio;
	}

	public String getEmiRatio() {
		return emiRatio;
	}

	public void setEmiRatio(String emiRatio) {
		this.emiRatio = emiRatio;
	}

	public String getLiquidityRatio() {
		return liquidityRatio;
	}

	public void setLiquidityRatio(String liquidityRatio) {
		this.liquidityRatio = liquidityRatio;
	}

	public String getSolvencyRatio() {
		return solvencyRatio;
	}

	public void setSolvencyRatio(String solvencyRatio) {
		this.solvencyRatio = solvencyRatio;
	}

	public String getDebtAssetRatio() {
		return debtAssetRatio;
	}

	public void setDebtAssetRatio(String debtAssetRatio) {
		this.debtAssetRatio = debtAssetRatio;
	}

	public String getSavingRatio() {
		return savingRatio;
	}

	public void setSavingRatio(String savingRatio) {
		this.savingRatio = savingRatio;
	}

	public String getNetSurplusAmt() {
		return netSurplusAmt;
	}

	public void setNetSurplusAmt(String netSurplusAmt) {
		this.netSurplusAmt = netSurplusAmt;
	}

	public String getSurplus() {
		return surplus;
	}

	public void setSurplus(String surplus) {
		this.surplus = surplus;
	}

	public String getSurPlusRatioStatus() {
		return surPlusRatioStatus;
	}

	public void setSurPlusRatioStatus(String surPlusRatioStatus) {
		this.surPlusRatioStatus = surPlusRatioStatus;
	}

	public String getSavingRatioStatus() {
		return savingRatioStatus;
	}

	public void setSavingRatioStatus(String savingRatioStatus) {
		this.savingRatioStatus = savingRatioStatus;
	}

	public String getEmiRatioStatus() {
		return emiRatioStatus;
	}

	public void setEmiRatioStatus(String emiRatioStatus) {
		this.emiRatioStatus = emiRatioStatus;
	}

	public String getLiquididyRatioStatus() {
		return liquididyRatioStatus;
	}

	public void setLiquididyRatioStatus(String liquididyRatioStatus) {
		this.liquididyRatioStatus = liquididyRatioStatus;
	}

	public String getSolvencyRatioStatus() {
		return solvencyRatioStatus;
	}

	public void setSolvencyRatioStatus(String solvencyRatioStatus) {
		this.solvencyRatioStatus = solvencyRatioStatus;
	}

	public String getDebtAssetRatioStatus() {
		return debtAssetRatioStatus;
	}

	public void setDebtAssetRatioStatus(String debtAssetRatioStatus) {
		this.debtAssetRatioStatus = debtAssetRatioStatus;
	}

	public String getSource1() {
		return source1;
	}

	public void setSource1(String source1) {
		this.source1 = source1;
	}

	public String getSource2() {
		return source2;
	}

	public void setSource2(String source2) {
		this.source2 = source2;
	}

	public String getSource3() {
		return source3;
	}

	public void setSource3(String source3) {
		this.source3 = source3;
	}

	public String getTotExpenseAmount() {
		return totExpenseAmount;
	}

	public void setTotExpenseAmount(String totExpenseAmount) {
		this.totExpenseAmount = totExpenseAmount;
	}

	public String getTotEMI() {
		return totEMI;
	}

	public void setTotEMI(String totEMI) {
		this.totEMI = totEMI;
	}

	public String getTotPremiums() {
		return totPremiums;
	}

	public void setTotPremiums(String totPremiums) {
		this.totPremiums = totPremiums;
	}

	public String getTotExpenses() {
		return totExpenses;
	}

	public void setTotExpenses(String totExpenses) {
		this.totExpenses = totExpenses;
	}

}
