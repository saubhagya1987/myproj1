package in.fiinfra.portfolio;

public class PortfolioSummary {
   private String product;
   private String currentValue;
   private String investement;
   private GoalSummary goals;
   
   
public String getProduct() {
	return product;
}
public void setProduct(String product) {
	this.product = product;
}
public String getCurrentValue() {
	return currentValue;
}
public void setCurrentValue(String currentValue) {
	this.currentValue = currentValue;
}
public String getInvestement() {
	return investement;
}
public void setInvestement(String investement) {
	this.investement = investement;
}
public GoalSummary getGoals() {
	return goals;
}
public void setGoals(GoalSummary goals) {
	this.goals = goals;
}
   
}
