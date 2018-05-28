package in.fiinfra.pg;

import java.util.Date;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

public class OrderDetailData {
	
	@JsonProperty
	private Integer orderDetailID;
	@JsonProperty
	private Integer orderID;
	@JsonProperty
	private Integer productID;
	@JsonProperty
	private Integer productQty;
	@JsonProperty
	private String productName;
	@JsonProperty
	private long productPrice;
	@JsonProperty
	private long originalProductPrice;
	@JsonProperty
	private String ProductDescription;
	@JsonProperty
	private Integer createdBy;
	@JsonProperty
	private Date createdDate;
	@JsonProperty
	private Integer lastModifiedBy;
	@JsonProperty
	private Date lastModifiedDate;
	public Integer getOrderDetailID() {
		return orderDetailID;
	}
	public void setOrderDetailID(Integer orderDetailID) {
		this.orderDetailID = orderDetailID;
	}
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Integer getProductID() {
		return productID;
	}
	public void setProductID(Integer productID) {
		this.productID = productID;
	}
	public Integer getProductQty() {
		return productQty;
	}
	public void setProductQty(Integer productQty) {
		this.productQty = productQty;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public long getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(long productPrice) {
		this.productPrice = productPrice;
	}
	public long getOriginalProductPrice() {
		return originalProductPrice;
	}
	public void setOriginalProductPrice(long originalProductPrice) {
		this.originalProductPrice = originalProductPrice;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Integer getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(Integer lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public Date getLastModifiedDate() {
		
		return lastModifiedDate;
	}
	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	public String getProductDescription() {
		return ProductDescription;
	}
	public void setProductDescription(String productDescription) {
		ProductDescription = productDescription;
	}
	
	
}
