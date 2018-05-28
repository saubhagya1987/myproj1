package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonProperty;

public class ProductData {
	
	@JsonProperty
	private Double productAmount;
	@JsonProperty
	private String productName;
	@JsonProperty
	private Integer fpAdviseId;
	@JsonProperty
	private Integer productId;
	@JsonProperty
	private Integer categoryId;
	@JsonProperty
	private Integer clientApproval;
	@JsonProperty
	private Integer apporvalFlag;
	@JsonProperty
	private String minLumpSumAmount;
	@JsonProperty
	private String minSipAmount;
	
	public String getMinLumpSumAmount() {
		return minLumpSumAmount;
	}
	public void setMinLumpSumAmount(String minLumpSumAmount) {
		this.minLumpSumAmount = minLumpSumAmount;
	}
	public String getMinSipAmount() {
		return minSipAmount;
	}
	public void setMinSipAmount(String minSipAmount) {
		this.minSipAmount = minSipAmount;
	}
	
	public Integer getApporvalFlag() {
		return apporvalFlag;
	}
	public void setApporvalFlag(Integer apporvalFlag) {
		this.apporvalFlag = apporvalFlag;
	}
	public Double getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(Double productAmount) {
		this.productAmount = productAmount;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getFpAdviseId() {
		return fpAdviseId;
	}
	public void setFpAdviseId(Integer fpAdviseId) {
		this.fpAdviseId = fpAdviseId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getClientApproval() {
		return clientApproval;
	}
	public void setClientApproval(Integer clientApproval) {
		this.clientApproval = clientApproval;
	}
}
