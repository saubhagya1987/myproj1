package in.fiinfra.pg;

import java.util.Date;


import java.util.List;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

public class OrderData {
	@JsonProperty
	private String partyName;
	@JsonProperty
	private String buName;
	@JsonProperty
	private Date subscriptionStartDate;
	@JsonProperty
	private Date subscriptionExpiryDate;
	@JsonProperty
	private String productCategory;
	
	@JsonProperty
	private List<OrderDetailData> orderDetails;
	private String bankCode;
	@JsonProperty
	private Integer orderID;
	@JsonProperty
	private Integer partyID;
	
	@JsonProperty
	private String orderNO;
	
	@JsonProperty
	private Date orderDttm;
	
	@JsonProperty
	private String orderDateString;
	
	@JsonProperty
	private long orderAmount;
	
	@JsonProperty
	private Integer orderStatusID;
	@JsonProperty
	private String orderStatus;
	
	@JsonProperty
	private Date createdDate;
	@JsonProperty
	private Integer lastModifiedBy;
	@JsonProperty
	private Date lastModifiedDate;
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Integer getPartyID() {
		return partyID;
	}
	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}
	public String getOrderNO() {
		return orderNO;
	}
	public void setOrderNO(String orderNO) {
		this.orderNO = orderNO;
	}
	public Date getOrderDttm() {
		return orderDttm;
	}
	public void setOrderDttm(Date orderDttm) {
		this.orderDttm = orderDttm;
	}
	public long getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(long orderAmount) {
		this.orderAmount = orderAmount;
	}
	public Integer getOrderStatusID() {
		return orderStatusID;
	}
	public void setOrderStatusID(Integer orderStatusID) {
		this.orderStatusID = orderStatusID;
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
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderDateString() {
		return orderDateString;
	}
	public void setOrderDateString(String orderDateString) {
		this.orderDateString = orderDateString;
	}
	public String getPartyName() {
		return partyName;
	}
	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}
	public String getBuName() {
		return buName;
	}
	public void setBuName(String buName) {
		this.buName = buName;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public List<OrderDetailData> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(List<OrderDetailData> orderDetails) {
		this.orderDetails = orderDetails;
	}
	public Date getSubscriptionStartDate() {
		return subscriptionStartDate;
	}
	public void setSubscriptionStartDate(Date subscriptionStartDate) {
		this.subscriptionStartDate = subscriptionStartDate;
	}
	public Date getSubscriptionExpiryDate() {
		return subscriptionExpiryDate;
	}
	public void setSubscriptionExpiryDate(Date subscriptionExpiryDate) {
		this.subscriptionExpiryDate = subscriptionExpiryDate;
	}
	
	
}
