package in.fiinfra.common.partner;

public class AssetAllocationOfGoal {
	
	private String AssetName;
	private String cost;
	private String currentvalue;
	private String cagr;
	private String AssetPercentAllocated2Goal;
	private String percentContributiontoGoal;
	public String getAssetName() {
		return AssetName;
	}
	public void setAssetName(String assetName) {
		AssetName = assetName;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getCurrentvalue() {
		return currentvalue;
	}
	public void setCurrentvalue(String currentvalue) {
		this.currentvalue = currentvalue;
	}
	public String getCagr() {
		return cagr;
	}
	public void setCagr(String cagr) {
		this.cagr = cagr;
	}
	public String getAssetPercentAllocated2Goal() {
		return AssetPercentAllocated2Goal;
	}
	public void setAssetPercentAllocated2Goal(String assetPercentAllocated2Goal) {
		AssetPercentAllocated2Goal = assetPercentAllocated2Goal;
	}
	public String getPercentContributiontoGoal() {
		return percentContributiontoGoal;
	}
	public void setPercentContributiontoGoal(String percentContributiontoGoal) {
		this.percentContributiontoGoal = percentContributiontoGoal;
	}

}
