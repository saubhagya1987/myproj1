package in.fiinfra.pg;

import in.fiinfra.common.diy.models.ProductData;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

public class PaymentData {

	@JsonProperty
	private Integer partyID;
	@JsonProperty
	private Integer buId;

	@JsonProperty
	private Integer paymentID;
	@JsonProperty
	private Integer orderID;
	@JsonProperty
	private Integer paymentStatusId;
	@JsonProperty
	private String paymentStatus;
	@JsonProperty
	private String productName;

	@JsonProperty
	private Integer productID;

	@JsonProperty
	private String partyName;

	@JsonProperty
	private long paymentAmount;
	@JsonProperty
	private Integer paymentMethodID;
	@JsonProperty
	private String paymentMethod;
	@JsonProperty
	private Date pGRequestDttm;
	@JsonProperty
	private String pGRequestDttmString;
	@JsonProperty
	private Date pGRespnseDttm;
	@JsonProperty
	private String pGTxnRefNo;
	@JsonProperty
	private long pGPaidAmount;
	@JsonProperty
	private Integer pGStatusID;
	@JsonProperty
	private String pGStatus;
	@JsonProperty
	private String pGErrorCode;

	@JsonProperty
	private String pGErrorDescription;

	@JsonProperty
	private String pGRequestMessage;

	@JsonProperty
	private String pGResponseMessage;

	@JsonProperty
	private String paymentNote;

	@JsonProperty
	private Date createdDate;
	@JsonProperty
	private Integer userId;
	@JsonProperty
	private Date lastModifiedDate;

	@JsonProperty
	private List<ProductData> productData;
	@JsonProperty
	private String orderNo;

	@JsonProperty
	private String trxReference;

	@JsonProperty
	private String action;

	@JsonProperty
	private Date startDate;

	@JsonProperty
	private Date endDate;

	@JsonProperty
	private Date paymentDate;

	@JsonProperty
	private int planCount;

	public String getTrxReference() {
		return trxReference;
	}

	public void setTrxReference(String trxReference) {
		this.trxReference = trxReference;
	}

	public Integer getPaymentID() {
		return paymentID;
	}

	public void setPaymentID(Integer paymentID) {
		this.paymentID = paymentID;
	}

	public Integer getOrderID() {
		return orderID;
	}

	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}

	public long getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(long paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public Integer getPaymentMethodID() {
		return paymentMethodID;
	}

	public void setPaymentMethodID(Integer paymentMethodID) {
		this.paymentMethodID = paymentMethodID;
	}

	public Date getpGRequestDttm() {
		return pGRequestDttm;
	}

	public void setpGRequestDttm(Date pGRequestDttm) {
		this.pGRequestDttm = pGRequestDttm;
	}

	public Date getpGRespnseDttm() {
		return pGRespnseDttm;
	}

	public void setpGRespnseDttm(Date pGRespnseDttm) {
		this.pGRespnseDttm = pGRespnseDttm;
	}

	public String getpGTxnRefNo() {
		return pGTxnRefNo;
	}

	public void setpGTxnRefNo(String pGTxnRefNo) {
		this.pGTxnRefNo = pGTxnRefNo;
	}

	public long getpGPaidAmount() {
		return pGPaidAmount;
	}

	public void setpGPaidAmount(long pGPaidAmount) {
		this.pGPaidAmount = pGPaidAmount;
	}

	public Integer getpGStatusID() {
		return pGStatusID;
	}

	public void setpGStatusID(Integer pGStatusID) {
		this.pGStatusID = pGStatusID;
	}

	public String getpGErrorCode() {
		return pGErrorCode;
	}

	public void setpGErrorCode(String pGErrorCode) {
		this.pGErrorCode = pGErrorCode;
	}

	public String getpGErrorDescription() {
		return pGErrorDescription;
	}

	public void setpGErrorDescription(String pGErrorDescription) {
		this.pGErrorDescription = pGErrorDescription;
	}

	public String getpGRequestMessage() {
		return pGRequestMessage;
	}

	public void setpGRequestMessage(String pGRequestMessage) {
		this.pGRequestMessage = pGRequestMessage;
	}

	public String getpGResponseMessage() {
		return pGResponseMessage;
	}

	public void setpGResponseMessage(String pGResponseMessage) {
		this.pGResponseMessage = pGResponseMessage;
	}

	public String getPaymentNote() {
		return paymentNote;
	}

	public void setPaymentNote(String paymentNote) {
		this.paymentNote = paymentNote;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getpGStatus() {
		return pGStatus;
	}

	public void setpGStatus(String pGStatus) {
		this.pGStatus = pGStatus;
	}

	public List<ProductData> getProductData() {
		return productData;
	}

	public void setProductData(List<ProductData> productData) {
		this.productData = productData;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getpGRequestDttmString() {
		return pGRequestDttmString;
	}

	public void setpGRequestDttmString(String pGRequestDttmString) {
		this.pGRequestDttmString = pGRequestDttmString;
	}

	public Integer getPartyID() {
		return partyID;
	}

	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}

	public Integer getPaymentStatusId() {
		return paymentStatusId;
	}

	public void setPaymentStatusId(Integer paymentStatusId) {
		this.paymentStatusId = paymentStatusId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public Integer getBuId() {
		return buId;
	}

	public void setBuId(Integer buId) {
		this.buId = buId;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date[] calculateStartEndDate(Date lastExpiryDate, int noOfMonths) {

		Calendar cal = Calendar.getInstance();
		cal.setTime(lastExpiryDate);
		cal.add(Calendar.DAY_OF_MONTH, 1);

		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(lastExpiryDate);
		cal1.add(Calendar.MONTH, noOfMonths);
		cal1.set(Calendar.DAY_OF_MONTH,
				cal1.getActualMaximum(Calendar.DAY_OF_MONTH));

		return new Date[] { cal.getTime(), cal1.getTime() };

	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getPlanCount() {
		return planCount;
	}

	public void setPlanCount(int planCount) {
		this.planCount = planCount;
	}

	// public static void main(String[] args){
	// PaymentData p = new PaymentData();
	// Calendar cal = Calendar.getInstance();
	// //cal.set(Calendar.DAY_OF_MONTH,
	// cal.getActualMaximum(Calendar.DAY_OF_MONTH));
	//
	// Date[] dates = p.calculateStartEndDate(cal.getTime(), 1);
	// System.out.println(dates[0]);
	// System.out.println(dates[1]);
	//
	// }

}
