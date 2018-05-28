package in.fiinfra.pg;

import java.util.Date;



import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;
import org.springframework.web.multipart.MultipartFile;

public class AutoPaymentData {
	@JsonProperty
	private Date dueDate;
	@JsonProperty
	private String partnerName;
	@JsonProperty
	private Integer partyId;
	@JsonProperty
	private String umrn;
	@JsonProperty
	private Integer paymentAmount;
	@JsonProperty
	private Date orderDate;
	@JsonProperty
	private Integer orderNo;
	@JsonProperty
	private Integer frequencyId;
	@JsonProperty
	private String frequency;
	@JsonProperty
	private String productName;
	@JsonProperty
	private Integer productId;
	@JsonProperty
	private String ifsc;
	@JsonProperty
	private String micr;
	@JsonProperty
	private String remark;
	@JsonProperty
	private String accountNumber;
	@JsonProperty
	private String investorName;
	public String getInvestorName() {
		return investorName;
	}
	public void setInvestorName(String investorName) {
		this.investorName = investorName;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	public String getUmrn() {
		return umrn;
	}
	public void setUmrn(String umrn) {
		this.umrn = umrn;
	}
	public Integer getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(Integer paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	public Integer getFrequencyId() {
		return frequencyId;
	}
	public void setFrequencyId(Integer frequencyId) {
		this.frequencyId = frequencyId;
	}
	public String getFrequency() {
		return frequency;
	}
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getIfsc() {
		return ifsc;
	}
	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}
	public String getMicr() {
		return micr;
	}
	public void setMicr(String micr) {
		this.micr = micr;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
}
