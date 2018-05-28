package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonProperty;

public class AssetPlanJson {
	
	@JsonProperty
	private String name;
	@JsonProperty
	private Integer allocationPercent;
	@JsonProperty
	private String productName;
	@JsonProperty
	private Integer amount;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAllocationPercent() {
		return allocationPercent;
	}
	public void setAllocationPercent(Integer allocationPercent) {
		this.allocationPercent = allocationPercent;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
}
