package in.fiinfra.cp;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class AchievementScaleData {
	
	private Integer goalScale;
	private Integer riskScale;
	private Integer successionScale;
	private int totalScale;
	private boolean investmentKnown;
	private boolean moneyKnown;
	private boolean willPrepared;
	
	public Integer getGoalScale() {
		return goalScale;
	}
	public void setGoalScale(Integer goalScale) {
		this.goalScale = goalScale;
	}
	public Integer getRiskScale() {
		return riskScale;
	}
	public void setRiskScale(Integer riskScale) {
		this.riskScale = riskScale;
	}
	public Integer getSuccessionScale() {
		return successionScale;
	}
	public void setSuccessionScale(Integer successionScale) {
		this.successionScale = successionScale;
	}
	public int getTotalScale() {
		return totalScale;
	}
	public void setTotalScale(int totalScale) {
		this.totalScale = totalScale;
	}
	public boolean isInvestmentKnown() {
		return investmentKnown;
	}
	public void setInvestmentKnown(boolean investmentKnown) {
		this.investmentKnown = investmentKnown;
	}
	public boolean isMoneyKnown() {
		return moneyKnown;
	}
	public void setMoneyKnown(boolean moneyKnown) {
		this.moneyKnown = moneyKnown;
	}
	public boolean isWillPrepared() {
		return willPrepared;
	}
	public void setWillPrepared(boolean willPrepared) {
		this.willPrepared = willPrepared;
	}
	
	
	}
