/**
 * 
 */
package in.fiinfra.common.diy.models;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Kunal
 *
 */
public class RiskPlanningMap {

	private String existingCover;
	
	private String requiredCover;
	
	private String moneyFormatted;
	
	private Double decimalNumber;
	
	private List<ClientActionPlan> clientActionPlanList;
	
	public String getMoneyFormatted() {
		return moneyFormatted;
	}

	public void setMoneyFormatted(String moneyFormatted) {
		this.moneyFormatted = moneyFormatted;
	}

	public Double getDecimalNumber() {
		return decimalNumber;
	}

	public void setDecimalNumber(Double decimalNumber) {
		this.decimalNumber = decimalNumber;
	}

	public String getExistingCover() {
		return existingCover;
	}

	public void setExistingCover(String existingCover) {
		this.existingCover = existingCover;
	}

	public String getRequiredCover() {
		return requiredCover;
	}

	public void setRequiredCover(String requiredCover) {
		this.requiredCover = requiredCover;
	}

	public List<ClientActionPlan> getClientActionPlanList() {
		return clientActionPlanList;
	}

	public void setClientActionPlanList(List<ClientActionPlan> clientActionPlanList) {
		this.clientActionPlanList = clientActionPlanList;
	}
}
