package in.fiinfra.cp.common.model;

import in.fiinfra.common.common.BaseRequest;

public class FinancialRequest extends BaseRequest {

	int incomeId;
	int expenseId;
	int partyIncomeId;
	int partyExpenseId;
	
	public int getPartyIncomeId() {
		return partyIncomeId;
	}

	public void setPartyIncomeId(int partyIncomeId) {
		this.partyIncomeId = partyIncomeId;
	}

	public int getPartyExpenseId() {
		return partyExpenseId;
	}

	public void setPartyExpenseId(int partyExpenseId) {
		this.partyExpenseId = partyExpenseId;
	}

	public int getExpenseId() {
		return expenseId;
	}

	public void setExpenseId(int expenseId) {
		this.expenseId = expenseId;
	}

	public int getIncomeId() {
		return incomeId;
	}

	public void setIncomeId(int incomeId) {
		this.incomeId = incomeId;
	}

	@Override
	protected void appendAll(StringBuilder sb) {
		super.appendAll(sb);
		append(sb, "incomeId", this.incomeId);
		append(sb, "expenseId", this.expenseId);
		append(sb,"partyIncomeId",this.partyIncomeId);
		append(sb, "partyExpenseId", this.partyExpenseId);
	}
}
