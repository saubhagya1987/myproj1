package in.fiinfra.pg;

import java.util.Date;



import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;
import org.springframework.web.multipart.MultipartFile;

public class NachData {

	@JsonProperty
	private Integer nachId;
	@JsonProperty
	private Integer nachFormId;
	@JsonProperty
	private Integer documentId;
	@JsonProperty
	private Integer accountId;
	@JsonProperty
	private Integer statusId;
	@JsonProperty
	private String productName;
	@JsonProperty
	private Integer partyID;
	@JsonProperty
	private Date endDate;
	@JsonProperty
	private String email;
	@JsonProperty
	private String mobile;
	@JsonProperty
	private String phoneNo;

	@JsonProperty
	private Date startDate;
	@JsonProperty
	private String status;
	@JsonProperty
	private String remark;
	@JsonProperty
	private String errorDetail;

	@JsonProperty
	private String umrn;
	@JsonProperty
	private String accountNumber;
	@JsonProperty
	private String accountType;
	@JsonProperty
	private Date registrationDate;
	@JsonProperty
	private String bankName;
	@JsonProperty
	private String branch;
	@JsonProperty
	private String partyName;
	@JsonProperty
	private String ifsc;
	@JsonProperty
	private String micr;
	@JsonProperty
	private Double limitAmount;
	@JsonProperty
	private Integer frequencyId;
	@JsonProperty
	private String referece1;
	@JsonProperty
	private String refernce2;
	@JsonProperty
	private Integer userId;
	@JsonProperty
	private String frequency;
	@JsonProperty
	private String nachStatusCode;
	
	@JsonIgnore
	MultipartFile nachForm;
	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public Integer getPartyID() {
		return partyID;
	}

	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
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

	public Double getLimitAmount() {
		return limitAmount;
	}

	public void setLimitAmount(Double limitAmount) {
		this.limitAmount = limitAmount;
	}

	public Integer getFrequencyId() {
		return frequencyId;
	}

	public void setFrequencyId(Integer frequencyId) {
		this.frequencyId = frequencyId;
	}

	public String getReferece1() {
		return referece1;
	}

	public void setReferece1(String referece1) {
		this.referece1 = referece1;
	}

	public String getRefernce2() {
		return refernce2;
	}

	public void setRefernce2(String refernce2) {
		this.refernce2 = refernce2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public Integer getNachId() {
		return nachId;
	}

	public void setNachId(Integer nachId) {
		this.nachId = nachId;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getErrorDetail() {
		return errorDetail;
	}

	public void setErrorDetail(String errorDetail) {
		this.errorDetail = errorDetail;
	}

	public String getUmrn() {
		return umrn;
	}

	public void setUmrn(String umrn) {
		this.umrn = umrn;
	}
	public Integer getDocumentId() {
		return documentId;
	}

	public void setDocumentId(Integer documentId) {
		this.documentId = documentId;
	}

	public MultipartFile getNachForm() {
		return nachForm;
	}

	public void setNachForm(MultipartFile nachForm) {
		this.nachForm = nachForm;
	}

	public Integer getNachFormId() {
		return nachFormId;
	}

	public void setNachFormId(Integer nachFormId) {
		this.nachFormId = nachFormId;
	}

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}

	public String getNachStatusCode() {
		return nachStatusCode;
	}

	public void setNachStatusCode(String nachStatusCode) {
		this.nachStatusCode = nachStatusCode;
	}

}
