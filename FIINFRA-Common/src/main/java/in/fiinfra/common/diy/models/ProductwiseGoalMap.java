/**
 * 
 */
package in.fiinfra.common.diy.models;

import java.util.List;

/**
 * @author Kunal 
 *
 */
public class ProductwiseGoalMap {

	private Integer productId;
	
	private String productName;
	
	private String totalLumpSumAmt;

	private String totalSipAmt;
	
	private List<ClientActionPlan> clientActionPlanList;
	
	private String purchaseUrl;

	public String getPurchaseUrl() {
		return purchaseUrl;
	}

	public void setPurchaseUrl(String purchaseUrl) {
		this.purchaseUrl = purchaseUrl;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getTotalLumpSumAmt() {
		return totalLumpSumAmt;
	}

	public void setTotalLumpSumAmt(String totalLumpSumAmt) {
		this.totalLumpSumAmt = totalLumpSumAmt;
	}

	public String getTotalSipAmt() {
		return totalSipAmt;
	}

	public void setTotalSipAmt(String totalSipAmt) {
		this.totalSipAmt = totalSipAmt;
	}

	public List<ClientActionPlan> getClientActionPlanList() {
		return clientActionPlanList;
	}

	public void setClientActionPlanList(List<ClientActionPlan> clientActionPlanList) {
		this.clientActionPlanList = clientActionPlanList;
	}
	
	
}
