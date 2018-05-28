/**
 * 
 */
package in.fiinfra.common.diy.models;

import java.util.List;

/**
 * @author Kunal
 *
 */
public class GoalwiseProductMap {

	private Integer goalId;
	
	private List<ClientActionPlan> clientActionPlanList;

	public Integer getGoalId() {
		return goalId;
	}

	public void setGoalId(Integer goalId) {
		this.goalId = goalId;
	}

	public List<ClientActionPlan> getClientActionPlanList() {
		return clientActionPlanList;
	}

	public void setClientActionPlanList(List<ClientActionPlan> clientActionPlanList) {
		this.clientActionPlanList = clientActionPlanList;
	}
	
}
