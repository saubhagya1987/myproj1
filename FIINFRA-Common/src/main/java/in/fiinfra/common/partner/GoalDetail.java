package in.fiinfra.common.partner;

public class GoalDetail {
	private String name;
	private String goalName;
	private String goalAmountPV;
	private String goalAmountFV;
	private String duein;
	private String achievedGoalPercetage;
	
    private String Amount;
    private String widthPercentage;
    private String achivedGoalPercentageSofar;
	
	
	
	public String getAchivedGoalPercentageSofar() {
		return achivedGoalPercentageSofar;
	}
	public void setAchivedGoalPercentageSofar(String achivedGoalPercentageSofar) {
		this.achivedGoalPercentageSofar = achivedGoalPercentageSofar;
	}
	public String getAchievedGoalPercetage() {
		return achievedGoalPercetage;
	}
	public void setAchievedGoalPercetage(String achievedGoalPercetage) {
		this.achievedGoalPercetage = achievedGoalPercetage;
	}
	public String getName() {
		return name;
	}
	
	public String getAmount() {
		return Amount;
	}
	public void setAmount(String amount) {
		Amount = amount;
	}
	public String getWidthPercentage() {
		return widthPercentage;
	}
	public void setWidthPercentage(String widthPercentage) {
		this.widthPercentage = widthPercentage;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGoalName() {
		return goalName;
	}
	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}
	public String getGoalAmountPV() {
		return goalAmountPV;
	}
	public void setGoalAmountPV(String goalAmountPV) {
		this.goalAmountPV = goalAmountPV;
	}
	public String getGoalAmountFV() {
		return goalAmountFV;
	}
	public void setGoalAmountFV(String goalAmountFV) {
		this.goalAmountFV = goalAmountFV;
	}
	public String getDuein() {
		return duein;
	}
	public void setDuein(String duein) {
		this.duein = duein;
	}
	public String getGoalEndYear() {
		return goalEndYear;
	}
	public void setGoalEndYear(String goalEndYear) {
		this.goalEndYear = goalEndYear;
	}
	private String goalEndYear;
}
