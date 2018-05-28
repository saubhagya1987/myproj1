package in.fiinfra.common.partner;

public class GoalListData {
	private int goalId;
	private int partyId;

private String recordTypeId;
private String goalName;
private String contactName;
private String goalType;
private String goalEndYear;
private String currentCost;
private String futureCost;
private String investmentAmount;
public String getEstimatedRevenue() {
	return estimatedRevenue;
}
public void setEstimatedRevenue(String estimatedRevenue) {
	this.estimatedRevenue = estimatedRevenue;
}
private String estimatedRevenue;
private String goalStatus;
private String AchievementScale;
public String getGoalName() {
	return goalName;
}
public void setGoalName(String goalName) {
	this.goalName = goalName;
}
public String getContactName() {
	return contactName;
}
public void setContactName(String contactName) {
	this.contactName = contactName;
}
public String getGoalType() {
	return goalType;
}
public void setGoalType(String goalType) {
	this.goalType = goalType;
}
public String getGoalEndYear() {
	return goalEndYear;
}
public void setGoalEndYear(String goalEndYear) {
	this.goalEndYear = goalEndYear;
}
public String getCurrentCost() {
	return currentCost;
}
public void setCurrentCost(String currentCost) {
	this.currentCost = currentCost;
}
public String getFutureCost() {
	return futureCost;
}
public void setFutureCost(String futureCost) {
	this.futureCost = futureCost;
}
public String getInvestmentAmount() {
	return investmentAmount;
}
public void setInvestmentAmount(String investmentAmount) {
	this.investmentAmount = investmentAmount;
}
public String getGoalStatus() {
	return goalStatus;
}
public void setGoalStatus(String goalStatus) {
	this.goalStatus = goalStatus;
}
public String getAchievementScale() {
	return AchievementScale;
}
public void setAchievementScale(String achievementScale) {
	AchievementScale = achievementScale;
}
public int getGoalId() {
	return goalId;
}
public void setGoalId(int goalId) {
	this.goalId = goalId;
}
public String getRecordTypeId() {
	return recordTypeId;
}
public void setRecordTypeId(String recordTypeId) {
	this.recordTypeId = recordTypeId;
}
public int getPartyId() {
	return partyId;
}
public void setPartyId(int partyId) {
	this.partyId = partyId;
}
}
