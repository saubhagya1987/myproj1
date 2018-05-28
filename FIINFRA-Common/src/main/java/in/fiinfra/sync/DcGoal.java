package in.fiinfra.sync;

public class DcGoal {
	private String goalDescription;
	private String endYear;
	private String goalAmountPv;
	private String goalAmountFv;
	private int goalTypeId;

	public String getGoalDescription() {
		return goalDescription;
	}

	public void setGoalDescription(String goalDescription) {
		this.goalDescription = goalDescription;
	}

	public String getEndYear() {
		return endYear;
	}

	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}

	public String getGoalAmountPv() {
		return goalAmountPv;
	}

	public void setGoalAmountPv(String goalAmountPv) {
		this.goalAmountPv = goalAmountPv;
	}

	public String getGoalAmountFv() {
		return goalAmountFv;
	}

	public void setGoalAmountFv(String goalAmountFv) {
		this.goalAmountFv = goalAmountFv;
	}

	public int getGoalTypeId() {
		return goalTypeId;
	}

	public void setGoalTypeId(int goalTypeId) {
		this.goalTypeId = goalTypeId;
	}

}
